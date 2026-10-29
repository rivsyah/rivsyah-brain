---
name: project-motion-video-demo
description: Demo video motion explainer gaya TSCS dengan Remotion untuk Ignited Research; lokasi, stack, status, jebakan
metadata:
  type: project
---

**Status 29 Okt 2026:** demo 75 detik dengan voiceover selesai di render. Topik "Apa itu free float?" (konseptual, angka grid = ilustrasi). Belum ada footage asli.

- Lokasi (mesin ini): `C:\Users\rivsy\dev\research\motion-demo\`. Output `out\demo.mp4` (1920x1080, 30fps, 75 dtk).
- Stack: Remotion 4.0.539 + React 19.2. `npm run studio` untuk preview, `npm run render` untuk MP4. Render ~1 menit di laptop ini.
- Komponen di `src/ui.tsx`: Contour (latar garis kontur bergerak), Pill, Highlight (sapuan highlight), DocCard (kartu dokumen serif), Caption, Chrome (kredit + logo IR). Scene di `src/Demo.tsx`, daftar `SCENES` = [komponen, durasi frame].
- Referensi gaya: video TSCS "WTF Just Happened to Indonesia?" (youtube 21-G0C_bXYI). Tiru gaya, jangan salin aset/brand mereka.
- Voiceover: `edge-tts` 7.3.1 (pip, gratis, tanpa key; endpoint tidak resmi Microsoft Edge), suara `id-ID-ArdiNeural` rate +6% — **DITOLAK Aldo 29 Okt 2026: "keliatan AI banget"** (sempat bilang "sudah pas", lalu menarik). Batas kualitas edge-tts; ganti voice/rate di engine yang sama tidak menyelesaikan. Pengganti dipilih: ElevenLabs. Alternatif: `id-ID-GadisNeural`. Tidak ada key TTS berbayar di env.db.
- Alur VO: ubah naskah di `vo/script.json` -> `python vo/make_vo.py` (tulis `public/vo/*.mp3` + `src/vo.json` berisi timing kalimat) -> `npm run render`. Durasi scene, subtitle, dan animasi otomatis ikut timing kalimat lewat `useCue(i)`.
- Belum: footage stok berlisensi; footage butuh sumber berlisensi (Pexels/Pixabay API key belum ada di env.db) atau file dari Aldo.

**Jebakan:** garis SVG yang "digambar" pakai `pathLength={1}` + `strokeDasharray={1}`; dasharray angka tetap memotong garis yang lebih panjang.

**ElevenLabs (disiapkan 29 Okt 2026, menunggu key):**
- `vo/script.json` kini punya `engine` ("edge" | "elevenlabs") dan blok `elevenlabs` {voice_id, model}. Default sekarang `elevenlabs`, model `eleven_v4`, voice_id masih kosong.
- `make_vo.py` memanggil `POST /v1/text-to-speech/{voice_id}/with-timestamps` (stdlib urllib, `language_code: id`). Timing kalimat dihitung dari alignment per karakter. `--list-voices` = Voice Library bahasa Indonesia (`/v1/shared-voices?language=id`).
- Jalankan: `~/brain/bin/envdb.sh run ELEVENLABS_API_KEY -- python vo/make_vo.py`.
- Fakta dicek langsung 29 Okt 2026: Indonesian (id) didukung; paket Free = 10k kredit/bulan, TANPA lisensi komersial; lisensi komersial mulai Starter ($6/bln, promo $1 bulan pertama sampai 1 Nov). Naskah demo = 1.073 karakter. Harga API v4 $0,08 per 1k karakter.
- Key ditambahkan ke `bin/keys.catalog` sebagai ELEVENLABS_API_KEY (optional).
- Footage Pexels: 3 kandidat dipilih (29382320, 19535631, 8480232; total 21,4 MB), belum diunduh, menunggu izin Aldo.
