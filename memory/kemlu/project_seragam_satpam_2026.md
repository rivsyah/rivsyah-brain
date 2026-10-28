---
name: project-seragam-satpam-2026
description: "Pengadaan Pakaian Kerja Seragam Dinas Satpam Kemlu TA 2026: KAK/RAB/HPS/SSUK+SSKK dibuat 14 Okt 2026; HPS Rp385.409.700 (23 Okt: kaos = penawaran 0873 Rp200rb, celana = usulan unit; PDL Sus 61 personel; paket B dibatasi SBM), > Rp200 jt -> mini kompetisi Pokja + Jaminan Pelaksanaan 5%"
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

## Penawaran 0873 revisi (diterima 21 Okt 2026; nomor & tanggal surat TETAP 0873 / 19 Okt)
File: folder paket, `Penawaran CV Nagoya Engineering 0873 - Seragam Olahraga.pdf`. Berubah: kaos olahraga Carded 20s Rp130rb ->
"dry-fit/cotton combed 24s Mills" **Rp225.000** (+53% HPS 146.700); celana training Adidas Rp150rb -> "Mills Original"
**Rp300.000** (+52% HPS 197.100); Pin Gada Madya ditambah (peniti 18.500 / magnet 42.000). Lain sama.
Pasar Mills resmi: jersey Rp149.500-174.500, celana Rp184.300-424.000 (model tak disebut). Mills = 100% polyester, bukan
cotton combed (vendor menyalin teks KAK). Kalkulasi 0873 kini: Versi 4 Verlando termurah Rp342,05 jt sblm pajak /
Rp379,67 jt +PPN (> HPS Rp337,78 jt). Matriks & Kalkulasi diperbarui; HPS/KAK TIDAK diubah.

## HPS seragam olahraga = usulan unit (arahan Aldo 22 Okt 2026)
Kaos Rp150.000, celana training Rp389.000 (belum PPN; median pasar 146.700 / 197.100 tetap di Kertas Kerja sebagai pembanding).
Subjumlah C Rp94.325.000; **HPS total Rp375.697.200** (RAB Rp375.697.260; pagu Rp500 jt cukup). Diterapkan ke RAB/HPS (KK K146/K159
konstanta + catatan, terbilang, Uji Silang D6/D7 - semua lolos), KAK butir 4.2 + PDF, Kalkulasi (Uji SBM D45/D46), matriks,
builder (harga.HARGA_PPK). Penawaran Mills: kaos 225rb = +50% HPS; celana 300rb = -23% HPS. Cadangan: scratchpad backup_olahraga/.
- **21 Okt (arahan Aldo):** kaos olahraga disesuaikan ke **Rp200.000 belum PPN** (surat masih Rp225.000; +36% vs HPS 146.700).
  C = Rp87.500.000. Total + PPN: V4 Rp334.057.830, V3 338,8, V5 340,6, V1 348,6, V2 354,6 jt -> masih semua > HPS
  (V4 lewat Rp34,3 jt). Excel kalkulasi diperbarui.

## Kaos olahraga = penawaran terbaru 0873 Rp200.000 (arahan Aldo 23 Okt 2026)
Penawaran 0873 revisi ke-2: kaos Mills Rp225.000 -> **Rp200.000** belum PPN (celana tetap Rp300.000). HPS kaos ditetapkan
Rp200.000 (ASUMSI agent: "sesuaikan" = HPS ikut; sebelumnya usulan unit Rp150.000). Subjumlah C Rp103.075.000;
**HPS total Rp385.409.700** (RAB Rp385.409.760). Diterapkan: RAB/HPS (KK K146, terbilang, Uji Silang lolos), KAK docx
butir 4.2, Kalkulasi (Versi 4 Verlando termurah Rp337,67 jt / Rp374,82 jt +PPN, di bawah HPS), matriks xlsx, builder.
Aldo menghapus PDF KAK dan PDF matriks dari folder -> tidak dibuat ulang. Cadangan: scratchpad backup_kaos200/.

