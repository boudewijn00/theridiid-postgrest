-- Deploy theridiid:notes_link_excerpt_search to pg

BEGIN;

ALTER TABLE public.notes
  ADD COLUMN link_excerpt_tsv tsvector;

UPDATE public.notes
  SET link_excerpt_tsv = to_tsvector('english', coalesce(link_excerpt, ''));

CREATE INDEX notes_link_excerpt_tsv_idx ON public.notes USING gin(link_excerpt_tsv);

CREATE FUNCTION public.notes_link_excerpt_tsv_trigger()
RETURNS TRIGGER AS $$
BEGIN
  new.link_excerpt_tsv := to_tsvector('english', coalesce(new.link_excerpt, ''));
  RETURN new;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER tsvectorupdate
  BEFORE INSERT OR UPDATE ON public.notes
  FOR EACH ROW EXECUTE PROCEDURE public.notes_link_excerpt_tsv_trigger();

COMMIT;
