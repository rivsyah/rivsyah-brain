---
name: project-two-clocks-one-drought
description: "Bought and Sold (30pp, Ignited Research) — v2 rerun of the El Niño brief in Downloads\\Research Reports\\Bought and Sold; verify.py hard gate caught 8 real defects before render"
metadata: 
  node_type: memory
  type: project
  originSessionId: 0d34b9a7-25d0-462c-952c-0099b94c93d2
  modified: 2026-08-02T14:49:30.486Z
---

**Bought and Sold: Indonesia's Two-Way Exposure to the 2026–27 Super El Niño**,
30 pp A4, built 2 August 2026 at `Downloads\Research Reports\Bought and Sold`.

**Retitled after delivery.** Shipped first as *Two Clocks, One Drought*; Aldo asked for
alternatives and chose **Bought and Sold**. The trigger is worth remembering: his last three
briefs were *Two Gates, One Price* / *One Price, Two Ledgers* / *Two Clocks, One Drought* — the
numeric-pairing title had become a house tic, and naming that was more useful than any single
alternative. **The title now describes the STRUCTURE (Indonesia buys the rice, sells the palm
oil); the internal "two clocks" metaphor still carries the TIMING** and is set up in the first
line of the executive summary. Complementary, not redundant — do not collapse them. The
framework is still **the Two Clocks Agenda**. Retitling touched `content.py`, `cover_art.py`,
`stamp.py`, `styles.css`, `proof.py` and the folder name; all script paths are HERE-relative so
the rename was safe and the gate passed unchanged.
**Publisher Ignited Research** (v2 master prompt reverts to the imprint; byline still
Rivaldo Harviansyah). **PDF only** — Aldo took the v2 default rather than the full five-piece
set he'd taken on every previous brief. Framework: **the Two Clocks Agenda**
(Sync / Extend / Unfix / Pre-commit).

**This is a rerun, not a revision, of [[project-el-nino-brief]].** Same four sources, new
architecture. Kept in a separate folder deliberately; the v1 "Both Sides of the Drought" (36pp)
still stands.

**What the v2 prompt actually changed, in order of value:**
1. **`content.py` as single source of truth** + **`verify.py` as a hard gate that runs BEFORE
   Chrome**. This is the whole point. It directly fixes the v1 failure where `make_deck.py` and
   `make_infographic.py` hardcoded a corrected figure and shipped a stale number.
2. **Dated falsifiable calls** (6, each with date + threshold + consequence) replacing v1's
   generic falsification table. C3 resolves within days of publication — July CPI.
3. **Mandatory §5a disclaimer verbatim**, its own page after the cover, with the
   forward-looking-statements clause repeated under the calls table.
4. Phase 0 scope memo as the single approval checkpoint — worked well, one stop, then autonomous.

**The gate caught eight real defects before any PDF existed.** Worth repeating verbatim as the
argument for building it: ENSO used before definition; four disclaimer clauses "missing" because
the check searched raw markup instead of stripped text; ~25 spurious unknown-figures because the
number sweep read subsection headings, document IDs and Indonesian comma-decimals in reference
titles; a regex backtracking bug where `51.6m` failed the trailing lookahead and fell back to a
bogus `51`; and — the good one — **eight plates printing their headline twice**, once as the
numbered caption and once as an axes title. Added check 3b (compare caption against the SVG's
`<text>` nodes) so it cannot regress; it then immediately caught Figure 12's banner too.

**New research finding that the extra day of cutoff bought (v1 cut off 1 Aug, v2 on 2 Aug):**
**BMKG's own intensity figure is circulating in three inconsistent forms** — 62% *strong*
(own release, 10 Jun, under Kepala BMKG Teuku Faisal Fathani), 98% *strong* (via DEN from a
29 May slide), 75% *very strong* (national press, 29 Jul). Only the first is traceable. I
briefly told Aldo the agencies had converged, then checked BMKG's own site, did not find the
75%, and **corrected myself in the next message**. That became Box 1 and it is a stronger
finding than v1's two-agency gap. **Lesson: verify a secondary attribution against the named
agency's own output before letting it change a recommendation.**

**Also new vs v1:** GAPKI's 28 July outlook quantifies the export squeeze precisely —
2026 production growth **below 2%**, exports to "decline significantly", and B50 adding
**1.9m t** of CPO demand over B40 to ~14.6m t. That turns Section IV from a mechanism into
arithmetic.

**Kept from v1** (all still load-bearing): the coverage gap (Bapanas cover to May 2027 vs the
ECB-cited peak effect in late 2027/H1 2028 — two stated horizons that don't overlap); the
volatile-food *direction* correction (fell 6.24→5.58, held back by rice); the IHPB pipeline
(6.51% vs CPI 3.34%); core ex-gold at 1.86% proving the 100bp was currency not demand; the MBG
school-holiday natural experiment.

**Reusable:** `sources/dossier.md` + `layer2.md` + `layer3.md` were copied straight over — Phase 1
transcription of text-layer-less EIU exports is genuinely a one-time cost across briefs.