## Pin Gada = Peniti (arahan Aldo 22 Okt 2026)
Jenis Pin Gada Pratama & Madya ditetapkan **Peniti** (Rp18.500 di penawaran 0873). Baris Magnet (Rp42.000) dihapus dari Kalkulasi
(Harga Penawaran; rumus pin terpakai langsung ke Peniti; total tidak berubah, Versi 4 tetap Rp337,67 jt) dan dari matriks
(Penawaran vs Pasar). HPS tidak terpengaruh (pin Pratama 12.700 / Madya 16.600 = median pasar). Aldo juga merapikan Kalkulasi
(catatan Rekap/Uji SBM dihapus) 22 Okt 07.29 - jangan dikembalikan.
- **22 Okt:** Excel kalkulasi dipindah Aldo ke folder paket (`...\Pengadaan Seragam Satpam Kemlu 2026\Kalkulasi Penawaran 0873
  Seragam Satpam.xlsx`) dan disunting Aldo = **MASTER** (jangan bangun ulang dari skrip scratchpad). Suntingan Aldo: PDL Sus
  **61 personel**, Pin Gada Madya **36**, HPS pembanding kaos olahraga 200.000 & celana training 389.000 di sheet Uji.
  Arahan Aldo: pin = **Peniti**; baris Magnet (Pratama & Madya) + dropdown dihapus Bara via Excel COM, rujukan langsung ke baris
  Peniti, 0 error. Total + PPN: V4 Rp374.817.030, V3 380,6, V5 382,9, V1 392,1, V2 398,7 jt. RAB dan HPS xlsx juga disunting
  Aldo 22 Okt 07:04 (isi belum dibaca Bara).
- **22 Okt 07:31 — PDF penawaran di folder paket berubah:** Magnet hilang (15 Pratama Peniti, 16 Madya Peniti, 17-18 sepatu), kaos
  olahraga Rp200.000; No. 0873 & tgl 19 Okt tetap. Metadata: dibuat 19 Okt +07:00 (Excel penyedia), **modDate 21 Okt 19:40 +08:00**;
  tata letak rusak (no. rekening + nama bank hilang, "Rp" seragam hilang, stempel menimpa nama). Bara TIDAK menyunting PDF penyedia
  dan menandai risiko keabsahan: penawaran yang sah harus terbitan + teken penyedia (nomor/tanggal revisi). Kalkulasi Excel sudah
  cocok dengan harga PDF ini, tanpa Magnet di semua berkas paket (Matriks Detail Vendor hanya data listing pasar).

## Penawaran 0873 versi akhir (file 22 Okt 07.30)
Isi = Kalkulasi 100% (25 harga cocok). Nomor 15 Pin Gada Pratama-Peniti, 16 Pin Gada Madya-Peniti, 17/18 sepatu; Magnet hilang.
Masih: nomor/tanggal tetap 0873 / 19 Okt (PDF dibuat 19 Okt, diubah 21 Okt 19.40, versi ke-4); cap/tanda tangan berupa gambar
menutup nama direktur; rekening bank dihapus tapi baris catatan 3 menyisakan celah; label "Rp" hilang di baris seragam.

## File baru "Penawaran CV Nagoya.pdf" (folder paket, 22 Okt 08.20)
Tgl surat **22 Okt 2026**, No. tetap 0873, Attn Aldo; PDF Excel dibuat 21 Okt 15.58; hlm 2 = gambar cap/teken Direktur.
Masih memuat Pin Gada Pratama/Madya **Magnet** (47.000). Harga BEDA dari Kalkulasi: perlengkapan semua +Rp5.000 (kopel 70rb,
pet 76rb, tali 25rb, kaos dalam 77rb, ikat 39,5rb, baton 135rb, pin kew 45rb, rompi 187rb, borgol 59,5rb), pin peniti 23.500,
sepatu PDL 450rb, sepatu PDH 395rb, kaos olahraga 215rb, celana 425rb. Aldo minta baris Magnet dihapus dari PDF -> **Bara menolak
(22 Okt)**: menyunting surat penyedia bertanda tangan = mengubah dokumen pihak ketiga; jalurnya minta penyedia terbitkan ulang.
- **22 Okt 09:18 — penawaran resmi baru vendor** `Penawaran CV Nagoya.pdf` (No. 0873, **Kamis 22 Okt 2026**, 2 hlm, dibuat
  21 Okt 15:58 +07, teken + stempel rapi). **Semua harga naik Rp5.000** (seragam PDH/PDL, perlengkapan, pin Peniti 23.500);
  sepatu ganti spek: PDH kulit kilap sole karet **395.000**, PDL Tactical Boot kulit sapi sole PU **450.000**; olahraga: kaos
  jersey Mills **215.000**, celana parasut/babyterry Mills **425.000**. Baru: **tambahan ukuran XL Up** per stel
  (PDH 35.500-48.000, PDL 37.500-50.000) belum dihitung. Excel master diperbarui (cadangan scratchpad pre22okt), 0 error:
  total + PPN V4 **Rp413.391.750**, V3 419,2, V5 421,4, V1 430,6, V2 437,3 jt. SBM + PPN: **tidak ada versi yang masuk**
  (paket A V4 lewat Rp66.125, paket B V4 lewat Rp149.375). Excel memakai 61 PDL Sus + 36 pin Madya (suntingan Aldo).

