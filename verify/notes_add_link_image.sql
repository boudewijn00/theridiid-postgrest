-- Verify theridiid:notes_add_link_image on pg

BEGIN;

SELECT link_image FROM notes WHERE false;

ROLLBACK;
