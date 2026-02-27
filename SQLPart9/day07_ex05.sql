SELECT DISTINCT person.name AS name
FROM person_order
INNER JOIN person ON person.id = person_order.person_id
ORDER BY name