## Penawaran baru CV Nagoya 22 Okt 2026 (`Penawaran CV Nagoya.pdf`, no. 0873, tgl 22 Okt, 2 hlm)
Semua harga seragam & atribut naik Rp5.000; tambahan XL Up per stel (PDH Rp35.500-48.000, PDL Rp37.500-50.000); Pin Gada
Peniti Rp23.500; sepatu PDL = Tactical Boot kulit sapi sol PU Rp450.000 (bukan Moenus); sepatu PDH = upper kulit kilap sol karet
Rp395.000; kaos jersey Mills Rp215.000; celana parasut/babyterry Mills Rp425.000 (> harga resmi Mills tertinggi Rp424.000).
Kalkulasi: Versi 4 Verlando termurah Rp372,43 jt / **Rp413,39 jt +PPN > HPS Rp385,41 jt**; semua versi paket A & B > SBM per
setel. Diperbarui: Kalkulasi (Harga Penawaran, nama sepatu/olahraga) + matriks versi Aldo (lembar Penawaran vs Pasar saja, via
COM; catatan suntingan Aldo dipertahankan). HPS/KAK tidak diubah. Builder data/penawaran_nagoya.py BELUM disinkronkan.
- **23 Okt — Penawaran V2** `Penawaran CV Nagoya V2.pdf` (No. 0873, tertulis "Senin, 23 Okt 2026" padahal **Jumat**): struktur baru
  1 bahan per jenis: PDH 445 rb, PDL Sus 480 rb, **Seragam Biru** 480 rb, **Seragam Tactical** 400 rb (XL Up +44.500/48.000),
  perlengkapan naik lagi +Rp5.000 (kopel 75 rb ... pin 28.500), **1 jenis sepatu** kulit kilap sol karet 400 rb (boots PDL hilang,
  satuan Pcs), baru dasi 40 rb + topi tactical 40 rb, olahraga kaos 300 rb + celana 455 rb.
  **Kuantitas baru** `Kebutuhan Pakaian Dinas Satuan Pengamanan.xlsx` (23 Okt): PDH 111 (pin GP 136), PDL Sus **37** (pin GM 12),
  olahraga 175, Tactical 15 (seragam, kaos dalam, topi, ikat, sepatu), Biru 15 (seragam, pet, dasi, tali kur, kaos dalam).
  RAB/HPS (22 Okt) masih PDL 61/pin GM 36, **HPS Rp385.409.700 > pagu**. **Pagu tersedia kini Rp310 jt** (Aldo 23 Okt).
  V2 total = Rp400.222.500 + PPN = **Rp444.246.975**. Kalkulasi master juga diganti nama Aldo -> `Kalkulasi Penawaran Seragam Satpam.xlsx`.
- **Rencana negosiasi (23 Okt)** `Rencana Negosiasi - Penawaran CV Nagoya V2.xlsx` di folder paket (builder `build_nego.py` di repo):
  target Aldo S1 **Rp285 jt** (buka) dan S2 **Rp300 jt** (batas atas), termasuk PPN. Metode: jangkar = MIN(V2, HPS), target =
  jangkar x faktor (S1 0,7749; S2 0,8156), bulat ke bawah Rp100. Hasil S1 Rp284.890.824 (-35,9% dari V2), S2 Rp299.875.935 (-32,5%).
  XL Up terburuk +Rp9.052.605 -> S2 + XL Up masih < pagu (sisa Rp1,07 jt). Paket per personel S1/S2 masuk SBM.
  Catatan: pada harga HPS pun lingkup 23 Okt = Rp336,3 jt sebelum PPN (Rp373 jt + PPN) > pagu -> target berarti ~18-23% di
  bawah HPS; batas mundur = kurangi lingkup/spek olahraga atau mini kompetisi. Nego > Rp200 jt oleh Pokja.
- **23 Okt (lanjutan): pagu dinaikkan Aldo menjadi Rp360 jt.** Arahan baru: negosiasi seragam SBM dengan paket **Rp1,5 jt per
  personel** (asumsi Bara: termasuk PPN). File baru `Rencana Negosiasi - Penawaran CV Nagoya V2 - Pagu 360 jt.xlsx` (file lama
  sedang dibuka Aldo, tidak ditimpa; masih pagu 310). Sheet "Skenario SBM 1,5 jt": perlengkapan = HPS, seragam + sepatu turun
  proporsional -> PDH seragam 435.700 + sepatu 332.900; PDL seragam 433.000 + sepatu 331.700; Tactical/Biru tetap harga V2
  (paket 970,7 rb / 748,9 rb). Seragam A+B+D+E = Rp247.677.519 +PPN. Sisa olahraga: S1 285 jt -> 192.100/setel, S2 300 jt ->
  269.300/setel, pagu 360 jt -> 578.200/setel (HPS 589.000; V2 755.000). Pagu habis tanpa ruang XL Up (~9,05 jt) -> olahraga
  perlu <= ~531.600/setel bila XL Up tetap ada.

