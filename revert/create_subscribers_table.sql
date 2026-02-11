-- Revert theridiid:create_subscribers_table from pg

BEGIN;

DROP TABLE IF EXISTS subscribers;

COMMIT;
