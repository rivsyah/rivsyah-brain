---
name: project-bup-kemlu
description: "Portal Biro Umum dan Pengadaan Kemlu — Next.js 16 di Herd\\bup-kemlu-next (target Vercel), plus app Laravel yang diparkir di Herd\\bup-kemlu"
metadata: 
  node_type: memory
  type: project
  originSessionId: 4aaff287-30ab-4924-99b7-3024a5cf00b3
  modified: 2026-09-06T01:05:41.923Z
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
SIGAP-BUP, SIPAMA, MONPBJP (UKPBJ), Diplomasi Pengadaan/VMS — consumer di sisi aplikasi
itu **belum dipasang**. Endpoint acuan `/api/sso/demo` (aktif hanya bila `SSO_DEMO=1`).

Panel Admin digerakkan deskriptor di `src/lib/admin/resources.ts` — tambah satu entri,
CRUD lengkap ikut otomatis.

Terkait: [[project-sigap-bup]], [[project-sipama-kemlu]], [[project-ukpbj-kemlu]],
[[project-pdp-kemlu]], [[reference-design-login]]
