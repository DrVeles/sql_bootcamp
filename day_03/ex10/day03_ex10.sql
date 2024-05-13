INSERT INTO person_order (id, person_id, menu_id, order_date)
VALUES ((SElECT MAX(id) FROM person_order) + 1,
        (SELECT id FROM person WHERE name = 'Denis'),
        (SELECT id from menu WHERE pizza_name = 'sicilian pizza'),
        '2022-02-24');

INSERT INTO person_order (id, person_id, menu_id, order_date)
VALUES ((SElECT MAX(id) FROM person_order) + 1,
        (SELECT id FROM person WHERE name = 'Irina'),
        (SELECT id from menu WHERE pizza_name = 'sicilian pizza'),
        '2022-02-24');
