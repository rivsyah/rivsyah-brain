---
name: project-trajectory-gas-sg
description: Video motion Trajectory "matematika gas Singapura" — versi lain dari aignited ep01 (gas Indonesia ke Singapura); lokasi, naskah, status, langkah setelah kuota TTS reset
metadata:
  type: project
---

**Status 31 Okt 2026:** DRAF tanpa suara DIRENDER (95 dtk, 16:9 + 9:16, ~60 MB masing-masing); timing masih perkiraan. Menunggu kuota ElevenLabs reset untuk suara Liam.

- Permintaan Aldo: "buat video motion gas lng sg versi lain dari yang sudah ada". Asumsi Bara (belum dikoreksi Aldo): merek **Trajectory**, Bahasa Indonesia, suara Liam, ±80-90 dtk, sudut "hitung angkanya" (beda dari ep01 yang "ikuti pipanya" + gaya peta gelap).
- **Lokasi (mesin ini):** `C:\Users\rivsy\dev\research\trajectory-gas-sg\` — salinan infrastruktur [[project-motion-video-demo]] (ui.tsx, make_vo.py dengan cache per scene, logo Trajectory, komposisi Demo 16:9 + Vertical 9:16). Output `out/trajectory-gas-sg.mp4` dan `out/trajectory-gas-sg-vertical.mp4`.
- **Fakta:** HANYA dari narasi video aignited ep01 ([[project-ep01-social-cuts]]), yang mencantumkan sumber SKK Migas, ESDM, EMA Singapore, MTI Singapore, UN Comtrade. Bara TIDAK memverifikasi ulang ke sumber primer.
- **8 scene:** hook (93% listrik Singapura dari gas; Indonesia mengurangi kiriman sejak 24 Okt 2026) · dua pipa (West Natuna ±650 km sejak 2001; Grissik Sumsel lewat Batam; skema bukan peta) · besaran potongan (31 vs 354 vs ±1.200 miliar BTU/hari; ≈9% kiriman pipa, ≈2,5% gas Singapura) · rencana B LNG (pipa ID+MY ±separuh; Jurong kapasitas ±11 juta ton/thn, terpakai ±6; terminal apung 2027) · dalam negeri (pabrik Jabar ±78% kontrak sejak Sep 2026; domestik didahulukan) · 2028 (kontrak berakhir, mungkin tidak diperpanjang, hilang hampir 1/3) · pantau 3 hal · penutup "Potongan kecil hari ini. Pertaruhan besar di 2028." + logo.
- Hook mengikuti [[feedback-video-hook-first-seconds]]: 93% + topik tampil sejak frame 0 (Fade noIn).
- Naskah `vo/script.json` = 1.259 karakter. `tools/placeholder_vo.py` membuat timing perkiraan (14,9 karakter/dtk = kecepatan Liam di video free float) + mp3 hening.
- **LANGKAH SETELAH KUOTA RESET:** `~/brain/bin/envdb.sh run ELEVENLABS_API_KEY -- python vo/make_vo.py` lalu `npm run render` dan `npm run render:vertical`. Total antrean kredit setelah reset: proyek ini ±1.260 + judul free float ±80 + ep01 ID ±609 karakter.
