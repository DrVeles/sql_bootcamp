CREATE VIEW v_generated_dates AS
SELECT generated_date::date FROM GENERATE_SERIES('2022-01-01', '2022-01-31', interval '1 day') AS generated_date;

-- SELECT * from v_generated_dates;

-- DROP VIEW v_generated_dates;
