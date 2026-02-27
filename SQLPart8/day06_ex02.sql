SELECT
    person.name AS name,
    menu.pizza_name AS pizze_name,
    menu.price AS price,
    ROUND(price - price * person_discounts.discount/100) AS discount_price,
    pizzeria.name AS pizzeria_name
FROM person_order
INNER JOIN person ON person.id = person_order.person_id
INNER JOIN menu ON menu.id = person_order.menu_id
INNER JOIN 
    person_discounts ON person_discounts.person_id = person.id 
    AND person_discounts.pizzeria_id = menu.pizzeria_id
INNER JOIN pizzeria ON pizzeria.id = person_discounts.pizzeria_id
ORDER BY
    name,
    pizze_name