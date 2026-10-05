---
name: project-ht-poc-satpam
description: "Pengadaan kuota data HT PoC Satpam Setjen Kemlu: KAK + RAB/HPS direvisi ke Okt-Des 2026 (Revisi 3, 27 Sep 2026); angka, keputusan, butir terbuka"
metadata:
  type: project
---

Paket: Pengadaan Layanan Kuota Data Seluler untuk 20 unit HT PoC (Hytera, BMN) Satpam Setjen Kemlu. Jasa Lainnya,
Pengadaan Langsung. Akun 6023.EBA.994.002.H.521111 "Penyediaan Data Cellular HT". PPK Charles Ivan Bob.
Penyedia berjalan: PT Anggoro Anonindo Mandiri (AAM).

File di mesin riv, folder `C:\Users\rivsy\Downloads\MOFA\Pejabat Pengadaan\`:
- Revisi 3 (27 Sep 2026): `RAB dan HPS - Layanan Kuota Data HT PoC Satpam Setjen Kemlu Okt-Des 2026.xlsx` dan
  `Spesifikasi Teknis - Layanan HT PoC Satpam Setjen Kemlu Okt-Des 2026.docx` (docx ini = "KAK" menurut Aldo).
- Revisi 2 (2-8 Sep 2026, Juli-Des, 113 unit-bulan): nama sama dengan akhiran `TA 2026`, TIDAK disentuh.

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

Nama PPK menurut Aldo (5 Okt 2026): **Charles Bob Ivan**. Dokumen paket ini masih memakai "Charles Ivan Bob" — ganti bila dicetak ulang; dokumen yang sudah diteken tidak disentuh. Lihat [[project-gws-business-standard]].
