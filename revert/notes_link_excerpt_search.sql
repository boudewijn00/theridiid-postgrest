-- Revert theridiid:notes_link_excerpt_search from pg

BEGIN;

DROP TRIGGER IF EXISTS tsvectorupdate ON public.notes;

DROP FUNCTION IF EXISTS public.notes_link_excerpt_tsv_trigger();

DROP INDEX IF EXISTS public.notes_link_excerpt_tsv_idx;

ALTER TABLE public.notes
  DROP COLUMN IF EXISTS link_excerpt_tsv;

COMMIT;
