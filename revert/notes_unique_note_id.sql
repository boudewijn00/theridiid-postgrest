-- Revert theridiid:notes_unique_note_id from pg

BEGIN;

ALTER TABLE notes
  DROP CONSTRAINT notes_note_id_unique;

COMMIT;
