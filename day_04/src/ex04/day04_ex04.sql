CREATE VIEW v_symmetric_union AS

WITH R AS (SELECT person_id FROM person_visits WHERE visit_date = '2022-01-02'),
     S AS (SELECT person_id FROM person_visits WHERE visit_date = '2022-01-06')

SELECT *
FROM (SELECT * FROM R EXCEPT SELECT * FROM S) AS R_S
UNION
(SELECT * FROM S EXCEPT SELECT * FROM R)

ORDER BY person_id;

-- DROP VIEW v_symmetric_union;

-- Exercise 04 Checks for the file day04_ex04.sql -
--     The SQL script looks like below.
--     create view v_symmetric_union as (select person_id from person_visits where visit_date = '2022/01/02' except select person_id from person_visits where visit_date = '2022/01/06') union (select person_id from person_visits where visit_date = '2022/01/06' except select person_id from person_visits where visit_date = '2022/01/02') order by 1 - The SQL script looks like below. select * from v_symmetric_union - The result is below (raw ordering should be the same like below) "2" "8"