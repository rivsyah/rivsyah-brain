---
name: project-sipdln-bup
description: "SIPDLN-BUP — aplikasi monitoring perjalanan dinas luar negeri pegawai Biro Umum dan Pengadaan + drafting Surat Tugas/SPD/Rincian/Nominatif; Laravel 13 di ~/dev/kemlu/sipdln-bup → sipdln-bup.test; SBM 2026 (PMK 32/2025); kurs JISDOR otomatis; nomor ST ST/KP/{urut}/{bulan}/{tahun}/25; identitas Kemlu disamarkan; PHPStan 0; commit awal b50b8d6"
metadata:
  type: project
  modified: 2026-09-29
---

Dibangun 27 Sep 2026 atas permintaan Aldo ("buatkan aplikasi monitoring untuk perjalanan dinas luar
negeri bagi pegawai biro umum dan pengadaan"). Status 29 Sep 2026: **v1 + keputusan Aldo 29 Sep
terpasang, commit awal `b50b8d6` di `main` (belum ada remote). Pola nomor ST (D18) dan PHPStan 0
temuan (D19) selesai 29 Sep malam dan **di-commit terpisah atas persetujuan Aldo: `d2284eb`
(penomoran) lalu `0f3fcb6` (PHPStan)**. HEAD `0f3fcb6`, tanpa remote.**

## Keputusan Aldo 29 Sep 2026 (terkunci, D14–D16 di DECISIONS proyek)

1. **Pola nomor Surat Tugas BUP = `ST/KP/{urut}/{bulan}/{tahun}/25`** (Aldo: "ST/KP/         /09/2026/25").
   Nomor urut dikosongkan (9 spasi tak-putus) sampai surat diagendakan, lalu diisi di form/modal
   tahapan; bulan 2 angka + tahun dari tanggal ST. Pola bisa diubah admin di Pengaturan (wajib `{urut}`).
   Mode "nomor manual" untuk nomor di luar pola. Ganti pola tidak mengubah nomor yang sudah terbit.
   **SPD belum punya pola — tetap manual** (tanya Aldo bila perlu).
2. **Penandatangan Surat Tugas PDLN = Kepala Biro Umum dan Pengadaan.** Bawaan di Pengaturan
   (`jabatan_penandatangan_st`) dan terisi otomatis di form Pejabat.
3. **Kurs = JISDOR Bank Indonesia.** Otomatis dari situs BI (lihat bawah).
4. **Samarkan identitas Kemlu.** Aplikasi hanya menampilkan "SIPDLN-BUP (Sistem Informasi Perjalanan
   Dinas Luar Negeri, Biro Umum dan Pengadaan)". Aturan: tidak ada nama kementerian, domain
   `kemlu.go.id`, alamat, atau nama unit induk di kode, seeder, uji, README, atau pesan commit.
   Kop surat/nama K/L diisi pemakai di layar Pengaturan; baris kop kosong tidak dicetak. Istilah PMK
   (Paspor Diplomatik, "Perwakilan RI", "Kepala Perwakilan") tetap. Sebelum commit:
   `git grep -i -E "kemlu|kementerian luar negeri|sekretariat jenderal"` harus kosong.
   `.claude/` + `CLAUDE.md` proyek tetap privat (gitignored) dan boleh menyebut konteks nyata.

## Deploy demo Cloudflare (29 Sep 2026, disiapkan — menunggu Aldo; NS/zona sudah beres ~23:05)

