ROLLBACK;

CREATE INDEX idx_person_order_multi ON person_order(person_id, menu_id, order_date);

BEGIN;
SET LOCAL enable_seqscan = OFF;     -- выключили последовательное сканирование
SET LOCAL enable_bitmapscan = OFF;  -- выключили битовое сканирование

EXPLAIN ANALYZE

SELECT 
    person_id, 
    menu_id,
    order_date
FROM person_order
WHERE 
    person_id = 8 
    AND menu_id = 19;

COMMIT;
RESET enable_seqscan;
RESET enable_bitmapscan;