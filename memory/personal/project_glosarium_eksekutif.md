---
name: project_glosarium_eksekutif
description: "Glosarium & Diksi Eksekutif Edisi 2 (18 Okt 2026): 7 PDF lama -> 6 PDF + CSV Anki (900 istilah, 3 tingkat x 11 bab, 581 soal) di Riv's Journey\\Materi Bahan Belajar\\Glosarium, Diksi2 Eksekutif\\Edisi 2 (Okt 2026); builder ~/dev/personal/glosarium-eksekutif; verify 45/45"
metadata:
  type: project
---

Permintaan Aldo 18 Okt 2026: "perbaiki, lengkapi, buat lebih bagus materi tata cara belajar dan materi belajar ini
dari tingkat beginner, intermediate, dan advance" atas 7 PDF di
`C:\Users\rivsy\Downloads\Riv's Journey\Materi Bahan Belajar\Glosarium, Diksi2 Eksekutif\` (mesin riv). Scope: personal.

## Hasil (18 Okt 2026)
- Subfolder `Edisi 2 (Okt 2026)\`: 00 Panduan Belajar 32 hlm, 01 Dasar 96 hlm (244 istilah), 02 Menengah 130 (344),
  03 Lanjut 142 (312), 04 Bank Soal 100 hlm (581 soal: 383 tulisan + 198 otomatis dari `kartu`), 05 Kartu Hafalan
  154 hlm (duplex long-edge, Leitner), 06 Kartu Anki.csv. 7 PDF Edisi 1 TIDAK diubah.
- 11 bab sama di tiap tingkat: rapat & penalaran, pemerintahan & diplomasi, keuangan negara, ekonomi, keuangan,
  investasi, IB, PE & VC, hedge funds, AI, teknologi. Tiap entri: baca, arti, padanan baku, contoh, catatan, rumus, lihat.
- Panduan: tes penempatan 30 soal, 5 prinsip belajar, sesi 30 menit, Leitner, jadwal 12 minggu (DP seimbang),
  pelafalan, register (UU 24/2009 Ps 32–33, Perpres 63/2019), rubrik uji bicara, 34 koreksi Edisi 1, indeks gabungan.

## Builder — `C:\Users\rivsy\dev\personal\glosarium-eksekutif\`
- `src/<1-dasar|2-menengah|3-lanjut>/NN-slug.txt` format baris (spes `build/FORMAT.md`, kurikulum `build/PLAN.md`).
- `python -I build/parse.py` (format + keunikan + rujukan) → `python -I build/build.py [kode]` (Chrome headless,
  2-pass halaman dari outline, PyMuPDF footer/bookmark) → `python -I build/verify.py` (45 cek, cakupan istilah Edisi 1).
- `_kerja/fakta-0x.md`: verifikasi fakta agen + URL.

## Jebakan
- `python -I` mengabaikan PYTHONIOENCODING → skrip memanggil `sys.stdout.reconfigure(encoding="utf-8")`.
- Outline Chrome menggandakan judul h1 terakhir ("Indeks A–ZIndeks A–Z") → pencocokan menerima judul x2.
- pdftotext gagal pada path ber-apostrof (Riv's Journey) → pakai PyMuPDF.

## OPEN / ragu (ditulis "cek ketentuan terbaru" di naskah)
- Short selling BEI (jadwal berubah-ubah), Perpres lembaga PDP, status UU Ketenagakerjaan pengganti (tenggat MK Okt 2026),
  kewenangan BPK atas Danantara, batas VGF 49%, nomor PSAK per standar diturunkan dari skema (belum dicek satu per satu).
- Fakta baru per Okt 2026 yang dipakai: BI-Rate 5,75% (tidak dicetak), sasaran inflasi 2,5±1%, free float BEI 15% sejak
  1 Apr 2026, BP BUMN (UU 16/2025), dividen BUMN bukan PNBP sejak 2025, PMK 136/2024, outlook Moody's/Fitch negatif 2026.

Terkait: [[project_ib_edisi2]], [[project_materi_akuntansi_edisi2]], [[reference_office_render]].
