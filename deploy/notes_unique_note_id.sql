-- Deploy theridiid:notes_unique_note_id to pg

BEGIN;

ALTER TABLE notes
  ADD CONSTRAINT notes_note_id_unique UNIQUE (note_id);

COMMIT;
