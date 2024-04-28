SELECT name
FROM person
JOIN person_order ON person.id = person_order.person_id
JOIN menu ON person_order.menu_id = menu.id
WHERE person.gender = 'female'
    AND pizza_name = 'pepperoni pizza' OR pizza_name = 'cheese pizza'
GROUP BY name
HAVING COUNT(name) = 2
ORDER BY name;