---
name: Surat ke LKPP — pemulihan status paket e-Katalog Furniture Lt 3 Tower yang batal otomatis
description: "Draf surat a.n. Sekjen (Plt. Kepala BUP) ke Direktur Pasar Digital Pengadaan LKPP, 7 Okt 2026: SP paket Furniture Built In Lt 3 Gedung Tower (RUP 67916737) batal otomatis karena penyedia tidak menyetujui SP sampai batas konfirmasi, padahal kontrak sudah di SAKTI; minta dispensasi pulihkan ke tahap konfirmasi atau terbitkan ulang SP ke pemenang sama; 22 isian kuning; jalur resmi pemulihan TIDAK ADA, jadi siapkan mini kompetisi ulang paralel"
metadata:
  type: project
---

**Asal (7 Okt 2026):** tangkapan layar WA Aldo dengan staf Direktorat Pasar Digital Pengadaan LKPP (12.47–15.18).
Jawaban staf: rollback tidak bisa; untuk kasus ini bersurat ke Direktur Pasar Digital Pengadaan untuk tindak lanjut.
Aldo: "kami akan bersurat"; sebelumnya ia menawarkan "surat dispensasi Sekjen Kemlu". Nama staf sengaja tidak
masuk surat. Kronologi versi Aldo: mini kompetisi selesai → PPK terbitkan SP → kontrak didaftarkan di SAKTI →
penyedia tidak approve SP sampai lewat batas konfirmasi → status paket otomatis "batal" ("terlewat dari PPK dan penyedia").

## Berkas (mesin riv)
- Draf: `C:\Users\rivsy\Downloads\MOFA\Pejabat Pengadaan\Pengadaan Furniture Lt 3 Ruang Sekjen\Surat ke LKPP -
  Pemulihan Status Paket e-Katalog Furniture Lt 3 (draf).docx` — 2 hlm A4, Arial 12, 9 butir, 22 isian kuning.
- Builder: `C:\Users\rivsy\dev\kemlu\surat-lkpp-furniture-lt3` — `node build.js` → `render.ps1` (Word COM SaveAs 17,
  jalan 4x 7 Okt 15.20–15.45 WIB) → `verify.py` (36 cek + daftar isian kuning).
- Sengaja .docx lokal, bukan Claude Doc: surat dinas resmi untuk kop dan tanda tangan.

## Isi surat
Hal "Permohonan Dispensasi Pemulihan Status Paket Katalog Elektronik Pekerjaan Furniture Built In Lantai 3 Gedung
Tower", Sifat Segera, dasar Perlem LKPP 2/2026. Tabel data paket (RUP, nomor paket, PPK, penyedia, nilai SP, nomor SP,
batas konfirmasi, register SAKTI). Kendala: data e-Katalog tidak sesuai SAKTI; TA 2026 + 30 hari kalender. Permohonan:
a. pulihkan ke tahap konfirmasi penyedia; b. bila tidak bisa, fasilitasi terbit ulang SP ke pemenang yang sama tanpa
pemilihan ulang; c. arahan lain. Bahan pertimbangan: SP sama persis, penyedia bersedia (surat pernyataan), Kemlu
tanggung jawab atas data, pemantauan tenggat diperketat. Tembusan: Sekjen Kemlu; Deputi Bidang Transformasi
Pengadaan Digital LKPP. Fakta LKPP yang dipakai: [[reference_katalog_v6_sp_batal]].

## Asumsi berstabilo — konfirmasi Aldo
- Penanda tangan "a.n. Sekretaris Jenderal / Plt. Kepala Biro Umum dan Pengadaan, Sukmo Yuwono"
  ([[reference_pejabat_bup]]). Bila Sekjen sendiri yang teken: hapus "a.n.", ganti nama dan kode unit nomor.
- Nomor `[.....]/PL/10/2026/25`: kode klasifikasi PL ditebak dari pola BAHP; 25 = BUP.
- Penyedia PT Quel Avery Indonesia dan PPK Riyan Juanda dari [[project_kke_furniture_lt3]] (P1/P2 gugur, jadi satu-satunya
  calon pemenang). Nilai SP final belum diketahui (penawaran Rp1.108.380.510).
- Jangka waktu 30 hari kalender dari Tata Cara A.1.4 (P3 menawar 60 hari; hasil klarifikasi belum tercatat).

⚠ OPEN: tenggat yang diterapkan sistem. Panduan kompetisi v6 (22 Agt 2026) menyebut 14×24 jam untuk transaksi
> Rp200 jt; S&K/FAQ menyebut 3 hari. Bila log sistem menunjukkan tenggat 3 hari untuk paket ±Rp1,1 M, itu argumen
tambahan di surat. Cek kolom "Tenggat waktu untuk merespon pesanan" dan log status paket.
⚠ OPEN: SAKTI — aturan batal/ubah data kontrak bila SP baru terbit tidak ditemukan; tanya Biro Keuangan atau KPPN.

## Status
7 Okt 2026: draf diserahkan ke Aldo, menunggu isian dan keputusan penanda tangan. Kirim lewat
eoffice.lkpp.go.id/persuratan atau surat fisik. Saran: siapkan mini kompetisi ulang secara paralel (oleh Pokja,
judul kompetisi beda) — [Likely] jawaban LKPP berupa arahan ulang, karena FAQ resmi menyuruh beli ulang.
