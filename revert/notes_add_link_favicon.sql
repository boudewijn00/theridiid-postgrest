-- Revert theridiid:notes_add_link_favicon from pg

BEGIN;

ALTER TABLE notes
  DROP COLUMN link_favicon;

COMMIT;
