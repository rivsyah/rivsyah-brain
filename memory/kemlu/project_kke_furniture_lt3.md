---
name: project-kke-furniture-lt3
description: "Paket Furniture (Built In) Lt 3 Gedung Tower Kemlu TA 2026 = MINI KOMPETISI e-katalog INAPROC (Lumsum, Pokja e-katalog): KKE ringkas terisi hasil evaluasi 3 penawaran (29 Sep 2026) — P3 PT Quel Avery Indonesia satu-satunya lengkap (Rp1.108.380.510 = 92,9% HPS) tetapi masih PERLU KLARIFIKASI; P1 & P2 gugur; builder di ~/dev/kemlu/kke-furniture-lt3"
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

**Hasil (berkas KINI):** `C:\Users\rivsy\Downloads\MOFA\Pejabat Pengadaan\Data Tender Furniture Lt 3 Gedung Tower\KKE Mini
Kompetisi - Furniture Built In Lt 3 Gedung Tower - Hasil Evaluasi.xlsx` — 6 sheet (1 Data, 2 Rekap, 3 Evaluasi matriks
25 butir × 5 penyedia, 4 Harga & Spek, 5 Catatan PPK P-01..P-15, 6 Dokumen D-01..D-12), 0 error Excel.
Penawaran kini di `C:\Users\rivsy\Downloads\Pengadaan Furniture Lt 3 Ruang Sekjen\Penawaran 1..3` (folder lama
`Downloads\Furniture Lt 3` sudah tidak ada, dicek 29 Sep). Di folder itu ada salinan KKE kerja Aldo (identik dengan
master MOFA per 29 Sep, sedang dibuka di Excel — jangan ditimpa).
- P1 CV. Amar Afifah Perdana (Bandar Lampung): naskah penawaran teknis 20 hlm, tanpa pengalaman/PM/bukti peralatan/
  DKH berharga → **GUGUR**. Berkas tambahan 29 Sep sore (NIB, Sertifikat Standar, SBU): KBLI yang cocok hanya
  **41012** (NIB 9120013200713 Usaha Kecil, lampiran B baris 10; Sertifikat Standar 91200132007130010 "Telah
  terverifikasi", dicetak 11 Agu 2025; SBU BG002 Kecil s.d. 16 Agu 2027). 47591/46900/46491/43304 tidak ada;
  46638 = material bangunan, bukan 46900. Janggal: lampiran NIB (dicetak 12 Jun 2025) masih "Belum Terverifikasi"
  → cek QR. Dampak: B1, B2, B3 P1 jadi MEMENUHI; tetap GUGUR (A2, B4–B8). KKE **belum** diperbarui (menunggu
  Aldo menutup file di Excel).
- P2 CV. Sumber Baru Furniture (Bantul): hanya SBU + Sertifikat Standar KBLI 41019 (bukan KBLI disyaratkan) → **GUGUR**.
- P3 PT. Quel Avery Indonesia (Tangerang; juga pemenang tender Renovasi Lt 3 Gd Pimpinan): semua kualifikasi lengkap
  (NIB usaha kecil KBLI 46491/43304/41012; SP+BAST furniture Wamenlu Rp1,22 M Des 2024; PM Adinda Viranica SKK Arsitek
  Muda Interior jenjang 7; gudang/workshop sewa 1.195 m²; 2 table saw, 2 router profil, 2 truk sewa) → **PERLU
  KLARIFIKASI**: (1) jadwal 60 hari vs Tata Cara 30 hari; (2) label PDN; (3) BPA1 PM hanya masa 12/2025; (4) 2 truk sama
  dengan paket Renovasi; (5) konfirmasi BAST ke PPK. Konfirmasi E1–E3 belum.
- Daftar Hitam INAPROC dicek 29 Sep 2026: ketiganya tidak ditemukan (pencarian `daftar-hitam.inaproc.id/?search=`).
- **Belum ada di berkas: harga sistem P1 & P2** — minta Aldo isi dari INAPROC.
- P3 menawar CB-13 337%, CB-14 172%, CB-17 132% HPS → menguatkan temuan HPS janggal (P-09/P-10).

**Temuan dokumen untuk PPK (P-01..P-15):** Tata Cara D.2 menulis PPK menetapkan pemenang (seharusnya Pokja); durasi 30 vs
60 hari (LDK 2 & 5); preferensi TKDN wajib bila pagu > Rp1 M (Perpres Ps. 67 (2) c); SKA→SKK; perkabelan vs "exclude
electrical"; HPS janggal (hanging cabinet Rp1,85–7,36 jt/m, AHSP CB-17 berjudul CB-11, gorden tanpa sumber harga, harga
dasar salah).

**Builder:** `build_kke_ringkas.py` (template 6 sheet) + `fill_hasil_mk.py` (isi hasil) + `recalc.ps1` (Excel COM,
`-PdfSheets "a;b"` dipisah titik koma). `build_kke.py` = versi Tender lama. Jebakan: [[reference-office-render]].
Terkait: [[reference-dokumen-pokja-sppbj]] (tender Renovasi Lt 3), [[reference-template-spk]].
