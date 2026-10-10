---
name: reference-policy-brief-master-prompt
description: "Master prompt for Ignited Research policy briefs — v3 (10 Oct 2026) at Downloads\\Research Reports\\policy-brief-master-prompt-v3.md; v2 (2 Aug) kept beside it"
metadata:
  type: reference
  modified: 2026-10-10
---

**Current version: v3, 10 Oct 2026** — `C:\Users\rivsy\Downloads\Research Reports\policy-brief-master-prompt-v3.md`
(this machine). v2 (2 Aug 2026) stays untouched at `policy-brief-master-prompt.md` in the same folder.
Aldo pasted an older v1-style copy (with a `{{use my name Rivaldo Harviansyah}}` slot in the ROLE line)
and asked for it to be sharper, more logical, more reliable, and richer in data and visualisation.
v3 merges that copy, v2, and the lessons from the briefs in this scope.

**What v3 adds over v2:**
- Section 1 now asks for the *decision the brief informs* and a clearance tag per source
  (`public` / `cleared` / `background`). Unmarked non-public sources default to `background`.
- A five-test bar: traceable, graded, connected, visual, falsifiable.
- Phase 0 memo gains a question tree, three title candidates (no "Two X, One Y" formula titles), an
  exhibit plan table and a data inventory. It also adds one conditional stop: evidence overturns
  the governing thought.
- §5 evidence rules: source tiers T1–T4, number hygiene (same basis on both sides of a ratio,
  round once, explicit denominators, read the note before classifying a line item), evidence
  grades A–D, small-n survey rules, off-limits material, a probability scale.
- §6 spine: pyramid, transmission chain, two-sided exposure, scenarios, a counter-case box, calls
  with a resolving source (avoid policy-suppressed indicators), and recommendations with owner,
  instrument, horizon windows, cost range, trade-off and KPI, plus a traceability matrix.
- §7 adds an "At a glance" page and Annexes A (data) and B (evidence register, thin-evidence table).
- §8 is an exhibit system: density target (30 pp → 16–24 figures, 8–14 tables), action titles,
  a question → chart-form catalogue, signature exhibits, and semantic colours.
- §12 verify gate as a table. §13 build traps collected from the project cards. §14 delivery note.

**Design choice worth keeping:** English default; Bahasa Indonesia only when Section 1 asks for it
(per [[feedback-english-only-briefs]]). Lockup per [[reference-ignited-masthead]]. Standalone rule per
[[project-seventy-dollar-budget]].

**How to apply:** start every new policy brief from v3. When a build finds a new trap, add it to
§13 of v3 and to the project card, in the same turn.

**First brief built end-to-end under v3:** [[project-koperasi-merah-putih]] (*Too Big to Fail*, 10 Oct 2026,
30 pp + 24-slide deck). Its pipeline (token templates, generated tables and register, `verify.py --pdf`,
`proof.py`, `supersede.py` ledger, PowerShell-COM deck proof) is the reference implementation. Six traps
from that build were added to §13 on 10 Oct 2026.

**Reference implementation of v3:** `Downloads\Research Reports\Seventy-Dollar-Budget\src\` (10 Oct 2026).
Prose lives in `src/tmpl/*.html` with tokens (`{{n:key}}`, `{{v:key}}`, `{{a:key}}`, `{{ref:key}}`, `{{FIG|TBL|BOXHEAD}}`);
`tables.py` generates tables from `content.py`; `verify.py` has three stages (html/pdf/final) and fails any digit in the
rendered text that is not a content.py record or a structural pattern. Copy this skeleton for the next brief instead of
starting from the v2 builds.
