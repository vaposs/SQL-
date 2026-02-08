CREATE VIEW v_generated_dates AS 
SELECT d::date AS generated_date
FROM GENERATE_SERIES
    ( 
        '2022-01-01'::date,
        '2022-01-31'::date,
        '1 day'::interval
    ) AS gs(d);


SELECT * 
FROM v_generated_dates
ORDER BY 1

