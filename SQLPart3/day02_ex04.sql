SELECT 
    pizza_name,
    name AS pizzeria_name,
    price
FROM menu
INNER JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
WHERE pizza_name IN ('pepperoni pizza', 'mushroom pizza')
ORDER BY
        pizza_name,
        pizzeria_name
