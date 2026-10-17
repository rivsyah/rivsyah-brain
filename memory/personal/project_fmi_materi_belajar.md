---
name: Materi belajar Financial Markets & Institutions (FMI) v2
description: "Okt 2026: 5 PDF (Panduan 20 hlm, Awal ~62, Menengah ~68, Lanjut ~51, Bank Soal 38) di Downloads\\Riv's Journey\\Materi Bahan Belajar\\Financial Markets (v1 diarsip di _arsip_v1); builder ~/dev/personal/financial-markets-materi (md→KaTeX→Chrome PDF), gerbang checks/verify.py 46 cek"
metadata:
  type: project
---

Dibuat 11–17 Okt 2026 (sesi Bara, mesin riv) atas permintaan Aldo: "perbaiki, lengkapi, buat lebih bagus
materi tata cara belajar dan materi belajar" FMI. Scope: personal.

## Hasil

- **FMI_00_Panduan_Belajar** (baru): tes penempatan 18 soal, gerbang kelulusan, jadwal 10/16/24 minggu,
  metode belajar (retrieval, spaced repetition, interleaving), BA II Plus + Excel, catatan kesalahan,
  strategi ujian, pelacak kemajuan.
- **FMI_01 Awal** 10 bab, **FMI_02 Menengah** 13 bab, **FMI_03 Lanjut** 13 bab: tiap bab punya tujuan,
  contoh berangka (dihitung ulang Python), Cek Pemahaman + kunci, glosarium, lembar rumus, sumber.
- **FMI_04 Bank Soal**: 184 soal berkode (AW 30, MN 35, LJ 35, BS 24, IS 18, HT 30, ES 12) + 3 paket
  simulasi; kunci PG tersebar seimbang (v1: nomor soal tidak cocok dengan kunci, kunci dominan A/B).
- Builder: `~/dev/personal/financial-markets-materi` (C:\Users\rivsy\dev\... di mesin riv). `node build/build.mjs`,
  `python -I checks/verify.py` (harus lolos semua sebelum salin).

## Koreksi fakta penting (berlaku untuk materi keuangan lain juga)

- 3T LPS butir 3 resmi = "tidak terindikasi/terbukti melakukan fraud" (bukan "kredit macet").
- PP 49/2024: derivatif berbasis efek → OJK; berbasis pasar uang & valas → **BI** (10 Jan 2025).
- JIBOR dihentikan 1 Jan 2026 → INDONIA/Compounded INDONIA. Koridor BI asimetris sejak Sep 2025 (DF −100, LF +75 bps).
- Kesehatan bank: RBBR/RGEC (POJK 4/POJK.03/2016); CAMELS tidak dipakai sejak 2012.
- Asuransi: POJK 26/2025 → solvabilitas wajib ≥100% MMBR, 120% = target internal.
- Pindar: SEOJK 19/SEOJK.06/2025 (0,3%/hari konsumtif ≤6 bln, dst.).
- PSAK 71 kini bernomor PSAK 109. Sasaran inflasi 2025–2027 2,5±1% (PMK 31/2024).
- UU 4/2026 lihat [[reference_uu_4_2026_p2sk]].

Rujukan lengkap: `ref/fact_check.md`, `ref/uu_4_2026_summary.md` di folder builder.
