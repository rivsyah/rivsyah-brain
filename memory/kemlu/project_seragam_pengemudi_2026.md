---
name: project-seragam-pengemudi-2026
description: "Seragam kerja pengemudi Kemlu TA 2026: 40 pengemudi x (1 seragam standar + 1 kemeja batik antar delegasi), pagu Rp30 jt; 29 Okt 2026 paket KAK sederhana + RAB + HPS jadi, HPS Rp28.256.100 dari survei Katalog; bayar UP/TUP (<= Rp50 jt per penerima)"
metadata:
  type: project
---

Permintaan Aldo 29 Okt 2026: proyeksi lalu "buatkan RABnya saja".

## Berkas (mesin riv)
`C:\Users\rivsy\Downloads\MOFA\Pejabat Pengadaan\Pengadaan Seragam Pengemudi Kemlu 2026\RAB - Seragam Kerja Pengemudi Kemlu TA 2026.xlsx/.pdf`
(1 hlm). Dibangun dari templat RAB ASN Tahap II (lembar RAB saja); skrip di scratchpad sesi, bukan repo.

## Angka
- Standar: 40 x Rp333.000 (estimasi dasar 300.000 + PPN 11%) = Rp13.320.000.
- Batik cap/kombinasi berfuring: 40 x Rp399.600 (dasar 360.000) = Rp15.984.000.
- Pengukuran/sampel/kirim/perbaikan: Rp0, ditanggung penyedia. Total **Rp29.304.000**; sisa pagu Rp696.000 (XL ke atas).
- Harga = ASUMSI agent (acuan: kemeja dinas ASN katalog dasar Rp315 rb); batik belum disurvei. "Standar" = kemeja saja;
  bila termasuk celana, pagu tidak cukup.
- Isian kuning: kode subkomponen (A23, E11, E13). Akun 521119 dan Program/Kegiatan disalin dari paket ASN = asumsi.

## Paket dokumen v2 (29 Okt 2026, menggantikan RAB-saja)
Folder sama: `KAK Spektek - Seragam Kerja Pengemudi Kemlu TA 2026.docx/.pdf` (4 hlm, gaya KAK ASN Tahap II tanpa page break per bab)
+ `RAB dan HPS - Seragam Kerja Pengemudi Kemlu TA 2026.xlsx/.pdf` (RAB, HPS, Kertas Kerja HPS). File "RAB - ..." lama dihapus.
Builder: `C:\Users\rivsy\dev\kemlu\seragam-pengemudi-2026\` (common.py median, build_kak.py, build_hps.py, harga.json sumber).
- Survei Katalog INAPROC publik 29 Okt (subagent): standar 8 sumber YA, median Nilai Dasar Rp241.400 (Rp267.954 +PPN);
  batik hanya 2 sumber YA (Fircomindo cap semi tulis 455.100, Arianto printing 421.800 incl PPN) -> Rp395.000 (Rp438.450 +PPN);
  listing tanpa teknik batik (200-222 rb) dan Muchtarindo MOQ 50 (555 rb) = PEMBANDING. KAK batik kini BOLEH printing premium.
- HPS Rp25.456.000 + PPN 2.800.160 = Rp28.256.160 -> dibulatkan **Rp28.256.100**; RAB = Rp28.256.160 (sisa pagu Rp1.743.840).
- Angka estimasi RAB-saja (300/360 rb dasar, Rp29.304.000) USANG.
- Isian kuning: subkomponen, Kode RUP, warna seragam standar. Metode: e-purchasing PP (nego/mini kompetisi); BAST <= 4 Des.

## Cara bayar
UP per penerima maks Rp50 jt (PMK 41/2026) -> paket ini satu-satunya dari 3 paket seragam yang bisa UP/TUP
(ASN Rp121,8 jt dan Satpam ~Rp390 jt wajib LS). Deadline isi TUP unit: Jum 30 Okt 2026. TUP harus dipertanggungjawabkan
dalam 1 bulan [Likely] -> barang harus terima ~awal Des.

## Kalender pendaftaran kontrak LS 2026 (tangkapan layar Aldo 29 Okt, dari sosialisasi akhir tahun)
Kontrak/perubahan ditandatangani: s.d. 30 Sep -> daftar 9 Okt; 1-31 Okt -> 6 Nov; 1-30 Nov -> 7 Des; 1-5 Des -> 7 Des;
6-12 Des -> 14 Des; 13-17 Des -> 21 Des; 18-22 Des -> 23 Des. NRK terbit 2 HK setelah diterima (maks 7 Des / 23 Des).
Lewat 5 HK tetap diterima sebelum batas, dengan surat pernyataan.

Terkait: [[project_evaluasi_pakaian_dinas_asn]], [[project_seragam_satpam_2026]], [[project_materi_belajar_keuangan]].
