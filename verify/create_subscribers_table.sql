-- Verify theridiid:create_subscribers_table on pg

BEGIN;

SELECT id, first_name, last_name, email, topics, frequency, created_at
FROM subscribers
WHERE FALSE;

ROLLBACK;
