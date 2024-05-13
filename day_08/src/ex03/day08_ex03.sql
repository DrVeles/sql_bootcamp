-- SESSION #1
BEGIN;
SHOW TRANSACTION ISOLATION LEVEL;

-- SESSION #2
BEGIN;
SHOW TRANSACTION ISOLATION LEVEL;

-- SESSION #1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- SESSION #2
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';
COMMIT;

-- SESSION #1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
COMMIT;
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- SESSION #2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';