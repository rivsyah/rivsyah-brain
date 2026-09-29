---
name: reference-cloudflare-rivsyah-dev
description: "Domain rivsyah.dev (Hostinger) + akun Cloudflare Aldo — 29 Sep 2026 ~23:05: NS sudah Cloudflare (gracie/syeef), zona ACTIVE; masih tertahan Workers Paid (Containers 401), izin DNS token (403), scope workflow GITHUB_PAT; SIGAP/PANTAS/SIPDLN menunggu langkah yang sama"
metadata:
  type: reference
  modified: 2026-09-29
---

Dicek lewat API (baca saja) 29 Sep 2026 ~22:55 WIB, dari mesin riv. Domain pribadi Aldo, dipilih
eksplisit olehnya untuk demo aplikasi yang identitas instansinya sudah disamarkan.

**Domain `rivsyah.dev`** — registrar Hostinger. Sebelum 29 Sep NS-nya parkir Hostinger
(`athena/apollo.dns-parking.com`, apex A `2.57.91.91`, tanpa MX/TXT/DNSSEC). TLD `.dev` wajib HTTPS
(HSTS preload).

**Zona Cloudflare — ACTIVE (diverifikasi 29 Sep ~23:05 WIB).** Paket Free. Aldo sudah mengganti NS di
Hostinger ke **`gracie.ns.cloudflare.com`** + **`syeef.ns.cloudflare.com`**; resolver publik (Cloudflare
dan Google) sudah menjawab NS itu. Pembagian subdomain: `sigap.*` = Worker `sigap-bup` (sesi SIGAP),
`sipdln.*` = Worker `sipdln-bup` (SIPDLN) — jangan saling ubah rekaman/route.

**Akun & token Cloudflare (env.db):**
- `CLOUDFLARE_API_TOKEN` aktif. Bisa: akun, daftar zona, Workers scripts (200). **Tidak bisa**: rekaman
  DNS zona (**403** setelah zona aktif; sebelumnya 10000), Access (403). Containers **401** = Workers
  Paid belum aktif.
- `CLOUDFLARE_ACCOUNT_ID` di env.db **salah** (tidak cocok dengan satu-satunya akun token). Agent bisa
  mengambil ID yang benar dari `GET /accounts` saat jalan; env.db sendiri diisi Aldo lewat
  `envdb-setup.sh` di terminalnya.
- Belum ada subdomain `workers.dev` (dibuat otomatis saat halaman Workers & Pages dibuka pertama kali).

**GitHub:** `GITHUB_PAT` classic hanya scope `repo` → push berkas `.github/workflows/*` ditolak. Perlu
centang scope **`workflow`** pada token yang sama (nilai token tidak berubah).

**Yang menunggu langkah Aldo yang sama:**
- [[project_sigap_bup]] — Containers + Neon, `sigap.rivsyah.dev`.
- [[project_pantas_kurs]] — Pages + Access (butuh Zero Trust Free + izin Access di token).
- [[project-sipdln-bup]] — Containers + SQLite demo di image, `sipdln.rivsyah.dev`.

Daftar langkah Aldo, sekali untuk semua: ~~(1) NS di Hostinger~~ **selesai 29 Sep**; (2) Workers Paid
US$5/bln (untuk Containers); (3) scope `workflow` di GITHUB_PAT; (4) tambah izin token: Zone DNS Edit +
Workers Routes Edit untuk rivsyah.dev (+ Access bila PANTAS); (5) opsional perbaiki
`CLOUDFLARE_ACCOUNT_ID`.
Harga/kuota Cloudflare: [[reference-hosting-vercel-cloudflare]].
