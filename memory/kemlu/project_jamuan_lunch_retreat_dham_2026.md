---
name: project-jamuan-lunch-retreat-dham-2026
description: "AKTIF: jalur PENGADAAN, akun 521219 BBNO, PAGU Rp50 jt (Aldo 20 Okt, semula 30 jt); set dipakai = 4 dok sangat sederhana PPK+PP. KAK + RAB sederhana Jamuan Makan Siang Kepala Perwakilan untuk delegasi Retreat Dewan HAM (PTRI Jenewa, restoran di Bali, Okt 2026): nilai Rp30 jt = Pengadaan Langsung bukti kuitansi; dibuat 18 Okt 2026 dengan isian kosong + angka contoh"
metadata:
  type: project
---

Pertanyaan Aldo 18 Okt 2026: apakah jamuan lunch delegasi asing oleh Kepala Perwakilan di restoran termasuk pengadaan, dan
perlukah KAK/RAB. Jamuan Rp30 jt, restoran di Bali, bagian dari Retreat Dewan HAM 18-21 Okt 2026.

## Verdict yang diberikan
- Masuk ruang lingkup PBJ (dibayar APBN). Lokasi dalam negeri -> Perpres PBJ berlaku penuh, pajak + meterai Indonesia.
- Rp30 jt = kelas kuitansi (> Rp10 jt s.d. Rp50 jt, Perpres 12/2021; belum dicek apakah Perpres 46/2025 mengubah batas).
- KAK/RAB per transaksi tidak wajib untuk kelas kuitansi [Likely], tetapi disarankan dibuat (nilai tinggi untuk 1 makan,
  delegasi asing, cegah tuduhan pemecahan paket). Tidak perlu bila TOR retreat sudah merinci jamuan ini.
- Risiko pembebanan ganda: menurut [[project_pco_retreat_dham_2026]] paket hotel Sofitel mencakup resepsi/jamuan/konsumsi.
  KAK memuat klausul bahwa jamuan ini terpisah dari kontrak hotel.

