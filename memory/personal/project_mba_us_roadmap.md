---
name: Roadmap MBA AS (Wharton/Columbia) — Aldo sebagai PNS JF Penata Kanselerai
description: "v1.1 10 Okt 2026 (Word+PDF 13 hlm di Riv's Journey\\mba-us-roadmap, builder ~/dev/personal/mba-us-roadmap): utama Agu 2028 (R1 Sep 2027), opsi CBS J-Term Jan 2028; JALUR KRITIS = bahasa Inggris (TOEFL ITP 493, IELTS belum ada); LPDP Tahap 1 2027 bila IELTS ≥6,5, else Tahap 2; usia 29 aman; Wharton/CBS tanpa deferral; OPEN: status LPDP Tahap 2 2026 (SBM ITB–BU) + AIgnited di resume"
metadata:
  type: project
---

Dibuat 4 Okt 2026 (sesi Bara, mesin riv) atas permintaan Aldo: "roadmap strategi S2 MBA di US
(Columbia, UPenn atau setara) untuk saya PNS JF Penata Kanselerai Kemlu". Roadmap lengkap dikirim di
chat. Scope: personal. Data brief BPADAD boleh dipakai di sini (izin Aldo, lihat [[project_wharton_thesis]]).
Detail proyek kemlu/ lain sengaja TIDAK ditarik ke sini.

## Keputusan v1 (rekomendasi, belum disetujui Aldo)

- **Jalur utama:** daftar R1 Sep 2027 → masuk Agu 2028, lulus Mei 2030.
- **Opsi cepat:** CBS J-Term Jan 2028. Lamanya 16 bln dan tanpa magang musim panas, jadi ikatan dinas lebih
  pendek. Tenggat diperkirakan pertengahan Jun / pertengahan Agu 2027 (pola 2025–2026). Putuskan di gerbang G2 (Jun 2027).
- **Agu 2027 (R2 5 Jan 2027):** hanya kalau skor GMAT/GRE sudah ada sebelum ±15 Des 2026. Hampir pasti terlalu mepet.
- **Urutan dana (diperbarui v1.1):** LPDP Tahap 1 2027 tanpa LoA HANYA bila IELTS ≥6,5 sebelum pertengahan Feb 2027; selain itu Tahap 2 2027. Pilih 3 MBA (mis. UPenn, Columbia, Harvard). Status CPB punya
  waktu 18 bln untuk LoA unconditional, cukup untuk J-Term maupun Agu 2028. Cadangan: Tahap 2 2027, lalu Tahap 1 2028 dengan LoA.
- **Cerita:** BPADAD. Pakai hanya angka LK/LBP audited yang publik, jangan kertas kerja internal tanpa izin tertulis.

## v1.1 — 10 Okt 2026: dokumen Word + PDF

Aldo minta "buatkan dalam bentuk word pdf". Hasilnya 13 hlm A4 (sampul + 12), Bahasa Indonesia, register "Anda",
dengan tag [Pasti]/[Kemungkinan besar]/[Dugaan].
- **Builder (mesin riv):** `C:\Users\rivsy\dev\personal\mba-us-roadmap\`. Jalankan `bash make.sh`, urutannya:
  charts.py → build.js (docx-js lewat NODE_PATH ke node_modules wharton-thesis) → render.ps1 (Word COM, SaveAs [ref] 17)
  → verify.py (gerbang 247 cek) → salin ke `C:\Users\rivsy\Downloads\Riv's Journey\mba-us-roadmap\`.
- Angka volatil hanya ada di `facts.json`. Kurs JISDOR 9 Okt 2026 = Rp17.884.
- **Perubahan isi vs v1 (chat 4 Okt):**
  - Jalur kritis kini **bahasa Inggris**, bukan GMAT.
  - Urutan LPDP: Tahap 1 2027 bila IELTS ≥6,5 sebelum pertengahan Feb. Bila tidak, Tahap 2 2027 (pas untuk J-Term).
    Bila tidak juga, Tahap 1 2028 dengan LoA (tanpa sertifikat bahasa).
  - Columbia, Yale SOM, dan MIT Sloan (tanpa tes Inggris) jadi tulang punggung daftar sekolah.
  - Ada lampiran cabang "LPDP Tahap 2 2026 masih berjalan".
  - Gerbang G0–G4: Nov 2026, Feb 2027, Jun 2027, Des 2027, Jun 2028.
  - "Riwayat versi" dihapus dari dokumen supaya halaman terakhir tidak satu baris.
