DELETE FROM person_visits
WHERE id = 20;



CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
SELECT pizzeria.name AS pizzeria_name
FROM menu
INNER JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
INNER JOIN person_visits ON person_visits.pizzeria_id = menu.pizzeria_id
INNER JOIN person ON person.id = person_visits.person_id
WHERE
    price < 800
    AND person.name = 'Dmitriy'
    AND visit_date = '2022-01-08';

SELECT *
FROM mv_dmitriy_visits_and_eats;