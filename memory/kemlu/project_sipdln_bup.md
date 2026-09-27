---
name: project-sipdln-bup
description: "SIPDLN-BUP — aplikasi monitoring perjalanan dinas luar negeri pegawai Biro Umum dan Pengadaan + drafting Surat Tugas/SPD/Rincian/Nominatif; Laravel 13 di ~/dev/kemlu/sipdln-bup → sipdln-bup.test; SBM 2026 (PMK 32/2025) terverifikasi"
metadata:
  type: project
---

Dibangun 27 Sep 2026 atas permintaan Aldo ("buatkan aplikasi monitoring untuk perjalanan dinas luar
negeri bagi pegawai biro umum dan pengadaan"). Status: **v1 lengkap, belum ditinjau Aldo.**

## Letak dan cara jalan (mesin riv)

- Kode: `C:\Users\rivsy\dev\kemlu\sipdln-bup` (bukan `Herd\` — kode baru masuk `~/dev/<scope>`).
- Situs: `http://sipdln-bup.test` lewat **junction** `C:\Users\rivsy\.config\herd\config\valet\Sites\sipdln-bup`.
  `herd link` (bat maupun phar) tidak mendaftarkan apa pun di mesin ini — pakai junction.
- Login demo: `admin@kemlu.go.id` / `password`; data contoh menambah `operator@` dan `pimpinan@kemlu.go.id`.
- Git: `git init` saja, **belum ada commit** (menunggu Aldo). `.claude/` dan `CLAUDE.md` di-gitignore
  bawaan Laravel.
- Framework ai_context terpasang: `.claude/ai_context/development/v1/` (GRANDPLAN, 00_INDEX, STATUS,
  DECISIONS D1–D13 semua `proposed`, 6 build file). Riset regulasi di
  `.claude/ai_context/reference/regulasi-pdln/README.md`.

## Isi aplikasi

- Monitoring per TA: akan berangkat / sedang di LN / sudah melaksanakan / belum mendapat PDLN;
  pemerataan per pegawai, cakupan per unit, negara, per bulan, linimasa Gantt, biaya vs pagu,
  peringatan (paspor < 6 bulan setelah kembali, ST/SPD belum bernomor, kurs kosong, laporan telat).
- Data induk: pegawai (CRUD + impor/ekspor Excel, golongan A–D otomatis), SBM uang harian per
  negara × golongan per tahun (impor, salin tahun, rujukan negara), acuan tiket PP, pejabat, unit.
- Dokumen dari satu sumber (`DokumenData`): pratinjau HTML A4, DOCX dari templat (bisa diganti
  templat kantor), nominatif juga XLSX berumus.
- Peran: administrator / operator / pimpinan (lihat saja).

## Fakta regulasi yang dipakai (dibaca dari PDF JDIH Kemenkeu, 27 Sep 2026)

- **SBM TA 2026 = PMK 32 Tahun 2025** (ditetapkan 14 Mei 2025). Uang harian PDLN = Lampiran I
  angka 29, 97 negara, US$/OH gol. A–D (Inggris 792/774/583/582; Jepang D 336). Tiket PDLN PP =
  Lampiran II angka 18, 134 kota. Transport bandara DKI Rp250.000/orang/kali (tabel PD DN).
- Tata cara: PMK 164/PMK.05/2015 jo. 227/PMK.05/2016 jo. **181/PMK.05/2019** (berlaku 5 Des 2019).
  40% waktu perjalanan; 100% bila menginap saat transit/setiba (Pasal 13 ayat 5a); 30% untuk jenis
  g/h/i bila akomodasi disediakan; golongan di Lampiran B (A Eselon I, B Eselon II/IV/c+, C III/c–IV/b,
  D lainnya); PMK 181/2019 menghapus "> 8 jam = Business" untuk C/D. Format SPD = Lampiran C,
  Rincian = Lampiran D, Surat Tugas = Lampiran I PMK 164/2015.
- **Kurs tidak diatur PMK** — aplikasi minta kurs + sumber + tanggal per perjalanan.
- Akun DIPA BUP 2026 memakai 524211 dan 524219 (dari data SIGAP-BUP).

## Mutu saat selesai

57 uji PHPUnit (56 lulus, 1 dilewati = uji 2FA bawaan), `tsc` strict + lint bersih, build Vite
hijau, 35 rute 200. Tampilan dicek lewat tangkapan layar Chrome headless.
**Belum:** render DOCX lewat Word COM — tertunda karena WINWORD `/Automation` milik sesi lain aktif.

## Jebakan yang ditemukan

- `composer create-project laravel/react-starter-kit` **tanpa `--stability=dev`** memberi Laravel 12 +
  Inertia 2 (lebih tua dari SIGAP-BUP). Dengan `--stability=dev`: Laravel 13.33, Inertia 3, Vite 8
  lewat **vite-plus** (`vp build`), uji **PHPUnit** (bukan Pest), Fortify + passkey.
- Mematikan fitur Fortify menghapus rute Wayfinder → halaman kit (register, settings, 2FA) gagal
  `tsc`; hapus halaman/komponennya sekalian.
- PhpWord TemplateProcessor: `setValue` mengubah `\n` jadi baris baru; `cloneBlock(..., true, true)`
  lalu `cloneRow('r_no#1')` menghasilkan `${r_no#1#1}` (bersarang jalan); pemisah halaman antarblok
  lewat `replaceXmlBlock('${pisah#k}', '<w:p><w:r><w:br w:type="page"/></w:r></w:p>')`.
- PhpSpreadsheet: `getDefaultStyle()` ada di Spreadsheet, **bukan** Worksheet.
- Tangkapan layar halaman ber-login: `C:\Users\rivsy\Bara\scripts\shot-login.mjs` (Chrome headless +
  CDP + cookie jar curl).
- **Mesin ini ramai sesi Claude paralel (~10).** Jangan bunuh proses PHP berdasarkan waktu mulai —
  cek command line dulu (sesi ini sempat membunuh uji Postgres milik sesi SIGAP-BUP; tidak ada
  kerusakan). Jangan jalankan Word/Excel COM bila ada instans `/Automation` lain.

## Terbuka (Q di GRANDPLAN)

Pola nomor ST/SPD BUP, siapa penandatangan ST PDLN, sumber kurs (KMK vs kurs tengah BI), tempat
produksi + kebijakan data pegawai, sumber data pegawai asli, integrasi pagu SIGAP-BUP dan SSO Portal
BUP (v2), uang representasi ketua delegasi.

Terkait: [[project-sigap-bup]], [[project-bup-kemlu]], [[reference-office-render]].
