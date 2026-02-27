DROP TRIGGER IF EXISTS trg_person_update_audit ON person;
DROP FUNCTION IF EXISTS fnc_trg_person_update_audit();


-- функция
CREATE FUNCTION fnc_trg_person_update_audit()
RETURNS TRIGGER AS $$
    BEGIN
        INSERT INTO person_audit
        VALUES 
            (
                CURRENT_TIMESTAMP,
                'U',
                OLD.*
            );
        RETURN NULL;
    END;
$$ LANGUAGE plpgsql;

-- триггер
CREATE TRIGGER trg_person_update_audit
    AFTER UPDATE ON person
    FOR EACH ROW
    EXECUTE PROCEDURE fnc_trg_person_update_audit();


-- изменения данных
UPDATE person SET name = 'Bulat' WHERE id = 10; 
UPDATE person SET name = 'Damir' WHERE id = 10;

-- проверка значений
SELECT *
FROM person;

SELECT *
FROM person_audit;

