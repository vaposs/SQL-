DROP INDEX IF EXISTS idx_person_order_order_date;

CREATE UNIQUE INDEX idx_person_order_order_date ON person_order(person_id, menu_id) WHERE order_date = '2022-01-01';

ANALYZE person_order;

BEGIN;
SET LOCAL enable_seqscan = OFF;   
SET LOCAL enable_bitmapscan = OFF;

EXPLAIN ANALYZE

SELECT menu_id
FROM person_order
WHERE 
    order_date = '2022-01-01'
    AND person_id = 2;


COMMIT;
RESET enable_seqscan;
RESET enable_bitmapscan;
