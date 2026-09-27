# Memory Index

> One line per card — the detail lives in the card. Open it before acting on its topic.
> Conventions: [README.md](README.md). **Query this file with grep; never read it whole.**

## NOW — active focus (update when it goes stale)

- 🟢 22 Sep 2026 — aldo-starter dipasang. Brain di `~/brain`, vault ini yang kanonik.
  Sisa: pasang blok `hooks` ke `~/.claude/settings.json`, lalu bersihkan kartu lama di
  `~/.claude/projects/C--Users-rivsy/memory/` supaya tinggal pointer.
- 🟢 26 Sep 2026 — Neon **SELESAI dirapikan**: nol kunci ber-scope akun, `env.db` pakai kunci org
  AIgnited (id 3367030), MCP dipin ke `rapid-lab-46810989` read-only di `~/.claude.json` saja, dua
  kembar `SIGAP` kosong dihapus (org Rivaldo kini kosong), scaffold Neon dicabut dari repo brain.
  `NEON_DATABASE_URL` sudah benar dan **terbukti jalan lewat `pdo_pgsql`** — PG 17.11, 28 tabel,
  0,4 detik. **Koreksi: host `-pooler` TIDAK perlu dibuang** — penyebab kegagalan lama adalah libpq 16
  vs PG18, bukan pooler. Sisa sepele: kunci yatim `bara-rivaldo` (3366980) belum dicabut, org-nya
  kosong jadi tidak berisiko. Detail di [Akun Neon](shared/reference/reference_neon_account.md).
- 🔵 27 Sep 2026 — **SIGAP-BUP → Postgres: kode SIAP, data MENUNGGU keputusan Aldo.** Git terpasang
  (baseline `97d1861`, lalu `8dfd123`: 5 bug PG — VARCHAR 255, urutan NULL, sum numeric, LIKE, cache
  seeder). Terbukti di PG17 **tanpa data asli**: 114 tes, 150 layar + 10 CSV identik dengan SQLite,
  gerbang pagu `lockForUpdate` benar-benar terkunci (uji 2 proses). ⚠ Menunggu: (1) residensi — data
  asli Kemlu boleh ke Neon Singapura? (PP 71/2019 Ps. 20 ayat 2); (2) izin SheetJS untuk xlsx 27 Sep
  yang lebih baru. `.env` masih SQLite, Neon `main` masih 10 migrasi.
  [SIGAP-BUP Kemlu](kemlu/project_sigap_bup.md) bagian 27 Sep.
- 🔴 27 Sep 2026 — `.git` nyasar di `C:\Users\rivsy` **masih ada** (0 commit, tanpa .gitignore);
  hapusnya MENUNGGU ya eksplisit Aldo. `Herd\sigap-bup` sudah punya git sendiri.
  [Git nyasar di home](shared/ops/reference_stray_git_home.md).
- 🟠 27 Sep 2026 — Dua insiden data kecil saat uji PG SIGAP-BUP (baris asli tercetak ke transkrip;
  branch sandbox dihapus). Aldo perlu cek setelan berbagi 2 berkas Drive milik `UP-2026-0001`.
  Aturan baru: [Data sintetis tolak-semua](shared/feedback/feedback_synthetic_data_deny_all.md).

## User & identity

- [Owner context](shared/user_owner_context.md) — kuesioner bawaan kit, BELUM diisi
- [User Profile](shared/user_profile.md) — Aldo, CEO of AIgnited, Windows + RTX 5070, AI/GPU workloads

## Operating rules — identity, legal, safety

<!-- Aturan yang harus selamat walau vault tak terbaca ada di rulebook, bukan di sini. -->

## Operating rules — workflow and building

- [English-only briefs](shared/feedback/feedback_english_only_briefs.md) — jangan bawakan edisi Bahasa Indonesia lagi; brief English only sejak 3 Sep 2026
- [Data sintetis tolak-semua](shared/feedback/feedback_synthetic_data_deny_all.md) — data uji dari data asli: teks diganti palsu sepanjang aslinya kecuali lolos pola kode ketat/daftar izin; daftar pengecualian data dihitung dari keluaran LENGKAP, jangan `| head`; saat analisis pun, frekuensi kata uraian ≥25 tetap meloloskan nama (3 insiden 27 Sep)

## Projects

### Kemlu — dashboard Laravel (`C:\Users\rivsy\Herd\`)

