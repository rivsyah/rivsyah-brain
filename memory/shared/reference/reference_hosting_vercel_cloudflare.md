---
name: reference-hosting-vercel-cloudflare
description: "Perbandingan hosting untuk aplikasi klien (dicek 29 Sep 2026): Vercel Hobby dilarang komersial, Pro US$20/seat + proteksi sandi US$20/proyek; Cloudflare Pages gratis boleh komersial, Access gratis ≤50 pengguna; Containers (satu-satunya jalur PHP di Cloudflare) butuh Workers Paid; Render Free 512 MB/0,1 CPU/750 jam, tidur 15 mnt (6 Okt); PP 71/2019 Ps 20 soal data sektor publik"
metadata:
  type: reference
  modified: 2026-10-06
---

Dicek live 29 Sep 2026 (pencarian web; angka harga berubah — cek ulang sebelum dikutip ke pihak lain).

**Vercel**
- Hobby: hanya pemakaian pribadi non-komersial. "Komersial" didefinisikan luas: termasuk karyawan atau
  konsultan berbayar yang menulis kodenya. Pekerjaan untuk klien → wajib Pro.
- Pro: US$20 per pengembang per bulan (termasuk kredit US$20).
- Proteksi sandi: tidak ada di Hobby; di Pro US$20 per proyek per bulan (dulu add-on tim US$150/bulan).

**Cloudflare**
- Pages gratis: bandwidth tak terbatas, **boleh komersial**, 500 build/bulan, 20.000 file per deploy.
  Pages Functions ikut kuota Workers gratis (100.000 request/hari, 10 ms CPU per request).
- Zero Trust / Access gratis sampai 50 pengguna (login email OTP); pengguna ke-51 ditolak sampai upgrade.
- Containers butuh Workers Paid US$5/bulan (lihat [[project_sigap_bup]]). Ini satu-satunya produk Cloudflare
  yang bisa menjalankan aplikasi PHP/Laravel; Workers Free dan Pages hanya JavaScript/Wasm dengan batas CPU
  pendek per request. Tipe `basic` = 1/4 vCPU, 1 GiB, 4 GB (dicek 4 Okt, [[reference-cloudflare-rivsyah-dev]]).

**Render (alternatif gratis untuk container, dicek live 6 Okt 2026 — docs `render.com/docs/free` +
`compute-plans`):** web service Free = 512 MB RAM, 0,1 CPU; 750 jam gratis per workspace per bulan; tidur
setelah 15 menit tanpa trafik, bangun ±1 menit (pengunjung melihat halaman loading); tanpa disk persisten,
satu instance, custom domain boleh; Docker didukung; region termasuk Singapura. Untuk SIPDLN/SIGAP pindah ke
Render butuh akun Render (Aldo), CNAME di zona Cloudflare (token tanpa izin DNS), dan ubah Dockerfile —
sekarang aset `public/build` (gitignored) dibangun di GitHub Actions sebelum image, Render membangun dari repo.
Perbandingan dengan Cloudflare `basic`: CPU 2,5× dan RAM 2× lebih kecil. Argumen 6 Okt: Aldo bertanya kenapa
harus Workers Paid → dijawab "tidak wajib; wajib hanya kalau tetap di Cloudflare"; keputusan masih terbuka.

**Google Cloud Run (gratis untuk container, dicek live 6 Okt 2026):** kuota gratis per bulan untuk billing
berbasis request = 2 juta request, 180.000 vCPU-detik, 360.000 GiB-detik, dihitung per akun billing; **wajib
akun billing aktif (kartu)**, ditagih hanya di atas kuota. Domain sendiri lewat *domain mapping* masih
**preview** ("not production-ready"), tersedia di `asia-southeast1` (Singapura, sama dengan Neon) tetapi **tidak**
di `asia-southeast2` (Jakarta); alternatifnya Load Balancer (berbayar) atau Firebase Hosting. Dockerfile SIGAP
(FrankenPHP, port 8080) cocok dengan port bawaan Cloud Run. Belum ada akun/kredensial Google Cloud di env.db.

**Workers Free untuk aplikasi JavaScript (dicek live 6 Okt 2026):** 100.000 request/hari, 10 ms CPU per
request (halaman harga 2 Okt 2026); request ke aset statis gratis tanpa batas di kedua paket; **Hyperdrive ada
di paket Free** (100.000 query/hari). Driver Neon: mode HTTP hanya transaksi batch non-interaktif; mode
WebSocket `Pool`/`Client` mendukung transaksi interaktif (`SELECT … FOR UPDATE`), tetapi di Workers harus
dibuka dan ditutup dalam satu handler request. D1 tetap haram untuk SIGAP (tanpa transaksi).
Usul 6 Okt (dari Dedi, lewat Aldo): tulis ulang SIGAP ke Hono + Astro supaya gratis di Cloudflare → agent
menyarankan **jangan**; detail dan alasannya di [[project_sigap_bup]]. Keputusan di tangan Aldo.

**Regulasi (Indonesia):** PP 71/2019 Pasal 20 ayat (2): penyelenggara sistem elektronik lingkup publik
wajib mengelola, memproses, dan/atau menyimpan sistem dan data elektronik di wilayah Indonesia; ayat (3)
pengecualian bila teknologi penyimpanannya tidak tersedia di dalam negeri. Relevan bila aplikasi dipakai
resmi oleh instansi pemerintah; untuk prototipe/demo tanpa data asli di server, risikonya jauh lebih kecil.

**Keputusan yang memakai kartu ini:** [[project_pantas_kurs]] (rekomendasi Cloudflare, 29 Sep 2026).
