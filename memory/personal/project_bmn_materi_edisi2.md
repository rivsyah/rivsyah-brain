---
name: project_bmn_materi_edisi2
description: "Seri Belajar Pengelolaan BMN Edisi 2 (mulai 25 Okt 2026): 9 PDF lama -> 5 PDF (00 Panduan, 01 Awal, 02 Menengah, 03 Lanjut, 04 Bank Soal); builder ~/dev/personal/bmn-materi; SEDANG DITULIS"
metadata:
  type: project
---

Permintaan Aldo 25 Okt 2026: "perbaiki, lengkapi, buat lebih bagus materi tata cara belajar dan materi belajar ini
dari tingkat beginner, intermediate, dan advance" atas 9 PDF di
`C:\Users\rivsy\Downloads\Riv's Journey\Materi Bahan Belajar\Keuangan dan Anggaran Pemerintah (Kemlu)\Barang Milik Negara Pemerintah\`
(mesin riv). Scope: personal (materi belajar dari peraturan publik; tidak memuat data proyek Kemlu mana pun).

## Temuan Edisi 1
- Dua seri tumpang tindih: seri A (Modul 1–3 + Bank Soal, pypdf, 11 Jul) dan seri B (ReportLab, 5 Jul: B–I, Kemlu B–I,
  Advanced, 2 bank soal). Audit: 102 + 77 temuan (16 kritis) di `_kerja/audit/`.
- Kritis: matriks persetujuan pemindahtanganan salah; pinjam pakai "antarinstansi"; sitaan sebagai perolehan sah;
  Konvensi Wina Ps 30/31 untuk gedung (benar Ps 22; konsuler VCCR Ps 31); tak ada jurnal; modul Kemlu tanpa soal.

## Fakta regulasi (per 25 Okt 2026; rinci di `_kerja/FAKTA.md`, `FAKTA2.md`)
- Baru: PMK 40/2024 penggunaan (PSP ≤6 bln), PMK 138/2024 SBSK, PMK 120/2024 BMN idle, PMK 99/2024 penilaian,
  PMK 100/2025 KAPP (kurs tengah BI), PMK 122/2023 lelang, PMK 118/2023 SIMAN, PMK 77/2024 kendaraan perorangan dinas,
  KMK 266/2023 masa manfaat.
- Tetap: PP 27/2014 jo 28/2020; PMK 115/2020, 181/2016, 111/2016 jo 165/2021, 83/2016, 207/2021, 65/2017, 271/2015.
- PMK 7/2024 BUKAN aturan BMN (PPN DTP rumah). PMK 111/2017 = penilaian (dicabut).

## Builder — `C:\Users\rivsy\dev\personal\bmn-materi\`
- Salinan pipeline ib-belajar (md → HTML → Chrome PDF, verify.py). Kotak khusus: regulasi, dokumen, aplikasi, kemlu,
  kasus. `build/PLAN.md` kurikulum + data benang merah fiktif (Biro Sarana dan Prasarana, KBRI Arvenia).
- Urutan: `python -I build/build.py <kode>` lalu `python -I build/verify.py <kode>`.

## Status
- 25 Okt: audit + fakta selesai; 6 agen penulis jalan. Keluaran tujuan: subfolder `Edisi 2 (Okt 2026)`; 9 PDF lama tidak diubah.
