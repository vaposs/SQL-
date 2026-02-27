SELECT
    value_first.name AS name,
    (value_first.count + value_second.count) AS total_count
FROM 
    (
        SELECT 
            pizzeria.name,
            COUNT(*) AS count
        FROM person_visits
        INNER JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
        GROUP BY pizzeria.name
    ) AS value_first
    FULL JOIN
    (
        SELECT 
            pizzeria.name,
            COUNT(*) AS count
        FROM person_order
        INNER JOIN menu ON menu.id = person_order.menu_id
        INNER JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
        GROUP BY pizzeria.name
    ) AS value_second ON value_first.name = value_second.name

    ORDER BY
        total_count DESC,
        name ASC