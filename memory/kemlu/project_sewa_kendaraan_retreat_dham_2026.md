---
name: project-sewa-kendaraan-retreat-dham-2026
description: "TERKINI 18 Okt: HPS = harga proposal Tarobali, volume penuh = Rp111.555.000, + SPPBJ & SPK, tanggal riil 18 Okt (agent MENOLAK tanggal mundur). Paket Sewa Kendaraan Kegiatan Retreat Dewan HAM (PTRI Jenewa, Bali 18-21 Okt 2026): KAK/Spektek + RAB/HPS dibuat 17 Okt 2026, HPS Rp89.910.000 (Aldo 17 Okt: naik ke 90 jt, akun 522141); referensi = KAK Hotel Rapat Dewan HAM PTRI Jenewa"
metadata:
  type: project
---

Dibuat 17 Okt 2026 atas permintaan Aldo. Referensi struktur bab A-K: `Downloads\KAK.pdf` = KAK Pengadaan Hotel Kegiatan
Rapat Dewan HAM, PTRI Jenewa, 31 Agu 2026 (KPA Sidharto Reza Suryodipuro, PPK Nurul Sofia, Kepala Kanselerai Achsanul
Habib, DIPA SP DIPA-011.01.1.403485/2026, akun 521219 + 524219, Hotel Sofitel Bali, total hotel Rp1.535.105.000).
Referensi memakai kata "Rapat"; dokumen ini memakai "Retreat" sesuai permintaan Aldo.

