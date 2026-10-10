---
name: project-bmri-company-focus
description: "Ignited Research BMRI IJ Company Focus v2 (10 Okt 2026): BUY TP 6,600; pipeline + XLSX + deck di Equity Research\\BMRI; CoE dirombak (risiko negara dihitung sekali)"
metadata:
  node_type: memory
  type: project
  modified: 2026-10-10T00:00:00.000Z
---

**BMRI IJ — "Policy Risk, Over-Discounted"**, Company Focus master prompt v2, DATE 10 Okt 2026 (harga close 9 Okt).
Folder: `C:\Users\rivsy\Downloads\Research Reports\Equity Research\BMRI\` (mesin ini). Output di `out\`:
PDF `BMRI_CompanyFocus_IgnitedResearch_2026-10-10_v2.pdf` (20 hlm = 15 laporan + 5 data annex), model
`BMRI_Model_IgnitedResearch_2026-10-10_v2.xlsx`, deck `BMRI_Deck_IgnitedResearch_2026-10-10_v2.pptx` (12 slide),
`model.json`. Part A/C di `notes\`. Versi lama (2 Agu PDF, deck/model Sep) tetap di root folder.

**Call:** BUY, TP IDR 6,600 (+63,4% vs 4.040), expected total return +73,4%. Sebelumnya (3 Sep 2026) BUY TP 5,350.
GGM 1,89x × BVPS FY27F 3.484 (VD 31 Des 2027); CoE 11,87% = (10Y INDOGB 7,237% − default spread Baa2 1,62%)
+ beta 0,935 × ERP Indonesia 6,69%; ROE 18%, g 5%, payout jangka panjang 72% (g ≤ ROE × (1 − payout) = 5,04%).
NP FY26F/27F/28F 58,7/62,9/69,4tn. DDM 10 tahun 7.039 (+6,8% vs GGM). Skenario tertimbang 6.352.
**Perubahan metode:** CoE lama 12,73% menghitung risiko negara dua kali (yield INDOGB + CRP di ERP); kini rf =
INDOGB − default spread. Sensitivitas: beta vs LQ45 1,072 → CoE 12,79% → TP −774.

**Fakta kunci (A, per Okt 2026):** BSI didekonsolidasi 1 Feb 2026 (stake 51,47% → associate; NCI keluar 23,84tn,
aset neto BSI 49,42tn) — FY26F pakai pro-forma Dec-25 ex-BSI. Kredit pihak berelasi 422,1tn Jun-26 = 25,9% kredit
(basis ex-BSI: 21,5% Dec-24 → 26,0% Dec-25 → 25,9%). NIM bank-only 2Q26 4,21%; trough 3Q26 ~4,07%. Interim FY26
IDR 66 (ex 16 Sep, bayar 2 Okt). BI-Rate 5,75% (RDG 22–23 Sep); RDG berikut 20–21 Okt; hasil 3Q26 est. 29 Okt.
CAR Jun-26 17,88% (+315 bps di atas 14,73%). JISDOR 9 Okt 17.884.

**Pipeline:** content.py → charts.py → build.py → part_a.py → verify.py (22 gate: G1–G20 + masthead + CF
companion files); gen_model.py (Excel, recalc via Excel COM; sheet Checks 24 nilai vs content.py, selisih 0);
export_json.py → out\model.json → gen_deck.js (`NODE_PATH` = node_modules di folder BBCA; `PPTX_SKILL` = dir
skill pptx untuk apply_theme.js).

**Why:** v2 mewajibkan XLSX/PPTX membaca model yang sama tanpa angka diketik ulang; gate CF di verify.py menolak
deck/model basi.

**How to apply (jebakan teknis yang sudah dipecahkan):**
- Locale Windows mesin ini Indonesia: label sumbu chart native PowerPoint tampil "2.000"/"5,0". Solusi: sembunyikan
  value axis (gridline tetap muncul) dan gambar label sumbu sebagai teks overlay pada plot area manual
  (`layout:{x,y,w,h}` = inner plot area, tepat). Excel model boleh ikut locale.
- PowerPoint menggeser plot area manual bila label sumbu terluar keluar frame chart — alasan lain menyembunyikan sumbu.
- pptxgenjs 4.0.1: `chartColors: ["transparent", …]` → seri `noFill` (waterfall/football field native); nilai null
  ditulis `<c:v></c:v>` → hapus pasca-tulis via JSZip; satu seri bar + >1 warna → warna per titik.
- validate.py skill pptx butuh `defusedxml` + `lxml` (sudah di-pip ke Python 3.11, 10 Okt 2026).
- Lebar judul Calibri Bold: estimasi per karakter di gen_deck.js (`textW`); judul nyaris penuh turun ke 13 pt.

Terkait: [[project-equity-research-series]], [[project-bbca-company-focus]].
