---
name: project-horor-motion
description: Video motion "Penunggu" — 7 hantu Nusantara, ±88 dtk, narasi ElevenLabs Lily (perempuan), Remotion + soundtrack sintetis; lokasi, alur render, status
metadata:
  type: project
---

**Status 31 Okt 2026:** v1 selesai dirender. Permintaan Aldo: "vidio motion tentang horor di indonesia". Scope dipilih Bara = personal (topik bukan ekonomi/politik, jadi bukan Trajectory [[project-media-brand-architecture]]); belum dikonfirmasi Aldo.

- Lokasi (mesin ini): `C:\Users\rivsy\dev\personal\horor-motion\`. Output `out\horor-nusantara.mp4` (1920x1080, 30fps, ±88 dtk dengan narasi, ~120 MB karena grain) + `out\horor-nusantara-kecil.mp4` (CRF 24, ~14 MB, untuk dibagikan).
- Stack sama dengan [[project-motion-video-demo]]: Remotion 4.0.539 + React 19.2. Alur: `npm run audio` (tulis `public/soundtrack.wav`) → `npm run render`. Render ~2 menit.
- Struktur: `src/timeline.json` (durasi adegan, dibaca juga oleh audio) → intro lilin 225 fr, judul PENUNGGU + beringin 165 fr, 7 hantu × 180 fr, outro mata merah 210 fr. Siluet SVG buatan sendiri di `src/ghosts.tsx`; atmosfer (kabut, grain, kedip, glitch) di `src/ui.tsx`.
- Hantu: Kuntilanak, Pocong, Genderuwo, Tuyul, Sundel Bolong, Leak (Bali), Wewe Gombel (Semarang). Teks = folklor umum, tanpa angka selain "belasan ribu pulau".
- Audio 100% sintetis (drone, angin, detak jantung, gong berombak, bonang ~pelog, bisikan) — tanpa sampel, tanpa lisensi pihak ketiga. Tanpa voiceover (edge-tts sudah ditolak Aldo).
- **9:16 (31 Okt 2026):** komposisi `HororVertical` (1080x1920) memakai komponen yang sama; layout bercabang lewat `useV()` di `src/ui.tsx`. `npm run render:v` → `outhoror-nusantara-9x16.mp4` (+ `-kecil.mp4` ~14 MB). Teks ditaruh di tengah layar, sepertiga bawah dibiarkan kosong untuk UI Reels/TikTok.
- **Narasi (31 Okt 2026, diminta Aldo "kok ga ada dubbingnya"):** ElevenLabs suara bawaan Brian (`nPczCjzI2devNBz1zQrb`), `eleven_v4`, `language_code: id`, speed 0.9. Naskah per adegan di `audio/script.json` (`parts` = potongan yang memicu teks muncul). `audio/make_vo.py` menulis `public/vo/*.mp3` + **menghasilkan `src/timeline.json`** — durasi tiap adegan kini mengikuti panjang narasi (total ±88 dtk). Cache per adegan lewat hash teks+suara, jadi hanya adegan yang berubah yang memakai kredit. Pemakaian pertama: 976 karakter.
- **Suara diganti ke Sarah `EXAVITQu4vr4xnSDxMaL` (31 Okt 2026, Aldo: "pakai suara cewe").** Suara perempuan lain yang jalan di Free = Alice `Xb7hH8MSUJpSbSDYk0k2`. Total jadi ±90 dtk. Kredit terpakai proyek ini: 2×976 karakter.
- **Narator FINAL = Lily `pFZP5JQG7iQjIQuC4Bku` (31 Okt 2026, dipilih Aldo dari sampel; Aldo minta suara wanita "lebih berat dan horor").** Pengaturan: stability 0.4, style 0.5, speed 0.85. Total ±92,5 dtk.
- Uji suara wanita di Free (31 Okt): Lily, Matilda `XrExE9yKIg1WjnnlVkGX`, Laura `FGY2WhTYpPnrIDTdsKH5`, Jessica `cgSgspJ2msm6clMCkdW9`, Sarah, Alice JALAN; Charlotte 402 (library). Semua F0 ~205–208 Hz — ganti suara bawaan tidak membuat lebih berat. Varian pitch −2,5 semitone + bass + gema (ffmpeg, `out/samples/*-berat.mp3`) turun ke 182–199 Hz; tidak dipilih. Suara horor sungguhan = Voice Library (perlu Starter). Alat: `audio/sample_voices.py`, `audio/pitch.py`.
- Musik di-duck ke 40% saat narasi (di `make_audio.py`).
- Urutan build: `envdb.sh run ELEVENLABS_API_KEY -- python audio/make_vo.py` → `python audio/make_audio.py` → `npm run render` + `npm run render:v`.
- Key ElevenLabs hanya punya izin TTS (tanpa user_read/voices_read) dan paket Free: tanpa lisensi komersial. Untuk unggahan komersial perlu Starter ke atas.
- Belum: branding.
