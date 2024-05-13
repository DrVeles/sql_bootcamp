WITH gender_visits AS (
    SELECT pizzeria.name AS pizzeria_name,
           SUM(CASE WHEN person.gender = 'female' THEN 1 ELSE 0 END) AS female_visits,
           SUM(CASE WHEN person.gender = 'male' THEN 1 ELSE 0 END) AS male_visits
    FROM pizzeria
    JOIN menu ON menu.pizzeria_id = pizzeria.id
    LEFT JOIN person_order ON menu.id = person_order.menu_id
    LEFT JOIN person ON person_order.person_id = person.id
    GROUP BY pizzeria.name
)
SELECT pizzeria_name
FROM gender_visits
WHERE female_visits > male_visits AND male_visits = 0
UNION ALL
SELECT pizzeria_name
FROM gender_visits
WHERE male_visits > female_visits AND female_visits = 0
ORDER BY pizzeria_name;