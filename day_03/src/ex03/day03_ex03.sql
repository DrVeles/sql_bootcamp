WITH gender_visits AS (
    SELECT pizzeria.name AS pizzeria_name,
           SUM(CASE WHEN person.gender = 'female' THEN 1 ELSE 0 END) AS female_visits,
           SUM(CASE WHEN person.gender = 'male' THEN 1 ELSE 0 END) AS male_visits
    FROM pizzeria
    LEFT JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
    LEFT JOIN person ON person_visits.person_id = person.id
    GROUP BY pizzeria.name
)
SELECT pizzeria_name
FROM gender_visits
WHERE female_visits > male_visits
UNION ALL
SELECT pizzeria_name
FROM gender_visits
WHERE male_visits > female_visits
ORDER BY pizzeria_name;