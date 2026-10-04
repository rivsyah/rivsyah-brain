---
name: reference-cloudflare-rivsyah-dev
description: "Domain rivsyah.dev (Hostinger) + akun Cloudflare Aldo — zona ACTIVE sejak 29 Sep 2026 22.52 WIB (NS gracie/syeef); per 4 Okt tinggal Workers Paid (Containers 401) — scope workflow GITHUB_PAT sudah beres; izin DNS token TIDAK perlu untuk custom domain Worker, TAPI custom domain Pages lewat API tidak membuat CNAME → PANTAS butuh Zone DNS Edit; Zero Trust belum aktif (4 Okt), onboarding Free wajib isi metode bayar; SIGAP/PANTAS/SIPDLN menunggu langkah Aldo"
metadata:
  type: reference
  modified: 2026-10-04
---

Dicek lewat API (baca saja) 29 Sep 2026 ~22:55 WIB, dari mesin riv. Domain pribadi Aldo, dipilih
eksplisit olehnya untuk demo aplikasi yang identitas instansinya sudah disamarkan.

**Domain `rivsyah.dev`** — registrar Hostinger. Sebelum 29 Sep NS-nya parkir Hostinger
(`athena/apollo.dns-parking.com`, apex A `2.57.91.91`, tanpa MX/TXT/DNSSEC). TLD `.dev` wajib HTTPS
(HSTS preload).

**Zona Cloudflare — ACTIVE sejak 29 Sep 2026 22.52 WIB** (`activated_on` 15:52:13Z; registry .dev
menunjuk NS baru ±2 menit setelah Aldo menyimpan di Hostinger — catatan brain-7b). Paket Free. NS:
**`gracie.ns.cloudflare.com`** + **`syeef.ns.cloudflare.com`**; resolver publik (Cloudflare dan Google)
sudah menjawab NS itu. Pembagian subdomain: `sigap.*` = Worker `sigap-bup` (sesi SIGAP),
`sipdln.*` = Worker `sipdln-bup` (SIPDLN), `pantas.*` = Pages `pantas-kurs` (PANTAS) — jangan saling ubah
rekaman/route.

**Akun & token Cloudflare (env.db):**
- `CLOUDFLARE_API_TOKEN` aktif. Bisa: akun, daftar zona, Workers scripts, **workers/routes zona dan
  workers/domains akun (200)**. Tidak bisa: rekaman DNS zona (403), Access (403). Containers **401**
  (dugaan: Workers Paid belum aktif; bila tetap 401 sesudahnya, token butuh izin Containers).
- **Izin DNS token tidak diperlukan untuk custom domain Worker** (diverifikasi 29 Sep): API "Attach Worker
  Domain" hanya menerima `Workers Scripts Write`, dan dokumen Custom Domains: "Cloudflare will create DNS
  records and issue necessary certificates on your behalf". 403 di `dns_records` tidak memprediksi
  kegagalan deploy. Tambah izin hanya bila deploy pertama gagal di langkah domain.
- **Custom domain Pages BEDA dengan Worker** (diverifikasi 4 Okt, PANTAS): `POST .../pages/projects/<p>/domains`
  hanya mendaftarkan domain; statusnya tetap pending *"CNAME record not set"* sampai CNAME dibuat. Dashboard
  membuat CNAME otomatis, API tidak. Jadi Pages lewat API butuh **Zone DNS Edit**. Token punya Pages Edit
  (buat proyek `pantas-kurs` 200).
- **Zero Trust/Access belum aktif** (4 Okt: `access.api.error.not_enabled`; `/access/organizations` 403 10000).
  Onboarding Zero Trust Free: pilih nama tim + paket + **wajib isi metode pembayaran walau Free, tidak ditagih**
  (dok resmi `learning-paths/secure-internet-traffic/initial-setup/create-zero-trust-org`).
