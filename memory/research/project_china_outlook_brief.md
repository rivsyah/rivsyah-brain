---
name: project-china-outlook-brief
description: "China Outlook 2026-2030 policy brief, byline Rivaldo Harviansyah, Indonesia-facing, built from an EIU Viewpoint PDF with no text layer, in Downloads\\Research Reports\\China Outlook"
metadata: 
  node_type: memory
  type: project
  originSessionId: 086940db-4b36-4f51-9c8e-86a8207f310d
  modified: 2026-09-01T02:28:52.060Z
---

Independent policy brief **"China's Economic Outlook 2026–2030: The Export Offensive and
Indonesia's Exposure"**, 34 pp A4, built 27 July 2026. **Moved:** now at
`Downloads\Research Reports\China Outlook\China-Outlook-Brief` (the whole DEI\ tree was
reorganised into Research Reports\; the EIU source PDF is in the sibling `Sources\` folder).

**Byline is his own name, "Rivaldo Harviansyah" — not "Ignited Research"** (he changed it on
28 July 2026 so it would carry his name on LinkedIn). Original figures and tables credit
"Source: author's analysis". This differs from [[project-indonesia-outlook-brief]], which still
carries the Ignited Research imprint. Either way, explicitly not Kemlu.

**Deliverable set is wider than the Indonesia brief:** PDF + DOCX + **PPTX deck** +
**A3 infographic (PDF and PNG)** + full sources. Aldo asked for all five.

**The deck was rebuilt on 31 Aug 2026 as a 23-slide pptxgenjs deck with NATIVE PowerPoint
charts** (`src/make_deck_rich.js`, node; replaces the image-based `make_deck.py` in `make.ps1`).
Key pptxgenjs trap that cost a debug cycle: setting `dataLabelPosition: "outEnd"` in the GLOBAL
options of a combo chart writes it into the line series too, and outEnd is invalid for line
charts — **PowerPoint refuses to open the file** while python-pptx and the skill validator both
pass it. Put data-label options on the bar entry only. Also: pptxgenjs draws no legend unless
`showLegend: true` (legendPos alone does nothing), and PowerPoint COM export is the only local
PDF renderer (no LibreOffice, no pdftoppm on this machine).

**The framing decision, which he chose over a straight country outlook:** the transmission spine
terminates in Indonesia, not in China — root cause → policy choice → transmission → redirection →
Indonesian exposure → response — because no Indonesian reader sets Chinese policy. The named
recommendation framework is **"the Symmetry Agenda"** (four streams), against the Indonesia brief's
"Four Anchors". Core diagnosis: the problem is not the volume of trade with China but the
**asymmetry of adjustment speed**.

**Reusable pipeline** (`src/make.ps1`): `cover_art.py` → `charts.py` → `build.py` → headless Chrome
`--print-to-pdf` → `stamp.py` → `make_docx.py` → `make_deck.py` (python-pptx) →
`make_infographic.py`. Two new tools worth keeping: **`contact_sheet.py`**, which crops the heading
band from every page and stacks 20 per image so a 245-page text-layer-less PDF can be navigated in
13 reads instead of 245; and **`proof.py`**, which renders the built PDF back to PNG for proofing.

**Three build traps, all of which cost a rebuild:**
1. `2>$null` on headless Chrome in PS 5.1 turns stderr into ErrorRecords and, with
   `$ErrorActionPreference = "Stop"`, kills the build before the PDF is written.
2. `--print-to-pdf` returns before the file is complete — **delete `_raw.pdf` first**, then wait for
   the size to stabilise, or `stamp.py` ships a PDF one build behind and it looks fine.
3. matplotlib parses a matched pair of `$` as mathtext: "US$22bn … US$8bn" became an italic
   formula. Escape every dollar sign in generated plates.

**What was different about this EIU export vs the Indonesia one:** same no-text-layer problem, but
this file also has **no outline and no link annotations**, so the TOC could not be mapped
programmatically at all.
