-- Выполнить после первой проверки!
--DELETE FROM pizzeria WHERE id = 10;
--DELETE FROM pizzeria WHERE id = 11;

/*
SELECT *
FROM pizzeria
ORDER BY id;
*/


--Sesion 1 
BEGIN;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

--Sesion 2
BEGIN;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

--Sesion 1 
UPDATE pizzeria 
SET rating = 1 
WHERE id = 10;

--Sesion 2
UPDATE pizzeria 
SET rating = 1 
WHERE id = 11;

--Sesion 1
UPDATE pizzeria 
SET rating = 1 
WHERE id = 11;

--Sesion 2
UPDATE pizzeria 
SET rating = 1 
WHERE id = 10;

--Sesion 1
COMMIT;

--Sesion 2
COMMIT;

 -- вывод: попали в созависимую блокировку и при длительном ожидании один запрос отменился (рандомный)


