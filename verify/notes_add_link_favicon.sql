-- Verify theridiid:notes_add_link_favicon on pg

BEGIN;

SELECT link_favicon
  FROM notes
 WHERE FALSE;

ROLLBACK;
