---
name: project-ukpbj-kemlu
description: "Dashboard Monitoring Pengadaan UKPBJ Kemlu (7 tampilan) di Herd\\ukpbj-kemlu → ukpbj-kemlu.test, dari Claude Design + penyempurnaan spec-parity"
metadata: 
  node_type: memory
  type: project
  originSessionId: b3bd884b-5f46-45aa-8d12-0b687d4c089a
  modified: 2026-09-05T12:20:21.833Z
---

Dashboard Monitoring Pengadaan — UKPBJ Kemlu di `C:\Users\rivsy\Herd\ukpbj-kemlu` (Herd: ukpbj-kemlu.test; launch.json "ukpbj-kemlu" → http-server port 8123). Dibangun 2 Agu 2026 dari proyek Claude Design "Dashboard UKPBJ Kemlu" (import via DesignSync, project id 4fe550a9-dfde-4d90-8817-4adfe2a177a9).

Arsitektur sama dengan [[project_sipama_kemlu]]: SPA statis React 18 UMD + Babel standalone + ECharts CDN, tanpa build. `app/ukpbj-data.js` = data dummy deterministik (seed 20260719, posisi data 19 Jul 2026) + `KONFIG_REGULASI` + mesin `hitungAnomali` (9 aturan) & `hitungKebutuhanPokja` — siap dipindah ke backend saat integrasi SiRUP/SPAN/SPSE.

Jebakan build yang sudah ditemukan:
- Babel standalone mengubah `import()` menjadi `require()` → dynamic import data wajib lewat `new Function('u','return import(u)')`.
- `fmtTgl` desain asli mundur 1 hari di zona UTC-negatif (string date-only diurai UTC); sudah diperbaiki dengan parse lokal.

Redesain SIGAP diterapkan 5 Sep 2026 (dikirim Aldo sebagai ZIP `Downloads\Dashboard UKPBJ Kemlu Redesain.zip` karena DesignSync kedaluwarsa — lihat [[reference_design_login]]). Palet hangat `#F3F2EC` + sidebar navy `#0F2557` + aksen emas `#F5A80C`, nav berkelompok berikon dengan rail ciut 236↔56px, breadcrumb, kepala modul bernomor + label sumber data, pil status semantik, chip filter aktif. Mode gelap DIHAPUS (desain baru terang saja); prop `temaGelap` diganti `relTerbuka`. Font: Public Sans + Source Serif 4 + IBM Plex Mono. Data module di ZIP sudah memuat perbaikan saya — Aldo membawa hasil Claude Code kembali ke Design.

Lapisan peran (`app/ukpbj-peran.js`, ditambahkan 5 Sep 2026): 5 peran — Kepala UKPBJ, Kepala Sub Bagian, Pejabat Pengadaan (lingkup satker S12), Pokja Pemilihan (POKJA-1), Staf LPSE. Berisi RBAC (`PERAN_UKPBJ`, `bolehAkses`), gerbang kewenangan berbasis ambang regulasi (`gerbangKewenangan` — menolak dengan kutipan Perpres), mesin antrean kerja per peran (`hitungTugasPeran` — "logika berpikir"), dan `SKEMA_FORM` untuk 12 aksi perekaman. Tampilan bertambah jadi 10: TG Tugas Saya + 07 Penyedia & LPSE + 08 Log Aktivitas. Perekaman disimpan di state memori (spesifikasi melarang localStorage), digabung ke dataset lewat `dataGabungan()` lalu dihitung ulang.

Port Next.js (5 Sep 2026) di folder Herd/ukpbj-nextjs — App Router, Next 16 + React 19, siap Vercel (rute / prerender statis, bundel klien ~1,7 MB).
Dashboard jadi client component dengan ssr:false (ECharts butuh DOM + toLocaleString(id-ID) bisa memicu hydration mismatch ICU Node vs peramban).
ECharts DIPIN 5.5.0 agar render identik desain SIGAP. Font via next/font (self-hosted) jadi variabel --font-sans/serif/mono; string font di komponen diganti var().
Import dinamis lewat Function-constructor dibuang — hanya perlu saat Babel standalone di peramban. Versi statis di ukpbj-kemlu tetap ada sebagai rujukan.

Penyempurnaan disengaja melampaui desain (didokumentasikan di README): filter Satker multi-pilih, 8 visual tambahan wajib spec (heatmap realisasi & risiko, tren anomali, timeline Pokja, matriks peran, split PDN, dsb.), aturan anomali #9 dilengkapi (metode menyimpang dari RUP, kasus uji KBRI Bangkok), `minKontrakAnalisisKelompok: 4` agar kasus uji konsentrasi penyedia Riyadh menyala. Verifikasi via workflow multi-agen (template & logic fidelity 0 temuan; 5 temuan spec/runtime dikonfirmasi lalu diperbaiki).
