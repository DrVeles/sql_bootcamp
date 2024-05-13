SELECT  pizza_name, price, pizzeria.name AS pizzeria_name
FROM person_order
RIGHT JOIN menu m ON person_order.menu_id = m.id
JOIN pizzeria ON m.pizzeria_id = pizzeria.id
WHERE person_order.id IS NULL
ORDER BY pizza_name, price;