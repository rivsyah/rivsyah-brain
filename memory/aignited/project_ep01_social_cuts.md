---
name: project-ep01-social-cuts
description: Versi vertikal 9:16 video aignited ep01 (gas Indonesia ke Singapura) untuk TikTok, Reels, Shorts; lokasi, alur, potongan, keputusan
metadata:
  type: project
---

**Status 31 Okt 2026:** SELESAI dirender oleh Bara atas permintaan Aldo ("buat versi untuk tiktok, reels ig, youtube"). Full 4:23 (~105 MB) + short 62,9 dtk (~23 MB), audio tanpa jeda di titik potong. Belum ditonton Aldo, belum diunggah.

- **Sumber (mesin ini):** `C:\Users\rivsy\Downloads\AIgnited\ep01-long-indonesia-gas-singapore-4k.mp4`. 3840x2160, 30 fps, 4:23 (263,1 dtk), narasi bahasa Inggris, bermerek aignited (peta hitam-oranye, font mono).
- **Proyek:** `C:\Users\rivsy\dev\aignited\ep01-social\` (Remotion 4.0.539). `public/main.mp4` = proxy 1080p dari sumber 4K, `public/bg.mp4` = latar 1080x1920 yang diburamkan dan digelapkan (dua-duanya dibuat ffmpeg, gitignored).
- **Output:** `out/ep01-vertical-full.mp4` (4:23, untuk TikTok) dan `out/ep01-vertical-short.mp4` (±62 dtk, untuk Shorts/Reels/TikTok). Perintah: `npm run render:full`, `npm run render:short`.
- **Layout:** video 16:9 utuh di tengah (top 640, 1080x608), TIDAK di-crop karena teks dan peta tersebar ke seluruh lebar. Judul atas = label "INDONESIA × SINGAPORE · 24 OCT 2026" + "Indonesia turned down the gas to Singapore. Why it matters." Caption per kata di top 1290, satu kata aktif menyala oranye #F28A1E. Teks di layar bahasa Inggris (mengikuti video).
- **Caption:** transkrip Whisper lokal (`faster-whisper` 1.2.1, model small, CPU int8), lalu `tools/make_words.py` -> `src/words.json` (509 kata; koreksi SKK Migas, cargoes, 1,200, 1,260). Audio tidak dikirim ke layanan luar.
- **Potongan pendek** (detik sumber, kalimat utuh): 0,6-10,4 hook; 14,7-24,6 dua pipa; 54,1-60,5 berkurang 31 miliar BTU/hari; 107,4-119,5 ~2,5% gas Singapura, 93% listrik dari gas; 209,7-223,0 kontrak berakhir 2028; 248,6-260,0 penutup + logo. Diatur di `SEGMENTS` di `src/Vertical.tsx`.
- **Dicek:** angka listrik di layar menghitung naik dari 89% dan berhenti di 93%, cocok dengan narasi (bukan selisih).
- **Batas platform** (cek web 31 Okt 2026, sumber blog pihak ketiga): Shorts maks 3 menit; Reels unggah lebih panjang tapi >3 menit tidak direkomendasikan ke penonton baru; TikTok unggah 10-60 menit tergantung akun.
