--Sesion 1
BEGIN;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED; 

--Sesion 2
BEGIN;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED; 

--Sesion 1
SELECT sum(rating) FROM pizzeria;

--Sesion 2
INSERT INTO pizzeria (id, name, rating) VALUES (10, 'Kazan Pizza', 5.0);

--Sesion 2
COMMIT;

--Sesion 1
SELECT sum(rating) FROM pizzeria;

--Sesion 1
COMMIT;

--Sesion 1
SELECT sum(rating) FROM pizzeria;

--Sesion 2
SELECT sum(rating) FROM pizzeria;