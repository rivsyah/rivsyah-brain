---
name: project-sigap-bup
description: "SIGAP BUP (Sistem Informasi Government Analysis Planning Biro Umum dan Pengadaan) di Herd\\sigap-bup → sigap-bup.test; git: 8dfd123 5 bug Postgres, 01863c4 seed DUMMY, f5bbeeb identitas netral tanpa Kemlu; Neon main TERISI dummy 29 Sep (0 jejak Kemlu); password bawaan dipertahankan (keputusan Aldo); berikutnya deploy Cloudflare: container + pdo_pgsql langsung ke Neon, JANGAN HttpPgsqlPDO (transaksi tak terjamin); c173a61 perbaikan pra-deploy (dry-run wrangler 4.143.0 lolos), menunggu 4 langkah Aldo"
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
**apa adanya di dalam container**, dengan Worker sebagai pintu depan. ~~Basis data eksternal
disambung lewat Hyperdrive (`WorkersPhp\Hyperdrive\HttpPgsqlPDO`), jadi Neon bisa dipakai.~~
**KOREKSI 29 Sep — jangan pakai jalur itu untuk aplikasi ini:** `HttpPgsqlPDO` "memakai protokol kueri
D1" lewat HTTP (tiap kueri satu panggilan). README menyatakan transaksi no-op di D1 dan **tidak
menjamin** transaksi/kunci baris di jalur Postgres — gerbang pagu akan rusak lagi. Pakai **`pdo_pgsql`
langsung dari container ke Neon**: dokumen Cloudflare, lalu lintas keluar di port selain 80/443 tidak
dicegat dan lolos bila `enableInternet = true` (bawaan). [Likely — uji balapan wajib diulang setelah
deploy.] Lihat bagian "Langkah berikut: deploy Cloudflare".
Dua syarat yang harus disebut lebih dulu: **Workers plan berbayar** (Containers tidak ada di free),
dan `workers-php` **dikelola komunitas, bukan resmi Cloudflare maupun Laravel** — risiko nyata untuk
sistem pemerintah. Caveat README-nya: migrasi jalan saat container boot lewat HTTP (jaga tetap
kecil), dan satu instance container = satu pohon proses PHP.

**Belum diputuskan:** apakah data anggaran Kemlu boleh berada di region luar negeri.

## 26 Sep 2026 — project Neon baru dibuat, 10 migrasi LOLOS di Postgres 17

Aldo menyetujui, project dibuat: **`sigap-bup`, id `rapid-lab-46810989`, org AIgnited,
region `aws-ap-southeast-1` (Singapura), Postgres 17**, database `neondb`, endpoint pooler mati.
Ini membereskan tiga hal sekaligus dibanding project lama: region, scope org, dan versi Postgres.

**Penyebab blocker `pdo_pgsql` sudah PASTI: libpq 16 tidak bisa bicara dengan server Postgres 18.**
Dibuktikan lewat pembanding terkendali — mesin sama, libpq 16.14 sama, skrip probe sama:

| Target | Hasil |
|---|---|
| project lama, **PG18**, us-east-2 | 5 dari 5 varian DSN gagal, `SSL SYSCALL error: Connection reset by peer` |
| project baru, **PG17**, ap-southeast-1 | varian `host + sslmode=require` **OK**, server `PostgreSQL 17.11` |

Jadi bukan firewall, bukan pooler, bukan kredensial. **Kalau membuat project Neon untuk dipakai dari
PHP di mesin ini, pilih Postgres 17.** Varian `options=endpoint%3D...` dan `sslmode=verify-full`
tetap gagal di PG17 juga — jangan dipakai, `sslmode=require` saja.

**Migrasi lolos semua tanpa satu pun perubahan kode.** `php artisan migrate` menjalankan 10 migrasi,
27 tabel, semua DONE. `config/database.php` sudah punya koneksi `pgsql` dengan
`'url' => env('DB_URL')`, jadi tidak perlu menulis kredensial ke `.env`:

```bash
# URI diambil saat jalan, tidak pernah mendarat di disk
cd ~/Herd/sigap-bup
~/brain/bin/envdb.sh run NEON_API_KEY -- bash -c '
URI=$(curl -s -H "Authorization: Bearer $NEON_API_KEY" \
  "https://console.neon.tech/api/v2/projects/rapid-lab-46810989/connection_uri?database_name=neondb&role_name=neondb_owner&pooled=false" \
  | python -c "import sys,json;print(json.load(sys.stdin)[\"uri\"])")
DB_CONNECTION=pgsql DB_URL="$URI" DB_SSLMODE=require php artisan migrate --force'
```

