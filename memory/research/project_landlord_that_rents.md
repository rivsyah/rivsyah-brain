---
name: project-landlord-that-rents
description: "Brief \"The Landlord That Rents\" menilai kertas kerja BLU Aset & Dana Diplomasi Kemlu; Retention Agenda, 34pp di Research Reports\\Landlord-That-Rents"
metadata: 
  node_type: memory
  type: project
  originSessionId: 4d538033-6b39-404d-ad2d-715697a084d7
  modified: 2026-09-10T05:24:47.846Z
---

Brief Ignited Research **"The Landlord That Rents"** (34pp, terbit 10 Sep 2026) di
`Downloads\Research Reports\Landlord-That-Rents\`. Menilai secara independen kertas
kerja internal Biro Umum dan Pengadaan Kemlu, *Konsep Pembentukan BLU Pengelola Aset
dan Dana Diplomasi* (draf 9 Sep 2026, 29pp) — dokumen sumber ada di `sources\`.

Kerangka rekomendasi: **the Retention Agenda** (9 aksi, 3 horizon). Tesis: kendala
yang mengikat adalah **hak menahan pendapatan**, bukan bentuk kelembagaan.

**Temuan orisinal yang diverifikasi dari dokumen primer** (LK Kemlu TA2024 Audited,
LBP Sem I TA2025, RKA-K/L TA2026 — ketiganya sudah ada di `Research Reports\Kemlu\`):

- Aset "idle" Rp 339,6 M **bukan properti yang bisa dijual** — sebagian besar tanah
  sewa jangka panjang hasil koreksi auditor (Canberra, Nairobi, Abuja, Kota Kinabalu,
  Kuala Lumpur; yang KL milik Pemerintah Malaysia, Hak Pakai 99 tahun).
- Seluruh estate Rp 54,86 T hanya menghasilkan sewa **Rp 2,27 M dari 9 dari 133 pos**,
  turun 22,58% — yield 0,004%. Sementara FSR (sewa rumah staf) Rp 286,1 M = **126×**
  lipat. Itu judul briefnya.
- Gap retensi Rp 304,3 M/tahun; dana abadi butuh pokok Rp 4,35–7,61 T (asumsi imbal
  4–7%) = **13–22×** seluruh saldo idle.
- **Koreksi fakta ke kertas kerja:** perkara Navayo sudah diputus — Tribunal Judiciaire
  de Paris 24/00309, 11 Des 2025, **Indonesia menang**, sita ditolak dan dibatalkan.
  Kertas kerja menandainya "belum bisa diverifikasi" dan memperingatkan aset rentan.
- LPDP di kertas kerja (Rp 126,1 T, Nov 2025) basi; aktual ~Rp 180,81 T (Mei 2026).
- LBP sendiri tidak konsisten: menyebut penurunan idle "6,58%" padahal aritmetiknya
  0,44%.

**Jebakan build baru yang tercatat di README + docstring:** jangan pasang `S.note()`
di dalam chart — `build.py` sudah mencetak baris `Source:` dari figcaption, jadi
kalimatnya tercetak dua kali. Nilai bar ditulis inline di ujung bar, bukan di baris
bawah. `S.track()` meluber di panel sempit. `.section` punya `page-break-before:always`
sehingga seksi yang lewat 2 baris meninggalkan halaman nyaris kosong — pindai halaman
<450 karakter setelah tiap edit.

Pipeline sama dengan [[project-bpp-procurement]]: content.py → charts.py → build.py →
topdf.py (Chrome headless) → verify.py sebagai gerbang keras. Masthead per
[[reference-ignited-masthead]], English-only per [[feedback-english-only-briefs]].
