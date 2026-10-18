---
name: project-sewa-kendaraan-retreat-dham-2026
description: "Paket Sewa Kendaraan Kegiatan Retreat Dewan HAM (PTRI Jenewa, Bali 18-21 Okt 2026): KAK/Spektek + RAB/HPS dibuat 17 Okt 2026, HPS Rp89.910.000 (Aldo 17 Okt: naik ke 90 jt, akun 522141); referensi = KAK Hotel Rapat Dewan HAM PTRI Jenewa"
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
- Tanggal teken "......... Oktober 2026". Dibuat 17 Okt = 1 hari sebelum kegiatan: kontrak harus ada sebelum 18 Okt.
