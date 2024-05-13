WITH all_dates AS (
    SELECT DATE '2022-01-01' + n AS visit_date
    FROM generate_series(0, 9) AS n
)
SELECT all_dates.visit_date AS missing_date
FROM all_dates
LEFT JOIN (
    SELECT DISTINCT visit_date
    FROM person_visits
    WHERE person_id = 1 OR person_id = 2) AS visits ON all_dates.visit_date = visits.visit_date
WHERE visits.visit_date IS NULL
ORDER BY all_dates.visit_date;
