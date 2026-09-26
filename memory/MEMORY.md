# Memory Index

> One line per card — the detail lives in the card. Open it before acting on its topic.
> Conventions: [README.md](README.md). **Query this file with grep; never read it whole.**

## NOW — active focus (update when it goes stale)

- 🟢 22 Sep 2026 — aldo-starter dipasang. Brain di `~/brain`, vault ini yang kanonik.
  Sisa: pasang blok `hooks` ke `~/.claude/settings.json`, lalu bersihkan kartu lama di
  `~/.claude/projects/C--Users-rivsy/memory/` supaya tinggal pointer.
- 🟡 26 Sep 2026 — `NEON_API_KEY` di `env.db` kini `bara-rivaldo` (org Rivaldo): lolos uji, tidak
  melihat org pihak ketiga, **tapi tidak menjangkau `sigap-bup` di org AIgnited** — pola migrasi
  SIGAP-BUP gagal sampai kunci diganti. Menunggu Aldo: scope pengganti, lalu cabut `Bara` (3356477).
  Detail di [Akun Neon](shared/reference/reference_neon_account.md).
- 🔵 26 Sep 2026 — **SIGAP-BUP pindah ke Postgres, SEDANG BERJALAN, di-pause Aldo.** Project Neon
  baru `sigap-bup` / `rapid-lab-46810989` (org AIgnited, ap-southeast-1, **PG17**) sudah dibuat dan
  **10 migrasi lolos**. Penyebab blocker lama sudah pasti: libpq 16 tidak bisa bicara dengan PG18.
  Lanjutannya — seed (butuh `Wasdit BUM 2026.xlsx`, `database/data/` tidak ada), `setval` sequence,
  140 tes Pest terhadap Postgres di branch terpisah — ada di
  [SIGAP-BUP Kemlu](kemlu/project_sigap_bup.md) bagian 26 Sep. Desain v2 **sudah terpasang**, jangan
  diimpor ulang; salinan utuh di `docs/SIGAP-BUP-v2.dc.html`.

## User & identity

- [Owner context](shared/user_owner_context.md) — kuesioner bawaan kit, BELUM diisi
- [User Profile](shared/user_profile.md) — Aldo, CEO of AIgnited, Windows + RTX 5070, AI/GPU workloads

## Operating rules — identity, legal, safety

<!-- Aturan yang harus selamat walau vault tak terbaca ada di rulebook, bukan di sini. -->

## Operating rules — workflow and building

- [English-only briefs](shared/feedback/feedback_english_only_briefs.md) — jangan bawakan edisi Bahasa Indonesia lagi; brief English only sejak 3 Sep 2026

## Projects

### Kemlu — dashboard Laravel (`C:\Users\rivsy\Herd\`)

- [DPLD Kemlu](kemlu/project_dpld_kemlu.md) — Dashboard Logistik Diplomatik (TongDip Monitor) di Herd\dpld-kemlu, dari Claude Design
- [SIPAMA Kemlu](kemlu/project_sipama_kemlu.md) — Dashboard Sistem Informasi Pengamanan (9 modul) di Herd\sipama → sipama.test
- [SIGAP-BUP Kemlu](kemlu/project_sigap_bup.md) — GRP Biro Umum & Pengadaan di Herd\sigap-bup → sigap-bup.test, seed Wasdit BUM 2026, gerbang pagu + audit
- [UKPBJ Kemlu](kemlu/project_ukpbj_kemlu.md) — Dashboard Monitoring Pengadaan 10 tampilan + 5 peran (RBAC) di Herd\ukpbj-kemlu; jebakan Babel import()→require()
- [BUP Kemlu](kemlu/project_bup_kemlu.md) — Portal Biro Umum dan Pengadaan: Next.js 16 di Herd/bup-kemlu-next + broker SSO ke SIGAP-BUP/SIPAMA/MONPBJP/PDP-VMS
- [Template SPK & Adendum](kemlu/reference_template_spk.md) — Claude Doc + .docx di Documents; template SPK Barang/Jasa Lainnya + adendum; dasar hukum terverifikasi 23 Sep 2026 (batas SPK, Pasal 54/56/79, PPN 11%)
- [Dokumen Pokja + SPPBJ](kemlu/reference_dokumen_pokja_sppbj.md) — draf Pengumuman/Nodin/SPPBJ tender Renovasi Lt3 (26 Sep 2026); jaminan 5% HPS bila < 80% HPS (Pasal 33 (3) b); celah: klarifikasi kewajaran harga
- [Tesis Erna](kemlu/project_tesis_erna.md) — deck ujian proposal S2 Akuntansi soal hedging/kurs Perwakilan RI; deck _Revisi 31 slide + naskah docx 16 hlm (Q&A, pertanyaan tersulit, perbaikan); 4 item kuesioner tumpang tindih dengan Y

### Ignited Research — brief & equity (`C:\Users\rivsy\Downloads\Research Reports\`)

