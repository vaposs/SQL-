SELECT g::date AS missing_date
FROM 
    (SELECT * FROM person_visits po WHERE person_id = 1 OR person_id = 2) AS po
RIGHT JOIN generate_series ('2022-01-01', '2022-01-10', INTERVAL '1 day') AS g ON po.visit_date = g:: date
WHERE po.id IS NULL
ORDER BY 1;