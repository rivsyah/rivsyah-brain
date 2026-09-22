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
| **AIgnited** | kosong, belum ada project |
| **Rivaldo** (pribadi) | dua project bernama `SIGAP`, keduanya `aws-us-east-2`, dibuat 22 Sep 2026 |
| **M. Dedi** | project `bei` di `aws-ap-southeast-1` — **milik pihak ketiga** |

**HARD — kunci ini melihat org Dedi.** Satu API key memberi akses ke ketiga org. Setiap skrip yang
memakai `NEON_API_KEY` **wajib menyebut `org_id` atau `project_id` secara eksplisit**. Jangan pernah
menjalankan operasi yang "daftar semua project lalu kerjakan semuanya" — itu akan menyentuh basis
data orang lain. Ini kasus nyata dari absolut isolasi scope.

Catatan API: `GET /api/v2/projects` **tanpa** `org_id` menjawab HTTP 400 `org_id is required`,
bukan 401. Jangan salah baca 400 itu sebagai kunci mati — kuncinya hidup, parameternya yang kurang.

## Ke mana NEON_DATABASE_URL menunjuk

Project `SIGAP` di org **Rivaldo**, branch **`production`** (branch default), region `aws-us-east-2`,
basis data `neondb`, koneksi pooled, `sslmode=require&channel_binding=require`. Isi branch itu
±31,7 MB, jadi **ada data nyata di dalamnya**.

**Tiga hal yang harus diperlakukan sebagai jebakan:**

1. **String koneksi itu mengarah ke `production`, bukan branch pengembangan.** Setiap migrasi, seed
   atau `DROP` yang dijalankan dengan `NEON_DATABASE_URL` apa adanya langsung mengenai data hidup.
   Buat branch dev lebih dulu (Neon membuatnya dalam hitungan detik, copy-on-write, nyaris tanpa
   biaya), lalu simpan URL branch itu untuk pekerjaan sehari-hari.
2. **Region `aws-us-east-2` (Ohio) salah untuk pengguna Indonesia.** Neon punya
   `aws-ap-southeast-1` (Singapura) — project `bei` milik Dedi sudah di sana. **Region tidak bisa
   diubah setelah project dibuat**; satu-satunya jalan adalah membuat project baru lalu memindahkan
   data. Project ini baru berumur sehari, jadi sekarang saat termurah untuk pindah.
3. **Ada dua project bernama `SIGAP`.** Yang kedua kosong (0 byte) dan dibuat di hari yang sama —
   hampir pasti kembar tak disengaja. Jangan hapus tanpa perintah Aldo; penghapusan project Neon
   tidak bisa dibatalkan.

## Yang belum jelas

Kartu [[project-sigap-bup]] menulis stack SIGAP-BUP adalah **Laravel + SQLite** di Herd, dan
menyebut PostgreSQL ditolak karena mesin ini tanpa Docker/PostgreSQL. Project Neon bernama `SIGAP`
berisi 30 MB bertentangan dengan itu. Salah satu dari dua hal benar: arah berubah ke Postgres
(mungkin untuk deploy Vercel), atau project Neon ini percobaan yang ditinggalkan. **Jangan ubah
kartu SIGAP-BUP sampai Aldo memastikan yang mana.**
