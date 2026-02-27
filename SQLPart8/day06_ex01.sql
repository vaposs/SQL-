INSERT INTO person_discounts
    (
        id,
        person_id,
        pizzeria_id,
        discount
    )
SELECT
    ROW_NUMBER() OVER () AS id,
    person_id,
    pizzeria_id,
    CASE
    WHEN count = 1 THEN 10.5
    WHEN count = 2 THEN 22
    ELSE 30
    END AS discont
FROM 
    (
        SELECT 
            person_id,
            pizzeria_id,
            COUNT(*) AS count
        FROM person_order
        JOIN menu ON person_order.menu_id = menu.id
        GROUP BY 
            person_id,
            pizzeria_id
    ) AS order_count;


    SELECT 
        person_discounts.id,
        person.name,
        pizzeria.name,
        person_discounts.discount
    FROM person_discounts
    INNER JOIN person ON person.id = person_discounts.person_id
    INNER JOIN pizzeria ON pizzeria.id = person_discounts.pizzeria_id

