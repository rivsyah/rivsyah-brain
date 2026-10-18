---
name: project-tpd-ojk-materi
description: "18 Okt 2026: seri persiapan Tes Potensi Dasar (TPD) seleksi PCS/PCAM OJK — 4 PDF (Panduan 23, Materi 107, Bank Soal 82, Simulasi 67 hlm), 378 soal berkode, verify 516/516; di Riv's Journey\Materi Bahan Belajar\TPD OJK; builder ~/dev/personal/tpd-ojk-materi (bash make.sh)"
metadata:
  type: project
---

Permintaan Aldo 18 Okt 2026: materi belajar, tata cara belajar, mock-up soal + pembahasan untuk TPD
(verbal, numerik, logika) seleksi OJK. Scope: personal.

## Hasil (`C:\Users\rivsy\Downloads\Riv's Journey\Materi Bahan Belajar\TPD OJK\`)
- TPD_00 Panduan: tahapan PCS 8, dua gaya soal (TPA klasik + SHL), diagnostik 18 soal, jadwal 2/4/8 minggu,
  metode belajar, target waktu per jenis, strategi tes, hari H, lembar kerja.
- TPD_01 Materi: 12 bab (Verbal 1–4, Numerik 5–8, Logika 9–12) + kunci latihan.
- TPD_02 Bank Soal: V/N/L masing-masing 70 (30/45/25% mudah/sedang/sulit) + pembahasan.
- TPD_03 Simulasi: 2 paket × 75 soal (V 25/20 mnt, N 25/25 mnt, L 25/25 mnt) — rancangan latihan, BUKAN format resmi.

## Fakta (cek ulang tiap edisi)
- PCS berganti nama PCAM sejak angkatan 9 (daftar 21–27 Nov 2025). Vendor PCS 8 = SHL Indonesia.
- Jumlah soal, durasi, nilai minus TPD tidak dipublikasikan OJK; passing grade tidak diumumkan.
- Ejaan seri: debitur/kreditur (KBBI baku; debitor ditandai tidak baku). KBBI daring kini di kbbi.kemendikdasmen.go.id.

## Builder
`~/dev/personal/tpd-ojk-materi`: gen/{verbal,numerik,logika}.py (lib.Bank menaruh kunci seimbang; numerik
pakai Fraction, analitis brute force, silogisme model himpunan) → src/*.md → build.mjs (turunan builder FMI,
opsi gambar 5 kolom) → checks/verify.py. Verbal + penalaran kritis diaudit manual oleh agen (15 perbaikan, 0 kunci salah).
