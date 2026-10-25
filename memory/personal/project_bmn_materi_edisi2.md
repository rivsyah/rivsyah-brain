---
name: project_bmn_materi_edisi2
description: "Seri Belajar Pengelolaan BMN Edisi 2 (mulai 25 Okt 2026): 9 PDF lama -> 5 PDF (00 Panduan, 01 Awal, 02 Menengah, 03 Lanjut, 04 Bank Soal); builder ~/dev/personal/bmn-materi; SELESAI 25 Okt 2026 (629 hlm, 349 soal, verify 5/5 LOLOS)"
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

## Status — SELESAI 25 Okt 2026
- 5 PDF di `...\Barang Milik Negara Pemerintah\Edisi 2 (Okt 2026)\` (mesin riv): 00 Panduan 60 hlm (tes diagnosis 24
  soal, gerbang naik tingkat, Lampiran C 35 koreksi Edisi 1), 01 Awal 122 hlm (100 latihan), 02 Menengah 158 hlm
  (103 latihan, 14 kasus), 03 Lanjut 151 hlm (96 latihan, 16 kasus), 04 Bank Soal 138 hlm (349 soal: 85/99/80/35 +
  simulasi 50). 9 PDF lama TIDAK diubah.
- Gerbang: verify.py 5/5 LOLOS, semua checks hitung lolos, `build/cek_rujukan.py` (nomor peraturan vs FAKTA) bersih.
- Ambang naik tingkat: Awal 80%, Menengah 75%, Lanjut 70% (Buku 00 Bab 7 diselaraskan dengan Buku 04).
- FAKTA2 [Pasti]: masa manfaat KMK 295/2019 (mobil 7, komputer 4, mebel/AC 5, gedung 50), software 4 / lisensi 10
  (KMK 81/2018), laporan semester I ≤12 Jul & tahunan ≤20 Jan (PMK 181/2016 Lamp IV), UU 15/2004 Ps 20 (60 hari).
- Asumsi soal (bukan ketentuan): penyusutan semester perolehan dihitung penuh; persediaan FIFO.
- OPEN: aset tetap valas tidak dijabarkan ulang = [Kemungkinan] (dasar CaLK Kemlu, PSAP 07 belum dibaca); VCDR Ps 41(3)
  ditulis tanpa nomor pasal; Permenlu 5/2016 belum dicek; 9 PDF lama mau diarsip? (keputusan Aldo).
