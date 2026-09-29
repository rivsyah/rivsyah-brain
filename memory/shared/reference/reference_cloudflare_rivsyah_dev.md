---
name: reference-cloudflare-rivsyah-dev
description: "Domain rivsyah.dev (Hostinger) + akun Cloudflare Aldo — status 29 Sep 2026: zona sudah dibuat (pending), NS Cloudflare gracie/syeef belum dipasang di Hostinger; Workers Paid belum aktif; token tanpa izin DNS; GITHUB_PAT tanpa scope workflow; tiga aplikasi (SIGAP, PANTAS, SIPDLN) menunggu langkah yang sama"
metadata:
  type: reference
  modified: 2026-09-29
---

Dicek lewat API (baca saja) 29 Sep 2026 ~22:55 WIB, dari mesin riv. Domain pribadi Aldo, dipilih
eksplisit olehnya untuk demo aplikasi yang identitas instansinya sudah disamarkan.

**Domain `rivsyah.dev`** — registrar Hostinger. NS saat ini `athena/apollo.dns-parking.com` (parkir
Hostinger): apex A `2.57.91.91`, `www` CNAME ke apex, **tanpa MX/TXT, tanpa DNSSEC (tidak ada DS)** →
memindah NS ke Cloudflare tidak merusak apa pun. TLD `.dev` wajib HTTPS (HSTS preload).

**Zona Cloudflare** — sudah ditambahkan, paket Free, status **pending**. NS yang diberikan:
**`gracie.ns.cloudflare.com`** dan **`syeef.ns.cloudflare.com`**. Langkah Aldo: hPanel Hostinger →
Domain → rivsyah.dev → DNS / Nameservers → ganti ke dua NS itu. Zona aktif setelah propagasi
(biasanya < 1 jam, bisa sampai 24–48 jam).

**Akun & token Cloudflare (env.db):**
- `CLOUDFLARE_API_TOKEN` aktif. Bisa: akun, daftar zona, Workers scripts (200). **Tidak bisa**: rekaman
  DNS zona (10000 Authentication error), Access (403). Containers **401** = Workers Paid belum aktif.
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

Daftar langkah Aldo, sekali untuk semua: (1) NS di Hostinger; (2) Workers Paid US$5/bln (untuk
Containers); (3) scope `workflow` di GITHUB_PAT; (4) tambah izin token: Zone DNS Edit + Workers Routes
Edit untuk rivsyah.dev (+ Access bila PANTAS); (5) opsional perbaiki `CLOUDFLARE_ACCOUNT_ID`.
Harga/kuota Cloudflare: [[reference-hosting-vercel-cloudflare]].
