# CLAUDE.md — {{PROJECT}}

**Project:** `{{ORG}}/{{project}}` — {{one-line what + for whom}}.

> **Read first:** `.claude/ai_context/` is the **source of truth for intent + design, kept in sync
> with the code** (drift is a bug, fixed in the same change).
> Entry: `.claude/ai_context/development/v1/implementation/00_INDEX.md` · Live cursor: `…/STATUS.md`
> · Blueprint: `…/v1/GRANDPLAN.md` · Locked decisions: `…/DECISIONS.md` · Raw intent:
> `.claude/ai_context/raw_materials/` · Methodology: `.claude/FRAMEWORK.md`.
> **When docs disagree, `DECISIONS.md` wins** (authority order in `ai_context/README.md`).

## Project facts
- **Slug:** `{{project}}` · **Repo:** `{{ORG}}/{{project}}` ({{private/public}}) · **Tree:** `{{local path}}`
- **What it is:** {{one sentence}}
- **URLs:** {{frontend URL}} · {{backend URL, if any}}
- **Stack:** {{fill from binding + interview}}

## Hard rules (filled from the Local-binding appendix at scaffold — non-negotiable)
1. **Read `STATUS.md` first** on every session pickup, then resume exactly where it points.
2. **Deploy:** {{binding deploy target — platform, forbidden platforms}}.
3. **Auth:** {{binding auth stack + seeded owners}}.
4. **AI calls:** {{binding LLM routing — what is allowed for content vs coding}}.
5. **Repo policy:** {{binding tracking choice for `.claude/` + push policy + secret-scan mechanism}}.
6. **Plan via the framework.** `.claude/FRAMEWORK.md` is the methodology: GRANDPLAN (blueprint) →
   `implementation/` chunks (checkboxes + STATUS + DECISIONS). {{binding plan-gate rule}}.
7. **Reporting:** {{binding reporting rule — where deliverables are shown, what is banned}}.
8. {{any project-specific non-negotiable from the interview — data sensitivity, compliance, "never X"}}

> Global rules (identity, scope isolation, machine paths) live in the **global rulebook** and are
> not restated here — this file carries only what is project-specific or filled from the binding.

## Security
- Live secrets: {{binding secrets location}} — **never** in this repo. Shareable artifacts use
  `<PLACEHOLDER>`. Redact subagent output that touched secret files. A leaked credential is burned.
  Shipped client/binary carries **zero** live secrets.

## How it works (one screen)
{{request/data flow — 4–6 bullets or a short fenced diagram}}

## Authoritative decisions (mirror — do not re-litigate; ledger is `…/DECISIONS.md`)
- {{Dn — decision 1}}
- {{Dn — decision 2}}

## Conventions
- Package manager {{from binding}} · quality gate `{{format && lint && typecheck && test}}` green
  before push · pre-commit secret scan · {{budgets that matter}}. Shared schemas are the test
  boundary (§4.11).

## Status
Plan/code status lives in `…/implementation/STATUS.md` — **trust that over this file.**
