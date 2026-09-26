---
name: reference-neon-account
description: "Akun Neon Postgres milik Aldo — tiga organisasi (satu milik pihak ketiga), project SIGAP yang dituju NEON_DATABASE_URL, dan tiga jebakan: branch production, region us-east-2, project kembar"
metadata:
  node_type: memory
  type: reference
---

# Neon Postgres — apa yang sebenarnya ada di akun itu

Dipetakan 22 Sep 2026 lewat REST API, setelah `NEON_API_KEY` dan `NEON_DATABASE_URL` masuk ke
`~/brain/env.db`. Lihat [[aldo-starter install]] untuk daftar kunci yang terpasang.

**Akun:** `rivsyah@gmail.com` — cocok dengan aturan identitas, tidak ada alamat lain. Paket `free`.
Diverifikasi hidup dengan `GET /api/v2/users/me` → HTTP 200.

## Tiga organisasi, dan satu di antaranya bukan milik Aldo

`GET /api/v2/users/me/organizations` mengembalikan tiga org. ID-nya sengaja tidak ditulis di sini
(berkas terlacak ditulis seolah publik) — ambil ulang dengan satu panggilan itu.

| Org | Isi per 22 Sep 2026 |
|---|---|
| **AIgnited** | kosong per 22 Sep; **sejak 26 Sep berisi `sigap-bup`** (`rapid-lab-46810989`, `aws-ap-southeast-1`, PG17) |
| **Rivaldo** (pribadi) | **KOSONG sejak 26 Sep 2026.** Dua kembar `SIGAP` di `us-east-2` dihapus setelah diverifikasi nol tabel |
| **M. Dedi** | project `bei` di `aws-ap-southeast-1` — **milik pihak ketiga** |

**HARD — kunci ber-scope akun melihat org Dedi.** Satu API key akun memberi akses ke ketiga org.
Setiap skrip yang memakai `NEON_API_KEY` **wajib menyebut `org_id` atau `project_id` secara
eksplisit**. Jangan pernah menjalankan operasi yang "daftar semua project lalu kerjakan semuanya" —
itu akan menyentuh basis data orang lain. Ini kasus nyata dari absolut isolasi scope.

**Ada jalan teknis, bukan cuma disiplin (ditemukan 26 Sep 2026).** `neon api-keys create` menerima
`--org-id` dan `--project-id`. Kunci ber-scope org atau project secara **struktural** tidak bisa
menyentuh org lain — batasnya ikut di kredensialnya, bukan bergantung pada tiap skrip berkelakuan
benar. Aturan "wajib sebut org_id" di atas adalah kontrol disiplin dan tetap berlaku selama masih ada
kunci akun; ganti kuncinya dan aturan itu jadi otomatis. Bonus: jebakan `GET /api/v2/projects` →
HTTP 400 `org_id is required` di bawah ikut hilang.

Untuk kerja sehari-hari pilih **org-scoped**, bukan project-scoped. Kunci project-scoped tidak bisa
membuat project, dan kamu masih mungkin perlu bikin project baru di `aws-ap-southeast-1` (lihat
jebakan region di bawah).

**Status kunci per 26 Sep 2026, ±12:50Z — rotasi SELESAI.**

**Tidak ada lagi kunci ber-scope akun.** `neon api-keys list` menjawab *"You have no account API
keys."* Sejak itu tidak ada satu pun API key yang bisa menyentuh org Dedi. Absolut isolasi scope
sekarang dijaga kredensialnya sendiri, bukan disiplin pemanggil.

| Kunci | Scope | Di mana | Status |
|---|---|---|---|
| `AIgnited`, id 3367030 | org AIgnited, semua project | `env.db` → `NEON_API_KEY` | **aktif, ini yang dipakai** |
| id 3367047 | project `rapid-lab-46810989`, read-only | `~/.claude.json` (MCP) | aktif |
| `bara-rivaldo`, id 3366980 | org Rivaldo, semua project | sudah tidak dipakai | **yatim, belum dicabut** — org Rivaldo kini kosong, jadi kunci ini tidak menjangkau apa pun. Sampah, bukan risiko |
| `Bara`, id 3356477 | akun | — | dicabut 26 Sep 2026 |
| id 3356515 (MCP pertama) | akun | — | dicabut 26 Sep 2026 |
| id 3366951 (MCP kedua) | project `tiny-pine-06410895` | — | dicabut 26 Sep 2026; pin-nya ke project mati |

