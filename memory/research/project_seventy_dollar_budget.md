---
name: project-seventy-dollar-budget
description: "The Seventy-Dollar Budget" — Indonesia Economic Outlook 2026 brief, live at Research Reports\Seventy-Dollar-Budget (standalone 36pp + 23-slide deck, 16 Aug 2026); v3 rerun started 10 Oct 2026
metadata:
  type: project
---

Brief published **2 August 2026** (evidence cutoff 31 July): *The Seventy-Dollar Budget —
Indonesia Economic Outlook 2026*, at `Downloads\Research Reports\Indonesia Outlook 2026 Only\Indonesia-2026-Brief\`
(user renamed the parent folder from "Indonesia Outlook only 2026").
33pp PDF + 18-slide PPTX + one-page infographic. Deliberately no DOCX.
**All deliverables in both editions are branded Ignited Research** — the v1 set was rebuilt to match
the v2 after the user flagged the inconsistency; "Independent Research" must not reappear as a
publisher name in this series.

**Thesis (chosen over a conventional sector outlook):** all six APBN 2026 macro assumptions broke in
the costly direction — ICP US$70 vs a Jan–Jun average of US$90.5, inflation 2.5 vs 3.34%, IDR 16,500
vs 17,883, SBN 10Y 6.9 vs 7.29%, growth 5.4 vs ~5.0%. But **revenue is not the problem** (H1 +21.4%,
MoF projects 101.7% of target); spending is. The keystone is DEN's own phrase that the government
holds subsidised fuel prices "as a shock absorber" — hence CPI 3.34% against wholesale 6.51%. Framed
as a **deferred adjustment, not a fiscal crisis**. Response framework = **the Absorption Agenda**
(Reprice / Disclose / Shield / Redirect).

Contains **falsifiable pre-release calls** on the 3 Aug (July CPI, June trade) and 5 Aug (Q2 GDP)
prints, taking a position *against* EIU's 3.5% Q2 forecast. Worth scoring after those releases.

**Reusable across future Indonesia work:** the 231-page EIU Viewpoint PDF has no recoverable text
layer (Type3 fonts, no ToUnicode — automated "has text layer?" checks give a false positive). It was
already transcribed with page refs in
`Indonesia Outlook 2026 - 2030\Indonesia-Outlook-Brief\src\eiu_*.md` (~93KB) plus `ibc_raw.txt`.
Reuse those rather than re-rendering; spot-verify against fresh page renders.

**Caution:** the DEN *Manufacturing Brief Q2 2026* in that sources folder is marked
"terbatas hanya untuk penggunaan internal Dewan Ekonomi Nasional" — not cited in the brief; the same
figures were sourced to unrestricted DEN/S&P releases instead. No other file in that corpus carries a
restriction.

Two build traps found here and documented in the project README: never set a `.ttc` font as
matplotlib's default family, and anchor table placeholders on `<table\b[^>]*>` rather than `<table>`.
See [[reference-brief-pipeline-traps]].

**Delivered as a STANDALONE study, 16 Aug 2026, 36pp.** The user's standing preference: each brief
must stand alone — no "second edition", no "first published", no reference to earlier work of their
own or to sibling briefs. When a cutoff moves, fold new outturn into the body sections rather than
adding a scorecard-of-my-previous-edition section, and re-point the calls forward. Also: **the verify
gate does not catch tense** — check for passages still written as "ahead of" releases that have since
happened.

**What the August data did to the 2 Aug calls (kept for my own record, not printed):** Four of five resolved within a fortnight:
July CPI **falsified** (2.88% against a 3.4–3.8% call; volatile food fell to 2.52% on horticulture
harvests while the administered channel behaved exactly as argued); June trade **survived** on the
binary (−US$0.45bn, second deficit) but missed the magnitude; Q2 GDP **survived** (5.29% vs a
4.6–5.2% call — mechanism vindicated, government consumption +15.97%, and EIU wrong by 1.79pp
against my 0.39pp); RAPBN 2027 **confirmed the Reprice failure** — presented 14 Aug with a
single-point ICP of US$75 and the 10-year yield left at the same 6.9% that broke in 2026; BI's
August RDG (19–20 Aug) still open. 37pp. Lesson worth carrying: the brief read the *transmission*
right and the *headline* wrong, because the headline is dominated by food.

**v2 rebuild (2 Aug):** at `Research Reports\Seventy-Dollar-Budget\` — same evidence and thesis
rebuilt under the v2 master prompt, and after a brief detour as "The Shock Absorber" the user
retitled it back to **The Seventy-Dollar Budget** (folder renamed to match). Deltas from v1:
publisher **Ignited Research**, full mandatory disclaimer page, `content.py` as single source of
truth, **`verify.py` as a hard build gate** (~90 checks), and five falsifiable calls (adds BI August
RDG hold-at-5.75% and the RAPBN 2027 ICP-band test) in a "What would change our view" box. PDF only,
35pp. This v2 edition supersedes v1 for circulation. v2 gate traps: CSS `text-transform:uppercase`
changes extracted PDF text (match case-insensitively), and reference markers should be detected by
PyMuPDF's superscript flag, not font size.

**Jebakan pipeline yang diwarisi dari brief BPP (fork dari folder ini, 15 Ags–3 Sep 2026, folder
brief-nya sudah dihapus).** Empat cacat render yang kena ke pipeline `content.py → charts.py →
build.py → verify.py` ini, bukan hanya ke brief itu:

- **`S.note()` wajib membungkus teks.** `savefig.bbox="tight"` membiarkan nota sumber yang panjang
  melebarkan kanvas SVG melewati lebar figure 7,1 inci. `figure svg{width:100%}` lalu mengecilkan
  seluruh eksibit agar notanya muat — jadi grafiknya yang menyusut, bukan teksnya. Enam dari tiga
  belas eksibit tampil di 60–70% ukuran sebelum pembungkus dipasang di `style.py`.
- **`Circle` di koordinat axes menggambar elips.** Ruang axes tidak isotropik pada kanvas W×H;
  radius y harus dikali `W/H`. Pakai `Ellipse(w, h*(W/H))`.
- **`tr.grp` mengubah selnya jadi huruf besar.** Kelas itu membawa `text-transform:uppercase`,
  sehingga baris total `Rp20–58trn` terbaca `RP20–58TRN` di render maupun di teks yang diekstrak
  verify. Tambahkan `tr.total` untuk penekanan tanpa transform.
- **`.kpi .t .k` dan `.v` mewarisi `text-align:justify` dari `body`.** Label huruf besar pendek
  terentang melintasi ubinnya ("PROCUREMENT    SPEND CITED"). Keduanya butuh `text-align:left`.

Satu pola yang layak ditiru: kalau angka inti sebuah brief adalah **konstruksi penulis** dan bukan
data terbit, jadikan label kejujurannya bagian dari gerbang build — `verify.py` di brief BPP gagal
kalau lima frasa penanda hilang dari PDF (asumsi dinyatakan, catatan tanpa-data-primer, caveat sub
judice, dan seterusnya).

## Status per 10 Oct 2026 — v3 rerun (Phase 0)

**Live folder:** `C:\Users\rivsy\Downloads\Research Reports\Seventy-Dollar-Budget\` (this machine).
The v1 folder `Indonesia Outlook 2026 Only\` no longer exists — ignore the path in the first
paragraph above. Last delivery: standalone 36pp PDF + 23-slide deck, cutoff 16 Aug 2026.
Sources moved: the DEN month folders are now `Research Reports\References\Juli` and `\Agustus`;
new top-level files in `References\` dated 6 Sep (EIU 2027 outlook 69pp Type3 = needs render,
IBC synthesis / 15 recommendations / ART draft position paper, DEN Inflation Sep, DEN Weekly IV Aug,
DEN food prices Aug, a published Hormuz energy-security policy brief).

**Facts that change the brief (all T1-checked unless noted):**
- BI Governor Perry Warjiyo **resigned 27 Jul 2026**; Destry Damayanti confirmed by DPR plenary
  1 Sep 2026 (2026–2031). Both earlier editions missed the resignation, which fell before their
  cutoff — a real omission.
- Finance Minister **Suahasil Nazara from 14 Sep 2026** (Keppres 97/P/2026), replacing Purbaya
  Yudhi Sadewa. The 2.85% deficit projection was Purbaya's.
- **APBN 2027 passed 29 Sep 2026**: ICP US$75 single point, no band, no trigger (Kemenkeu DJSEF,
  24 Sep); growth 6%, inflation 2.5%, Rp17,500, SBN 10Y 6.9%, deficit 2.4%, revenue Rp3,435.1trn,
  spending Rp4,106.3trn (= revenue + deficit; one source rounds to 4,106.2). Brent was above US$100 within two days (US$103.50 on 1 Oct).
- **APBN KiTa to 31 Aug 2026**: deficit Rp240.1trn = 0.93% of GDP (narrower than 1.35% a year
  earlier); primary surplus Rp154trn; revenue +25.4% (65.2% of target); subsidy + compensation
  Rp331.4trn = 74.2% of ceiling, +52.1%; compensation Rp154.4trn now **paid monthly**.
- CPI Aug 3.19%, Sep 3.28%; IHPB Aug 6.18% → wedge 2.99 points (May 2.68 / Jun 3.17 / Jul 2.78).
- ICP Jul US$81.68, Aug US$89.43 (Kepmen ESDM 352.K/MG.03/MEM.M/2026).
- 10Y yield touched 6.93–6.97% in late Aug, then rose again: 7.12% (4 Sep) → 7.17% (15 Sep) →
  7.16% (2 Oct). It did **not** stay healed — see the September block below.

**Governing thought has to change.** The monthly compensation mechanism and the narrow, narrowing
deficit weaken the old limb "the cost is hidden in deferred obligations". What survives and gets
stronger: the shock is *paid* on-budget (subsidy + compensation +52%) and *funded* by a windfall
from the same oil price, so the budget's apparent health is a hedge, not resilience — and the 2027
budget writes that hedge on a single price point. Only growth has healed on outturn (H1
average ≈5.45% vs 5.4%); the yield went back above 7.1% in September, so the count is five of six
missed, not four.

**Decisions pending with Aldo (Phase 0):** see the September block below (memo revision 2).

## Status per 10 Oct 2026 — September evidence (Phase 0 revision 2)

Twelve DEN files dated 4 Sep – 8 Oct sit in `Research Reports\References\` (Data Visual Sep,
Monetary Brief Sep, Weekly I–V Sep, food prices Sep II and IV, Inflation Sep and Oct, Trade Brief
Aug). All have clean text layers and no restriction phrases. Memo revision 2 is
`Seventy-Dollar-Budget\sources\phase0_memo_v3.md`; revision 1 is kept as `phase0_memo_v3_r1.md`.

**Data conflict:** 10Y yield for 28 Aug = 6.97% (DEN Weekly IV Aug) vs 7.03% (DEN Weekly I Sep and
the Monetary Brief's end-Aug column). Rupiah and IHSG match for that date. Resolve against BI/PHEI.

**New facts (DEN, citing T1 originators — verify at T1 before use):**
- Revenue to Aug: tax +24.1% (VAT +38.9%, oil and gas income tax +63.8%, non-oil income tax
  +16.6%); non-tax +41.7% (non-oil natural resources +81.0%). Increase ≈ Rp416trn y/y (derived).
  Net debt financing Rp506.0trn against a Rp240.1trn deficit.
- Current-account deficit Q2 2026 US$12.5bn = 3.3% of GDP (Q1 US$4.0bn, 1.1%); overall BoP Q2
  −US$0.9bn; reserves Aug US$146.5bn (5.4 months). Trade surplus Jul +0.12bn, Aug +3.55bn;
  Jan–Aug +7.3bn vs +29.3bn in 2025. Export volume Aug −18.6% y/y (coal −28%, RKAB quotas).
- Wedge Sep 3.48 pts (IHPB 6.76 − CPI 3.28), the widest of the series. CPI Sep: core 2.84,
  administered 3.25, volatile food 5.03. Non-subsidised fuel was raised in early September.
- Transfers to regions −24.1% y/y to Aug (Rp419.9trn) — a cut designed into APBN 2026, not an oil
  response; regional capital spending −26.0%.
- El Niño very strong (BMKG ENSO Jul–Sep +2.63); BPS sees rice output −12% y/y in Sep–Nov; rains
  late (Nov–Dec) in 61% of season zones. Rice aid extended Oct–Dec at Rp17trn.
- Brent Sep average US$102.3; 2026 average US$89.0. BI held 5.75% on 22–23 Sep and leans on
  swap/DNDF incentives; the Fed hiked 25bp on 16 Sep. Rupiah 17,898 and IHSG 6,036.9 on 2 Oct.
- APBN 2027: TKD Rp735trn, education Rp824trn, social protection Rp539.7trn. ESDM raised coal
  quota by 15–20Mt for three Bayan units; DEN ties Q4 stimulus room to the extra royalties.
- DEN expects Q3 growth above Q2 (5.29%); central-ministry spending +33% y/y to Aug.

**Thesis status:** survives and widens — the payer is the price surge (oil, coal, nickel and the
price part of import VAT), not oil alone. Phase 1 crux test: the commodity-linked share of the
~Rp416trn increase. Below one third → the v3 conditional stop and a new governing thought. Most
likely way it is wrong: VAT and non-oil income tax grew through compliance.

**Calls revised (8):** old C1 (Q3 GDP below Q2) dropped and replaced by Q3 household consumption
below 5.0%; added Q3 current-account deficit below 2.5% of GDP and volatile food above 6% in
Oct–Dec; the oil-share call dropped because the share is measurable now.

**Recommended to Aldo:** keep the title, the subtitle and "The Absorption Agenda" (his earlier
picks); DEN and EIU default to `background` unless he marks them `cleared`. Awaiting approval;
nothing built.

**Lesson:** revision 1 claimed "mining took 36 times the FDI of non-resource manufacturing". Wrong:
36 was the waffle's square count for 35.6%; the multiple is 35.6 / 1.54 ≈ 23. Check any "N times"
claim against the two shares, never against chart geometry.

## Status per 10 Oct 2026 — Phase 1 conditional stop (crux test failed)

Aldo approved Phase 0 revision 2 on 10 Oct with the defaults: title, subtitle and "The Absorption
Agenda" kept; DEN and EIU = `background` (never cited; every number from public T1); cutoff
10 Oct; PDF only.

**New T1 source — use it first next time.** Kemenkeu's APBN KiTa press decks are public PDFs with a
real text layer: `media.kemenkeu.go.id/getmedia/.../Publikasi-Web-Konpers-APBN-KiTa-(<Bulan>-2026).pdf`
(index at kemenkeu.go.id/apbnkita → "APBN Kita 2026 (Publikasi)" → "Tampilkan berkas unduh"; the
page is JS-rendered, so use the browser, not WebFetch). WebFetch saves the PDF binary under
`~/.claude/projects/.../tool-results/`; copy it to a scratch folder and extract with PyMuPDF. The
deck for **9 Oct 2026 (data to 30 Sep)** came out the day before the cutoff. Some tables are images:
render the slide to PNG and read it.

**Crux test (pre-registered; `sources/crux_test.md`, `src/crux_test.py`):** the price-linked share of
the revenue rise is 27.5% to Aug and 30.2% to Sep (all import VAT counted = upper bound); 32.7% with
import income tax and import duty. Below one third → F3 failed → conditional stop. Revenue rise to
Sep Rp475.6trn = price surge 143.9 (30%) + refunds paid out −125.2 (26%; Rp323.9 → 198.7trn,
−38.7%, DJP via press, grade B) + one-off BI surplus 55.0 in KND (12%) + everything else 151.5 (32%).
Subsidy + compensation rose Rp132.2trn (244.6 → 376.8), so the price surge paid for itself.
Deficit to Sep 1.24% vs 1.55%; if ≥20% of the refund fall is timing, the underlying deficit is no
narrower than a year earlier. Kemenkeu: domestic VAT +53.9% net vs +7.8% gross, "refund management in
the fuel wholesale trade sector".

**Proposed governing thought (awaiting Aldo):** the 2026 oil windfall only paid the 2026 oil bill;
the narrower deficit rests on Rp125trn of refunds not paid out and a one-off Rp55trn BI transfer —
so the 2027 budget, on a single US$75 price, starts with less room than 2026 suggests.

**Other T1 facts from the decks:** ICP Jan–Sep avg US$91.9 (Sep ≈ US$113 implied); official 2026
outlook keeps ICP at US$83 → implies Q4 ≈ US$56; oil lifting 573.9k b/d vs 610k; 10Y 7.17% and rupiah
17,937 on 2 Oct; PNBP already 107% of the APBN target; compensation unchanged Aug→Sep (nothing paid in
September); net debt financing fell from Rp506.0trn (Aug) to 494.3trn (Sep); TKD allocation revised to
Rp727.2trn. Anomalies logged in `sources/phase1_t1_facts.md` — incl. DEN's "non-oil SDA grew 81%"
being a misreading of "81% of outlook".
