# The `ai_context` Framework — Bootstrap Prompt + Spec

> A portable way to run **AI-agent-built projects**: a single, versioned **source of truth for
> intent + design** that stays in sync with the code, resumes itself after any context loss, and
> never re-litigates settled decisions. Paste this whole file into a fresh project and the agent
> will interview briefly (or decide, if the binding says so), then scaffold the structure and a
> tailored `CLAUDE.md`.
>
> This file is **project-agnostic above the binding line**. Everything in `{{DOUBLE_BRACES}}` is a
> slot to fill. A concrete instantiation (the project this framework was distilled from) is in the
> Appendix.

**⚠ READ THE LOCAL-BINDING APPENDIX (bottom of this file) FIRST.** If one exists, it overrides the
defaults in this spec — autonomy, tracking, secrets, cadence, deploy targets. An agent that reads
top-down and obeys a default the binding overrides is executing a dead rule.

<!-- PROVENANCE — revised 2026-08-23 (maintainer structural pass).
     Sections 0-7 and the worked-instantiation Appendix are the original spec as first published.
     §4.8 automatic chat intake, §4.13 detour protocol, §6.10 BUILD_PROMPT and §5's deltas 10-12
     were added in a later revision lost before it reached the public repo; they are faithful
     RECONSTRUCTIONS from notes, not restored verbatim.
     The 2026-08-23 structural pass changed STRUCTURE, not doctrine: §6.1-§6.9 stubs restored (they
     dangled after the skeletons were extracted to TEMPLATES/), §4.10 gained the tracking-choice
     knob, §4.12 gained the upgrade-versioning rule (promoted from the 00_INDEX template, where it
     existed without a spec equivalent), §5 delta 13 records that, and every org-specific value was
     moved below the binding line so the spec + templates stay publishable as-is.
     The 2026-09-18 structural pass added the DESIGN SOURCE: `ai_context/design/` in §2/§3, §4.14
     (design-source discipline), §5 delta 14, §6.11 + TEMPLATES/design-README.md, interview Q8,
     scaffold step 8, and binding B11 (Claude Design). Doctrine elsewhere untouched.
-->

---

## ▶ IF YOU ARE AN AI AGENT READING THIS IN A FRESH PROJECT — DO THIS NOW

You have been handed a **framework spec**, not a task. **First read this entire file (through §7,
plus the Local-binding appendix if present)** so you know the templates and rules exist — *then*
bootstrap this project with it:

### Step 1 — Interview (ask all at once; accept partial answers; use defaults for blanks)
1. **Project** — name + one sentence on what it is and why it exists.
2. **Primary user** — who is this *really* for? Role, sophistication, what they fear/value. (One named
   primary user beats "general users" — it sharpens every later decision.)
3. **Stack** — languages, frameworks, runtime, package manager, platform target. Or say *"decide for me"*
   and the agent proposes a default and records it as a decision to confirm.
4. **Shape** — one repo or several (e.g. client + service)? Is any component a **separate repo**?
5. **Non-negotiables** — hard constraints: security/data-sensitivity, performance budgets, accessibility,
   offline, compliance, "must never do X."
6. **Voice** — default language/locale + tone, if it's user-facing.
7. **Phase** — greenfield (plan first) or existing code to document?
8. **Design source** — does a design already exist outside the repo (a Claude Design project, a
   handoff bundle, a Figma export)? If yes: where it lives, which route brings it in, which screens
   it covers (§4.14). If no: the UI is built to pixels from GRANDPLAN and shown to the owner early.

If the user says "just go" — **or the binding sets an autonomy default** — answer the interview
yourself: proceed with explicit assumptions written into `GRANDPLAN.md` as numbered **Open
Questions** (each with a **Rec:** inline), and lock **nothing** in `DECISIONS.md` without the owner.
Where a stop *is* allowed, spend it once: echo the captured answers + chosen defaults back for a
one-shot confirm before scaffolding — otherwise a wrong project or org name gets baked into every file.

### Step 2 — Scaffold (create exactly this, from the skeletons in `TEMPLATES/` — contracts in §6)
1. `.claude/ai_context/README.md` — the **map** (§6.2).
2. Root `CLAUDE.md` — short: rules + pointers, not depth (§6.1).
3. `.claude/ai_context/development/v1/GRANDPLAN.md` — the blueprint skeleton, filled with what the
   interview (or your explicit assumptions) gave; unknowns become numbered **Open Questions** (§6.3).
