# Mandal-wise Review Monitoring System – Karimnagar

Single-file dashboard (`index.html`) + Supabase backend.

1. Supabase: create project → SQL Editor → run `supabase_setup.sql`.
2. Authentication → Providers → Email: keep ON, turn OFF "Allow new users to sign up" (Settings), then Users → Add user for each officer (tick "Auto confirm").
3. Project Settings → API → copy **Project URL** and **anon public key** into `SB_URL` / `SB_KEY` near the top of the script in `index.html`.
4. Upload `index.html` to this repo, enable GitHub Pages (Settings → Pages → main / root), or connect the repo to Cloudflare Pages/Netlify.
5. Log in once as any user and open Data Entry – the first login uploads the starting data automatically.