## Berkas
- `C:\Users\rivsy\Downloads\MOFA\Pejabat Pengadaan\Pengadaan Sewa Kendaraan Retreat Dewan HAM\` — KAK Spektek (.docx/.pdf 6 hlm,
  spektek = lampiran) + RAB dan HPS (.xlsx/.pdf; lembar RAB, HPS, Kertas Kerja HPS).
- Builder `C:\Users\rivsy\dev\kemlu\sewa-kendaraan-dham-2026\` (data.py = satu-satunya sumber angka; README.txt).

## TERKINI — disesuaikan ke proposal (18 Okt 2026 siang)
- Aldo memilih "harga + volume penuh, HPS naik": HPS satuan = proposal (Alphard 3,5 jt; Zenix 1,2 jt; Hiace 1,8 jt),
  volume 15/25/10 unit-hari, DPP 100,5 jt + PPN 11,055 jt = **Rp111.555.000**. Spek ikut proposal: Alphard 2023-24 6 pax,
  Zenix 2023-24 7 pax, Hiace 2022-24 13 pax. Kertas Kerja HPS menguji harga proposal di dalam rentang survei (YA x3).
  Tol/parkir tetap wajib ditanggung penyedia (KAK); lembur 10%/jam dan luar area Rp200 rb masuk Spektek; tanpa uang muka.
- Baru: `SPPBJ dan SPK - ... .docx/.pdf` (6 hlm; SPK + Lampiran I rincian harga + Lampiran II 17 syarat umum),
  builder build_spk.py. verify.py = gerbang (0 GAGAL): nilai, halaman kosong, tanggal tidak mundur, urutan tanggal.
- **Aldo minta tanggal mundur** (layanan sudah mulai 17 Okt: penjemputan panitia/delegasi). Agent MENOLAK: semua dokumen
  bertanggal riil 18 Okt (Minggu), PL 08.00-13.00 WITA, SPPBJ/SPK 18 Okt, layanan 18-22 Okt, BAST 23 Okt. Layanan 17 Okt
  dan 18 Okt sebelum SPK = di luar kontrak -> keputusan PPK/konsultasi APIP. Hasil nego diisi = penawaran (latar kuning).
- 18 Okt sore: Aldo menyunting KAK .docx + RAB/HPS .xlsx di folder (17:06/17:08, PDF terhapus), menyatakan bertanggal
  12 Okt, lalu minta SPPBJ/SPK/dokumen PP disesuaikan ke 12 Okt. Agent MENOLAK lagi (dokumen dibuat 17-18 Okt, survei
  17 Okt, proposal 7 Okt; SPSE tak bisa dimundurkan). Builder tetap TGL_DOK 18 Okt; berkas suntingan Aldo tidak disentuh.
- 19 Okt: dokumen PP dipecah jadi 4 berkas (PP-1 Undangan + lampiran 4 hlm, PP-2 BA EKN 2 hlm, PP-3 BAHPL 2 hlm,
  PP-4 Laporan 1 hlm; .docx/.pdf) di folder MOFA; berkas gabungan lama dipindah ke `_arsip\`. Tanggal tetap 18 Okt.
  Aldo lalu mengaku "hanya latihan"; agent tetap menolak memundurkan berkas asli, menawarkan paket latihan fiktif terpisah.
- 19 Okt sore: dokumen PP/PPK dibuat ulang dengan LAYOUT PAKET PCO (builder build_dok.py + layout.py disalin dari
  pco-retreat-dham-2026). MOFA kini: `Dokumen Pejabat Pengadaan\` (1 Undangan, 2 BA Evaluasi, 3 BA Klarifikasi dan
  Negosiasi + lampiran harga, 4 BAHPL, 5 BA Penetapan, 6 Pakta Integritas, Laporan) + `Dokumen PPK\` (0 Memo, 7 SPPBJ,
  8 SPK); jumlah halaman sama dengan PCO. PP-1..PP-5 + SPPBJ dan SPK gabungan (tak disunting) dihapus. Garis waktu
  data.TIMELINE riil 18 Okt 07.00-13.30 WITA, tempat [[Nusa Dua]]. Konflik terbuka: KAK/RAB/HPS suntingan Aldo kini
  bertanggal 5 Okt (sebelumnya 12 Okt); dokumen PP/PPK menyebut KAK/HPS ditetapkan 18 Okt.
- Catatan PCO: berkas PP/PPK PCO di folder MOFA bertanggal 10-22 Sep 2026 dengan nama asli (garis waktu mode latihan).
- Tempat teken = data.TEMPAT "Jakarta" (ganti bila diteken di Bali). Versi 89,91 jt: cadangan data.py di scratchpad sesi.

## Dokumen Pejabat Pengadaan (18 Okt 2026)
- `Dokumen Pejabat Pengadaan - Sewa Kendaraan Retreat Dewan HAM 2026.docx/.pdf` (8 hlm, folder yang sama; builder build_pp.py):
  Undangan PL + Lampiran 1-3 (format surat penawaran, rincian harga, daftar kendaraan/pengemudi), BA Evaluasi Klarifikasi
  Negosiasi (admin/kualifikasi, teknis, harga per item), BAHPL, Laporan Hasil PL ke PPK.
- Isian kuning: nama + NIP Pejabat Pengadaan, penyedia, nomor, tanggal/jam, angka penawaran + negosiasi.
- 18 Okt 2026 = hari Minggu dan hari pertama kegiatan: PL dan SPK sudah terlambat terhadap mulainya layanan.
- Seam: kartu PCO menyebut "Perlem LKPP 3/2026" untuk PL; [[reference-template-spk]] (dicek live 23 Sep) = Perlem 12/2021
  jo. 4/2024 masih berlaku. Paket ini pakai 12/2021 jo. 4/2024; 3/2026 belum diverifikasi.

## Proposal vendor (diterima 18 Okt 2026)
- `Proposal RAPAT DEWAN HAM 5.pdf` (folder paket, 3 hlm): PT Tarobali Transindo (Denpasar, Dir. I Wayan Sutrisna, anggota
  BRN Korda Bali), No. 020/PROP-TT/RAPATDEWANHAM/X/2026, 7 Okt 2026, ditujukan ke PPK Nurul Sofia.
- Tarif 12 jam incl pengemudi + BBM, BELUM tol/parkir, PPN tidak disebut: Alphard 2023-24 Rp3,5 jt (+45,8% vs HPS 2,4 jt);
  Zenix Rp1,2 jt (= HPS); Hiace 13 pax Rp1,8 jt (+20% vs Premio 1,5 jt; tipe Premio/Commuter tak jelas); Hiace drop
  Rp900 rb; blindvan bagasi Rp850 rb/12 jam, Rp400 rb drop. Luar area Rp200 rb; lembur 10%/jam; DP 50% + lunas 3 hari.
- Pada volume HPS: Rp100,5 jt + PPN = Rp111,555 jt, di atas HPS Rp21,645 jt. Lampiran "kebutuhan" tidak ada di PDF.
- Ganjalan: DP 50% melebihi batas uang muka Perpres (perlu dicek angka pastinya) dan butuh jaminan; ada kolom tanda tangan
  "Penerima Proposal" untuk PPK. Saran agent: PPK jangan teken; proposal = bahan, bukan kontrak.

## Target negosiasi + dokumen PP terisi (18 Okt 2026)
- Aldo: HPS TETAP Rp89,91 jt; Tarobali = vendor yang dipakai unit kerja untuk retreat Jenewa.
- Dokumen PP kini memuat identitas PT Tarobali Transindo (alamat kop proposal, Dir. I Wayan Sutrisna); NPWP, nama/NIP
  Pejabat Pengadaan, nomor, tanggal, angka penawaran masih kuning.
- `Target Negosiasi - ... .xlsx/.pdf` (internal, tidak untuk penyedia): satuan pembuka/target/batas — Alphard
  2,2/2,4/2,4 jt; Zenix 1,1/1,15/1,2 jt; Hiace Premio 1,3/1,5/1,5 jt; semua sudah termasuk tol/parkir. Total pembuka
  Rp81.585.000, target Rp88.522.500, batas = HPS. Lembar Butir Non-Harga 13 butir (tol/parkir, PPN/PKP, tolak DP 50%,
  tipe Hiace, blindvan di luar HPS, PPK jangan teken proposal, minta harga kontrak retreat Jenewa sebagai pembanding).

## Angka (paket 12 jam/hari, termasuk pengemudi + BBM + tol + parkir, belum PPN)
- **Revisi 17 Okt 2026 (Aldo):** akun **522141 Belanja Sewa**; HPS jadi ±90 jt lewat tambah volume, harga satuan tetap median.
- Alphard 3 unit x 5 hr x Rp2.400.000 = 36 jt; Innova Zenix Hybrid 5 x 5 x Rp1.200.000 = 30 jt; Hiace Premio 2 x 5 x
  Rp1.500.000 = 15 jt. DPP 81 jt + PPN 11% 8,91 jt = **Rp89.910.000**. (Versi awal 2/4/2 unit = Rp69.930.000.)
- Harga = median 3 situs operator Bali (diakses 17 Okt 2026; luxurycarhirebali, balinusatransport, baliprivatedrivers,
  gk-balitrans, mybalitrips), bulat ke ribuan ke bawah. Harga situs kebanyakan TIDAK termasuk tol/parkir.
- Jadwal: unit 18-22 Okt, BAST 23 Okt 2026.

## Asumsi agent (belum dikonfirmasi Aldo)
- Komposisi kendaraan (jenis, unit, hari) dirancang agent agar total <= 70 jt.
- Metode = Pengadaan Langsung (dasar hukum Perlem LKPP 12/2021 jo 4/2024), bukan dikecualikan (Perlem 5/2021) seperti hotel.
- Tanggal teken "......... Oktober 2026". Dibuat 17 Okt = 1 hari sebelum kegiatan: kontrak harus ada sebelum 18 Okt.SPPBJ + SPK kini merujuk BA Penetapan. Aldo menghapus PDF + `_arsip` di folder MOFA -> salin .docx saja; PP-4 Laporan lama dihapus.
