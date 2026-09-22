---
name: project-fraud-hexagon-malaysia
description: Studi Fraud Hexagon 33 emiten F&B Bursa Malaysia 2022-2024; pipeline data + variabel tata kelola yang masih kosong
metadata: 
  node_type: memory
  type: project
  originSessionId: 0e576af4-8141-4f71-a9d5-305abf1256df
  modified: 2026-09-09T14:41:15.545Z
---

Studi Fraud Hexagon (skripsi/riset) atas 33 emiten F&B & konsumer Bursa Malaysia, tahun buku 2022–2024 (butuh FY2021 sebagai t-1). Workbook: `~/Downloads/Fraud_Hexagon_33_Perusahaan_2022-2024_TERISI.xlsx` (sumber asli: versi `(AutoRecovered)`).

**Pipeline data yang terbukti jalan** (9 Sep 2026, semua via `curl` + `pandas.read_html`, tanpa API key):
- `stockanalysis.com/quote/klse/<TICKER>/financials/{,balance-sheet/,cash-flow-statement/,ratios/}` — 32 dari 33 emiten. Tampilan gratis dibatasi 5 tahun fiskal.
- **Trik tahun dasar:** HTML halaman itu memuat blok JS `prior:{...}` berisi laporan keuangan tahun SEBELUM kolom tertua, dalam satuan RM penuh. Inilah sumber FY2021 untuk 15 emiten yang tahun bukunya bukan Desember.
- F&N (3689) tidak ada di stockanalysis → Yahoo `query1.finance.yahoo.com/ws/fundamentals-timeseries` (maks 4 tahun).
- TradingView `scanner.tradingview.com/symbol?symbol=MYX:<T>&fields=...__fy_h` → 20 tahun, tapi hanya 12 pos (total aset, pendapatan, laba kotor, laba bersih, EBITDA, dst). Labelnya memakai tahun MULAI fiskal, jadi harus diselaraskan pakai total aset sebagai jangkar.
- Buntu: Bursa Malaysia (Cloudflare), WSJ (401), marketscreener/investing (403), FT & i3investor (JS), Wayback (tak ada snapshot).

**Status:** 986 dari 990 sel indikator kuantitatif terisi (FFS/M-Score, FINTGT, FINSTA, ExtCAP, Z-Score Altman). Sisa: F&N 2022 (DSRI/AQI/DEPI/M-Score) butuh Piutang, Aset Lancar, Aset Tetap & Depresiasi FY2021 dari Laporan Tahunan F&N 2022.

**Belum tergarap sama sekali — 5 dari 6 dimensi hexagon:** EFFMNT (opportunity), AUDSWT (rationalization), CHANDIR (capability), CEONRC (arrogance), COLL (collusion). Tidak ada di database keuangan manapun; harus dibaca dari 99 laporan tahunan. Sengaja dikosongkan, jangan pernah dikarang.

**Jebakan yang sudah ditemukan:**
- AQI meledak kalau "aset lain" (Total Aset − Aset Lancar − Aset Tetap − Investasi jk panjang) < 0,5% total aset → diset 1 (3A, Apollo, SBH, Saudee).
- Short-term investments JANGAN ditambahkan ke rumus AQI — sudah termasuk Aset Lancar.
- Workbook asli Aldo satuannya campur: sebagian RM'000, sebagian RM penuh.
- Perlu dicek ulang ke laporan tahunan: ORGABIO 2022 (workbook RM23,47jt vs sumber RM46,79jt) dan SBH 2021 (RM104,58jt vs RM100,67jt).

Lihat juga [[user-profile]].