- `CLOUDFLARE_ACCOUNT_ID` di env.db **salah** (tidak cocok dengan satu-satunya akun token). Agent bisa
  mengambil ID yang benar dari `GET /accounts` saat jalan; env.db sendiri diisi Aldo lewat
  `envdb-setup.sh` di terminalnya.
- Belum ada subdomain `workers.dev` (dibuat otomatis saat halaman Workers & Pages dibuka pertama kali).

**GitHub:** ~~`GITHUB_PAT` classic hanya scope `repo`~~ — Aldo mencentang scope **`workflow`** 29 Sep 22.56 WIB;
dicek ulang 4 Okt: header `x-oauth-scopes` = `repo, workflow`. Push berkas `.github/workflows/*` kini bisa.
Catatan 4 Okt: satu skrip "buat repo + `git remote add` + push" (SIPDLN) ditolak pengaman mode otomatis
Claude Code ("Remote Repoint") → minta persetujuan eksplisit Aldo di chat dulu, jangan cari jalan lain.

**Cek ulang 4 Okt 2026 (API, baca saja):** Containers masih **401** *"requires the Workers Paid plan"*;
`workers/scripts` 200 tapi **0 Worker** (belum ada yang terdeploy, termasuk SIGAP); `workers/domains` 0;
`workers.dev` 404 (belum ada subdomain); `CLOUDFLARE_ACCOUNT_ID` env.db masih tidak cocok.
Harga dicek live 4 Okt: Workers Paid minimal **US$5/bln** (halaman Workers diperbarui 2 Okt 2026);
Containers termasuk 25 GiB-jam memori, 375 vCPU-menit, 200 GB-jam disk per bulan (halaman 28 Agu 2026);
tipe `basic` = 1/4 vCPU, 1 GiB, 4 GB disk (halaman limit 30 Sep 2026).
**Model tagihan Containers** (halaman harga, dicek live 4 Okt oleh sesi SIGAP): CPU ditagih **hanya saat aktif
dipakai**. Memori dan disk ditagih sesuai ukuran instance **selama container menyala**. Container yang tidur
(lewat `sleepAfter`) **tidak ditagih**. Kelebihan kuota: memori US$0,0000025/GiB-detik, vCPU
US$0,000020/vCPU-detik, disk US$0,00000007/GB-detik; Workers, Durable Objects, dan egress ditagih terpisah.
Perkiraan satu container `basic`: demo dengan `sleepAfter` 15 menit ≈ **US$5–6/bln**; menyala 24 jam terus
≈ **US$12/bln** ditambah CPU aktif. [Likely — hitungan agent dari tarif, belum ada tagihan nyata.] Dua
container (SIGAP + SIPDLN) memakai satu langganan US$5 dan berbagi kuota yang sama.

**Yang menunggu langkah Aldo yang sama:**
- [[project_sigap_bup]] — Containers + Neon, `sigap.rivsyah.dev`.
- [[project_pantas_kurs]] — Pages + Access. Proyek Pages sudah dibuat 4 Okt (kosong); butuh Zero Trust Free +
  izin token Access (Apps/Policies, Org/IdP/Groups, Service Tokens) + Zone DNS Edit.
- [[project-sipdln-bup]] — Containers + SQLite demo di image, `sipdln.rivsyah.dev`.

Daftar langkah Aldo, sekali untuk semua: ~~(1) NS di Hostinger~~ **selesai 29 Sep**; (2) Workers Paid
US$5/bln (untuk Containers) — **belum, per 4 Okt**; ~~(3) scope `workflow` di GITHUB_PAT~~ **selesai 29 Sep**;
~~(4) izin DNS/Workers Routes di token~~ **tidak perlu untuk Worker** (lihat atas);
(5) opsional perbaiki `CLOUDFLARE_ACCOUNT_ID`; (6) khusus PANTAS: Zero Trust Free + izin token Access ×3 +
Zone DNS Edit — **belum, per 4 Okt**.
Harga/kuota Cloudflare: [[reference-hosting-vercel-cloudflare]].
