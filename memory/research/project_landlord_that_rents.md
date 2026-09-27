---
name: project-landlord-that-rents
description: "Brief BPADAD - Badan Pengelola Aset dan Dana Abadi Diplomasi (ed.3, 50pp + deck 28 slide; terbit pertama sbg The Landlord That Rents) menilai kertas kerja BLU Kemlu; Retention Agenda; folder tetap Landlord-That-Rents"
metadata: 
  node_type: memory
  type: project
  originSessionId: 4d538033-6b39-404d-ad2d-715697a084d7
  modified: 2026-09-27T12:00:00.000Z
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

## Edisi ketiga — 27 Sep 2026 (JUDUL BARU)

**Judul: *Badan Pengelola Aset dan Dana Abadi Diplomasi*** — sub-judul "Retention first: the
case, the numbers and the sequence for Indonesia's diplomatic asset and endowment agency".
Aldo minta ini di sesi ed.2; aku salah baca sebagai nama badan saja. "The Landlord That
Rents" kini judul Bab 1.5 dan disebut di sampul sebagai judul terbit pertama.

**Output** (folder SENGAJA tetap `Landlord-That-Rents` — sesi lain "MBA thesis from landlord
research" membaca path ini): `out/Badan-Pengelola-Aset-dan-Dana-Abadi-Diplomasi.pdf` 50 hlm,
26 figure, 16 tabel, 60 sumber + `...-Deck.pptx` 28 slide. PDF/deck ed.2 dipindah ke
`out/superseded/`, bukan dihapus.

**KOREKSI BESAR — tagihan sewa audited ada di catatan LO LK TA2024.** Ed.1-2 bilang tidak bisa
ditetapkan dan pakai floor FSR Rp286,1M (126x). Sebenarnya: Beban Sewa Rp359,53M (+13,38%) +
Beban FSR Rp342,48M = **Rp702,0M = 310x** pendapatan sewa; rumah dinas saja 151x. Tabelnya
bergeser satu baris; pasangan dikunci narasi (Jasa Konsultan Rp28,87M +22,75%). Sewa
menjelaskan hampir seluruh kenaikan Belanja Jasa Rp373,3M (akrual +Rp384,9M).

**Data baru:** penyusutan gedung 34,8% (akum Rp3,85T dari bruto Rp11,07T); **rasio pembaruan**
(belanja modal gedung / beban penyusutan gedung Rp517,5M) **93% FY2024 vs 171% FY2023**,
benchmark NSW OLG 100%; asuransi 61 dari 145 satker, nilai tanggungan Rp145,0M = 1,31% stok
gedung, **klaim disetor ke RKUN**; deposit di tangan pemilik asing Rp30,6M; saldo idle memuat
software Rp15,55M; temuan BPK 2021 tujuh pos tak mencatat nilai tanah Rp401,4M; koreksi luas
tanah -198.103 m2; wilayah 22 satker (Asia 57%); jalur anggaran 8,91 -> 8,70 -> 10,02 T.
**R10** renewal floor 100%; **C6** rasio pembaruan <100% lagi di LK FY2025 audited; R2 kini
mencakup hasil klaim asuransi.

**Cacat yang ditemukan sesi peer (semua valid, sudah diperbaiki):** metadata PDF masih
"From Rulemaker to Buyer" + keyword LKPP (stamp.py hasil fork!), tanda tangan penutup tertanggal
10 Sep, dua caption dengan nomor figure basi, caveat "kolom bergeser" yang sudah dicabut,
gloss LMAN ganda. **Temuanku sendiri:** klaim "second largest balance-sheet item any of its
ministries holds" di penutup TIDAK PERNAH diverifikasi sejak ed.1 — dihapus; empat
rujukan paragraf basi di tabel calls; tanda "--" di deck.

**Gerbang baru:** verify.py menolak teks basi (C.STALE), nomor Figure/Table ketikan tangan
(kecuali "Table N" yang merujuk dokumen sumber), gloss ganda, "--", dan sampul tanpa judul
kini; make.py mengecek metadata PDF setelah stamp; **make_deck.py kini punya gerbang sendiri**
(deck dua edisi lolos tanpa dicek). Hitungan: 56 prose facts, 54 identitas.

**Belum bisa:** LK Semester I 2025 & DIPA 2025 ada di e-ppid.kemlu.go.id tapi di balik
anti-bot JS (tidak ditembus, sesuai aturan); link lama kemlu.go.id/files/repositori -> 404.
Aldo bisa unduh manual lewat browser untuk edisi berikut (data tahun efisiensi).

**Jebakan:** heredoc Git Bash merusak escape backslash-n di string Python (jadi newline asli)
-> tulis skrip patch pakai Write tool atau chr(10).

## Edisi ketiga, cetakan koreksi — 27 Sep 2026 (sore)

Sesi peer menemukan tiga kesalahan lagi di cetakan pertama ed.3. **Ketiganya benar**, dicek
ke LK TA2024:
- **"Pendapatan Administrasi di Luar Negeri" (Rp44,78M, +50,92%) BUKAN layanan konsuler** —
  LK hlm 47: pengembalian PPN/VAT belanja rutin dari 78 Perwakilan (+ pajak bensin Wina),
  naik karena tindak lanjut rekomendasi BPK atas LK 2023. Jadi **fee konsuler = Rp388,3M =
  72,7%** PNBP (bukan 81,0%), dan **turun 5,79%** (412,1 -> 388,3), bukan 1,98% — kenaikan
  refund VAT menutupi penurunannya. Basis pungutan = Rp388,3M. Refund VAT ~20x sewa estat.
- Baris tabel t-pnbp untuk pos itu tertulis "Stable" padahal +50,92%.
- "Sepuluh satker 63,0%" = pembulatan ganda dari 62,948% -> seharusnya **62,9%**.
- **Temuanku sendiri saat memperbaiki:** kalimat "three of the four largest consular lines
  fell" sejak ed.1 SALAH (empat terbesar termasuk refund VAT yang naik; hanya dua yang turun).
  Setelah VAT dikeluarkan, "three of the four fee lines fell" jadi benar.

Label edisi kini "Third edition, corrected". Checks kini membandingkan pembulatan pada
presisi yang dicetak prosa (f"{x:.1f}"). 59 prose facts, 59 identitas. C.STALE ditambah
"81.0 per cent", "63.0 per cent", "433.1bn gross", "four largest".

**Pelajaran:** nama akun di LK (mis. "Administrasi di LN" di blok B "Pendapatan Administrasi
dan Penegakan Hukum") tidak menjamin sifat ekonominya — selalu baca catatan penjelas tiap
pos sebelum mengelompokkannya.
