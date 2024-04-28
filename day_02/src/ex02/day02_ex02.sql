SELECT
    COALESCE(p.name, '-') AS person_name,
    COALESCE(v.visit_date::TEXT, 'null') AS visit_date,
    COALESCE(pz.name, 'null') AS pizzeria_name
FROM
    (SELECT DISTINCT id, name FROM person) AS p
FULL OUTER JOIN
    (SELECT DISTINCT person_id, pizzeria_id, visit_date
     FROM person_visits
     WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03') AS v
    ON p.id = v.person_id
FULL OUTER JOIN
    (SELECT DISTINCT id, name FROM pizzeria) AS pz
    ON pz.id = v.pizzeria_id
ORDER BY person_name, visit_date, pizzeria_name;
