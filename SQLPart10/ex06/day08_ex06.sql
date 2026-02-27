--Sesion 1
BEGIN;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;

--Sesion 2
BEGIN;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;

--Sesion 1
SELECT 
    COUNT(*) as count,
    SUM(rating) as total_sum,
    ROUND(AVG(rating), 4) as avg_rating,
    MAX(rating) as max_rating,
    MIN(rating) as min_rating
FROM pizzeria; 

--Sesion 2
INSERT INTO pizzeria (id, name, rating) VALUES (11, 'Kazan Pizza 2', 4.0);

--Sesion 2
COMMIT;

--Sesion 1
SELECT 
    COUNT(*) as count,
    SUM(rating) as total_sum,
    ROUND(AVG(rating), 4) as avg_rating,
    MAX(rating) as max_rating,
    MIN(rating) as min_rating
FROM pizzeria; 

--Sesion 1
COMMIT;

--Sesion 1
SELECT 
    COUNT(*) as count,
    SUM(rating) as total_sum,
    ROUND(AVG(rating), 4) as avg_rating,
    MAX(rating) as max_rating,
    MIN(rating) as min_rating
FROM pizzeria; 

--Sesion 2
SELECT 
    COUNT(*) as count,
    SUM(rating) as total_sum,
    ROUND(AVG(rating), 4) as avg_rating,
    MAX(rating) as max_rating,
    MIN(rating) as min_rating
FROM pizzeria; 