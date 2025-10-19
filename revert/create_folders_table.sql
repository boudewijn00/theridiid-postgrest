-- Revert theridiid:create_folders_table from pg

BEGIN;

DROP TABLE IF EXISTS folders;

COMMIT;
