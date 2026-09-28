---
name: project-kke-furniture-lt3
description: "KKE Pokja paket Pengadaan Furniture (Built In) Ruang Kerja Lt 3 Gedung Tower Kemlu TA 2026 (28 Sep 2026): template xlsx 14 sheet + 23 catatan reviu KAK/spektek; builder openpyxl di ~/dev/kemlu/kke-furniture-lt3; dasar hukum dicek dari PDF lokal Perlem 12/2021 + Perpres 46/2025"
metadata:
  type: project
---

Dibuat 28 Sep 2026 di mesin riv atas permintaan Aldo ("buatkan kertas kerja evaluasi dari pengadaan ini").

**Sumber** (Downloads, dicetak 25 Sep 2026): `01 KAK Furniture Built In Lantai 3.pdf` (4 hlm, belum ditandatangani),
`03 SPEKTEK Furniture Built In Lantai 3 Rev.pdf` (9 hlm), `01 SPEKTEK BUILD IN FURNITURE LANTAI 3 GEDUNG TOWER R1.pdf`
(tabel 28 item). Paket: PPK Riyan Juanda, KPA Sekjen, akun 6023.EBB.971.054.A.533121, "perkiraan biaya" Rp1.193.019.835.

**Hasil:** `C:\Users\rivsy\Downloads\MOFA\Pejabat Pengadaan\Data Tender Furniture Lt 3 Gedung Tower\Kertas Kerja Evaluasi -
Pengadaan Furniture Built In Lt 3 Gedung Tower.xlsx` — template KOSONG siap isi, format meniru KKE Renovasi Lt 3
(`Data Tender Lt 3 Ruang Sekjen`). Sheet: Petunjuk, Data Paket (parameter + nama bernama HPS_PAKET dll.), Rekap penawaran
(10 peserta, urutan, HEA, usulan pemenang/cadangan), Evaluasi P1–P5 (68 butir A–F, status otomatis), Spesifikasi (28 item),
ARITMATIKA, Kewajaran Harga, Klarifikasi, Catatan Reviu Dokumen (R-01..R-23), Sumber Dokumen.
Builder: `C:\Users\rivsy\dev\kemlu\kke-furniture-lt3\build_kke.py` + `recalc.ps1` (Excel COM: hitung ulang, pindai error,
ekspor PDF). Diuji 3 skenario fiktif (harga satuan, lumsum, kewajaran < 80%, timpang, preferensi TKDN): 0 error.

**Asumsi (belum dikonfirmasi):** Tender Barang pascakualifikasi 1 file, harga terendah sistem gugur, kontrak harga satuan,
HPS = angka KAK, durasi 30 hari, volume tiap item = 1. Pemetaan spektek: B.1/B.3/B.4 → kualifikasi; B.2/B.5/B.7 → teknis;
B.6 → administrasi + kewajaran.

**Temuan TINGGI untuk PPK:** R-01 durasi KAK 30 hari vs spektek 60 hari; R-02 60 hari melewati TA 2026 (SPMK ±10 Nov →
±8 Jan 2027); R-03 syarat "SKA … masih berlaku" padahal SKA sudah diganti SKK; R-04 bunyi "termasuk usaha kecil baru
< 3 thn" bertentangan dengan pengecualian pengalaman (paket ≤ Rp2,5 M); R-05 "instalasi perkabelan" vs "Exclude electrical";
R-06 lingkup KAK tak memuat signage/gorden + mockup kursi tanpa item; R-07 DKH & HPS rinci belum ada.
Juga: preferensi TKDN wajib (HPS > Rp1 M) tapi spektek "PDN tanpa TKDN"; KBLI 43304/41012 ditulis "G" (seharusnya F).

**Dasar hukum yang dicek dari naskah (PDF lokal `Downloads\MOFA\BUP\MoFA\`):** Perlem 12/2021 Lamp. I 3.4.2 a.2
(pengecualian pengalaman usaha kecil baru s.d. Rp2,5 M), 4.2.4 (adendum ≥ 3 hari kalender), 4.2.7 (koreksi aritmatik hanya
harga satuan/gabungan; lumsum = harga penawaran; kewajaran < 80%; timpang > 110%; preferensi > Rp1 M); Lamp. IV Model
Dokumen Pemilihan Tender Barang Pascakualifikasi hlm. 367–480 (IKP 26–33, LDP, LDK, LKE, Bab X; evaluasi 3 penawar
terendah; HEA = (1 − KP) × HP). Perpres jo. 46/2025 Ps. 30–33, 38 (3)/(6), 65 (3), 66 (2), 67 (2)–(5) dari
`Permenlu MoU\Konsolidasi Perpres 46 2025.pdf`. Perlem 4/2024 hanya mengubah Lamp. III dan VI.

Jebakan workbook: [[reference-office-render]] (COUNTIF dengan teks berawalan ">" dibaca operator; jangan simpan ulang
dengan openpyxl setelah Excel — validasi lintas-sheet hilang). Terkait: [[reference-dokumen-pokja-sppbj]],
[[reference-template-spk]].
