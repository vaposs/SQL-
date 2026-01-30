SELECT name, rating
FROM pizzeria
LEFT JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
WHERE person_visits IS NULL

/*
-- появнение - LEFT JOIN - совмещаем 2 таблици  - в pizzeria добавляем person_visits и с помощью команды ON pizzeria.id = person_visits.pizzeria_id связываем по id признаку
-- Проверка - выведем всю информацию
SELECT *
FROM pizzeria
LEFT JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
*/