- [DPLD Kemlu](kemlu/project_dpld_kemlu.md) — DIHAPUS 2026-09-26; sumber desain tetap di Claude Design, spec v3.0 di Downloads
- [SIPAMA Kemlu](kemlu/project_sipama_kemlu.md) — Dashboard Sistem Informasi Pengamanan (9 modul) di Herd\sipama → sipama.test
- [SIGAP-BUP Kemlu](kemlu/project_sigap_bup.md) — GRP Biro Umum & Pengadaan di Herd\sigap-bup → sigap-bup.test, gerbang pagu + audit; git sejak 27 Sep (`8dfd123`, siap Postgres); seed Neon MENUNGGU residensi + SheetJS
- [UKPBJ Kemlu](kemlu/project_ukpbj_kemlu.md) — Dashboard Monitoring Pengadaan 10 tampilan + 5 peran (RBAC) di Herd\ukpbj-kemlu; jebakan Babel import()→require()
- [BUP Kemlu](kemlu/project_bup_kemlu.md) — Portal Biro Umum dan Pengadaan: Next.js 16 di Herd/bup-kemlu-next + broker SSO ke SIGAP-BUP/SIPAMA/MONPBJP/PDP-VMS
- [Template SPK & Adendum](kemlu/reference_template_spk.md) — Claude Doc + .docx di Documents; template SPK Barang/Jasa Lainnya + adendum; dasar hukum terverifikasi (batas SPK, Ps. 54/56/79, PPN 11%; 27 Sep: Ps. 33 (2) b e-purchasing DIHAPUS Perpres 46/2025)
- [HT PoC Satpam](kemlu/project_ht_poc_satpam.md) — KAK + RAB/HPS kuota data 20 HT; Revisi 3 (27 Sep 2026) Okt-Des = 60 unit-bulan, HPS Rp4,8 jt; Jul-Sep di luar paket, invoice AAM 113 unit-bulan tak bisa dipakai
- [Dokumen Pokja + SPPBJ](kemlu/reference_dokumen_pokja_sppbj.md) — draf Pengumuman/Nodin/SPPBJ tender Renovasi Lt3 (26 Sep 2026); jaminan 5% HPS bila < 80% HPS (Pasal 33 (3) b); celah: klarifikasi kewajaran harga
- [MDP PBJP LN ringkas](kemlu/reference_mdp_pbjp_ringkas.md) — FINAL 137 hlm → RINGKAS 75 hlm (.docx+.pdf di Downloads, 27 Sep 2026); 36 formulir dwibahasa 1 hlm; 12 kontradiksi diselesaikan + 9 celah terbuka (pakta integritas belum ada); builder di ~/dev/kemlu/mdp-pbjp-ringkas
- [Pengadaan AMDK](kemlu/project_pengadaan_amdk.md) — RAB/HPS rev3 + KAK rev2 + SSKK rev1 (27 Sep 2026): Okt–Des, 2.980 galon + 120 karton, Rp64,4 jt, tanpa jaminan pelaksanaan; terbuka: pagu KAK 100 jt ≠ RAB 896,8 jt, sumber harga Rp20.000 belum ada
- [Langganan Media Cetak](kemlu/project_langganan_media_cetak.md) — KAK + RAB/HPS Kompas/JP/Tempo/PRISMA; revisi Okt–Des (27 Sep 2026) 45 Eks/Bln, RAB Rp18.797.850; BLOCKER pagu paket KAK Rp10 jt < nilai paket; sumber harga ke-2 = harga nego Juli
- [PANTAS kurs](kemlu/project_pantas_kurs.md) — pantau kas UP + selisih kurs IDR/USD + proyeksi kekurangan pagu, SPA statis di `~/dev/kemlu/pantas-kurs` → pantas-kurs.test; sampel BKU/BKT KBRI Washington 2026: beban kurs Rp10,55 M, kurs SP2D = JISDOR T-2 (8/8); belum di-commit, pagu DIPA nyata belum ada
- [Tesis Erna](kemlu/project_tesis_erna.md) — deck ujian proposal S2 Akuntansi soal hedging/kurs Perwakilan RI; deck _Revisi 31 slide + naskah docx 16 hlm (Q&A, pertanyaan tersulit, perbaikan); 4 item kuesioner tumpang tindih dengan Y

### Ignited Research — brief & equity (`C:\Users\rivsy\Downloads\Research Reports\`)

- [Equity Research Series](research/project_equity_research_series.md) — seri sell-side Ignited (BBCA/INDY/BMRI/RANS); pipeline content.py→build.py→verify.py + jebakan reportlab
- [BBCA Company Focus](research/project_bbca_company_focus.md) — equity note "The CASA Dividend"; MODEL dict + verify.py 56 checks
- [BPADAD — Badan Pengelola Aset dan Dana Abadi Diplomasi](research/project_landlord_that_rents.md) — ed.3 50pp + deck 28 slide (dulu "The Landlord That Rents"); sewa audited Rp702,0M = 310x; renewal ratio 93%; folder tetap Landlord-That-Rents
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