4. `.claude/ai_context/development/v1/implementation/` → `00_INDEX.md` (§6.4), `STATUS.md`
   (greenfield cursor, §6.6), `DECISIONS.md` (§6.7 — carry only what the owner explicitly confirmed).
5. `.claude/ai_context/development/bug/report/report.md` + `.../fix/report-fixes.md` — empty trackers (§6.8).
6. `.claude/ai_context/reference/README.md` — external-system research convention (§6.9). Add per-system
   folders only as you actually research a dependency; don't pre-create empty `<system>/` dirs.
7. `.claude/ai_context/raw_materials/` — drop the owner's raw notes here verbatim.
8. `.claude/ai_context/design/README.md` (§6.11) — **only when a design source exists.** Import the
   bundle beside it, verbatim, into one dated folder (`design/<YYYY-MM-DD>_<slug>/`), fill the
   screen map, and point GRANDPLAN §3.1 at it (§4.14). No design source → no `design/` folder.
9. `.claude/TEMPLATES/` — copy the skeletons from the framework home (named in the binding; fallback:
   the `TEMPLATES/` directory beside this file) so future `vN`/build-files/bug entries stay consistent.
10. **Tracking + secrets:** apply §4.10 and the binding's tracking choice **now** — decide whether
   `.claude/` is tracked or gitignored before the first commit, and tell the owner which applies.
   Live credentials never enter the repo either way.

### Step 3 — Hand back
Print: the tree you created, the **Resume protocol** (§4.3), and the single **Next action** —
**greenfield:** "fill GRANDPLAN §X with the owner, then derive `implementation/01_*` from it";
**existing code:** "drift-scan the code into GRANDPLAN + `reference/`, then derive the build files."
Do **not** start writing product code — this framework produces the *plan that code is built from*.

### Operating rules while you work (these outlive the bootstrap)
- **Keep `ai_context` in sync with the code — drift is a bug** (§4.1).
- **Obey the authority order** (§4.2) when docs disagree; never silently pick.
- **Tick checklist boxes and update `STATUS.md`** at the end of every session at minimum — the
  binding may demand a tighter cadence (§4.7).
- **Lock decisions only with the owner; append, never rewrite** (§4.5).
- **Never put live secrets in shareable artifacts; redact subagent output** (§4.10).

---

## 1. Philosophy — why this works (7 principles)

1. **One source of truth for intent + design.** `.claude/ai_context/` holds *why* the project exists
   and *how* it's meant to behave. Code is the *what*. The two must agree — **drift is a bug, fixed in
   the same change**, never deferred.
2. **Why ≠ How.** `GRANDPLAN.md` is the **ground-truth blueprint** (deep design, rationale). The
   `implementation/` folder is the **actionable build guide** *birthed from* it — small, ordered,
   checklist-driven. Build files **reference** GRANDPLAN sections; they never duplicate them.
3. **Versioned, identical layouts.** Development lives in `development/vN/`. **Every `vN/` has the exact
   same shape.** When a version ships, **freeze it and open `v(N+1)/`** with that same shape. History is
   preserved, not overwritten.
4. **Self-resuming.** A fixed read-order (`CLAUDE.md → 00_INDEX → STATUS → the build file`) lets any
   fresh agent recover full context after a crash, a compaction, or a week away. `STATUS.md` is the
   live cursor.
5. **Decisions are locked & append-only.** Settled questions go in `DECISIONS.md` with IDs and an
   explicit **authority order**, so they're never silently re-litigated. New information **supersedes**
   (with a visible marker), it doesn't quietly overwrite.
