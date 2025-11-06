-- Deploy theridiid:notes_add_link_image to pg

BEGIN;

ALTER TABLE notes ADD COLUMN link_image TEXT;

COMMIT;
