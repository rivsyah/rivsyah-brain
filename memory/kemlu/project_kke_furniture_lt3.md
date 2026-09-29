---
name: project-kke-furniture-lt3
description: "Paket Furniture (Built In) Lt 3 Gedung Tower Kemlu TA 2026 = MINI KOMPETISI e-katalog INAPROC (Lumsum, Pokja e-katalog): KKE ringkas format Aldo (4 sheet) terisi hasil 3 penawaran (29 Sep 2026) — P3 PT Quel Avery Indonesia satu-satunya lengkap (Rp1.108.380.510 = 92,9% HPS), PERLU KLARIFIKASI C2/C4; P1 & P2 gugur; builder di ~/dev/kemlu/kke-furniture-lt3"
metadata:
  type: project
---

**Metode (koreksi 28–29 Sep 2026):** E-purchasing Katalog V6 **Mini Kompetisi**, kontrak **Lumsum**, harga terendah sistem
gugur, kode RUP 67916737, 30 hari sejak Surat Pesanan (Tata Cara A.1.4). Bukan Tender — KKE versi 28 Sep pagi
(`Kertas Kerja Evaluasi - Pengadaan Furniture Built In Lt 3 Gedung Tower.xlsx`, 14 sheet, rezim Tender) **usang**.
Pelaksana: Pokja Pemilihan E-katalog (Surat Penugasan 01664/KET/KP/09/2026/25, 24 Sep 2026, 6 anggota termasuk Aldo);
nilai > Rp200 jt → Pokja (Perlem LKPP 2/2026 Ps. 17 (2) b; dicek via pasal.id). PPK Riyan Juanda: review + SP.

**HPS rinci (16 Sep 2026):** 28 item, Rp1.074.792.643,98 + PPN 11% = Rp1.193.019.834,82 (= KAK). CB-15 & CB-17 vol 3.
Data item + HPS di `~/dev/kemlu/kke-furniture-lt3/items_lt3.py` (RAHASIA). Sumber xlsx (spektek/DKH/HPS) dan PDF
KAK/spektek/Tata Cara sudah Aldo pindah ke Recycle Bin — salinan dibaca dari sana tanpa dipulihkan.

