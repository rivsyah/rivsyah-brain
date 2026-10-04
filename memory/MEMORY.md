# Memory Index

> One line per card — the detail lives in the card. Open it before acting on its topic.
> Conventions: [README.md](README.md). **Query this file with grep; never read it whole.**

## NOW — active focus (update when it goes stale)

- 🟡 5 Okt 2026 14.00 — **Rapat Kemendag (Biro Keuangan) soal PBJ LN + uang muka pameran lintas TA.** Pointers +
  deck siap (4 Okt). Sesudah rapat: catat kesimpulannya di kartu. [Rapat Kemendag PBJ LN](kemlu/project_rapat_kemendag_pbjln.md).
- 🟡 4 Okt 2026 — **Dua KTI terpisah** (SIGAP 36 hlm, SIPDLN 32 hlm; sasaran satuan kerja pusat Kemlu, BUP =
  purwarupa) untuk percepatan PG PNS, verify 16/16 masing-masing + draf kasar netral untuk Dedi. **Aldo = JF Penata
  Kanselerai, bukan PPBJ.** Menunggu Aldo: isian NIP/jenjang/pengesah, maksud "untuk Dedi".
  [KTI SIGAP + SIPDLN](kemlu/project_kti_sigap_sipdln.md).
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
- 🔵 4 Okt 2026 — **SIGAP BUP (Sistem Informasi Government Analysis Planning Biro Umum dan Pengadaan):
  siap deploy, tertahan dua langkah Aldo.** Neon `main` berisi dummy (0 jejak Kemlu), password bawaan
  dipertahankan (keputusan Aldo). Deploy: GitHub Actions → Cloudflare Containers, `sigap.rivsyah.dev`,
  repo privat `rivsyah/sigap-bup` **masih kosong**; secret token + variabel `CLOUDFLARE_ACCOUNT_ID` terisi
  (4 Okt); commit lokal `22950a4`, pohon dipindai ulang bersih. ⚠ Sisa Aldo: (1) **riwayat git bersih** —
  pengaman otomatis menolak 4× (29 Sep, 4 Okt), **agent jangan coba lagi**; Aldo jalankan sendiri di Git
  Bash atau beri izin eksplisit di sesi; `pre-push` lokal menolak riwayat lama. (2) **Workers Paid** belum
  aktif (cek 4 Okt; alternatif Render gratis). Pemegang deploy: sesi `cba5e7d4` (4 Okt).
  [SIGAP-BUP Kemlu](kemlu/project_sigap_bup.md).
- 🔴 29 Sep 2026 — `.git` nyasar di `C:\Users\rivsy` **masih ada** (0 commit, 192 MB blob yatim dari
  2 Jul). Agent diblokir pengaman + kunci berkas; **Aldo bilang akan menghapus sendiri** (29 Sep).
  [Git nyasar di home](shared/ops/reference_stray_git_home.md).
