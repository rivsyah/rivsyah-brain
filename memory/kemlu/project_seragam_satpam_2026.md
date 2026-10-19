---
name: project-seragam-satpam-2026
description: "Pengadaan Pakaian Kerja Seragam Dinas Satpam Kemlu TA 2026: KAK/RAB/HPS/SSUK+SSKK dibuat 14 Okt 2026; HPS Rp299.743.000 (15 Okt, paket B dibatasi SBM), > Rp200 jt -> mini kompetisi Pokja + Jaminan Pelaksanaan 5%"
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
