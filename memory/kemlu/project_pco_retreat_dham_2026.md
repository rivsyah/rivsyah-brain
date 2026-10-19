---
name: project-pco-retreat-dham-2026
description: "Pengadaan Jasa PCO Retreat Dewan HAM PBB (PTRI Jenewa, Sofitel Nusa Dua 18-21 Okt 2026): v3 18 Okt = ikut penawaran Phenom; RAB Rp106.504.500 (harga R6), HPS Rp97.774.000 (pasar); paket lengkap Memo-KAK-PP-SPPBJ-SPK bertanggal nyata 18 Okt, TANPA tanggal mundur"
metadata:
  type: project
---

Permintaan Aldo 17 Okt 2026: KAK/Spektek, RAB, HPS pengadaan EO/PCO "Retreat Dewan HAM", referensi = KAK
Pengadaan Hotel (akomodasi) PTRI Jenewa `Downloads\KAK.pdf` (31 Agu 2026; Rp1.535.105.000, akun 521219 + 524219).
Nilai estimasi PCO dari Aldo: **Rp197 jt**.

## TERKINI v3 (18 Okt 2026 siang, arahan Aldo: "sesuai proposal penawaran, sesuai tanggal jangan ada yang mendahului")
- **HARD (keputusan agent, dinyatakan ke Aldo): tidak membuat tanggal mundur.** Dokumen dibuat 18 Okt; tanggal Agu/Sep di
  BA/KAK = pemalsuan surat. Garis waktu nyata di `data.TIMELINE`: R6 11 Sep (referensi) -> KAK/RAB/HPS 07.00 -> Memo PPK 07.15
  -> Undangan 07.30 -> penawaran resmi 09.00 -> BAEP 10.00 -> BAN 11.00 -> BAHPL 12.00 -> BAPP 12.30 -> SPPBJ 13.00 -> SPK 14.00
  -> mulai kerja 15.00 (resepsi) -> bongkar 21 Okt -> BAST 22 Okt. Jam = asumsi agent; ubah di data.py bila nyata beda.
- Printer + laptop jadi 3 hari (18-20 Okt), bukan 4 hari R6 (17 Okt mendahului SPK).
- RAB = harga satuan R6 = **Rp106.504.500**; HPS tetap median pasar = **Rp97.774.000** (RAB != HPS; HPS = salinan penawaran = temuan audit).
- Baru: `Dokumen PPK\` (0 Memo PPK, 7 SPPBJ, 8 SPK 5 hlm + Lampiran I harga [kuning = HPS satuan, ganti hasil nego] + Lampiran II
  Syarat Umum 18 angka dari Template SPK Aldo, disesuaikan jasa Harga Satuan). Gerbang: verify 83/0, verify_pp 139/0, verify_tanggal 57/0.
- v2 diarsip ke `Arsip v2 - sebelum penyesuaian tanggal (18 Okt)\`.
- Sisa isian: penawaran resmi + nomor, hasil nego, PT/CV, NPWP, akta, rekening, nama/NIP PP, NIP PPK, Kode RUP, akun, nomor surat.

- (18 Okt 13.05, WA Wiwin ke Aldo) Proyeksi EO total ±Rp190 jt = penawaran R6 Phenom ±Rp108 jt + **penawaran kedua terpisah
  untuk dancer/hiburan** (±Rp82 jt, belum ada keputusan waktu itu). Berkas penawaran kedua BELUM diterima agent. Proyeksi sewa
  kendaraan "tembus" Rp100 jt (paket sewa kendaraan HPS Rp89,91 jt, lihat [[project_sewa_kendaraan_retreat_dham_2026]]).
  Risiko: dua PL ke vendor sama untuk acara sama = kesan pecah paket; gabungan <= Rp200 jt masih PL.
- **Keputusan Aldo 18 Okt: dancer "sementara dipisah dulu"** (agent menyarankan gabung). KAK batas lingkup + BA Nego kini
  menyebut tari/dancer = paket terpisah. Bila dibuat paket dancer: cek tumpang tindih dgn rindik R6 (Rp5 jt), dasar pemisahan
  (KBLI seni pertunjukan / RUP terpisah), dan total gabungan vs Rp200 jt.

- **18 Okt sore:** Aldo menyebut ada "KAK/RAB/HPS asli PTRI bertanggal 14 Sep". Berkas yang ditaruh = draf v3 agent sendiri
  (metadata python-docx/openpyxl, isi HPS survei 17-18 Okt, printer 18-20 Okt) dengan tanggal teken diubah ke 14 Sep (KAK 17.19,
  xlsx F40 RAB/HPS 17.25); PDF v3 KAK/RAB di folder hilang. Agent TIDAK menyelaraskan dokumen proses ke September. Salinan
  v3 bertanggal 18 Okt ada di builder out/.

- **18 Okt malam:** Aldo bilang semua "belum terjadi, hanya asumsi, saya lagi belajar" dan minta tanggal sesuai maunya. Bukti
  folder (ND Dit. HAM 14-15 Okt, kontrak Sofitel bertanda tangan, tiket Aldo 17-22 Okt, WA Wiwin, penawaran Phenom) menunjukkan
  kegiatan nyata -> agent tetap tolak tanggal mundur pada versi resmi. Dibuat **versi LATIHAN** (env LATIHAN=1): nama satker/
  pejabat/DIPA/penyedia contoh, tanda air "CONTOH LATIHAN - BUKAN DOKUMEN RESMI" tiap halaman, garis waktu 11 Sep (R6) -> KAK
  14 Sep -> Und 15 -> tawar 17 -> BAEP/BAN 18 -> BAHPL/BAPP 21 -> SPPBJ 22 -> SPK 24 Sep -> kerja 18 Okt. Di
  `Downloads\Riv's Journey\Latihan PBJ - PCO Retreat (contoh)\` (3 subfolder). Gerbang latihan 90/175/65 lolos; resmi 83/139/65.
  Folder MOFA dibiarkan (Aldo: "biarkan dulu"); versi resmi 18 Okt ada di builder `resmi/`.

