---
name: project-tesis-erna
description: "Tesis Erna Diana (S2 Akuntansi STIESIA) soal hedging/kurs/fleksibilitas anggaran Perwakilan RI: deck + naskah ujian proposal (23 Sep 2026), lalu masukan 3 dosen + cek daftar pustaka (1 Okt 2026)"
metadata:
  type: project
  modified: 2026-10-01
---

Tesis Erna Diana (NPM 25.6.05.45.0949, S2 Akuntansi STIESIA Surabaya, pembimbing Prof. Wahidahwati).
Judul: pengaruh kebijakan internal hedging, fluktuasi nilai tukar, dan fleksibilitas alokasi anggaran
terhadap efisiensi belanja operasional Perwakilan RI. Regresi linier berganda, 3 X + 1 Y, 28 item Likert.

File: sejak 1 Okt 2026 semua berkas tesis ada di `C:\Users\rivsy\Downloads\Thesis Teh Erna\` (mesin ini),
termasuk scan masukan dosen `Image23092026165625_001.pdf`. Path `Downloads\...` di bawah adalah lokasi lama.
File (versi 23 Sep 2026):
- `Ujian Proposal Tesis Erna signed.pdf` — 67 hlm, kata pengantar bertanggal 3 Sep 2026.
- `Presentasi_Thesis_Perwakilan_RI.pptx` — 29 slide, dengan speaker notes.

**Agency Theory: DIPAKAI.** Subbab 2.1.1 (hlm 22–26), disebut lagi di 2.2 (hlm 38), dan jadi sumber
indikator EBO (hlm 49, "Mardiasmo (2018) dan Jensen & Meckling (1976)"). Deck slide 19–20 sudah sesuai.
Kelemahannya: tidak dipakai di pengembangan hipotesis 2.3.1–2.3.3, tidak ada di Bab 1. H1 justru
memakai "Risk Management Theory", yang tidak ada di empat teori Bab 2. Fluktuasi kurs itu faktor
eksternal, jadi menyebutnya "residual loss" rawan disanggah penguji.

Cacat di PDF yang ditemukan (bukan di deck):
- Hlm 57 uji t: sisa copy-paste tesis lain ("harga, promosi, kualitas produk ... erigo store").
- Hlm 55 multikolinearitas: kriteria tolerance terbalik.
- Hlm 11: "terapresiasi 5,69%" (seharusnya depresiasi); "USD 100.000 membengkak menjadi Rp135.500.000"
  (itu selisih di kurs puncak 16.355, bukan total). Deck slide 7 memakai rata-rata: selisih Rp85,4 juta.
- Hlm 9 vs Tabel 1: asumsi kurs 2025 Rp16.000 vs Rp15.400; "sempat mencapai Rp16.640" tapi rata-rata 2025
  di Tabel 1 Rp16.862.
- Deviasi 2026 = 7,87%, bukan 7,86%.
- Dikutip tapi tidak ada di daftar pustaka: Ghozali 2013/2018, Green 1991, Streiner 2010, Modigliani &
  Miller 1958. Ada di pustaka tapi tidak dikutip: Hair 2021, Greer 2023, Miksalmina 2015.

Deck: slide 21 menulis EBO "diukur dari rasio output/input". Ini keliru, karena EBO diukur dengan 7 item
persepsi Likert.

**Keputusan Aldo (23 Sep 2026):** Agency Theory di proposal hanya menjelaskan tanggung jawab pengelola
APBN kepada rakyat, bukan dasar hipotesis. Karena itu teori ini TIDAK ditampilkan di deck.
Hasilnya ada di `Presentasi_Thesis_Perwakilan_RI_v2.pptx`. File asli tidak diubah.
- Slide 19: empat kartu jadi tiga kolom "Tiga Landasan Teori", memakai grid yang sama dengan slide 28.
- Slide 20: baris Agency dihapus, sisa baris digeser ke atas.
- Slide 2 dan 18: "Empat" jadi "Tiga".
- Notes slide 19: berisi jawaban siap pakai kalau penguji menanyakan Agency Theory. Notes slide 20: "Ketiga teori".

- Slide 21: keterangan EBO sekarang "dikonsepkan sebagai rasio output terhadap input anggaran
  (Mardiasmo, 2018); diukur dengan 7 item kuesioner skala Likert 1–5". Kotak navy ditinggikan sedikit.

**Penelitian terdahulu (23 Sep 2026):** Aldo mengganti nama v2 menjadi
`Presentasi_Thesis_Perwakilan_RI_Revisi.pptx` dan menghapus file asli. Ada 2 slide baru setelah Sintesis Teori,
jadi total sekarang 31 slide:
- Slide 21 "Penelitian Terdahulu yang Relevan": tabel empat studi.
- Slide 22 "Perbandingan dengan Penelitian Terdahulu": matriks 7 aspek × 5 kolom, kolom "Penelitian ini" berlatar navy.
Agenda slide 2 dan subjudul slide 18 ikut ditambah "penelitian terdahulu". Notes untuk kedua slide baru sudah diisi.
Empat studinya:
- Allayannis & Ofek (2001), JIMF. File di Downloads adalah working paper 1997 hasil scan tanpa text layer.
- Wang, Hao & Sun (2024), Pacific-Basin Finance Journal 88. File di Downloads adalah preprint SSRN 4429126.
- Christanto & Wijayanti (2023), Owner 7(4): PNBP layanan konsuler di 5 Perwakilan RI, kualitatif.
- Putri & Harahap (2024), Owner 8(3): pengendalian internal pelaporan keuangan di SAKTI Kemenlu, kualitatif.
Tiga studi terakhir BELUM ada di Daftar Pustaka proposal. Proposal juga belum punya subbab Penelitian Terdahulu.
Jebakan teknis: notes master deck ini tidak punya placeholder isi, jadi python-pptx tidak bisa membuat notes baru.
Notes harus dibuat dengan menyalin notesSlide lewat XML.

**Naskah (23 Sep 2026):** `Downloads\Naskah_Presentasi_Ujian_Proposal_Erna.docx`, 12 halaman, 1.731 kata,
sekitar 16 menit dengan kecepatan 120 kata per menit. Satu bagian per slide (31 slide), dengan waktu kumulatif.
Lampiran A berisi 8 antisipasi pertanyaan penguji. Lampiran B berisi 8 pertanyaan tersulit, masing-masing dengan alasan mengapa sulit, jawaban, dan hal yang perlu dilengkapi. Lampiran C berisi 9 perbaikan proposal. Total 16 halaman.
**Temuan paling berat (Lampiran B no. 1):** item kuesioner FNT5, FNT7, FAA6, dan KIH7 menyebut efisiensi atau pemborosan. Artinya, item variabel bebas memuat variabel terikat. Keempat item ini wajib dirumuskan ulang sebelum kuesioner disebar.
Titik lemah lain: model hanya pengaruh langsung, padahal konsep fit dalam Contingency Theory menyiratkan moderasi (hlm. 37 juga memakai bahasa moderasi). Belum ada pembahasan common method bias. Angka 265 tidak cocok dengan 2 × 132 = 264. Kriteria uji t belum memeriksa arah koefisien.
Jebakan: `validate.py` gagal pada docProps/core.xml karena tidak bisa mengambil dc.xsd dari internet. Itu masalah jaringan, bukan cacat dokumen.
Dibangun dengan docx-js (npm lokal di scratchpad) dan dirender lewat Word COM (`ExportAsFixedFormat`) lalu PyMuPDF.

**Masukan ujian proposal (ujian 23 Sep 2026; ditranskripsi 1 Okt 2026, hanya di chat, tidak ada file).**
Scan = 3 lembar "Perbaikan Proposal Tesis", satu per dosen, tulisan tangan. Nomor halaman cetak = nomor halaman PDF.
- Wahidahwati (pembimbing): (1) aspek penulisan sesuai buku pedoman; (2) daftar pustaka diteliti lagi;
  (3) semua masukan penguji direvisi.
- Lilis Ardini (penguji 1): (1) judul di sampul "jangan terpisah": baris "REPUBLIK INDONESIA DI LUAR NEGERI"
  jadi paragraf sendiri (jarak 32 pt vs 24 pt); (2) hlm 12 Tabel 1 ikuti format buku pedoman (grid penuh +
  arsir abu-abu, tanpa baris Sumber); (3) hlm 24, 25, 28 "Border hilangkan semua": PDF tidak punya garis di
  halaman itu; satu-satunya kesamaannya bullet (•), jadi dibaca sebagai bullet (cocok dengan Ikhsan). Bullet
  juga ada di hlm 26, 32, 33, 61; (4) Gambar 1 hlm 38: label "Variabel independen/dependen" di kotak dihapus;
  (5) Tabel 2 Ringkasan Hipotesis hlm 43 dihapus → Tabel 3–6 jadi 2–5; (6) "Sumber dan Jenis Data" hlm 48
  satu-satunya bagian berspasi 1,5 (lainnya spasi 2), judulnya berspasi huruf; (7) lihat buku pedoman.
- Ikhsan Budi Riharjo (penguji 2): (1) penulisan ikut pedoman STIESIA: urutan penulisan, hindari bullet,
  daftar pustaka; (2) PERTANYAAN: kenapa responden dibagi inti & pelengkap (hlm 47)? dianalisis terpisah?
Buku pedoman tesis STIESIA tidak ada online, tetapi Aldo memberi salinannya 5 Okt 2026 (lihat "Buku Pedoman" di bawah).

**Cek daftar pustaka (1 Okt 2026, Crossref + OpenAlex):**
- **Kemungkinan fiktif:** Lee & Wang (2023) dan Nguyen & Faff (2022). Judulnya tidak ditemukan, dan DOI-nya
  milik artikel lain (jifm.12165 = van Nieuw Amerongen dkk. 2022; irfa.2022.102168 = Wang, Dong & Liu 2022).
  Keduanya dikutip di Bab 1 (termasuk hlm 12).
- Ahrens & Ferry (2021): judul, halaman, DOI salah. Aslinya "...a Foucauldian perspective on the UK
  government's response to COVID-19 for England", AAAJ 34(6) 1332–1344, doi 10.1108/AAAJ-07-2020-4659.
- Greer dkk. (2023): judul tidak ada; JPART 33(4) 688–700 = "Signaling Resilience...". Tidak dikutip.
- Di Francesco (2016): penulis kedua Alford hilang; halaman 232–256. Mamonov dkk. (2024): JBF 168, 107285.
  Pangestuti (2022): hlm 2863–2874. Ross (1973): "Prinsipal's" → "Principal's".
- Miksalmina (2015): tidak ada di Crossref/OpenAlex, belum tentu palsu; tidak dikutip.
- 14 DOI lain cocok. Daftar Tabel/Gambar: semua nomor halaman meleset (Tabel 1 tertulis 6, aslinya 12).

**Checklist revisi (4 Okt 2026):** `Thesis Teh Erna\Checklist_Revisi_Proposal_Tesis_Erna.docx`, 6 hlm A4,
kotak centang Word (content control) per poin. Bagian: A Wahidahwati (W1–W3), B Lilis (L1–L7), C Ikhsan (I1–I2),
D daftar pustaka (D1–D13), E saran jawaban responden inti/pelengkap (disarankan: hapus pembagian), F temuan lain
di luar catatan dosen (F1 erigo store hlm 57, F2 VIF/tolerance, F3 item tumpang tindih Y, F4 hlm 11, F5 kurs 2025),
G cek akhir. Builder docx-js di scratchpad sesi (npm `docx` 9.8.1 dipasang lokal; global tidak ada).
Render Word COM. `creator` kosong di docx-js tetap jadi "Un-named" → core.xml ditambal lewat zipfile.

**Buku Pedoman (5 Okt 2026):** `C:\Users\rivsy\Downloads\Buku Pedoman Tesis S2 New.pdf` (mesin ini), 99 hlm,
terenkripsi AES tapi text layer terbaca PyMuPDF. Halaman buku = halaman PDF − 5; rujuk dengan nomor bagian.
- **Batas revisi proposal: 2 minggu sejak ujian (2.4 butir 4.e.2) → Rabu 7 Okt 2026.** Revisi setelah ujian
  tesis maks 3 bulan; ujian tesis butuh TOEFL ≥ 500, surat bebas plagiasi, 4 eksemplar softcover biru.
- Sistematika proposal (3.1): awal = Halaman Judul (sampul luar & dalam, Lamp 2), Halaman Persetujuan (Lamp 4),
  Daftar Isi. Bab 3 = 3.1 Jenis Penelitian & Gambaran Populasi, 3.2 Teknik Pengambilan Sampel, 3.3 Teknik
  Pengumpulan Data (jenis, sumber, teknik), 3.4 Variabel & DOV, 3.5 Teknik Analisis Data. Akhir = Jadwal
  Penelitian + Daftar Pustaka. 2.1 Tinjauan Teoritis wajib memuat hasil penelitian yang relevan.
- "Urutan penulisan" (5.3 butir 1.d) = BAB 1 → 1.1 → 1.1.1 → 1. → a. → 1) → a). Pointers/bullet dilarang
  (5.9 butir 1.e) — menguatkan tafsiran "border" = bullet.
- Format (5.9): A4, margin atas 4/bawah 3/kiri 4/kanan 3 cm, TNR 12, spasi 2, alinea inden 7 ketukan.
  Nomor halaman proposal (5.1): sampul tanpa nomor, awal romawi tengah bawah, isi angka arab mulai 1 kanan atas.
- Tabel (5.4, Lamp 13): "Tabel n" + judul di atas, tanpa garis tegak, tak boleh terpotong halaman, sumber di
  bawah. Gambar: nomor + judul di bawah.
- Pustaka (Lamp 12, Harvard-APA versi STIESIA): "dan" bukan "&"; > 2 penulis et al. di teks, dilarang et al. di
  daftar; format "Nama, I. dan I. Nama. Tahun. Judul. __Jurnal__ Vol(No): hlm."; contoh tanpa DOI; peraturan wajib
  masuk daftar.
Pelanggaran naskah yang ditemukan: isi mulai hlm 7 dan bernomor tengah bawah, sampul bernomor "i", tidak ada
Halaman Persetujuan dan Jadwal Penelitian, Bab 3 tak sesuai sistematika, Tabel 3–6 terpotong halaman, semua entri
pustaka berformat APA biasa, 11 kutipan memakai "&" (hlm 12, 15, 42, 49, 50, 52).

**Checklist v2 (5 Okt 2026):** `Thesis Teh Erna\Checklist_Revisi_Proposal_Tesis_Erna_v2.docx`, 9 hlm. Kotak
batas waktu 7 Okt di halaman 1. Bagian: A–C catatan dosen (dirujuk ke pasal pedoman), D1–D14 (+ D13 format
pustaka, D14 kutipan "&"/et al.; entri benar ditulis format STIESIA), E saran responden, F1–F5 sistematika,
G1–G8 format Bab 5, H1–H5 temuan lain (= F lama). v1 dibiarkan apa adanya. Builder `build_checklist_v2.js`.

Status: deck dan naskah selesai. Masukan dosen sudah ditranskripsi dan dijadikan checklist v2. Revisi proposal dikerjakan Erna sendiri;
belum ada yang diubah di PDF. Render slide di mesin ini memakai PowerPoint COM (`Slide.Export`).
LibreOffice dan poppler tidak ada; render PDF pakai PyMuPDF (`python` 3.11, bukan `py`).