- **Jebakan build:**
  - Entri folder `word/media/` di zip docx-js ikut terhitung sebagai gambar. Saring nama yang berakhiran "/".
  - Daftar isi berbentuk daftar tumpah ke halaman 2. Diganti satu paragraf kecil.
  - Jeda halaman paksa sebelum lampiran menyisakan halaman nyaris kosong. Dibuang, sekarang dijaga gerbang ≥500 karakter per halaman.

## Fakta live (dicek 4 Okt 2026, volatil — cek ulang tiap siklus)

**Wharton** (mba.wharton.upenn.edu):
- Class of 2029: R1 8 Sep 2026 (lewat), R2 5 Jan 2027 (hasil 31 Mar), R3 31 Mar 2027.
- R1 tiga siklus terakhir: 4 Sep 2024 / 3 Sep 2025 / 8 Sep 2026.
- Esai: 50+150 kata (tujuan), 350 kata (kontribusi), opsional 500. **1 rekomendasi.** Wawancara TBD 35 mnt + 1:1 10 mnt. Biaya US$275.
- Tes: GMAT/GRE, **EA tidak diterima**, tanpa waiver. **Tes Inggris wajib** (TOEFL/IELTS/PTE/Duolingo), tanpa skor minimum.
  Rata-rata TOEFL 115 (Class of 2022).
- Class of 2027: GMAT Focus rata-rata 676, GRE 163Q/162V, GPA 3,7, pengalaman 5 th, 26% internasional,
  Nonprofit/Gov 10%.
- COA 2026-27: **US$135.441/th** (tuition 87.970 + fees 5.038 + hidup 42.433).
- Fellowship hanya merit (±1/3 kelas), hanya tuition. Bisa dipotong kalau dana luar + fellowship > tuition.
- **Tanpa deferral** untuk alasan dana.
- Lauder Global: OPI Superior bahasa ibu (Indonesia bisa via LTI), mulai Mei, khusus R1/R2.
- Dual degree: HKS / SAIS 3 th.

