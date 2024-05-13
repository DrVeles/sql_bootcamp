SELECT order_date AS order_date,((SELECT name FROM person WHERE person_id = person.id) || ' (age:' || (SELECT age FROM person WHERE person_id = person.id )) || ')' AS person_information
FROM person_order
JOIN person ON person_order.person_id = person.id
ORDER BY order_date, person_information;