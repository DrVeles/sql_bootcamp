(SELECT pz.name AS name, count(*) AS count, 'order' AS action_type
FROM person_order po
JOIN menu m ON po.menu_id = m.id
JOIN pizzeria pz ON m.pizzeria_id = pz.id
GROUP BY name
ORDER BY count DESC
LIMIT 3)
UNION
(SELECT pz.name AS name, count(*) AS count, 'visit' AS action_type
FROM person_visits pv
JOIN pizzeria pz ON pv.pizzeria_id = pz.id
GROUP BY name
ORDER BY count DESC
LIMIT 3)
ORDER BY action_type, count DESC;
