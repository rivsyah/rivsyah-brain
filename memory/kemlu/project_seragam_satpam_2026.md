---
name: project-seragam-satpam-2026
description: "Pengadaan Pakaian Kerja Seragam Dinas Satpam Kemlu TA 2026: KAK/RAB/HPS/SSUK+SSKK dibuat 14 Okt 2026; HPS Rp337.779.600 (21 Okt: PDL Sus 61 personel; paket B dibatasi SBM), > Rp200 jt -> mini kompetisi Pokja + Jaminan Pelaksanaan 5%"
metadata:
  type: project
---

Permintaan Aldo 14 Okt 2026: "buatkan dokumen KAK/Spektek, RAB, HPS, SSUK SSKK" dari scan
`Downloads\SKM_367 KEM26101315530.pdf` (lembar perbandingan harga Bag. Pengamanan & Kerumahtanggaan + disposisi Kabiro
1 Apr + ND 16242/PL/03/2026/25 tgl 31 Mar 2026 + PMK 32/2025 hlm 36).

## Berkas (mesin riv)
- Output: `C:\Users\rivsy\Downloads\MOFA\Pejabat Pengadaan\Pengadaan Seragam Satpam Kemlu 2026\` (KAK 12 hlm, RAB+HPS 2 hlm,
  SSUK+SSKK 36 hlm, Rincian HPS untuk INAPROC, salinan scan sumber).
- Builder: `C:\Users\rivsy\dev\kemlu\seragam-satpam-2026\` (pola pdasn-tahap2-2026, multi-barang; verify 144 lolos, 0 gagal).

## Angka
- Volume (lembar unit): A. PDH 111 personel (12 barang; pin Gada Pratama 136), B. PDL Sus 37 (12 barang; pin Gada Madya 12),
  C. olahraga 175 setel (kaos + celana training). 136+12 = 148 = 111+37. ND menyebut 147 per barang + PDL biasa, payung 50,
  HT Motorola CP1660 30 — TIDAK ada di lembar harga, di luar paket.
- Lembar unit: Rp326.241.000 sebelum pajak; memakai "Pajak 12%" (= Rp365,39 jt). Benar: PPN efektif 11% (PMK 131/2024).
- HPS = median Nilai Dasar (usulan unit + Katalog INAPROC /1,11; Tokopedia hanya bila Katalog < 2 sumber), dibulatkan ratusan
  ke bawah: Rp275.411.200 + PPN Rp30.295.232 = **Rp305.706.400** (A Rp157,46 jt; B Rp57,79 jt; C Rp60,17 jt).
- Celana training usulan Rp389.000 = harga coret MILLS Track Pant Drei (tulisan tangan "Mils" di scan); median Katalog ~Rp197 rb.
- Survei harga 14 Okt (subagent): katalog.inaproc.id publik + Tokopedia; sebagian harga Katalog dari halaman pencarian.

## Fakta aturan (dicek 14 Okt)
- PMK 32/2025 Lamp. I angka 37: Pakaian Kerja Satpam DKI Rp1.585.000/setel; huruf f: **sudah termasuk perlengkapan** (sepatu,
  PDL, kopel, ikat pinggang, tali kur+peluit, kaos kaki, topi, kaos security, atribut lain), maks 2 setel/tahun, selektif.
  Pajak tidak disebut -> diperlakukan batas termasuk PPN.
- Kit A per personel incl PPN Rp1.571.427 (lolos). Kit B median Rp1.746.030 > SBM. **15 Okt, arahan Aldo "maksimal SBM":**
  seragam PDL Sus 558.500 -> **476.300**, sepatu PDL Sus 427.900 -> **364.900** (sebelum PPN; turun proporsional, rumus MIN di
  Kertas Kerja HPS; barang bersama kelompok A tetap median) -> kit B Rp1.584.858. HPS baru **Rp299.743.000** (B Rp52.413.600).
  Builder: harga.py BATAS_SBM_IDS. Diterapkan langsung ke berkas suntingan Aldo (KAK 11.07 + xlsx 09.58; 15 sel via Excel COM,
  total+terbilang KAK via XML). Aldo menghapus PDF dan salinan INAPROC dari folder; tidak dibuat ulang. Risiko: harga di bawah
  median -> mini kompetisi bisa sepi.
- Perpol 4/2020 Ps 17 jo. Perpol 1/2023 (BN 2023/70) ganti lampiran pakaian Satpam; atasan krem, celana cokelat tua [Likely].
- > Rp200 jt: mini kompetisi oleh Pokja (Perlem LKPP 2/2026 Ps 17(2)b), Jaminan Pelaksanaan 5% (Perpres Ps 33(1)).

## Anggaran (arahan Aldo 15 Okt 2026)
Kode RUP **67117950**, pagu **Rp500.000.000**, COA **WA.6023.EBA.994.002.0H.521119** — sudah masuk semua dokumen (rebuild
verify 146/0). Catatan: 67117950 = RUP Pakaian Dinas ASN Tahap I (pagu Rp1.877.040.000, sudah berkontrak Rimonz) di
[[project_evaluasi_pakaian_dinas_asn]] -> pastikan RUP direvisi di SIRUP; Katalog menolak RUP yang tidak cocok.

## Isian kuning / terbuka
PPK Charles Bob Ivan (RO 002.H), e-mail PPK (SSKK 5),
SP paling lambat 4 Nov 2026 (30 hari kalender, BAST <= 4 Des). Cek kontrak alih daya Satpam tidak sudah memuat seragam.
Daftar personel + ukuran, contoh/desain atribut dari Bag. Pengamanan. Selisih 147 vs 148, siapa 27 penerima olahraga tambahan.
Terkait: [[reference_pejabat_bup]], [[project_evaluasi_pakaian_dinas_asn]], [[reference_katalog_v6_sp_batal]], [[project_ht_poc_satpam]].

## Matriks komparasi harga vendor (19 Okt 2026)
`Matriks Komparasi Harga - Seragam Dinas Satpam Kemlu TA 2026.xlsx/.pdf` (20 hlm) di folder paket. Builder
`build_matriks.py` + `render_matriks.ps1` + `data/` (3 JSON subagent + `browser_tokopedia.py`). 372 baris (INAPROC 108,
Tokopedia 191, Shopee 73), 336 masuk statistik. Lembar: Ringkasan (barang x marketplace), Seragam per Bahan, Detail Vendor.
- **Shopee wajib login** untuk melihat hasil cari -> tidak bisa dibaca agent; harga Shopee via agregator biggo.id.
- Tokopedia terbaca langsung lewat browser bawaan (85 baris "halaman"); WebFetch Tokopedia/INAPROC gagal (JS/security
  check) -> subagent memakai cuplikan mesin pencari (perlu cek ulang).
- Seragam Satpam jadi berbahan **Suprima De Boss tidak ada** di 3 marketplace (Suprima = kain semi wool seragam ASN/Pemda).
  PDH American Drill: Tokopedia median ~Rp180 rb, Shopee ~Rp180 rb (Nilai Dasar); INAPROC hanya listing tanpa bahan.
- Matriks tidak mengubah HPS (Rp299.743.000) — HPS tetap dari pasar.py 14 Okt.

## Penawaran CV. Nagoya Engineering No. 0873 (19 Okt 2026) -> lembar "Penawaran vs Pasar" di matriks
Harga belum pajak, berlaku 30 hari. PDH 5 opsi bahan Rp350-475 rb (semua < HPS Rp493.000); PDL Rp370-495 rb (opsi
Donatello+Gaia Premium Rp495 rb > HPS PDL Sus Rp476.300 yang sudah dibatasi SBM). Di atas HPS: baton +67%, pin kewenangan
+90%, pin Gada magnet +231%, sepatu PDL Dekade +29%, sepatu PDH M25 +10%, rompi/borgol +10%.
Temuan: kain Donatello Italy Wool tidak terverifikasi (pasar hanya wool jas Donatella); Casamoda = high twist; Verlando =
American Drill; Gaia Neo/Trill = kain seragam Satpam. **Moenus M25 & Dekade = faux leather** (KAK: kulit sapi asli).
**Training Adidas Rp150 rb tidak mungkin original** (asli Rp361-750 rb). Kaos carded 20s < mutu KAK (combed 24s).
Tokopedia + INAPROC dibaca langsung lewat browser (INAPROC bisa dirender di browser bawaan). Matriks kini 408 baris, 26 hlm.
- **Uji SBM penawaran 0873 (19 Okt, revisi 16:50 menambah Pin Gada Madya peniti 18.500/magnet 42.000):** paket per personel
  (1 tiap barang, pin peniti) + PPN 11% vs SBM Rp1.585.000. Paket A (PDH): hanya **Versi 4 Verlando** masuk (Rp1.568.430);
  V3 lewat Rp11.180, V5 Rp22.280, V1 Rp77.780, V2 Rp122.180. Paket B (PDL Sus): **semua versi melampaui** (V4 terendah
  Rp1.698.300, lewat Rp113.300; perlu harga sebelum PPN <= Rp1.427.900). Sebelum PPN: A semua masuk, B V3-V5 masuk.
  Total + PPN: V4 Rp291,3 jt, V3 296,0, V5 297,9 (< HPS Rp299,7 jt); V1 305,9 & V2 311,9 > HPS.
  Excel `Downloads\Kalkulasi Penawaran 0873 Seragam Satpam.xlsx` (sheet Rekap, Uji SBM & HPS, Rincian, Harga Penawaran).

## Tambahan 24 personel PDL Sus (arahan Aldo 21 Okt 2026)
Setiap komponen kelompok B +24: **37 -> 61**; pin Gada Madya **12 -> 36** (ASUMSI agent: 24 tambahan = Gada Madya; bila
Gada Pratama, pindahkan 24 ke pin Pratama A.10 136 -> 160). HPS **Rp299.743.000 -> Rp337.779.600** (B Rp86.680.800; kit B
per personel tetap Rp1.584.858 <= SBM; pagu Rp500 jt cukup). Diterapkan di berkas versi Aldo: RAB/HPS xlsx (HPS D31:D42,
label, terbilang, Uji Silang D6/D7), KAK docx (5 paragraf + 12 sel tabel) + PDF diekspor ulang, Kalkulasi 0873 (Rincian
C22:C33, Rekap A2). PDF RAB/HPS sengaja tidak dibuat (Aldo menghapusnya 15 Okt). Builder barang.py ikut (TAMBAHAN_B).
Cadangan versi sebelum: scratchpad sesi 0a01ddf9 `backup_tambah24/`. Seragam olahraga tetap 175 (tidak diubah).
- **Revisi olahraga (berkas diterima 21 Okt, No. & tanggal tetap 0873 / 19 Okt):** di folder paket
  `Penawaran CV Nagoya Engineering 0873 - Seragam Olahraga.pdf`. Kaos -> dry-fit/cotton combed 24s Mills **Rp225.000**
  (dari Carded 20s 130 rb), celana -> Mills Original **Rp300.000** (dari Adidas 150 rb); lainnya sama. Keduanya ~+53% di atas
  HPS (146.700 / 197.100). C = Rp91.875.000 sebelum PPN (HPS C Rp60.165.000). Total + PPN: V4 Rp338,9 jt, V3 343,6,
  V5 345,5, V1 353,5, V2 359,4 -> **semua versi kini > HPS Rp299,7 jt** (V4 lewat Rp39,2 jt); pagu 500 jt masih cukup.
  Uji SBM tidak berubah (olahraga di luar SBM). Excel kalkulasi diperbarui.
