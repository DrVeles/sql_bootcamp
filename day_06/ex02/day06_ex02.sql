SELECT person.name AS name, pizza_name, price,
       price - price * person_discounts.discount / 100 AS discount_price,
       pizzeria.name AS pizzeria_name
FROM person_order
JOIN menu ON person_order.menu_id = menu.id
JOIN person ON person.id = person_order.person_id
JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
JOIN person_discounts ON person.id = person_discounts.person_id and pizzeria.id = person_discounts.pizzeria_id
ORDER BY name, pizza_name;