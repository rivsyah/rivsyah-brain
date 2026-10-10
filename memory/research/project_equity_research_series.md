---
name: project-equity-research-series
description: "Ignited Research sell-side equity notes (BBCA, INDY, BMRI, RANS) — master prompt v2 (10 Okt 2026), house pipeline, RANS initiation SELL TP 115"
metadata: 
  node_type: memory
  type: project
  originSessionId: 1743bd9c-ab40-4437-890e-5825db379b56
  modified: 2026-10-10T00:00:00.000Z
---

Seri riset ekuitas sell-side "Ignited Research" (mulai 2 Agu 2026), semua di `Downloads\Research Reports\`:
master prompt di `Equity Research\PROMPT-sellside-research.md`; BBCA & BMRI (Company Focus), INDY
(Company Focus, BUY 4,050), lalu **RANS** — Initiation of Coverage: **SELL, TP IDR 115 (-44.7% vs 208)**.

**Master prompt v2 (10 Okt 2026)** = `Equity Research\PROMPT-sellside-research-v2.md` — pakai ini; v1 arsip.
Isi: 12 sector profile (bank pakai GGM, bukan EBITDA/EV), matriks modul per REPORT_TYPE (Results Review ≠ Flash),
tag data A/C/E/P + DRAFT otomatis, rute valuasi FCFF↔WACC↔EV bridge / FCFE-GGM↔CoE (v1 hitung utang dua kali),
TP input = hipotesis (±5%, tanpa back-solve), lantai exhibit per tipe, palet chart tervalidasi (navy chrome saja;
ember = subjek; kategorikal #2563A8→#E8590C→#169C8C→#D99A00→#8A5CC2→#5B8C2A; scatter maks 3 warna), tanpa
dual-axis, chart block + data twin untuk Markdown, 20 gate G1–G20, output Part A/B/C. Bug v1: "{FIRM_NAME}
Research" mencetak "Ignited Research Research".

⚠ Cek 10 Okt 2026: berkas RANS & INDY **tidak ada lagi** di `Downloads` (folder Equity Research kini hanya BBCA,
BMRI, prompt v1+v2, satu PDF bernomor). Path RANS di bawah sudah basi — tanya Aldo bila perlu.

Fakta kunci RANS: PT Rans Entertainmen Indonesia Tbk IPO **10 Jul 2026** @IDR 170 (2.525bn saham baru,
20,02%, raise 429,25bn; total 12.612,5m saham) — kejadian SETELAH cutoff model, wajib web-search dulu.
Prospektus: revenue turun 3 tahun beruntun (437,8→410,5→353,4bn), NP FY25 -41,6% ke 56,7bn; segmen duta
merek -51,6% pasca Raffi jadi utusan khusus presiden (Okt 2024). ARA hari-1 +34,1%, ATH 282, close 31 Jul 208.

**Pipeline house (template BBCA, dipakai ulang RANS):** `content.py` (REAL anchors + model terhitung + SEMUA
prosa sebagai f-string dari model — angka tak bisa drift) → `build.py` (reportlab, navy #0E2A47 + ember #E8590C,
exhibit = tabel bukan chart) → `verify.py` gerbang build (~120 checks: ties laporan keuangan, cash walk, equity
roll, DCF, konsistensi TP/rating di PDF via pypdf, mapping bullet→chapter).

**Why:** format initiation = Company Focus + blok tambahan (overview, shareholding, industri, skenario
berbobot-probabilitas); DRAFT banner wajib saat data campuran (headline riil, sub-line estimasi).

**How to apply:** jebakan reportlab: `&` telanjang di Paragraph jadi "P&L;" — pakai `&amp;`; sel tabel string
polos tidak wrap (≤~75 char per kolom lebar); front page harus muat 1 halaman (cek spill ke p2 di verify).
Rasterisasi cek visual pakai pypdfium2 (poppler tidak ada). Terkait: [[project-el-nino-brief]].

Rerun v2 (real data, final di `Equity Research\Ignited_Research_RANS_Initiation_v2_2Aug2026.pdf`): peer
multiples via stockanalysis.com `/quote/idx|krx|kosdaq/` (fetchable; e-IPO & Ajaib 403). Dunia 2026: USD/IDR
~17.994, IHSG ~6.236 (31 Jul), HYBE rugi ttm (fwd 14x), JYP/SM ~11x, FILM rugi, MNCN 2,5x ttm. ATH RANS 314
(bukan 282 versi berita awal — cek 52wk range investing.com); ADTV 3bl 777jt lembar (float berputar ~3 sesi).
Temuan governance: Rans Kosmetika = merek Slavina milik pasangan pendiri sendiri → akuisisi 85M adalah RPT
(Bloomberg Technoz). File PDF terkunci viewer saat rebuild → tulis ke nama file baru (…_v2_).
