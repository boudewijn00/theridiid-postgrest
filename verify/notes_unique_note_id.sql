-- Verify theridiid:notes_unique_note_id on pg

BEGIN;

SELECT 1/count(*)
FROM pg_constraint c
JOIN pg_class t ON t.oid = c.conrelid
JOIN pg_namespace n ON n.oid = t.relnamespace
WHERE c.conname = 'notes_note_id_unique'
  AND t.relname = 'notes'
  AND n.nspname = 'public'
  AND c.contype = 'u';

ROLLBACK;