Pola itu layak ditiru untuk perintah artisan lain terhadap Neon.

### Sempat rusak 26 Sep 2026 — sudah pulih

Rotasi kunci Neon dan penempatan project ini sempat bertabrakan. Kunci `env.db` di-scope ke org
**Rivaldo** supaya tidak melihat org pihak ketiga, sedangkan project ini ada di org **AIgnited**.
Hasilnya `GET /projects/rapid-lab-46810989` dan `.../connection_uri` sama-sama HTTP 404.

404, bukan 403 — Neon menyembunyikan keberadaan resource di luar scope kunci. **Jangan salah baca
404 ini sebagai project terhapus.**

**Pulih 26 Sep 2026:** `NEON_API_KEY` sekarang kunci org **AIgnited** (id 3367030). Diuji ulang
13:01Z: project, branch `main`, dan `connection_uri` semuanya 200, jadi pola di atas jalan lagi. Org
Rivaldo dan org pihak ketiga ditolak 404.

Yang tetap berlaku:

- **Kunci mengikuti pekerjaan, bukan sebaliknya.** **Jangan** memindahkan `sigap-bup` ke org
  Rivaldo untuk mengakali masalah kunci. Itu mengembalikan pekerjaan Kemlu ke scope pribadi dan
  melanggar absolut isolasi scope.
- **Pola di atas tidak punya pengaman.** Kalau kuncinya tidak menjangkau project, `python` gagal,
  `URI` kosong, dan `artisan migrate` **tetap jalan** dengan `DB_URL` kosong. Kalau pola ini
  tiba-tiba gagal, cek kuncinya dulu lewat [[reference-neon-account]].

**Berhenti di sini (Aldo bilang pause).** Yang belum dikerjakan, urut prioritas:
1. **Seed.** ~~`database/data/` tidak ada, jadi seed butuh xlsx diimpor ulang dulu~~ — **KOREKSI 27 Sep:
   salah alamat.** `WasditSeeder` membaca `database/seeders/data/*.json`, dan folder itu **ada** (12 JSON,
   15 Jul 2026). Seed bisa jalan tanpa xlsx. Soal xlsx baru: lihat bagian 27 Sep.
2. **`setval()` semua sequence** setelah seed, kalau seed memasukkan id eksplisit.
3. **Jalankan 140 tes Pest terhadap Postgres.** `phpunit.xml` memaku `DB_CONNECTION=sqlite` tanpa
   `force="true"`, jadi env var dari luar seharusnya menang. Pakai **branch Neon terpisah** untuk
   tes — `RefreshDatabase` akan mengosongkan database yang ditunjuk.
4. **13 raw SQL + 9 `groupBy`** belum diuji dengan data; baru bisa dibuktikan setelah seed.
5. ~~Aldo menulis `NEON_DATABASE_URL` baru ke `env.db`~~ — **SELESAI 26 Sep**, diuji ulang 27 Sep:
   PG 17.11, 28 tabel, hanya `migrations` berisi (10 baris).

## 27 Sep 2026 — git terpasang, 5 bug Postgres diperbaiki (`8dfd123`), gerbang pagu terbukti terkunci

**Git.** `C:\Users\rivsy\Herd\sigap-bup\.git` (mesin Windows ini), branch `main`, baseline `97d1861`
saat 140/140 hijau. `.gitignore` kini mengabaikan `database/seeders/data/` (data asli: 16 digit nomor
KKP, nama penerima, ±1.300 tautan Google Drive) dan `*.jar` (cookie sesi curl). Path pribadi dibuang
dari README dan `scripts/import-wasdit.mjs`; skrip itu kini **wajib** diberi path xlsx.

**xlsx baru.** `C:\Users\rivsy\Downloads\Wasdit BUM 2026.xlsx` bertanggal 27 Sep 2026 adalah **versi
lebih baru** dari sumber JSON Juli: 61 sheet (dulu 60), PAGU DIPA Rp 360.045.093.000 (dulu
350.607.991.000), realisasi Rp 270.850.062.085 (dulu 160.823.589.841). ~~⚠ OPEN: butuh izin SheetJS~~ —
**SELESAI 27 Sep**: Aldo mengizinkan, xlsx sudah diekstrak. Lihat bagian "27 Sep (lanjutan)" di bawah.

