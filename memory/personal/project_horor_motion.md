---
name: project-horor-motion
description: Video motion "Penunggu" — 7 hantu Nusantara, 62 dtk, Remotion + soundtrack sintetis numpy; lokasi, alur render, status
metadata:
  type: project
---

**Status 31 Okt 2026:** v1 selesai dirender. Permintaan Aldo: "vidio motion tentang horor di indonesia". Scope dipilih Bara = personal (topik bukan ekonomi/politik, jadi bukan Trajectory [[project-media-brand-architecture]]); belum dikonfirmasi Aldo.

- Lokasi (mesin ini): `C:\Users\rivsy\dev\personal\horor-motion\`. Output `out\horor-nusantara.mp4` (1920x1080, 30fps, 62 dtk, ~120 MB karena grain) + `out\horor-nusantara-kecil.mp4` (CRF 24, ~14 MB, untuk dibagikan).
- Stack sama dengan [[project-motion-video-demo]]: Remotion 4.0.539 + React 19.2. Alur: `npm run audio` (tulis `public/soundtrack.wav`) → `npm run render`. Render ~2 menit.
- Struktur: `src/timeline.json` (durasi adegan, dibaca juga oleh audio) → intro lilin 225 fr, judul PENUNGGU + beringin 165 fr, 7 hantu × 180 fr, outro mata merah 210 fr. Siluet SVG buatan sendiri di `src/ghosts.tsx`; atmosfer (kabut, grain, kedip, glitch) di `src/ui.tsx`.
- Hantu: Kuntilanak, Pocong, Genderuwo, Tuyul, Sundel Bolong, Leak (Bali), Wewe Gombel (Semarang). Teks = folklor umum, tanpa angka selain "belasan ribu pulau".
- Audio 100% sintetis (drone, angin, detak jantung, gong berombak, bonang ~pelog, bisikan) — tanpa sampel, tanpa lisensi pihak ketiga. Tanpa voiceover (edge-tts sudah ditolak Aldo).
- Belum: VO manusia/ElevenLabs, versi vertikal 9:16, branding.
