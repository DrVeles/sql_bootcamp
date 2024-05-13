CREATE INDEX idx_person_name ON person (upper(name));

SET enable_seqscan = OFF;

EXPLAIN ANALYZE
SELECT * FROM person
WHERE upper(name) = 'KATE';