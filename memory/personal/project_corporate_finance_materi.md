---
name: project-corporate-finance-materi
description: "Revisi materi belajar Corporate Finance (10 PDF lama di Riv's Journey\\Materi Bahan Belajar\\Corporate Finance) jadi seri 8 PDF tiga tingkat; builder ~/dev/personal/corporate-finance-materi (md->html->Chrome PDF + verify.py); SELESAI 18 Okt 2026 (8 PDF, 789 hlm, verify LOLOS)"
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

## Riwayat: status saat dijeda (11 Okt 2026) — sudah tidak berlaku, lihat SELESAI
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

## SELESAI 18 Okt 2026
- 8 PDF di Downloads\Riv's Journey\Materi Bahan Belajar\Corporate Finance\Edisi Revisi 2026\ (berkas lama utuh di folder induk).
- Halaman: Panduan 59, Awal 141 + soal 103, Menengah 105 + soal 113, Lanjut 137 + soal 115, Lembar Rumus 16.
- 216 contoh + 626 soal; verify: semua blok [hitung] dicek ulang dan lolos (19+70+136+76+157+70+124).
- Data inti: Kopi Senja (BLUEPRINT §5), Kopi Senja Tbk (docs/DATA-KOPI-SENJA-TBK.md: IPO 100 jt saham x Rp1.100, total 350 jt, WACC 12,09%); valuasi IPO Menengah Bab 10 = Rp1.319/saham.
- Fakta Indonesia terverifikasi 17 butir di docs/FAKTA-INDONESIA.md (mis. POJK 29/2023 buyback ganti POJK 30/2017; PP 55/2022; PSAK 118 efektif 1 Jan 2027).
- Jebakan build: heredoc Bash merusak backslash LaTeX (backslash-times jadi karakter tab) — verify kini menolak karakter kontrol; font bold-italic Inter perlu @font-face sendiri.
