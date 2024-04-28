SELECT m.id AS menu_id
FROM person_order
RIGHT JOIN menu m ON person_order.menu_id = m.id
WHERE person_order.id IS NULL
ORDER BY menu_id;