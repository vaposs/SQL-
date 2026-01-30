(SELECT pizzeria.name AS pizzeria_name
FROM person_visits
    INNER JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id 
    INNER JOIN person ON person.id = person_visits.person_id
WHERE person.gender = 'female'
EXCEPT ALL  -- вычитаем из пиццерий где были женщины мужчин
SELECT pizzeria.name AS pizzeria_name
FROM person_visits
    INNER JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id 
    INNER JOIN person ON person.id = person_visits.person_id
WHERE person.gender = 'male'
)
UNION ALL -- обьединения записей первого и второго запроса
(SELECT pizzeria.name AS pizzeria_name
FROM person_visits
    INNER JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id 
    INNER JOIN person ON person.id = person_visits.person_id
WHERE person.gender = 'male'
EXCEPT ALL  -- вычитаем из пиццерий где были мужчины женщин
SELECT pizzeria.name AS pizzeria_name
FROM person_visits
    INNER JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id 
    INNER JOIN person ON person.id = person_visits.person_id
WHERE person.gender = 'female'
)
ORDER BY pizzeria_name