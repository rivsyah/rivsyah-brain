---
name: project-el-nino-brief
description: Both Sides of the Drought (36pp) — Indonesia-facing El Niño brief in Downloads\Research Reports\El Nino; verification overturned source claims, and a later source correction forced a fix to the shipped text
metadata: 
  node_type: memory
  type: project
  originSessionId: 0d34b9a7-25d0-462c-952c-0099b94c93d2
  modified: 2026-08-01T16:47:57.346Z
---

**Both Sides of the Drought: Indonesia's Two-Way Exposure to the 2026–27 Super El Niño**, **36 pp** A4,
built 1 August 2026 at `Downloads\Research Reports\El Nino\El-Nino-Brief`. Byline Rivaldo
Harviansyah, English, full five-deliverable set (PDF + DOCX + 23-slide PPTX + A3 infographic
PDF/PNG), same design system as [[project-china-outlook-brief]].

**All the DEI/brief projects have moved** to `Downloads\Research Reports\<Topic>\` — China Outlook,
Indonesia Outlook, Koperasi-Merah-Putih, Lestari Advisors, The Price of Proof, Middle East - Iran,
Terratai, Kemlu all now live there. The old `Downloads\DEI\...` paths in the other project memories
are stale.

**The framing Aldo chose:** Indonesia-facing, spine terminating in Indonesia. Thesis is the
*two-sided* exposure — Indonesia is the world's 4th-largest rice producer and one of the two largest
importers, AND with Malaysia one of two palm oil suppliers. The drought hits the CPI through rice
now and the trade account through palm oil on a 3–6 month lag, so **the two arrivals are months
apart and each stage consumes the instrument the next would have used**. Framework: **the Ballast
Agenda** (Sight / Stock / Spread / Signal).

**Two-layer evidence structure repeated from [[project-price-of-proof]] and worth keeping:**
Layer 1 = the client pack (two EIU Viewpoint articles, 10 pp, again no text layer — glyph outlines,
rendered to PNG and transcribed); Layer 2 = ~50 web-verified public facts keyed A–G with a stated
cutoff. `sources/dossier.md` + `sources/layer2.md` + `src/verification.md`.

**What was new here: verification actually overturned things, and that became content.**
- EIU's exposure plate puts Indonesia ~0.9 pp *below* target; Bank Indonesia's published CPI (3.08%
  May, 3.34% June vs a 2.5±1% corridor) puts it *above* the midpoint. Irreconcilable — reproduced
  EIU's plate and overlaid BI's series rather than picking one.
- EIU cites 81% for Nov–Jan; NOAA CPC's own 9 July discussion says Oct–Dec. Used CPC's.
- CPC 81% *very strong* vs BMKG 62% *strong* — the agency Indonesian ministries plan on is the less
  alarmed one. Became Box 1 and the brief's central planning recommendation (size on the agreed
  case, option the tail).
- The Indian export ban everyone cites was **lifted in Oct 2024**; the risk is re-imposition, not
  continuation. Changes the shape of the risk from budgetable to discrete.

**A chart title that was factually wrong got caught by doing the arithmetic.** "Every market gave
the shock back except rice" was false — Brent's net (+20.6%) ≈ rice's (+20.5%). The real signal is
*retracement*: rice handed back 26% of its gain, wheat 86%, maize 147%. Re-cut the exhibit. Worth
recomputing any claim a chart title makes.

**Two build traps beyond the three inherited from the China brief:**
1. A hand-written `index.html` that omits `<meta charset>` + the `styles.css`/webfont links renders
   the *whole* document in browser defaults. It still looks like a serif document, so it is easy to
   miss — check for the KPI tiles and navy table headers in the first proof.
2. Figure/table numbering runs on **document order**, not filename order (`f02-*.svg` was Figure 4).
   Every in-text cross-reference had to be renumbered.

Cover art is **generated procedurally** (`cover_art.py` draws a synthetic east-skewed equatorial
Pacific SST field) rather than graded from a photograph — no licensing question, rebuilds
deterministically. Reuse this for topics without a good source image.

## Second pass, same day: Layer 3 (Dewan Ekonomi Nasional) — and a real correction

Aldo supplied two **DEN** briefs afterwards (`sources/layer3.md`): *Inflation Brief* 6 Jul 2026 and
*Food Price Brief* 29 Jun 2026. **`Laporan_Inflasi_Bulan_Juli_2026.pdf` is the July edition reporting
JUNE data** — it corroborates rather than supersedes. Unlike EIU exports these have text layers.
DEN is a Presidential advisory body and both carry an "authors' own views" disclaimer, so they were
keyed as *semi-official* — above press, below a BPS/BI release.

**It forced a correction to already-shipped text, which is the main lesson.** The first version said
volatile food inflation "was 5.58% y/y in June" and framed it as the elevated component driving
concern. Level right, **direction wrong** — it *fell* from 6.24% in May, and June's headline rise came
from **administered prices (+1.35 pp)**, not food. The corrected reading is *worse* for the thesis,
not better: the cyclical food spike was unwinding on harvest and **rice is what held the deceleration
back**. Recorded as a visible "Correction to the first draft" section in the brief's own Annex A, not
just in `verification.md` — Aldo's convention is that corrections are content.

**The trap that nearly shipped the error anyway:** `make_deck.py` and `make_infographic.py`
**hardcode their content and do not read `build.html`**. Fixing the prose did *not* propagate. Always
`grep` a changed number across `src/*.py` before shipping. (The `content.py` in
[[project-two-gates-one-price]] exists precisely to prevent this; this project predates it — port it
if this brief is ever revised again.)

**New findings the DEN pack produced, worth the pattern:**
- **The coverage gap** — now the brief's sharpest point. Bapanas states rice cover to **May 2027**;
  the ECB lag EIU cites puts peak effect Oct–Dec 2027 or Feb–Jun 2028. **Two officially stated
  horizons that do not overlap.** Framed as a question with an addressee, not a prediction.
- **BMKG vs BMKG** — DEN reports BMKG at 98% *strong*; BMKG's own update says 62% *strong* / 98%
  *moderate*. A label carried across in summarising a slide. Strengthened Box 1: the same agency's
  numbers reach different parts of government 36 pp apart.
- **MBG natural experiment** — chicken −3.3% and eggs −2.3% m/m when MBG paused for school holidays.
  Converted Box 2's "directional, unquantified" claim into an evidenced one (still won't size rice).
- Three new channels: **IHPB wholesale at 6.51% vs CPI 3.34%** with subsidised fuel held as a shock
  absorber (deferred pass-through); **core ex-gold ≈1.86%** proving the 100 bp was currency, not
  demand; **maize −11.4%** → feed → poultry.

**Length grew 30→36 pp.** Reclaimed two orphan pages by letting `Closing` flow (`h1.sec no-break`)
instead of forcing a page, and tightening. Declined to compress further — would have meant cutting
evidence to hit a page target.