Kunci `env.db` diverifikasi: `auth_method: api_key_org`, hanya org `AIgnited` terlihat,
`GET /api/v2/projects/rapid-lab-46810989` → **200**. Diuji ulang 13:01Z: branch `main` dan
`connection_uri` juga 200; org Rivaldo, org Dedi, dan kembar `tiny-pine-06410895` ditolak 404.

**Perilaku kunci org, terbukti lewat pengujian 26 Sep 2026** — ini yang durabel, bukan id kuncinya:

| Uji | Hasil |
|---|---|
| `GET /api/v2/auth` | 200, `auth_method: api_key_org` — cara aman mengecek jenis kunci tanpa mencetaknya |
| `GET /api/v2/projects` tanpa `org_id` | 200, hanya project org kunci itu — **tidak** 400 seperti kunci akun |
| `GET /api/v2/projects?org_id=<org lain>` | **404** `not allowed to perform this action on the organization` |
| `GET /api/v2/users/me/organizations` | 200, hanya org kunci itu |
| `GET /api/v2/projects/<project org lain>` | **404** `project not found` |
| `GET /api/v2/users/me` | **404** — bukan tanda kunci mati |

**Pelajaran yang mahal: scope kunci harus mengikuti org project, bukan org pemiliknya.** Kunci
`bara-rivaldo` dibuat untuk org Rivaldo karena di situlah project pertama dibuat. Lalu project live
pindah ke org **AIgnited**, dan kunci itu langsung jadi tidak berguna — 404 untuk project yang
dipakai. Sebelum mencetak kunci, pastikan dulu project mana yang benar-benar dipakai dan di org mana
ia duduk.

Tiga hal yang berlaku untuk kunci org apa pun:

- Penolakan lintas org datang sebagai **404, bukan 403**. Jangan baca 404 itu sebagai "tidak ada".
- `GET /api/v2/users/me` menjawab **404** untuk kunci org. Itu bukan tanda kunci mati. Cek jenis
  kunci tanpa mencetaknya lewat `GET /api/v2/auth` → `auth_method`.
- **Login CLI `neon` (OAuth) tetap ber-scope akun** dan masih melihat ketiga org. Aturan HARD
  "wajib sebut `org_id`" di atas tetap berlaku untuk setiap perintah `neon`, walau kunci `env.db`
  sudah sempit.

**Urutan rotasi kunci `env.db`** (dipakai 26 Sep 2026, pakai lagi untuk rotasi berikutnya):

1. `neon api-keys create --name <nama> --org-id <org>` atau `--project-id <project>` — kunci tampil
   sekali, salin.
2. `~/brain/bin/envdb-setup.sh NEON_API_KEY` → jawab `y` → tempel. **Nama kuncinya wajib disebut.**
   Tanpa argumen, skrip itu hanya menanyakan kunci yang *belum* ada, jadi `NEON_API_KEY` yang sudah
   terisi dilewati tanpa pesan.
3. Verifikasi dari sesi agent dengan uji di tabel atas. Hanya kode HTTP yang dicetak, kuncinya tidak.
4. Cabut kunci lama. Kunci akun: `neon api-keys revoke <id>`. Kunci org atau project: tambah
   `--org-id <org>`.

Cabut **terakhir**, bukan kedua. Kalau kunci baru salah tempel, kunci lama masih hidup dan tidak ada
yang putus. Urutan lama (buat → cabut → simpan) bisa meninggalkan `env.db` berisi kunci mati.

Langkah 1 dan 2 **di terminal Aldo sendiri**, jangan di sesi agent — termasuk bukan lewat prefiks `!`
— karena apa pun yang diketik atau dicetak di sesi masuk transkrip. Org id: `neon orgs list`, sengaja
tidak ditulis di sini.

