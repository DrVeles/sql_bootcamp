CREATE VIEW v_price_with_discount AS
    SELECT person.name AS name, pizza_name, price, round(m.price - m.price * 0.1) AS discount_price
    FROM person
    JOIN person_order ON person.id = person_order.person_id
    JOIN menu m ON person_order.menu_id = m.id
    ORDER BY name, pizza_name;

-- SELECT *
-- FROM v_price_with_discount
-- ORDER BY name, pizza_name;