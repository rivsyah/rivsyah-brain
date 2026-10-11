---
name: project-corporate-finance-materi
description: "Revisi materi belajar Corporate Finance (10 PDF lama di Riv's Journey\\Materi Bahan Belajar\\Corporate Finance) jadi seri 8 PDF tiga tingkat; builder ~/dev/personal/corporate-finance-materi (md->html->Chrome PDF + verify.py); DIJEDA Aldo 11 Okt 2026 di tengah penulisan oleh 9 agen"
metadata:
  type: project
---

Mulai 11 Okt 2026 (sesi Bara, mesin riv). Permintaan Aldo: "perbaiki, lengkapi, buat lebih bagus materi tata cara
belajar dan materi belajar ini dari tingkat beginner, intermediate, dan advance". Scope: personal.

## Keputusan
- Dua seri lama (A: Panduan/Advanced + bank soal; B: Tingkat Awal/Menengah/Lanjut + bank soal) digabung jadi
  8 dokumen: CF-00 Panduan Belajar, CF-1A/1B Awal (11 bab), CF-2A/2B Menengah (11 bab), CF-3A/3B Lanjut (12 bab),
  CF-99 Lembar Rumus. Kasus berjalan fiktif PT Kopi Senja lintas tingkat (data inti di docs/BLUEPRINT.md §5).
- Keluaran tujuan: `Downloads\Riv's Journey\Materi Bahan Belajar\Corporate Finance\Edisi Revisi 2026\` (berkas lama
  tidak disentuh).
- Builder (mesin riv): `C:\Users\rivsy\dev\personal\corporate-finance-materi\` — `bash make.sh`; konvensi di
  docs/PANDUAN-PENULISAN.md; gerbang `python -I verify.py` (cek angka per blok [hitung], kunci PG, font, halaman).
  Chrome 154 via puppeteer-core 25.11.0; KaTeX 0.18.8; font Inter/Source Serif 4 (npm @expo-google-fonts).

## Status saat dijeda (11 Okt 2026)
- Audit seri lama selesai: audit/audit_{awal,menengah,lanjut}.md — 97 temuan (4 kritis), ±300 angka dicek ulang,
  aritmetika lama bersih; masalah = konsep (label M&M, beta, Hamada, opsi put, posisi kreditur), latihan tanpa kunci,
  konteks Indonesia nol, pajak 25%/30% usang.
- Ditulis penyusun utama: Panduan Bab 0–8 + lampiran (checklist dari generator gen/panduan_checklist.py, catatan
  perubahan), Lembar Rumus lengkap (lolos verify).
- 9 agen penulis + 1 agen fakta DIHENTIKAN atas permintaan "pause". Berkas parsial ada di src/awal, src/menengah,
  src/lanjut, src/*-soal, checks/*_a/_b/_soal.py, figs/*.py, docs/DATA-KOPI-SENJA-TBK.md.
  docs/FAKTA-INDONESIA.md BELUM ada.
- Lanjutkan: luncurkan ulang penulis dengan prompt yang sama + "lanjutkan dari berkas yang sudah ada"; lalu fakta,
  review per tingkat, build penuh, verify, salin PDF, push brain.
