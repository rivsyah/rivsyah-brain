---
name: project-sigap-bup
description: "SIGAP-BUP GRP Biro Umum & Pengadaan Kemlu di Herd\\sigap-bup → sigap-bup.test, dari Claude Design + data Wasdit BUM 2026.xlsx"
metadata: 
  node_type: memory
  type: project
  originSessionId: 71829bcd-e6cd-47be-b04d-d53c62f945d3
  modified: 2026-09-05T12:04:14.967Z
---

SIGAP-BUP — Government Resource Planning Biro Umum dan Pengadaan Kemlu, dibangun 16 Jul 2026 di `C:\Users\rivsy\Herd\sigap-bup` → http://sigap-bup.test (login admin@kemlu.go.id / password).

- Stack: Laravel 13 + Inertia v3 + React 19/TS + Tailwind, SQLite, Herd. Dokumen spesifikasi 01–07 di `C:\Users\rivsy\Downloads\MOFA\SIGAP-BUP\GRP-BUP-Kemlu`; desain dari proyek Claude Design "Buat prototype ini" (e893d511-03b1-49e7-a1ef-817d0bb4c11c, file SIGAP-BUP.dc.html — salinan di docs/).
- Seed dari `Wasdit BUM 2026.xlsx` (60 sheet) via `scripts/import-wasdit.mjs` (SheetJS → JSON) + `WasditSeeder`: 128 MAK (Σ pagu Rp 350.607.991.000 persis SUMMARY), 587 permintaan UP/TUP, 46 alokasi PPK, 27 SPP, KKP/kontrak/MONEV/RVRO/MP PNBP.
- Inti: BudgetControlService (gerbang pagu BR-KOM-1/2/3), AuditService append-only, RBAC session-role (operator/ppk/ppspm/bendahara/kpa) + SoD maker≠penguji. 87 tes Pest lulus.
- 5 Sep 2026: sistem kapabilitas peran di `Konsep::CAPABILITIES` (guard rute `sigap.role:can,<kapabilitas>` + props `sigap.can/why` + komponen `AksiButton`/`AksiTerkunci` di lib/sigap.tsx), beranda per peran (KPA→eksekutif, PPK→rkakl, PPSPM→antrean, Bendahara→karwas, Operator→permintaan), To-Do sadar-peran, mesin status Draf→Diajukan (draf tak membebani pagu), SoD berbasis akun (kolom maker_user_id/penguji_user_id). LainnyaController dipecah jadi Kontrak/Penyedia/Kkp/Spm/Kinerja/Pengembalian Controller. Layar baru Pengembalian Belanja (BR-KOM-7).
- 5 Sep 2026 (v2 diterapkan): desain v2 dari proyek 4ce251f1-c607-477f-9851-d850d42d2a29 = **desain ulang aplikasi internal**, bukan situs publik. Palet navy #0F2557 + amber #F5A80C, latar #F3F2EC, font Public Sans/Source Serif 4/IBM Plex Mono, sidebar 7 grup bernomor 01–07, kop resmi bergaris ganda + kode modul (DS-01…AD-03). Token di `resources/js/lib/v2.tsx`, metadata layar terpusat di sigap-layout.tsx (halaman cukup kirim `screen`). Tiga modul baru Fase 3 (data ilustrasi dari desain, di `AsetController`): Persediaan, Logistik Diplomatik (7 Perwakilan RI), Aset Tetap BMN. 140 tes lulus, 26 layar 200.
- JEBAKAN: `DesignSync get_file` memotong isi di 256 KiB tanpa peringatan — berkas v2 asli 348 KB, jadi ekor logika hilang. Minta user ekspor ZIP proyek bila berkas >256 KB. Juga: berkas unduhan "bundled page" Claude Design menyimpan HTML di `<script type="__bundler/template">` (objek indeks→char, gabung berurutan).
- 9 Agu 2026 (lanjutan): monitoring TKDN/P3DN di RUP (kolom pdn/ukm/tkdn_persen, kartu monitoring tertimbang pagu vs target UMK 40% Inpres 2/2022 & ambang TKDN 25% PP 29/2018) + widget "Kustomisasi" dashboard (toggle 7 seksi, tersimpan localStorage, tombol melayang kiri-bawah ala MyIntress).
- 9 Agu 2026: adopsi pola MyIntress (DJPb Kemenkeu, dipelajari dari rekaman layar via ffmpeg contact-sheet): To-Do List per modul di dashboard, gauge Capaian IKPA (3 pilar 30/40/30) di Eksekutif, layar Karwas UP/TUP (umur TUP >30 hari + GUP revolving), Cetak BAR rekonsiliasi (window.print), pencarian menu topbar. 87 tes tetap lulus.
- 2 Agu 2026 (ultracode): semua 22 layar fungsional — tambah Dashboard Eksekutif, Revisi DIPA (empat-mata by user_id), RUP/pemaketan (validasi kumulatif, seed 8 paket), Laporan Realisasi + Ekspor CSV (sanitasi formula), Users (matriks RBAC), Referensi, notifikasi topbar + pencarian global. Menu Timeline dihapus; "Pemaketan RUP" → "Rencana Umum Pengadaan".
- Doc 02 §5 menyarankan React+NestJS+PostgreSQL; dipakai alternatif resmi Laravel karena mesin tanpa Docker/PostgreSQL dan pola [[project-sipama-kemlu]]/[[project-dpld-kemlu]] (semua proyek Kemlu = Laravel di Herd).

