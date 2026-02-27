SELECT
    person.name,
    COUNT (*) AS count_of_visits -- подсчет количества строчек с данным признаком
FROM person_visits
INNER JOIN person ON person.id = person_visits.person_id
GROUP BY person.name -- групировка значений по признаку
ORDER BY
    count_of_visits DESC,
    person.name ASC
LIMIT 4