6. **Anchor to a specific user, then imprint.** Building for one named primary user — and stamping that
   identity through naming, defaults, and content — produces sharper, more coherent software than
   "for everyone." (Optional, but it's the highest-leverage principle here.)
7. **Secrets stay out of shareable artifacts.** Live keys live in gitignored files; everything
   shareable uses `<PLACEHOLDER>` tokens; agent/subagent output is redacted before it lands anywhere.

---

## 2. Directory layout

```
<repo-root>/
  CLAUDE.md                         ← stable: rules + pointers (short; points into ai_context)
  .gitignore                        ← reflects the §4.10 tracking choice, decided at scaffold
  .claude/
    FRAMEWORK.md                    ← this file (copied from the framework home)
    TEMPLATES/                      ← copy-paste skeletons (keeps every vN/build-file/bug consistent)
    ai_context/                     ← SOURCE OF TRUTH (intent + design). Stays in sync with code.
      README.md                     ← the MAP + sync rule + authority order + resume protocol
      raw_materials/                ← the owner's raw, unedited intent notes (the rawest "why")
      design/                       ← the DESIGN SOURCE, only if one exists (§4.14)
        README.md                   ← the map: source project, route, imports, screen map, measurement
        <YYYY-MM-DD>_<slug>/        ← one imported bundle, verbatim (artboards + github.md + runtime)
      reference/                    ← researched docs on external systems/deps (confidence-labelled)
        README.md
        <system>/…
      <component>/                  ← only if a separate-repo component exists (§6.10)
        01_BUILD_PROMPT.md
      development/                  ← versioned plans
        bug/                        ← version-INDEPENDENT bug tracker (not under any vN/)
          report/report.md          ← owner's bug inbox + status-at-a-glance table
          fix/report-fixes.md       ← one fix entry per report, kept in lockstep
        v1/                         ← the active plan (freeze → open v2/ on ship)
          GRANDPLAN.md              ← ground-truth blueprint: the whole "why" + deep design
          implementation/           ← the actionable "how", birthed from GRANDPLAN
            00_INDEX.md             ← entry point + resume map + milestone gating
            01_<slug>.md            ← build files, flat & numbered, in build order
            02_<slug>.md
            …
            STATUS.md               ← THE LIVE CURSOR
            DECISIONS.md            ← append-only locked decisions (Dn / vN-Dn)
        v2/ …                       ← same shape, opened when v1 freezes
```

**Separate-repo components** (e.g. a backend service): keep their **build prompt** here
(`ai_context/<component>/01_BUILD_PROMPT.md`, §6.10) and build them in their own repo. The
**shared-contract package** (schemas both repos import) is **published or vendored** — decide at
scaffold, record it as a decision, and treat it as the **cross-repo test boundary** (§4.11).

---

## 3. Artifacts — what each is, who updates it, when

| Artifact | Kind | Updated | Holds |
|---|---|---|---|
| `CLAUDE.md` | **stable** | rarely (rules change) | non-negotiable rules, the imprint hard-rule, architecture-in-one-screen, pointers into `ai_context`, the resume protocol. **Short.** |
| `ai_context/README.md` | **stable** | when the map changes | the map, the sync rule, the authority order, the resume protocol, a secrets warning |
| `raw_materials/` | **archive** | append | the owner's raw notes, verbatim — never polished away |
| `design/README.md` | **map (living)** | on every import, measurement, or divergence | source project + route, the import log, the **screen map** (artboard → repo files → build file → state), measurement results, what was deliberately not taken (§4.14) |
| `design/<date>_<slug>/` | **archive** | never (re-import instead) | one design bundle exactly as exported — artboards, `github.md`, the prototype runtime — read, never edited, never shipped |
| `reference/<system>/` | **research** | when re-verified | how an external dependency actually behaves, every claim labelled **verified / inferred / confirm-live** |
| `GRANDPLAN.md` | **design (living)** | when design changes | the whole *why* + deep design, in numbered sections (§N.M). Carries an **Owner Decisions** block + **Open Questions** |
| `implementation/00_INDEX.md` | **map (living)** | when files/milestones change | entry point, resume order, the build-file list grouped by milestone, milestone gating |
| `implementation/NN_<slug>.md` | **build (living)** | as built | one buildable chunk: goal → steps → `- [ ]` checklist → key files → done-when. References GRANDPLAN §N |
| `implementation/STATUS.md` | **live cursor** | **every session (or tighter, per binding)** | current milestone/file, what's done, **next action**, blockers, a one-line-per-session log |
| `implementation/DECISIONS.md` | **append-only** | when a question is settled | locked decisions with IDs, state, why, where-it-bites, supersedes |
| `bug/report/report.md` | **inbox** | as bugs arrive | raw reports + a status-at-a-glance table; `--polished` flag once cleaned |
| `bug/fix/report-fixes.md` | **ledger** | with each fix | one entry per report: status → root cause → fix → files → verification → commit |
| `<component>/01_BUILD_PROMPT.md` | **contract** | when the contract changes | the handoff for a separate-repo component (§6.10) |

---

## 4. The rules (the framework proper)

### 4.1 Sync rule
`ai_context` must stay in sync with the codebase. A code change that alters documented behavior
**updates the doc in the same change**. Treat code↔doc drift as a bug, not a chore. (Run a quick
**drift scan** when you open a version: do the docs still describe the code? Fix or flag what doesn't.
Include the design source when there is one: does `design/README.md` still name the current import,
and does the code still match the artboards it cites? §4.14.)

### 4.2 Authority order (precedence ladder — when documents disagree)
1. **`DECISIONS.md`** (the matching `vN/`) — final word on settled questions. **GRANDPLAN's `§0 Owner
   Decisions` block is co-authoritative** with it (that block is the *mirror* of DECISIONS, not deep design).
2. **Build files** (`implementation/NN_*`) — the actionable layer for build specifics.
3. **GRANDPLAN deep-design sections** (`§1+`) — rationale; superseded where 1–2 differ.
4. **`CLAUDE.md` prose** — stable rules; its "current status" line always defers to `STATUS.md`.
5. **`reference/` docs** — **live-verified** beats **inferred**; an unconfirmed claim is a hypothesis.

A conflict **not** resolved by this ladder is **drift to reconcile**, never a silent choice.

`design/` and `raw_materials/` sit **upstream** of this ladder: they are the owner's intent, read
into GRANDPLAN, not documents that argue with it. An artboard value that failed measurement, or a
detail the plan deliberately did not take, is recorded in GRANDPLAN §3.1 (and as a `Dn` when it is a
decision) — that record outranks the artboard. An artboard that says nothing about a case leaves the
ladder above to decide (§4.14).

### 4.3 Resume protocol (after any session / context loss)
`CLAUDE.md` → `development/vN/implementation/00_INDEX.md` → `implementation/STATUS.md` → the numbered
build file `STATUS.md` points to. Then `DECISIONS.md` before reopening any settled question.

### 4.4 Build-file contract
Every `NN_<slug>.md`: **Goal** (1–2 sentences + the GRANDPLAN § it serves) → **Depends-on / lock-first**
(decisions or files that must exist) → **Design ref** (frontend chunks only: the artboard(s) implemented,
or "none — built to pixels") → **Build steps** (numbered, concrete) → **Checklist** (`- [ ]`,
mirrors the steps) → **Key files** (created/touched) → **Done-when** (observable acceptance). Files are
**flat, numbered, in build order**, grouped into **milestones** by the INDEX. They **link** to GRANDPLAN
rather than restating it.

### 4.5 Decisions discipline
- IDs: `D1, D2, …` for v1; prefix later versions (`V2-D1`, `V3-D1`) so they never collide.
- Each entry: **decision · state · why · where-it-bites** (and **supersedes: <id>** if it replaces one).
- **States:** `proposed` → `locked` → `superseded`. Optional tags: `lock-before-<milestone>` (gating),
  `tune-at-build` (a knob to settle while building).
- **Append-only.** To change a locked decision, add a new one that **supersedes** the old; mark the old
  `superseded` in place. Never silently rewrite — that's how drift hides (see §4.2).

### 4.6 Milestone gating
The INDEX groups build files into milestones (`M1.0, M1.1, …`) and states **what must be true before
each** (decisions locked, prior milestone done). "Blocked on a decision, not effort" is a valid, common
state — surface it; don't build past it. For a small project a single milestone (or none) is fine —
gating only earns its keep when a decision genuinely blocks later work.

### 4.7 STATUS cursor discipline
`STATUS.md` is the one file a fresh agent trusts for "where are we." Keep it short and current: overall
phase, current milestone/file, what's done, the **single next action**, blockers, decisions/open items,
and a **session log** (one line per working session). **Update it at the end of every session at
minimum** — a binding may (and often should) demand every-tick updates instead.

### 4.8 Bug workflow
Version-**independent** (top-level `development/bug/`). Flow: a report lands in `report/report.md` →
you fix it → in the **same change** you add/update the matching entry in `fix/report-fixes.md` **and**
set the report's status. Keep the two in lockstep.
- **Status vocabulary:** `open` · `investigating` · `fixed` · `external` (not our code: a separate repo,
  infra, or the owner's environment) · `by-design` · `wontfix`.
- **`--polished`:** you may reshape a raw report for readability (keep the intent), then tag its heading
  `--polished` so it isn't re-polished. A report without the flag is fair game.
- Both files carry a **status-at-a-glance table** at the top.
- **Automatic chat intake — this is *the* intake path, not an option.** Any report arriving in chat —
  "broken", "wrong", "failing", "missing", "doesn't work" — **is** a bug report. File it as `B<n>` in
  `report/report.md` **before you start fixing**, then fix, then close the loop in `fix/report-fixes.md`
  in the same change. The owner never hand-edits the bug files; the agent maintains both. A fix that
  never became a `B<n>` is invisible work — it leaves no root-cause trail for the next agent, and the
  status-at-a-glance table quietly starts lying.

### 4.9 Reference-research discipline
External dependencies (an API, a backend you don't own, a library's real behavior) get a doc under
`reference/<system>/`. **Label every claim**: `verified` (you tested/read the source), `inferred` (prior
knowledge / docs that may lag), or `confirm-live` (must be checked against the real system). Cite
sources. A reference doc that drives a build decision must have its load-bearing claims **verified**, not
inferred. Re-checking a `confirm-live` claim against the real system **promotes** it to `verified` (note
the date).

### 4.10 Secrets discipline + the tracking choice
- Live keys live **only** in files that are gitignored everywhere, whatever else is tracked.
- Every shareable artifact (code, plans, commits, logs, this file) uses `<PLACEHOLDER>` tokens.
- Assume anything pasted into notes/chat is **already compromised — rotate before wider sharing.**
- Subagents/workflows that read secret-bearing files can leak keys into their output — **redact after.**
- A credential **known to be leaked is burned** — blacklist the exact value and never reuse it anywhere,
  even rotated into a new home. (Distinct from routine rotation of a still-trusted key.)
- **The tracking choice (a named knob, decided at scaffold):** the framework's *default* is to TRACK
  `ai_context/` in the project repo — plans travel with code. An org that treats intent + design as
  IP more valuable than the code may take the **opt-out**: gitignore all of `.claude/`, keep disk as
  the source of truth, and arrange an out-of-band backup (an untracked tree has **no** remote copy —
  a pushed repo does not protect it). Record which applies in the Local-binding appendix and honor it
  in the scaffold's first commit.

### 4.11 Quality gates (pick the stack's equivalents)
State them once in `CLAUDE.md` and enforce in CI. The shape, not the specifics: **format · lint ·
typecheck/compile · tests** green before push; a **pre-commit secret scan** (e.g. gitleaks) so a key
can't be committed; and any **budgets that matter** (bundle size, latency, binary size) as CI gates.
The lint-warnings-zero / bundle-budget specifics are one project's choices — translate, don't copy.
**Where components share a contract, that shared schema is the test boundary** — assert they agree
against the same schema, not hand-written fixtures (skip this if nothing is shared).

### 4.12 Versioning lifecycle (freeze → open, and what counts as a new version)
- **Small additive work** = append the next-numbered build file to the **current** `vN/implementation/`.
- **A big feature that demands its own plan** = open `v(N+1)/` — even if `vN` is mid-flight. Never
  cram two big features into one version; two blueprints in one GRANDPLAN is how both go stale.
- When `vN` **ships**: snapshot its `STATUS.md` to "shipped," write a short **freeze note** (what
  shipped, carry-over decisions still in force), then create `v(N+1)/` with the identical layout — a
  fresh `GRANDPLAN.md` + `implementation/`. The new version's `DECISIONS.md` opens with a
  **carry-over** block listing the still-binding earlier decisions instead of copying them.

### 4.13 Detour protocol (impromptu work between build files)
Work that arrives mid-version — a feature the owner thinks of in chat, a refactor you discover you need
— must never become invisible code drift. **Before writing any code:**

1. **Classify it.** Is it a **bug** (→ §4.8, file a `B<n>`), a **decision** (→ §4.5, file a `Dn`), or a
   genuine **detour** (new scope)? Only the third path continues here.
2. **Create or revise a build file FIRST.** A detour gets a real `NN_<slug>.md` under the current
   `implementation/`, to the §4.4 contract. Never "just build it and write it up after."
3. **Renumber the not-started future files** so build order stays honest. Files in progress or done keep
   their numbers — renumbering finished history is how links rot.
4. **Update `00_INDEX.md` + `STATUS.md` before the first line of code.** The INDEX gains the file under
   its milestone and a line in its detour section; STATUS moves its cursor and logs the detour under
   *Detours / scope-changes*.
5. **Patch `GRANDPLAN.md` if intent changed.** A detour that alters *why* the thing exists or *how it
   behaves* is a design change — amend the relevant `§N.M` in the same pass. A detour that only adds
   mechanics leaves GRANDPLAN alone.
6. **Revalidate the next planned build file before resuming.** Re-read it and mark it `still-valid`,
   `needs-edit`, or `obsolete` — then act on the mark. A detour silently invalidates the plan it
   interrupted; this step is the only thing that catches it.

**The test:** after a detour, a fresh agent reading `00_INDEX → STATUS → build file` can reconstruct what
happened and why, with zero memory of the chat it came from.

### 4.14 Design-source discipline (the design lives outside the repo; the plan takes it in)
A **design source** is the owner's visual intent, made in a design tool rather than in code — a
**Claude Design** project (claude.ai/design) is the native case; a handoff bundle, a Figma export or
a hand-drawn spec count the same. It is optional: a project with no design source builds its
surfaces to pixels from GRANDPLAN and shows them early. When one exists, these rules bind:

1. **Import verbatim, one dated folder per import.** `ai_context/design/<YYYY-MM-DD>_<slug>/` holds
   the bundle exactly as exported. Never edit an import. A changed design is a **new** import, diffed
   against the previous one.
2. **`design/README.md` is the map** (§6.11): source project + owning account, the route that brought
   it in, the import log, the **screen map** (artboard → repo files → build file → state), the
   measurement record, and what was deliberately not taken. The bundle's own `github.md` seeds the
   screen map; the README keeps it true.
3. **Read the source; do not render it.** Dimensions, colours and layout are in the HTML/CSS. Open
   the primary file, follow its imports, read top to bottom. Screenshot only when the owner asks.
4. **Pull it into the plan.** GRANDPLAN gets a `§3.1 Design source` block: the token table as
   taken **and** as measured, the surfaces mapped to artboards, and the list of what was not taken.
   Build files that implement a surface carry a `Design ref:` line naming the artboard(s) (§4.4).
5. **Measure before the first line of CSS.** Artboard values are a proposal. Run every foreground
   against every ground it can land on — including stacked cases a mockup never draws — against the
   project's contrast floor. Fix failures with the **minimum** correction, keep the designer's hue,
   record value + ratio beside the token and in §3.1. Ask whether a failure is a **principle**, not
   a value (the word on a fill is a theme property, not a constant).
6. **Mockups carry invented data.** A number, state or list the app cannot source does **not**
   ship; the honest version does. The prototype's runtime (`support.js`, custom elements, hover
   attributes) is read for intent and never shipped or imitated.
7. **Drift runs both ways.** Design changed → re-import (rule 1), diff, and treat the delta as a
   §4.13 detour: revalidate the build files it touches. Code diverged on purpose → record it in
   §3.1 (and a `Dn` if it is a decision); if the tool supports writing back, push the corrected
   preview so the source stops lying. Writing to a live design project is touching the owner's
   data: name the exact paths first, one component at a time, never a wholesale replace.
8. **It is an intake, not a gate.** `design/` never blocks a build or a deploy, holds no house
   style, and is not a ledger of past looks. The owner's direction enters through it; craft stays
   with the agent.

---

## 5. Improvements baked in (deltas from the source methodology)

1. **`reference/` standardized** with a **verified/inferred/confirm-live** label convention (§4.9).
2. **`TEMPLATES/` folder** — ship skeletons so every new version/build file/bug entry is shaped identically.
3. **One consolidated Authority order** (§4.2), including `STATUS > CLAUDE.md status-line` and `live-verified > inferred`.
4. **Explicit decision `state` machine** with a **`superseded`** marker (§4.5) — fixes silent drift (auth provider / model-id swap).
5. **Drift scan on version-open** (§4.1) — a named ritual.
6. **Freeze ritual + carry-over block** (§4.12).
7. **Build-file front-matter / depends-on** formalized (§4.4).
8. **Glossary + ID conventions** (§7).
9. **"Stable vs living vs append-only vs cursor"** typing of every artifact (§3).
10. **Detour protocol** (§4.13) — impromptu work re-enters the *plan* before it enters the *code*, and
    revalidates whatever it interrupted.
11. **Automatic chat-bug intake** (§4.8) — a complaint in chat becomes a `B<n>` before it becomes a fix.
12. **Separate-repo `01_BUILD_PROMPT.md`** (§6.10) — contract handoff for components built in their own
    repo, with the shared schema as the cross-repo test boundary.
13. **Upgrade-versioning rule promoted into §4.12** (2026-08-23) — "small additive appends a build file;
    a big feature opens `v(N+1)` even mid-flight" previously lived only in the 00_INDEX template.
14. **Design source slot** (2026-09-18) — `ai_context/design/` + `design-README.md` + §4.14: a design
    made outside the repo (Claude Design first) is imported verbatim, mapped screen-by-screen,
    measured before CSS, cited by build files, and re-imported on change. Optional per project.

---

## 6. Templates — the skeletons and their contracts

The copy-paste skeletons live in `TEMPLATES/` beside this file (copied into each project's
`.claude/TEMPLATES/` at scaffold). Each replaces every `{{SLOT}}`; the Local-binding appendix supplies
the org's values (host, package manager, deploy target, auth, cadence). Keep `CLAUDE.md` short —
depth belongs in `ai_context`. One stub per template below; the file is the authority on its shape.

### 6.1 `CLAUDE.md` (root)
The project's stable rulebook: one-screen facts, the non-negotiables **filled from the binding at
scaffold time**, architecture-in-one-screen, the resume pointer, a status line that defers to
`STATUS.md`. Global rules stay in the *global* rulebook — this file never restates them.

### 6.2 `ai_context-README.md`
The map: what lives where, the sync rule, the authority order, the resume protocol, the tracking
choice actually taken (§4.10), and where live secrets actually live (never here).

### 6.3 `GRANDPLAN.md`
The blueprint: `§0 Owner Decisions` (mirror of DECISIONS) → problem & primary user → goals/non-goals
→ architecture → deep design `§4…§N` → Open Questions (`Qn — blocks <what> — **Rec:** inline`).

### 6.4 `00_INDEX.md`
Entry point + resume order + build files grouped by milestone + gating + detour section + the §4.12
upgrade-versioning rule + conventions. Links to GRANDPLAN §, never duplicates it.

### 6.5 `NN_build.md`
One buildable chunk to the §4.4 contract. The template's steps are an *example shape* — replace them
with the project's real ones; keep the section skeleton.

### 6.6 `STATUS.md`
The live cursor: version, phase, current focus, the single next action, blockers, session log.
Cadence per §4.7 and the binding.

### 6.7 `DECISIONS.md`
Append-only ledger to the §4.5 state machine, with the carry-over block for `v2+`.

### 6.8 `bug-report.md` + `bug-fix.md`
The two-file tracker (§4.8): inbox with status-at-a-glance table; ledger in lockstep.

### 6.9 `reference-README.md`
The research convention (§4.9): one folder per external system, every claim labelled, sources cited.

### 6.10 `BUILD_PROMPT.md` — separate-repo components only
A component built in its **own** repo keeps its build prompt *here*, at
`ai_context/<component>/01_BUILD_PROMPT.md`. It is a **contract handoff, not a plan**, and carries:
what the component is and the one job it does · the **shared schema** both repos import (name it
exactly — this is the cross-repo test boundary, §4.11) · the API surface it must expose · the
non-negotiables it inherits from this project's `DECISIONS.md` (quote their `Dn` ids) · what it must
**never** assume about its caller · done-when. The other repo scaffolds its own framework tree *from*
that prompt. The two stay honest by asserting against the same schema — never hand-written fixtures.

### 6.11 `design-README.md` — only when a design source exists
The map for `ai_context/design/` (§4.14): source tool + project + owning account · the route used ·
the import log (one dated folder per import, newest first) · the **screen map** (artboard → repo
files → build file → state) · the measurement record (floor, script, date, pairs failed and how they
were corrected) · what was deliberately not taken (runtime, invented data, reference-only boards) ·
any write-back to the live project. Created at scaffold step 8 or on the first import, whichever
comes first; the bundle folders beside it are archive.

---

## 7. Glossary & ID conventions

- **`vN`** — a development version; `v1` is first. Each `vN/` has the identical layout. Freeze on ship.
- **`GRANDPLAN.md`** — the blueprint (why + deep design), numbered `§N.M`.
- **build file** — `NN_<slug>.md` in `implementation/`, flat & numbered, in build order.
- **milestone** — `M<major>.<minor>` (e.g. `M2.0`); groups build files in the INDEX; has gating.
- **decision ID** — `Dn` (v1), `V2-Dn`, `V3-Dn`, … Append-only; states `proposed/locked/superseded`.
- **decision tags** — `lock-before-<milestone>` (gating) and `tune-at-build`.
- **STATUS cursor** — `STATUS.md`; the single source for "where are we now."
- **status vocab (bugs)** — `open/investigating/fixed/external/by-design/wontfix`.
- **`--polished`** — a bug report already cleaned up; don't re-polish.
- **confidence labels (reference)** — `verified/inferred/confirm-live`.
- **authority order** — DECISIONS > build files > GRANDPLAN deep design > CLAUDE.md prose; STATUS >
  CLAUDE.md status; live-verified > inferred.
- **detour** — impromptu scope arriving mid-version; enters via §4.13 (build file first, then code).
- **revalidation mark** — `still-valid` / `needs-edit` / `obsolete`, applied to the next planned build
  file after a detour (§4.13 step 6).
- **`B<n>`** — a bug-report id in `bug/report/report.md`; filed *before* the fix, never after (§4.8).
- **binding** — the Local-binding appendix at the bottom of this file: the org's overrides. Present in
  private copies; deliberately absent from published ones.
- **framework home** — where the canonical copy of this file + `TEMPLATES/` lives for the org (named
  in the binding); projects carry copies, the home is the master.
- **design source** — the owner's visual intent made outside the repo (Claude Design project, handoff
  bundle, Figma export); imported verbatim under `ai_context/design/` (§4.14). Optional.
- **import** — one dated folder `design/<YYYY-MM-DD>_<slug>/`; never edited, superseded by the next.
- **artboard** — one screen/file inside an import (Claude Design exports `<Screen>.dc.html`).
- **screen map** — the table in `design/README.md`: artboard → repo files → build file → state.
- **Design ref** — the line in a build file naming the artboard(s) it implements (§4.4, §4.14).

---

## Appendix — worked instantiation
Distilled from a desktop AI assistant + centralized service: one named non-technical principal (50+,
non-English locale, simplicity above all); imprint hard-rule enforced by a `no-raw-mission-string` lint
+ frozen branding constant; native shell + web UI (one repo) + serverless service (separate repo, built
from a `01_BUILD_PROMPT.md`), shared schemas vendored; a sensitivity gate (data-classification zones)
nothing may bypass, distributed client carries ZERO secrets, bundle-size CI gate, encryption at rest;
`v1` frozen-on-ship → `v2`, `V2-D…` decisions + carry-over; a real supersession = auth provider + primary
model id changed mid-project (exactly what §4.5's `superseded` marker exists for).

> Lesson encoded: the parts that hurt were **drift** and **re-litigation**. §4.1, §4.2, §4.5 are the guards.

---

## Local-binding appendix

Each adopting org keeps its own **local overrides** appendix here — deploy target, secrets location,
auth stack, STATUS cadence, quality-gate specifics, and any house rules that survive 100% adoption of
the framework above. Keep it *below* this line so everything above stays project-agnostic and
portable. **Published copies ship the spec only** — the binding is internal ops and never leaves
private storage.

This repo ships the spec only; the maintainer's own binding appendix is intentionally not published.
