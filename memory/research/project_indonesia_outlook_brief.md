---
name: project-indonesia-outlook-brief
description: "Indonesia Outlook 2026-2030 policy brief (Ignited Research) built from an EIU Viewpoint PDF with no text layer, in Downloads\\DEI\\Indonesia"
metadata: 
  node_type: memory
  type: project
  originSessionId: ada3fbcf-475c-4c18-9a8d-3315eda59daf
  modified: 2026-07-26T14:50:19.758Z
---

Independent policy brief "Indonesia's Economic Outlook 2026–2030: Stability Under Strain",
35 pp A4, built 26 July 2026 at `Downloads\DEI\Indonesia\Indonesia-Outlook-Brief`
(PDF + DOCX + full HTML/CSS/matplotlib sources). Byline is **Ignited Research**, explicitly
not Kemlu — same convention as [[project-china-outlook-brief]].

**Why this matters for future work:** the EIU Viewpoint custom PDFs Aldo commissions have
**no recoverable text layer** — body text is vector glyph outlines, so PyMuPDF returns only
the browser print header. The only route is rendering pages to PNG and transcribing visually
(`src/render_eiu_pages.py`). Budget for that: ~230 pages took the bulk of the build.

**Reusable pipeline** (in `src/`): `charts.py` → `build.py` (inlines SVGs — loading matplotlib
SVGs via `<img src>` makes Chrome decode them as windows-1252 and mangles en dashes) →
headless Chrome `--print-to-pdf` (needs a fresh `--user-data-dir`, otherwise it serves a
cached stylesheet) → `stamp.py` (navy folio tab via PyMuPDF, because Chrome cannot fill
`@page` margin boxes) → `make_docx.py` (python-docx; set the font to **Garamond**, not
EB Garamond, since Word substitutes a sans for uninstalled font names).

**How Aldo wants these briefs:** transmission-logic spine rather than a list of topics; bolded
claim sentence opening each paragraph; a named recommendation framework (this one is
"the Four Anchors"); an explicit "what would falsify this analysis" section; every source
vintage date-stamped; and source conflicts surfaced rather than smoothed over — `verification.md`
in the project records each correction.

**Never write PowerShell `Get-Content -Raw | Set-Content -Encoding UTF8`** over a UTF-8 source
file: PS 5.1 reads it as ANSI and double-encodes every dash. It silently corrupted `charts.py`.
