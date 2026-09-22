# LOCAL BINDING — Rivaldo Harviansyah

> Copy this file to `BINDING.md` in the same folder and fill it in. `install-project.sh` appends
> `BINDING.md` to every project's `.claude/FRAMEWORK.md`, after the spec, where it **overrides the
> spec's defaults**. It is yours: never push it to a public repo.
>
> The spec is written for anyone. This file is written for you. Answer each line once, here, so no
> session has to guess and no two projects drift apart.

## B1 — Who decides what

- The agent decides: <e.g. libraries, file layout, test strategy, refactors inside a chunk>
- Aldo decides: <e.g. scope, pricing, visual direction, anything a client sees>
- Never without asking: <e.g. force-push, deleting data, spending money, publishing>

## B2 — The plan gate

Does the agent stop after the GRANDPLAN and wait for approval, or print it and keep building?

- **Answer:** <stop | print and continue>
- Why: <one line, so a future session does not re-argue it>

## B3 — Is `.claude/ai_context/` tracked in git?

- **Answer:** <tracked | local-only>
- If local-only: the backup is <where>. An untracked tree with no backup is a plan you will lose.

## B4 — Where things deploy

- Hosting: <e.g. Cloudflare Workers and Pages, Fly, a VPS>
- Domains: <the ones you actually own>
- Never deploy to: <the platforms you have ruled out, and why>

## B5 — Secrets

- Store: `~/brain/env.db`, read with `~/brain/bin/envdb.sh get KEY`.
- Never in a tracked file, a commit message, an error message or chat.
- A missing key is reported in one line. It is never improvised.

## B6 — Stack defaults

- Language and runtime: <>
- Framework: <>
- Database: <>
- Styling: <>
- Auth: <>
- Deviating from these needs a line in DECISIONS.md, not a conversation.

## B7 — Git

- Commit without asking: <yes | no>
- Branching: <trunk | feature branches>
- Commit message shape: <>
- Push to a remote: <when>

## B8 — Cadence

- How work is chunked: <by scope, never by calendar day, is the usual answer>
- What "done" means for a chunk: <tests pass? deployed? reviewed?>

## B9 — Review bar

- What must be true before you are shown a build: <>
- What the agent must never hand back: <e.g. a half-done task plus a question>

## B10 — Anything else that is true every time

<Write it here. One line each. If it starts appearing in every project's CLAUDE.md, it belongs
in this file instead.>
