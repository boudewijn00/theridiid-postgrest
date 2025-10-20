-- Revert theridiid:notes_link_excerpt_search from pg

BEGIN;

DROP TRIGGER tsvectorupdate ON public.notes;

DROP FUNCTION public.notes_link_excerpt_tsv_trigger();

DROP INDEX public.notes_link_excerpt_tsv_idx;

ALTER TABLE public.notes
  DROP COLUMN link_excerpt_tsv;

COMMIT;
