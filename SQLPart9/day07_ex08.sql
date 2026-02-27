SELECT 
    person.address AS address,
    pizzeria.name AS name,
    COUNT(*) AS count_of_orders
FROM person
INNER JOIN person_order ON person_order.person_id = person.id
INNER JOIN menu ON menu.id = person_order.menu_id
INNER JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
GROUP BY 
    person.address, 
    pizzeria.name
ORDER BY 
    person.address, 
    pizzeria.name;