Detail jebakan CLI-nya ada di [[reference-neon-cli]].

Catatan API: `GET /api/v2/projects` **tanpa** `org_id` menjawab HTTP 400 `org_id is required`,
bukan 401. Jangan salah baca 400 itu sebagai kunci mati — kuncinya hidup, parameternya yang kurang.

## Ke mana NEON_DATABASE_URL menunjuk

**BASI per 26 Sep 2026 ±12:50Z — belum diperbaiki.** `NEON_API_KEY` sudah pindah ke org AIgnited,
tapi `NEON_DATABASE_URL` **masih menunjuk project mati**: region `us-east-2`, dan masih memakai host
`-pooler` yang terbukti gugur di mesin ini (lihat jebakan 1 di bawah). Diverifikasi dengan membaca
hanya bagian region dan host, tanpa mencetak kredensialnya.

Host-nya `ep-mute-mode-b5v29wg9-pooler`, `us-east-2` — endpoint milik `tiny-pine-06410895`.

**Sejak 13:1xZ project itu DIHAPUS, jadi URL-nya sekarang mati total.** Ini justru perbaikan: sampai
13:01Z URL lama masih menjawab 200 lewat SQL-over-HTTP (PG 18.6, 0 tabel), artinya klien yang
menyambung tidak dapat error sama sekali — ia hanya mendarat di database kosong dan mengira berhasil.
Sekarang kegagalannya berisik, bukan diam. **Gagal keras lebih baik daripada benar yang salah.**

Akibatnya kunci dan connection string tidak sepadan: kuncinya melihat `sigap-bup`, URL-nya menunjuk
project yang sudah tidak ada. Perbaiki lewat `envdb-setup.sh NEON_DATABASE_URL` di terminal Aldo
sendiri.

**Penyebab kenapa ini terlewat:** `envdb-setup.sh` **tanpa argumen** hanya menanyakan kunci yang
belum ada. `NEON_DATABASE_URL` sudah terisi, jadi dilewati tanpa pesan sama sekali. Rotasi kunci yang
sudah ada **wajib menyebut namanya**: `envdb-setup.sh NEON_DATABASE_URL`.

**Target yang benar:** project `sigap-bup` (`rapid-lab-46810989`), org **AIgnited**,
`aws-ap-southeast-1`, **Postgres 17**, branch default bernama **`main`** (`br-curly-pond-b3wscbzi`) —
**bukan `production`**. Skrip apa pun yang menyebut branch `production` akan gagal di project ini.
Ambil connection string dengan `neon connection-string main --project-id rapid-lab-46810989`, dan
**buang `-pooler`** dari host kalau ada. `--pooled` bawaannya `false` (dicek di `--help` v5.0.1),
jadi hasil bawaan perintah itu memang sudah tanpa `-pooler`.

Membuang `-pooler` itu wajib, bukan kehati-hatian: endpoint project baru `ep-holy-morning-b3x0zp4r`
juga **`pooler_enabled: false`** (diverifikasi 26 Sep 2026 lewat
`GET /api/v2/projects/<id>/endpoints`). Sama seperti project lama. Host `-pooler` di project ini akan
gagal dengan `SSL SYSCALL error: Connection reset by peer`, dan errornya menyesatkan — kelihatan
seperti masalah TLS atau firewall, padahal poolernya memang mati.

### Sejarah — project lama yang SUDAH DIHAPUS

Yang di bawah ini menggambarkan project `SIGAP` di org **Rivaldo**: branch **`production`**, region
`aws-us-east-2`, **Postgres 18**, basis data `neondb`. **Project itu dan kembarannya dihapus
26 Sep 2026** — keduanya diverifikasi nol tabel lewat `information_schema.tables` sesaat sebelum
dihapus. Bagian ini disimpan karena jebakan-jebakannya masih mengajarkan sesuatu, bukan karena
project-nya masih ada.

