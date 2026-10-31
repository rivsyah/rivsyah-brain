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

**Versi Bahasa Indonesia (mulai 31 Okt 2026, suara Liam ElevenLabs TX3LPaxmHKxFdv7VOQHJ, eleven_v4):**
- Terjemahan per kalimat (52) di `vo/script_id.json`, field start = detik kalimat Inggris asli; angka rawan ditulis huruf. Generator `tools/make_vo_id.py` (cache per kalimat di `vo/id/NN.mp3+json`, atempo maks 1,3x kalau melebihi jeda, hasil `public/vo_id.wav` + `src/words_id.json`).
- KUOTA ElevenLabs Free 10.000 HABIS 31 Okt 2026 di kalimat 40 (sisa 17 kredit). 40/52 kalimat sudah jadi; sisa 12 kalimat = 609 karakter. Pemakaian nyata lebih boros dari hitungan karakter Bara (perkiraan 5.700 dari 10.000, ternyata habis) — jangan andalkan hitungan karakter, cek kuota sebelum batch besar.
- 31 Okt 2026: musik dipisahkan dari narasi Inggris dengan `audio-separator` 0.48.0 (model UVR-MDX-NET-Inst_HQ_3, CPU, 4 mnt 16 dtk) -> `public/music.wav` (48 kHz). Musik asli sudah di-duck saat narasi (-28,6 dB saat bicara vs -20,8 dB saat jeda). Sisa suara narator Inggris di stem musik BELUM didengar manusia.
- Komposisi `FullID` dan `ShortID` (Remotion) + `tools/make_landscape_id.py` (video 4K asli tanpa encode ulang + music.wav + vo_id.wav -> out/ep01-id-16x9-4k.mp4, plus out/ep01-id.srt dan out/ep01-en.srt untuk YouTube). `tools/make_vo_id.py --partial` menyusun audio dari cache tanpa API.
- Hook layar penuh 3 dtk pertama (aturan [[feedback-video-hook-first-seconds]]): EN "Indonesia just cut gas to Singapore. / And 2028 could be bigger." ID "Indonesia memotong gas ke Singapura. / Dan 2028 bisa jauh lebih besar." Dasar klaim: kontrak berakhir 2028, kalau tidak diperpanjang Singapura kehilangan hampir 1/3 gasnya vs potongan kini ~2,5%. Versi EN dirender ulang dengan hook.
- **LANGKAH SETELAH KUOTA RESET:** `~/brain/bin/envdb.sh run ELEVENLABS_API_KEY -- python tools/make_vo_id.py` (hanya 12 kalimat sisa, 609 karakter), lalu `npm run render:full-id`, `npm run render:short-id`, `python tools/make_landscape_id.py "C:\Users\rivsy\Downloads\AIgnited\ep01-long-indonesia-gas-singapore-4k.mp4"`.
