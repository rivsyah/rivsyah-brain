---
name: project-pantas-kurs
description: "PANTAS — aplikasi pantau kas UP Perwakilan + selisih kurs + proyeksi kekurangan pagu; SPA statis di ~/dev/kemlu/pantas-kurs → pantas-kurs.test; **v1.1 (11 Okt, 75009b0): BKU saja (tanpa BKT), valuta setempat via konversi PU di BKU, laporan Realisasi Program per MAK + real-time**; sampel kini KBRI Singapura 1 Jan–9 Okt 2026 (Washington diarsip); TAYANG di balik Cloudflare Access https://pantas.rivsyah.dev (OTP hanya rivsyah@gmail.com, tim raspy-dew-c84e), livetest LOLOS; temuan sampel: proyeksi kurang Rp3,6–7,0 M s.d. 31 Des, batas aman Rp14.500–16.000"
metadata:
  type: project
  modified: 2026-10-11
---

**Apa:** permintaan Aldo 27 Sep 2026 — aplikasi monitoring "petty cash" satker Perwakilan Washington DC
dari Excel BKU dan BKT, untuk melihat fluktuasi/kerugian kurs IDR–USD dan memproyeksikan kekurangan
anggaran/pembayaran. "Petty cash" ditafsirkan = Uang Persediaan (UP) dalam US$ (bank + tunai).

**Di mana (mesin riv):** `C:\Users\rivsy\dev\kemlu\pantas-kurs`, disajikan Herd di
`http://pantas-kurs.test/` lewat junction `~/.config/herd/config/valet/Sites/pantas-kurs` (lihat
[[reference_herd_windows]]). Git lokal, branch `master`, **2 commit: `e096019` (v1) → `cf1a60b` (samaran identitas)**, belum ada
remote. Riwayat ditulis ulang 29 Sep atas permintaan Aldo: commit lama `ad74565` (memuat kode kegiatan
6023.EBA dan label rekening kedutaan di tes, "KBRI"/"SIGAP Kemlu" di README/CSS) dibangun ulang tanpa
identitas lalu objeknya dihapus (`reflog expire` + `gc --prune=now`); pindai semua objek git: 0 identitas. `.gitattributes` memaksa LF dan `vendor/** -text` karena
`core.autocrlf=true` di mesin ini akan mengubah pustaka minified saat checkout. `.claude/ai_context/` (GRANDPLAN, STATUS, DECISIONS D1–D6 `proposed`) lokal saja.

**Stack:** SPA statis tanpa build, pola sama dengan SIPAMA/UKPBJ — React 18.3.1 UMD + Babel standalone
7.29.9 + ECharts 5.5.0 + SheetJS 0.20.3 (dari cdn.sheetjs.com, bukan npm 0.18.5 yang rentan), semua
di `vendor/` (jalan offline). Modul UMD murni: `app/format.js`, `parser.js`, `engine.js`, `export.js`;
UI `app/app.jsx`. Enam tampilan: Ringkasan, Kurs JISDOR, Selisih Kurs, Proyeksi, Buku Kas, Data &
Pengaturan. Ekspor .xlsx 8 sheet.

**Data:** `data/sampel/FormulirBKU.xls` + `FormulirBKT.xls` = salinan Downloads, **gitignored** (juga
`*.xls`, `*.xlsx`). Kurs `data/kurs-jisdor.json` (publik, dilacak), diperbarui `tools/update_kurs.py`
(lihat [[reference_bi_jisdor]]). Nama satker/rekening/uraian sampel sengaja tidak ada di file terlacak.

**Temuan data yang mengikat desain:**
- BKU (Formulir 3) hanya US$, tanpa kolom kurs/rupiah. `TGL` = tanggal transaksi (teks), `TGL INSERT`
  0–15 hari sesudahnya. `KET` = rekening (operasional / RPL PNBP / kosong = tunai).
- Kurs SP2D penerimaan UP = **JISDOR observasi ke-2 sebelum TGL** — 8 dari 8 kurs yang tertulis di
  uraian (Rp17.717, Rp17.762) cocok persis.