- [Akun Neon](shared/reference/reference_neon_account.md) — 3 org (satu milik pihak ketiga); rotasi selesai 26 Sep: NOL kunci ber-scope akun, `env.db` pakai kunci org AIgnited; scope kunci ikut org PROJECT, bukan org pemilik; kunci org menjawab 404 lintas-org dan di `/users/me` — bukan tanda mati; login CLI OAuth tetap akun-penuh jadi `org_id` tetap wajib; `NEON_DATABASE_URL` sudah benar + terbukti jalan lewat pdo_pgsql; branch live bernama `main` bukan `production`; KOREKSI: host `-pooler` tidak perlu dibuang dan `pooler_enabled` bukan prediktor konektivitas — pdo_pgsql gagal di PG18 karena libpq 16, dan jalan mulus di PG17
- [Neon CLI](shared/reference/reference_neon_cli.md) — Neon 5.0.1; `neon mcp -y` bawaan cetak API key akun-penuh ke 6 config — pakai `--agent --project-id --read-only`, dan `-y` bisa PAKAI ULANG kunci lama; `neon config init` bisa pasang zod rusak
- [Git nyasar di home](shared/ops/reference_stray_git_home.md) — **BAHAYA LATEN**: ada `.git` di `C:\Users\rivsy` (0 commit, tanpa .gitignore) yang mengklaim `.ssh`, `env.db`, `.claude.json`; hapusnya MENUNGGU ya eksplisit Aldo. `Herd\sigap-bup` sudah punya git sendiri (27 Sep, baseline 97d1861)
- [Herd di Windows](shared/ops/reference_herd_windows.md) — `herd link` gagal di sesi agen (minta elevasi, tapi tetap bilang sukses); pakai junction di `~/.config/herd/config/valet/Sites`
- [Agent roster](shared/ops/agent_roster.md) — agent mana di mesin mana, dan aturan yang menjaga beberapa mesin tetap satu brain
- [GPU Worker & Wan2GP](aignited/reference_gpu_worker.md) — path GPU worker, Wan2GP, dan state login-autostart (Startup folder + scheduled task)
- [Ignited Research masthead](shared/reference/reference_ignited_masthead.md) — "Ignited Research · Independent Analysis" untuk semua brief; "Independent Research" sudah pensiun
- [Render dokumen Office](shared/reference/reference_office_render.md) — tidak ada soffice/pdftoppm/pandoc; docx→PDF lewat Word COM: macet 27 Sep 09:50 tapi jalan lagi 10:00–10:25 (render.ps1 di mdp-pbjp-ringkas), cadangan render EMF per halaman; keepNext di sel tabel = tabel lompat halaman; xlsx hitung ulang + PDF lewat Excel COM (sheet hidden gagal ekspor), PyMuPDF global; TEXT() Excel rusak di locale ID → FIXED()
- [Kurs JISDOR BI](shared/reference/reference_bi_jisdor.md) — unduh rentang lewat postback tombol Unduh → xlsx (tanggal m/d/yyyy); GET biasa 10 hari; wskursbi mati; ECB/Frankfurter beda 15–20 poin
- [Impor Claude Design](shared/reference/reference_design_login.md) — DesignSync bisa kedaluwarsa di tengah sesi; hanya /design-login dari terminal interaktif yang memulihkan

## Archive

- **From Rulemaker to Buyer** (brief LKPP→Badan Pengadaan Pemerintah) — **dihapus atas
  permintaan Aldo, 26 Sep 2026.** Folder `Research Reports\Rulemaker-to-Buyer` dipindah ke
  Recycle Bin (89 berkas, 18 MB, termasuk PDF 37 hlm + deck 16 slide); kartunya dicabut.
  Jebakan pipeline-nya diselamatkan ke
  [The Seventy-Dollar Budget](research/project_seventy_dollar_budget.md) karena brief itu
  fork dari folder tersebut dan pipeline-nya sama.

<!-- Kartu HILANG dari disk, hanya tersisa barisnya di indeks lama — tulis ulang kalau masih perlu:
     project_pdp_kemlu      — Sistem Terpadu Diplomasi Pengadaan+VMS, Herd\pdp-kemlu → pdp-kemlu.test, 4 peran + gerbang KPA
     project_pdp_vms_next   — port Next.js App Router siap Vercel di Herd\pdp-vms; jebakan Suspense-di-layout, .next rusak -->