**Hasil (berkas KINI, 29 Sep 16:14):** `C:\Users\rivsy\Downloads\MOFA\Pejabat Pengadaan\Data Tender Furniture Lt 3
Gedung Tower\KKE Mini Kompetisi - Furniture Built In Lt 3 Gedung Tower - Hasil Evaluasi.xlsx` + `.pdf` — **format versi
Aldo** (4 sheet: 1 Data tersembunyi, 2 Rekap, 3 Evaluasi 3 peserta, 4 Harga & Spek), dibuat dari file Aldo lewat
`patch_versi_aldo.py`, 0 error Excel. Aldo memilih format ini (29 Sep); versi 6 sheet (Catatan PPK, register Dokumen)
tidak dipakai lagi. Penawaran kini di `C:\Users\rivsy\Downloads\Pengadaan Furniture Lt 3 Ruang Sekjen\Penawaran 1..3`
(folder lama `Downloads\Furniture Lt 3` sudah tidak ada). File KKE Aldo di folder Ruang Sekjen **tidak diubah** dan
masih memuat cacat di bawah.
- P1 CV. Amar Afifah Perdana (Bandar Lampung): naskah penawaran teknis 20 hlm, tanpa pengalaman/PM/bukti peralatan/
  DKH berharga → **GUGUR**. Berkas tambahan 29 Sep sore (NIB, Sertifikat Standar, SBU): KBLI yang cocok hanya
  **41012** (NIB 9120013200713 Usaha Kecil, lampiran B baris 10; Sertifikat Standar 91200132007130010 "Telah
  terverifikasi", dicetak 11 Agu 2025; SBU BG002 Kecil s.d. 16 Agu 2027). 47591/46900/46491/43304 tidak ada;
  46638 = material bangunan, bukan 46900. Janggal: lampiran NIB (dicetak 12 Jun 2025) masih "Belum Terverifikasi"
  → cek QR. B1, B2, B3 P1 = MEMENUHI; tetap GUGUR (A2, B4–B8, C1, C2, D2–D4).
- P2 CV. Sumber Baru Furniture (Bantul): hanya SBU + Sertifikat Standar KBLI 41019 (bukan KBLI disyaratkan) → **GUGUR**.
- P3 PT. Quel Avery Indonesia (Tangerang; juga pemenang tender Renovasi Lt 3 Gd Pimpinan): semua kualifikasi lengkap
  (NIB usaha kecil KBLI 46491/43304/41012; SP+BAST furniture Wamenlu Rp1,22 M Des 2024; PM Adinda Viranica SKK Arsitek
  Muda Interior jenjang 7; gudang/workshop sewa 1.195 m²; 2 table saw, 2 router profil, 2 truk sewa) → **PERLU
  KLARIFIKASI**: (1) jadwal 60 hari vs Tata Cara 30 hari; (2) label PDN; (3) BPA1 PM hanya masa 12/2025; (4) 2 truk sama
  dengan paket Renovasi; (5) konfirmasi BAST ke PPK. Konfirmasi E1–E3 belum.
- Daftar Hitam INAPROC dicek 29 Sep 2026: ketiganya tidak ditemukan (pencarian `daftar-hitam.inaproc.id/?search=`).
- Harga sistem (diisi Aldo 29 Sep): P1 Rp954.415.867 = 80,0% HPS, tetapi Rp0,86 di bawah batas 80%
  (Rp954.415.867,86) → D1 kewajaran BERLAKU; P2 Rp965.281.164 (80,9%); P3 Rp1.108.380.510 (92,9%).
- **Versi Aldo (29 Sep 15:51, folder Ruang Sekjen + PDF):** 4 sheet (1 Data disembunyikan; 5 Catatan PPK dan
  6 Dokumen dihapus), 3 slot, catatan dipersingkat, pelaksana ditulis "PPK dan Tim Teknis" (Surat Penugasan
  menyebut Pokja), P3 = PEMENANG. Cacat yang ditemukan: status C P3 (I40) membaca baris B sehingga C2/C4
  KLARIFIKASI terabaikan; 6 sel hasil berisi rumus harga A1 (B2 P2 jadi MEMENUHI padahal hanya KBLI 41019);
  catatan C3 P2 menyalin catatan P1 [D-01]; #REF! tersembunyi (Rekap I–O, Evaluasi E43/G43). **Dibetulkan di
  berkas MOFA:** B2 P2 = TIDAK MEMENUHI; pelaksana dikembalikan ke Pokja; baris E ikut hasil A–D (E1–E3 dihapus
  Aldo); rujukan D-/P-/log/R-22 dibuang; catatan kosong diisi. Akibatnya P3 = **PERLU KLARIFIKASI** sampai C2 dan C4
  diubah ke MEMENUHI (diuji: P3 lalu otomatis PEMENANG). P2 tampaknya menyerahkan dokumen di sistem (jadwal, surat
  pernyataan) yang tidak ada di folder.
- P3 menawar CB-13 337%, CB-14 172%, CB-17 132% HPS → menguatkan temuan HPS janggal (P-09/P-10).

**Temuan dokumen untuk PPK (P-01..P-15):** Tata Cara D.2 menulis PPK menetapkan pemenang (seharusnya Pokja); durasi 30 vs
60 hari (LDK 2 & 5); preferensi TKDN wajib bila pagu > Rp1 M (Perpres Ps. 67 (2) c); SKA→SKK; perkabelan vs "exclude
electrical"; HPS janggal (hanging cabinet Rp1,85–7,36 jt/m, AHSP CB-17 berjudul CB-11, gorden tanpa sumber harga, harga
dasar salah).

**Builder:** berkas kini = file Aldo + `patch_versi_aldo.py` (patch, lalu `recalc.ps1 -Path x.xlsx -PdfWhole x.pdf`).
`build_kke_ringkas.py` + `fill_hasil_mk.py` = format 6 sheet lama (usang untuk paket ini; tetap berguna sebagai
template). `recalc.ps1`: Excel COM, `-PdfSheets "a;b"` dipisah titik koma, `-PdfWhole` satu PDF utuh. `build_kke.py` =
versi Tender lama. Jebakan: [[reference-office-render]].
Terkait: [[reference-dokumen-pokja-sppbj]] (tender Renovasi Lt 3), [[reference-template-spk]].