- BKU sudah memuat sisi kas tunai; BKT (Formulir 4A, 6 baris) hanya dicocokkan, tidak dijumlahkan.
- Kode: MAK `…/akun` (belanja), 825111 UP masuk, 815xxx setoran sisa UP/TUP, 425xxx PNBP, KB kas besi,
  MU mutasi uang, BPJ/BPPR/BBPA titipan.
- Belanja modal tidak rutin (Jul US$1,85 jt) → proyeksi hanya melajukan pegawai + barang.

**Keputusan Aldo (DECISIONS proyek):**
- D11 (29 Sep, menggantikan D7 "asumsi Rp100 M" dari 27 Sep): **Pagu 2026 = Rp500 M**, disimpan di
  `data/sampel/pengaturan.json` (gitignored — angka pagu milik satker, bukan di kode). Berlaku hanya untuk
  BKU sampel tahun 2026; BKU unggahan lain tampil "Pagu 2026 belum diisi". Hasil: realisasi ±Rp176,6–176,8 M
  + kebutuhan ±Rp50,7 M = ±45% pagu; sisa ±Rp272 M; batas aman ±Rp114.200; status pagu Aman. Pertanyaan
  yang masih terbuka: apakah Rp500 M mencakup belanja di luar BKU ini (LS/pusat).
- D12 (29 Sep): **samarkan identitas terkait Kemlu.** `app/samaran.js` dipasang pada data mentah sebelum
  analisis, tolak-semua: uraian → label dari kode akun, kode kegiatan/KRO → `0000.XXX/000.000/0A.000000/<akun>`,
  KEM → BA-n, rekening → jenis, satker → "Satker A", nama file unggahan disembunyikan; kurs SP2D di uraian
  UP dipertahankan. **Bawaan aktif**, sakelar di Data & Pengaturan. Diverifikasi: 0 pola identitas di 6
  halaman dan 0/12.200 sel ekspor (pembanding tanpa samaran 4–12 per halaman, 1.092 sel); angka analisis
  identik. File terlacak dan riwayat git sudah bersih (lihat baris Git di atas).
- D8 kurs pengakuan belanja **dua cara berdampingan**: JISDOR tanggal belanja dan kurs SP2D GUP pengganti
  (penerimaan UP pertama sesudah belanja; 146 belanja US$771,6 rb sesudah 31 Agu belum punya GUP → pakai
  JISDOR). Angka tunggal/status memakai yang terburuk.
- D9 aturan kurs SP2D T-2 tetap (bisa diubah). ~~D10 lokal saja~~ — digantikan D13 (4 Okt, "lanjutkan" = deploy
  demo di balik Cloudflare Access, hanya pemilik); **tayang 11 Okt 2026**, lihat blok DEPLOY di bawah.

**Angka sampel (1 Jan–27 Sep 2026):** rekonsiliasi formulir cocok persis (terima 12.457.275,85; keluar
11.012.136,12; saldo 1.445.139,73). Belanja bersih US$10,06 jt. Beban kurs vs asumsi APBN Rp16.500:
**Rp10,551 M (JISDOR)** / **Rp10,814 M (SP2D GUP)** (angka JISDOR disilang-cek Python sama sampai rupiah).
JISDOR 2026: 16.725 → 17.917 (+7,1%), selalu di atas asumsi (173/173 hari). Laju pegawai+barang US$906
rb/bulan; kebutuhan s.d. 31 Des US$2,83 jt. Uji pagu Rp227,5 M: batas aman 18.006 (JISDOR) vs 17.913
(SP2D GUP, sudah di bawah kurs terakhir).

**Hosting (29 Sep, TERBUKA — menunggu Aldo):** rekomendasi **Cloudflare Pages + Access**, bukan Vercel
(Hobby dilarang untuk kerja klien; Pro + proteksi sandi ±US$40/bulan; Cloudflare US$0, Access ≤50 pengguna),
lihat [[reference_hosting_vercel_cloudflare]]. Syarat: build dari salinan git bersih — `data/sampel/` (BKU
mentah + pagu) TIDAK BOLEH ikut, karena samaran jalan di peramban dan file mentah bisa diunduh; JSX
dikompilasi sekali (buang Babel 3 MB); token Cloudflare ber-izin Pages + `CLOUDFLARE_ACCOUNT_ID` yang benar.
Untuk pemakaian resmi Kemlu: PP 71/2019 Ps 20 (data sektor publik di Indonesia) → perlu Pusdatin.