- 🟠 27 Sep 2026 — Tiga insiden data kecil saat uji PG SIGAP-BUP (baris/nama asli tercetak ke
  transkrip; branch sandbox dihapus). Aldo perlu cek setelan berbagi 2 berkas Drive milik
  `UP-2026-0001`. Aturan: [Data sintetis tolak-semua](shared/feedback/feedback_synthetic_data_deny_all.md).

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
- [SIGAP-BUP Kemlu](kemlu/project_sigap_bup.md) — GRP Biro Umum & Pengadaan di Herd\sigap-bup → sigap-bup.test, gerbang pagu + audit; nama kini "SIGAP BUP" tanpa identitas Kemlu (`f5bbeeb`); Neon `main` terisi dummy 29 Sep; deploy Cloudflare siap (container + pdo_pgsql langsung, bukan HttpPgsqlPDO), tertahan riwayat git bersih (Aldo) + Workers Paid per 4 Okt
- [UKPBJ Kemlu](kemlu/project_ukpbj_kemlu.md) — Dashboard Monitoring Pengadaan 10 tampilan + 5 peran (RBAC) di Herd\ukpbj-kemlu; jebakan Babel import()→require()
- [BUP Kemlu](kemlu/project_bup_kemlu.md) — Portal Biro Umum dan Pengadaan: Next.js 16 di Herd/bup-kemlu-next + broker SSO ke SIGAP-BUP/SIPAMA/MONPBJP/PDP-VMS
- [SIPDLN-BUP](kemlu/project_sipdln_bup.md) — monitoring PDLN pegawai BUP + drafting ST/SPD/Rincian/Nominatif; Laravel 13 di ~/dev/kemlu/sipdln-bup → sipdln-bup.test (junction, bukan herd link); SBM 2026 = PMK 32/2025; Aldo 29 Sep: penandatangan ST = Kepala BUP, kurs JISDOR otomatis, identitas Kemlu disamarkan di app/file terlacak; commit awal b50b8d6 (main, tanpa remote); nomor ST ST/KP/{urut}/{bulan}/{tahun}/25 (d2284eb) + PHPStan 0 (0f3fcb6); deploy demo Cloudflare disiapkan (a0c5c18, sipdln.rivsyah.dev); 4 Okt: riwayat bersih, tinggal Workers Paid + izin Aldo buat repo/push (pengaman "Remote Repoint")
- [Template SPK & Adendum](kemlu/reference_template_spk.md) — Claude Doc + .docx di Documents; template SPK Barang/Jasa Lainnya + adendum; dasar hukum terverifikasi (batas SPK, Ps. 54/56/79, PPN 11%; 27 Sep: Ps. 33 (2) b e-purchasing DIHAPUS Perpres 46/2025)
- [HT PoC Satpam](kemlu/project_ht_poc_satpam.md) — KAK + RAB/HPS kuota data 20 HT; Revisi 3 (27 Sep 2026) Okt-Des = 60 unit-bulan, HPS Rp4,8 jt; Jul-Sep di luar paket, invoice AAM 113 unit-bulan tak bisa dipakai
- [Dokumen Pokja + SPPBJ](kemlu/reference_dokumen_pokja_sppbj.md) — draf Pengumuman/Nodin/SPPBJ tender Renovasi Lt3 (26 Sep 2026); jaminan 5% HPS bila < 80% HPS (Pasal 33 (3) b); celah: klarifikasi kewajaran harga
- [KKE Furniture Lt 3 Tower](kemlu/project_kke_furniture_lt3.md) — MINI KOMPETISI e-katalog (Lumsum, Pokja e-katalog), BUKAN tender; KKE ringkas format Aldo (4 sheet) di MOFA, dibetulkan 29 Sep: P3 PT Quel Avery Rp1,108 M (92,9% HPS) perlu klarifikasi C2/C4, P1 & P2 gugur; harga P1 Rp954,4 jt (<80% HPS), P2 Rp965,3 jt; builder ~/dev/kemlu/kke-furniture-lt3
- [MDP PBJP LN ringkas](kemlu/reference_mdp_pbjp_ringkas.md) — FINAL 137 hlm → RINGKAS 75 hlm (.docx+.pdf di Downloads, 27 Sep 2026); 36 formulir dwibahasa 1 hlm; 12 kontradiksi diselesaikan + 9 celah terbuka (pakta integritas belum ada); builder di ~/dev/kemlu/mdp-pbjp-ringkas
- [Pengadaan AMDK](kemlu/project_pengadaan_amdk.md) — dipakai: scan teken 28 Sep + Lampiran Alamat Titik Penyerahan (30 Sep, 1 hlm, teken sendiri); cadangan KAK rev3 + RAB rev4; Okt–Des, 2.980 galon, Rp64,4 jt; pagu di scan salah ketik; sumber harga Rp20.000 belum ada
- [Langganan Media Cetak](kemlu/project_langganan_media_cetak.md) — KAK + RAB/HPS Kompas/JP/Tempo/PRISMA; revisi Okt–Des (27 Sep 2026) 45 Eks/Bln, RAB Rp18.797.850; BLOCKER pagu paket KAK Rp10 jt < nilai paket; sumber harga ke-2 = harga nego Juli
- [GWS Business Standard 6 seat](kemlu/project_gws_business_standard.md) — KAK/Spektek + RAB/HPS 30 Sep 2026, periode 2026–2027, akun 994.002.M.522119, HPS Rp21.090.000 (median Elitery/Google/e-katalog); JANGAN sebut tunggakan; ada di e-katalog (e-purchasing wajib); pagu 522119 Rp75 jt tak cukup tanpa revisi; builder ~/dev/kemlu/gws-langganan-2026
- [PANTAS kurs](kemlu/project_pantas_kurs.md) — pantau kas UP + selisih kurs IDR/USD + proyeksi kekurangan pagu, SPA statis di `~/dev/kemlu/pantas-kurs` → pantas-kurs.test; sampel BKU/BKT KBRI Washington 2026: beban kurs Rp10,55 M (JISDOR) / Rp10,81 M (SP2D GUP), kurs SP2D = JISDOR T-2 (8/8); Aldo: Pagu 2026 Rp500 M (29 Sep, gitignored di data/sampel/pengaturan.json → sisa ±Rp272 M, serapan ±45%), dua cara kurs berdampingan, lokal; samaran identitas Kemlu aktif bawaan; riwayat git ditulis ulang tanpa identitas (e096019 → cf1a60b); 4 Okt: deploy di balik Access TERTAHAN — Pages `pantas-kurs` dibuat kosong (522), `pantas.rivsyah.dev` pending CNAME, `tools/cloudflare.mjs` siap (belum commit); menunggu Aldo: Zero Trust Free + izin token Access ×3 + DNS Edit
- [Tesis Erna](kemlu/project_tesis_erna.md) — deck ujian proposal S2 Akuntansi soal hedging/kurs Perwakilan RI; deck _Revisi 31 slide + naskah docx 16 hlm (Q&A, pertanyaan tersulit, perbaikan); 4 item kuesioner tumpang tindih dengan Y; semua berkas kini di Downloads\Thesis Teh Erna; masukan 3 dosen (ujian 23 Sep) ditranskripsi 1 Okt — "border" hlm 24/25/28 = bullet; 2 referensi kemungkinan fiktif (Lee & Wang 2023, Nguyen & Faff 2022); checklist revisi .docx 6 hlm (4 Okt)
- [KTI SIGAP + SIPDLN](kemlu/project_kti_sigap_sipdln.md) — DUA makalah terpisah (Permenlu 23/2020) untuk percepatan pangkat/golongan Aldo: SIGAP 36 hlm + SIPDLN 32 hlm, sasaran satuan kerja pusat (Aldo 4 Okt), verify 16/16 masing-masing, 0 kalimat kembar; model replikasi pakai Biro Keuangan (Ps 99), Pusat Data dan TI (Ps 673), kode unit Kepmenlu 40/2025 (BUP = 25); draf "untuk Dedi" = ASUMSI; builder ~/dev/kemlu/kti-sigap-sipdln; hasil di Downloads\Riv's Journey\KTI SIGAP-SIPDLN
- [Jabatan Aldo di Kemlu](kemlu/user_jabatan_kemlu.md) — HARD: kini JF PENATA KANSELERAI Ahli Pertama (bukan PPBJ; rekomendasi ND Karo SDM 30 Sep 2026, SK menunggu), III/b usulan TMT 1 Agu 2026 AK 50, BUP; scope kemlu saja
- [Roadmap pangkat JFPK](kemlu/project_roadmap_pangkat_jfpk.md) — 4 Okt 2026: IV/c dalam 5 thn TIDAK MUNGKIN (2 thn × 5 langkah; paling cepat ±2035–36); target utama III/d Ahli Muda ±Des 2030, stretch Ahli Madya IV/a ±akhir 2031; tuas mendesak: predikat 2026 Sangat Baik
- [Aturan pangkat JFPK](kemlu/reference_aturan_pangkat_jfpk.md) — tabel koef/AK/kelas, syarat 2 thn (Per BKN 4/2025 tak mengubahnya), Ukom JPM 72/78%, bonus AK rawan 10%/berbahaya 15%/ijazah 25%, KPLB SE BKN 5/2022, distribusi SB Kemlu (Kepmenlu 27/2024)
- [KTI & percepatan pangkat](kemlu/reference_kti_percepatan_pangkat.md) — Permenlu 23/2020 format makalah; AK pengembangan profesi JF PK & PPBJ DICABUT PermenPANRB 1/2023 → KTI tak otomatis menambah AK; jalur hidup: SKP Sangat Baik 150%, penghargaan Permenlu 2/2026 (usul Sekjen ke Komite), kenaikan pangkat istimewa Pasal 40 (teknis: KPLB SE BKN 5/2022); naik pangkat tiap bulan sejak 1 Okt 2025 (Per BKN 4/2025), syarat 2 thn tetap
- [Rapat Kemendag PBJ LN](kemlu/project_rapat_kemendag_pbjln.md) — rapat 5 Okt 2026 14.00 dgn Biro Keuangan Kemendag soal uang muka TA 2026 untuk pameran 2027; pointers DOCX 6 hlm + deck 11 slide di Downloads\MOFA\BUP\Rapat Kemendag PBJ LN 5 Okt 2026; sikap: Permenlu 3/2023 = cara mengadakan, bayar lintas TA = ranah Kemenkeu (opsi A pemilihan dini / B KTJ); kartu memuat fakta terverifikasi Permenlu 3/2023 (+Lampiran A/B), PMK 145/2017, 160/2015, 60/2018

