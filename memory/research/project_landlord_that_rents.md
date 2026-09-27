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


## Edisi kedua — 26 Sep 2026

Brief jadi **43 hlm, 18 figure, 13 tabel** + **deck 21 slide**
(`out/The-Landlord-That-Rents-Deck.pptx`, 16:9). Semua data tambahan digali dari empat
dokumen primer yang sama, tidak ada sumber baru.

**Nomenklatur yang direkomendasikan (permintaan Aldo):** *Badan Pengelola Aset dan Dana
Abadi Diplomasi* (**BPADAD**), Bab 2.3. Alasannya analitis, bukan selera: kualifikasi BLU
bertumpu pada limb "pengelolaan dana khusus" (PP 23/2005 Ps. 4(2)(c)), jadi naskah
pendirian harus menyebut *dana abadi*, bukan membiarkannya disimpulkan. Nama pilihan
kertas kerja (BPADD) menghilangkan kata yang justru bekerja.

**Temuan baru yang terverifikasi:**
- Komposisi BMN dinyatakan eksplisit di LBP: **Tanah 74%, Gedung 19%, P&M 6%** — caveat
  "kolom bergeser" edisi pertama dicabut.
- Neraca per satker: **top 3 = 38,87%**, top 10 = 62,95%, 22 satker bernama = 77,71%.
  KJRI Los Angeles (kandidat pilot T-3) = Rp 912,9 M = 1,55%. Rekonstruksi cocok persis
  dengan total terbit.
- Seri 18 tahun: BMN **15,1x** nilai 2007; **revaluasi 2018 saja = 46,6%** dari seluruh
  pertumbuhan. Neraca membesar karena dinilai ulang, bukan karena membangun.
- **Register persetujuan Sem I 2025**: 492 Penggunaan, **5 Pemanfaatan (semua Sewa)**,
  KSP/BGS/BSG/KSPI/KETUPI/Tukar Menukar/Hibah **nol semua**. Gap 1 terbukti empiris.
  16,78% BMN belum ditetapkan status penggunaannya.
- Kedua blok pendapatan menyusut FY2024: konsuler **-1,98%**, aset **-24,18%**.
- **Belanja Jasa +57,80%** (FSR + kurs 15.416→16.162) vs **Pendapatan Sewa -22,58%** —
  gunting kedua, jadi judul slide 7.
- Denominator dikoreksi: **130 satker Perwakilan** (dari LK), jadi "delapan dari 130
  Perwakilan + satu satker pusat", bukan "sembilan dari 133".
- Grid sensitivitas 5 imbal hasil x 6 target belanja; sel terkecil Rp 1,9 T.
- **[ASUMSI] backlog benchmark**: rasio FCDO 18% (450jt/2,5m GBP) diterapkan ke stok
  gedung RI = **~Rp 2,0 T**, 4,1x belanja modal gedung FY2024. Ditandai "benchmark
  transfer, not a measurement" di setiap tempat pakai, dan digerbangi verify.py.

**Gerbang**: 45 prose facts + **39 identitas aritmetik** + 8 label asumsi/caveat.
`content_add.py` menampung blok data edisi kedua, `charts2.py` delapan figure baru.

**Jebakan build baru:** jangan taruh panel penjelas di dalam figure yang punya bar
panjang (fig-instruments menimpa label 492); `_n` deck mulai dari 0 sehingga slide judul
tidak bernomor — itu disengaja. Proof deck lewat PowerPoint COM (`SaveAs(..., 32)`),
LibreOffice tidak terpasang.
