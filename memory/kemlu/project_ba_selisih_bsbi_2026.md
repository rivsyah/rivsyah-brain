---
name: project-ba-selisih-bsbi-2026
description: "Draf Berita Acara Kesepakatan pembayaran + pembebanan selisih biaya swakelola BSBI 2026 (Ditjen IDP Kemlu x UNJ), 7 Okt 2026: kontrak Rp495.093.850, tagihan Rp512.455.300, selisih Rp17.361.450 beban UNJ, maks Termin II Rp264.268.050; risiko: pajak 13% (beban riil UNJ bisa Rp51.310.300) + susunan tagihan beda dari RAB"
metadata:
  type: project
---

Dibuat 7 Okt 2026 atas permintaan Aldo ("buatkan berita acara untuk ini") dari percakapan WA Aldo dengan
Feni (IDP). Aldo menawarkan 2 pendekatan; Feni memilih no. 2 (sesuai kondisi saat itu): dokumen tagihan UNJ =
realisasi riil, pembayaran = nilai kontrak, tanpa adendum, kelebihan menjadi beban UNJ. Pengaman yang diminta
Aldo: penanda tangan pelaksana swakelola UNJ menyatakan secara sadar menanggung kelebihan, dan tidak ada imbalan
apa pun dari IDP ke UNJ.

## Berkas (mesin riv)
- Draf: `C:\Users\rivsy\Downloads\Berita Acara Selisih Biaya BSBI 2026 - UNJ (draf).docx` — 4 hlm A4
  (BA 3 hlm + Lampiran rekap 2 tabel), Arial 11, isian kuning = stabilo (38 isian), kaki halaman paraf dua pihak.
- Sumber angka: `C:\Users\rivsy\Downloads\Breakdown Invoice BSBI 2026.xlsx` (sheet RAB, Kontrak, Matriks Personel).
- Builder: `~/dev/kemlu/ba-selisih-bsbi-2026` — `extract.py` (xlsx → data.json, cocokkan dengan nilai tersimpan)
  → `node build.js` → `verify.py` (59 cek: angka, terbilang implementasi terpisah, aritmetika, identitas) →
  `render.ps1` (Word COM SaveAs 17 + PyMuPDF; jalan 2x 7 Okt 14.40–14.50 WIB).
- Sengaja file lokal, bukan Claude Doc: draf dokumen resmi dua instansi untuk ditandatangani basah.

## Angka (dari xlsx, lolos cek silang)
- Kontrak Rp495.093.850 = kegiatan UNJ Rp200.000.000 + tiket/asuransi/UH peserta/narsum Rp261.145.000 +
  "PPN & PPh 23 (13%)" Rp33.948.850 (13% hanya dari komponen kedua).
- Tagihan Termin I Rp230.825.800 + Termin II Rp281.629.500 = Rp512.455.300. Selisih Rp17.361.450
  (Aldo menyebut "20 jt" di WA). Maks Termin II = Rp264.268.050 — ASUMSI Termin I dibayar penuh sesuai tagihan.
- Per komponen: kegiatan UNJ +Rp52.829.500; tiket dkk. −Rp1.519.200; baris pajak tidak ditagihkan −Rp33.948.850.

## Isi BA
6 butir: (1) bayar paling banyak nilai kontrak, rincian T1/T2; (2) selisih + kekurangan akibat potongan pajak =
beban UNJ, sadar dan tanpa paksaan; (3) tidak dibebankan ke DIPA Kemlu, bukan utang, UNJ lepas hak tagih;
(4) tanpa imbalan ATAU penggantian (4 contoh, termasuk lewat kegiatan/akun/TA lain); (5) UNJ tanggung jawab
kebenaran dokumen + setor kelebihan bayar ke Kas Negara; (6) BA bukan adendum, jadi dokumen pendukung bayar T2.
Meterai Rp10.000 di PIHAK KEDUA. Blok "Mengetahui" pimpinan UNJ berwenang atas keuangan (disarankan).
Sengaja TIDAK memakai kata "kontribusi/dukungan/hibah" untuk penanggungan UNJ: bisa dibaca sebagai hibah ke
Kemlu, yang punya aturan pertanggungjawaban sendiri.

## Risiko yang dilaporkan ke Aldo (7 Okt 2026)
1. Pajak: selisih 17,36 jt membandingkan tagihan tanpa pajak dengan nilai kontrak yang memuat pajak 33,9 jt.
   Bila pajak itu dipotong dari pembayaran, beban riil UNJ ±Rp51.310.300. BA butir 2b menutup dua kemungkinan.
2. Susunan tagihan beda dari RAB: 23 pos RAB (Rp95.950.000) tanpa baris tagihan — honor instruktur Rp37,6 jt,
   buffet pagelaran Rp25 jt, homeband Rp10 jt, meals buddies Rp9,45 jt, souvenir Rp8 jt; 32 baris tagihan
   (Rp64.472.000) di luar RAB. Sebagian mungkin hanya beda pengelompokan. BA tidak menjawab soal ini.
3. Kuitansi Termin II harus sebesar uang yang dibayar (Rp264.268.050), bukan Rp281.629.500.
4. Nama PIHAK KEDUA "Dr. Andy Hadiyanto, M.A." diambil dari Matriks Personel (Ketua Pelaksana) — cocokkan dengan
   penanda tangan Kontrak; ketua tim belum tentu berwenang mengikat dana UNJ.

## Fakta dicek live 7 Okt 2026
- Perlem LKPP 3/2021 Pedoman Swakelola: tidak ditemukan pencabutan (dirujuk sebagai berlaku).
- BSBI 2026 = Beasiswa Seni dan Budaya Indonesia (xlsx menulis "Sosial Budaya" — salah ketik), edisi ke-22,
  12 peserta ASEAN, ±45 hari, UNJ pelaksana; dibuka di Kemlu, Dirjen Informasi dan Diplomasi Publik hadir.
- Perpres 16/2018 jo. 46/2025: lihat [[reference-template-spk]].

## Status
Menunggu Aldo meneruskan ke Feni. Belum terkonfirmasi: Termin I dibayar berapa, perlakuan pajak 13%, penanda
tangan UNJ, judul persis di Kontrak.
