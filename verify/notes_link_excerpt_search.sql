-- Verify theridiid:notes_link_excerpt_search on pg

BEGIN;

SELECT link_excerpt_tsv FROM public.notes WHERE false;

SELECT 1/count(*)
FROM pg_class c
JOIN pg_namespace n ON n.oid = c.relnamespace
WHERE c.relname = 'notes_link_excerpt_tsv_idx'
  AND n.nspname = 'public';

SELECT 1/count(*)
FROM pg_trigger t
JOIN pg_class c ON c.oid = t.tgrelid
JOIN pg_namespace n ON n.oid = c.relnamespace
WHERE t.tgname = 'tsvectorupdate'
  AND c.relname = 'notes'
  AND n.nspname = 'public';

SELECT 1/count(*)
FROM pg_proc p
JOIN pg_namespace n ON n.oid = p.pronamespace
WHERE p.proname = 'notes_link_excerpt_tsv_trigger'
  AND n.nspname = 'public';


ROLLBACK;
