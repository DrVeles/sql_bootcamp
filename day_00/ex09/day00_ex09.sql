SELECT
    (SELECT name
     FROM person
     WHERE id = person_visits.person_id) AS person_name,
    (SELECT name
     FROM pizzeria
     WHERE id = person_visits.pizzeria_id) AS pizzeria_name
FROM person_visits
WHERE visit_date >= '2022-01-07' AND visit_date <= '2022-01-09'
ORDER BY person_name, pizzeria_name DESC;