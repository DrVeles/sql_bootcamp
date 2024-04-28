WITH all_dates AS (
    SELECT generate_series('2022-01-01'::date, '2022-01-10'::date, '1 day')::date AS n
)
SELECT all_dates.n AS missing_date
FROM all_dates
LEFT JOIN (
    SELECT DISTINCT visit_date
    FROM person_visits
    WHERE person_id = 1 OR person_id = 2
) AS visits ON all_dates.n = visits.visit_date
WHERE visits.visit_date IS NULL
ORDER BY all_dates.n;