**Persiapan deploy (29 Sep):** `npm run build` (tools/build.js) membangun `dist/` dari commit git lewat worktree
sementara + daftar izin file; JSX dikompilasi (Babel tidak dikirim), `_headers` CSP tanpa unsafe-eval; hasil
18 file 2,28 MB, diuji dengan CSP: 6 halaman, unggah BKU/BKT, unduh .xlsx (PANTAS_Satker-A…, 0 identitas) OK.
Cloudflare (dicek via API): token aktif, izin Pages 200, **Access 403**, DNS rekaman 403; `CLOUDFLARE_ACCOUNT_ID`
di env.db tetap SALAH (token hanya melihat 1 akun lain) — env.db diisi tangan oleh Aldo; untuk deploy ID bisa
diambil dari token saat itu. Zona `rivsyah.dev` SUDAH ditambahkan (status pending, paket Free); NS Cloudflare
**gracie.ns.cloudflare.com + syeef.ns.cloudflare.com**; DNS lama hanya parkir Hostinger (A 2.57.91.91, tanpa
MX/TXT/DNSSEC) → ganti NS aman. Email izin Access: rivsyah@gmail.com. Menunggu: Aldo ganti NS di Hostinger,
aktifkan Zero Trust Free + tambah izin token (Access Apps/Policies, IdP, DNS Edit), lalu ya untuk deploy.
**Update 29 Sep ~23:05 (sesi SIPDLN):** NS sudah dipasang, zona rivsyah.dev **ACTIVE** — langkah
"ganti NS" di atas selesai; sisanya lihat [[reference-cloudflare-rivsyah-dev]].

**Deploy 4 Okt 2026 — TERTAHAN di langkah Aldo.** Aldo: "lanjutkan project ini" (menempel rencana 29 Sep) →
dibaca sebagai ya untuk deploy **di balik Access**; D10 "lokal saja" sudah digantikan rencana itu. Dicek via API:
**Zero Trust BELUM aktif** (`access.api.error.not_enabled`; `/access/organizations` 403 10000). Yang sudah:
- Proyek Pages **`pantas-kurs` dibuat** (kosong, production branch `master`); `pantas-kurs.pages.dev` → 522
  sampai ada deploy, jadi belum ada isi yang tayang. Token punya Pages Edit (buat proyek 200).
- Domain **`pantas.rivsyah.dev` ditempel** ke proyek, status pending: **API Pages TIDAK membuat CNAME**
  ("CNAME record not set"; dashboard membuatnya otomatis) → token butuh Zone DNS Edit.
- `tools/cloudflare.mjs` (ready/access/dns/gate/deploy/livetest), `npm run deploy`, `tests/render.js` terima
  `HEADERS` (JSON) untuk uji di balik Access. Email izin dari `ACCESS_EMAIL`, ID akun dari `GET /accounts`
  (env.db tetap salah). `gate` menolak deploy bila host pages.dev belum dialihkan ke login Access.
  **Belum di-commit**, bersama package.json, tools/build.js, tools/serve.js, README.
- Tes 21/21; build ulang dari `cf1a60b` 18 file 2,28 MB; wrangler 4.147.0 lewat `npx` (tidak ada global).
Menunggu Aldo: (1) Zero Trust Free di akun "Rivsyah@gmail.com's Account" — onboarding **wajib isi metode
pembayaran walau Free, tidak ditagih** (dok resmi); (2) izin token: Access Apps and Policies Edit, Access
Organizations/IdP/Groups Edit, Access Service Tokens Edit (hanya untuk `livetest`), Zone DNS Edit rivsyah.dev.
Sesudahnya: `access` → `dns` → `gate` → `deploy` → `gate` → `livetest`.
Jebakan uji: unduhan Chrome headless via CDP dibatalkan bila `downloadPath` memakai garis miring maju di
Windows — pakai path `C:\...`.

