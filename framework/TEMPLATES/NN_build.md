# 01 — {{Skeleton}}

> **Goal:** {{repo + CI + a verifiable health surface, deployed}}. Serves **GRANDPLAN §{{ref}}**.
> Milestone **M1.0**. Artifact type: living build file.
> *(The steps below are an example shape for a first chunk — replace with the project's real ones;
> keep the section skeleton.)*

**Depends-on (lock/build first):** none — first chunk.
**Vision § served:** {{GRANDPLAN §}}
**Design ref:** {{frontend chunks only — `Screen.dc.html` (+ the screen-map row in
`ai_context/design/README.md`) | none — built to pixels from GRANDPLAN §}}

## Build steps
1. Create the project tree at {{local path per binding's purpose taxonomy}}.
2. `git init`; create `{{ORG}}/{{project}}` ({{private/public}}) and wire the remote {{per binding's
   push mechanism}}.
3. Write `.gitignore` to the §4.10 tracking choice ({{track ai_context | ignore all of .claude/}})
   + secrets patterns.
4. Scaffold the stack: {{e.g. `pnpm create astro@latest .` / `cargo new . --bin` — from binding}}.
5. Implement a health surface: {{e.g. `/v1/health` → `{ok:true, version}`}}.
6. Deploy per binding: {{e.g. wrangler / CF static assets by REST}}.
7. Verify from {{binding's verification surface — e.g. a phone browser on the deployed URL}};
   commit + push; update STATUS.

## Checklist
- [ ] repo created + pushed
- [ ] health surface returns `200 {ok:true}` from the **deployed** URL (not localhost)
- [ ] `.gitignore` matches the recorded tracking choice
- [ ] STATUS.md updated: current → `02`, shipped → `01`
- [ ] (frontend) matches its **Design ref**, or the divergence is recorded in GRANDPLAN §3.1

## Key files
- {{deploy config}} (new)
- {{health route}} (new)

## Done when
- All checkboxes ticked; demo passes from {{verification surface}}; repo pushed;
  `{{format && lint && typecheck && test}}` green; {{budgets}} within budget.
