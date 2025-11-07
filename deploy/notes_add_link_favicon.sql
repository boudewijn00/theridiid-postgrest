-- Deploy theridiid:notes_add_link_favicon to pg

BEGIN;

ALTER TABLE notes
  ADD COLUMN link_favicon TEXT;

COMMIT;
