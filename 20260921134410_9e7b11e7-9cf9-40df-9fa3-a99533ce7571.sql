CREATE TABLE public.journal_signups (id UUID NOT NULL DEFAULT gen_random_uuid() PRIMARY KEY, email TEXT NOT NULL UNIQUE, created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now());
GRANT INSERT ON public.journal_signups TO anon;
GRANT INSERT ON public.journal_signups TO authenticated;
GRANT ALL ON public.journal_signups TO service_role;
ALTER TABLE public.journal_signups ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Anyone can join the journal" ON public.journal_signups FOR INSERT TO anon, authenticated WITH CHECK (true);