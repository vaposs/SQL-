
-- Сначала удаляем триггер
DROP TRIGGER IF EXISTS trg_person_insert_audit ON person;
DROP TRIGGER IF EXISTS trg_person_insert_audit ON person;
DROP FUNCTION IF EXISTS fnc_trg_person_insert_audit();
DROP TRIGGER IF EXISTS trg_person_audit ON person;
DROP TABLE IF EXISTS person_audit CASCADE;

-- создали таблицу
CREATE TABLE person_audit (
    created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL,
    type_event CHAR(1) DEFAULT 'I' NOT NULL,
        CONSTRAINT ch_type_event CHECK ( type_event IN ('I', 'U', 'D')),
    row_id BIGINT NOT NULL,
    name VARCHAR,
    age INTEGER,
    gender VARCHAR,
    address VARCHAR
);

-- тригерная функция
/*
структура триггера
- создание функции CREATE FUNCTION <имя функции>
- возвращаемы тип TRIGGER и не принимает аргументы - RETURNS TRIGGER AS $$ ($$ открытия скобок тела функции)
- логика триггера - INSERT INTO <имя таблицы>
-  ( что должна делать функция)
- какие данные должна возвращать - NEW для INSERT/UPDATE или OLD для DELETE или NULL что бы отменить операцию
- закрития тела функции ($$) и указания якыка написания функции (LANGUAGE plpgsql)
- связывания функции с триггером 
- создание тригера - CREATE TRIGGER <имя триггера>
- после какой операции должен срабатывать и с какой таблицей - AFTER <операция> ON <отслеживаемая таблица>
- указываем что должен срабатывать для каждой строки FOR EACH ROW 
- какую функцию вызываем при срабатывании триггера EXECUTE FUNCTION <имя функции>

*/

CREATE FUNCTION fnc_trg_person_insert_audit()
RETURNS TRIGGER AS $$
    BEGIN
        INSERT INTO person_audit
        (
            row_id,
            name,
            age,
            gender,
            address
        )
        VALUES
        (
            NEW.id,
            NEW.name,
            NEW.age,
            NEW.gender,
            NEW.address
        );
        RETURN NEW;
    END;
$$ LANGUAGE plpgsql;

-- сам триггер
CREATE TRIGGER trg_person_insert_audit
    AFTER INSERT ON person
    FOR EACH ROW
    EXECUTE FUNCTION fnc_trg_person_insert_audit();

-- удаляем старые данные
DELETE FROM person WHERE id = 10;

-- Посмотреть текущие данные в person
SELECT * FROM person;

-- Посмотреть текущие данные в person_audit (должно быть пусто)
SELECT * FROM person_audit;

-- Сделаем НОВУЮ вставку в таблицу person
INSERT INTO person(id, name, age, gender, address) 
VALUES (10, 'Damir', 22, 'male', 'Irkutsk');

-- Проверим, что добавилось в person
SELECT * FROM person;

-- Проверим, что добавилось в person_audit
SELECT * FROM person_audit;