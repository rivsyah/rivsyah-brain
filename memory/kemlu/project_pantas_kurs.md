---
name: project-pantas-kurs
description: "PANTAS — aplikasi pantau kas UP (petty cash) Perwakilan + selisih kurs IDR/USD + proyeksi kekurangan pagu; SPA statis di ~/dev/kemlu/pantas-kurs → pantas-kurs.test; sampel BKU/BKT KBRI Washington TA 2026; keputusan Aldo: kurs pengakuan dua cara, lokal, Pagu 2026 Rp500 M (29 Sep, di data/sampel/pengaturan.json); riwayat git bersih: e096019 → cf1a60b"
metadata:
  type: project
  modified: 2026-09-27
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
- D9 aturan kurs SP2D T-2 tetap (bisa diubah). D10 **lokal saja**, tanpa deploy/publikasi.

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
Jebakan uji: unduhan Chrome headless via CDP dibatalkan bila `downloadPath` memakai garis miring maju di
Windows — pakai path `C:\...`.

**Masih terbuka:** pagu DIPA nyata; kurs asumsi khusus DIPA (sementara 16.500); simpan data di peramban
(tidak); nama PANTAS.

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
