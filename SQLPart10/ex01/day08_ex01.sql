--Sesion 1 
BEGIN; -- начало изменений ветка 1
SET TRANSACTION ISOLATION LEVEL READ COMMITTED; -- установка уровня изоляции потоков

--Sesion 2
BEGIN; -- начало изменений ветка 2
SET TRANSACTION ISOLATION LEVEL READ COMMITTED; -- установка уровня изоляции потоков

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

--Sesion 1
UPDATE pizzeria 
SET rating = 4 
WHERE name = 'Pizza Hut';

--Sesion 2
UPDATE pizzeria 
SET rating = 3.6 
WHERE name = 'Pizza Hut'; 

--Sesion 1
COMMIT;

--Sesion 2
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


-- вывод:при уровне изоляции READ COMMITTED - изменения вступает в силу только последнее принятое обновление! тоесть, поток 1 блокирует изменения 2, но после ввода комманды <COMMIT> в первой ветке, выполняется обносление во второй и фиксация результата.