### Ignited Research — brief & equity (`C:\Users\rivsy\Downloads\Research Reports\`)

- [Equity Research Series](research/project_equity_research_series.md) — seri sell-side Ignited (BBCA/INDY/BMRI/RANS); pipeline content.py→build.py→verify.py + jebakan reportlab
- [BBCA Company Focus](research/project_bbca_company_focus.md) — equity note "The CASA Dividend"; MODEL dict + verify.py 56 checks
- [BPADAD — Badan Pengelola Aset dan Dana Abadi Diplomasi](research/project_landlord_that_rents.md) — ed.4 4 Okt 2026: 55pp + deck 34, basis audited 31 Des 2025; gap Rp253,0M; sewa 226x (akrual); renewal bersih 55%; utang 7 gedung Rp670,8M; LK Sem I 2026 = print internal, tak dipakai
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
- [Tesis MBA Wharton](personal/project_wharton_thesis.md) — draft 72 hlm "The Landlord That Rents" dari brief BLU Aset Kemlu; MBA Wharton TIDAK punya tesis (jalur: ISP REAL 8990 atau Lauder Master's Thesis 30–35 hlm); pipeline docx-js + Word PDF + gerbang 109 cek; 4 Okt: selaras brief ed.4 (226x akrual, gap Rp253,0M, renewal bersih 55%, kredit 7 gedung)
- [Roadmap MBA AS](personal/project_mba_us_roadmap.md) — v1 4 Okt 2026: utama Agu 2028 (R1 Sep 2027), opsi CBS J-Term Jan 2028; LPDP Tahap 1 2027 tanpa LoA dulu (usia PNS S2 ≤37 per 31 Des); Wharton/CBS tanpa deferral; cerita BPADAD; banyak ⚠ OPEN data diri
- [RAB Tunangan & Pernikahan](personal/project_rab_pernikahan.md) — tunangan Rp50 jt muat; nikah: 19 opsi venue dibandingkan, 300 tamu terbaik CIBIS Park Rp232,5 jt (lebih Rp32,5 jt; muat bila cincin/mahar/seserahan terpisah), Swasana est. Rp362 jt; intimate termurah NIWA Prive; ⚠ harga Hadjatan 300 pax
- [Bara (agent)](shared/project_bara_agent.md) — agent all-in-one bernama Bara, workspace di ~/Bara; ~/Herd sengaja tidak di-rename (parked path Herd)

## Reference

- [Akun Neon](shared/reference/reference_neon_account.md) — 3 org (satu milik pihak ketiga); rotasi selesai 26 Sep: NOL kunci ber-scope akun, `env.db` pakai kunci org AIgnited; scope kunci ikut org PROJECT, bukan org pemilik; kunci org menjawab 404 lintas-org dan di `/users/me` — bukan tanda mati; login CLI OAuth tetap akun-penuh jadi `org_id` tetap wajib; `NEON_DATABASE_URL` sudah benar + terbukti jalan lewat pdo_pgsql; branch live bernama `main` bukan `production`; KOREKSI: host `-pooler` tidak perlu dibuang dan `pooler_enabled` bukan prediktor konektivitas — pdo_pgsql gagal di PG18 karena libpq 16, dan jalan mulus di PG17
- [Neon CLI](shared/reference/reference_neon_cli.md) — Neon 5.0.1; `neon mcp -y` bawaan cetak API key akun-penuh ke 6 config — pakai `--agent --project-id --read-only`, dan `-y` bisa PAKAI ULANG kunci lama; `neon config init` bisa pasang zod rusak
- [Git nyasar di home](shared/ops/reference_stray_git_home.md) — **BAHAYA LATEN**: ada `.git` di `C:\Users\rivsy` (0 commit, 192 MB blob yatim dari 2 Jul) yang mengklaim `.ssh`, `env.db`, `.claude.json`; Aldo izinkan hapus 27 Sep, agent diblokir pengaman + kunci berkas → Aldo hapus sendiri. `Herd\sigap-bup` sudah punya git sendiri
- [Herd di Windows](shared/ops/reference_herd_windows.md) — `herd link` gagal di sesi agen (minta elevasi, tapi tetap bilang sukses); pakai junction di `~/.config/herd/config/valet/Sites`
- [Agent roster](shared/ops/agent_roster.md) — agent mana di mesin mana, dan aturan yang menjaga beberapa mesin tetap satu brain
- [GPU Worker & Wan2GP](aignited/reference_gpu_worker.md) — path GPU worker, Wan2GP, dan state login-autostart (Startup folder + scheduled task)
- [Ignited Research masthead](shared/reference/reference_ignited_masthead.md) — "Ignited Research · Independent Analysis" untuk semua brief; "Independent Research" sudah pensiun
- [Riset harga IG/TikTok/Bridestory](shared/reference/reference_social_price_research.md) — caption IG lengkap di og:description; carousel terbaca setelah popup ditutup; TikTok CAPTCHA jangan diselesaikan; Bridestory 403 → tandai 'cuplikan'
- [Render dokumen Office](shared/reference/reference_office_render.md) — tidak ada soffice/pdftoppm/pandoc; docx→PDF lewat Word COM: macet 27 Sep 09:50 tapi jalan lagi 10:00–10:25 dan 13:10–13:35 (SaveAs 17, instans sendiri berdampingan dgn /Automation sesi lain), cadangan render EMF per halaman; keepNext di sel tabel = tabel lompat halaman; xlsx hitung ulang + PDF lewat Excel COM (sheet hidden gagal ekspor), PyMuPDF global; TEXT() Excel rusak di locale ID → FIXED(); teks sel berawalan "=" dari openpyxl → Excel gagal buka file
- [Hosting Vercel vs Cloudflare](shared/reference/reference_hosting_vercel_cloudflare.md) — 29 Sep 2026: Vercel Hobby dilarang komersial, Pro US$20/seat + sandi US$20/proyek; Cloudflare Pages gratis komersial, Access ≤50 pengguna; PP 71/2019 Ps 20
- [Cloudflare + rivsyah.dev](shared/reference/reference_cloudflare_rivsyah_dev.md) — zona ACTIVE sejak 29 Sep 22.52 WIB; per 4 Okt tinggal Workers Paid (scope workflow PAT beres, 0 Worker terdeploy); izin DNS token tidak perlu untuk custom domain Worker, TAPI custom domain Pages lewat API tidak membuat CNAME (butuh DNS Edit); Zero Trust belum aktif, onboarding Free wajib isi metode bayar; SIGAP/PANTAS/SIPDLN menunggu langkah Aldo
- [Kurs JISDOR BI](shared/reference/reference_bi_jisdor.md) — unduh rentang lewat postback tombol Unduh → xlsx (tanggal m/d/yyyy); GET biasa 10 hari; wskursbi mati; ECB/Frankfurter beda 15–20 poin; port PHP jalan 29 Sep
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
