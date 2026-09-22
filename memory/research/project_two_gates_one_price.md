---
name: project-two-gates-one-price
description: "Two Gates, One Price — Indonesia-facing policy brief on the 2026 Hormuz/Bab al-Mandab chokepoint crisis, in Downloads\\Research Reports\\Middle East - Iran\\Chokepoint-Brief"
metadata: 
  node_type: memory
  type: project
  originSessionId: c70d62a4-2aa7-4891-a5fd-e179582766e2
  modified: 2026-08-01T05:43:56.710Z
---

Independent policy brief **"Two Gates, One Price: Indonesia's exposure to the
Hormuz–Bab al-Mandab crisis, and the limits of supply diversification"**, 30 pp A4,
built 1 August 2026 at
`Downloads\Research Reports\Middle East - Iran\Chokepoint-Brief`.
Byline **Rivaldo Harviansyah / Independent Research** — same convention as
[[project-china-outlook-brief]], not Kemlu.

**Deliverable set (all five, as asked):** PDF + DOCX + 22-slide PPTX + A3 infographic
(PDF and PNG) + full sources. Built from six EIU Viewpoint exports dated 8–29 July 2026,
same **no-text-layer** problem as every EIU custom export — 29 pages transcribed visually
from 170 dpi renders.

**The framing decision, chosen over a straight chokepoint analysis:** the transmission
spine terminates in Indonesia — US–Iran contest → two gates → price/freight/insurance/
routing channels → Indonesian fiscal, external, household and export exposure → response.
Core diagnosis: **Indonesia's volume exposure is partial (~20–25% via Hormuz) but its
price exposure is total**, because crude is priced off one global benchmark. Jakarta's
2026 response (Perpres 26/2026, Russian crude, LPG rerouting) secures barrels, which was
never the binding constraint. Named recommendation framework is **"the Ballast Agenda"**
(fiscal / physical / market / institutional ballast) — "you cannot calm the sea, you can
stabilise the vessel". Against the China brief's "Symmetry Agenda" and the Indonesia
brief's "Four Anchors".

**New reusable piece worth keeping: `src/content.py`.** It parses `brief.html` into a
flat block model (runs, tables, figure names, box/closing regions), and the DOCX, PPTX
and infographic generators all read from it. Previously each format re-typed the content
and drifted. Note `content.norm()` — brief.html is hard-wrapped for editing, so raw run
text carries newlines that show up in Word unless collapsed.

**Pipeline** (`src/make.py`, a Python driver rather than PowerShell — avoids the PS 5.1
stderr-to-ErrorRecord trap entirely): `charts.py` → `build.py` → `topdf.py` → `stamp.py`
→ `toc.py` → optional second pass → `proof.py`. `cover_art.py` runs separately.

**Photographic cover** (he supplied `pexels-photo-36563592.avif`, a tanker foredeck at
sunset). `src/cover_art.py` bakes a **vertical navy scrim into the JPEG** rather than
using a CSS gradient — Chrome's print path bands large gradients over images. The ramp is
light over the sky so the sun survives and heavy below the horizon so white type reads;
title sits in the lower half. Four crops are emitted for the four aspect ratios
(A4 cover, 16:9 deck, infographic banner, and a lighter-scrim DOCX band, since Word
cannot hold text over a full-bleed image without anchoring tricks that wreck editability).
Pillow reads AVIF natively here. `build.py` base64-embeds any `url("x.jpg")` in the CSS,
because the stylesheet is inlined into `out/` and a relative path would resolve wrongly.

**Five traps hit on this build:**
1. matplotlib `titleblock` offsets must be in **points, not axes fractions** — a gap that
   looks right on a tall chart collapses on a short one and the subtitle lands on the title.
2. The `{{FIG:name}}` placeholder regex matched **its own documentation comment** at the
   top of brief.html and tried to load `name.svg`.
3. Regenerating the SVGs does not change a proof HTML that already inlined the old ones —
   the PDF came out byte-identical and looked like a caching bug. Rebuild the HTML too.
4. Auto-resolving the contents page numbers by searching for **headings** resolves every
   entry to the contents page itself. Search for a phrase from each section's
   **standfirst** instead — those appear exactly once.
5. Charts that carry their own title inside the SVG must not repeat it in the HTML
   `figcaption`; ten captions printed the headline twice before this was caught.

**Verification convention he expects** (`data/verification.md`): every source conflict
surfaced rather than smoothed, every figure read from a chart plate rather than a table
listed, every thin-evidence claim flagged, and — importantly — the "corrections made"
section must record what *actually* changed during drafting, not a plausible-sounding
narrative. Two real EIU conflicts here: the MoU collapse date (13/14 vs 17 July) and the
2026 supply loss (5.8m b/d in the prose vs 6.1m b/d in the table; 5.8 is the *percentage*).
