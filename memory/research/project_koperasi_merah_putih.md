---
name: project-koperasi-merah-putih
description: "Kajian kebijakan Bahasa Indonesia 36 hlm 'Too Big to Fail' tentang Koperasi Desa/Kelurahan Merah Putih, di Downloads\\Research Reports\\Koperasi-Merah-Putih"
metadata: 
  node_type: memory
  type: project
  originSessionId: 442198e7-41cd-48b8-9da8-ca7988158a76
  modified: 2026-08-15T14:47:50.396Z
---

Kajian kebijakan independen **"Too Big to Fail — Terlalu Besar untuk Gagal: Koperasi
Desa/Kelurahan Merah Putih sebagai kewajiban kontinjen negara"**, 36 hlm A4, dibangun
31 Juli 2026 (PDF + DOCX + sumber HTML/CSS/matplotlib penuh).

**Judul utama berbahasa Inggris, isi berbahasa Indonesia** — Aldo minta ini pada 1 Agustus
2026; judul Indonesia tetap tampil sebagai baris kedua di sampul, dan running header kanan
memakai "Too Big to Fail".

**Lokasi berubah:** pada 1 Agustus 2026 Aldo merapikan `Downloads\DEI` menjadi
`Downloads\Research Reports\<Nama Proyek>`, dengan berkas sumber mentah dipindah ke
subfolder `sources/` tiap proyek. Semua brief lain (China Outlook, Indonesia Outlook,
Lestari Advisors, The Price of Proof) ikut pindah ke sana.

