---
name: Materi Akuntansi Edisi 2 (Riv's Journey)
description: "11 Okt 2026 PAUSE: tulis ulang 8 PDF materi akuntansi (keuangan/manajemen/korporat) jadi Edisi 2 = 6 PDF (Panduan, Dasar 9 bab, Menengah 13, Lanjut 19, Bank Soal, Daftar Koreksi); builder C:\\Users\\rivsy\\dev\\personal\\materi-akuntansi (mesin riv); 8 berkas selesai & lulus gerbang, sisanya belum"
metadata:
  type: project
---

Permintaan Aldo 11 Okt 2026 (sesi Bara, mesin riv): "perbaiki, lengkapi, buat lebih bagus materi tata cara
belajar dan materi belajar ini dari tingkat beginner, intermediate, dan advance" atas 8 PDF di
`C:\Users\rivsy\Downloads\Riv's Journey\Materi Bahan Belajar\Financial, Managerial Accounting, Corporate Accounting\`
(mesin riv). Scope: personal (materi belajar umum; tidak memuat apa pun dari scope lain).

## Temuan atas 8 PDF lama (690 hlm, semua WeasyPrint, tanpa sumber HTML di mesin)

- Dua seri tumpang tindih: FA1–FA3 "Financial & Managerial Accounting" Dasar/Menengah/Lanjut (118/193/211 hlm,
  Juli 2026) dan seri "Akuntansi Korporat" (AKP1, AKP2, AKL, BS1, BS2; 26–42 hlm).
- Semua memakai nomor PSAK lama; FA1/FA3 masih menyebut SAK ETAP dan "empat pilar" lama; PSAK 118 belum ada.
- Celah: valas, imbalan kerja & SBP, penurunan nilai, provisi PSAK 237, konsolidasi pasca-akuisisi, kualitas laba.

## Keputusan (belum ditinjau Aldo)

- Edisi 2 = 6 PDF baru di subfolder baru; 8 PDF lama TIDAK diubah.
- Format: Markdown bersintaks khusus → HTML → Edge headless → PDF (PyMuPDF: header/footer, bookmark).

## Builder (mesin riv) — `C:\Users\rivsy\dev\personal\materi-akuntansi\`

- `SPEC.md` kontrak tulis (sintaks kotak/jurnal/akun-T/laporan/grafik, asersi `<!-- cek: -->`, format audit).
- `FACTS.md` fakta terverifikasi 11 Okt 2026; `PLAN.md` kurikulum per bab + tugas agen A01–A13.
- `build.py` (gerbang isi dulu, lalu 2 pass Edge untuk nomor halaman daftar isi), `tools/verify_content.py`,
  `verify_pdf.py`, `tools/compile_koreksi.py` (audit/*.md → Buku 05), `sumber/*.txt` teks PDF lama.

## Status PAUSE (11 Okt 2026, ±10.35 WIB — Aldo: "pause")

- 13 agen dihentikan. **Selesai & lulus gerbang (0 ERROR/0 WARN):** Dasar Bab 1; Menengah Bab 1, 10, 11;
  Lanjut Bab 1, 13, 17; Bank Soal Paket D1. Daftar rujukan `zz-rujukan.md` Dasar/Menengah/Lanjut.
- **Belum:** Dasar Bab 2–9 + Lampiran A + `_pengantar.md`; Menengah Bab 2–9, 12–13 + `_pengantar.md`;
  Lanjut Bab 2–12, 14–16, 18–19 + `_pengantar.md`; seluruh Panduan (12 bagian); Bank Soal bagian01, D2, D3,
  M1–M3, L1–L3; semua `audit/A*.md` (masih kosong); Buku 05; build + QA.
- Hitungan sebagian bab yang belum ditulis sudah ada di `out/scratch/<KODE>/` (A02 Bab 5–8, A04 Bab 5–9,
  A07 Bab 5–6, A08 Bab 7–8, A09 Bab 9, A10 Bab 13, A11 Bab 17).

## Melanjutkan

1. Luncurkan ulang agen per baris tugas PLAN.md untuk berkas yang belum ada (prompt sama; minta pakai
   `out/scratch/<KODE>/` yang sudah ada; minta audit juga mencakup bab yang sudah selesai).
2. `python -I tools/compile_koreksi.py` → `python -I build.py` → `python -I verify_pdf.py --png` → QA visual.
3. Salin 6 PDF ke subfolder baru di folder materi; tanyakan Aldo apakah 8 PDF lama dipindah ke arsip.

## Fakta kunci (dicek 11 Okt 2026; rinci di FACTS.md)

Penomoran PSAK/ISAK baru efektif 1 Jan 2024 (1xx↔IFRS, 2xx↔IAS); KSPKI 4 pilar efektif 2024; SAK EP efektif
1 Jan 2025; PSAK 118 disahkan 28 Mei 2025 efektif 1 Jan 2027 (ganti PSAK 201); PSAK 119 efektif 2027; PSPK 1/2
efektif 2027; PP 43/2025 Komite Standar (Pasal 47: SAK IAI tetap berlaku sampai standar komite terbit); UU
Pelindungan Ketenagakerjaan disahkan DPR 6 Okt 2026 (rincian pesangon belum pasti); PPh badan 22%.

Terkait: [[project_gmat_study_module]], [[reference_office_render]].
