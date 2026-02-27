DROP INDEX idx_person_discounts_unique;

CREATE UNIQUE INDEX idx_person_discounts_unique on person_discounts(person_id, pizzeria_id);

SET enable_seqscan = off;

EXPLAIN ANALYZE
SELECT *
FROM person_discounts
WHERE 
    person_id = 1
    AND pizzeria_id = 12;

SET enable_seqscan = on;