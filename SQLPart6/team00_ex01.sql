
-- удаляем таблицу (если она была)
DROP TABLE direction;

-- создание таблици
CREATE TABLE direction
(
    point1 VARCHAR NOT NULL,
    point2 VARCHAR NOT NULL,
    cost INT NOT NULL
);

-- добавляем данные
INSERT INTO direction VALUES
('a', 'b', 10),
('a', 'c', 15),
('a', 'd', 20),
('b', 'a', 10),
('b', 'd', 25),
('b', 'c', 35),
('c', 'b', 35),
('c', 'd', 30),
('c', 'a', 15),
('d', 'a', 20),
('d', 'b', 25),
('d', 'c', 30);

--проверка создания таблици и внесения информации
WITH RECURSIVE way AS (
    SELECT 
        point1 AS path,        
        point1, 
        point2, 
        cost
    FROM direction              
    WHERE point1 = 'a'          
    
    UNION                      

    SELECT CONCAT(way.path, ',', direction.point1) AS path,         
        direction.point1,                                           
        direction.point2,                                          
        way.cost + direction.cost                                   
    FROM way
        JOIN direction ON way.point2 = direction.point1             
    WHERE path NOT LIKE CONCAT('%', direction.point1, '%')          
    )

SELECT 
    cost AS total_cost,
    CONCAT('{', path, ',a}') AS tour                                                           
FROM way 
WHERE LENGTH(path) = 7                                              
    AND point2 LIKE 'a'     
    -- удалили ограничение по выводу результата                                        
ORDER BY total_cost, tour;                                  