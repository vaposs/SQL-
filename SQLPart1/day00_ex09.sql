SELECT 
    (SELECT  name FROM person WHERE person.id = person_visits.person_id)  AS person_name ,  -- внутренний запрос в основном SELECT
    (SELECT  name FROM pizzeria WHERE pizzeria.id = person_visits.pizzeria_id ) AS pizzeria_name  -- внутренний запрос в основном SELECT
FROM (SELECT * FROM person_visits WHERE visit_date BETWEEN '2022-01-07' AND '2022-01-09') AS person_visits -- внутренний запрос в основном FROM
ORDER BY 
    person_name ASC,
    pizzeria_name DESC