**Satu koreksi metode, dari penghapusan ini.** Kartu ini sempat menyatakan kedua kembar
`active_time_seconds: 0`, jadi "belum pernah melayani query". Saat dicek ulang 26 Sep,
`tiny-pine-06410895` ternyata sudah 1084 detik compute dan 275 detik CPU — aktivitas inspeksi agent
sendiri, bukan data. Angka itu bergerak, jadi **jangan pakai `active_time_seconds` sebagai bukti
kosong**. Yang memutuskan hanya `select count(*) from information_schema.tables where
table_schema='public'`. Ukuran storage juga tidak memutuskan: keduanya tetap 31,7 MB baseline
walau salah satunya pernah aktif.

**Database itu KOSONG — nol tabel di skema `public`.** Diverifikasi 22 Sep 2026 lewat
`information_schema.tables`, hasilnya `rowCount: 0`, dan dikonfirmasi ulang 26 Sep sesaat sebelum
dihapus. Angka `synthetic_storage_size` 31,7 MB itu **katalog sistem Postgres saja**, bukan data.
Jangan pernah membaca ukuran storage Neon sebagai bukti ada isinya — untuk project kosong angkanya
memang ±30 MB, dan angka itu tidak berubah walau compute-nya sudah dipakai.

**Empat hal yang harus diperlakukan sebagai jebakan:**

1. **HARD — `pdo_pgsql` di mesin ini TIDAK BISA menyambung ke endpoint ini lewat TCP 5432.**
   Lima varian DSN diuji, semuanya `SQLSTATE[08006] ... SSL SYSCALL error: Connection reset by peer`:
   pooler+require, pooler+`options=endpoint`, host langsung+require, host langsung+`options=endpoint`,
   dan verify-full. TCP 5432 sendiri terbuka (diuji `/dev/tcp`), jadi bukan firewall.
   Dua penyebab yang terbukti:
   - **Pooler dimatikan** di endpoint (`pooler_enabled: false`) padahal `NEON_DATABASE_URL` memakai
     host `-pooler`. Tiga varian gugur hanya karena ini.
   - **libpq klien 16.14 vs server Postgres 18.** Herd PHP 8.4.23 membawa libpq 16; varian host
     langsung pun tetap direset.

   **Yang BERHASIL: SQL over HTTP.** `POST https://<endpoint-tanpa-pooler>/sql` dengan header
   `Neon-Connection-String: <url>` menjawab normal, termasuk mengembalikan error parser Postgres
   untuk query yang salah — bukti kredensialnya benar dan basis datanya hidup. Pakai jalur ini
   untuk inspeksi. Tapi `php artisan migrate` **butuh** PDO/TCP, jadi jalur HTTP tidak
   menyelamatkan migrasi.
2. **String koneksi mengarah ke `production`, bukan branch pengembangan.** Selama masih kosong ini
   tidak berbahaya. Begitu ada data, setiap migrasi atau seed dengan URL apa adanya langsung
   mengenai data hidup. Buat branch dev (copy-on-write, hitungan detik) dan simpan URL branch itu.
3. **Region `aws-us-east-2` (Ohio) salah untuk pengguna Indonesia.** Neon punya
   `aws-ap-southeast-1` (Singapura). **Region tidak bisa diubah setelah project dibuat** — satu-satunya
   jalan adalah project baru. Selama database masih kosong, pindah itu gratis.
4. ~~**Ada dua project bernama `SIGAP`.**~~ **SELESAI 26 Sep 2026** — keduanya dihapus atas perintah
   Aldo setelah diverifikasi nol tabel. Aturannya tetap berlaku untuk project berikutnya:
   **penghapusan project Neon tidak bisa dibatalkan, jadi jangan hapus tanpa perintah Aldo.**
   `neon projects delete <id>` **langsung jalan tanpa konfirmasi** — tidak ada prompt, tidak ada
   flag `--force`. Satu perintah salah ketik langsung menghapus.

## Untuk apa project ini

Aldo memutuskan 22 Sep 2026: **SIGAP-BUP pindah ke Neon Postgres, lalu live di Cloudflare.**
Rinciannya, termasuk kenapa D1 tidak boleh dipakai untuk aplikasi ini, ada di [[project-sigap-bup]].