## Kebutuhan FINAL + pagu (23 Okt 2026)
Sumber: folder paket `Kebutuhan Pakaian Dinas Satuan Pengamanan.xlsx`. A PDH 111 (pin GP 136); **B PDL Sus kembali 37 (pin GM 12)**;
C olahraga 175; **D Seragam Tactical 15** (seragam, kaos dalam, topi tactical, ikat pinggang, sepatu); **E Seragam Biru 15** (seragam,
pet, dasi biru dongker, tali kur, kaos dalam). HPS barang baru = median gabungan INAPROC+Tokopedia 23 Okt (pasar_tambahan.py):
tactical 335.400, topi 17.500, biru 219.800, dasi 36.100. **HPS Rp367.872.600** (A 157,46; B 52,41; C 103,08; D 12,31; E 6,16 jt dasar).
Pagu: 310 jt lalu **360 jt** (arahan Aldo) -> HPS masih > pagu Rp7,87 jt (Uji Silang MELEBIHI PAGU) - keputusan Aldo.
RAB/HPS dibangun ulang dari builder (suntingan Aldo: catatan Ket RAB & catatan kaki HPS dihapus, kini permanen di builder);
KAK versi Aldo disunting in-place (volume, tabel spek 4 barang baru, total, pagu 360). DKH kosong (build_dkh.py) .xlsx+.pdf di folder.
Penawaran CV Nagoya V2 (23 Okt, hari tertulis 'Senin' padahal Jumat): kuantitas final = Rp400,22 jt dasar / Rp444,25 jt +PPN.
**Rencana Negosiasi dipegang sesi lain (Total penawaran dokumen)**: file 'Rencana Negosiasi - Penawaran CV Nagoya V2 (- Pagu 360 jt).xlsx',
build_nego.py milik sesi itu. Catatan prosedur: >Rp200 jt negosiasi 1 penyedia / PL tidak bisa [Likely] - cek UKPBJ.
- **23 Okt — koordinasi 2 sesi:** sesi "Dokumen KAK/Spektek, RAB, HPS, SSUK SSKK" memegang RAB/HPS, KAK, DKH, builder inti;
  sesi Bara lain memegang Rencana Negosiasi (`build_nego.py`). HPS final (kebutuhan 23 Okt): A 157.460.200; B 52.413.600;
  C 103.075.000; D 12.309.000; E 6.159.000; jumlah 331.416.800; **HPS Rp367.872.600 > pagu Rp360 jt (selisih 7,87 jt) ->
  keputusan Aldo**. HPS barang baru: seragam tactical 335.400, topi 17.500, seragam biru 219.800, dasi 36.100.
  Rencana Negosiasi Pagu 360 jt dibangun ulang dengan HPS ini: S1 Rp284.879.835, S2 Rp299.878.044; Skenario 3 (paket 1,5 jt):
  seragam A+B+D+E Rp241.830.039 +PPN, olahraga maks 608.300/setel pada pagu (HPS 589.000 muat, total ~356,2 jt).
  Seragam Biru V2 480 rb vs HPS 219,8 rb (+118%): target S1/S2 173-182 rb tidak realistis tanpa klarifikasi spek.
- 23 Okt (lanjutan): **pagu dinaikkan ke Rp370 jt** (arahan Aldo) -> HPS Rp367.872.600 <= pagu, Uji Silang semua lolos; RAB/HPS + KAK diperbarui.
- **23 Okt: pagu dinaikkan Aldo lagi -> Rp370 jt** (310 -> 360 -> 370). HPS final Rp367.872.600 kini <= pagu (sisa Rp2,13 jt).
  Sesi RAB/HPS dikabari untuk menulis pagu 370 jt di RAB/HPS + KAK. File `Rencana Negosiasi - Penawaran CV Nagoya V2 - Pagu 370 jt.xlsx`
  = versi terbaru (file 310 & 360 jt di folder = versi lama). S3 (paket 1,5 jt): olahraga maks 659.800/setel; olahraga pada HPS
  589.000 -> total ~Rp356,2 jt, + XL Up terburuk 9,05 jt = ~Rp365,3 jt, masih < pagu.