Aldo: "push ke cloudflare", domain rivsyah.dev dari Hostinger. Commit `a0c5c18`: Dockerfile FrankenPHP
PHP 8.4 (gd, zip, intl, opcache; composer tanpa dev), `docker/start.sh` (APP_KEY dari secret Worker,
kunci sementara bila kosong; `php artisan optimize`), `wrangler.jsonc` (Worker `sipdln-bup`, container
`basic`, `max_instances` 1, route `sipdln.rivsyah.dev`), `cloudflare/worker.ts` (`@cloudflare/containers`,
sleepAfter 15m, internet untuk kurs BI), workflow `deploy` manual (wrangler 4.143.0 + containers 0.3.7
dipaku, sama dengan SIGAP), CI tests PHP 8.4, `trustProxies('*')` + https paksa di produksi.
**Basis data live = SQLite data contoh dibangun saat build**; container selalu mulai dari data itu (demo,
tanpa data asli). Password contoh tetap `password` (ikut keputusan SIGAP) — risikonya dicatat D20.
Build/start disimulasikan tanpa Docker: lulus (login → https, 10 halaman + unduhan DOCX/XLSX 200).
Temuan simulasi: `APP_NAME` wajib di-set di image (kalau tidak judul "Laravel"). Jebakan simulasi:
router `server.php` bawaan Laravel harus dijalankan dengan CWD `public/`; server lama di port sama
membuat hasil palsu — pakai port baru + `timeout`.
Langkah Aldo (bersama SIGAP/PANTAS): [[reference-cloudflare-rivsyah-dev]]. Sesudahnya agent: repo privat
`rivsyah/sipdln-bup`, push, secret/var repo, jalankan workflow, secret APP_KEY, uji live.

## Letak dan cara jalan (mesin riv)

