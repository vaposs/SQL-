-- удаление функций
DROP FUNCTION fnc_persons_female();
DROP FUNCTION fnc_persons_male();
DROP FUNCTION fnc_persons();

-- создание функции
CREATE FUNCTION fnc_persons(pgender VARCHAR DEFAULT 'female')
RETURNS TABLE 
    (
        id bigint, 
        name varchar, 
        age integer, 
        gender varchar, 
        address varchar
    ) AS $$ SELECT * FROM person WHERE gender = pgender; $$
LANGUAGE SQL;

-- проверка значений
SELECT *
FROM fnc_persons(pgender := 'male');

SELECT *
FROM fnc_persons();