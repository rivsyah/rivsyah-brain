---
name: project-ht-poc-satpam
description: "Pengadaan kuota data HT PoC Satpam Setjen Kemlu: KAK + RAB/HPS direvisi ke Okt-Des 2026 (Revisi 3, 27 Sep 2026); angka, keputusan, butir terbuka"
metadata:
  type: project
---

Paket: Pengadaan Layanan Kuota Data Seluler untuk 20 unit HT PoC (Hytera, BMN) Satpam Setjen Kemlu. Jasa Lainnya,
Pengadaan Langsung. Akun 6023.EBA.994.002.H.521111 "Penyediaan Data Cellular HT". PPK **Charles Bob Ivan** (koreksi Aldo 5 Okt 2026; lihat [[reference_pejabat_bup]]).
Penyedia berjalan: PT Anggoro Anonindo Mandiri (AAM).

File di mesin riv, folder `C:\Users\rivsy\Downloads\MOFA\Pejabat Pengadaan\` (berkas kini di subfolder; terlihat 5 Okt):
- `Pengadaan Data Celluar HT 2026\RAB dan HPS - Layanan Kuota Data HT PoC Satpam Setjen Kemlu Okt-Des 2026.xlsx` + `.pdf`
  (RAB, HPS, Daftar Unit) dan `Spesifikasi Teknis - Layanan HT PoC ... Okt-Des 2026.pdf`. Versi ini sudah disunting Aldo
  28 Sep (baris digeser, ttd Plt. Kepala Biro Sukmo Yuwono): edit di file ini, jangan build ulang dari skrip lama.
- **KAK .docx tertukar folder:** `Spesifikasi Teknis - Layanan HT PoC ... Okt-Des 2026.docx` ada di
  `Pengadaan Surat Kabar Kesekjenan\`, sedangkan KAK Media Cetak .docx ada di folder HT. Belum dipindah (5 Okt).
- Scan bertanda tangan `Pengadaan Data Celluar HT 2026\SKM_367 KEM26092815390.pdf` (28 Sep, 11 hlm: KAK 1-8, RAB,
  HPS, Daftar Unit): PPK sudah teken di atas nama tercetak "Charles Ivan Bob"; Plt. Kepala Biro belum teken.
- Revisi 2 (Juli-Des, 113 unit-bulan) berakhiran `TA 2026` di folder induk, tidak disentuh.

Angka Revisi 3 (diverifikasi ulang lewat hitungan independen):
- Volume 20 unit x 3 bulan = 60 unit-bulan, 1 Okt s.d. 31 Des 2026. Baris Kelompok A/B digabung jadi satu.
- HPS Rp80.000/unit-bulan TERMASUK PPN -> Rp4.800.000; Harga Jual Rp4.324.324,32; PPN Rp475.675,68.
- Pagu paket tetap Rp10.000.000 (asumsi, belum dikonfirmasi setelah lingkup dipersempit). HPS tidak wajib, Ps. 26 (7).
- Harga berjalan AAM Rp72.150 incl PPN (Rp65.000 + PPN) -> perkiraan kontrak Rp4.329.000 = 90,19% HPS.
- Juli-Sep 2026 = 53 unit-bulan (Rp3.823.950 pada harga AAM) DI LUAR paket. Invoice 014/INV/AAM/VIII/2026
  menagih 113 unit-bulan Jul-Des, jadi tidak bisa jadi dasar bayar paket Okt-Des.

Perbaikan ikut di Revisi 3: kode akun KAK kurang `002`; bab 11 dan butir 12.1 e hilang di KAK; rujukan
"Butir 7.2" di sheet Catatan seharusnya 7.1 angka 9 / 7.1 angka 12. Label "KRO / RO" di tabel 4.1 KAK berisi
nama Komponen, bukan RO — belum diubah, tinggal dilaporkan.

Terbuka (lihat sheet Catatan/Uji Silang): pembanding kedua HPS kosong, uji komponen belum diisi, 20 NUP BMN kosong,
1 IMEI 16 digit (HT 07), siapa bayar user ID PTT (ASUMSI-02), pagu RUP (ASUMSI-11), penyelesaian Jul-Sep (ASUMSI-12).
Kontrak harus diteken sebelum 1 Okt 2026 agar tidak mundur tanggal.

Cara bangun ulang: openpyxl pada koordinat asli, lalu Excel COM menghapus baris (rumus lintas sheet ikut geser),
`CalculateFull`, simpan. Docx: `merge_runs.py` dulu (run terpecah 2.426). Lihat [[reference_office_render]].

5 Okt 2026: nama PPK diganti "Charles Bob Ivan" langsung di XML berkas versi Aldo (xlsx: 1 shared string = RAB O35 +
HPS O23; KAK docx: 3 tempat), nilai rumus tetap; kedua PDF diekspor ulang dengan susunan sama (hanya baris nama beda).
Scan 28 Sep tetap bernama lama. Saran: koreksi tulisan tangan + paraf PPK (renvoi), supaya tanggal 28 Sep (sebelum
kontrak 1 Okt) tetap utuh; cetak ulang + teken ulang memaksa memilih antara tanggal mundur atau HPS sesudah kontrak.

## BAST Juli-Sep 2026 (19 Okt 2026)
Aldo minta BAST atas tagihan AAM Jul-Sep (`Downloads\invoice anggoro.pdf`, scan 4 hlm: kuitansi 014/KWT/AAM/X/2026,
invoice 014/INV/AAM/X/2026, surat jalan 014/SJ/AAM/VII/2026, faktur pajak 02002600422059623 tgl 13 Okt 2026).
- Tagihan: 60 unit-bulan x Rp72.000 (belum PPN). Faktur pajak: harga jual 4.320.000, DPP nilai lain 3.960.000,
  PPN 475.200 -> **total benar Rp4.795.200**. Invoice/kuitansi SALAH HITUNG: sub total 4.300.000, PPN 475.000,
  grand total **4.895.000** (lebih Rp99.800; 4.300.000+475.000 pun = 4.775.000). BAST memakai angka faktur.
- Harga Jul-Sep Rp72.000 belum PPN berbeda dari catatan lama (Rp65.000 + PPN = 72.150 incl). Volume 60 berbeda dari
  catatan lama 53 unit-bulan Jul-Sep -> lampiran BAST diberi kolom centang Jul/Agt/Sep untuk dicek.
- Surat jalan: nomor kartu HT 07 dan HT 08 sama (...207966500); HT 18 hanya 17 digit. Disalin apa adanya.
- Berkas: `Pengadaan Data Celluar HT 2026\BAST - Layanan Kuota Data HT Hytera Satpam Jul-Sep 2026.docx/.pdf`
  (BAST 1 hlm + lampiran 20 HT 1 hlm; isian kuning: nomor, hari/tanggal, jabatan Gutty, rangkap).
  Builder `~/dev/kemlu/bast-ht-jul-sep-2026/build_bast.py`.
