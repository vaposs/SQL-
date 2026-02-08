DROP INDEX IF EXISTS idx_menu_pizzeria_id;
DROP INDEX IF EXISTS idx_menu_unique;

CREATE UNIQUE INDEX idx_menu_unique ON menu(pizzeria_id, pizza_name);

ANALYZE menu;

BEGIN;
SET LOCAL enable_seqscan = OFF;   
SET LOCAL enable_bitmapscan = OFF; 

EXPLAIN ANALYZE

SELECT * 
FROM menu
WHERE
    pizzeria_id = 1
    AND pizza_name = 'supreme pizza';

COMMIT;
RESET enable_seqscan;
RESET enable_bitmapscan;