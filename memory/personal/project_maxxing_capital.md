---
name: project-hedge-desk
description: Hedge Desk — desk hedge fund pribadi Aldo + agent AI trading (saham AS + crypto, paper v1) di ~/dev/personal/hedge-desk; penerus FFCC
metadata:
  type: project
---

**Hedge Desk** (`C:\Users\rivsy\dev\personal\hedge-desk`, mesin ini) — scope **personal**. Penerus
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