## 22 Sep 2026 — keputusan: SQLite → Neon Postgres, lalu live di Cloudflare

**Keputusan Aldo.** Ini membatalkan sebagian baris "Doc 02 §5" di atas: PostgreSQL dulu ditolak
karena mesin ini tanpa Docker/PostgreSQL. Postgres terkelola menghapus alasan itu — tidak ada yang
perlu dipasang di Windows. Stack aplikasi tetap Laravel 13 + Inertia; yang berubah hanya basis data
dan tempat hosting. Akun Neon dan jebakannya: [[reference-neon-account]].

**Alasan terkuat, ditemukan saat survei dan diverifikasi di `vendor/`:** aplikasi ini memanggil
`lockForUpdate()` **10 kali**, dan di SQLite semuanya **tidak melakukan apa-apa**.
`SQLiteGrammar::compileLock()` mengembalikan string kosong; `PostgresGrammar::compileLock()`
mengembalikan `for update`. Artinya gerbang pagu `BudgetControlService` (BR-KOM-1/2/3) dan
pengunci SoD **belum pernah benar-benar terlindungi dari dua permintaan bersamaan** — dua
permintaan bisa sama-sama lolos cek sisa pagu lalu sama-sama commit. Pindah ke Postgres
menyalakan kunci itu untuk pertama kalinya. Ini perbaikan kebenaran, bukan sekadar pindah host.

**Konsekuensi: D1 (SQLite-nya Cloudflare) HARAM untuk aplikasi ini.** D1 tidak punya transaksi
sama sekali, jadi ia mengulang cacat yang sedang diperbaiki, lebih parah. Basis datanya harus
Postgres.

**Jebakan migrasi SQLite→Postgres yang sudah dipetakan di kode ini:**
- **13 `selectRaw`/`whereRaw`/`orderByRaw` + 9 `groupBy`.** Postgres mewajibkan setiap kolom
  non-agregat ikut `GROUP BY`; SQLite tidak. Ini sumber kegagalan paling mungkin. Titik panas:
  `AdminController` (5), `DashboardController` (3), `HandleInertiaRequests` (2, termasuk
  `orderByRaw` aritmetika sisa pagu), `PembagianController`, `LaporanController`.
- `LaporanController::agregat()` menyisipkan `{$kolom}` ke SQL mentah, **tetapi** nilainya berasal
  dari peta whitelist tertutup (`bagian|jenis|akun|ppk`). Aman dari injeksi — sudah diperiksa,
  jangan dilaporkan ulang sebagai temuan.
- `PenyediaController:51` sudah memakai `whereRaw('lower(nama ...')`. Pola itu wajib ditiru:
  `LIKE` di Postgres **case-sensitive**, di SQLite tidak. Pencarian yang tidak di-lower akan diam-diam
  mengembalikan lebih sedikit baris, bukan error.
- 10 migrasi, 27 tabel. Hanya 2 kolom `boolean` — risiko 0/1-vs-true kecil.
- Setelah impor data mentah, **`setval()` setiap sequence**. Kalau tidak, insert pertama langsung
  kena duplicate key. Ini jebakan Postgres paling klasik dan paling sering terlewat.
- **`phpunit.xml` memaku `DB_CONNECTION=sqlite` + `:memory:`.** Jadi 140 tes yang lulus itu
  **tidak membuktikan apa pun tentang Postgres**, dan khususnya tidak pernah menguji 10
  `lockForUpdate` dalam kondisi terkunci sungguhan. Suite harus bisa dijalankan terhadap Postgres
  sebelum migrasi disebut selesai.

**Sisi Cloudflare — terverifikasi 22 Sep 2026, ini fakta yang berubah dari tahun lalu:**
Cloudflare **Containers GA sejak 13 Apr 2026**, dan paket `workers-php` menjalankan Laravel
**apa adanya di dalam container**, dengan Worker sebagai pintu depan. Basis data eksternal
disambung lewat **Hyperdrive** (`WorkersPhp\Hyperdrive\HttpPgsqlPDO`), jadi Neon bisa dipakai.
Dua syarat yang harus disebut lebih dulu: **Workers plan berbayar** (Containers tidak ada di free),
dan `workers-php` **dikelola komunitas, bukan resmi Cloudflare maupun Laravel** — risiko nyata untuk
sistem pemerintah. Caveat README-nya: migrasi jalan saat container boot lewat HTTP (jaga tetap
kecil), dan satu instance container = satu pohon proses PHP.

**Belum diputuskan:** region Neon, org pemilik, dan apakah data anggaran Kemlu boleh berada di
region luar negeri. Lihat [[reference-neon-account]] jebakan 3.
