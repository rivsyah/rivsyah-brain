---
name: project-bup-kemlu
description: "Portal Biro Umum dan Pengadaan Kemlu — Next.js 16 di Herd\\bup-kemlu-next (target Vercel), plus app Laravel yang diparkir di Herd\\bup-kemlu"
metadata: 
  node_type: memory
  type: project
  originSessionId: 4aaff287-30ab-4924-99b7-3024a5cf00b3
  modified: 2026-10-17
---

Situs publik + Portal Internal + Panel Admin Biro Umum dan Pengadaan (BUP), Sekretariat
Jenderal Kemlu. Diimpor dari Claude Design `Biro Umum dan Pengadaan.dc.html` pada 6 Sep 2026.

**Dua folder, satu proyek:**
- `Herd\bup-kemlu-next` — **deliverable aktif**. Next.js 16 App Router + Prisma 7 +
  PostgreSQL + Tailwind 4, ditujukan ke Vercel.
- `Herd\bup-kemlu` — app Laravel 13 + Blade yang dibangun lebih dulu di sesi yang sama,
  lalu **diparkir** (backend lengkap, view ±70%) ketika arah berubah ke Next.js/Vercel di
  tengah pengerjaan. Tidak dihapus; abaikan kecuali diminta.

**Yang khas dan mudah terlupa:**
- Prisma 7 memindahkan `url`/`directUrl` dari `schema.prisma` ke `prisma.config.ts`, dan
  `PrismaClient` **wajib** memakai driver adapter (`@prisma/adapter-pg` + `pg.Pool`).
  `prisma@latest` di npm sempat menunjuk 8.0.0-rc; CLI dipin ke 7.10.0 agar cocok dengan client.
- Basis data lokal dijalankan `npx prisma dev -d -n <nama>`. Rapuh: `npm run build`
  (15 worker) memutus koneksinya (`P1017`) dan harus di-restart + migrate + seed ulang.
- Portret pejabat diambil dari Claude Design lewat `DesignSync get_file`, tetapi respons
  dipotong pada 256 KiB. 3 dari 6 foto terpotong dan diselamatkan dengan crop PIL ke bagian
  yang masih ter-decode. Foto hero (`_J4A8165`) hanya 6% valid → tidak dipakai; latar hero
  memakai anyaman CSS dan gambar asli harus diunggah lewat Panel Admin → Pengaturan Situs.
- Semua route sengaja dinamis (`force-dynamic` pada sitemap/feed) supaya build tidak
  bergantung pada ketersediaan basis data.

**Broker SSO** (`docs/SSO.md`): Portal menerbitkan token `payload.signature` HMAC-SHA256,
TTL 60 detik, `jti` sekali pakai yang ditukar lewat `POST /api/sso/verify`. Tujuan:
SIGAP-BUP saja (31 Okt: SIPAMA, MONPBJP, VMS dihapus atas perintah Aldo — "ga ada lagi") — consumer di sisi aplikasi
itu **belum dipasang**. Endpoint acuan `/api/sso/demo` (aktif hanya bila `SSO_DEMO=1`).

Panel Admin digerakkan deskriptor di `src/lib/admin/resources.ts` — tambah satu entri,
CRUD lengkap ikut otomatis.

Terkait: [[project-sigap-bup]], [[project-sipama-kemlu]], [[project-ukpbj-kemlu]],
[[project-pdp-kemlu]], [[reference-design-login]]

## 17 Okt 2026 — audit + pengerasan (belum di-commit, belum live)
- Next 16.3.4 → **16.4.2** (critical: RCE di `next/og`), Prisma/client/adapter-pg → **7.10.1**,
  `npm audit fix` → 0 kerentanan produksi. Typecheck + lint bersih.
- Ditambah tabel `RateLimit` (migrasi `20261017000000_rate_limit`): login 10/mnt/IP + 5/15mnt/akun,
  formulir publik 5/10mnt/IP + honeypot, `/api/sso/verify` 60/mnt/IP. Teruji: login ke-6 diblokir.
- Seed: akun demo per peran hanya bila `SEED_DEMO_USERS=1`, kata sandi acak (dulu tetap
  `BiroUmum2026!`); seed produksi gagal bila `SEED_ADMIN_PASSWORD` kosong.
