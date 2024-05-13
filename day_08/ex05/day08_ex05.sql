-- SESSION #1
BEGIN;

-- SESSION #2
BEGIN;

-- SESSION #1
SELECT sum(rating) FROM pizzeria;

-- SESSION #2
UPDATE pizzeria SET rating = 1.0 WHERE name = 'Pizza Hut';
COMMIT;

-- SESSION #1
SELECT sum(rating) FROM pizzeria;
COMMIT;
SELECT sum(rating) FROM pizzeria;

-- SESSION #2
SELECT sum(rating) FROM pizzeria;