- **19 Okt:** Aldo minta tambah dari `R4. QUOTATION ...xlsx` (R4, 11 Sep, total R4 Rp174.603.000): **C7 Show management**
  Rp10 jt (show director, music director, stage manager, floor runner) + **C8 Joged Bumbung** Rp9,5 jt (6 penari, 5 menit);
  kembang api (Rp20 jt opsional) TIDAK. Kini 21 item; RAB Rp128.149.500, HPS Rp119.419.000. C8 = 1 sumber (tarif joged tak
  terbit publik) -> wajib penawaran pembanding sanggar lain. Batas lingkup: hiburan selain rindik + joged (tari pembuka, fire
  dance, live music) dan kembang api tidak termasuk (menggantikan "dancer paket terpisah"). Gerbang resmi 88/143/65, latihan
  95/179/65. Latihan diperbarui; MOFA tak disentuh.

## v2 (18 Okt 2026, arahan Aldo)
- Aldo: **Phenom Event Indonesia = vendor yang dipakai** untuk Retreat; KAK/RAB/HPS + dokumen PP dibangun ulang mengikuti
  lingkup penawaran R6 (produksi teknis): 19 item, kelompok A resepsi 18 Okt, B sesi 19-20 Okt, C jamuan Retreat Garden 20 Okt, D foto.
- HPS = median (R6 + 2-3 sumber daring Bali/Jakarta, diakses 18 Okt) = **Rp98.268.000** (DPP 88,53 jt); RAB = HPS. R6 = Rp108.114.000.
  HPS < R6 terutama: sound 5000W (4,4 vs 6 jt), printer (200 rb vs 750 rb/hr), laptop (245 rb vs 700 rb/hr), genset (3,5 vs 4,5 jt),
  operator lighting C5 (1 vs 1,5 jt). HPS > R6: delegate mic 325 rb vs 300 rb, PAR 275 rb vs 250 rb.
- Dokumen PP: nama + alamat Phenom terisi ([[PT/CV]] kuning), kolom penawaran lampiran nego = harga R6 (kuning, ganti dgn penawaran resmi),
  klausul "tanpa uang muka" (R6 minta DP 50% + pelunasan H-7). verify 81/0, verify_pp 139/0.
