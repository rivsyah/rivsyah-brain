---
name: project-pengadaan-bus-zenix-2026
description: "Paket kendaraan RO 6023.EBB.951.051.A.532111 (PNBP, pagu Rp2,2 M) TA 2026: medium bus 30+1 (HPS Rp1.317.332.500) + Innova Zenix 2.0 Q HV Modelista (HPS Rp609.200.000); KAK/Spektek, RAB/HPS, SSUK+SSKK dibuat 6 Okt 2026; bus TERHAMBAT SBM Rp1,1 M + listing tidak aktif + inden 90-120 hari; PPK RO ini = Dina A(malia Indriyati), NIP belum ada"
metadata:
  type: project
---

Dibuat 6 Okt 2026 atas permintaan Aldo ("buat KAK/Spektek, RAB, HPS dan SSKK untuk pengadaan bis dan Innova Zenix TA 2026").
Acuan: Surat Pesanan e-katalog TA 2025 (bus DGMI 21 Okt 2025 Rp1.312.797.000; Zenix Astrido 13 Des 2025 Rp608.100.000)
dan ND usulan kendis 2024, di folder paket.

## Berkas (mesin riv)

- Folder: `C:\Users\rivsy\Downloads\MOFA\Pejabat Pengadaan\Pengadaan Bus Kemlu dan Innova Zenix\` — 14 berkas: per paket
  `KAK Spektek - ...` (.docx/.pdf, 9 hlm), `RAB dan HPS - ...` (.xlsx/.pdf; lembar tersembunyi Kertas Kerja HPS, Uji Silang,
  Petunjuk), `SSUK dan SSKK - ...` (.docx/.pdf, 36-37 hlm), `Rincian HPS untuk INAPROC - ...` (.xlsx, hanya lembar HPS,
  untuk diunggah saat checkout — workbook kerja jangan diunggah karena memuat lembar internal).
- Builder: `C:\Users\rivsy\dev\kemlu\pengadaan-bus-zenix-2026\` (README.txt: build_all.py -> render.ps1 -> make_upload.py ->
  verify.py). Template = KAK AMDK rev4 + SSKK AMDK rev1. verify 6 Okt: 0 GAGAL, 3 "keputusan PPK" (bus).
- Ubah PPK/NIP di `konst.py`, harga di `harga.py`, lalu bangun ulang (angka KAK 4.2 + terbilang ikut).

## Angka (survei katalog.inaproc.id 6 Okt 2026)

- Zenix: Astrido Rp545.585.750 termasuk PPN 12% (DPP 487.130.134, PPnBM sudah di harga), ready stock 34 + BBN pelat merah
  Rp63.614.250 tanpa PPN = **Rp609.200.000** (= proyeksi Wasdit). Astra TSO Rp546.497.500 (tanpa BBN pelat merah). OTR Toyota
  1 Jul 2026 Rp626,9 jt (pelat hitam).
- Bus: DGMI GB150 L 30+1 Jetbus 5 MD Rp1.317.332.500 (= DPP 1.186.786.036 x 1,11) **"Produk Belum Aktif"**, pre-order 90 hr;
  DGMI 28+1 aktif Rp1,248 M pre-order 120 hr (+BBN-KB Rp45 jt); HMSI 30+1 Rp1.338.422.250 belum aktif. HPS = median 3 sumber
  = **Rp1.317.332.500** (Rp4.535.500 di atas proyeksi Wasdit). Lingkup bus TANPA BBN (sama TA 2025 + Wasdit).
- PPN: bus efektif 11% (bus >=16 orang bukan objek PPnBM, PMK 141/2021 Ps 26 e); Zenix 12% x harga jual; BBN 0%.
  Logika ini mereproduksi kedua SP 2025 sampai rupiah.

## Keputusan/terbuka (per 6 Okt 2026)

- **PPK**: lembar "Pembagian Pagu PPK" Wasdit BUM 2026 -> RO EBB.951.051.A = "Dina A" (nama lengkap di lembar realisasi:
  Dina Amalia Indriyati), PP = Ario Saloko, catatan "anggaran masih di blokir". Dokumen memakai nama itu; NIP isian kuning.
  Konfirmasi ke Aldo belum ada.
- **Bus melampaui SBM 2026** (PMK 32/2025 butir 36.3 Bus Sedang Rp1.100.000.000, batas tertinggi; penjelasan tidak menyebut
  PPN). Kontrak 2025 juga di atasnya. Pilihan PPK: negosiasi ke bawah SBM / produk setara lebih murah / tunda.
- **Waktu bus**: semua listing patuh pre-order 90-120 hr; batas serah terima di dokumen 11 Des 2026; SP wajib <= 30 Nov 2026
  agar kesempatan lintas TA (<= 90 hr, PMK 84/2025 Ps 16-18) masih mungkin. PMK 84/2025 tidak membolehkan bayar barang
  sebelum diterima dengan jaminan (pola TA 2025 tidak bisa diulang).
- Jaminan Pelaksanaan 5% wajib kedua paket (Perpres 46/2025 Ps 33, Perlem LKPP 2/2026 Ps 20). HPS wajib > Rp100 jt (Ps 26(7);
  Perlem 2/2026 Ps 13) dan diunggah .xlsx; total HPS <= pagu RUP atau checkout ditolak.
- Pelaksana e-purchasing > Rp200 jt: Pokja Pemilihan (PPK hanya untuk kriteria Perlem 2/2026 Ps 16(2)); bukan PP.
- **Risiko SP batal otomatis** (tambahan 7 Okt 2026): penyedia wajib menyetujui SP dalam tenggat sistem (3 hari; panduan
  kompetisi > Rp200 jt: 14x24 jam); lewat → batal otomatis TANPA jalur pemulihan. Sudah terjadi pada paket Furniture Lt 3.
  Pantau tenggat begitu SP terbit. Lihat [[reference_katalog_v6_sp_batal]].
- Zenix: SBSK PMK 172/2020 (dasar RKBMN 2026) — Eselon I-II sedan/SUV, MPV 2.000 cc = kelas Eselon III; TKDN Zenix belum
  terlihat di listing (cek Kemenperin). Inpres 7/2022 tidak melarang hibrida.

Rujukan pasal terverifikasi (konsolidasi LKPP Perpres 46/2025): Ps 19(2)d, 26(7), 33, 54(2), 56, 66, 78(3)-(4) [ayat (5)
DIHAPUS], 79(4)-(5), 85(1)a+(2). Teks ekstrak regulasi di scratchpad sesi (tidak permanen). Terkait: [[reference_pejabat_bup]],
[[reference_template_spk]], [[project_pengadaan_amdk]], [[reference-office-render]].
