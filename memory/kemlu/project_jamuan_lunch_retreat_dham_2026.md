---
name: project-jamuan-lunch-retreat-dham-2026
description: "KAK + RAB sederhana Jamuan Makan Siang Kepala Perwakilan untuk delegasi Retreat Dewan HAM (PTRI Jenewa, restoran di Bali, Okt 2026): nilai Rp30 jt = Pengadaan Langsung bukti kuitansi; dibuat 18 Okt 2026 dengan isian kosong + angka contoh"
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
- Tanggal jamuan, nama + alamat restoran, akun (521211 atau 521219, ikut DIPA), tempat teken.
- Contoh: 20 pax x Rp1.295.000 + service 5% + PBJT 10% = Rp29.914.500 (Rp1.495.725/orang). Ganti dari penawaran restoran.
- Pejabat sama dengan paket hotel: KPA Sidharto Reza Suryodipuro, PPK Nurul Sofia, Kanselerai Achsanul Habib.
## Dokumen Pejabat Pengadaan (18 Okt 2026, folder yang sama)
- 1 Undangan Permintaan Penawaran (2 hlm), 2 BA Evaluasi Klarifikasi dan Negosiasi (2 hlm, ttd PP + restoran),
  3 BAHPL (1 hlm), 4 BA Penetapan Penyedia ke PPK Nurul Sofia (1 hlm). Builder build_pp.py; format = set Pengadaan Jaket BUP
  (`MOFA\Pejabat Pengadaan\Pengadaan Jaket BUP\`, Des 2025, PP Aldo, penomoran 0xx/PP-UKPBJ/BAxx/.../26B).
- Nama/NIP Pejabat Pengadaan, nomor surat, tanggal, data restoran = isian kuning. Agent tidak mengisi nama PP: paket ini
  satker PTRI Jenewa, belum dipastikan siapa PP-nya.
- Logo kop Kemlu (dengan garis merah kanan) tersimpan sebagai kop_kemlu.png di builder.
## Jalur alternatif: akun Biaya Representasi (dicek 18 Okt 2026, teks resmi peraturan.go.id/files/bn54-2021.pdf)
- Dasar: **Permenlu 2/2021** (BN 2021/54, bukan "4/2021") tentang Tata Cara Pemberian Fasilitas PDLN di Perwakilan.
  Ps 1 angka 11 definisi; Ps 6: PDLN ajukan permohonan tertulis ke Kepala Perwakilan + rencana kegiatan (min. tujuan, jenis,
  tanggal & tempat, daftar undangan) -> persetujuan tertulis Kepala Perwakilan -> pertanggungjawaban = laporan tertulis +
  bukti pengeluaran sah; Ps 6(5) larangan kepentingan pribadi; Ps 7: dalam USD, alokasi per bulan per unsur, penggantian
  at cost; Ps 8: jamuan di kediaman PDLN besarannya ditetapkan Keputusan Kepala Perwakilan. Ps 15: BOK terpisah (strategis/khusus).
- Verdict ke Aldo: jalur representasi = fasilitas penggantian at cost, bukan proses PBJ -> dokumen Pejabat Pengadaan tidak
  dipakai [Likely]; KAK diganti rencana kegiatan/permohonan, RAB cukup sebagai lampiran estimasi. Risiko: alokasi bulanan USD
  mungkin < Rp30 jt; pemakaian di dalam negeri (Bali) belum jelas [Guessing] -> konfirmasi Kanselerai.
Terkait: [[project_sewa_kendaraan_retreat_dham_2026]].