- [Equity Research Series](research/project_equity_research_series.md) — seri sell-side Ignited (BBCA/INDY/BMRI/RANS); pipeline content.py→build.py→verify.py + jebakan reportlab
- [BBCA Company Focus](research/project_bbca_company_focus.md) — equity note "The CASA Dividend"; MODEL dict + verify.py 56 checks
- [The Landlord That Rents](research/project_landlord_that_rents.md) — brief 34pp menilai kertas kerja BLU Aset & Dana Diplomasi Kemlu; "Retention Agenda"
- [From Rulemaker to Buyer](research/project_bpp_procurement.md) — LKPP→Badan Pengadaan Pemerintah, EN edisi-2 37pp; klaim Rp360trn dibantah, basis terukur Rp25,69trn
- [The Seventy-Dollar Budget](research/project_seventy_dollar_budget.md) — Indonesia Outlook 2026 v2 35pp; enam asumsi APBN 2026 jebol, "Absorption Agenda"
- [The Clock and the Ledger](research/project_clock_and_ledger.md) — scorecard Aschenbrenner 36pp, suara CIO hedge fund; "Four Ledgers"
- [The Next Test](research/project_next_test_2027.md) — brief El Niño ketiga, dwibahasa satu folder; "Lead-Time Agenda", membuka dengan skor call sendiri
- [Bought and Sold](research/project_two_clocks_one_drought.md) — rerun v2 brief El Niño 30pp; "Two Clocks Agenda", verify.py menangkap 8 cacat
- [El Niño Brief](research/project_el_nino_brief.md) — "Both Sides of the Drought" 36pp; eksposur dua sisi beras/sawit, "Ballast Agenda"
- [One Price, Two Ledgers](research/project_one_price_two_ledgers.md) — rerun v2 brief chokepoint 34pp; "Counterweight Agenda", verify.py jadi gerbang build
- [Two Gates, One Price](research/project_two_gates_one_price.md) — brief 30pp krisis chokepoint Hormuz/Bab al-Mandab; "Ballast Agenda"
- [Koperasi Merah Putih](research/project_koperasi_merah_putih.md) — kajian 36hlm "Terlalu Besar untuk Gagal"; pertama berbahasa Indonesia + byline nama sendiri
- [The Price of Proof](research/project_price_of_proof.md) — paper kedua 37pp untuk stakeholder Indonesia; CBAM/EUDR/labour, "Evidence Chain"
- [Lestari Advisors](research/project_lestari_advisors.md) — lamaran Junior Business Analyst + paper "The Delivery Gap" 23pp; CV Aldo tanpa text layer
- [China Outlook Brief](research/project_china_outlook_brief.md) — brief 34pp Indonesia-facing; "Symmetry Agenda", + deck PPTX + infografis, 3 jebakan build
- [Indonesia Outlook Brief](research/project_indonesia_outlook_brief.md) — policy brief 35pp; pipeline EIU-PDF-tanpa-text-layer → PDF+DOCX
- [Fraud Hexagon Malaysia](research/project_fraud_hexagon_malaysia.md) — studi 33 emiten F&B Bursa Malaysia 2022-2024; trik blok `prior:{}` stockanalysis, 5 variabel tata kelola masih kosong

### AIgnited, personal, agent

- [aldo-starter install](shared/project_aldo_starter.md) - kit Dedi dipasang di riv; 7 penyimpangan dari default + 3 bug hulu yang hilang kalau --update dijalankan; juga daftar kunci yang terpasang di env.db
- [Family Funds (FFCC)](personal/project_family_funds.md) — wealth dashboard pribadi "Riv's Journey" di Herd\family-funds → family-funds.test
- [Bara (agent)](shared/project_bara_agent.md) — agent all-in-one bernama Bara, workspace di ~/Bara; ~/Herd sengaja tidak di-rename (parked path Herd)

## Reference

- [Akun Neon](shared/reference/reference_neon_account.md) — 3 org (satu milik pihak ketiga, WAJIB pin org_id); kunci ber-scope `--org-id` bikin batas itu teknis, bukan disiplin; kunci `env.db` kini org Rivaldo dan TIDAK menjangkau `sigap-bup` (org AIgnited); kunci org menjawab 404 lintas-org dan di `/users/me` — bukan tanda mati; project SIGAP KOSONG (30 MB itu katalog sistem, bukan data); pdo_pgsql mesin ini TIDAK bisa TCP 5432 ke Neon, hanya SQL-over-HTTP yang jalan
- [Neon CLI](shared/reference/reference_neon_cli.md) — Neon 5.0.1; `neon mcp -y` bawaan cetak API key akun-penuh ke 6 config — pakai `--agent --project-id --read-only`, dan `-y` bisa PAKAI ULANG kunci lama; `neon config init` bisa pasang zod rusak
- [Agent roster](shared/ops/agent_roster.md) — agent mana di mesin mana, dan aturan yang menjaga beberapa mesin tetap satu brain
- [GPU Worker & Wan2GP](aignited/reference_gpu_worker.md) — path GPU worker, Wan2GP, dan state login-autostart (Startup folder + scheduled task)
- [Ignited Research masthead](shared/reference/reference_ignited_masthead.md) — "Ignited Research · Independent Analysis" untuk semua brief; "Independent Research" sudah pensiun
- [Render dokumen Office](shared/reference/reference_office_render.md) — tidak ada soffice/pdftoppm/pandoc; docx→PDF lewat Word COM, PDF→PNG lewat PyMuPDF di scratchpad
- [Impor Claude Design](shared/reference/reference_design_login.md) — DesignSync bisa kedaluwarsa di tengah sesi; hanya /design-login dari terminal interaktif yang memulihkan

## Archive

<!-- Kartu HILANG dari disk, hanya tersisa barisnya di indeks lama — tulis ulang kalau masih perlu:
     project_pdp_kemlu      — Sistem Terpadu Diplomasi Pengadaan+VMS, Herd\pdp-kemlu → pdp-kemlu.test, 4 peran + gerbang KPA
     project_pdp_vms_next   — port Next.js App Router siap Vercel di Herd\pdp-vms; jebakan Suspense-di-layout, .next rusak -->