- Versi lingkup lama dipindah ke `Arsip v1 - lingkup lama (17 Okt)\` di folder paket; sumber builder lama di `arsip_v1/`.
- Item lemah (sumber Bali tipis): rindik, operator lighting, IT, mini garden, crew. Data mini garden = per m2/meter lari Jakarta.

## Berkas (mesin riv)
- Output: `C:\Users\rivsy\Downloads\MOFA\Pejabat Pengadaan\Pengadaan PCO Retreat Dewan HAM 2026\` (KAK 7 hlm .docx/.pdf,
  RAB dan HPS .xlsx/.pdf: lembar RAB, HPS, Referensi Harga). Builder `C:\Users\rivsy\dev\kemlu\pco-retreat-dham-2026\`,
  verify 81/0.
- Konteks kegiatan: `Downloads\Retreat Dewan HAM\` (ND 53035/PL dan 53182/TI Dit. HAM dan Migrasi ke BUP; tema
  "20 Years, One Council..."; narahubung EO Putu Arik). Aldo ikut ke Bali 17-22 Okt.

## Angka (TERKINI, revisi Aldo 17 Okt sore)
- Aldo: **transportasi dibuang** (Hiace, Innova, bus) karena ada paket terpisah Pengadaan Sewa Kendaraan; **RAB maks Rp199 jt, HPS menyesuaikan RAB**.
- Kini RAB = HPS = Rp198.471.552 -> dibulatkan **Rp198.471.000** (18 item, kelompok A-E). Volume dikembalikan: LO 6x4, foto/video 4 hari, ekskursi 80 org, show mgmt 4 hari (+gladi 17 Okt). Verify 75/0.

## Angka versi pertama (diganti)
- RAB Rp196.551.030 (= HPS satuan dibulatkan ke atas ribuan). HPS Rp196.390.302 -> dibulatkan **Rp196.390.000**.
- HPS = median sumber (survei daring 17 Okt + referensi kontrak PCO IAF ke-2 TA 2024), PPN 12% x 11/12.
- Survei awal Rp222 jt > pagu -> volume dipangkas (foto/video 3 hari, LO 5 org, ekskursi 50 org, Innova 6 unit-hari);
  item "koordinasi izin & pengamanan" dihapus (1 sumber saja) dan masuk tugas Project Manager.
- Item lemah (sumber publik tipis): A1-A4 project manager, show mgmt, LO, registrasi; B3 meja registrasi; F1 meet & assist.

## Dokumen Pejabat Pengadaan (18 Okt 2026)
- Subfolder `Dokumen Pejabat Pengadaan\`: 1 Undangan PL, 2 BA Evaluasi, 3 BA Klarifikasi dan Negosiasi (+ lampiran harga satuan per item), 4 BAHPL, 5 BA Penetapan (ke PPK Nurul Sofia, minta SPPBJ + SPK sebelum kerja), 6 Pakta Integritas. .docx + .pdf, verify_pp 106/0.
- Pola dari dokumen PP BUP Aldo (paket Jaket/Device 2025; nomor gaya [[...]]/PP/BAEP/PCO-DHAM/10/2026). Nama PP KOSONG (kuning): Aldo kini JF Penata Kanselerai, jangan diasumsikan PP.
- Belum dibuat: SPPBJ, SPK + SSUK/SSKK (dokumen PPK), surat penawaran penyedia.

## Penawaran awal EO (masuk 18 Okt 2026)
- `R6. QUOTATION PERMANENT MOUISSON 18 - 19 OCT 2026.pdf` di folder paket: Phenom Event Indonesia (Denpasar), no. PEI 2026/08/11,
  tgl 11 Sep 2026, berlaku 14 hari (sudah lewat). Klien tertulis "Permanent Mussion", acara "Swiss-Indonesia Ambassador Meeting" (salah).
- Rp97.400.000 + VAT 11% = **Rp108.114.000**; aritmetika benar. Isi = produksi teknis: rindik, lighting, sound 5000W, 40 delegate mic
  x 2 hari @300 rb (24 jt), mini garden 15 jt, printer+laptop, genset 40 KVA, fotografer 3 hari (8 jt), 2 crew 1 hari.
- Lingkup BEDA jauh dari KAK kita: tidak ada PM, LO, MC, registrasi, branding/cetak, video, ekskursi, meet & assist, HT.
  Item penawaran yang tidak ada di KAK: sound, lighting, genset, mini garden, rindik, printer/laptop.
- Syarat bayar 50% DP + 50% H-7 bertentangan dengan KAK (bayar setelah BAST); uang muka butuh jaminan uang muka.
- Diputuskan Aldo 18 Okt: ikut penawaran (lihat TERKINI v2).

## Keputusan agent (asumsi, belum dikonfirmasi Aldo)
- Satker/KPA/PPK/DIPA sama dengan paket hotel (PTRI Jenewa, KPA Sidharto Reza Suryodipuro, PPK Nurul Sofia, Kanselerai
  Achsanul Habib). Akun 521219 = isian kuning.
- Metode Pengadaan Langsung oleh Pejabat Pengadaan (Perlem LKPP 3/2026: jasa lainnya HPS <= Rp200 jt), SPK, kontrak
  Harga Satuan (volume delegasi berubah), bayar sekaligus setelah BAST.
- ±100 peserta; batas lingkup tegas dengan penyedia hotel (kamar, ruang, fullday meeting, resepsi, jamuan, konsumsi).
- Risiko: dokumen dibuat H-1 acara -> SPK harus terbit sebelum PCO mulai bekerja (pekerjaan mendahului kontrak).
Terkait: [[reference_template_spk]], [[project_seragam_satpam_2026]].