## Berkas (mesin riv)
- `C:\Users\rivsy\Downloads\MOFA\Pejabat Pengadaan\Pengadaan Jamuan Makan Siang Retreat Dewan HAM\`: KAK (.docx/.pdf,
  2 hlm, bab A-I tanpa sampul) + RAB (.xlsx/.pdf, 1 hlm, sel kuning = isian, rumus service/PBJT/total + cek batas).
- Builder `C:\Users\rivsy\dev\kemlu\jamuan-lunch-dham-2026\` (data.py = satu-satunya sumber angka; README.txt).

## Isian yang masih kosong / angka contoh (belum dari Aldo)
- Tanggal jamuan, nama + alamat restoran, tempat teken. Akun DIPUTUSKAN Aldo 19 Okt: 521219 Belanja Barang Non Operasional Lainnya.
- **Pagu Rp50 jt (Aldo 20 Okt 2026).** Contoh kini 30 pax x Rp1.440.000 + service 5% + PBJT 10% = Rp49.896.000
  (Rp1.663.200/orang, ~USD 93 < SBM Geneva USD 130). Versi lama: 20 pax, Rp29.914.500. Ganti dari penawaran restoran.
- Pagu = tepat batas kuitansi Rp50 jt: nilai riil > Rp50 jt -> wajib SPK + SPSE transaksional (Perpres 46/2025). KAK bab F
  kini memuat kalimat penjaga "tidak boleh melebihi pagu".
- Pejabat sama dengan paket hotel: KPA Sidharto Reza Suryodipuro, PPK Nurul Sofia, Kanselerai Achsanul Habib.
## Dokumen Pejabat Pengadaan (18 Okt 2026, folder yang sama)
- 1 Undangan Permintaan Penawaran (2 hlm), 2 BA Evaluasi Klarifikasi dan Negosiasi (2 hlm, ttd PP + restoran),
  3 BAHPL (1 hlm), 4 BA Penetapan Penyedia ke PPK Nurul Sofia (1 hlm). Builder build_pp.py; format = set Pengadaan Jaket BUP
  (`MOFA\Pejabat Pengadaan\Pengadaan Jaket BUP\`, Des 2025, PP Aldo, penomoran 0xx/PP-UKPBJ/BAxx/.../26B).
- Nama/NIP Pejabat Pengadaan, nomor surat, tanggal, data restoran = isian kuning. Agent tidak mengisi nama PP: paket ini
  satker PTRI Jenewa, belum dipastikan siapa PP-nya.
- Logo kop Kemlu (dengan garis merah kanan) tersimpan sebagai kop_kemlu.png di builder.
## Set SANGAT SEDERHANA yang dipakai (Aldo 19 Okt 2026) - build_sederhana.py, tiap dokumen 1 hlm
- PPK: 1 ND Permintaan Pengadaan + spesifikasi + HPS (ke PP), 3 BA Serah Terima (restoran-PPK, isi jumlah tamu riil + nilai
  bill), 4 Kuitansi (Setuju dibayar PPK / Lunas dibayar Bendahara / restoran + meterai). PP: 2 BAHPL gabungan
  (klarifikasi, nego, penetapan, sekaligus laporan ke PPK; ttd restoran + PP).
- Set 4 dokumen panjang (build_pp.py) dipindah ke subfolder `_Arsip versi lengkap (tidak dipakai)`.
- Masih isian: nama/NIP PP, nama Bendahara, nomor surat, tanggal, data restoran, nilai riil.

## SBM 2026 untuk jamuan (dibaca 19 Okt 2026 dari PDF lokal `Downloads\MOFA\Permenlu MoU\PMK 32 Tahun 2025.pdf`)
- TIDAK ada butir "jamuan delegasi asing" di SBM dalam negeri.
- Lamp. I (batas tertinggi) angka 38.1 Konsumsi Rapat Koordinasi Tingkat Menteri/Wamen/Eselon I/Setara (nasional):
  makan Rp118.000 + kudapan Rp53.000 per orang/kali; hanya untuk RAPAT luring min. 2 jam. Bali rapat biasa (38.2.17)
  Rp52.000 + Rp22.000. Kalau auditor memakai 38.1 untuk jamuan, 20 pax hanya ~Rp2,4-3,4 jt -> risiko temuan besar.
- Lamp. II (dapat dilampaui) angka 19.1 huruf f Jamuan Perwakilan LN = "jamuan tamu diplomatik di luar kantor";
  Geneva **USD 130 per OH** (OH = orang hari). x JISDOR 9 Okt Rp17.884 = ~Rp2.325.000/orang. Contoh RAB Rp1,50 jt/orang
  ada di bawahnya. Rekomendasi agent: pakai 19.1 Geneva sebagai acuan kewajaran (satker PTRI Jenewa, tamu = Dubes/Watap),
  tulis eksplisit bahwa 38.1 tidak berlaku karena bukan rapat [Likely; pemakaian SBM Perwakilan untuk jamuan di Bali = tafsiran].

## Jalur alternatif (TIDAK dipilih): akun Biaya Representasi (dicek 18 Okt 2026, teks resmi peraturan.go.id/files/bn54-2021.pdf)
- Dasar: **Permenlu 2/2021** (BN 2021/54, bukan "4/2021") tentang Tata Cara Pemberian Fasilitas PDLN di Perwakilan.
  Ps 1 angka 11 definisi; Ps 6: PDLN ajukan permohonan tertulis ke Kepala Perwakilan + rencana kegiatan (min. tujuan, jenis,
  tanggal & tempat, daftar undangan) -> persetujuan tertulis Kepala Perwakilan -> pertanggungjawaban = laporan tertulis +
  bukti pengeluaran sah; Ps 6(5) larangan kepentingan pribadi; Ps 7: dalam USD, alokasi per bulan per unsur, penggantian
  at cost; Ps 8: jamuan di kediaman PDLN besarannya ditetapkan Keputusan Kepala Perwakilan. Ps 15: BOK terpisah (strategis/khusus).
- Verdict ke Aldo: jalur representasi = fasilitas penggantian at cost, bukan proses PBJ -> dokumen Pejabat Pengadaan tidak
  dipakai [Likely]; KAK diganti rencana kegiatan/permohonan, RAB cukup sebagai lampiran estimasi. Risiko: alokasi bulanan USD
  mungkin < Rp30 jt; pemakaian di dalam negeri (Bali) belum jelas [Guessing] -> konfirmasi Kanselerai.
Terkait: [[project_sewa_kendaraan_retreat_dham_2026]].
