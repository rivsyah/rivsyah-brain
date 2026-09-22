# {{PROJECT}} v1 — Implementation Guide · Index

> The actionable build guide, born from `../GRANDPLAN.md` (referenced by §, never duplicated).
> Authority: `DECISIONS.md` is final; for build specifics follow these files; GRANDPLAN for rationale.

## How to resume (after any context loss)
1. Root `CLAUDE.md` — project rules + locked-decision mirror. (Global rulebook loads before this.)
2. **You're reading `00_INDEX.md`** — the entry map.
3. `STATUS.md` — the live cursor: current file, done, next action, blockers.
4. Open the build file STATUS points to; work its checklist.
5. `DECISIONS.md` before reopening any settled question; a GRANDPLAN § for deep design.
**Tick boxes + update STATUS as you go ({{cadence from binding — default: end of session}}).**

## Build files (flat, in build order)
**M1.0 — {{Skeleton}}** *({{repo + CI + verifiable health surface first}})*
- `01_{{skeleton}}.md` — {{repo + deploy + health check}} · §{{GRANDPLAN ref}}
- `02_{{auth}}.md` — {{auth per binding}} · §{{ref}}

**M1.1 — {{Core}}**
- `03_{{feature}}.md` — … · §{{ref}}

> Frontend projects: when a design source exists (`../../../design/README.md`, §4.14), build each UI
> chunk FROM its artboards and name them in the chunk's **Design ref**; otherwise build to pixels from
> GRANDPLAN. Either way screenshot early and show the owner — he redirects on pixels. No design gate,
> no shape brief, no ban list (removed 2026-09-02); the design source is intake, not a gate.

## Detours (§4.13 — impromptu scope that arrived mid-version)
- {{none yet}}

## Milestone gating (read before jumping ahead)
- M1.0 first because {{reason}}. M1.1 needs {{decision X locked}}. "Blocked on a decision, not
  effort" is a valid surfaced state.
- {{binding chunking rule — e.g. no calendar dates; chunk by scope, loop till done}}.

## Upgrade versioning (mirror of §4.12)
- **Small additive** = append the next-numbered build file to this `v1/implementation/`.
- **Big new feature demanding its own plan** = open `../../v2/` (then `v3/`…), even if v1 is
  mid-flight. Never cram two big features into one version.
- On version **close/ship:** freeze (snapshot STATUS shipped) + carry still-binding decisions into
  the next version's DECISIONS.md **carry-over** block.

## Conventions
- Each build file: goal → depends-on → steps → `- [ ]` checklist → key files → done-when. Keep
  STATUS in sync.
- Link to a GRANDPLAN § rather than duplicating it. Locked decisions override stale wording.
