SELECT pizza_name, pizzeria.name AS pizzeria_name
FROM pizzeria
JOIN menu ON menu.pizzeria_id = pizzeria.id
JOIN person_order on person_order.menu_id = menu.id
WHERE person_id = 1 OR person_id = 4
ORDER BY pizza_name, pizzeria_name;