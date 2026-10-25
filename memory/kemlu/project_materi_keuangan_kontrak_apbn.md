---
name: project-materi-keuangan-kontrak-apbn
description: "Revisi 5 PDF materi belajar Anggaran & Pembayaran Kontrak APBN (Kemlu/Perwakilan) edisi Juli 2026 jadi seri Edisi 2 (Okt 2026) 8 PDF tiga tingkat; builder ~/dev/kemlu/materi-keuangan-kontrak-apbn; fakta regulasi terverifikasi primer 25 Okt 2026 di docs/FAKTA.md"
metadata:
  type: project
---

Mulai 25 Okt 2026 (sesi Bara, mesin riv). Permintaan Aldo: "perbaiki, lengkapi, buat lebih bagus materi tata cara
belajar dan materi belajar ini dari tingkat beginner, intermediate, dan advance". Scope: kemlu (isi = keuangan Kemlu;
semua contoh fiktif: Direktorat Sarana Kerja, KBRI Lindora, mata uang LND; tanpa data internal).

## Berkas
- Sumber lama (tidak disentuh): `Downloads\Riv's Journey\Materi Bahan Belajar\Keuangan dan Anggaran Pemerintah (Kemlu)\Pembayaran Keuangan Barang Jasa Pemerintah\` (2 panduan + 1 panduan lanjut + 1 modul Kemlu + 2 bank soal).
- Keluaran: subfolder `Edisi 2 (Okt 2026)\` di folder yang sama: KK-00 Panduan, KK-1A/1B Dasar, KK-2A/2B Menengah,
  KK-3A/3B Lanjut, KK-99 Lembar Ringkas.
- Builder: `C:\Users\rivsy\dev\kemlu\materi-keuangan-kontrak-apbn\` — `bash make.sh`; mesin disalin dari
  corporate-finance-materi (kotak baru: regulasi, perwakilan, alur, praktik; cek angka checks/kk.py).

## Fakta terverifikasi primer 25 Okt 2026 (pakai docs/FAKTA.md, jangan riset ulang)
- PMK 62/2023 s.t.d.d. PMK 41/2026 (tetap 12 Jun, undang 22 Jun 2026): Ps 210(1) LS utama; Ps 207 kontrak 5 HK;
  Ps 212 UP ≤ 1/12 pagu jenis belanja UP, maks Rp500 jt (lebih: Kanwil), GUP ≥50%; Ps 213 sanksi 25% lalu 50%;
  **Ps 214(2) batas UP per penerima Rp50 jt (asli PMK 62: Rp200 jt), 11 pengecualian termasuk kegiatan LN**;
  Ps 215–216 TUP (Kepala KPPN, 1 bulan, sisa 2 HK); Ps 187(5) PPK tak boleh rangkap KPA/PPSPM; KPA ex officio.
- PMK 196/2018 jo 97/2021: UP KKP 40%; bayar tagihan bank 1 HK (bukan 2); TUP KKP 30 hari.
- Perpres 46/2025 Ps 29(2) uang muka: UMK min 50% (50–200 jt), min 30% (s.d. 2,5 M), maks 30% (s.d. 15 M); non-UMK
  maks 20%; KTJ maks 15%. Ps 38(3) PL konstruksi ≤ Rp400 jt. Ps 37 Perpres 16/2018 eskalasi: KTJ > 18 bulan, bulan
  ke-13; a = 0,15 hanya bila keuntungan/overhead tidak dicantumkan (Perlem 12/2021). Lama Daftar Hitam tak lagi di Perpres.
- Pajak: PPh 22 kini PMK 81/2024 Ps 217–219 (PMK 34/2017 dicabut); PPN ambang Rp2 jt PMK 59/2022 Ps 18 masih berlaku;
  katering PPh 23 2%, bukan objek PPN; PP 9/2022 tarif konstruksi; PP 80/2010 honor PNS final; PMK 168/2023 bukan
  pegawai 50% bruto.
- PMK 160/2015: Ps 19(9) BPKRT ex officio BP; Ps 45(4) UP tak dibatasi per penerima; Ps 54(2) GUP pakai bukti
  pengeluaran (**SPTB TIDAK ada di PMK 160** — edisi lama keliru); kurs = Kurs Tengah BI.
- PMK 181/2016 Ps 40: kapitalisasi peralatan ≥ Rp1 jt, gedung ≥ Rp25 jt. Akun 535 tidak ada.
- Belum pasti: Perlem LKPP 3/2026 (mungkin ubah Perlem 12/2021), lama daftar hitam, KPPN layanan Perwakilan.

## Status — SELESAI 25 Okt 2026
- 8 PDF (743 hlm) di `...\Pembayaran Keuangan Barang Jasa Pemerintah\Edisi 2 (Okt 2026)\`, verify LOLOS penuh:
  Panduan 45, Dasar 131 + soal 96 (224), Menengah 121 + soal 107 (223), Lanjut 121 + soal 110 (186), Ringkas 12.
  185 contoh + 653 soal + tes penempatan 20; 402 blok hitungan dicek program. Berkas lama tidak disentuh.
- BPKRT = **Bendaharawan dan Penata Kerumahtanggaan Perwakilan** (PMK 160/2015 Ps 1 angka 12) — penulis sempat
  mengarang kepanjangan lain; sudah dikoreksi.
- Celah fakta yang ditulis umum (kandidat riset bila ada revisi): batas kas tunai bendahara, pasal larangan pemecahan
  paket, saat terutang PPN uang muka/termin, tarif PPh 26/P3B, cara hitung 90 hari PMK 84/2025, akuntansi uang muka
  belanja modal, matriks rangkap jabatan selain PPK, ambang bentuk kontrak termasuk/sebelum PPN.
- Jebakan: 6 agen berhenti karena batas mingguan API (reset 10.00 WIB); dilanjutkan dengan SendMessage, bukan agen baru.

Terkait: [[project-rapat-kemendag-pbjln]] (fakta Permenlu 3/2023, PMK 145/2017, 60/2018), [[reference-per9-pb-2026-llat]],
[[reference-template-spk]], [[project-corporate-finance-materi]] (mesin build asal).
