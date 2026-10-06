---
name: project_kajian_p3i_permenlu3
description: "Kajian konsultan PT Pilar Pradana Persada Internasional (P3I) untuk revisi Permenlu 3/2023 (batasan nilai PBJ LN wilayah -> per negara). LP (Okt 2026) direviu 5 Okt 2026; matriks catatan koreksi = Claude Doc (A7/B11/C7/D6); LP = pemicu termin I 30%; klaim awal tabel 5.2 rusak SALAH."
metadata:
  type: project
---

**Paket:** Jasa Konsultansi Kajian Batasan Nilai PBJ LN dlm rangka Revisi Permenlu 3/2023. Satker Setjen (BUP),
PPK Rudy Setiawan, HPS/RAB Rp99 jt. SPK 007/PPK-UKPBJ/SPK/09/2026/25 tgl 2 Sep 2026. Penyedia PT P3I
(Dirut Irwan Febriansyah). Berkas KAK + RAB + legalitas: `Downloads\MOFA\Pejabat Pengadaan\Pengadaan Jasa Konsultan Kajian RPermenlu 03 2023 P3I\`
(folder Pejabat Pengadaan → peran Aldo di paket ini kemungkinan Pejabat Pengadaan; reviu LP = sisi PPK/Tim Teknis).
LP: `Downloads\Laporan Pendahuluan Revisi Permenlu 3 Tahun 2023 P3I.pdf` (22 hlm; nomor kaki halaman = indeks PDF;
teks via pdftotext/PyMuPDF; Read tool PDF gagal karena pdftoppm tidak ada). SPK/SPMK sendiri BELUM ada di mesin.

**KAK inti:** batas nilai wilayah → per negara (131 Perwakilan: 95 KBRI, 30 KJRI, 4 KRI, 2 PTRI + negara akreditasi);
matriks min. 6 kolom (negara, Perwakilan, wilayah lama, batas PP vs Pokja, metode, dasar data); rumusan norma +
penjelasan + ketentuan transisi + mekanisme pembaruan berkala; min 2 TA; 90 hari kalender; termin I 30% saat LP
DISETUJUI PPK, termin II 70% (laporan akhir, policy brief, pedoman implementasi, matriks final, paparan);
Ps 17b revisi tanpa biaya; Ps 17d penajaman lingkup asal substansi utama tetap.
Catatan: daftar keluaran KAK (10 a-h) tidak memuat "policy brief" dan "pedoman implementasi" yang disebut di termin II.
**RAB (INTERNAL, jangan masuk dokumen ke penyedia):** Ketua Tim 2,0 OB × Rp22 jt, Anggota 2,0 OB × Rp18 jt, staf admin
2,0 OB × Rp3,5 jt, komunikasi/FGD Rp1 jt, penggandaan 4 eks Rp1 jt → Rp89 jt + PPN 11% = Rp98,79 jt. 2,0 OB = 2 bulan,
mendukung durasi 60 hari, bukan 90 hari seperti tertulis di KAK.

**Permenlu 3/2023 — pasal yang terkena revisi lampiran (dicek dari teks 5 Okt 2026):** huruf A Lampiran (besaran nilai)
dirujuk Pasal 5 ayat (4) [PPK, e-purchasing ayat (3) huruf i], Pasal 6 ayat (4) [Pejabat Pengadaan], Pasal 16 ayat (2)–(3)
[metode e-purchasing/PL/tender-seleksi menurut nilai]. Huruf B Lampiran (batas bukti kontrak: bukti pembelian, kuitansi,
SPK, surat perjanjian; surat pesanan untuk e-purchasing) dirujuk Pasal 22 ayat (2)–(3). Pasal 28 = penyesuaian dengan
ketentuan PBJ negara setempat (Keputusan Kepala Perwakilan; dasar ketentuan setempat terpublikasi atau pertimbangan
tertulis kantor hukum setempat; diterjemahkan).

**Reviu LP (5 Okt 2026) — temuan, diverifikasi 81 cek teks per halaman:**
1. Jangka waktu: LP "mulai 2 Sep, 60 hari, selesai ≤24 Nov" tidak konsisten. 60 hari dari 2 Sep = 31 Okt; 24 Nov = hari
   ke-84 = tepat hari ke-60 bila mulai 26 Sep → dugaan SPMK 26 Sep (BELUM dicek). KAK 90 hari. Maka "jadwal sudah
   tertinggal" hanya benar bila mulai 2 Sep — klaim [Certain] di chat awal terlalu kuat.
2. Lingkup melebar ke tata kelola: templat kontrak bilingual, kontrak payung, TTD digital/kontrak elektronik, VMS.
   Kajian bentuk kontrak sendiri sejalan KAK 9.b.2. LP menyebut dasar SPK/SPMK/diskusi tanpa pasal/notulen.
3. Tidak ada: matriks 6 kolom, daftar negara/131 Perwakilan, metode untuk negara di luar sampel, tenaga ahli,
   dasar hukum (0 sebutan Perpres/LKPP), sumber kurs, periode data, instrumen (kuesioner dll.), norma/peralihan/
   pembaruan berkala, policy brief/pedoman implementasi, K/L lain + APIP sebagai pemangku.
4. VMS skala Cukup 1/Baik 2/Sangat Baik 3 tanpa kategori buruk. Perlem LKPP 4/2021 menurut sumber sekunder
   (christiangamas.net, 5 Okt): 4 indikator (kualitas-kuantitas 30%, biaya 20%, waktu 30%, layanan 20%), skor 1–3,
   skor 0 = Buruk bila kontrak diputus PPK. Belum dicek ke naskah JDIH.
5. Redaksional: "actual" (hlm 10, 16), "serta tandai" (hlm 16), "<" (hlm 20), "Langkah" kapital (hlm 21), tanpa daftar
   isi/nomor tabel/lampiran.
**KOREKSI:** klaim awal "tabel 5.2 kolom bergeser" SALAH — artefak `pdftotext -layout`; render PyMuPDF menunjukkan
tabel rapi. Lihat [[reference-office-render]].

**Matriks catatan koreksi (5 Okt 2026):** Claude Doc "Catatan Koreksi Laporan Pendahuluan P3I" —
https://claude.ai/code/artifact/d4ffbab6-898b-4915-a2ae-ffbf90b1124a — A1–A7 (syarat persetujuan LP), B1–B11
(penajaman), C1–C7 (keputusan rapat), D1–D6 (redaksional); kolom tanggapan konsultan + dropdown hasil pembahasan;
blok pengesahan PPK/Tim Teknis/Penyedia. Tanpa nama Aldo/mention akun. Belum diekspor ke Word (Export di menu nama
doc). Hal internal (RAB, posisi termin) sengaja tidak masuk dokumen. C5 (policy brief/pedoman implementasi) membuka
inkonsistensi KAK sendiri — keputusan PPK apakah dibawa ke rapat.

**Kertas kerja Excel (5 Okt 2026, permintaan Aldo):** `Downloads\MOFA\Pejabat Pengadaan\Pengadaan Jasa Konsultan Kajian
RPermenlu 03 2023 P3I\Kertas Kerja Catatan Koreksi LP P3I.xlsx` — 4 lembar: Identitas (usulan, petunjuk, contoh pengisian,
ringkasan otomatis COUNTIF/COUNTIFS, disusun/direviu, pengesahan), A-B Matriks Koreksi (kolom kuning: tanggapan, dropdown
hasil pembahasan, dropdown status tindak lanjut Belum/Sebagian/Selesai, catatan verifikasi), C Keputusan Rapat, D Redaksional.
Cetak A4 lanskap 7 hlm (Identitas skala tetap 85% + pemisah halaman sesudah baris 24). Rumus diuji dengan isian contoh → OK.
Builder `C:\Users\rivsy\dev\kemlu\koreksi-lp-p3i\` (`build_xlsx.py` menolak menimpa tanpa `--force`; `finalize.ps1` =
Excel COM hitung ulang + AutoFit + ekspor PDF). Excel = salinan kerja; Claude Doc tidak ikut berubah bila Excel diisi.

**Kuesioner P3I "Versi Final" (diterima 6 Okt 2026, PDF dibuat 6 Okt 07.42):** `...\Kuesioner_Final_Revisi_Permenlu_3_2023_P3I_Kemlu.pdf`
26 hlm, 109 pertanyaan (A–N), 55 bertanda * ("disarankan wajib", akan dipindah ke Google Form), 34 isian paragraf;
Lampiran A rekap transaksi 19 kolom, B sumber harga/marketplace, C kualitas data. Periode data 2022–2026.
Reviu 6 Okt (dicek otomatis ke teks): (1) skenario stress test US$250.000 Goods & Services dan US$750.000 Works — di atas
batas tertinggi yang berlaku di SEMUA wilayah; asal angka tidak dijelaskan; tidak ada skenario jasa konsultansi;
(2) "threshold" tak didefinisikan — 0 sebutan Pejabat Pengadaan/Pokja/Pengadaan Langsung/Pasal; (3) metode C1 dan
dokumen H1 tidak memakai istilah Pasal 16/22; (4) data per negara akreditasi hanya isian paragraf; (5) 2022 = era
Permenlu 1/2019, Lampiran A tanpa penanda aturan/tanggal kontrak; (6) lingkup: ITPC/KDEI/IIPC di A1, bagian F (penyedia
Indonesia + mitra lokal), bagian J (PBJ K/L lain); (7) tidak ditanya: Pasal 28, tarif tenaga ahli lokal, pelaku PP/Pokja,
sertifikasi PBJ; (8) duplikat D5=M5, D6≈M6, A9≈J3, B7≈H7; tanpa tenggat/narahubung/perkiraan waktu;
(9) Google Form = akun siapa (KAK 16 data milik Kemlu); tanpa persetujuan Kepala Perwakilan. Hlm 23 hanya 1 opsi N6.
**Lampiran A Permenlu 3/2023 (dilihat langsung 6 Okt, hlm 17–18, USD):** 17 wilayah; batas Pejabat Pengadaan
(E-purchasing/PL/PnL; di atasnya Tender/Seleksi Pokja) barang/konstruksi/jasa lainnya US$35.000–244.000 (terendah: Afrika
Selatan, Afrika Utara, Asia Selatan, Asia Tengah; tertinggi Eropa Barat), konsultansi US$18.000–210.000. Catatan kaki:
nilai berdasarkan rata-rata besaran nilai pengadaan per wilayah.

**Status:** matriks (Doc + Excel) siap dipakai di rapat pembahasan; tanggal rapat belum ada. Kuesioner sebaiknya tidak
diedarkan sebelum direvisi dan disetujui PPK (butir A4). Terkait: [[project_rapat_kemendag_pbjln]]
(fakta Lampiran A/B), [[reference_mdp_pbjp_ringkas]] (9 celah), [[project_pdp_kemlu]] (VMS).
