/*
INSERT INTO person_visits VALUES (
    (SELECT COALESCE(MAX(id), 0) FROM person_visits) + 1,
    (SELECT id FROM person WHERE name = 'Denis'),
    (SELECT id AS pizzeria_id FROM pizzeria WHERE name = 'Dominos'),
    '2022-02-24');

INSERT INTO person_visits VALUES (
    (SELECT COALESCE(MAX(id), 0) FROM person_visits) + 1,
    (SELECT id FROM person WHERE name = 'Irina'), 
    (SELECT id AS pizzeria_id FROM pizzeria WHERE name = 'Dominos'),
    '2022-02-24');
*/
-- Удаление строк



-- проверочный код
--DELETE FROM person_visits WHERE id = 21;
--DELETE FROM person_visits WHERE id = 20;

SELECT *
FROM person_visits
INNER JOIN person ON person.id = person_visits.person_id