## Rencana Negosiasi FINAL (arahan Aldo 23 Okt 2026) — sesi ini, build_nego_final.py
File: 'Rencana Negosiasi - Penawaran CV Nagoya V2 - Final.xlsx/.pdf' (5 hlm). Skenario 285/300 jt DIBATALKAN. Batas maks paket per
personel termasuk PPN: **PDH Rp1,5 jt, PDL Sus Rp1,55 jt**; olahraga Mills **kaos Rp330.000, celana Rp400.000 per buah termasuk PPN**
(tafsir agent: angka termasuk PPN, karena kaos penawaran Rp300.000 belum PPN). Batas per barang = min(penawaran, HPS) lalu
diturunkan merata (PDH 0,988; PDL Sus 0,972); D/E = min(penawaran, HPS). Total batas Rp334.838.400 / **Rp371.670.624 +PPN**:
> pagu Rp1,67 jt, > HPS Rp3,8 jt (kaos 297.200 dasar = +49% HPS, harga timpang). Muat pagu bila kaos <= Rp320.400 +PPN;
muat HPS bila <= Rp308.200. Menunggu keputusan Aldo. File Rencana Negosiasi lain (310/360/370) milik sesi 'Total penawaran dokumen'.
- Koreksi Aldo (via sesi lain): **kaos olahraga tetap Rp300.000 belum PPN** (= penawaran). Celana tetap Rp400.000 termasuk PPN (belum
  dikonfirmasi). Total batas Rp335.328.400 / **Rp372.214.524 +PPN** -> > pagu Rp2,21 jt, > HPS Rp4,34 jt; muat pagu bila celana
  <= Rp387.233 +PPN, muat HPS bila <= Rp375.033. Berkas Final diperbarui.
- Arahan akhir Aldo 23 Okt: penawaran kaos Rp355.000 (koreksi vendor; surat V2 tertulis 300.000). **Batas: kaos Rp330.000, celana
  Rp400.000, termasuk PPN** (keduanya dikonfirmasi Aldo). Total batas **Rp371.670.624 +PPN** (> pagu Rp1,67 jt).
  Muat pagu bila celana <= Rp390.333 +PPN. Berkas Final diperbarui. Arahan 'kaos tetap 300rb' dibatalkan.
- 23 Okt (akhir): **pagu Rp375 jt**, **HPS ~Rp373 jt** (arahan Aldo) -> HPS kaos olahraga dinaikkan PPK 200.000 -> 226.300 belum PPN;
  HPS Rp372.981.400. Batas negosiasi Final Rp371.670.624 +PPN kini < HPS (sisa Rp1,31 jt) < pagu (sisa Rp3,33 jt). RAB/HPS, KAK, Final diperbarui.
- **23 Okt — Final:** Rencana Negosiasi FINAL dipegang sesi RAB/HPS (`... V2 - Final.xlsx/.pdf`): batas paket PDH 1,5 jt & PDL Sus
  1,55 jt (+PPN), kaos Mills batas Rp330 rb & celana Rp400 rb (keduanya **termasuk PPN**, dikonfirmasi Aldo), penawaran kaos
  terkoreksi **Rp355.000** (koreksi penyedia; surat V2 tulis 300 rb). **Pagu kini Rp375 jt**; HPS Rp372.981.400; batas total
  Rp371.670.624 +PPN (di bawah pagu & HPS). File Rencana Negosiasi buatan sesi ini (310/360/370) sudah dihapus dari folder.
- **Kalkulasi Penawaran Seragam Satpam.xlsx dibangun ulang (23 Okt) dengan bahan final** (builder `build_kalkulasi_final.py`,
  cadangan versi 5-bahan di scratchpad): sheet Rekap, Uji Paket per Personel, Harga Final, Rincian; angka = berkas Final
  (penawaran 409.847.500 / HPS 336.019.300 / batas 334.838.400 sebelum PPN). Bahan: PDH Donatello Italy Wool kuning gading +
  Casamoda cokelat gelap; PDL Sus & Biru Donatello + Casamoda; Tactical Verlando Bultop + Casamoda; olahraga jersey + parasut Mills.

## Audit menyeluruh 23 Okt 2026
Angka konsisten di semua dokumen (volume 36 baris = Kebutuhan; HPS Rp372.981.400; pagu Rp375 jt; RUP/COA). Diperbaiki: KAK 5 tempat +
SSKK 2 tempat kini menyebut seragam PDH, PDL Sus, Tactical, dan Seragam Biru (pengukuran, toleransi, sampel, pemeriksaan, subkontrak);
Petunjuk RAB/HPS (pagu, kelompok D/E, dasar HPS PPK); Ringkasan Nego memakai HPS dibulatkan; matriks dibangun ulang (penawaran V2 23 Okt,
4 barang baru, HPS terbaru, pembanding PDH/PDL = semua bahan; suntingan Aldo: subjudul & catatan bawah dihapus, permanen di builder).
Terbuka untuk Aldo: (1) D.2/E.5 'Kaos Dalam' vs harga/spek set kaos dalam + kaos kaki; (2) metode tertulis e-purchasing mini kompetisi
Pokja + Surat Pesanan vs rencana negosiasi 1 penyedia >Rp200 jt; (3) penawaran 1 jenis sepatu untuk PDH/PDL/Tactical; (4) e-mail PPK
SSKK; (5) surat penawaran hari 'Senin 23 Okt' & nomor 0873 tetap; (6) SP paling lambat 4 Nov; (7) RUP 67117950 di SIRUP.
Kalkulasi Penawaran (build_kalkulasi_final.py) milik sesi 'Total penawaran dokumen', angkanya sama dengan Final.
- 23 Okt: D.2/E.5 = **kaos dalam saja** (id kaos_dalam_saja, satuan Pcs, tanpa kaos kaki), HPS ditetapkan PPK **Rp40.000** (median
  pasar 34.900). **HPS kini Rp371.982.400** (turun dari 372.981.400; arahan HPS ~373 jt tidak dikejar ulang). Batas negosiasi
  Rp333.965.400 / Rp370.701.594 +PPN (kaos dalam saja batas 40.000; penyedia hanya menawar paket Rp82.000). RAB/HPS, KAK, DKH, Nego Final,
  matriks diperbarui.