**Cek 11 Okt 2026 (Aldo: "lanjutkan project PANTAS KURS") — MASIH TERTAHAN di langkah Aldo yang sama.**
- API, baca saja (11 Okt ±00.50 WIB): `zt_apps`/`idp`/`svc_token` 403 *not_enabled*, `org` 403, `dns` 403. Pages
  `pantas-kurs` masih tanpa deployment; `pantas.rivsyah.dev` tetap pending *"CNAME record not set"*.
- Token di env.db = **token pengguna** (dashboard: My Profile → API Tokens; `/user/tokens/verify` 200 aktif), bukan
  token akun (`/accounts/<id>/tokens/verify` 401). Akun yang terlihat: satu, "Rivsyah@gmail.com's Account".
- Dok dicek live: onboarding Zero Trust Free tetap wajib isi data pembayaran, *"you will not be charged"* (dok
  diperbarui 23 Apr 2026). Nama izin (halaman permissions, 1 Okt 2026): `Access: Apps and Policies`,
  `Access: Organizations, Identity Providers, and Groups`, `Access: Service Tokens` — akhiran Edit atau Write
  (keduanya tercantum); zona: `DNS` Edit/Write.
- Kurs diperbarui (`tools/update_kurs.py`): 204 observasi s.d. **9 Okt 2026 = 17.884** (29 Sep 17.998 cocok kartu BI).
  Python menulis CRLF → dinormalkan ke LF. **Belum di-commit** (bersama tooling deploy), jadi build tetap dari
  `cf1a60b` (kurs s.d. 25 Sep) sampai Aldo mengizinkan commit.
- Tes 21/21; build `cf1a60b` 18 file 2,28 MB; render lokal 6 tampilan OK dengan kurs baru: kurs terakhir Rp17.884
  (+8,4% vs 16.500; 183/183 hari bursa di atas asumsi), proyeksi sisa pagu 31 Des +Rp273 M, batas aman Rp114.328
  (JISDOR) / Rp114.235 (SP2D GUP), saldo US$1,44 jt ±54 hari. Catatan: halaman Proyeksi menampilkan "Sisa pagu"
  +Rp323 M (= pagu − realisasi, belum dikurangi kebutuhan) di samping +Rp273 M di Ringkasan (sesudah kebutuhan) —
  bukan bug, tapi label bisa membingungkan.