- Kode: `C:\Users\rivsy\dev\kemlu\sipdln-bup` (bukan `Herd\` — kode baru masuk `~/dev/<scope>`).
- Situs: `http://sipdln-bup.test` lewat **junction** `C:\Users\rivsy\.config\herd\config\valet\Sites\sipdln-bup`.
  `herd link` (bat maupun phar) tidak mendaftarkan apa pun di mesin ini — pakai junction.
- Login demo: `admin@sipdln-bup.test` / `password`; data contoh menambah `operator@sipdln-bup.test`
  dan `pimpinan@sipdln-bup.test`. (Akun `@kemlu.go.id` lama sudah dibuang — DB lokal dibangun ulang
  29 Sep, isinya hanya data contoh.)
- Git: branch `main` (default git mesin ini `master` — diubah dengan `git symbolic-ref HEAD
  refs/heads/main` sebelum commit pertama). Commit oleh rivsyah@gmail.com: `b50b8d6` v1 (29 Sep),
  `d2284eb` pola nomor ST, `0f3fcb6` PHPStan 0. Belum ada remote. Cara memisah dua perubahan yang
  sudah bercampur jadi dua commit: simpan `git diff --binary` bagian pertama (pakai `git add -N`
  untuk berkas baru) → `git stash -u` → `git apply --index` patch → uji → commit → `git checkout
  stash@{0} -- .` + berkas baru dari `stash@{0}^3` → cocokkan sha1 semua berkas → commit → drop stash.
- Framework ai_context: `.claude/ai_context/development/v1/` (GRANDPLAN, 00_INDEX, STATUS, DECISIONS
  D1–D17: D14–D16 `locked`, sisanya `proposed`). Riset regulasi di
  `.claude/ai_context/reference/regulasi-pdln/README.md`.

## Isi aplikasi

- Monitoring per TA: akan berangkat / sedang di LN / sudah melaksanakan / belum mendapat PDLN;
  pemerataan per pegawai, cakupan per unit, negara, per bulan, linimasa Gantt, biaya vs pagu,
  peringatan (paspor < 6 bulan setelah kembali, ST/SPD belum bernomor, kurs kosong, laporan telat).
- Data induk: pegawai (CRUD + impor/ekspor Excel, golongan A–D otomatis), SBM uang harian per
  negara × golongan per tahun (impor, salin tahun, rujukan negara), acuan tiket PP, **kurs JISDOR**
  (tab di menu "SBM & Kurs"), pejabat, unit.
- Dokumen dari satu sumber (`DokumenData`): pratinjau HTML A4, DOCX dari templat (bisa diganti
  templat kantor), nominatif juga XLSX berumus.
- Peran: administrator / operator / pimpinan (lihat saja). Operator boleh "Perbarui dari BI";
  impor berkas kurs hanya admin.

## Kurs JISDOR (29 Sep 2026)

- Tabel `kurs_jisdor` (1 baris per hari bursa). `app/Services/JisdorBi.php` = port PHP dari
  `pantas-kurs/tools/update_kurs.py` (Laravel Http + Guzzle `CookieJar`, postback tombol Unduh) —
  jalan langsung ke situs BI 29 Sep 2026. Lihat [[reference-bi-jisdor]].
- `php artisan kurs:jisdor` (bawaan: mulai 7 hari sebelum data terakhir), `--dari/--sampai`, `--json`
  menulis ulang `database/data/kurs_jisdor.json` (seeder). Isi sekarang: 650 hari bursa,
  2 Jan 2024 – 29 Sep 2026, cocok 194/194 dengan data PANTAS.
- Form perjalanan baru dan "Salin perjalanan" memakai JISDOR hari bursa terakhir ≤ hari ini;
  `PetunjukKurs` di form menunjukkan JISDOR untuk tanggal kurs + tombol "Pakai kurs ini" dan
  "Perbarui dari BI" bila data tertinggal. Perjalanan tersimpan tidak berubah saat tabel diperbarui.
- Jadwal `kurs:jisdor` hari kerja 11.00 dan 15.00 WIB ada di `routes/console.php`, tetapi **baru jalan
  bila server menjalankan `php artisan schedule:run` tiap menit** — di mesin ini belum ada Task
  Scheduler untuk itu (sengaja; tombol manual cukup untuk lokal).

## Fakta regulasi yang dipakai (dibaca dari PDF JDIH Kemenkeu, 27 Sep 2026)

- **SBM TA 2026 = PMK 32 Tahun 2025** (ditetapkan 14 Mei 2025). Uang harian PDLN = Lampiran I
  angka 29, 97 negara, US$/OH gol. A–D (Inggris 792/774/583/582; Jepang D 336). Tiket PDLN PP =
  Lampiran II angka 18, 134 kota. Transport bandara DKI Rp250.000/orang/kali (tabel PD DN).
- Tata cara: PMK 164/PMK.05/2015 jo. 227/PMK.05/2016 jo. **181/PMK.05/2019** (berlaku 5 Des 2019).
  40% waktu perjalanan; 100% bila menginap saat transit/setiba (Pasal 13 ayat 5a); 30% untuk jenis
  g/h/i bila akomodasi disediakan; golongan di Lampiran B (A Eselon I, B Eselon II/IV/c+, C III/c–IV/b,
  D lainnya); PMK 181/2019 menghapus "> 8 jam = Business" untuk C/D. Format SPD = Lampiran C,
  Rincian = Lampiran D, Surat Tugas = Lampiran I PMK 164/2015.
- Sumber kurs tidak diatur PMK; **Aldo memilih JISDOR (29 Sep 2026)**. Kurs tetap bisa diubah per
  perjalanan beserta sumber dan tanggalnya.
- Akun DIPA BUP 2026 memakai 524211 dan 524219 (dari data SIGAP-BUP).

## Mutu (29 Sep 2026)

66 uji PHPUnit (65 lulus, 1 dilewati = uji 2FA bawaan), `vp check` (format + lint) dan `tsc` bersih,
build Vite hijau, 19 rute 200, cek peramban kurs 13/13 lolos (termasuk "Perbarui dari BI" langsung
ke situs BI), DOCX tanpa nama instansi induk dan tanpa makro tersisa.
**29 Sep malam:** `composer ci:check` hijau penuh — PHPStan level 7 **0 temuan** (dari 412) tanpa
baseline/ignore; 72 uji (71 lulus, 1 dilewati). Kunci: `@property` + generik relasi di semua model,
tanggal = `CarbonImmutable` (ada `Date::use` di AppServiceProvider), pemerataan tanpa referensi `&`,
data seeder di method bertipe. Temuan sampingan: lebar sel templat DOCX dulu pecahan (`566.929…`),
tidak sah menurut OOXML — kini twip bulat.
Keempat DOCX dirender lewat Word COM (27 Sep): ST 1 hlm, SPD 1 hlm/pegawai (huruf 9,5, margin
1,5/1,2 cm), Rincian 1 hlm/pegawai, Nominatif 1 hlm lanskap.
Cara aman Word COM saat ada WINWORD `/Automation` sesi lain: `New-Object -ComObject Word.Application`
membuat instans BARU (PID beda), catat PID sebelum/sesudah, `Quit()` + `ReleaseComObject` di `finally`,
jangan sentuh instans lain.

## Jebakan yang ditemukan

- `composer create-project laravel/react-starter-kit` **tanpa `--stability=dev`** memberi Laravel 12 +
  Inertia 2 (lebih tua dari SIGAP-BUP). Dengan `--stability=dev`: Laravel 13.33, Inertia 3, Vite 8
  lewat **vite-plus** (`vp build`), uji **PHPUnit** (bukan Pest), Fortify + passkey.
- **`composer ci:check` = `npm run check` (`vp check`, printWidth 80) + `tsc` + pint + PHPStan + uji.**
  Jalankan `npx vp check --fix` sebelum commit. `database/data/**` dikecualikan dari formatter.
  PHPStan di mesin ini butuh `--memory-limit=1G` (php.ini 128M → crash).
- Uji Inertia: float `16750.0` terkirim sebagai `16750` (json_encode tanpa PRESERVE_ZERO_FRACTION)
  → bandingkan dengan int.
- Mematikan fitur Fortify menghapus rute Wayfinder → halaman kit (register, settings, 2FA) gagal
  `tsc`; hapus halaman/komponennya sekalian.
- PhpWord TemplateProcessor: `setValue` mengubah `\n` jadi baris baru; `cloneBlock(..., true, true)`
  lalu `cloneRow('r_no#1')` menghasilkan `${r_no#1#1}` (bersarang jalan); pemisah halaman antarblok
  lewat `replaceXmlBlock('${pisah#k}', '<w:p><w:r><w:br w:type="page"/></w:r></w:p>')`; paragraf
  berisi satu makro saja bisa dihapus utuh (`PengisiTemplat::hapusParagrafTunggal`, dipakai untuk kop kosong).
- PhpSpreadsheet: `getDefaultStyle()` ada di Spreadsheet, **bukan** Worksheet.
- PHPStan tidak melacak isian lewat referensi (`$x = &$arr[$k]`) → laporan palsu "selalu kosong".
  Tulis ulang tanpa referensi. Larik literal besar di seeder bisa ditebak terlalu sempit → pindahkan
  ke method dengan `@return` bertipe.
- Keluaran PHPStan/PHPUnit/Pint di mesin ini berbentuk JSON ringkas (`{"tool":...}`); `-v` untuk
  daftar lengkap. Sesi uji `curl` kedaluwarsa setelah 2 jam (SESSION_LIFETIME) → login ulang.
- Tangkapan layar halaman ber-login: `C:\Users\rivsy\Bara\scripts\shot-login.mjs` (Chrome headless +
  CDP + cookie jar curl; login = GET /login lalu POST dengan header `X-XSRF-TOKEN`).
- **Mesin ini ramai sesi Claude paralel (~10).** Jangan bunuh proses PHP berdasarkan waktu mulai —
  cek command line dulu (sesi ini sempat membunuh uji Postgres milik sesi SIGAP-BUP; tidak ada
  kerusakan). Jangan jalankan Word/Excel COM bila ada instans `/Automation` lain.

## Terbuka (Q di GRANDPLAN)

Pola nomor SPD (bila ada), repo remote (belum ada), tempat produksi + kebijakan
data pegawai, sumber data pegawai asli, integrasi pagu SIGAP-BUP dan SSO Portal BUP (v2), uang
representasi ketua delegasi.

Terkait: [[project-sigap-bup]], [[project-bup-kemlu]], [[project-pantas-kurs]], [[reference-office-render]], [[reference-bi-jisdor]].
