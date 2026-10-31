---
name: project-siapseleksi
description: "31 Okt 2026: website gratis persiapan seleksi OJK/BI/BPS/Pertamina/CPNS/MIND ID (nama kerja SiapSeleksi) — MVP lokal jalan di ~/dev/personal/siapseleksi (Workers+Hono+D1), 392 soal, 7 paket, login OTP, donasi via tautan; BELUM deploy"
metadata:
  type: project
---

Permintaan Aldo 31 Okt 2026: website persiapan materi, tes, dan tahapan rekrutmen OJK, BI, BPS,
Pertamina, CPNS, MIND ID. Gratis, wajib daftar, ada fitur donasi. Urutan bangun diserahkan ke agent.
Scope: personal (bank soal berasal dari [[project-tpd-ojk-materi]]).

## State (31 Okt 2026)
- Repo lokal `C:\Users\rivsy\dev\personal\siapseleksi` (git, tanpa remote), HEAD `bce158b`. UI 31 Okt 2026: gaya landing bimbel (acuan pola: berkarirojk.id; Lato self-host). Palet: merah redam #a8323e HANYA aksen, area besar netral/lembut — Aldo bilang merah terang bikin sakit mata — hanya pola tata letak, tanpa aset/teks mereka.
- Stack: Cloudflare Workers + Hono JSX SSR + D1; OTP email via Resend; donasi = kanal PRIBADI (keputusan Aldo 31 Okt 2026): tautan Saweria + Trakteer lewat var `DONASI_SAWERIA`/`DONASI_TRAKTEER` (host di-whitelist, https saja).
- Konten: 360 soal V/N/L/P1/P2 diekspor dari builder TPD OJK (`TPD_SRC=... npm run bank`) + TWK 12,
  TKP 10, AKHLAK 10 orisinal. 7 paket. 8 materi. 6 halaman tahapan dari riset live 31 Okt 2026
  (`scripts/tahapan.json`, sumber resmi vs media ditandai).
- Diuji di browser: OTP, tryout, autosave, penilaian SKD 5/0 + bobot 1–5, pembahasan, SVG figural,
  ponsel 375 px, CSRF 403. Dev: preview `siapseleksi` di `Bara\.claude\launch.json`.
- Rencana & keputusan D1–D9: `.claude/ai_context/development/v1/` (gitignored, lokal saja).

## Fakta riset (cek ulang tiap siklus)
- SKD: 110 soal (TWK 30/TIU 35/TKP 45), 100 menit, maks 550 (KepmenPANRB 406/2026); ambang CPNS TA 2024
  65/80/166 (KepmenPANRB 321/2024); kedinasan TA 2026 TKP 156. Nilai akhir 40% SKD + 60% SKB (PermenPANRB 6/2024).
- BI: nama resmi kini "Pendidikan Calon Pegawai Asisten Manajer" (PCPM 41, daftar 9–14 Agu 2026).
- OJK PCAM 9 (daftar 21–27 Nov 2025), vendor SHL; urutan tahap hanya dari media.
- RBB 2025 ambang (media): TKD 58, AKHLAK 65, TWK 50, Learning Agility 36. RBB 2026 belum diumumkan.
- MIND ID XPLORER: siklus terakhir terkonfirmasi Cohort 3 (Jul 2024).

## Menunggu Aldo
Nama + domain; akun Cloudflare (D1 remote + deploy); `RESEND_API_KEY` di env.db; akun Saweria/Trakteer Aldo lalu isi URL-nya di `wrangler.jsonc` vars (kanal sudah diputuskan: pribadi).
Berikutnya: Turnstile, bank TWK/TKP 100+, Bahasa Inggris
(bisa dari seri TOEFL ITP), SKB BPS statistika.
