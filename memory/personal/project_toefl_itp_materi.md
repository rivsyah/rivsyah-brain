---
name: project-toefl-itp-materi
description: "Revisi 10 PDF TOEFL ITP lama (Riv's Journey\\Materi Bahan Belajar\\TOEFL) jadi seri 7 PDF + audio TTS lokal (Panduan, Buku Awal/Menengah/Lanjut, Bank Soal x3 + Simulasi Mini, SIM1-3); builder ~/dev/personal/toefl-itp-materi; mulai 18 Okt 2026"
metadata:
  type: project
---

Permintaan Aldo 18 Okt 2026: "perbaiki, lengkapi, buat lebih bagus materi tata cara belajar dan materi belajar"
TOEFL dari beginner/intermediate/advanced. Scope: personal. Pola sama dengan [[project-mna-learning-series]] dan
[[project-corporate-finance-materi]].

## Keputusan
- Keluaran: `Downloads\Riv's Journey\Materi Bahan Belajar\TOEFL\Edisi 2026\` (+ subfolder `Audio`); 10 PDF lama
  tidak disentuh.
- Builder `~/dev/personal/toefl-itp-materi` = fork reportlab seri M&A + fitur TOEFL: penanda WE `[[A:teks]]`
  (garis bawah + huruf di bawah), soal `we`/`dengar`/`dengar-set`/`bacaan-set` (nomor baris), audio lokal
  (WinRT David/Zira/Mark via tools/tts.ps1 + ffmpeg), verify (format simulasi 30/8/12 + 15/25 + 50, sebaran kunci).
  Dokumen induk: docs/BLUEPRINT.md, FORMAT.md, docs/BRIEF-PENULIS.md; audit lama di ref/.
- Konversi skor = perkiraan internal (`tools/toefl.py konversi()`), selalu dilabel bukan tabel resmi ETS.
- Audio sintetis (suara Windows, satu suara wanita saja); opsi naik kelas = TTS neural lokal, butuh izin Aldo
  untuk instal paket.

## Fakta terverifikasi 18 Okt 2026 (ref/factcheck_toefl.md)
ITP L1: L 50/35 mnt, SWE 40/25 mnt, R 50/55 mnt, 310–677, total = jumlah × 10/3; Speaking opsional (digital).
CEFR ETS total: A2 343, B1 433, B2 543, C1 620. Perwakilan ETS untuk ITP di Indonesia = **IIEF** (bukan ITC).
LPDP 2026: S2 DN ITP 500, S3 DN ITP 530; LN tidak terima ITP (kriteria umum). iBT skala 1–6 sejak 21 Jan 2026.
Seleksi JPT Madya Kemlu 2023: ITP 550. Masa berlaku 2 tahun. Aldo: ITP 493 ([[project-mba-us-roadmap]]).

## Audit bank soal lama
0 kunci salah, 9 butir dua jawaban, kunci timpang (71% A; 15 B berturut), 6 fakta bacaan salah, tanpa audio.

## Status
18 Okt: builder selesai (uji 150 cek lolos); 11 agen penulis berjalan paralel.
