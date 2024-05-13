SELECT pizzeria.name AS name, count(*) AS count_of_orders,
       round(sum(price) / count(*), 2), max(price) AS max_price, min(price) AS min_price
FROM person_order
JOIN menu ON person_order.menu_id = menu.id
JOIN pizzeria ON pizzeria_id = pizzeria.id
GROUP BY name
ORDER BY name;
