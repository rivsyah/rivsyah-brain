---
name: project-bbca-company-focus
description: "Ignited Research equity note BBCA \"The CASA Dividend\" di Downloads\\Research Reports\\BBCA; pipeline content.py/build.py/verify.py, data riil via web agents"
metadata: 
  node_type: memory
  type: project
  originSessionId: ec3ee6c6-402d-4d5a-869a-f96ae3be58b0
  modified: 2026-09-03T08:53:34.390Z
---

Equity research note pertama Ignited Research (format sell-side ala Trimegah/Mandiri Sekuritas): **BBCA IJ — "The CASA Dividend"**, Company Focus 5pp, 2 Agustus 2026, di `Downloads\Research Reports\Equity Research\BBCA\` (user memindahkan folder dari `Research Reports\BBCA` ke subfolder Equity Research bersama INDY/BMRI/RANS). BUY, TP IDR 8,300 (GGM 3.47x FY26F P/BV; ROE 21%, CoE 11.75%, g 8%), harga 6,325 (31 Jul 2026), upside +31.2%.

**Rerun 3 Sep 2026** (cutoff close 2 Sep): harga 6.675 (-17.3% YTD, basis year-end 2025 = 8.075 per Kontan/RRI — aggregator YTD tidak konsisten), TP tetap 8.300 → upside +24.3% + yield 5.4%. Bukti tesis masuk: NIM Juli pulih ke 5,5% (trough Juni 5,2%), 7M26 NP Rp35,3tn +1,6%, interim ke-2 Rp25 dibayar 16 Sep (Rp20 sudah Juni), buyback Rp5tn jalan; BMRI/BBNI justru pangkas guidance NIM. Himbara rally Agustus (BBRI 3.420, 1H26 +17,5%). PDF baru `..._2026-09-03.pdf` (versi 2 Aug disimpan); deck + model di-update in-place.

Deliverable tambahan (sesi sama): **deck PPTX** `BBCA_CASA_Dividend_Deck.pptx` (10 slide, 7 chart native pptxgenjs; QA render via PowerPoint COM — soffice/poppler TIDAK terpasang, tapi PowerPoint+Excel COM tersedia) dan **model Excel hidup** `BBCA_Financial_Model.xlsx` (README/Assumptions/Model/Valuation/Peers; semua forecast formula-driven dari Assumptions, recalc via Excel COM, 20 value checks cocok dengan laporan). node_modules pptxgenjs terpasang lokal di folder BBCA.

Pipeline: `content.py` (MODEL dict → semua tabel digenerate supaya angka tie by construction) → `verify.py` (gerbang 56 checks: P&L ties, anchor audit FY24/25, equity roll, GGM) → `build.py` (reportlab A4, band navy #0E2A47 + aksen ember #E8590C). Preview visual via pypdfium2 (poppler tidak terpasang di mesin ini).

Data riil dikumpulkan 3 web agents paralel: presentasi analis FY25 BCA (27 Jan 2026), audited FS Dec-25, presentasi 1H26 (28 Jul 2026), harga/peers dari stockanalysis.com. Konteks makro Agustus 2026: JCI -27.9% YTD, BI-Rate 5.75% (hiking +100bps 2026 defensif rupiah), USDIDR 18.027, 10yr 7.34%, BBCA -24.5% YTD. Sumber PDF BCA tersimpan sementara di scratchpad session lama (hilang setelah session).

User punya master prompt template "senior sell-side analyst" (struktur front page → financial summary → thesis chapters → risks+sensitivities → valuation GGM/DCF → peer comp → disclosures; house style "every claim carries a number"). Kemungkinan dipakai ulang untuk emiten lain — pipeline BBCA bisa jadi template: [[project-seventy-dollar-budget]] gaya verify-gate yang sama.
