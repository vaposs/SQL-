WITH dates_generator AS (
    SELECT generate_series('2022-01-01'::date, '2022-01-10'::date, '1 day'::interval)::date AS missing_date
)
SELECT missing_date
FROM dates_generator
LEFT JOIN (
    SELECT DISTINCT visit_date
    FROM person_visits
    WHERE person_id = 1 OR person_id = 2
) AS visits ON dates_generator.missing_date = visits.visit_date
WHERE visits.visit_date IS NULL
ORDER BY missing_date