- Konteks dari Aldo: ia menempel jawaban sesi SIGAP soal komentar Dedi ("aplikasi JS lebih cocok untuk Cloudflare
  gratis"). PANTAS sudah JS statis → Pages Free cukup, **tidak butuh Workers Paid**. Satu-satunya "biaya": kartu saat
  onboarding Zero Trust (tidak ditagih). Cadangan bila Aldo menolak isi kartu: sandi Basic Auth lewat Pages Functions
  (Workers Free) — lebih lemah dari Access (sandi bersama, tanpa OTP/log); belum dibangun.
- Pemantau `ready --wait` (sesi 2a4da0ac, mulai ±00.55 WIB 11 Okt) **habis waktu 4 jam tanpa perubahan** (TIMEOUT;
  satu kali "fetch failed"). Cek ulang 11 Okt 08.10 WIB: masih WAIT. **Tidak ada pemantau yang jalan sekarang** —
  Aldo perlu menulis "sudah" setelah Zero Trust + izin token. Urutan sesudahnya: `access` (ACCESS_EMAIL =
  rivsyah@gmail.com) → `dns` → `gate` → `deploy` → `gate` → `livetest`. Izin commit (tooling + kurs 9 Okt) juga
  masih ditunggu.
- **11 Okt ±08.44 WIB: Zero Trust AKTIF** (Aldo lewat dashboard; tombol Get started akhirnya membuat organisasi
  dengan **nama tim otomatis `raspy-dew-c84e`**, paket **Zero Trust Free** — halaman login Access =
  `raspy-dew-c84e.cloudflareaccess.com`, netral). Token: GET apps/policies/IdP/service tokens 200 (semua kosong),
  GET organizations 403 10000, DNS 403; **POST identity_providers 403 1010 `auth.forbidden`** → izin Access di token
  baru **Read**. Belum ada yang dibuat di Access. `tools/cloudflare.mjs`: baca organisasi kini opsional (hanya untuk
  dicetak). Menunggu Aldo mengubah izin Access ke **Edit** + menambah DNS Edit, lalu "sudah".

**DEPLOY 11 Okt 2026 ±09.00 WIB — TAYANG di balik Access** (Aldo ubah izin token ke Edit + DNS Edit, lalu "sudah check").
- `ready` 01:52Z READY (semua 5 cek ok). Nilai token tidak berubah setelah izin diedit (env.db tetap).
- `access`: IdP One-time PIN dibuat (selain IdP bawaan `cloudflare` yang dibuat Cloudflare saat organisasi lahir;
  aplikasi hanya mengizinkan OTP), kebijakan **"PANTAS - hanya pemilik"** (allow, email rivsyah@gmail.com, sesi 24 jam),
  aplikasi **PANTAS** (self-hosted) untuk `pantas-kurs.pages.dev`, `*.pantas-kurs.pages.dev`, `pantas.rivsyah.dev`.
  Login: `raspy-dew-c84e.cloudflareaccess.com`.
- **Bug alat diperbaiki:** `api()` hanya menganggap HTTP 200 sukses, padahal POST Access membalas **201** → kini 2xx.
  Percobaan pertama sudah membuat IdP OTP walau skrip melapor gagal; jalan ulang idempoten menemukannya.
- `dns`: CNAME `pantas` → `pantas-kurs.pages.dev` (proxied) dibuat; domain Pages **active** beberapa menit kemudian.
- `gate` SEBELUM deploy: 4/4 URL pages.dev 302 ke login Access. `deploy`: wrangler 4 lewat npx, 17 file + `_headers`,
  deployment `a6dd3d5a`, branch master (produksi). `gate` SESUDAH: 7/7 URL pages.dev terkunci (termasuk
  `a6dd3d5a.*`, `master.*`, subdomain acak); `pantas.rivsyah.dev` dicek lewat `curl --resolve` ke IP Cloudflare
  (DNS lokal mesin riv masih cache NXDOMAIN): 5/5 path 302 ke login.
- `livetest` **LOLOS**: file identik 17/17, 5 header keamanan ada, unggah BKU 1.442 + BKT 6 transaksi, 6 tampilan
  render, 0 error konsol, 0 pola identitas; token uji + kebijakan uji dihapus, token lama ditolak.
- **Jebakan uji identitas:** `render.js` memakai flag `gi`; pola `EBA` tanpa `\b` cocok di dalam kata **"beban"**
  → 4 "masalah" palsu (4/8/10/2 = jumlah kata "beban"). Pakai `\b(...)\b` di `CARI`.
- Yang tayang = **build `cf1a60b` (kurs s.d. 25 Sep)**; versi online **tanpa data sampel** — pengguna mengunggah
  BKU/BKT sendiri, diolah di peramban. Kurs 9 Okt + 2 perbaikan `tools/cloudflare.mjs` + tooling lama masih
  **belum di-commit** (menunggu izin Aldo); sesudah commit: `npm run build && npm run deploy`, lalu `gate`.
- Catatan lingkungan: wrangler menjalankan `git status` dari folder Temp dan ikut memindai `.git` nyasar di home
  (peringatan izin `Recent/`, `SendTo/`, …) — tidak berbahaya untuk deploy, lihat [[reference_stray_git_home]].

**Masukan rapat 5 Okt 2026 (dibaca 11 Okt dari `Downloads\Transkrip_Project_kukuh.md` — transkrip Whisper, dokumen
internal, belum didengar ulang manusia; ringkasan proyek di `.claude/ai_context/raw_materials/2026-10-05_masukan-rapat.md`).**
Seorang pejabat keuangan (punya akses aplikasi keuangan Perwakilan lewat VPN) memberi arahan kepada tim yang termasuk Aldo:
prototipe "live monitoring" realisasi anggaran Perwakilan, dimulai dari BKU, uji coba 2–3 bulan; sekaligus bahan tesis
salah satu peserta ("Mas Kado/Koko" di transkrip kemungkinan "Mas Kukuh" sesuai nama file — tebakan).
- **Sudah dipenuhi PANTAS:** baca ekspor BKU/BKT, kurs SP2D (JISDOR T-2), pengakuan estimasi→SP2D GUP (D8), realisasi
  rupiah, sisa pagu + prediksi kekurangan (Proyeksi = calon instrumen tesis), samaran, daring di balik Access.
- **Celah (urut usulan v1.1):** (1) laporan realisasi bulanan **per akun** format template "realisasi dolar" (Pagu |
  SPB/SP2D s.d. bulan lalu | sisa | bulan berjalan dari BKU | sisa) — butuh pagu per akun; (2) status belum/sudah SP2D
  per transaksi + koreksi kurs saat SP2D; (3) kurs estimasi SP2D manual (rapat: Rp17.000) selain JISDOR; (4) sumber dana
  **RM vs PNBP**; (5) **valuta selain US$** — contoh berikutnya Singapura, sedangkan parser melewati transaksi non-US$
  (sampel Washington menyembunyikan celah ini karena mata uang setempat = US$; JISDOR hanya USD → perlu kurs lain);
  (6) multi-satker, belakangan.
- **Tidak disarankan agent:** kode satker asli sebagai samaran (usul rapat; [Likely] dapat dilacak dari dokumen anggaran
  publik → tetap "Satker A"); data mentah di GitHub/spreadsheet daring; tarik otomatis dengan akses/sandi orang lain;
  tampilan bersama yang menyimpan data di server luar (pejabat itu sendiri menyebut dasbor serupa dipersoalkan unit TI
  pusat); form input harian (dobel dengan aplikasi keuangan).
- **Butuh untuk mulai v1.1:** contoh ekspor laporan realisasi (satu satker, satu bulan, RM + PNBP) dan BKU Singapura
  satu bulan — lewat pemilik akses, gitignored. **Status: Aldo menjawab dengan dua file (11 Okt) → dikerjakan jadi v1.1.**

**v1.1 — 11 Okt 2026 (commit `4d75bf0` alat deploy + kurs 9 Okt, `75009b0` v1.1; TAYANG + livetest LOLOS).**
Aldo: *"1. seperti dokumen excel realisasi program 2. BKU singapur — hanya memakai BKU tidak memakai BKT"*, dengan
`Downloads\realisasi_program.xls` + `Downloads\FormulirBKU.xls` (BKU KBRI Singapura, menimpa nama file sampel lama).
Kirim file dibaca sebagai "ya" untuk v1.1 + izin commit yang ditawarkan bersamanya (dikatakan ke Aldo).
- **Data:** sampel bawaan sekarang Singapura (`data/sampel/FormulirBKU.xls` + `realisasi_program.xls`); sampel Washington
  + BKT + `pengaturan.json` (Pagu Rp500 M) dipindah ke `data/sampel/arsip-washington/` (masih gitignored).
- **Format BKU Singapura:** valuta `US$` (214 baris) + `SIN$` (1.553); footer per valuta; kode baru `PU` (pembelian/
  penjualan valuta, 164 baris), `PK-xxx` (koreksi: PK-PU, PK-KB, PK-<akun> tanpa MAK), `815111A`, PNBP berhuruf
  (425221F, 425222F/H, 425223E, 425228A/C, 425229A/B). Kode MAK BKU `KKKK.KRO/RO.KOM/SUB.DETAIL/AKUN`: DETAIL = nomor
  rincian yang sama dengan komponen terakhir baris MAK laporan.
- **Format laporan Realisasi Program:** 1 sheet, kepala dua baris (Uraian | Pagu: Awal, Cadangan, Lepas, Sisa Cad |
  Realisasi Pagu: SPP Lalu, Bulan Ini, S.d Bulan Ini, Sisa Bulan Ini + 2 kolom % tanpa label); baris MAK
  `PROGRAM/KKKK.KRO/RO.KOM.SUB.DETAIL` lalu baris akun 6 digit; nilai rupiah berupa teks en-US; "Periode dd-mm-yyyy s.d
  dd-mm-yyyy"; penanda "Tidak semua Kurs SP2D"; baris tanda tangan di bawah "Total" (tidak dibaca).
- **Model kurs teruji (agregat):** belanja SIN$ ÷ kurs konversi PU terakhir × kurs SP2D GUP = 99,74% realisasi laporan
  (galat median per MAK 0,6%); alternatif JISDOR tanggal 99,62%.
- **Keputusan proyek baru:** D14 valuta via konversi PU, D15 laporan realisasi = sumber pagu/realisasi resmi (urutan isian >
  laporan > pengaturan sampel), D16 BKT tidak dipakai, D17 samaran MAK bernomor urut + valuta "ML" + kode satker dihapus.
- **Angka sampel Singapura (1 Jan–9 Okt 2026):** rekonsiliasi per valuta persis; 26 tanggal konversi 1,2474–1,2793
  SIN$/US$; belanja US$6,86 jt ekuivalen; beban kurs vs 16.500 Rp6,61 M (JISDOR) / Rp6,65 M (GUP); pagu Rp150,47 M
  (pegawai 53,52 / barang 95,74 / modal 1,20), realisasi Rp120,21 M (79,9%), sisa Rp30,25 M; MAK cocok 75/77 (2 MAK
  US$8 + 4 baris koreksi tanpa MAK −US$911, di bawah ambang 0,1%); saldo UP US$1,34 jt ±60 hari.
  **Proyeksi:** kebutuhan US$1,89–2,08 jt s.d. 31 Des (laju 3/6 bulan) → **kurang Rp3,6–7,0 M** pada kurs 17.884; pada
  kurs asumsi pun kurang Rp4,1 M (beban kurs yang sudah terserap); batas aman Rp14.500–16.000 → status Pagu Kritis.
  [Likely — metode laju sederhana; Juni US$1,02 jt mungkin memuat belanja sekali bayar.]
- **Uji:** tes 25/25 (LRP dan dua valuta pakai data sintetis); render 7 tampilan 0 pola identitas; ekspor .xlsx 0/34.931
  sel berpola identitas dengan samaran (samaran mati: ratusan, membuktikan pemeriksaan bekerja); livetest LOLOS.
- **Perbaikan sampingan:** crash bila BKU tanpa penerimaan UP (teks cek GUP); build.js membaca pola identitas dari
  `.claude/terlarang.txt` (lokal) supaya kata identitas tidak masuk git.
- **Jebakan:** heredoc Bash membuang `\` → regex `SIN\$` jadi `SIN$` (cocok "Mesin") → 161 temuan palsu; tulis
  skrip pemeriksa lewat file.

**Masih terbuka (per 11 Okt, sesudah v1.1):** ~~pagu DIPA nyata~~ (kini dari laporan Realisasi Program); kurs asumsi
khusus DIPA (sementara 16.500); siapa lagi yang boleh masuk Access (email tim); banyak satker sekaligus (usul rapat,
belum diminta); laju proyeksi mana yang dipakai untuk dilaporkan (3 vs 6 bulan); nama PANTAS; simpan data di
peramban (tidak). Uji layar ponsel 390 px 11 Okt: 7 tampilan tanpa geser halaman, tabel bergeser di dalam kotaknya.

**Verifikasi:** `node --test "tests/*.test.js"` (21 tes; pola glob wajib — `node --test tests/` gagal di
Node 25) dan `node tests/render.js http://pantas-kurs.test/ <folder> 1440` (Chrome headless via CDP:
error konsol + tangkapan layar; env `PRE_JS`, `UPLOAD`, `VIEWS`, `PREFIX`, `CARI` = regex identitas yang
hanya dihitung, tidak dicetak).

**Jebakan:** SheetJS standalone di Node tidak bisa `writeFile` tanpa `set_fs` → pakai
`XLSX.write(wb,{type:'buffer'})`. Tool Edit menolak file yang baru diubah skrip Python — baca ulang dulu.
Git Bash mengubah argumen yang diawali `//` (konversi path MSYS) — jangan kirim penanda komentar `// …` sebagai
argumen skrip; di sesi ini dua penanda kehilangan satu `/` dan jadi error sintaks JSX.
Privasi: lihat [[feedback_synthetic_data_deny_all]] (frekuensi kata uraian meloloskan nama).
Konteks topik yang sama (lindung nilai/kurs Perwakilan): [[project_tesis_erna]].
