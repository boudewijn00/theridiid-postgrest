-- Revert theridiid:create_resources_table from pg

BEGIN;

DROP TABLE IF EXISTS resources;

COMMIT;
