-- Run once in Supabase > SQL Editor
create table if not exists rows (
  id bigint primary key,
  tbl int not null,
  d text,
  v jsonb not null,
  updated_by text,
  updated_at timestamptz default now()
);
create table if not exists logs (
  id bigserial primary key,
  t timestamptz default now(),
  u text, a text, s text, tb text, m text, i text, d text, x text
);
alter table rows enable row level security;
alter table logs enable row level security;

-- everyone can VIEW the dashboard
create policy "public read rows" on rows for select using (true);
create policy "public read logs" on logs for select using (true);
-- only logged-in officers can ADD / EDIT / DELETE
create policy "auth write rows" on rows for all    using (auth.role()='authenticated') with check (auth.role()='authenticated');
create policy "auth add logs"   on logs for insert with check (auth.role()='authenticated');

-- live refresh for all viewers
alter publication supabase_realtime add table rows, logs;
