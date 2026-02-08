
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
WITH RECURSIVE way AS (         -- начинаем рекурсивный запрос которой называем временной таблицей с названием <WAY>
    SELECT 
        point1 AS path,         -- указываем начальную точну и создаем ей псевдоним <PATH>
        point1, 
        point2, 
        cost
    FROM direction              -- берем данные с начальной таблици направлений
    WHERE point1 = 'a'          -- начальная точка должна начинатся в пункта <A>
    
    UNION                       -- обьеденение рекурсивного запроса и первого, с удалением повторов

    SELECT CONCAT(way.path, ',', direction.point1) AS path,         -- создаем строку с начальной строчкой и путем направление
        direction.point1,                                           -- назначаем новую начальную строчку 
        direction.point2,                                           -- назначеем новую конечную точку 
        way.cost + direction.cost                                   -- узнаем текущую длину пути
    FROM way
        JOIN direction ON way.point2 = direction.point1             -- обьединения таблиц, где будут строки только где есть совпадения, где первая точка равна второй точке
    WHERE path NOT LIKE CONCAT('%', direction.point1, '%')          -- проверяем что новой точке у нас в строке нету
    )

SELECT 
    cost AS total_cost,
    CONCAT('{', path, ',a}') AS tour                                -- добавляем в нашу строчку фигурные скобки                             
FROM way 
WHERE LENGTH(path) = 7                                              -- проверяем длину строки, так как у нас есть 4 точки (+1 так как первая точка повторяется дважды +2 фигурные скобки)
    AND point2 LIKE 'a'                                             -- проверяем что мы вернулись в начало
    AND cost =                                                      -- стоимость маршрута берез из подзапроса
        (
            SELECT cost                                             
            FROM way 
            WHERE 
                LENGTH(path) = 7                                    -- берем только запросы длинной 7 символов (смотри выше)
                AND point2 LIKE 'a'                                 -- где конечная точка <a>
            ORDER BY cost 
            LIMIT 1                                                 -- ограничеваем вывод одним результатом
        )
ORDER BY total_cost, tour;                                  





-- полезный материал
/*
-- запрос для рекурсивного поиска факториала
WITH RECURSIVE numbers AS (     -- обьявляем рекурсию
    SELECT 1 AS val         -- начала отсчета          
    
    UNION ALL               -- обьеденение рекурсивного запроса и обычного
    
    SELECT val + 1          -- второй запрос который сначала увеличивает наш аргумент
    FROM numbers                -- проваливаемся в рекурсию
    WHERE val < 10          -- проверяем аргумент для условия окончания рекурсии
)
SELECT * FROM numbers;          -- выводим результат

*/