SELECT name
FROM v_person_male
UNION
SELECT name
FROM v_person_female
ORDER BY name;