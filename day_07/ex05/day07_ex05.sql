SELECT DISTINCT name
FROM person_order
JOIN person ON person_order.person_id = person.id
ORDER BY name;
