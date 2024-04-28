SELECT pizza_name
FROM menu AS clear_menu
WHERE pizza_name NOT IN (
    SELECT pizza_name
    FROM menu
    WHERE  menu.id < clear_menu.id
    )
ORDER BY pizza_name DESC ;