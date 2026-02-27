--Sesion 1
BEGIN;                               
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

--Sesion 2
BEGIN;                               
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

--Sesion 1
SELECT 
    name,
    rating 
FROM pizzeria
WHERE name = 'Pizza Hut';

--Sesion 2
UPDATE pizzeria 
SET rating = 3.0
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