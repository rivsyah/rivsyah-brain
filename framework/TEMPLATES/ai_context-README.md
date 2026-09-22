# `.claude/ai_context` — Source of Truth ({{PROJECT}})

Single source of truth for the **intent and design** of `{{project}}`.

> **Sync rule.** Stays in sync with the codebase; doc↔code drift is a bug, fixed in the same change.
> **Tracking choice (§4.10), decided at scaffold:** {{TRACKED in this repo | GITIGNORED — local-only,
> disk is the source of truth, backed up out-of-band via {{mechanism}}}}.
> ⚠ **Secrets.** Live keys are NOT here and NOT in the repo — they live at {{binding secrets
> location}} (+ deploy-platform secrets). Everything shareable uses `<PLACEHOLDER>`.

## Map
- `raw_materials/` — the owner's raw intent notes (the "why"), verbatim, append-only.
- `design/` — **only if a design source exists** (§4.14): `README.md` = the map (source project,
  route, import log, screen map, measurement); `<YYYY-MM-DD>_<slug>/` = one imported bundle,
  verbatim, never edited. Read the artboards' source; do not render them. Intake, not a gate.
- `reference/` — researched docs on external systems; every claim labelled verified/inferred/confirm-live.
- `<component>/01_BUILD_PROMPT.md` — only if a separate-repo component exists (§6.10).
- `development/` — versioned plans.
  - `v1/` — active. `GRANDPLAN.md` = blueprint (why + deep design). `implementation/` = the how:
    `00_INDEX.md` → numbered build files (`- [ ]` checklists, build order) → `STATUS.md` (live cursor)
    → `DECISIONS.md` (append-only). Freeze on ship; open `v2/` (same layout).
  - `bug/` — version-independent tracker: `report/report.md` (inbox) + `fix/report-fixes.md` (ledger).

## Resume after context loss
`/CLAUDE.md` → `development/v1/implementation/00_INDEX.md` → `STATUS.md` → the build file it points
to → `DECISIONS.md` before reopening anything settled. (Your global rulebook and memory load before
any of this — this tree only carries the project.)

## Authority order
`DECISIONS.md` > build files > GRANDPLAN deep design > CLAUDE.md prose; `STATUS.md` > CLAUDE.md status
line; live-verified reference > inferred. Unresolved conflict = drift to reconcile, not a silent pick.
`design/` and `raw_materials/` sit **upstream** of the ladder — owner intent read INTO GRANDPLAN; a
measured correction or a `Dn` recorded in GRANDPLAN §3.1 outranks the artboard it corrects.

## Glossary / artifact types
GRANDPLAN=design-living · 00_INDEX=map-living · NN build=living · STATUS=cursor · DECISIONS/bug-report/
bug-fix=append-only · README/reference-README=stable · raw_materials=archive · design/README=map-living ·
design/<import>=archive · BUILD_PROMPT=contract.
IDs `Dn`(v1)/`vN-Dn`; bug status open/investigating/fixed/external/by-design/wontfix; `--polished`.
