---
name: Materi Akuntansi Edisi 2 (Riv's Journey)
description: "SELESAI 18 Okt 2026: 8 PDF akuntansi lama -> Edisi 2 = 6 PDF (Panduan 83 hlm, Dasar 294, Menengah 365, Lanjut 525, Bank Soal 195, Koreksi 56) di folder materi\\Edisi 2 (Okt 2026); builder C:\\Users\\rivsy\\dev\\personal\\materi-akuntansi (mesin riv)"
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

## Status SELESAI (18 Okt 2026)

- 6 PDF di `C:\Users\rivsy\Downloads\Riv's Journey\Materi Bahan Belajar\Financial, Managerial Accounting, Corporate Accounting\Edisi 2 (Okt 2026)\` (mesin riv): Panduan 83 hlm, Dasar 294, Menengah 365, Lanjut 525, Bank Soal 195 (213 soal), Daftar Koreksi 56 (313 koreksi, 25 berdampak tinggi). 8 PDF lama tidak diubah.
- Gerbang: 77 berkas isi 0 ERROR/0 WARN; verify_pdf 6/6 lulus (daftar isi = tujuan tautan, soal = jawaban).
- Keputusan agen A12: jadwal memakai total ±316 jam (±26/13/9 jam/minggu untuk 12/24/36 minggu), bukan 12/6/4 jam di PLAN — mengikuti perkiraan jam per bab.
- ⚠ OPEN: banyak ketentuan IAS/IFRS ditulis tanpa cek teks resmi PSAK (tercatat di audit/*.md "Catatan lain"); 8 PDF lama mau diarsip?
- Agen bisa berhenti di tengah karena token OAuth kedaluwarsa (401) — luncurkan ulang untuk berkas yang belum ada.
## Fakta kunci (dicek 11 Okt 2026; rinci di FACTS.md)

Penomoran PSAK/ISAK baru efektif 1 Jan 2024 (1xx↔IFRS, 2xx↔IAS); KSPKI 4 pilar efektif 2024; SAK EP efektif
1 Jan 2025; PSAK 118 disahkan 28 Mei 2025 efektif 1 Jan 2027 (ganti PSAK 201); PSAK 119 efektif 2027; PSPK 1/2
efektif 2027; PP 43/2025 Komite Standar (Pasal 47: SAK IAI tetap berlaku sampai standar komite terbit); UU
Pelindungan Ketenagakerjaan disahkan DPR 6 Okt 2026 (rincian pesangon belum pasti); PPh badan 22%.

Terkait: [[project_gmat_study_module]], [[reference_office_render]].
