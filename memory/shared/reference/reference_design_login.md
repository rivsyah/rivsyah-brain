---
name: reference-design-login
description: Impor Claude Design lewat DesignSync butuh /design-login dari terminal interaktif; token yang ditempel di chat tidak bisa dipakai
metadata: 
  node_type: memory
  type: reference
  originSessionId: b3bd884b-5f46-45aa-8d12-0b687d4c089a
  modified: 2026-09-05T11:42:14.930Z
---

Otorisasi DesignSync bisa kedaluwarsa di tengah sesi panjang — gejalanya semua method (termasuk `list_projects`) menolak dengan "needs design-system authorization". Terjadi 5 Sep 2026 saat impor proyek SIGAP, padahal di awal sesi yang sama impor proyek lain berhasil.

Pemulihannya hanya satu: jalankan `/design-login` sekali dari sesi `claude` interaktif di mesin ini. Sesi desktop/headless kemudian memakai ulang otorisasi itu.

Menempelkan token ke chat tidak menolong — DesignSync tidak punya parameter token, ia membaca otorisasi tersimpan. Selain itu token yang ditempel jadi terekspos di transkrip dan sebaiknya dicabut.

Relevan untuk hampir semua proyek dashboard Aldo yang berasal dari Claude Design ([[project_ukpbj_kemlu]], [[project_sipama_kemlu]], [[project_dpld_kemlu]], [[project_family_funds]]).
