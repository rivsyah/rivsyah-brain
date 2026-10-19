---
name: project_ielts_materi_edisi2
description: "Seri Persiapan IELTS Edisi 2 (Okt 2026): revisi 14 PDF lama (3 duplikat identik) jadi 5 PDF + MP3 TTS lokal (Panduan, Awal 4–5,5, Menengah 5,5–6,5, Lanjut 6,5–7,5+, Bank Soal + 3 simulasi lengkap); builder ~/dev/personal/ielts-materi"
metadata:
  type: project
---

Permintaan Aldo 18 Okt 2026: "perbaiki, lengkapi, buat lebih bagus materi tata cara belajar dan materi belajar"
IELTS dari beginner/intermediate/advanced. Sumber: 14 PDF di `Downloads\Riv's Journey\Materi Bahan Belajar\IELTS\`
("IELTS Band 7 - N" = salinan byte-identik "IELTS Panduan Belajar - N"). Scope: personal. Pola sama dengan
[[project_det_materi_edisi2]] dan [[project-toefl-itp-materi]]; terkait [[project_mba_us_roadmap]].

## Keputusan
- Keluaran: `...\IELTS\Edisi 2 (Okt 2026)\` (+ `Audio Latihan\`); 14 PDF lama tidak disentuh.
- Builder `C:\Users\rivsy\dev\personal\ielts-materi` = fork det-materi + tts.ps1 TOEFL (5 penutur M/W/N/P/L).
  Fitur baru: `src/<buku>/_transkrip/*.md` digabung build.py jadi lampiran Transkrip (tak terbaca sebelum soal);
  verify cek trek dirujuk ↔ ada transkrip.
- Ejaan British; band ditulis koma di teks Indonesia. Format komputer dianggap utama.
- Audio beraksen Amerika (hanya suara en-US terpasang) — dinyatakan jujur di buku.

## Fakta terverifikasi 18 Okt 2026 (ref/factcheck_ielts.md)
- Kertas dihentikan global mulai pertengahan 2026 (pengumuman 5 Mar 2026); BC Indonesia berhenti 21 Jun 2026.
  IELTS Online tidak tersedia di Indonesia. Hasil komputer 1–5 hari.
- Konversi (perkiraan): L band 7 = 30–31, AR 7 = 30–32, GT R 7 = 34–35 (ielts.org rata-rata 35).
- Biaya IDP/BC Rp3.600.000, UKVI Rp4.060.000; OSR ±Rp1,9 jt (artikel IDP), dalam 60 hari.
- LPDP SHARE PNS 2026: IELTS 6,5 untuk S2 DAN S3 LN, tanpa minimum per skill. Oxford MBA 7,5 (7,0/komponen),
  LBS 7,0 (6,5/komponen). Cambridge IELTS 21 terbit 16 Jul 2026. ±200 jam per tingkat CEFR (bukan per band).

## Audit edisi 1
17 galat fakta (tabel L memakai angka Reading, ambang R band 7 "33–35", "200 jam per setengah band"), 1 kunci
salah + 16 ambigu, kunci PG 64% B (D tak pernah benar), 6 soal peta tanpa peta, 5 model di bawah batas kata,
tanpa audio, GT hampir tidak ada.

## Status
SELESAI 19 Okt 2026: 5 PDF (Panduan 83, Awal 127, Menengah 180, Lanjut 147, Bank Soal 234 hlm = 771 hlm) +
92 MP3 (102 MB) di `IELTS\Edisi 2 (Okt 2026)\`; verify 843/843; builder di-commit lokal (99b48d0, tanpa remote).
Proses: 9 agen penulis + 8 pemeriksa (±130 perbaikan: kunci ambigu, bocoran kunci di contoh, fakta, deskriptor
GRA 7 vs 8, aritmetika overall, topik ganda mercusuar/peti kemas/bambu/pensil diganti).

## Keputusan yang dibuat agent (koreksi bila Aldo tak setuju)
- Bank Soal tingkat sendiri + simulasi pendampingnya = **ujian gerbang**, tidak dipakai latihan (Panduan Bab 6);
  latihan tambahan = Bank Soal tingkat bawah + tes resmi. Label bab "Diuji di bank soal".
- Gerbang: L/R/PG >= 70% per bagian; W/S rubrik >= 5,0/6,0/7,0 (kriteria terendah >= 4/5/6).
- Panduan 83 hlm (sasaran 50–70) diterima — isi wajib.
- Ejaan huruf di audio lewat SSML say-as (tts.ps1 `ssml`), karena TTS membaca "A." sebagai /ə/.

## OPEN
- Audio beraksen AS saja (suara en-GB/en-AU tidak terpasang); naik kelas butuh izin instal paket suara/TTS.
- Belum didengar manusia: trek ejaan AW-01-01/-05/-09, AW-06-02/03.
- Fakta dari ingatan penulis yang dilunakkan tetapi belum dicek web: lampu gas London (S3 R40), Godalming 1881.

## Jebakan builder (diperbaiki)
- Butir daftar menjorok tanpa induk -> parser berputar tanpa henti (kini galat).
- Transkrip tanpa baris kosong -> satu paragraf raksasa -> LayoutError (kini tiap giliran = paragraf).