**Uji Postgres tanpa data asli** — alat di `C:\Users\rivsy\dev\kemlu\sigap-pg-probe\` (mesin ini,
README di sana). Caranya: branch Neon buangan dari `main`, seed **sintetis** (tolak-semua, lihat
[[feedback_synthetic_data_deny_all]]), lalu props Inertia 30 layar × 5 peran + 10 ekspor CSV
dibandingkan antara SQLite dan Postgres. **Enam** file tes menyemai data Wasdit asli: `AdminTest`,
`EksekutifTest`, `LaporanTest`, `LayarTest`, `PemaketanTest`, `TopbarTest` (26 tes). **Sejak `01863c4`
seluruh tes memakai seed dummy** (`phpunit.xml` mengunci `SIGAP_SEED=dummy`), jadi ke-140 tes boleh ke
Neon lewat `run_pg.sh semua`. Mode `run_pg.sh suite` (grep-pengecualian) hanya relevan bila suatu saat
tes dijalankan dengan `SIGAP_SEED=asli` — jangan pernah ke basis data luar.

Bug migrasi yang ditemukan dan diperbaiki — commit **`8dfd123`** di atas baseline:
1. **`VARCHAR(255)`** — SQLite tidak menegakkan panjang, Postgres menolak (`SQLSTATE 22001`). Data
   asli: `permintaan_bayar.kanal` 329, `permintaan_bayar.link_dokumen` 621. **Seed asli pasti gagal di
   Neon tanpa perbaikan ini.** Migrasi `2026_09_27_000001_widen_spreadsheet_text_columns` mengubah 8
   kolom teks spreadsheet ke `TEXT`. Terbukti: seed sintetis dengan panjang yang sama masuk Postgres.
2. **Urutan `NULL`** — Postgres menaruh `NULL` di akhir untuk `ASC` dan di awal untuk `DESC`, SQLite
   kebalikannya. Di Karwas, `limit 120` memilih baris yang berbeda, dan permintaan tanpa tanggal naik
   ke atas. Tujuh `orderBy('tanggal')` kini `orderByRaw('tanggal desc nulls last')` atau
   `'tanggal asc nulls first'` ditambah `id` sebagai pemecah seri.
3. **Tipe** — `sum(bigint)` di Postgres bertipe `numeric`, jadi PHP menerima string.
   `pembagian.sheetPagu` di-cast ke int. Tidak ada beda tipe lain di 150 layar yang diuji.
4. **`LIKE` peka huruf** di Postgres — `'%GUP%'` di Karwas kini `lower(keterangan) like '%gup%'`,
   mengikuti pola `PenyediaController`. Data Juli aman (25/25 huruf besar).
5. **Cache seeder `static`** — `WasditSeeder::resolveMak()` menyimpan id MAK di variabel `static` yang
   bertahan antar-seed dalam satu proses. Di SQLite rollback ikut memundurkan autoincrement, jadi id
   lama kebetulan tetap benar. Sequence Postgres tidak ikut di-rollback, jadi seed kedua memakai id basi
   → pelanggaran foreign key. Ini akan menggagalkan 26 tes Wasdit di Postgres. Kini properti instance;
   terbukti dengan seed sintetis dua kali (min id putaran 2 = 129, 547 relasi utuh).

**Hasil terverifikasi setelah `8dfd123`:**
- SQLite: 140/140.
- Postgres 17.11: 114/114 tes tanpa data asli; 150 layar×peran + 10 ekspor CSV **identik** dengan
  SQLite (SHAPE/VALUE/ORDER/TYPE = 0). Tidak ada error `GROUP BY` atau fungsi; 13 raw SQL dan 9
  `groupBy` yang dikhawatirkan 26 Sep lolos semua.
- **Gerbang pagu terbukti terkunci**: dua proses PHP bersamaan memanggil `buatKomitmen()` (pagu 1 jt,
  masing-masing 600 rb). Tiga ronde, tiap ronde tepat satu lolos, `komitmen_aktif` = 600 rb, dan yang
  kalah ±50 ms lebih lambat (menunggu kunci baris). Ini pertama kalinya `lockForUpdate` benar-benar aktif.
- Neon `main` masih 10 migrasi. Jalankan `migrate` (migrasi ke-11) tepat sebelum seed.
- Latensi ke Singapura: ±2–3 detik per tes Pest, 114 tes ±5 menit. Seed penuh ±2,5 menit.

**Insiden data, 27 Sep — dua kali, keduanya salah agent.**
1. Generator sintetis pertama meneruskan kolom `kanal` (teks bebas berisi nama penerima + nominal).
   Satu baris terkirim ke branch sandbox; INSERT gagal; pesan error mencetak isinya ke transkrip.
2. Daftar pengecualian tes ditulis tangan dari keluaran `grep | head -40` yang terpotong diam-diam, jadi
   `TopbarTest` ikut jalan ke branch sandbox. Data Juli asli (MAK, nama PPK, satu baris permintaan)
   masuk di dalam transaksi yang di-rollback, dan pesan error foreign key mencetak satu baris asli ke
   transkrip — termasuk nama penerima dan **dua tautan Google Drive** milik permintaan `UP-2026-0001`.
Kedua branch dihapus (HTTP 200), log lokal yang memuat baris itu dihapus. Yang tidak bisa ditarik:
transkrip sesi. ⚠ OPEN: Aldo sebaiknya mengecek setelan berbagi dua berkas Drive milik `UP-2026-0001`.
Aturannya: [[feedback_synthetic_data_deny_all]].

~~⚠ OPEN: data asli Kemlu boleh ke Neon `aws-ap-southeast-1`?~~ — **DIPUTUSKAN Aldo 27 Sep 2026:
"gunakan data dummy yang mendekati data real, samarkan entitas Kemlu".** Jadi Neon (dan basis data luar
negeri mana pun, termasuk deploy Cloudflare nanti) **hanya berisi dummy**; data asli tetap lokal.
Latar: PP 71/2019 Pasal 20 ayat (2) mewajibkan PSE Lingkup Publik mengelola/memproses/menyimpan data di
wilayah Indonesia, dan Neon tidak punya region Indonesia (8 region AWS, terdekat Singapura — dicek 27 Sep).

## 27 Sep 2026 (lanjutan) — seed dummy bawaan (`01863c4`), xlsx 27 Sep diekstrak

**Ekstraksi xlsx 27 Sep** (SheetJS 0.20.3 dari `cdn.sheetjs.com`, kini devDependency): 131 MAK, 830
permintaan, 46 alokasi, 34 SPP, 5 KKP, 5 kontrak. Awalnya Σ pagu kurang Rp 9.199.175.000 dari SUMMARY:
sheet `6023.EBB.951.052.A` punya kolom baru berjudul **`(532111) RM`** (format kurung terbalik) yang
tidak dikenali regex. Diperbaiki; akun dengan sumber dana kedua mendapat kode berakhiran **`-RM`**
(`…052.A.532111-RM`, `…971.054.A.533121-RM`) supaya `kode` tetap unik. Σ pagu kini sama persis dengan
SUMMARY. JSON Juli diarsipkan di `C:\Users\rivsy\Herd\sigap-bup\storage\app\private\wasdit-2026-07\`
(mesin ini, tidak dilacak git). Sembilan sheet tidak diekstrak (mis. "Daftar Pengembalian Belanja",
"Pemaketan Pekerjaan", "Timeline Pengadaan") — memang belum pernah dipakai seeder.

**Seed dummy** — `scripts/generate-dummy.mjs` → `database/seeders/dummy/` (dilacak git, 891 KB):
- Dipertahankan: jumlah baris, kode anggaran (`6023.EBA.994…`, KRO/RO/akun standar), tanggal, token
  kategori (bank, status, jenis). Nominal diacak ±15% (Σ pagu dummy Rp 356,6 M vs asli Rp 360,0 M).
- Disamarkan: 384 orang (nama Indonesia palsu yang konsisten per orang; PPK dipetakan per kata pertama
  karena seeder mencocokkan PPK lewat kata pertama), penyedia, nomor SPTJB/SPP/SP2D/kontrak (format asli,
  unit fiktif `ADM-…`), tautan (`drive.example.com`), kartu KKP (`4000…`), billing, satker `000001`,
  DIPA `SP DIPA-000.01.1.000001/2026`, semua uraian (templat per akun), admin `admin@sigap.test`,
  lokasi `PaketSeeder`.
- Tolak-semua dengan bukti: generator berhenti bila ada string yang bukan buatannya/validator, atau
  sama dengan nilai asli. Cek independen: 0 dari 266 nama lengkap asli, 0 kata entitas. Deterministik.
- `config/sigap.php` + `SIGAP_SEED` (`dummy` bawaan, `asli` hanya lokal). Tes membandingkan total dengan
  `WasditSeeder::ringkasan()` set aktif. SQLite 140/140 untuk kedua set.
- **Kode `6023` sengaja tidak disamarkan**: KRO/RO/akun adalah kode standar nasional, dan `6023` tertanam
  di frontend (`rkakl.tsx`), seeder, dan 12 file tes. ⚠ OPEN: samarkan juga bila Aldo mau.
- ~~Branding UI tetap Kemlu~~ — **SELESAI 29 Sep** (`f5bbeeb`), lihat bagian 29 Sep di bawah.

**Yang tertahan pengaman mode otomatis (bukan keputusan Aldo):**
- ~~Seed dummy ke Neon `main` ditolak sebagai "Production Deploy"~~ — **SELESAI 29 Sep**: setelah Aldo
  memberi instruksi eksplisit ("isi dengan data seperti realisasi…"), perintah yang sama diizinkan.
- Suite 140 tes (dummy) ke Postgres **belum punya hasil**. Run pertama (27 Sep, branch sandbox
  `br-floral-sun-b3ad4k5k`): menunggu/membaca hasilnya ditolak pengaman ("Modify Shared Resources"), lalu
  Claude Code **menghentikan run itu karena memori sistem hampir habis** (RAM bebas 3,8 dari 31,3 GB) —
  bukan kegagalan tes. Proses PHP yatimnya dihentikan, branch dihapus (HTTP 200). ⚠ OPEN: jalankan ulang
  `run_pg.sh semua` hanya bila Aldo meminta, saat memori longgar.
- `C:\Users\rivsy\.git`: Aldo mengizinkan hapus, pengaman menolak ("Irreversible Local Destruction");
  ganti nama gagal karena file dikunci proses lain. Lihat [[reference_stray_git_home]].

**Insiden 3 (kecil):** masker bentuk hanya menyamarkan huruf Latin, jadi satu nama depan beraksara Arab
di kolom `pic` tercetak ke transkrip. Aturan diperbarui: masker wajib mencakup semua aksara.

## 29 Sep 2026 — identitas netral (`f5bbeeb`), Neon `main` terisi dummy

**Keputusan Aldo:** "isi dengan data seperti realisasi, samarkan identitas Kemlu, hanya penamaan SIGAP BUP
= Sistem Informasi Government Analysis Planning Biro Umum dan Pengadaan" (Aldo mengetik "Governement";
dipakai ejaan "Government"). Nama aplikasi kini **"SIGAP BUP"** (spasi, bukan tanda hubung).

**Commit `f5bbeeb`:** sidebar, kop halaman, dan cetakan BAR memakai nama itu; satker 403247 dan "Kementerian
Luar Negeri" dihapus dari UI. Modul "Logistik Diplomatik" → **"Logistik Unit Daerah"** (7 kantor wilayah:
Medan, Surabaya, Makassar, Balikpapan, Denpasar, Jayapura, Ambon; item netral) — rute `/logdip` tetap.
Bagian "AKPSP / PAKSP" tampil sebagai "Sarana & Prasarana" (kunci `AKPSP` tetap). `APP_NAME` bawaan
"SIGAP BUP". Admin seed `admin@sigap.test` untuk semua set. Nomor DIPA seed asli kini dari
`SIGAP_NOMOR_DIPA` di `.env` lokal. Fixture tes ikut netral. 140/140 SQLite, `tsc` 0 error, build OK.
Yang **sengaja tidak diubah**: kode kegiatan `6023` (lihat di atas) dan `docs/` (arsip desain Claude
Design, masih bermerek lama). ⚠ OPEN keduanya bila Aldo mau.

**Neon `main` terisi 29 Sep** (branch `br-curly-pond-b3wscbzi`): migrasi 11/11, lalu `db:seed` +
`PaketSeeder` dengan `SIGAP_SEED=dummy`. Isi: 131 MAK (Σ pagu Rp 356.600.727.500, realisasi
Rp 263.743.590.000), 830 permintaan, 42 komitmen, 10 PPK, 46 alokasi, 34 SPP, 5 KKP, 5 kontrak, 8 paket.
Diverifikasi lewat MCP baca-saja: akun hanya `admin@sigap.test`, DIPA fiktif, **0 jejak Kemlu** di
permintaan/MAK/paket/kontrak/penyedia/PPK. **Password bawaan dipertahankan — keputusan Aldo 29 Sep**
(email `admin@sigap.test`, password `password`; risiko diketahui: siapa pun yang tahu URL bisa masuk
sebagai admin dan mengubah data dummy). `.env` lokal tetap SQLite berisi data asli Juli (tidak disentuh).

### Langkah berikut: deploy Cloudflare (dicek 29 Sep 2026)

- **Workers Paid USD 5/bulan wajib** untuk Containers; termasuk 25 GiB-jam memori, 375 menit vCPU,
  200 GB-jam disk per bulan (halaman harga Cloudflare, diperbarui 28 Agu 2026).
- **Token `CLOUDFLARE_API_TOKEN` di `env.db` tidak cukup**: verify 200, daftar zona 200, tetapi akun,
  langganan, Workers, Containers, Hyperdrive semuanya **403**. Butuh token baru ber-izin tingkat akun
  (Workers Scripts Edit + Containers Edit + Account Settings Read; tambah Workers Routes/DNS bila domain
  sendiri). Cek juga `CLOUDFLARE_ACCOUNT_ID` cocok dengan akun tujuan.
- **`wrangler deploy` wajib Docker yang berjalan** di mesin deploy. Mesin ini **tanpa Docker** (juga tanpa
  `wrangler`, `gh`). Pilihan: GitHub Actions (butuh repo privat + secret) atau pasang Docker Desktop
  (berat, RAM mesin sudah sesak).
- Arsitektur yang disarankan: paket resmi `@cloudflare/containers` + Dockerfile sendiri (FrankenPHP/
  PHP 8.4 + `pdo_pgsql`), DB langsung ke Neon, tanpa `workers-php`/Hyperdrive. Neon `main` sudah
  bermigrasi dan terisi, jadi container tidak perlu migrasi saat boot.
- ~~⚠ OPEN: token baru, jalur build, URL~~ — diputuskan 29 Sep, lihat di bawah.

### Progres deploy (29 Sep 2026)

**Keputusan Aldo:** jalur build **GitHub Actions**; domain **`rivsyah.dev`** (domain pribadinya, dipilih
eksplisit di sesi — lintas scope disengaja; aplikasinya sudah tanpa identitas Kemlu). Subdomain
`sigap.rivsyah.dev` dipilih agent (asumsi, bisa diganti). Workers Paid: Aldo bertanya apakah wajib —
jawaban: wajib untuk Containers; menunggu keputusannya.

**Yang sudah ada:**
- Repo privat **`rivsyah/sigap-bup`** dibuat (HTTP 201). **Push tertahan**: `GITHUB_PAT` (classic) hanya
  scope `repo`; GitHub menolak berkas `.github/workflows/*` tanpa scope **`workflow`**. Remote `origin`
  tanpa token; token dikirim lewat header saat push, tidak tersimpan di `.git/config`.
- Commit lokal (belum di remote): `a78ff28` CI — job PostgreSQL 17 (service container) menjalankan 140
  tes; analisis tipe dan lint dibuat informatif (`continue-on-error`). `23bdbd0` persiapan deploy:
  `Dockerfile` (FrankenPHP `1-php8.4-bookworm`, `pdo_pgsql`), `.dockerignore` (tanpa data asli/`docs/`),
  `wrangler.jsonc` (container `basic`, route custom domain `sigap.rivsyah.dev`), `cloudflare/worker.ts`
  (`@cloudflare/containers`, secret `APP_KEY`/`DB_URL` lewat `envVars`), workflow `deploy` manual,
  `URL::forceScheme('https')` di produksi, `trustProxies('*')`. **Belum diuji.**
- Token Cloudflare baru **berfungsi** (akun 200, Workers 200) — tetapi hanya bila memakai ID akun yang
  benar. **`CLOUDFLARE_ACCOUNT_ID` di `env.db` salah** (tidak cocok dengan satu-satunya akun token).
  Containers menjawab 401 (dugaan: Workers Paid belum aktif). Akun belum punya subdomain `workers.dev`.
- `rivsyah.dev`: NS masih Hostinger (`*.dns-parking.com`); apex tanpa A/MX/TXT, `www` ke IP parkir —
  memindah NS ke Cloudflare nyaris tanpa risiko.

**Utang kualitas yang tercatat (lama, bukan dari migrasi):** PHPStan 161 temuan (properti magis
Eloquent), ESLint 1.123 masalah, Prettier 29 berkas, Pint beberapa berkas. ⚠ OPEN.

⚠ OPEN (Aldo) — dicek ulang 29 Sep 22.25 WIB, **belum satu pun selesai**:
1. Scope `workflow` di `GITHUB_PAT` (masih `repo` saja; branch di remote masih kosong).
2. Workers Paid. Containers menjawab 401 *"Deploying containers requires the Workers Paid plan"* — jadi
   token sudah cukup, yang kurang paketnya. [Certain]
3. `rivsyah.dev` ditambahkan ke Cloudflare + NS di Hostinger diganti. Custom domain butuh zona
   **aktif**, jadi ini wajib beres **sebelum** deploy. **Update 29 Sep ±22.45 WIB:** Aldo sudah
   menambahkan zona (Free, status `pending`); NS Cloudflare untuk akun ini = `gracie.ns.cloudflare.com` +
   `syeef.ns.cloudflare.com`. DNSSEC tidak aktif (tidak ada DS). **SELESAI 29 Sep 22.52 WIB:** NS diganti
   di Hostinger, registry `.dev` menunjuk Cloudflare dalam ±2 menit, zona **active** (`activated_on`
   15.52Z). Token bisa membaca Workers routes (zona) dan custom domains (akun), tetapi DNS records dan
   SSL 403 — wajar untuk templat "Edit Cloudflare Workers"; `activation_check` juga 403.
4. Secret repo `CLOUDFLARE_API_TOKEN` (secret & variabel repo masih kosong).
5. `CLOUDFLARE_ACCOUNT_ID` di `env.db` masih salah — **bukan pemblokir deploy** (variabel repo bisa diisi
   agent dari akun tunggal token; wrangler juga memilih akun tunggal otomatis), tetapi tetap dibetulkan
   supaya sesi lain tidak tersandung.

Urutan agent sesudahnya: push (CI jalan) → isi variabel repo `CLOUDFLARE_ACCOUNT_ID` lewat API →
`wrangler secret bulk` `APP_KEY` baru + `DB_URL` Neon dari mesin ini (tanpa Docker) → jalankan workflow
deploy → uji 26 layar + uji balapan di URL live. **Secret dulu, baru deploy**: `envVars` dibaca saat
container menyala, jadi container yang menyala tanpa `APP_KEY` akan meng-cache kunci kosong.

**Memori mesin (dicek 29 Sep):** "memori hampir habis" 27 Sep = RAM. Commit charge 68,8 dari 82,1 GB;
pemesan terbesar `explorer.exe` **10,9 GB** (tidak wajar, kemungkinan bocor — restart Explorer),
29 proses `claude` 8,8 GB, `vmmem` 4,0 GB, WebView2 3,3 GB, ChatGPT 3,0 GB, NVIDIA Overlay 2,7 GB.

### 29 Sep 2026 (sesi 2) — perbaikan pra-deploy (`c173a61`)

Sesi deploy sebelumnya (`82921e7d`) macet setelah 15.19Z — Aldo: "not responding". Sesi itu sudah
berhenti rapi di 15.16Z sambil menunggu 5 langkah di atas. Git bersih di `23bdbd0`, tidak ada kerja
hilang. Dugaan penyebab macet: RAM (bebas 4,4–5,4 dari 31,3 GB; 29 proses `claude` 8,9 GB, **27 di
antaranya dari 25–27 Sep**). [Likely] `explorer.exe` sudah pulih (0,3 GB, restart 21.40 WIB).

Commit lokal **`c173a61`** (belum di remote), semua di file deploy/CI yang belum pernah diuji:
- `tests.yml`: matriks PHP 8.3 dibuang. `composer.lock` memuat Symfony 8.1 (butuh PHP ≥ 8.4.1), jadi job
  8.3 **pasti gagal** di `composer install`. Lock cocok untuk 8.4 dan 8.5 (`composer why-not`).
  `composer.json` masih menulis `php: ^8.3` — tidak sinkron dengan lock, belum diubah.
- `deploy.yml`: `@cloudflare/containers@0.3.7` + `wrangler@4.143.0` dipaku (paket container masih 0.x).
- `Dockerfile`: direktori `storage/*`/`bootstrap/cache` dibuat eksplisit; start pakai `php artisan
  optimize` (satu proses PHP, bukan tiga). Diuji lokal dengan cache diarahkan ke scratch: config, event,
  route (93 rute), view semuanya DONE.
- `worker.ts`: tipe konstruktor `DurableObjectState<{}>` (sebelumnya error tsc; tidak memblokir deploy
  karena esbuild membuang tipe), plus `SESSION_SECURE_COOKIE=true`.

Fakta terverifikasi dari kode `wrangler` 4.143.0 dan `@cloudflare/containers` 0.3.7 (29 Sep):
- `wrangler deploy --dry-run` **menolak jalan tanpa Docker** bila ada container, kecuali
  `--containers-rollout=none`. Dengan flag itu: bundel Worker 53,7 KiB, binding DO `SIGAP`, konfigurasi
  `exports` diterima.
- `workers_dev` bawaan = `routes.length === 0`. Karena ada route, **tidak butuh subdomain workers.dev**
  (akun memang belum punya).
- `containerFetch` memakai `request.url.replace('https:', 'http:')`, jadi Host tetap `sigap.rivsyah.dev`.
  Batas siap port 20 detik (`TIMEOUT_TO_GET_PORTS_MS`).
- `wrangler secret put/bulk` pada Worker yang belum ada **membuat Worker draf** di mode non-interaktif.
  Deploy tidak pernah menghapus secret.
- Tiga SHA action (`checkout` v7.0.0, `setup-php` 2.37.2, `setup-node` v6.4.0) valid.
- Izin token untuk custom domain: referensi API "Attach Worker Domain" hanya menerima **Workers Scripts
  Write**; panduan GitHub Actions Cloudflare = templat "Edit Cloudflare Workers"; Cloudflare membuat
  rekaman DNS custom domain sendiri. Jadi 403 di `dns_records` bukan prediktor gagal. [Likely] Tambah
  Zone DNS Edit **hanya bila** deploy gagal di langkah domain. (Usul sesi lain untuk menambahnya sekarang
  tidak diikuti.) wrangler memasang domain lewat `PUT /accounts/{id}/workers/scripts/{nama}/domains/records`.

**Push ke GitHub tertahan (29 Sep ±23.15 WIB) — riwayat git memuat identitas Kemlu.** Aldo sudah
menambah scope `workflow` (22.56) dan menyimpan secret repo `CLOUDFLARE_API_TOKEN` (22.59). Sebelum push,
pindai seluruh riwayat: commit `97d1861`/`8dfd123`/`01863c4` memuat identitas di 17–18 berkas (UI, seeder,
tes, rute), dan `docs/` (arsip Claude Design, 561 KB, bermerek lama) ada di **semua** commit. Push apa
adanya melanggar keputusan Aldo "samarkan identitas Kemlu" dan absolut berkas-terlacak.
- Commit lokal **`22950a4`**: `docs/` tidak dilacak lagi (berkas tetap di disk, `.gitignore`), README tanpa
  tautan `docs/`, daftar kata penanda instansi di `scripts/generate-dummy.mjs` pindah ke
  `scripts/entitas.local.txt` (diabaikan git; generator berhenti bila tidak ada; keluaran dummy identik
  byte-per-byte, 12 berkas). Pohon HEAD: 0 identitas (sisa hanya positif palsu `TooltipTrigger`→"ptri",
  `setJenis`→"setjen", dan kata generik "luar negeri"/"perwakilan"), 0 jalur pribadi/kredensial.
- Rencana: satu commit akar bersih (`git checkout --orphan`) untuk GitHub, riwayat lama disimpan di branch
  lokal `riwayat-lokal`. **Ditolak pengaman mode otomatis** ("Irreversible Local Destruction", lalu
  "Git Destructive" bahkan untuk `git status`). Tidak dicoba jalan memutar. ⚠ OPEN (Aldo): izinkan
  eksplisit, atau jalankan sendiri. Push `main` apa adanya **jangan**.

**Pemegang deploy:** sesi `926ebddf` (disepakati dengan sesi lama "Project sigap-bup lanjutan" 29 Sep
±23.10 WIB; sesi lama tidak lagi menyentuh repo, kartu ini, maupun Cloudflare/GitHub SIGAP). `sipdln.*` +
Worker `sipdln-bup` milik sesi brain-1d. Alat baca-saja Neon main: `~/dev/kemlu/sigap-pg-probe/main_state.php`.

## Desain v2 — sudah terpasang, tidak perlu diimpor ulang

Permintaan 26 Sep 2026 untuk mengimpor `SIGAP-BUP v2.dc.html` dari proyek Claude Design
`4ce251f1-c607-477f-9851-d850d42d2a29` **sudah dikerjakan 5 Sep 2026** (lihat baris v2 di atas).
Buktinya di repo: `resources/js/lib/v2.tsx` berisi palet `#0F2557`/`#F5A80C`/`#F3F2EC`,
`resources/js/layouts/sigap-layout.tsx` 32,5 KB.

**Salinan penuh desainnya sudah ada di disk**, jadi DesignSync tidak diperlukan lagi untuk file ini:
`docs/SIGAP-BUP-v2.dc.html` **347.893 byte** (utuh) + `docs/support-v2.js` 69.150 byte.
Itu persis kenapa sesi 5 Sep menyimpannya — `get_file` memotong di 256 KiB. Baca dari `docs/`,
jangan lewat MCP.

DesignSync sendiri **sedang tidak terotorisasi** di sesi ini ("needs design-system authorization"),
jadi membandingkan dengan versi remote tidak bisa tanpa `/design-login` dari terminal Aldo — lihat
[[reference-design-login]]. Artinya: kalau desainnya berubah setelah 5 Sep, tidak ada cara
memastikannya dari sesi ini.
