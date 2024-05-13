WITH t1 AS
    (SELECT pz.name AS name, count(*) AS count, 'order' AS action_type
    FROM person_order po
    JOIN menu m ON po.menu_id = m.id
    JOIN pizzeria pz ON m.pizzeria_id = pz.id
    GROUP BY name
    ORDER BY count DESC),
    t2 AS
    (SELECT pz.name AS name, count(*) AS count, 'visit' AS action_type
    FROM person_visits pv
    JOIN pizzeria pz ON pv.pizzeria_id = pz.id
    GROUP BY name
    ORDER BY count DESC)

SELECT name, sum(count) AS total_count
FROM (SELECT * FROM t1 UNION ALL SELECT * FROM t2) AS t1_t2
GROUP BY name
ORDER BY total_count DESC, name;

