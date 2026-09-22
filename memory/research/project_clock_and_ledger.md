---
name: project-clock-and-ledger
description: "The Clock and the Ledger (36pp) — Aschenbrenner/Situational Awareness scorecard brief in Downloads\\Research Reports\\Situational Awareness\\SA-Brief; first English CIO-voice brief, first with an automated verify gate"
metadata: 
  node_type: memory
  type: project
  originSessionId: 65a3ef19-e759-44d2-b147-9277c9ac0ebb
  modified: 2026-08-01T17:09:11.276Z
---

**"The Clock and the Ledger: Leopold Aschenbrenner's *Situational Awareness* two years on"**,
36 pp A4, built 1 August 2026 at
`Downloads\Research Reports\Situational Awareness\SA-Brief`.
Byline **Rivaldo Harviansyah / Independent Research**, but the voice is **hedge-fund CIO**, not
policy analyst — a different register from [[project-two-gates-one-price]] and
[[project-el-nino-brief]]. Deliverables: PDF + A3 infographic (PDF/PNG) + 25-slide PPTX + full
source. No DOCX this time.

**Topic went live mid-build.** Aschenbrenner's fund was forcibly deleveraged ~30 July 2026 — two
days before the publication date — so the brief became a case study rather than a retrospective.
Aldo chose "central case study" when asked how to treat 48-hour-old reporting.

**The finding that carried the whole document, and it fell out of the data rather than being
imposed:** scoring 30 claims from the 2024 essay gives **17 physical/capability claims → 12
confirmed, 0 falsified**, and **13 capital/sovereign claims → 0 confirmed, 7 falsified**. Right
about the physics, wrong about the politics, positioned as though right about both. Framework
named **the Four Ledgers** (Physical / Capability / Capital / Sovereign), against the Ballast
Agenda and Symmetry Agenda of the earlier briefs.

**No primary data was supplied**, unlike the EIU-pack briefs. The substitute differentiator was an
original **scorecard in `sources/scorecard.csv`** — 30 claims, fixed four-level rubric, a source
per row — which is the data spine for the waffle, the heatmap, the gauges and Annex A. Worth
reusing whenever there is no client pack: it is reproducible, it makes the argument falsifiable,
and it is labelled as analyst judgment in the scope note.

**New and worth keeping: `src/verify.py`, a consistency gate wired into `make.py`.** It fails the
build if prose counts drift from `scorecard.csv`, if a `<sup>` citation has no reference, if more
than four references go uncited, if a placeholder survives, or if arithmetic asserted in the text
does not recompute. It caught two real defects. Previous builds relied on reading proofs.

**Four build traps, three of them new:**
1. **Cross-references must resolve BEFORE block expansion.** A nested `{{TBLN:…}}` inside a figure's
   source string terminated the non-greedy `{{FIG:…\|…\|…}}` match early and silently truncated the
   caption, spilling stray text into the page. Scan for numbers first, substitute, then expand.
2. **The cover `<div>` must not exceed the content box** (297 − 20 − 22 = 255 mm). At 257 mm it
   spilled a blank page 2 that looked like a stray page-break.
3. **`tbody tr { page-break-inside: avoid }`** — a scorecard row split mid-sentence across the
   Annex A page break. Also needs `thead { display:table-header-group }` to repeat headers.
4. Inherited and still true: figure/table numbers by document order, not filename; contents resolve
   by **standfirst** phrase not heading; re-run `build.py` after `charts.py`.

**EB Garamond is not on this machine.** Monotype Garamond (`GARA.TTF`) is, and is what the design
system uses for body and display, with Cambria for data labels and tables. Charts carry **no
internal title** — the `<figcaption>` owns it, which removes the duplicate-title trap entirely.

**Sourcing convention held up under a fast-moving story.** Box 3 + Table 2 carry the figures that
do not reconcile rather than harmonising them. One real correction: a 13F-derived analysis called
Anthropic's Series H a "$65bn valuation" — the company's own statement says $65bn *raised* at
$965bn *post-money*, a ~15× error in implied ownership.

**Second edition, 2 Aug 2026 — 38pp, 15 exhibits, 58 refs.** Aldo supplied a 7-page filings-derived
paper (SEC 13F-HR Q1 2026 + 13G for Nebius) as WhatsApp images in
`Research Reports\Situational Awareness\sources\`; transcribed to `sources/layer2-filings.md`.
Also asked to drop "Chief Investment Officer & Research Lead" from the byline — he wants name +
Independent Research only.

**The lesson worth carrying: a reconciliation that merely restores coherence is not evidence.**
The first edition proposed that $45bn was a *gross levered* book against a $20–24bn NAV, labelled
as inference. The filings say $45bn was **peak AUM at 1 July 2026**. The inference was wrong, and
it was wrong in the specific way the house method exists to prevent — it made the numbers agree
without a source saying so. Retracted in Box 3 and Annex B rather than quietly edited. **When
sources conflict, leave the conflict; do not offer a tidy mapping.**

**Three other things the filings overturned:**
1. The book was **not long-only-with-hedges** — puts were ~62% of reported notional vs 28% long
   equity. Both legs lost because capital rotated *out of* AI infra *into* large-cap software and
   semis, which is exactly where the shorts sat.
2. "Prices were depressed by the seller, not by news" was **too strong** — Microsoft reported that
   same session (Azure +43%, shares +16%). Two independent drivers.
3. Nebius was ~40% of the long book (~$2.6bn, 13G filed 27 May); the earlier concentration
   percentages predated that disclosure.

**New original finding worth reusing as a move:** ~$41bn of the $45bn peak was *contributed
capital*, not compounded return (+1,551% on $225M ≈ $3.7bn). So most investor dollars arrived near
the top and ate the −67% without the gain — dollar-weighted return far below the headline. Falls
straight out of the source's own figures; nobody else drew it.
