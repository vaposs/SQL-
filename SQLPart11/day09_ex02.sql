DROP TRIGGER IF EXISTS trg_person_delete_audit ON person;
DROP FUNCTION IF EXISTS fnc_trg_person_delete_audit();

-- функция
CREATE FUNCTION fnc_trg_person_delete_audit()
RETURNS TRIGGER AS $$
    BEGIN
        INSERT INTO person_audit
        VALUES 
            (
                CURRENT_TIMESTAMP,
                'D',
                OLD.*
            );
        RETURN NULL;
    END;
$$ LANGUAGE plpgsql;

-- триггер
CREATE TRIGGER trg_person_delete_audit
    AFTER DELETE ON person
    FOR EACH ROW
    EXECUTE PROCEDURE fnc_trg_person_delete_audit();



-- изменения данных
DELETE FROM person
WHERE id = 10;
 
-- проверка значений
SELECT *
FROM person;

SELECT *
FROM person_audit;