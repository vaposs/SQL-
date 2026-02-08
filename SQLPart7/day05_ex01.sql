BEGIN;
SET LOCAL enable_seqscan = OFF; -- выключили последовательное сканирование


EXPLAIN ANALYZE

SELECT
    pizza_name,
    pizzeria.name AS pizzeria_name
FROM menu
INNER JOIN pizzeria ON pizzeria.id = menu.pizzeria_id;

COMMIT;
RESET enable_seqscan;

-- индекс тут не целеособразен по основным 3м причинам
-- слишком мало строк
-- нет условия фильтрации
-- возвращаются все строки запроса