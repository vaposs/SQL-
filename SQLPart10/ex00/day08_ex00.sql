
--Sesion 1 
BEGIN; -- начало изменений
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';

--Sesion 2
SELECT *
FROM pizzeria;

--Sesion 1
COMMIT; -- фиксация изменения для всех
ROLLBACK;

--Sesion 2
SELECT *
FROM pizzeria;

-- вывод: обновления видны другим пользователям только после фиксации командо1 <COMMIT>