-- Deploy theridiid:notes_add_link_favicon to pg

BEGIN;

ALTER TABLE api.notes
  ADD COLUMN link_favicon TEXT;

COMMIT;
