SELECT pizzeria.name AS pizzeria_name
FROM pizzeria
JOIN menu ON pizzeria.id = menu.pizzeria_id
JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
WHERE visit_date = '2022-01-08' and menu.price < 800;
