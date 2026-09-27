---
name: project-pengadaan-amdk
description: "Paket AMDK Setjen Kemlu TA 2026 (e-purchasing, Aldo = Pejabat Pengadaan): Revisi 2 27 Sep 2026 = Okt–Des, 2.980 galon + 120 karton, Rp64,4 jt; file, metode volume, isu terbuka, jebakan workbook"
metadata:
  type: project
---

Paket: Pengadaan AMDK untuk Layanan Pegawai Setjen Kemlu TA 2026. E-purchasing Katalog Elektronik, bentuk kontrak
Surat Pesanan, akun 521111. Aldo menyusun RAB/HPS dan KAK sebagai Pejabat Pengadaan; PPK yang menandatangani.

## File (mesin riv, `C:\Users\rivsy\Downloads\MOFA\Pejabat Pengadaan\`)

- `RAB_HPS_AMDK_Setjen_Kemlu_TA2026_rev3.xlsx` — **terkini**, isi = "Revisi 2, 27 September 2026". `rev2.xlsx` = Revisi 1 (Sep–Des).
- `KAK_Spektek_AMDK_Setjen_Kemlu_TA2026_rev2.docx` — **terkini**, 8 hlm. `rev1.docx` = Sep–Des.
- SSKK: `Pengadaan AMDK Sekjen\SSKK_Terisi_AMDK_Setjen_Kemlu_TA2026_rev1.docx` — **terkini** (27 Sep 2026), selaras
  KAK rev2/RAB rev3. File tanpa `_rev1` = draf 5 Agu 2026, tidak disentuh. Isi file = SSUK e-purchasing (butir 1–67)
  + tabel SSKK + tanda tangan PPK; yang direvisi hanya tabel SSKK dan tanda tangan:
  12.1 periode kebutuhan Okt–Des; 12.2 10 titik (KAK 6.2) + jam 08.00–15.00; 22.1 + titik penyerahan & dokumen mutu;
  27.1 termin bulanan + rekapitulasi per titik; 28.1 SNI 3553:2015, BPOM RI MD, halal BPJPH, PDN; 52 hanya
  "Jaminan Pelaksanaan TIDAK disyaratkan" (Ps. 33 (2) b e-purchasing + nilai HPS Rp64,4 jt; Alternatif B dibuang,
  4.3.b jadi "tidak berlaku"); 57.2 termin bulanan saja; 57.5 + rekapitulasi; tanggal "September 2026";
  nama PPK "Charles Bob Ivan" -> "Charles Ivan Bob".
  Butir 52 sengaja TIDAK dihapus (beda dengan saran sheet 5 D11): SSUK 52.1 mewajibkan jaminan sebelum kontrak,
  jadi SSKK harus menyatakan pengecualiannya secara tegas.
  Terbuka: 33.2 d merujuk "Pasal 78 ayat (3)" untuk produk impor/PDN, padahal teks 78 (3) yang tampil di pasal.id
  hanya huruf a–f tanpa soal PDN [perlu verifikasi]; KAK 12.2 f menghitung denda dari "nilai kontrak", SSKK 57.3
  dari "nilai bagian kontrak yang belum diserahkan" (SSKK lebih tepat, Ps. 79 (4)); e-mail PPK dan data Penyedia kosong.
- Nomor file ≠ nomor revisi di dalam dokumen (file rev3 = Revisi 2). Naikkan keduanya satu langkah pada revisi berikut.

## Angka Revisi 2 (27 Sep 2026, periode dipersempit atas arahan Aldo)

- Basis 993 galon/bulan = rata-rata realisasi Jan–Jul 2026 (6.951/7). x 3 bulan = 2.979, CEILING 10 = **2.980 galon**.
- Karton 330 ml = ASUMSI 40/bulan x 3 = **120 karton** (tidak ada data realisasi botol).
- Harga Rp20.000/galon dan Rp40.000/karton, termasuk PPN. Total **Rp64.400.000** (Revisi 1: 3.980 + 160 = Rp86 jt).
- Alokasi titik: titik 2–10 = ROUND(rata-rata x bulan), Pejambon menampung selisih →
  2.504 / 81 / 77 / 71 / 69 / 51 / 46 / 34 / 26 / 21. Di workbook sudah jadi rumus (sheet 1b), di KAK tabel 6.2 statis.

## Isu terbuka (belum diputus Aldo per 27 Sep 2026)

- **Pagu tidak sama:** KAK 4.1 = Rp100.000.000; RAB/HPS "Alokasi Dana / Pagu Paket" = Rp896.819.000 (dari Aldo 8 Sep).
- **Sumber harga** Rp20.000/Rp40.000 belum ditunjuk. SKU PT Tirta Fresindo Jaya 7 Jul 2026 = Rp17.550/Rp34.800.
  Pembanding baru 1 dari minimal 2; kotak peringatan merah di HPS tetap tercetak sampai ini beres.
- 3 titik bukan gedung kantor (Jagakarsa, Wican = rumah dinas; Cipayung = wisma) = 106 galon dari akun 521111.
- Pemaketan: seluruh AMDK TA 2026 ≈ 11.917 galon ≈ Rp238 jt > Rp200 jt bila dipandang satu kebutuhan
  (kewenangan PPK + jaminan pelaksanaan). Dasar pasokan Agustus–September belum diketahui.

## Jebakan workbook

- Dibangun dengan openpyxl → tanpa cached value. Hitung ulang + simpan lewat Excel COM sebelum diserahkan
  ([[reference_office_render]]).
- Sheet 0, 1, 4, 5 sengaja **hidden**; yang tampil hanya 2. RAB, 3. HPS, 1a, 1b.
- `TEXT()` rusak di Excel berlocale Indonesia ("0.0%" → "07%"). Sudah diganti `FIXED()` di RAB A49 dan sheet 5 C23–C24.
- Diperbaiki di Revisi 2: sheet 5 B32 semula menarik volume, bukan harga, sehingga uji pemaketan salah simpul.

Dasar hukum KAK huruf e sudah diganti ke Perlem LKPP 2/2026 tentang Katalog Elektronik dalam PBJ (berlaku 1 Sep 2026,
mencabut Perlem 9/2021, transisi 1 tahun). Sumber: jdih.lkpp.go.id. Terkait: [[reference_template_spk]].

File versi lama yang "hilang" di tengah sesi 27 Sep ternyata dihapus Aldo ke Recycle Bin (09:19). Cek Recycle Bin
dulu sebelum menganggap data hilang.
