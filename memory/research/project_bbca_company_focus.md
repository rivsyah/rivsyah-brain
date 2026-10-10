---
name: project-bbca-company-focus
description: "Ignited Research equity note BBCA \"The CASA Dividend\" — v2 10 Okt 2026 (master prompt v2): BUY TP 8,400, PDF + XLSX formula + deck 12 di Equity Research\\BBCA\\v2; GGM kini g terikat payout jangka panjang"
metadata: 
  node_type: memory
  type: project
  originSessionId: ec3ee6c6-402d-4d5a-869a-f96ae3be58b0
  modified: 2026-10-10T00:00:00.000Z
---

Equity note pertama Ignited Research: **BBCA IJ — "The CASA Dividend"**, folder
`Downloads\Research Reports\Equity Research\BBCA\` (v1 di akar folder, v2 di subfolder `v2\`).

## Status kini: v2, 10 Okt 2026 (master prompt v2, cutoff close 9 Okt 2026)

**BUY, TP IDR 8.400** (dari 8.300), harga 6.050, upside +38,8%, total return +44,9% (dividen ex 12 bln IDR 369).
Valuation date 31 Des 2027 (FY27F). GGM: ROE berkelanjutan 21,32% (rata-rata FY24A–FY28F); CoE 11,63% =
(INDOGB 7,237% − default spread 1,52%) + beta 0,90 (2 thn mingguan vs LQ45, Blume) × (ERP matang 4,20% + CRP 2,36%);
g = min(PDB nominal IMF 7,83%, ROE × (1 − payout jangka panjang 65,4% = rata-rata FY21–25)) = 7,39%; P/BV 3,28x ×
BVPS FY27F 2.552 = 8.377 → dibulatkan 8.400. Cross-check DDM 10 thn (mid-year) 8.905; skenario 9.342/8.377/5.842
(bobot 7.985, skew −4,7%).

**Temuan GGM 10 Okt (dulu ⚠ menunggu Aldo) sudah diselesaikan di v2:** g kini diikat ke payout jangka panjang
(rata-rata historis 65,4%, bukan 75%). Kasus payout 75% permanen = bear case IDR 5.842 — cocok dengan perkiraan
temuan lama (±5.800). TP bridge 8.300→8.400 menampilkan "Growth tied to payout" −986.

**Tesis berubah:** pemulihan NIM berbasis *funding*, bukan harga kredit. SBDK BCA hanya −15 s.d. +2 bps (Apr–Agu),
kartu deposito BCA 2,75–3,00% tak naik sejak 1 Apr (di bawah LPS 3,75%), sistem TD 1 bln naik 90 bps ke 5,10%;
CASA bank-only 85,5% (Agu). Risiko yang ditambahkan dari agent (sumber dicek live): manajemen 9 Sep (Public
Expose, Kontan) arahkan NIM 2026 ~5,4% dan "mungkin akan terus menurun" — FY27F kami 5,50% di atas arah itu
(NIM datar = −1,1% NP27); MSCI review 11 Nov 2026 (efektif 1 Des) bisa membuka konsultasi Indonesia EM→Frontier
(Bloomberg/Fortune 23 Jun) — di risk register via CoE +100 bps = −19,1% TP; SAL Rp299 tn di Himbara, Rp200 tn
diperpanjang ke Jul 2027.

**Deliverable v2** (`v2\out\`): `BBCA_CompanyFocus_v2_2026-10-10.pdf` (18 hlm, 46 exhibit, 20 gate lolos),
`BBCA_PartA_AnalystNotes_v2_...md`, `BBCA_PartC_QA_log_v2_...md`, `BBCA_FinancialModel_v2_2026-10-10.xlsx`
(11 sheet, 1.169 rumus, data table skenario + 31 kasus sensitivitas, 40 nilai = model Python sampai presisi mesin),
`BBCA_Deck_v2_2026-10-10.pptx` (12 slide, chart native, label chart locale-proof).

**Pipeline v2** (folder `v2\`): `inputs.py` (registry A/C/E/P + sumber) → `model.py` → `content.py` (semua prosa
f-string) → `charts.py` → `build.py` → `verify.py` (G1–G20; tulis Part A/C). Lalu `export_model.py` → `out/model.json`;
`gen_xlsx.py` → `xlsx_recalc.ps1` (Excel COM: tambah data table + recalc) → `check_xlsx.py`; `gen_deck.js`
(jalankan dengan `NODE_PATH=..\node_modules` dan `PPTX_SKILL_DIR`). Data sheet agent: `v2\notes\` (company, macro A–F,
rates evidence). Catatan alat: [[reference-office-render]].

## Riwayat

- **2 Agu 2026:** v1 5pp, BUY TP 8.300 (GGM 3,47x FY26F; ROE 21%, CoE 11,75%, g 8%), harga 6.325.
- **3 Sep 2026:** rerun cutoff 2 Sep, harga 6.675, TP tetap 8.300; deck `BBCA_CASA_Dividend_Deck.pptx` + model
  `BBCA_Financial_Model.xlsx` (v1, di akar folder, tidak diubah oleh v2).
- **10 Okt 2026:** v2 di atas. Caption LinkedIn yang dibuat di sesi yang sama (sebelum v2) ditulis dengan suara
  Aldo — itu melanggar aturan "jangan menulis dengan suara Aldo"; ke depan beri bahan mentah saja.

Terkait: [[project-equity-research-series]] (master prompt v2), [[project-bmri-company-focus]] (run v2 pertama).
