---
name: project-one-price-two-ledgers
description: "Two Gates, One Price (v2) — rerun of the chokepoint brief under the Master Prompt v2 (Ignited Research, content.py + verify.py gate), in Downloads\\Research Reports\\Two-Gates-One-Price"
metadata: 
  node_type: memory
  type: project
  originSessionId: c70d62a4-2aa7-4891-a5fd-e179582766e2
  modified: 2026-08-02T02:07:30.825Z
---

**"Two Gates, One Price: Indonesia, the Hormuz–Bab al-Mandab crisis, and why export
windfalls cannot pay the subsidy bill"** (retitled back from "One Price, Two Ledgers"
at Aldo's direction on 2 Aug 2026; the interim title is now the banned token in verify.py), 34 pp A4 + DOCX + 22-slide deck + A3
infographic, built 2 August 2026 at `Downloads\Research Reports\Two-Gates-One-Price\`
(sources\, src\, out\ per the v2 folder convention). This is the **v2 rerun** of
[[project-two-gates-one-price]] under Aldo's **Master Prompt v2**; the v1 project stays
untouched at its own path.

**What v2 changed and why it matters for future briefs:**
- Publisher lockup is **"Ignited Research · Independent Analysis"** (independent; non-partisan) and must be identical in every deliverable — cover imprint, PDF running header, deck title + closing slide, infographic kicker + footer, DOCX cover. Canonical values live in content.py (PUBLISHER, PUBLISHER_DESC, LOCKUP, AUTHOR, AUDIENCE). **verify.py enforces it**: the retired brand "Independent Research" is a banned token in the PDF, and the gate also opens the built PPTX/DOCX to check publisher, descriptor, retired-brand-absence and byline. Aldo flagged branding drift twice — a deck closing slide shipped with the old brand before these checks existed.
- **Mandatory §5a disclaimer page** verbatim after the cover, plus a condensed one-liner
  on the deck title/closing slides and the infographic footer, and a condensed
  forward-looking-statements footnote on the falsifiable-calls page. Non-negotiable.
- **The deck is data-dense, 33 slides**, built by make_deck.py from a separate
  **deck_charts.py** (wide 16:9 charts at 200 dpi, larger type and heavier
  annotation than the A4 print figures) plus reused structure diagrams from
  figures_png. Includes KPI grids, three wide data tables with parameterised
  row height, section dividers carrying headline stats, and a falsifiable-call
  dashboard. No LibreOffice on this machine, so slides cannot be rendered —
  check layout instead with a python-pptx shape-bounds sweep for off-slide and
  bottom-overflow shapes.
- **content.py is the single number store** (N numeric + S exact-render strings +
  CALLS + arithmetic identities); the old HTML parser was renamed **docmodel.py** to
  free the name. All formats pull from it.
- **verify.py is a hard gate wired into make.py** — build fails on: identity failures,
  missing load-bearing strings, non-sequential figure/table numbering, missing
  captions/source lines, undefined acronyms, reference count outside 40–70, missing
  key sources in the reference list, charts older than content.py, missing disclaimer
  anchors, or banned v1 tokens. On first run it caught five real defects, including two
  numbers that existed only inside vectorised SVGs (svg.fonttype="path" means chart text
  is NOT in the PDF text layer — load-bearing numbers must also appear in prose).
- **Two-sided exposure is a house rule** and produced the sharpest new finding: the coal
  counterweight *failed* in 2026 — prices +33.31% y/y (March) but Jan–May export value
  −4.95% to US$9.75bn on volumes −8.19%, so both ledgers deteriorated together. New
  Section 4.6 + Box 3 + a diverging-bar figure. Framework renamed **the Counterweight
  Agenda** ("Indonesia cannot lift the shock. It can balance it.").
- **Six falsifiable calls, each dated with a threshold** (Section VII "What would change
  our view" + a dashboard figure): Hormuz closed through 2026; Brent US$88–94; subsidy
  >Rp400trn; more deficit months; Gulf LPG <10%; price-dominates-volume.

**Traps specific to this rebuild:** the Bash-tool heredoc mangles `\\n` escapes inside
Python string literals — write edit scripts to disk with the Write tool instead of
piping them; and big HTML transformations should be **atomic scripts of asserted
replaces** (write-at-end), so a failed match aborts without half-applying.
