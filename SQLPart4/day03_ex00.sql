-- убедись что ты работаешь в BDATABASE testing !!!!!!!!!   команда \c <имя базы данных> для переключения

SELECT  
    menu.pizza_name AS pizza_name,
    menu.price AS price,
    pizzeria.name AS pizzeria_name,
    person_visits.visit_date AS visit_date
FROM person
INNER JOIN person_visits ON person_visits.person_id = person.id
INNER JOIN pizzeria ON pizzeria_id = person_visits.pizzeria_id
INNER JOIN menu ON menu.pizzeria_id = pizzeria.id
WHERE 
    person.name = 'Kate'
    AND menu.price BETWEEN 800 AND 1000
ORDER BY
    pizza_name,
    price,
    visit_date