**Columbia** (academics.business.columbia.edu):
- Early Decision DIHAPUS. Agu 2027: R1 9 Sep 2026 (lewat), R2 5 Jan 2027 (hasil 24 Mar), R3 29 Mar 2027.
- Deposit: R1 US$6.000+1.000, R2 2.000+1.000, J-Term 2.000+1.000.
- J-Term Jan 2027 sudah tutup.
- Esai: 500 kata (tujuan + dream job), 250 kata (tim), 250 kata (co-create CBS). **1 rekomendasi.** Biaya US$250.
- Tes: GMAT/GRE/**EA**, tanpa waiver. **Tes Inggris TIDAK wajib.**
- Masuk 2025: GMAT Focus rata-rata 690, 41% internasional, Gov/militer 4% + nonprofit 3%.
- COA thn-1 2026-27: **US$143.030**. J-Term 8 bln pertama US$136.104.
- Bantuan merit + need-based (internasional boleh). Formulir need-based jatuh tempo 2 minggu setelah undangan wawancara.
- **Tanpa deferral.**
- Dual MBA/MIA SIPA 3 th. Jalur Sabtu EMBA-NY sudah ditutup.

**LPDP 2026** (Panduan STEM Industri Strategis 22 Jan 2026; Pedoman Umum Des 2025; Panduan Pencairan 10 Jan 2026):
- Syarat PNS:
  - Daftar lewat kriteria CPNS/PNS di STEM Industri Strategis (MBA = bidang pendukung). Jalur kewirausahaan TERTUTUP untuk PNS.
  - Usia S2 ≤**37** per 31 Des tahun daftar. JF PK tidak termasuk pengecualian 42.
  - Surat usulan dari pejabat ≥eselon II pembina SDM (nama + NIP). Setelah lulus, wajib Surat Tugas Belajar.
  - IPK ≥3,00.
- Bahasa: IELTS 6,5 / iBT 80 / PTE 58. Sejak Tahap 2 2026, LoA unconditional menggantikan sertifikat dan Duolingo ditambahkan.
- Seleksi:
  - Tahapan: Administrasi → SBS (dilewati kalau sudah punya LoA unconditional) → wawancara substansi.
  - Esai komitmen/kontribusi 1.500–2.000 kata, diutamakan industri strategis: pangan, energi, pertahanan,
    digitalisasi, kesehatan, hilirisasi, maritim, manufaktur & material maju. Ada juga surat rekomendasi.
- Jadwal 2026:
  - Tahap 1: daftar 22 Jan–23 Feb, hasil 22 Jun, studi mulai Jul.
  - Tahap 2: daftar 30 Jun–31 Jul, hasil 30 Nov, studi mulai Jan.
  - Tahap 1 2027 BELUM diumumkan.
- Aturan CPB:
  - Pilih 3 PT saat daftar tanpa LoA. Ganti PT hanya 1 kali, dengan surat eselon II.
  - CPB → awardee maksimal 18 bln.
- Dana:
  - Tuition penuh.
  - Biaya hidup per bulan: NYC US$2.600, Philadelphia US$2.200, Boston/Stanford US$2.600, Chicago/Evanston US$2.200.
  - Settlement 2×, asuransi, visa, tiket, buku Rp10 jt/th.
  - **Tanpa tunjangan keluarga untuk S2.** Maksimal 24 bln.
  - Co-funding: potongan tuition dari kampus boleh, dana ganda dilarang.
- Kewajiban: kontribusi **2n** (berubah dari 2n+1 Des 2025, sedang ditinjau). PNS yang ditempatkan di Perwakilan dihitung pengecualian.
- Daftar PT LN: MBA ada untuk Harvard, Stanford, UPenn, Columbia, MIT, Northwestern, Yale, Berkeley, Duke,
  Michigan, Cornell, Georgetown. NYU hanya varian supply chain. Chicago hanya "Business".
  **Tuck, UCLA, Darden tidak ada.**
- Akselerasi Unggulan (usia ≤35, LoA wajib): Harvard/Stanford/MIT semua bidang. Columbia/UPenn hanya STEM.

**Fulbright (AMINEF):** MBA boleh (wajib GMAT), tanpa batas usia. Tenggat 15 Feb tiap tahun, jadi masuk 2028 = daftar
15 Feb 2027. Hanya ±20 penerima S2 nasional (2026). Visa J-1.

**Aturan PNS** (SE MenPANRB 28/2021 masih berlaku; PP 11/2017 jo 17/2020 karena PP Manajemen ASN belum terbit):
- Syarat tugas belajar:
  - Masa kerja ≥1 th. Sisa masa kerja sampai BUP ≥3× lama studi.
  - Kinerja ≥baik selama 2 th. Program sesuai rencana kebutuhan instansi.
  - SK dari PPK. Izin PDLN Setneg.
- Ikatan dinas **2n** kalau diberhentikan dari jabatan (MBA 2 th = 4 th). Tidak bisa resign selama ikatan
  (PP 11/2017 Ps 238(3)(b)). Langgar = ganti biaya.
- Tukin selama TB (Permenlu 3/2025 Ps 7): JF keahlian dapat tukin **kelas pelaksana tertinggi**. Turun ke 50%/25% di perpanjangan.
- JF diberhentikan kalau TB >6 bln. Setelah kembali, diangkat lagi di jenjang terakhir (PermenPANRB 1/2023 Ps 41; Permenlu 4/2024 Ps 45, 59–61).
  Wajib lapor ≤15 hari kerja setelah selesai.
- **MBA linier untuk JF PK** (Permenlu 4/2024 Ps 23(1)(d)). Pencantuman gelar lewat SIASN (SE BKN 15/2024) memberi +25% AK
  sekali. Penyetaraan ijazah lewat piln.kemdiktisaintek.go.id.
- Usaha swasta:
  - PP 6/1974 DICABUT PP 94/2021, tidak ada izin wajib.
  - Batasnya: jam kerja (Ps 4 f), larangan kerja untuk perusahaan asing tanpa penugasan PPK (Ps 5 e), dan konflik kepentingan.

**Admit rate & peer** (US News, masuk fall 2025, via Poets&Quants 2 Agu 2026):
- Admit rate: Wharton 18,6%, CBS 25,7%, HBS 11,2%, GSB 6,8%, Sloan 18,8%, Yale 28,5%, Kellogg 28,1%, Booth 27,3%, Haas 21,4%, Georgetown 64,4%.
- R2 Jan 2027 peer: HBS 5 Jan, GSB 6 Jan, Kellogg 6 Jan, Yale 6 Jan, Georgetown 6 Jan, Booth 7 Jan, Haas 7 Jan, Sloan 12 Jan. HBS & Sloan tanpa R3.
- Tes Inggris:
  - Tidak wajib di Yale SOM & Sloan.
  - HBS "discouraged" di bawah TOEFL 109 / IELTS 7,5.
  - GSB TOEFL 100 (5,0) / IELTS 7,0.
- COA 2026-27: HBS US$130.318, GSB 140.940, Yale 128.976, Sloan ±134.200.
- Need-based HBS/GSB dipotong kalau dana luar > ±US$40 rb. GSB: penerima sponsor "typically" tidak eligible. Jadi dengan LPDP, need-based tidak relevan.
- Knight-Hennessy: syarat S1 lulus ≥Jan 2020 (kohort 2027) dan wajib GSB R1.
- Jalur mid-career:
  - MIT Sloan Fellows MBA: pengalaman ≥10 th, 12 bln, tes opsional, tanpa tes Inggris, tenggat 20 Okt 2026 / 26 Jan 2027.
  - Stanford MSx: ≥8 th, 12 bln mulai Jul, tenggat 6 Jan / 11 Feb 2027, ada di daftar LPDP.

**Visa & kebijakan AS (4 Okt 2026):**
- Biaya: SEVIS F US$350 / J US$220, visa US$185. Visa integrity fee US$250 sudah jadi UU tapi belum ada aturan pelaksana.
- Wawancara wajib tatap muka di negara asal. Akun medsos wajib publik sejak Jun 2025. Indonesia TIDAK ada di daftar larangan masuk 39 negara.
- Aturan D/S final 17 Jul 2026 tapi ditunda pengadilan 14 Sep (DHS banding 30 Sep).
- CPT dipersempit Agu 2026 (Penn sempat jeda). Tidak relevan untuk J-Term/PNS.
- Pendanaan pemerintah pada J-1 memicu 212(e). Tidak masalah untuk PNS yang memang wajib pulang.
- Pasar: niat calon internasional mendaftar ke AS turun 63%→53% (GMAC 2026), aplikasi Sloan -25%. Persaingan sedikit melunak [Likely].

**Kurs:** JISDOR Rp17.898/USD (2 Okt 2026). COA US$135–143 rb/th ≈ Rp2,4–2,6 M/th.

**Lain:** GMAT Focus US$275 di test center / US$300 online, 5×/12 bln, jeda 16 hari, tanpa batas seumur hidup.
TOEFL iBT skala 1–6 sejak 21 Jan 2026, skor 0–120 ikut dilaporkan selama transisi 2 tahun.
EducationUSA gratis di Jakarta (Kedubes AS + @america).

## ⚠ OPEN (butuh Aldo)

- ⚠ OPEN (10 Okt): **status LPDP Tahap 2 2026** (double degree SBM ITB–Boston Univ.; surat usulan Kemlu sudah
  diteken Jul 2026; tracker 1 Agu: IELTS & LoA belum). Kalau masih jalan, wawancara 14 Okt–20 Nov 2026. Jebakan:
  S2 LPDP hanya sekali + pindah PT dalam→luar negeri hanya untuk Papua/afirmasi (Pedoman Umum 9.1).
- ⚠ OPEN: jenjang JF PK (tidak dicek; tidak mengubah rencana).
- SELESAI 10 Okt, dari tracker LPDP + resume di `C:\Users\rivsy\Downloads\Riv's Journey\` (mesin riv):
  - Usia 29 (lahir Okt 1996). Aman untuk LPDP PNS sampai tahun daftar 2033.
  - S1 Akuntansi Unsoed 2015–2019, IPK 3,60 (non-Inggris).
  - IB Analyst Okt 2021–Apr 2022, pemerintah sejak Mei 2022. Jeda Agu 2019–Okt 2021 kosong di resume.
  - TOEFL ITP 493 (tidak berlaku LN). IELTS/GMAT belum ada.
  - Knight-Hennessy tidak eligible (S1 lulus 2019). MSx/Sloan Fellows tidak eligible (pengalaman <8/10 th).
- ⚠ OPEN: apakah Kemlu punya seleksi TB internal + siapa eselon II penanda tangan surat usulan LPDP? Jadwal penempatan ke Perwakilan?
- ⚠ OPEN: peran & status formal AIgnited terhadap aturan PNS (jam kerja, konflik kepentingan, entitas asing?).
  Esai MBA/LPDP harus konsisten dengan ikatan dinas.
- ⚠ OPEN: tanggal nikah & apakah pasangan ikut (F-2 tidak boleh kerja, LPDP S2 tanpa tunjangan keluarga).
  Lihat [[project_rab_pernikahan]].
- ⚠ OPEN: pilih J-Term vs Agu 2028 (gerbang G2, Jun 2027).
- ⚠ OPEN: "CEO & Co-Founder Aignited.id (Mei 2025–kini)" tertulis di resume, bersamaan dengan status PNS. Dokumen
  menyarankan kejelasan tertulis (atasan/Biro SDM/Inspektorat) sebelum CV dipakai ke LPDP/Kemlu/kampus.
- ⚠ OPEN: izin tertulis Kemlu untuk mengutip kertas kerja internal (sama dengan OPEN di [[project_wharton_thesis]]).

Terkait: [[project_wharton_thesis]], [[project_landlord_that_rents]], [[project_rab_pernikahan]].
