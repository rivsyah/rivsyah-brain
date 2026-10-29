---
name: project-motion-video-demo
description: Demo video motion explainer gaya TSCS dengan Remotion untuk Ignited Research; lokasi, stack, status, jebakan
metadata:
  type: project
---

**Status 29 Okt 2026:** demo 44 detik selesai di render. Topik "Apa itu free float?" (konseptual, angka grid = ilustrasi). Belum ada voiceover dan footage asli.

- Lokasi (mesin ini): `C:\Users\rivsy\dev\research\motion-demo\`. Output `out\demo.mp4` (1920x1080, 30fps, ~21 MB).
- Stack: Remotion 4.0.539 + React 19.2. `npm run studio` untuk preview, `npm run render` untuk MP4. Render ~1 menit di laptop ini.
- Komponen di `src/ui.tsx`: Contour (latar garis kontur bergerak), Pill, Highlight (sapuan highlight), DocCard (kartu dokumen serif), Caption, Chrome (kredit + logo IR). Scene di `src/Demo.tsx`, daftar `SCENES` = [komponen, durasi frame].
- Referensi gaya: video TSCS "WTF Just Happened to Indonesia?" (youtube 21-G0C_bXYI). Tiru gaya, jangan salin aset/brand mereka.
- Belum: voiceover (rekaman Aldo atau TTS, butuh key), footage stok berlisensi, sinkron subtitle ke audio.

**Jebakan:** garis SVG yang "digambar" pakai `pathLength={1}` + `strokeDasharray={1}`; dasharray angka tetap memotong garis yang lebih panjang.
