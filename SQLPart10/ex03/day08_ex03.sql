--Sesion 1 
BEGIN; -- начало изменений ветка 1
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ; -- установка уровня изоляции потоков

--Sesion 2
BEGIN; -- начало изменений ветка 2
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ; -- установка уровня изоляции потоков

--Sesion 1
SELECT 
    name,
    rating 
FROM pizzeria
WHERE name = 'Pizza Hut';

--Sesion 2
UPDATE pizzeria 
SET rating = 3.6 
WHERE name = 'Pizza Hut'; 

--Sesion 2
COMMIT;

--Sesion 1
SELECT 
    name,
    rating 
FROM pizzeria
WHERE name = 'Pizza Hut';

--Sesion 1
COMMIT;



--Sesion 1
SELECT 
    name,
    rating 
FROM pizzeria
WHERE name = 'Pizza Hut';

--Sesion 2
SELECT 
    name,
    rating 
FROM pizzeria
WHERE name = 'Pizza Hut';

-- вывод: обновление данных в первом потоке происходит только после обновления загруженых с БЗ после команды <COMMIT>