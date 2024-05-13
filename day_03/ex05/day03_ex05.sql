SELECT DISTINCT pizzeria.name AS pizzeria_name
FROM pizzeria
JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
LEFT JOIN person_order ON person_order.person_id = person_visits.person_id
WHERE person_order.person_id = 1
ORDER BY pizzeria_name;