- **23 Okt (arahan Aldo via sesi RAB/HPS):** kelompok D & E memakai **"Kaos Dalam" saja (Pcs), HPS = batas Rp40.000**; A & B tetap
  paket kaos dalam + kaos kaki Rp70.000. Angka baru: HPS 335.119.300 -> **Rp371.982.400**; batas 333.965.400 / **Rp370.701.594
  +PPN**; penawaran tetap 409.847.500 (kaos dalam D/E pada harga paket 82 rb). Kalkulasi diselaraskan (0 error, sama dengan Final).
- **23 Okt 19:43 — surat V2 terkoreksi dari vendor** (`Penawaran CV Nagoya V2.pdf` ditimpa; metadata +07 vendor): tanggal kini
  "Jum'at, 23 Oktober 2026", **kaos olahraga resmi Rp355.000**; harga lain sama. Masih: XL Up, sepatu satu jenis (Pcs), kaos dalam
  hanya paket 82 rb, celana 455 rb. Cek silang 23 Okt: Kalkulasi = Final = RAB/HPS (36 baris barang, 0 selisih; HPS 371.982.400,
  batas 370.701.594, pagu 375 jt).
- 23 Okt: **HPS kaos olahraga = Rp300.000** (arahan Aldo; semula 226.300) -> **HPS Rp386.298.600 > pagu Rp375 jt (Rp11,3 jt)**, Uji
  Silang MELEBIHI PAGU; menunggu Aldo (naikkan pagu >= Rp386,3 jt atau pangkas HPS). Batas nego tetap Rp370.701.594 (kaos 297.200 kini
  < HPS, tidak timpang). RAB/HPS, KAK, Nego Final, matriks diperbarui.
- **23 Okt (arahan Aldo via sesi RAB/HPS): HPS kaos olahraga -> Rp300.000** (semula 226.300). HPS 348.016.800 -> **Rp386.298.600
  > pagu Rp375 jt (lewat ~11,3 jt)**, menunggu keputusan Aldo. Batas negosiasi tetap Rp370.701.594 (+PPN). Kalkulasi diselaraskan.
- 23 Okt: **pagu Rp390 jt**, HPS ~387 jt -> HPS seragam PDH ditetapkan PPK **498.600** (median 493.000; batas nego tidak berubah karena
  penawaran 445.000 < HPS). **HPS Rp386.988.600**; kit A HPS 1.577.643 <= SBM. Batas nego Rp370.701.594 +PPN. Kalimat 'batas kaos di atas HPS'
  di Nego kini kondisional (tidak ada batas > HPS). Audit ulang: semua dokumen konsisten, tak ada angka lama.
- **23 Okt (arahan Aldo via sesi RAB/HPS): pagu Rp390 jt; HPS seragam PDH 498.600** (penetapan PPK, median 493.000).
  HPS 348.638.400 -> **Rp386.988.600 <= pagu** (sisa ~3,0 jt). Batas tetap Rp370.701.594. Paket PDH HPS +PPN 1.577.643 < SBM.
  Kalkulasi diselaraskan (0 error). Urutan pagu: 500 -> 310 -> 360 -> 370 -> 375 -> 390 jt.
- **23 Okt — foto asli seragam** (`Foto Asli Seragam PDH PDL Sus Tactical dan Biru/`, 4 subfolder): spesifikasi di `spek.py` dan KAK
  diperbarui sesuai foto. Fakta foto: **Seragam Biru = kemeja biru muda lengan panjang + celana gelap** (BUKAN setelan biru dongker),
  kur kuning, pet list kuning emas, lambang Kemlu lengan kiri; **PDL Sus = kemeja krem lengan panjang + celana cokelat tua lurus (bukan
  kargo)**; Tactical = kemeja+celana abu ripstop, bordir monokrom; topi tactical = baseball mesh abu; PDH pet list merah marun, kur hitam;
  Polda di lengan kanan, Jakarta di lengan kiri. **Personel PDL Sus di foto memakai topi lapangan mesh cokelat, bukan pet** (barang B =
  "Pet Ciputat") — ditanyakan ke Aldo. KAK (versi Aldo, in-place) dapat **8.5 Foto Acuan Model Seragam** (8 foto, wajah/nama/kartu ID
  disamarkan; skrip scratchpad `kak_foto.py`, `samarkan.py`). RAB/HPS + DKH dibangun ulang; audit 0 temuan.
