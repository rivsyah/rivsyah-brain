---
name: reference-hosting-vercel-cloudflare
description: "Perbandingan hosting untuk aplikasi klien (dicek 29 Sep 2026): Vercel Hobby dilarang komersial, Pro US$20/seat + proteksi sandi US$20/proyek; Cloudflare Pages gratis boleh komersial, Access gratis ≤50 pengguna; PP 71/2019 Ps 20 soal data sektor publik"
metadata:
  type: reference
  modified: 2026-09-29
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
- Containers butuh Workers Paid US$5/bulan (lihat [[project_sigap_bup]]).

**Regulasi (Indonesia):** PP 71/2019 Pasal 20 ayat (2): penyelenggara sistem elektronik lingkup publik
wajib mengelola, memproses, dan/atau menyimpan sistem dan data elektronik di wilayah Indonesia; ayat (3)
pengecualian bila teknologi penyimpanannya tidak tersedia di dalam negeri. Relevan bila aplikasi dipakai
resmi oleh instansi pemerintah; untuk prototipe/demo tanpa data asli di server, risikonya jauh lebih kecil.

**Keputusan yang memakai kartu ini:** [[project_pantas_kurs]] (rekomendasi Cloudflare, 29 Sep 2026).
