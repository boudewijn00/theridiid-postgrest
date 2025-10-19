-- Revert theridiid:create_notes_table from pg

BEGIN;

DROP TABLE IF EXISTS notes;

COMMIT;
