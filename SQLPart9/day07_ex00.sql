SELECT
    person_id,
    COUNT (*) AS count_of_visits -- подсчет количества строчек с данным признаком
FROM person_visits
GROUP BY person_id -- групировка значений по признаку
ORDER BY
    count_of_visits DESC,
    person_id ASC;