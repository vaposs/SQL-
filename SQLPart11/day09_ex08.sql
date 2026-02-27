-- удаление функции
DROP FUNCTION fnc_fibonacci(pstop INTEGER DEFAULT 10);

-- создание функции
CREATE FUNCTION fnc_fibonacci(pstop INTEGER DEFAULT 10)
RETURNS TABLE(fib_number INTEGER) AS $$
DECLARE
    firts_value INTEGER := 0;
    second_value INTEGER := 1;
BEGIN
    WHILE firts_value < pstop LOOP
        fib_number := firts_value;
        RETURN NEXT;
        
        firts_value := firts_value + second_value;
        second_value := fib_number;
    END LOOP;
END;
$$ LANGUAGE plpgsql;

-- проверка значений
select * from fnc_fibonacci(100);
select * from fnc_fibonacci();