DROP INDEX IF EXISTS idx_person_name;

CREATE INDEX idx_person_name ON person(UPPER(name));

BEGIN;
SET LOCAL enable_seqscan = OFF; -- выключили последовательное сканирование

EXPLAIN ANALYZE

SELECT *
FROM person
WHERE UPPER(name) = 'ANDREY';

COMMIT;
RESET enable_seqscan;