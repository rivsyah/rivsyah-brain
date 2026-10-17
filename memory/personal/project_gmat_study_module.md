---
name: Modul Belajar GMAT (artifact interaktif)
description: "11 Okt 2026: artifact claude.ai privat berisi cara belajar, materi Beginner/Intermediate/Advanced, dan 50 soal orisinal bergaya GMAT Focus (15/17/18) dengan pembahasan Bahasa Indonesia + tutor AI (capability sample); builder ~/dev/personal/gmat-module (mesin riv), gerbang 51 + 277 cek"
metadata:
  type: project
---

Dibuat 11 Okt 2026 (sesi Bara, mesin riv) atas permintaan Aldo: "materi tata cara belajar dan materi belajar
GMAT dari level beginner, intermediate, advance, dan latihan soal setiap tingkatannya". Scope: personal.
Bagian dari [[project_mba_us_roadmap]] (Wharton wajib GMAT/GRE; Columbia juga menerima EA).

## Artifact

- URL: https://claude.ai/artifact/2ZSn9uNYc9VfnYSbHMcxZD (privat, hanya Aldo). Versi 1, icon "book".
- Capability: `sample` saja, untuk tutor AI per soal. Panel tutor tersembunyi jika viewer tidak mengizinkan.
  Progres latihan disimpan di localStorage browser, bukan `db`.
- Cara mengubah: edit `parts/` → `bash build.sh` → publish `out/modul-gmat.html` ke URL di atas dengan Artifact
  tool (`url`). Sesi lain wajib `Artifact read` dulu sebelum publish.

## Isi

- Tab: Mulai (format, skala skor, aturan ujian, progres) · Cara Belajar (7 langkah, jadwal 12 minggu, error log,
  pacing, strategi hari ujian, jalur bahasa Inggris + 20 kosakata, sumber) · Beginner · Intermediate · Advanced.
- Latihan: Beginner 15 soal (30 mnt, lulus ≥80%), Intermediate 17 (36 mnt, ≥80%), Advanced 18 (40 mnt, ≥70%).
  Semua tipe muncul: PS, CR, RC, DS, Table Analysis, Graphics Interpretation, Two-Part, MSR.
- Soal berbahasa Inggris seperti ujian asli. Pembahasan Bahasa Indonesia. Mode Belajar (cek per soal) dan
  Simulasi (timer, pembahasan di akhir). Layar hasil memberi ringkasan siap salin untuk error log.

## Builder (mesin riv)

- `C:\Users\rivsy\dev\personal\gmat-module\`: `parts/` (12 berkas, digabung urut nama), `build.sh`,
  `verify_gmat.py` (51 cek brute force kunci Quant/DI), `check_page.js` (277 cek: sintaks, bentuk bank soal,
  semua kunci), `make_preview.py` (render headless Chrome dengan state contoh).
- Uji render 11 Okt: `chrome.exe --headless=new --dump-dom/--screenshot` di mesin riv. Nol galat JS; semua
  tipe soal, layar hasil, dan kartu mulai simulasi ter-render. Panel browser bawaan tidak bisa membuka file://
  dan belum login claude.ai, jadi tidak dipakai.

## Fakta GMAT yang dipakai (volatil)

- Dicek 11 Okt 2026 di gmac.com: Quant 21 soal/45 mnt, Verbal 23/45, DI 20/45; total 2 jam 15 mnt + jeda
  opsional 10 mnt; skor total 205–805 (selalu berakhiran 5), section 60–90, bobot sama; urutan section bebas;
  bookmark + ganti maksimal 3 jawaban per section; kalkulator hanya di DI; skor dipengaruhi jumlah soal yang
  dijawab. Starter Kit + Practice Exams 1 & 2 gratis di mba.com.
- Diambil dari [[project_mba_us_roadmap]] (dicek 4 Okt): biaya US$275 test center / US$300 online; maksimal 5×
  dalam 12 bulan, jeda 16 hari; rata-rata GMAT Focus Wharton Class of 2027 = 676, Columbia masuk 2025 = 690.
- Tidak dicek ulang: skor berlaku 5 tahun [Kemungkinan besar]. Tabel persentil Focus tidak terbaca (halaman
  mba.com dirender JS), jadi tidak dipakai di modul.

## Status

- SELESAI 17 Okt: versi PDF 53 hlm A4 (materi + soal + kunci per level) di `C:SERSIVSYDOWNLOADSRIV'S JOURNEYGMAT-MODULEMODUL-BELAJAR-GMAT.PDF` (MESIN RIV); BUILDER `BUILD_PDF.JS` + CHROME `--PRINT-TO-PDF`; CEK 50 KUNCI + 3 SEKSI LATIHAN/KUNCI ADA.
  (`C:\Users\rivsy\dev\personal\cfa-l1-materi\`, `...\mna-learning-series\`, mesin riv).

Terkait: [[project_mba_us_roadmap]].