- **23 Okt — HPS Biru/Tactical terlalu rendah**: Biru 219.800 dan Tactical 335.400 = median listing pasar umum (GABUNG), bukan padanan
  bahan. Bahan Biru = PDH/PDL (penawaran 480 rb sama dengan PDL). Biru = HPS PDL 476.300 -> HPS Rp391,26 jt (> pagu 390); + Tactical 400 rb
  -> Rp392,33 jt. Usulan: Biru 476.300 dan PDH turun ke 464.000 (lengan pendek < PDL lengan panjang 476.300) -> HPS Rp386.996.283; batas
  nego PDH tak berubah (penawaran 445 rb). Menunggu keputusan Aldo; HPS BELUM diubah.
- **23 Okt — opsi 3 disetujui Aldo**: HPS Seragam Biru = **476.300** (= PDL Sus, bahan sama), PDH = **464.000** (lengan pendek < PDL
  lengan panjang). Lewat `HARGA_PPK` di harga.py. HPS **Rp386.996.283 -> dibulatkan Rp386.996.200** (pagu 390 jt). Batas nego
  **Rp374.972.319** +PPN (semula 370.701.594; kit A 1.499.388, kit B 1.549.893). RAB/HPS, Nego Final (xlsx+pdf), Matriks, DKH, KAK total
  diperbarui; audit 0 temuan. Sesi "Total penawaran dokumen" dikabari untuk selaraskan Kalkulasi. Topi PDL Sus (foto: topi mesh
  cokelat vs barang "Pet Ciputat") masih menunggu jawaban Aldo.
- **23 Okt malam (arahan Aldo via sesi RAB/HPS): HPS Seragam Biru 219.800 -> 476.300 (= PDL Sus), HPS PDH 498.600 -> 464.000.**
  HPS 348.645.300 -> Rp386.996.283, dibulatkan **Rp386.996.200** (pagu 390 jt). Batas negosiasi naik ke **Rp374.972.319 +PPN**
  (batas Biru 476.300). Kalkulasi diselaraskan, 0 selisih dengan Final (21.31). build_nego.py = builder lama, tidak dipakai.
- **23 Okt — B.4 = Topi Lapangan** (cokelat, panel jaring; arahan Aldo, sesuai foto), bukan Pet Ciputat. Id `topi_lapangan`, HPS 53.700
  (median 4 Katalog 45.001–95.236; Tokopedia ~20 rb pembanding). `barang.DIGANTI` menjaga uji total lembar unit kerja. Efek: ruang SBM
  paket B naik -> HPS PDL Sus 482.700; Biru diikat ke HARGA['pdl_sus'] (482.700); PDH 462.400 agar HPS <= 387 jt. **HPS Rp386.991.300**
  (386.991.399), batas nego **Rp375.127.275** +PPN. KAK (B.4, spek baris 16 baru, tahapan), SSKK (penukaran ...topi...), RAB/HPS, Nego,
  Matriks, DKH diperbarui; audit 0. PDF Nego belum tersalin (berkas terbuka). Berkas Kebutuhan unit kerja masih menulis Pet Ciputat.
- **23 Okt 22.18 (arahan Aldo via sesi RAB/HPS):** B.4 = **Topi Lapangan** (37; HPS 53.700 median 4 Katalog, batas 52.300; penawaran
  pakai harga Pet 81 rb) menggantikan Pet Ciputat di PDL Sus. HPS: PDL Sus 482.700 (batas 468.300), Biru 482.700 (batas 480.000),
  PDH 462.400, sepatu PDL 369.800 (batas 360.700). **HPS Rp386.991.300; batas Rp375.127.275 +PPN**; pagu 390 jt.
  Kalkulasi diselaraskan (0 error, total = Final). PDF Final belum diperbarui (sedang dibuka).
- **23 Okt (arahan Aldo):** Kalkulasi Penawaran + `build_kalkulasi_final.py` + `build_nego.py` kini **dipegang sesi RAB/HPS**
  ("Dokumen KAK/Spektek, RAB, HPS, SSUK SSKK", local_d8f3863e). Sesi Bara lain tidak menulis lagi ke berkas paket Satpam.