- Situs `noindex` + `robots.txt Disallow: /` sampai `SITE_INDEXABLE=1`.
- Unggahan di Vercel tanpa Blob token kini galat jelas (dulu menulis ke FS read-only).
- Copy formulir tidak lagi menjanjikan "jawaban dikirim ke surel" — fitur surel belum ada.
- `prisma migrate reset` diblokir Prisma tanpa persetujuan eksplisit Aldo; DB lokal disinkronkan
  lewat `db execute` + `migrate resolve --applied` (non-destruktif). DB lokal: `prisma dev -n bup4`
  (port berubah tiap start, perbarui `.env`).

**Menunggu keputusan Aldo:**
1. Identitas di berkas terlacak: seed/kode memuat nama Kemlu, pejabat asli (Sukmo Yuwono dkk),
   foto, alamat/telepon Biro. Ini situs resmi BUP (bukan demo samaran seperti SIGAP), tapi absolut #4
   melarang nama klien di berkas terlacak tanpa izin. Commit/push diblokir sampai Aldo memutuskan.
2. Hosting: Aldo minta Vercel (6 Sep); proyek Kemlu lain live di Cloudflare Containers + Neon
   (*.rivsyah.dev). Domain resmi .go.id butuh izin Pusdatin/BUP.
3. Data ilustrasi (KPI, rekap BMN, paket, berita) tampil seolah asli: ganti atau unpublish sebelum
   live. WhatsApp `+62 811 0000 000` palsu.
4. Consumer SSO di SIGAP-BUP/SIPAMA/MONPBJP/PDP belum ada.
5. App Laravel `C:\Users\rivsy\Herd\bup-kemlu` (diparkir) masih dilayani Herd: hapus atau simpan.
6. `C:\Users\rivsy` sendiri adalah repo git kosong (master, 0 commit). `git add .` di sana menyapu
   seluruh home termasuk `.ssh`. Proyek ini belum punya repo sendiri.

## 31 Okt 2026 — audit proses bisnis + 5 perbaikan (teruji di browser, belum commit)
- Lacak publik kini wajib nomor + surel pemohon (server action `src/actions/tracking.ts`, 20/10mnt/IP).
  Dulu nomor berurutan HD-2026-0001 bisa ditebak siapa pun.
- Eskalasi peran ditutup: hanya superadmin yang boleh membuat/mengubah/menghapus akun admin/superadmin.
- Dasbor Portal: peran `staf` dulu melihat angka tiket/pemeliharaan/pesan seluruh Biro; kini hanya
  "permohonan saya", angka operasional per hak kelola.
- Riwayat: perubahan status selalu publik, catatan petugas boleh internal (dulu status ikut tersembunyi).
- Secret SSO kini bisa dilihat di Admin → Aplikasi Internal → Ubah ("Tampilkan secret SSO").
- Akun uji lokal: `.claude/uji-akun.ts` (gitignored). DB lokal `prisma dev -n bup5`.

**Usulan pemangkasan menu (menunggu Aldo):** nav 8 → 5 (Beranda, Profil, Layanan, Informasi,
Helpdesk[+Lacak+Kontak]); buang Dashboard Kinerja publik (angka manual/ilustrasi, tumpang tindih
MONPBJP/SIGAP), form Kirim Pesan (duplikat helpdesk), toggle EN (halaman masih bahasa Indonesia),
tile beranda ganda; pindah Lacak Aset ke Portal (posisi aset Perwakilan RI tak perlu publik);
"Ajukan Permohonan" di halaman Pengadaan mengarah ke helpdesk — arahkan ke PDP/VMS via Portal.

## 31 Okt 2026 — SIPAMA, MONPBJP, Diplomasi Pengadaan/VMS dihapus dari Portal
Aldo: "ga ada lagi". Dibuang dari seed (seed kini juga `deleteMany` ketiga kunci itu), `.env`/`.env.example`,
README, docs/SSO.md, komentar kode. Portal hanya berisi SIGAP-BUP; aplikasi lain bisa ditambah lewat Admin.
