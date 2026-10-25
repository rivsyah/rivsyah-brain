---
name: project-perpajakan-korporasi-materi
description: "Seri belajar Perpajakan Bisnis & Korporasi edisi 2 (25 Okt 2026): 7 PDF, 980 hlm, verify 1.714/0, di Riv's Journey\\Materi Bahan Belajar\\Perpajakan Bisnis Korporasi\\Edisi 2 (Okt 2026); builder ~/dev/personal/perpajakan-korporasi-materi (bash make.sh); fakta pajak volatil per Okt 2026"
metadata:
  type: project
---

Permintaan Aldo 25 Okt 2026: "perbaiki, lengkapi, buat lebih bagus materi tata cara belajar dan materi belajar"
perpajakan bisnis & korporasi, tingkat beginner/intermediate/advanced. Scope: personal. SELESAI 25 Okt 2026.

## Hasil
`C:\Users\rivsy\Downloads\Riv's Journey\Materi Bahan Belajar\Perpajakan Bisnis Korporasi\Edisi 2 (Okt 2026)\`
(8 PDF v1 Juli 2026 di folder induk TIDAK disentuh):
00 Panduan 76 hlm · 01 Awal 193 (15 bab) · 02 Menengah 225 (15 bab) · 03 Lanjut 195 (14 bab) ·
04/05/06 Bank Soal 88/112/91 hlm (148/154/149 soal termasuk ujian 36; kunci PG ±25% per huruf).

## Builder
`~/dev/personal/perpajakan-korporasi-materi` — fork renderer seri M&A (reportlab). `bash make.sh` = build → verify
→ salin. Helper pajak tunggal `tools/pajak.py` (Ps 17, 31E, PTKP, TER, penyusutan, PPN 11/12, bunga KMK Okt 2026);
tabel TER resmi `tools/ter_data.py` dibangkitkan dari factcheck (`ref/audit/work_v1/gen_ter.py`).
Audit v1 (105 temuan, 7 kritis) + factcheck di `ref/audit/`; blueprint + brief di `ref/`.

## Kasus berjalan (fiktif)
PT Kriya Rimba Nusantara (mebel Jepara): PT berdiri Jul 2023, PPh final 2023–2025, omzet 2024 Rp4,5 M
→ PKP SUKARELA Okt 2024 (riwayat dibetulkan: omzet >4,8 M di 2024 akan memaksa tarif umum 2025, PP 55/2022
Ps 57–58). 2026 tarif umum pertama, PPh 25 nihil, omzet Rp38 M, laba fiskal 4.510 jt, PPh 29 ±Rp799,5 jt.
Buku 3: grup KRH Singapura (royalti, jasa manajemen, thin cap, merger JL nilai buku); Pilar Dua = Grup Samudra Raya.

## Fakta volatil per Okt 2026 (cek ulang tiap edisi)
Setor PPh masa tgl 15 (PMK 81/2024 Ps 94); PP 20/2026 (PPh final 0,5% hanya OP/perseroan perorangan/koperasi;
batas waktu OP sesudah 2026 MASIH AMBIGU, ditulis dua bacaan); restitusi dipercepat Rp1 M (PMK 28/2026);
PPh 22 PMK 51/2025; PSAK 46 → PSAK 212; P3B PMK 112/2025; Pilar Dua PMK 136/2024 + PER-6/PJ/2026, SBIE 2026
9,4%/7,4%; tax holiday tanpa pengganti sejak 31 Des 2025; GAAR tidak ada di UU HPP; bunga sanksi KMK
47/MK/EF.2/2026; pembetulan SPT skema replace (PER-12/PJ/2026); Pengadilan Pajak ke MA ≤ 31 Des 2026.

## Sisa yang belum dicek ke teks primer
Nomor lampiran SPT badan Coretax, PMK 111/2025 (tenggat SP2DK), KMS 2,2%, perpanjangan pemeriksaan TP.
