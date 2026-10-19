---
name: project-maxxing-capital
description: Maxxing Capital (dulu slug hedge-desk) — alat private/hedge fund pribadi Aldo: copilot live (read-only, menemani trading live) + agent desk paper; saham AS + crypto; ~/dev/personal/maxxing-capital
metadata:
  type: project
---

**Maxxing Capital** (`C:\Users\rivsy\dev\personal\maxxing-capital`, mesin ini; nama & folder sejak 19 Okt 2026, sebelumnya `hedge-desk`) — scope **personal**. Penerus
[[project-family-funds]] setelah pivot 17 Okt 2026. Diplan dengan framework ai_context (GRANDPLAN v1,
00_INDEX, STATUS, DECISIONS, reference/). Repo git lokal `main`, **belum ada commit & remote**.
`.claude/ai_context/` di-track (D9 proposed). Belum ada BINDING.md di ~/brain/framework → default spec
(stop setelah rencana).

- **Locked (owner, 17 Okt):** D1 saham AS + crypto dulu, IDX v2; D2 Cloudflare (bukan Vercel).
- **Proposed:** D3 Supabase Pro ($25/bln verified), D4 LLM tidak pernah eksekusi (RiskEngine
  deterministik R1–R14 + ExecutorDO), D5 tangga shadow→paper→live-approval→live-auto, D6 uang owner
  saja, D7 tanpa leverage/short/derivatif + LIMIT saja, D8 FFCC dibekukan, D9 ai_context tracked,
  D10 paper via SimBroker internal, D11 runtime venue hanya di Cloudflare.
- **Fakta riset 17 Okt (verified uji lokal):** DNS ISP mesin ini memblokir *.alpaca.markets,
  api.binance.com, api.bybit.com, api-testnet.bybit.com, www.interactivebrokers.com (juga via
  1.1.1.1). Lolos: indodax.com, tokocrypto.com, testnet.binance.vision, api.ibkr.com. Workers tidak
  punya IP egress statis self-serve. OpenNext tidak dijamin di Windows → WSL. Alpaca data gratis =
  IEX maks 30 simbol. Indodax: Trade API, key trade-only, tanpa testnet. Detail: reference/ di repo.
- **Rec venue:** Alpaca (data + paper pembanding), Indodax (crypto). Live saham AS untuk WNI belum
  punya jalur API legal terverifikasi (Q10, v2).
- **Next action:** owner setujui GRANDPLAN + jawab Q1–Q4 → build file 01 (verifikasi dari Cloudflare).

- **17 Okt 2026 (lanjutan):** owner menyetujui GRANDPLAN → D4–D11 locked. Build file 01 dijalankan:
  Worker sementara `hedge-desk-reach-probe` (colo NRT, sudah dihapus) — Alpaca REST 401-tanpa-key +
  websocket IEX tersambung, Indodax ticker 200 + TAPI terjangkau, **Tokocrypto 403 dari Workers**,
  Bybit/Binance testnet 200. Keputusan baru locked: D12 Supabase **Free** di v1 + backup R2 sejak
  M1.0, Pro ($25) wajib sebelum live; D13 Alpaca data+paper; D14 Indodax (Tokocrypto dicoret);
  D15 tanpa IP statis di v1. Biaya infra v1 ±$17,50/bln (CF $5 + ±$12,50 DO) + LLM.
  Build file 02–04 (M1.0) ditulis. Belum ada commit/remote.
- **Blocker milik owner:** WSL belum terpasang; `CLOUDFLARE_ACCOUNT_ID` di env.db SALAH (tidak cocok
  dengan token → auth error 10000; wrangler jalan bila account id dideteksi dari token; sudah
  diketahui salah sejak sesi lain); Workers Paid SUDAH aktif di akun yang sama (tidak perlu upgrade); akun Alpaca paper, key Indodax trade-only, project Supabase; `ANTHROPIC_API_KEY`
  belum ada (dibutuhkan M1.4).

- **19 Okt 2026:** owner menamai proyek **Maxxing Capital** (D16) dan menegaskan perannya: alat untuk
  hedge/private fund yang membantu investing & trading dan **menemani Aldo saat live**. Folder
  `hedge-desk` → `maxxing-capital` (belum ada commit/remote). D17 locked: **copilot live** masuk v1 —
  baca posisi live read-only, cek pra-transaksi (RiskEngine mode `advisory`), second opinion agent
  (format penguji tesis), peringatan sesi via Telegram, jurnal + tinjauan; Aldo yang mengeksekusi,
  sistem tetap tidak mengeksekusi uang sungguhan di v1. Buku `live` vs `paper` dipisah di skema.
  Milestone: copilot = M1.3 (build file 10–13); order paper → M1.4 (14–18); agent → M1.5–M1.6;
  operasional M1.7. D18 (key read-only Indodax `view` + impor CSV/manual) proposed, menunggu Q12
  (broker yang Aldo pakai live). Q13: IPS pribadi untuk konteks agent.

- **19 Okt 2026 — Q12 dijawab:** venue live Aldo = **Hyperliquid, Binance, Fomo, Growin' (Mandiri Sekuritas)**.
  Uji jangkauan kedua (Worker `maxxing-reach-probe`, colo MRS, sudah dihapus): Hyperliquid `info` +
  websocket terbuka dari laptop & Cloudflare, baca posisi cukup alamat wallet (tanpa key);
  Binance REST (api/fapi) 403 dari Cloudflare dan diblokir DNS di laptop, websocket Binance OK dari
  Cloudflare. Fomo = FOMO Labs (wallet Privy), perps via Hyperliquid → baca lewat alamat. Growin' =
  IDX, tanpa API → CSV/PDF/manual + harga EOD (Yahoo .JK / GOAPI). Keputusan: D19 jalur baca per
  venue, D20 data crypto Hyperliquid (Indodax dicoret, D14 superseded), D22 copilot modelkan
  leverage & likuidasi (aturan advisory R15–R18) — locked. D21 relay VPS Singapura untuk baca
  Binance — proposed (Q14). Butuh dari Aldo: alamat wallet Hyperliquid + Fomo (Q15), IPS (Q13).
  Detail: reference/brokers/live-venues.md di repo.

- **19 Okt 2026 — keputusan owner "saya pakai hyperliquid saja":** D23 locked — copilot live v1 HANYA
  Hyperliquid (alamat wallet, tanpa key, websocket real-time posisi/order/fill/funding). D19 dan D21
  (relay Binance) superseded; Binance/Fomo/Growin' tidak diintegrasikan di v1 (riset tetap di
  reference/brokers/live-venues.md). Aturan advisory baru R19: setiap posisi wajib punya order stop
  di bursa. Q16 dibuka: apakah agent desk tetap butuh saham AS (Alpaca paper) — keputusan sebelum M1.5.
  Sisa input Aldo: alamat wallet Hyperliquid (Q15), IPS (Q13), Telegram (Q9); blocker build: WSL +
  CLOUDFLARE_ACCOUNT_ID.
