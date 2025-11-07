-- Revert theridiid:notes_add_link_image from pg

BEGIN;

ALTER TABLE notes DROP COLUMN link_image;

COMMIT;
