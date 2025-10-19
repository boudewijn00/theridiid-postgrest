-- Revert theridiid:create_tags_table from pg

BEGIN;

DROP TABLE IF EXISTS tags;

COMMIT;
