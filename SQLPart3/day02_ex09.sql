SELECT  name
FROM person
INNER JOIN person_order ON person.id = person_order.person_id
INNER JOIN menu ON person_order.menu_id = menu.id
WHERE
    pizza_name = 'cheese pizza'
    AND gender = 'female'
    INTERSECT
        SELECT person.name
        FROM person
        INNER JOIN  person_order ON person.id = person_order.person_id
        INNER JOIN menu ON menu.id = person_order.menu_id
        WHERE 
            menu.pizza_name = 'pepperoni pizza'
            AND person.gender = 'female'
    
