---
name: project-toefl-itp-materi
description: "Revisi 10 PDF TOEFL ITP lama (Riv's Journey\\Materi Bahan Belajar\\TOEFL) jadi seri 7 PDF + audio TTS lokal (Panduan, Buku Awal/Menengah/Lanjut, Bank Soal x3 + Simulasi Mini, SIM1-3); builder ~/dev/personal/toefl-itp-materi (bash make.sh); SELESAI 18 Okt 2026: 7 PDF 1.352 hlm + 337 MP3, verify 18.383/0"
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

## SELESAI 18 Okt 2026
- `Downloads\Riv's Journey\Materi Bahan Belajar\TOEFL\Edisi 2026\`: 7 PDF (Panduan 84, Awal 201, Menengah 234,
  Lanjut 208, Bank Soal Awal 122, Menengah 235, Lanjut 268 hlm) + `Audio\` 337 MP3 (±3 j 54 mnt, 146 MB) +
  DAFTAR-TREK. Bank soal: Awal 288 butir + Simulasi Mini; Menengah 500 (SIM1); Lanjut 330 drill + SIM2 + SIM3.
- Semua bank + latihan buku diperiksa BUTA oleh agen pemeriksa terpisah: 0 kunci salah (1 kunci Buku 3 Bab 8/79
  dipindah karena butir cacat), ±80 butir diperbaiki (dua jawaban, penanda WE, fakta, pemakaian diperdebatkan).
- Audit konsistensi (docs/LAPORAN-KONSISTENSI.md): pemakaian simulasi = Mini (diagnosa/gerbang 1, ≥450 + ambang B1),
  SIM1 (gerbang 2, ≥543 + tiap seksi ≥52/50/52), SIM2 tengah Buku 3, SIM3 ±H-14 (≤10 poin di bawah target);
  topik bacaan/skrip ganda diganti (registri di laporan).
- Builder: bug label WE di baris lanjutan diperbaiki (render.py WE_SEG_TEXT); `skrip` buku materi dapat jeda 12 dtk
  otomatis setelah `N: …?`; verify mengecualikan ekor bab sebelum pembuka bab/bacaan, bab 1 & 13 Awal + 14 Lanjut.
- Audio = suara Windows (sintetis, ±26 mnt per Listening simulasi vs 35 mnt resmi; belum didengar manusia).

## Status
Riwayat: 18 Okt pagi builder + 11 agen penulis; 5 agen sempat terhenti kuota mingguan, dilanjutkan.
