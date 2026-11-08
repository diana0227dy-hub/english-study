# Friendly English Study Room

Multi-user English learning app for YouTube videos.

## Features
- Email sign-up and sign-in via Supabase Auth
- Private per-user video tabs, expressions, flashcards and mistake history
- Korean → English and English → Korean practice
- Dashboard with learning counts and accuracy
- Manual expression entry and transcript paste/import workflow

## Setup
1. Create a Supabase project and run `supabase/schema.sql` in the SQL Editor.
2. In Supabase > Project Settings > API, copy Project URL and the **publishable/anon key**.
3. Open `index.html` and set `SUPABASE_URL` and `SUPABASE_ANON_KEY` (public client values only).
4. Deploy the static site on Vercel, Netlify, or GitHub Pages.
5. Configure the deployed URL in Supabase Authentication > URL Configuration.

**Never put a service_role key or OpenAI API key in frontend code.**

## Video transcript extraction
Automatic YouTube transcript retrieval and AI extraction require a separate backend or serverless function. This version supports manually entering expressions and pasting transcript text for reference; it does **not** claim automatic transcript extraction. Add a server endpoint with rate limits and server-side API credentials before enabling automatic AI extraction.

User data is isolated by Supabase Row Level Security policies. Review authentication settings before sharing the public site.