**Rerun v2 (2 Agustus 2026):** riset yang sama dibangun ulang penuh dalam **bahasa
Inggris** dengan master prompt v2 di folder terpisah `Research Reports\Too-Big-to-Fail\`
(sources/src/out). Kerangka berganti nama jadi **"the Firebreak Agenda"** (pilihan Aldo
dari tiga kandidat), byline Ignited Research, 34 hlm, PDF only. Pola v2 yang Aldo pakai
sekarang: Phase 0 scope memo sebagai satu-satunya checkpoint, content.py sebagai sumber
tunggal semua angka, verify.py sebagai gerbang keras sebelum Chrome render (menangkap
angka prosa vs model, akronim, rujukan silang, chart basi), disclaimer §5a verbatim,
dan falsifiable calls berdatar-ambang di bagian "What Would Change Our View". Kedua
versi (ID v1, EN v2) berbagi evidence register yang sama.

**English only sejak 3 Sep 2026:** Aldo minta edisi Indonesia tidak dibawakan lagi
(lihat [[feedback-english-only-briefs]]). Sumber `*_id.html` dan mesin dwibahasa tetap
disimpan, tetapi `make.ps1 all` kini hanya membangun PDF Inggris + deck; `make.ps1 id`
tinggal sebagai opt-in eksplisit. Deliverable: EN 36 hlm + deck 32 slide.

**Edisi kedua — batas data 3 September 2026 (dibangun 3 Sep 2026):** Aldo minta cutoff
dimutakhirkan; itu berarti melaporkan ulang, bukan mengganti tanggal. Lima minggu
perkembangan mengubah dua temuan inti:

1. **Call "Recognition" (16 Agu 2026) SELESAI.** Nota Keuangan/RUU APBN 2027 menyatakan
   Dana Desa membiayai pembangunan fisik **dan** angsuran pokok + bunga/margin/bagi hasil,
   menaksir kewajiban ~Rp40 t/tahun × 6 tahun = **Rp240 triliun** — jarak 0,1% dari model
   independen kajian ini (Rp240,2 t). Dana Desa 2027 naik 39,3% jadi **Rp77 t**, Rp51 t
   (66%) untuk koperasi, sisa **Rp25 t** untuk semua keperluan desa lain. RUU-nya
   memindahbukukan langsung dari RKUN ke rekening bank pemberi pinjaman. Pengakuan terjadi,
   tetapi sebagai alokasi pos transfer, bukan jadwal kewajiban kontinjen.
2. **Transaksi Simkopdes tiga kali lipat**: Rp62,1 mi (akhir Jul) → Rp179,72 mi (9 Agu) →
   **Rp205 mi (22 Agu)**. Perputaran naik 0,13% → **0,41%**; laju setahunan ~Rp2,1 t,
   mendekati ambang falsifikasi Rp5 t. Dilaporkan sebagai hal yang melawan tesis sendiri.
3. **Erosi target berlanjut**: 14 Agu Menko Pangan geser 35.000 ke September; 17 Agu Menkop
   sebut 10.000. Enam revisi, 60.000 → 10.000.

Hasil: EN 36 hlm, ID 38 hlm, deck 32 slide (+slide "the obligation is recognised").
**Jebakan yang tertangkap:** menambah satu tabel di Bagian 2.4 menggeser SELURUH nomor tabel
dan rujukan silang sesudahnya (+1) serta penomoran subbab 2.4→2.5 — audit ulang wajib.
Skrip patch prosa harus idempoten; menjalankan ulang menyisipkan paragraf dua kali.

**Identitas penerbit — KANONIK (dikonfirmasi Aldo 2 Agu 2026):**
byline **Rivaldo Harviansyah**, penerbit **Ignited Research · Independent Analysis**
(independent; non-partisan). *Analysis*, bukan *Research* — Aldo sempat menulis
"Independent Research" lalu mengoreksinya ke "Independent Analysis".

**Edisi dwibahasa (2 Agu 2026):** `Too-Big-to-Fail\` kini menghasilkan dua PDF dari satu
sumber kebenaran — `out\Too-Big-to-Fail.pdf` (EN, 34 hlm) dan `out\Too-Big-to-Fail-ID.pdf`
(ID, 36 hlm). Aturan Aldo untuk versi Indonesia: **judul "Too Big to Fail" dan nama
kerangka tidak diterjemahkan**, dan istilah teknis tetap dalam bentuk Inggris bila itu
yang lebih lazim (*drawdown*, *debt service*, *outlook*, *stress test*, *grace period*,
NPL), dimiringkan pada penggunaan pertama.

Mekanismenya: `content.py` menyimpan pasangan `FMT`/`FMT_ID` (koma desimal, "Rp57,0
triliun"), `MUST_APPEAR_ID`, `ACRONYMS_ID`, dan tabel label `L["en"]/L["id"]` untuk grafik.
Seluruh skrip menerima argumen bahasa: `charts.py id` → `charts_id\`, `build.py id` →
`build_id.html` + `styles_id.css` (header @page tidak bisa diganti lewat class),
`verify.py id`, `stamp.py id`, dan `make.ps1 all` membangun keduanya.

**Dua jebakan yang tertangkap saat membangun edisi ID:** (1) regex inline SVG di build.py
hanya cocok `../charts/` sehingga figur ID tetap jadi `<img>` — build 136 KB bukan 357 KB;
verify.py sekarang menggagalkan build bila ada `<img src=...svg>` tersisa. (2) Heredoc bash
menulis `\x00` harfiah ke charts.py → "source code cannot contain null bytes"; pakai berkas
patch Python, jangan heredoc, untuk edit yang memuat escape.

**Deck (1 Sep 2026):** `out\Too-Big-to-Fail-Deck.pptx` — 31 slide 16:9, dibangun
`deck_charts.py` (14 figur berskala slide; figur brief bertipe 7-8pt terlalu kecil
diproyeksikan) + `deck.py` (python-pptx) + `verify_deck.py` sebagai gerbang. Target baru:
`make.ps1 deck`, dan `all` kini membangun dua PDF + deck.

Gerbang deck memeriksa hal yang tidak diperiksa gerbang PDF: **setiap nilai "Rp...tn" di
slide harus dapat ditelusuri ke content.py** (menangkap angka yang diketik tangan), figur
lebih baru daripada content.py, kelima falsifiable call beserta tanggalnya, dan **tidak ada
shape yang melewati batas slide**. Ketiganya menangkap cacat nyata pada build pertama.

**Dua jebakan deck:** (1) `pic()` dengan lebar tetap membuat figur berlegenda meluber ke
luar slide — ganti dengan fit-to-box yang membaca dimensi piksel PNG. (2) python-pptx
**tidak punya** `fill.transparency`; menyetelnya diam-diam diterima Python dan menghasilkan
scrim opak yang menutupi foto sampul.

Identitas rumah harus muncul identik di **lima permukaan**: kicker sampul, footer sampul,
sebutan pertama pada disclaimer, catatan penutup, dan metadata PDF. Konvensi metadata:
`author` = nama orang saja, `creator` = baris penerbit. `PUBLISHER_LINE` di content.py
adalah satu-satunya titik ubah untuk teks HTML; kicker/footer sampul digambar terpisah
di `stamp.py` (PDF) dan `cover_art.py` (DOCX) sehingga **tiga berkas** harus diubah
bersamaan. verify.py menjaga kehadiran baris identitas + byline + frasa
"independent; non-partisan" lewat MUST_APPEAR.

**Beda dari brief sebelumnya:** ini yang pertama **berbahasa Indonesia** dan yang pertama
berbyline **nama Aldo sendiri (Rivaldo Harviansyah)**, bukan [[project-indonesia-outlook-brief]]
atau [[project-china-outlook-brief]] yang memakai "Ignited Research". Pembaca sasaran yang
dia pilih: otoritas fiskal & keuangan (Kemenkeu, BI, OJK, LPS, dewan Himbara) — bukan
pemilik program, bukan investor.

**Tesis yang dia setujui:** PMK 15/2026 (5 April 2026) memindahkan pembayaran angsuran
80.081 koperasi dari koperasi ke negara lewat pemotongan DAU/DBH/Dana Desa, sementara aset
menjadi milik pemda. Jadi "gagal bayar" bukan lagi kategori yang berlaku — argumennya
tentang **penguncian**, bukan tentang ledakan. Kerangka rekomendasinya "Empat Sekat"
(Fiskal, Prudensial, Operasional, Transparansi) sengaja tidak menuntut pembatalan program.

**Pilihan metodologis yang perlu dipertahankan bila diperbarui:** tidak ada data primer,
dan itu dinyatakan di Catatan Ruang Lingkup. Model Bagian VI deterministik (anuitas 5 thn
@6% = 0,237396; faktor layanan total 1,24698 × pokok) dengan parameter terbuka di Tabel 6
dan tabel sensitivitas penuh, supaya pembaca skeptis bisa mengganti asumsi sendiri.
Angka OJK Rp148,6 t diperlakukan sebagai **komitmen, bukan penarikan**, karena tidak
terekonsiliasi dengan realitas fisik — pertentangan ini ditampilkan, bukan dirapikan.

**Pola kerja Aldo yang terkonfirmasi lagi di sini:** dia mau pertentangan antar-sumber
disurfacing, bagian "apa yang akan membantah analisis ini" yang eksplisit, dan tabel klaim
berbukti-tipis yang mengaku sendiri mana yang lemah. `src/verification.md` mencatat tiap
angka + 8 koreksi selama penyusunan.

**Catatan build tambahan** (di luar pipeline [[project-indonesia-outlook-brief]]): sampul
digenerate penuh oleh `cover_art.py` — kisi titik yang proporsinya diambil dari data
program, tanpa foto pihak ketiga. Diagram kotak matplotlib **wajib** `fig.subplots_adjust(0,0,1,1)`;
dengan margin subplot bawaan tinggi satu unit data menyusut ~23% dan teks meluber keluar
kotaknya. Setelah menambah/menghapus figur atau tabel, audit ulang seluruh rujukan silang —
nomor caption digenerate CSS counter, jadi rujukan di prosa tidak ikut bergeser sendiri.
