-- удаление функции
DROP FUNCTION func_minimum(VARIADIC arr NUMERIC[]);

-- создание функции
CREATE FUNCTION func_minimum(VARIADIC arr NUMERIC[])
RETURNS NUMERIC AS $$
DECLARE
    min_val NUMERIC;
BEGIN
    SELECT MIN(val) INTO min_val
    FROM unnest(arr) AS val;
    
    RETURN min_val;
END;
$$ LANGUAGE plpgsql;

-- проверка значений
SELECT func_minimum(1, 2, 3, 4, 5);
SELECT func_minimum(-10, -9, -8, -7);