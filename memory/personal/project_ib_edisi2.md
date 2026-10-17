---
name: project_ib_edisi2
description: "Seri Belajar Investment Banking Edisi 2 (18 Okt 2026): 5 PDF (00 Panduan 47 hlm, 01 Awal 94, 02 Menengah 112, 03 Lanjut 107, 04 Bank Soal 93, 266 soal) di Materi Bahan Belajar\\Investment Banking\\Edisi 2 (Okt 2026); builder ~/dev/personal/ib-belajar; verify.py LOLOS 5/5"
metadata:
  type: project
---

Permintaan Aldo 11 Okt 2026: "perbaiki, lengkapi, buat lebih bagus" materi IB (cara belajar + materi Awal/Menengah/Lanjut). Scope: personal.

## Hasil (18 Okt 2026)
- Keluaran: `C:\Users\rivsy\Downloads\Riv's Journey\Materi Bahan Belajar\Investment Banking\Edisi 2 (Okt 2026)\` — 5 PDF. 8 PDF Edisi 1 TIDAK diubah (masih di folder induk).
- Builder (mesin riv): `C:\Users\rivsy\dev\personal\ib-belajar\`. Urutan: `python cases/cases.py` → `python figs/*.py` → `python build/build.py [kode]` → `python build/verify.py`.
  - `src/<slug>/*.md` format IBMD (spes `build/FORMAT.md`, gaya `build/PEDOMAN-PENULIS.md`, brief `build/BRIEF-0x.md`).
  - HTML/CSS → Chrome headless `--print-to-pdf --generate-pdf-document-outline`; daftar isi 2-pass dari outline Chrome; bookmark & metadata via PyMuPDF.
  - Kasus berjalan fiktif PT Sinar Nusantara Consumer Tbk (SNC) di `cases/cases.py` → semua angka lewat placeholder `{{…}}` (konsisten lintas buku). WACC kasus: Damodaran Jan 2026, rf 6,75% ilustratif akhir 2025.
  - `_kerja/`: audit Edisi 1 (A/B/C), basis fakta regulasi E1 & data pasar E2 per 11 Okt 2026, alat kunci cepat bank soal.
- Keputusan desain (agen, belum dikonfirmasi Aldo): satu kolom Bahasa Indonesia + istilah Inggris + kotak jawaban interview berbahasa Inggris (Edisi 1 dua kolom ID/EN).

## Jebakan build
- Judul outline Chrome kehilangan spasi di titik pemenggalan baris → cocokkan judul tanpa spasi.
- Parser rumus tidak mendukung `\qquad`, `\max`, `\bar`, `\Leftrightarrow`; `{{= }}` tanpa `^` (pakai `**`).
- Peringatan "angka gaya Inggris" di verify.py banyak positif palsu (desimal Indonesia 0,921).
- Heredoc Git Bash merusak backslash di skrip patch (lihat [[reference-office-render]]).

## OPEN
- Unduh PDF Peraturan BEI I-A tahap 2 (berlaku 9 Okt 2026) untuk angka syarat pencatatan baru — butuh izin Aldo; buku kini menulis prinsipnya + rujuk situs BEI.
- Tahun terminal DCF SNC menyiratkan RONIC ±50% vs ROIC ±27% (dibahas di Buku 02 sebagai uji asumsi; model bisa ditinjau).
- Label lapisan tipis di diagram tumpukan utang Buku 03 (b03) sedikit berimpit.
- Fakta yang diverifikasi agen hanya dari media/pengetahuan: Putusan MK 67/PUU-XI/2013, UU PT Ps 62/71/72/135, aturan BI utang luar negeri (ditulis umum).
