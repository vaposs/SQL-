SELECT
    menu.pizza_name AS pizza_name,
    pizzeria1.name AS pizzeria_name_1,
    pizzeria2.name AS pizzeria_name_2,
    menu.price
FROM menu
INNER JOIN menu menu2 ON menu.price = menu2.price
INNER JOIN pizzeria pizzeria1 ON menu.pizzeria_id = pizzeria1.id
INNER JOIN pizzeria pizzeria2 ON menu2.pizzeria_id = pizzeria2.id
WHERE 
    menu.id > menu2.id
    AND menu.pizza_name = menu2.pizza_name
ORDER BY 
    pizza_name