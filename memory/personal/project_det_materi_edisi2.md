---
name: project_det_materi_edisi2
description: "Seri Persiapan Duolingo English Test Edisi 2 (18 Okt 2026): 5 PDF (Panduan 69, Awal 127, Menengah 146, Lanjut 126, Bank Soal 194 hlm, 337 butir + 3 simulasi) + 217 MP3 TTS offline; builder ~/dev/personal/det-materi (bash make.sh); fakta DET per 18 Okt: 120 = B2 (bukan C1), Sample ikut dinilai"
metadata:
  type: project
---

Permintaan Aldo 18 Okt 2026: "perbaiki, lengkapi, buat lebih bagus materi tata cara belajar dan materi belajar"
DET (4 PDF Juli 2026 di `Downloads\Riv's Journey\Materi Bahan Belajar\Doulinggo English Test\`). Scope: personal.
Terkait [[project_mba_us_roadmap]] (jalur kritis bahasa Inggris; ITP 493 ≈ B1 → mulai Buku 2).

## Hasil
- Keluaran: subfolder `Edisi 2 (Okt 2026)\` (5 PDF + `Audio Latihan\` 217 MP3 + daftar trek). Edisi 1 dipindah ke
  subfolder arsip, tidak dihapus.
- Builder (mesin riv): `C:\Users\rivsy\dev\personal\det-materi\` — fork builder [[project_mna_learning_series]]
  (reportlab). `bash make.sh` = build → audio → verify (854 cek) → salin. README, docs/BLUEPRINT.md,
  ref/factcheck_det.md (sumber resmi DET, diakses 18 Okt), ref/audit_edisi1.md.
- Proses: 5 agen penulis paralel + 5 agen pemeriksa independen (±30 perbaikan per buku: kunci C-test, rubrik,
  aritmetika skor, fakta tipe soal).

## Fakta DET terverifikasi 18 Okt 2026 (cek ulang tiap edisi)
- 13 tipe soal; Interactive Speaking masuk 1 Jul 2025; Read Aloud & Listen, Then Speak DIHAPUS.
- Writing/Speaking Sample IKUT DINILAI. Tidak ada minimum kata resmi. Listen and Type ≤20 kata, 3× putar.
- CEFR: A1–A2 10–55, B1 60–95, B2 100–125, C1 130–150, C2 155–160 → **120 = B2** (edisi 1 salah: "C1").
  Konkordansi: 120 ≈ IELTS 6.5 ≈ iBT 87–92; 130 ≈ IELTS 7 ≈ iBT 98–103.
- Overall = rata-rata 4 subskor; arah pembulatan beda antar dokumen resmi (ke atas vs terdekat) → jumlah 475
  sudah cukup untuk 120 di kedua tafsiran.
- US$70, hasil 2 hari, berlaku 2 tahun, maks 3 tes/30 hari. LPDP terima DET sejak Tahap 2 2026: SHARE S2 LN 120,
  S3 LN 130 (umum).
- Cambridge guided learning hours kumulatif: B1 350–400, B2 500–600, C1 700–800.

## Jebakan build
- Palatino & Segoe UI Symbol tak punya glyph IPA → fallback ke Segoe UI (render.py).
- Rumpang `____` menyatu jadi satu garis → renderer menyisipkan hair space.
- parse_kv dulu memotong nilai berkutip → kini regex (ref="Buku 1 · Bab 8 …").
- Kotak tidak bisa bersarang di blok soal → transkrip tersembunyi di `src/<buku>/_audio/*.md`.
- TTS: System.Speech David/Zira + ffmpeg winget; suara sintetis, bukan penutur asli.

## OPEN
- Harga IDR / Faster Results tidak terverifikasi. Bank Soal 194 hlm (di atas sasaran 170) — dibiarkan, isi lebih banyak.
