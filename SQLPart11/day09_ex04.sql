-- удаление функций
DROP FUNCTION fnc_persons_female();
DROP FUNCTION fnc_persons_male();

-- создание функций
CREATE FUNCTION fnc_persons_female()
RETURNS TABLE 
    (
        id BIGINT,
        name VARCHAR,
        age INTEGER,
        gender VARCHAR,
        address VARCHAR
    ) AS $$ SELECT * FROM person WHERE gender = 'female' $$ 
LANGUAGE sql;

CREATE FUNCTION fnc_persons_male()
RETURNS TABLE 
    (
        id BIGINT,
        name VARCHAR,
        age INTEGER,
        gender VARCHAR,
        address VARCHAR
    ) AS $$ SELECT * FROM person WHERE gender = 'male' $$ 
LANGUAGE sql;

-- проверка значений
SELECT * 
FROM fnc_persons_female();

SELECT *
FROM fnc_persons_male();