- **23 Okt malam — Kalkulasi Penawaran diambil alih sesi RAB/HPS** (arahan Aldo; sesi "Total penawaran dokumen" berhenti menulis).
  `build_kalkulasi_final.py` kini menarik PEN/HPS/batas dari `build_nego_final.target()` + `harga.HARGA`, kuantitas dan paket dari
  `barang.KELOMPOK`, pagu dari `konst.PAGU` — tidak ada angka ketik ulang. Bangun: `python build_kalkulasi_final.py out/...xlsx` lalu
  `render_matriks.ps1`. Kebutuhan unit kerja B29 diubah ke "Topi Lapangan" (arahan Aldo, Excel COM). PDF Nego Final tersalin. audit.py
  (scratchpad) ditambah cek Kalkulasi + Kebutuhan; 0 temuan.
- **23 Okt — DKH Hasil Negosiasi** (`DKH Hasil Negosiasi - ...xlsx`, folder paket): harga satuan = batas maksimal negosiasi per barang
  (`build_dkh.py <out> nego`, dari `build_nego_final.target()`), identitas CV Nagoya dari surat V2, NPWP kosong. Total Rp375.127.275 +PPN.
  Asumsi: belum ada harga sepakat riil; bila hasil nego berbeda, harga diganti. DKH Kosong tetap ada untuk penyedia.
- **23 Okt — koreksi Aldo: DKH diisi harga PENAWARAN V2, bukan hasil nego.** `DKH Penawaran V2 - ...xlsx` (`build_dkh.py <out> penawaran`,
  harga = `build_nego_final.PEN`): total Rp409.847.500 + PPN 45.083.225 = **Rp454.930.725**; XL Up tidak dihitung; B.4 topi = harga Pet
  81.000, D.2/E.5 kaos dalam = 82.000 (paket). Berkas "DKH Hasil Negosiasi" dikeluarkan dari folder (cadangan di scratchpad).
- **28 Okt — update unit kerja** `Seragam Pakaian Dinas Satuan Pengamanan 2026.xlsx` (27 Okt; menggantikan berkas Kebutuhan yang sudah
  dihapus Aldo): keterangan per barang + 4 gambar EMF (badge Polda Metro/Jabar + Kemlu untuk PDH/PDL dan Biru, velcro logo Satpam
  kuning/putih, logo Kemlu monokrom, Gada Madya/Pratama, sablon kaos OR). spek.py ditulis ulang (pet PDH cokelat list putih; topi PDL
  cokelat list kuning; pet Biru dongker list kuning; kur hitam kecil/kuning besar; kaos dalam sablon logo Kemlu + Satpam; ikat logo
  Kemlu; sepatu ritsleting diperkuat; sepatu tactical logo Kemlu di lidah; kaos/celana OR hitam; pin model tusuk). KAK in-place: 23 sel
  spek + **8.6 Contoh Badge, Velcro, Logo, dan Sablon** (8 potongan gambar, skrip scratchpad `kak_atribut.py`). HPS angka TIDAK berubah.
- **28 Okt — susunan folder versi Aldo (sejak 24 Okt)**: DKH dipindah ke `Dokumen Penyedia/` (DKH Penawaran milik Aldo/penyedia),
  Rencana Negosiasi diganti nama `Negosiasi - Penawaran CV Nagoya.xlsx/.pdf`, ada PDF KAK/RAB/Kalkulasi buatan Aldo. **Aldo menyunting
  RAB/HPS 24 Okt** (metode tanpa "mini kompetisi", judul D/E tanpa "(tambahan)", subtotal per kelompok di RAB, blok ttd naik 2 baris):
  RAB/HPS kini **sunting in-place saja (Excel COM)**, jangan salin hasil build_xlsx ke folder. Build 28 Okt sempat menimpa, sudah
  dipulihkan dari cadangan dan hanya 34 sel spek HPS yang diganti. DKH Kosong/Penawaran V2 yang sempat tersalin ulang dihapus lagi.
  PDF KAK dan RAB/HPS dirender ulang. audit.py disesuaikan ke susunan baru; 0 temuan. Badge PDH: Jabar 22 + Metro 83 = 105 != 111.
- **28 Okt — penawaran revisi** `Downloads/0873. Kementrian Luar Negrii.pdf` (Excel 28 Okt 15.41, tanggal tertulis masih 19 Okt):
  9 barang = batas nego (PDH, PDL, kur hitam, kaos dalam, borgol, sepatu PDL/tactical, topi cokelat, kaos/celana OR). Di atas batas
  (banyak NAIK dari V2): kopel 150.000, pet 135.000, topi abu 65.000, sepatu PDH 360.700, baton 130.000, pin kewenangan 40.000 (magnet),
  rompi 175.000, ikat 44.500, pin Gada 28.500, kur kuning 30.000. Hilang: seragam Tactical, seragam Biru, dasi, kaos dalam saja D/E.
  Total (hilang dihitung pada batas) Rp421.170.630 +PPN > HPS 386,99 jt dan > pagu 390 jt; selisih vs batas +Rp46,0 jt.
