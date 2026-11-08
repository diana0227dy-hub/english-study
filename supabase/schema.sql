-- Run in Supabase SQL Editor. Authentication uses Supabase Auth.
create table if not exists public.videos (
 id uuid primary key default gen_random_uuid(),
 user_id uuid not null references auth.users(id) on delete cascade,
 url text not null,
 title text not null default 'Untitled video',
 created_at timestamptz not null default now()
);
create table if not exists public.expressions (
 id uuid primary key default gen_random_uuid(),
 user_id uuid not null references auth.users(id) on delete cascade,
 video_id uuid not null references public.videos(id) on delete cascade,
 english text not null,
 korean text not null,
 example text not null default '',
 wrong_count integer not null default 0 check (wrong_count >= 0),
 correct_count integer not null default 0 check (correct_count >= 0),
 created_at timestamptz not null default now()
);
create index if not exists videos_user_idx on public.videos(user_id);
create index if not exists expressions_user_video_idx on public.expressions(user_id,video_id);
alter table public.videos enable row level security;
alter table public.expressions enable row level security;
create policy "own videos" on public.videos for all to authenticated using (user_id = (select auth.uid())) with check (user_id = (select auth.uid()));
create policy "own expressions" on public.expressions for all to authenticated using (user_id = (select auth.uid())) with check (user_id = (select auth.uid()) and exists(select 1 from public.videos v where v.id=video_id and v.user_id=(select auth.uid())));
