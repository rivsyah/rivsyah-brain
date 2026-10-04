---
name: Riset harga dari Instagram, TikTok, Bridestory
description: "Mesin riv, dicek 4 Okt 2026: caption Instagram lengkap ada di meta og:description (tanpa login); gambar carousel terbaca di Browser pane setelah popup daftar ditutup; TikTok di Browser pane memunculkan CAPTCHA (jangan diselesaikan); Bridestory menolak WebFetch (403), pakai cuplikan mesin pencari dan tandai 'cuplikan'; WebFetch menyimpan PDF otomatis ke tool-results"
metadata:
  type: reference
---

Dicek 4 Okt 2026 di mesin riv, sesi riset venue nikah ([[project_rab_pernikahan]]).

- **Instagram tanpa login:** halaman post hanya menampilkan potongan caption ("... more"). Caption lengkap ada di
  `meta[property="og:description"]` — baca lewat `javascript_tool` (inspeksi saja). Buang parameter `?stkn=` dari
  tautan bagikan sebelum dibuka; itu token akun pengirim.
- **Gambar carousel Instagram** (harga paket sering hanya ada di gambar): buka post di Browser pane, tutup popup
  "Sign up" lewat tombol X, lalu klik panah kanan dan ambil screenshot per slide. Fitur `zoom` belum mendukung crop di
  Browser pane; screenshot penuh cukup terbaca.
- **TikTok di Browser pane:** sebagian video memunculkan CAPTCHA geser. Jangan diselesaikan. Nama akun tetap terlihat
  di URL hasil redirect (`tiktok.com/@akun/...`) — cukup untuk identifikasi venue, lalu cari harga lewat web.
- **Bridestory** menolak WebFetch (HTTP 403). Harga yang hanya terlihat di cuplikan mesin pencari ditandai "cuplikan",
  bukan "resmi". Listing bertanda "Produk Tidak Tersedia" = harga basi.
- **Situs paket pihak ketiga** (paketpernikahan.id dan sejenisnya) sering memasang nama venue di judul, padahal isinya
  "tidak termasuk sewa gedung". Jangan dipakai sebagai harga venue.
- **WebFetch ke PDF** menyimpan berkasnya otomatis ke folder `tool-results` sesi (mesin riv:
  `C:\Users\rivsy\.claude\projects\<proyek>\<sesi>\tool-results\`). Sebut ke Aldo bila itu terjadi.
- Subagen riset jangan disuruh memakai Browser pane bersamaan: satu pane dipakai bergantian, dan membuka PDF besar di
  pane bisa memunculkan dialog simpan di depan Aldo.
