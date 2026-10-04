---
name: project-kti-sigap-sipdln
description: "KTI (makalah, format Permenlu 23/2020) 'Pengendalian Melekat Berbasis Sistem ... SIGAP BUP dan SIPDLN-BUP' untuk percepatan pangkat/golongan (PG PNS) Aldo — 41 hlm, verify 16/16 (4 Okt 2026); + draf kasar netral 4 hlm 'untuk Dedi' (asumsi, belum dikonfirmasi); builder ~/dev/kemlu/kti-sigap-sipdln; hasil di Downloads\\Riv's Journey\\KTI SIGAP-SIPDLN"
metadata:
  type: project
  modified: 2026-10-04
---

# KTI SIGAP BUP + SIPDLN-BUP (4 Okt 2026)

Permintaan Aldo 4 Okt 2026: "buatkan karya tulis ilmiah untuk percepatan PGPNS project berikut ...
SIGAP-BUP dan SIPDLN-BUP, setelah itu buatkan rough draft dari project itu untuk Dedi". Lampiran yang
dikirim: Permenlu 2/2026 (penghargaan), lalu Renstra (Permenlu 10/2025) dan Permenlu 23/2020 (pedoman KTI).

**Tafsir "PGPNS" = pangkat/golongan PNS** [Likely] — dari berkas `Kenaikan Pangkat Golongan 3B Rivaldo H.pdf`
di `Downloads\Riv's Journey\Ukom JFPK\Dokumen Pendukung` (Aldo III/b, JF PPBJ sejak 2023, sedang proses
pindah ke JF Penata Kanselerai lewat Ukom). Belum dikonfirmasi Aldo. Jalur percepatan: [[reference-kti-percepatan-pangkat]].

## Berkas (mesin riv)

- Hasil: `C:\Users\rivsy\Downloads\Riv's Journey\KTI SIGAP-SIPDLN\` — `KTI Pengendalian Melekat SIGAP-SIPDLN - Rivaldo H.docx/.pdf`
  (41 hlm: sampul berlogo, 2 lembar pengesahan Lampiran I A/B, abstrak 185 kata + 6 kata kunci, Bab I–III
  7.189 kata, 14 tabel, 3 gambar, 17 pustaka + 17 peraturan, surat pernyataan Lampiran III) dan
  `Draf Kasar SIGAP-SIPDLN untuk Dedi.docx/.pdf` (4 hlm).
- Builder: `C:\Users\rivsy\dev\kemlu\kti-sigap-sipdln\` (docx-js + `figures.py` matplotlib + `render.ps1`
  Word COM + `verify.py` 16 cek + `verify-dedi.py` 7 cek). README di sana. Tanpa git.
- Logo Kemlu sampul dipotong dari pindaian nota dinas Permenlu 2/2026 hlm 1 (300 dpi) → `assets/logo-kemlu.png`.

## Keputusan isi (bisa dibalik Aldo)

- Bentuk **makalah** (Pasal 11 b + Pasal 13: ≥10 hlm/2.500 kata; disahkan JPT Pratama + perpustakaan),
  bukan buku (≥39 hlm batang tubuh). Metode DSRM (Peffers 2007) + evaluasi artifisial FEDS (Venable 2016).
- Benang merah: pengendalian melekat = 8 dari 11 kegiatan pengendalian PP 60/2008 Pasal 18(3) (c,e,f,g,h,i,j,k).
- **Jujur soal kematangan:** manfaat waktu/kepuasan belum diukur; kondisi PDLN "sebelum" = asumsi kerja;
  SIGAP: 10/16 aturan penuh, rekonsiliasi SAKTI simulasi, peran di sesi. Rekomendasi: uji coba 1 triwulan
  dengan indikator spesifikasi 01 §7 + DeLone-McLean.
- **Pengungkapan AI:** Metode menyebut Claude Code membantu pengembangan DAN penulisan naskah; tanggung jawab
  isi tetap pada penulis. Surat pernyataan Lampiran III butir b ("murni gagasan ... saya sendiri") — Aldo
  yang memutuskan.
- Angka riil yang dikutip hanya agregat Wasdit 27 Sep: 131 MAK, pagu Rp360,05 M, 830 permintaan, 46 alokasi,
  34 SPP, 5 KKP, 5 kontrak, 61 lembar. Tanpa nama/rekening/tautan.
- Konkurensi ditulis hati-hati: di SQLite `lockForUpdate` tak menghasilkan SQL (SQLite kunci level berkas),
  JANGAN klaim "SQLite meloloskan dua komitmen" — tak pernah diuji. Yang terbukti: PostgreSQL 17, 3 ronde,
  tepat 1 dari 2 lolos.
- Daftar pustaka: 9 DOI dicek hidup lewat `doi.org/api/handles` (semua valid); LN PP 60/2008 No.127,
  PP 71/2019 No.185, UU 27/2022 No.196, UU 1/2004 No.5, Perpres 82/2023 LN No.159, Perpres 95/2018 LN No.182
  dicek live.

## Draf untuk Dedi — ASUMSI

Dedi di vault = pembuat kit aldo-starter (`galohot`), org Neon "M. Dedi" = pihak ketiga. Maka draf dibuat
**netral**: tanpa nama kementerian, tanpa angka anggaran riil (keputusan Aldo 29 Sep "samarkan identitas
Kemlu"), isi ringkasan/masalah/fitur/arsitektur/bukti mutu/celah/langkah + bagian "cara memakai" (tinjauan
teknis ATAU bahan KTI sendiri dengan rambu plagiasi + 3 sudut alternatif). Kalau Dedi ternyata rekan Kemlu
yang butuh KTI atas namanya: tanyakan perannya di proyek dulu — KTI kedua tidak boleh menyalin naskah ini.

## Terbuka (Aldo)

1. Isi isian kuning: NIP, jabatan terkini, nomor/tanggal surat, nama Kepala BUP, pejabat perpustakaan, meterai.
2. Konfirmasi tafsir PGPNS dan maksud "untuk Dedi".
3. Cek uraian proses lama (Wasdit, PDLN manual) sesuai pengamatannya sendiri.
4. Opsional: tangkapan layar aplikasi berdata contoh sebagai data dukung (belum, karena perlu login ke app lokal).

Terkait: [[project-sigap-bup]], [[project-sipdln-bup]], [[reference-kti-percepatan-pangkat]], [[reference-office-render]].
