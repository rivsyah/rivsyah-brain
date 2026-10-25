---
name: project-akuntansi-pemerintahan-materi
description: "SELESAI 25 Okt 2026: 10 PDF lama Akuntansi Pemerintah (167 hlm) -> Edisi 2 = 6 PDF 993 hlm (Panduan 79, Dasar 217, Menengah 263, Lanjut 223, Bank Soal 168 / 382 soal, Koreksi 43 / 201 koreksi) di folder Akuntansi Pemerintah\\Edisi 2 (Okt 2026); builder ~/dev/personal/akuntansi-pemerintahan-materi (bash make.sh)"
metadata:
  type: project
---

Permintaan Aldo 25 Okt 2026 (mesin riv): "perbaiki, lengkapi, buat lebih bagus materi tata cara belajar dan materi
belajar ini dari tingkat beginner, intermediate, dan advance" atas 10 PDF di
`C:\Users\rivsy\Downloads\Riv's Journey\Materi Bahan Belajar\Keuangan dan Anggaran Pemerintah (Kemlu)\Akuntansi Pemerintah\`.
Scope: personal (materi belajar dari sumber publik saja; tidak memuat apa pun dari kartu kemlu/).

## Hasil
- 6 PDF di subfolder `Edisi 2 (Okt 2026)\`; 10 PDF lama TIDAK diubah.
- Gerbang: verify_content 73 berkas 0 ERROR/0 WARN; verify_pdf 6/6 lulus (daftar isi = tujuan tautan, soal = jawaban).
- Kasus rekaan: Satker A (Balai Layanan Publik Nusantara), Satker B (Kantor Perwakilan Rekaan, valas), Kementerian
  Pelayanan Publik (konsolidasi 3 satker termasuk BLU rekaan). Menengah Bab 11 sengaja tidak meneruskan angka Dasar Bab 9.

## Builder — `C:\Users\rivsy\dev\personal\akuntansi-pemerintahan-materi\`
- Salinan mesin [[project_materi_akuntansi_edisi2]] (md -> HTML -> Edge headless -> PyMuPDF). `bash make.sh` = koreksi,
  build, verify_pdf, salin. FACTS.md (22 butir regulasi, label Pasti/Mungkin/TIDAK TERVERIFIKASI), PLAN.md, SPEC.md.
- Gerbang domain baru di `tools/rules.json`: daftar PSAP berlaku, frasa usang (TKDD, PMK 231/2022, 213/2013, 190/2012,
  PP 49/2016, "12 PSAP", PSAP 14), arah DKEL/DDEL, akun LRA vs LO per buku besar.
- Jebakan build: Edge kadang selesai menulis PDF beberapa detik setelah proses keluar -> edge_pdf kini menunggu ukuran stabil.

## Fakta kunci (dicek 25 Okt 2026; rinci di FACTS.md)
- Arah TAE di modul lama BENAR: SP2D belanja = Cr DKEL 313111; setor PNBP = Dr DDEL 313121; LPE: DKEL (+), DDEL (−).
  Buku Besar Kas & Akrual memakai kode akun sama (BAS pusat: 4 pendapatan, 5/6 belanja=beban, 8 transitoris, 9 tak dipakai).
- PMK kebijakan akuntansi pusat = PMK 100 Tahun 2025 (cabut 231/2022; berlaku LK TA 2025). SAPP = PMK 217/PMK.05/2022.
- PSAP berlaku 01–13, 15–20 (18 & 19 mulai TA 2026, 20 Agrikultur TA 2027); Bultek terakhir No. 24.
- Pelaksanaan anggaran PMK 62/2023 s.t.d.d. PMK 107/2024 & 41/2026 (UP per penerima Rp50 jt sejak 22 Jun 2026).
- TKD (bukan TKDD); PNBP Kemlu PP 21/2025 (cabut PP 49/2016); Perwakilan PMK 160/PMK.05/2015 (dicabut sebagian).
- LKPP 2024 & 2025 WTP.

## OPEN
- Belum terverifikasi dari naskah: tarif penyisihan (PMK 207/2019), ambang kapitalisasi Rp1 jt/Rp25 jt, penyusutan
  per semester vs bulan, PP 37/2026 (disebut KSAP, tak ada di JDIH), status e-Rekon&LK, jurnal PFK & GUP nihil,
  penyeimbang Pengesahan Hibah Langsung, pengesahan BLU. Semua diberi kotak "cek ketentuan terbaru" di buku.
- 10 PDF lama mau diarsip? Belum ditanyakan.
