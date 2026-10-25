---
name: project-perpajakan-instansi-materi
description: "Revisi materi belajar Perpajakan Instansi Pemerintah (8 PDF v1 Juli 2026) jadi Edisi 2: 7 PDF (Panduan, Awal, Menengah, Lanjut, 3 Bank Soal; 749 hlm, 323 soal); builder ~/dev/personal/perpajakan-instansi-materi; SELESAI 25 Okt 2026, verify 1346/1346"
metadata:
  type: project
---

Permintaan Aldo 25 Okt 2026: "perbaiki, lengkapi, buat lebih bagus materi tata cara belajar dan materi belajar
ini dari tingkat beginner, intermediate, dan advance". Scope: personal (bahan belajar di Riv's Journey; isi =
aturan publik, kasus fiktif DLDT/KBRI Arvenia, tanpa data Kemlu asli).

## Hasil
- Keluaran: `Downloads\Riv's Journey\Materi Bahan Belajar\Keuangan dan Anggaran Pemerintah (Kemlu)\Perpajakan
  Pemerintahan\Edisi 2 (Okt 2026)\` — 8 PDF v1 di folder induk tidak disentuh.
- Halaman: Panduan 72, Awal 134, Menengah 161, Lanjut 162, Bank Soal 70/77/73. Soal 105 + 110 + 108.
- Builder (mesin riv): `C:\Users\rivsy\dev\personal\perpajakan-instansi-materi\` — `bash make.sh`
  (build -> verify -> salin). Fork toolchain reportlab seri pajak-korporasi; helper tarif tunggal
  `tools/instansi.py` (TER A/B/C dicocokkan baris per baris dengan Lampiran PP 58/2023), kasus fiktif
  `tools/satker.py`. Fakta di `ref/factcheck.md`, audit v1 di `ref/audit_v1.md`.

## Fakta volatil terverifikasi (per 25 Okt 2026, detail di ref/factcheck.md)
- PPh 22 bendahara kini **PMK 51/2025** (PMK 34/2017 dicabut; PMK 54/2025 hapus Ps 217–225 PMK 81/2024).
- PMK 81/2024 s.t.d.t.d. PMK 1/2026: setor PPh tgl 15; lapor SPT Masa PPh 21/26 & Unifikasi 20 hari;
  PPN pungutan instansi setor + lapor (SPT Masa PPN Pemungut non-PKP) **akhir bulan berikutnya**, nihil tak wajib lapor.
- PER-11/PJ/2025 cabut PER-17/PJ/2021 (Unifikasi khusus instansi): Unifikasi kini hanya PPh. Pembetulan skema replace sejak 1-10-2026 (PER-12/PJ/2026).
- Ambang Rp2 juta PPh 22 **dan PPN** tidak termasuk PPN. 8 pengecualian PPN tetap PMK 59/2022 Ps 18.
- UMKM: PP 20/2026 (OP, PT Perorangan, koperasi). Bea meterai: PMK 78/2024, > Rp5 juta.
- Bunga Okt 2026 (KMK 47/MK/EF.2/2026): telat setor bendahara 1,01%/bln.
- SE-1/PB/2025: potongan UP ke akun 411618 ≤ 3 hari kerja; LS: nomor SP2D = NTPN.
- Perwakilan RI: satu-satunya aturan eksplisit PMK 168/2023 Ps 2(2)b; TPLN/pegawai setempat/vendor asing = belum ada aturan publik.

## Catatan sisa
- Beberapa klaim bertanda [Kemungkinan besar] (kode faktur 02, isi SE-1/PB/2025, PP 20/2026, PER-12/PJ/2026) belum dibaca dari naskah resmi.
- Helper yang masih tersebar di modul hitung (bunga, hari kerja, Pihak Lain 0,5%, pengalihan 2,5%) belum dipindah ke instansi.py.
