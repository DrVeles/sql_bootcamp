SELECT object_name
    FROM (
        SELECT name AS object_name, 1 AS order_by
        FROM person
        UNION ALL
        SELECT pizza_name AS object_name, 2 AS order_by
        FROM menu
        ) AS test
ORDER BY order_by, object_name;
