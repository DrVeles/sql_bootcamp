SELECT pizza_name, price, pizzeria.name AS pizzeria_name, visit_date
FROM person_visits
JOIN pizzeria ON pizzeria_id = pizzeria.id
JOIN menu ON  pizzeria.id = menu.pizzeria_id
WHERE price BETWEEN 800 AND 1000 AND person_id = 3
ORDER BY pizza_name, price, pizzeria_name;