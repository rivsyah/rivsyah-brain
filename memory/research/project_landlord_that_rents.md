---
name: project-landlord-that-rents
description: "Brief Retention Before Agency versi PNBP konsuler (10 Okt 2026, 31pp + deck 25 slide): fokus PNBP paspor/visa/dokumen; aset BMN dibuang (dikelola Kemenkeu); Retention Agenda 5 stream 10 aksi; versi estate diarsip; folder tetap Landlord-That-Rents; ed.4 dibekukan"
metadata: 
  node_type: memory
  type: project
  originSessionId: 4d538033-6b39-404d-ad2d-715697a084d7
  modified: 2026-10-10T14:45:00.000Z
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
Beban FSR Rp342,48M = **Rp702,0M** [ED.4: kelipatan 310x/151x SALAH BASIS — beban akrual dibagi penerimaan KAS Rp2,27M; akrual kedua sisi = **246x**, rumah dinas 120x]. Tabelnya
bergeser satu baris; pasangan dikunci narasi (Jasa Konsultan Rp28,87M +22,75%). Sewa
menjelaskan hampir seluruh kenaikan Belanja Jasa Rp373,3M (akrual +Rp384,9M).

**Data baru:** penyusutan gedung 34,8% (akum Rp3,85T dari bruto Rp11,07T); **rasio pembaruan**
(belanja modal gedung / beban penyusutan gedung Rp517,5M) **93% FY2024 vs 171% FY2023**
[ED.4: 93% MENGHITUNG CICILAN+BUNGA UTANG 7 GEDUNG Rp195,7M SEBAGAI RENEWAL; bersih = **55%**],
benchmark NSW OLG 100%; asuransi 61 dari 145 satker, nilai tanggungan Rp145,0M = 1,31% stok
[ED.4: SALAH — Rp145,0M itu total PREMI; tanggungan Rp1,13T = 10,1%; 47 dari 146 satker FY2025]
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

**Dipakai sebagai sumber data (read-only)** oleh tesis MBA di `~/dev/personal/wharton-thesis`
([[project-wharton-thesis]]). `src/facts.py` di sana mengimpor `content.py`. Kalau nama konstanta di
content.py diubah, jalankan `python src/facts.py --check` di folder tesis.

## Koreksi & data baru — 4 Okt 2026 (sesi tesis MBA)

- **LBP TA 2025 AUDITED sudah terbit** di e-PPID (25 Sep 2026): `e-ppid.kemlu.go.id/file-service/storage/uploads/
  17903157556ab60cebe5d31_VII__Data_perbendaharaan_atau_inventaris_Tahun_2025__1_.pdf` (686 hlm, ada text layer,
  tabel ringkasan TIDAK offset). Neraca 31 Des 2025: BMN Rp59.304.526.726.246 (+0,59%); tanah tetap
  Rp43,78 T; gedung Rp11,27 T (+2,47%, akumulasi penyusutan 37,06%); 131 Perwakilan.
- **Saldo idle terkonfirmasi tanah sewa:** koreksi audit sesuai PMK 100/2025 memindahkan tanah hak pakai
  jangka panjang di 5 pos (Canberra, Nairobi, Abuja, Kota Kinabalu, Kuala Lumpur) ke akun baru 166117
  "Hak Pakai Tanah Luar Negeri" Rp229,5 M. Saldo idle turun 62,30% menjadi Rp128,6 M (Rp94,8 M aset tetap +
  Rp33,8 M software/lisensi).
- **Register FY2025 setahun penuh:** 499 penetapan status penggunaan lawan 13 sewa; instrumen pemanfaatan lain
  nol; penjualan 51, pemusnahan 92, penghapusan 26 (total 681). BMN tanpa PSP 5,25% (Juni: 16,78%).
- **KLAIM ASURANSI ED.3 SALAH:** "nilai tanggungan Rp145,0 M = 1,31% stok gedung" keliru. LBP audited:
  nilai pertanggungan Rp1,13 T, premi Rp145,0 M. Total Rp145,0 M itu digelembungkan entri mustahil di Tabel A:
  premi Rp114,1 M untuk rumah dinas Brasília yang ditanggung Rp11,5 M (digitnya = nomor polis 114 11 4181501).
  Laporan Semester I menyajikan total yang sama sebagai nilai pertanggungan. 47 dari 146 satker
  diasuransikan di FY2025.
- LK TA 2025 audited (arus) belum ditemukan publik. File `Laporan_Keuangan_Kemlu_TA_2026___Semester_I.pdf`
  di folder Kemlu adalah cetakan Google Docs internal Rokeu, BUKAN versi terbit; tidak dipakai.

## Edisi keempat — 4 Okt 2026 (sesi ini)

**Basis pindah ke posisi audited 31 Des 2025.** Sumber baru (publik): LBP TA 2025 Audited
(e-PPID 25 Sep 2026; disimpan `sources/LBP_Kemlu_TA_2025_Audited.pdf`). Lampirannya memuat
**neraca percobaan akrual tingkat K/L 31 Des 2025 (audited)** = semua akun LO FY2025.
Pemetaan baris: TRANS, KODE, DEBET, KREDIT, NAMA.

- **Identitas kunci:** di LK 2024 Tabel 107, DDEL = PNBP LRA dan DKEL = belanja LRA,
  keduanya persis sampai rupiah. Maka FY2025: **PNBP Rp483.105.394.611 (−9,60%)**, belanja
  Rp9.330,3M.
- **Gap retensi FY2025 = Rp253,0M** (FY2024 Rp304,3M). Korpus 4–7% = **Rp3,61–6,33T**, yaitu
  28–49x saldo idle Rp128,6M.
- **Sewa FY2025** Rp748,9M (premises 360,1 + FSR 388,8; +6,68%); sewa diterima akrual Rp3,31M →
  **226x**. Fee konsuler akrual −16,1% (visa −38,9%, paspor −14,9%, dokumen +9,1%); refund VAT
  +36,1%.
- **Penyusutan gedung FY2025** Rp501,0M; keausan 37,06%. C6 tetap terbuka karena LK TA 2025
  (arus/LRA) belum terbit per 4 Okt.
- **Buku utang 7 gedung** (data publik di LK 2024 C.5.2/C.6.1 dan PMK 53/PMK.02/2015):
  - Tujuh gedung: London, Phnom Penh, Chicago, Johor Bahru, Kuching, Warsawa, Tawau. Bank: BNI
    dan Mandiri. Ditarik ±Rp1,90T pada 2016–2019.
  - Saldo: Rp941,3M (Des 2023) → 799,8M (Des 2024) → **670,8M (Des 2025)**. Angka Des 2025 cocok
    sampai rupiah dengan neraca percobaan audited.
  - FY2024 dibayar Rp195,7M: pokok 141,6M dan bunga ±54,1M (±6,2%). Bunga dihitung turunan.
- **Koreksi ed.4:**
  - Basis kelipatan sewa (310x → 246x, akrual kedua sisi).
  - Renewal (93% → 55% bersih).
  - Asuransi (temuan peer, terverifikasi).
  - Idle Rp339,6M direklasifikasi audit ke Hak Pakai Tanah LN Rp229,5M, tidak terjual → idle
    Rp128,6M. Ini mengonfirmasi bacaan brief sejak ed.1.
- **Calls jadi 8:**
  - C6 dirumuskan ulang: bersih dari layanan utang, ambang Rp501,0M.
  - **C7:** kelipatan sewa FY2026 >200x.
  - **C8:** plafon PNBP di RKA-K/L FY2027 <Rp300M dan baris BLU nol.
- R8 dan R10 diperbarui (lantai renewal bersih dari layanan utang).
- **Output:** PDF 55 hlm, 30 figure, 18 tabel, 63 referensi. Gate: 78 prose facts, 83 identitas,
  19 akronim, 28 penjaga stale, 0 gagal. Deck 34 slide, gate bersih, sudah di-proof via
  PowerPoint COM.
- **File baru:** `src/content_v4.py`, `src/charts4.py`.
- **KESALAHAN SAYA:** build menimpa PDF ed.3 (namanya sama). Hanya deck ed.3 yang sempat
  disalin ke `out/superseded/`.
  - **Pelajaran:** salin PDF dan deck ke `superseded/` SEBELUM `make.py` dijalankan.
- **Koordinasi peer:** content.py dibaca read-only oleh tesis MBA (snapshot `data/facts.json`
  terkunci).
  - Nama yang di-rebind: BMN_TOTAL, SATKER, INSTRUMENTS, UNASSIGNED_PCT, RETENTION_GAP,
    RENT_BILL_X, INS_*.
  - Nilai lama disimpan di nama `_JUN25` / GAP_2024.
  - `facts.py --check` sempat DRIFT 43 dari 354 fakta. Peer sudah menyelaraskan tesis ke
    ed.4 (4 Okt): `--check` kini lolos, kunci tengah tahun membaca nama `_JUN25`.
  - Peer juga memverifikasi ulang secara independen dua angka v4 ke sumber: layanan utang
    Rp195.659.351.477 (LK 2024) dan baris LO25 + DTEL_2025 (neraca percobaan LBP 2025).
    Keduanya cocok.
- **LK TA 2026 Semester I** (`Research Reports\Kemlu\Laporan_Keuangan_Kemlu_TA_2026___Semester_I.pdf`):
  - Metadata menunjukkan cetakan Google Docs, penulis "Rokeu", dibuat 30 Jul 2026, tanpa ID
    e-PPID. Jadi ini dokumen internal (scope kemlu), BUKAN versi terbit.
  - TIDAK dipakai di brief publik. Status menunggu jawaban Aldo.
  - Isinya ada saya baca: sewa H1 +26%, PNBP H1 Rp238,8M melampaui plafon setahun, MP I PNBP
    Rp22,6M menahan renovasi. Data ini jangan masuk brief kecuali versi terbitnya keluar.

## Rebuild master prompt v3 — 10 Okt 2026: *Retention Before Agency*

**Status: DIGANTIKAN 10 Okt 2026 sore oleh versi PNBP konsuler (lihat bagian berikut); diarsip di `out/superseded/2026-10-10-estate-*` dan `src/estate/`.** Brief berdiri sendiri: tidak ada label edisi dan
tidak merujuk brief lain.

- **File.** `out/Retention-Before-Agency.pdf` (31 hlm; 23 figur, 14 tabel, 3 kotak,
  46 referensi). `out/Retention-Before-Agency-Deck.pptx` (23 slide, 3 chart native).
  Ada juga `out/data/*.csv`, `out/proof/`, `out/proof_deck/` dan `out/delivery-note.md`
  (catatan §14).
  - PDF dan deck ed.4, dossier ed.4 serta README ed.4 diarsip ke `out/superseded/`
    (`ed4-*`).
  - `out/DELIVERED.json` menandai file terkirim. `make.py` mengarsipnya dulu sebelum
    rebuild.
- **Gate.** Brief 57 cek, 0 gagal (16 pra-render, 37 PDF, 4 PDF bercap). Gate deck: 100
  angka dicek balik, 0 masalah. Deck terbuka di PowerPoint (ekspor COM lewat
  `src/make_deck_proof.ps1`).
- **Keputusan Aldo.** Judul "Retention Before Agency: Sequencing Indonesia's Diplomatic
  Asset and Endowment Reform"; kerangka the Retention Agenda; pohon pertanyaan versi Aldo
  (aset hak milik dan PNBP; biaya gedung DIPA; infrastruktur; pelindungan WNI berulang dan
  asuransi diaspora; imun vs komersial; skenario).
- **Keputusan saya (tercatat).**
  - S1 (kertas kerja) dan S6 (cetakan LK Sem I 2026) diperlakukan sebagai `background`
    sesuai default v3. Tidak ada kutipan, angka atau grafik dari keduanya. Brief kini
    menilai pilihan reformasi secara umum, bukan menilai kertas kerja.
  - Output PDF + deck; font Garamond terpasang.
- **Arsitektur v3.**
  - `content.py` baru: 307 angka, masing-masing dengan unit/periode/basis/sumber/locus/
    grade; 48 sumber dengan status clearance; 71 identitas; model skenario
    deterministik; CALLS lima bagian; ACTIONS tujuh bagian.
  - Placeholder `{{N:key|spec}}` dan `{{S:key}}`. Angka besaran yang diketik di prosa
    menggagalkan gate; yang diizinkan hanya kelas identifier (tahun, tanggal, sitasi
    hukum, ID).
  - Skrip `ledger.py` → `src/verification.md` dan `dossier.py` → `sources/dossier.md`.
  - `content_ed4.py` = store ed.4 yang dibekukan untuk pembaca peer (mengimpor
    content_add/v3/v4). Skrip ed.4 ada di `src/ed4/`.
- **Temuan dan angka kunci.**
  - PNBP FY2025 kas Rp 483,1 M. Ini dari lampiran LRA per akun di LBP 2025 Audited,
    yang baru ditemukan; totalnya sama dengan akun 313121. Fee kas turun 16,4%.
  - Plafon FY2026 Rp 230,1 M → gap Rp 253,0 M = 95% dari program pelindungan WNI FY2026
    (Rp 266,2 M = Setjen 193,8 + Protkons 72,3).
  - Biaya menjalankan gedung FY2025 Rp 1,27 T (akrual) + penyusutan Rp 501,0 M; sewa
    226× (akrual).
  - Renewal bersih 55%. Gedung kantor Rp 8,28 T (522 item); hunian Rp 2,91 T (760).
  - MP PNBP tahap I hanya 40% (LK 2024) menunda kontrak renovasi perwakilan.
  - Kasus WNI 2024: 67.297 (2023: 53.598 versi Feb 2025, atau 44.521 versi Jan 2024).
    Dipulangkan 2025: 27.768. Tidak ada skema asuransi diaspora negara. PMI sudah di
    BPJS (Rp 370.000 per kontrak 24 bulan).
  - Pembanding: OWWA US$25 dana amanah; ICWF dari biaya layanan konsuler; Korea
    Foundation US$12 dari paspor US$52.
- **Koreksi.** FCDO: 933 dari 2.711 gedung yang dinilai (34%), BUKAN dari ±6.500.
  Klaim "idle sebagian besar tak bisa dijual" dicabut, karena komposisi Rp 128,6 M
  tidak diungkap.
- **Konflik sumber yang belum bisa diselesaikan.** Tanggal putusan Paris: 11 Des 2025
  (Jus Mundi; teks 403) atau 18 Des (opini) → grade C. Klaim kasasi Prancis 12 Jun 2025
  bersumber dari Payan (EJT).
- **Call, diurutkan menurut tenggat.**
  - C4: renewal bersih < penyusutan di LK FY2025 audited, tenggat 31 Des 2026.
  - C3: plafon FY2027 < Rp 300 M, tenggat 31 Mar 2027.
  - C5: sewa > 200× FY2026, dan C6: fee FY2026 < FY2025; keduanya 30 Sep 2027.
  - C1, C2, C8: tenggat 31 Des 2028. C7: tenggat 31 Des 2029.
- **Jebakan baru** dicatat di §13 v3: hatch.color, letter-spacing, hyphen dan U+2011,
  caption ter-escape, caption tabel yatim, locale PowerPoint, label grade D yang
  rendernya sama dengan angka grade A, entity `&ndash;`.

## Rebuild PNBP konsuler — 10 Okt 2026 (sore): *Retention Before Agency*

**Status: TERKIRIM 10 Okt 2026.** Instruksi Aldo: buang pengelolaan aset, karena BMN
dikelola Kemenkeu sebagai Pengelola Barang dan Kemlu hanya Pengguna Barang; fokus ke
PNBP paspor, visa, dokumen dan layanan konsuler lain.

- **File.** `out/Retention-Before-Agency.pdf` (31 hlm; 22 figur, 13 tabel, 3 kotak,
  69 referensi) dan `out/Retention-Before-Agency-Deck.pptx` (25 slide, 3 chart native).
  Ada juga `out/delivery-note.md` (dibuat oleh `src/delivery_note.py`).
  - Versi estate pagi ini diarsip di `out/superseded/2026-10-10-estate-*`, skripnya di
    `src/estate/`.
  - `out/DELIVERED.json` berlabel `2026-10-10-pnbp`.
- **Gate.** Brief 56 cek, 0 gagal; 74 identitas lolos. Deck: 129 angka dicek balik,
  0 masalah; terbuka di PowerPoint (COM).
- **Keputusan saya (tercatat).**
  - Judul tetap; subjudul jadi "Sequencing Indonesia's Consular Revenue Reform".
  - Stream baru: Retain, Price, Count, Protect, Build last.
  - Pelindungan WNI dipertahankan sebagai penggunaan PNBP.
  - S1 dan S6 tetap background.
- **Temuan kunci (semua dari sumber publik).**
  - PNBP FY2025 Rp483,1 M, dengan fee konsuler Rp324,5 M (67,2%; turun 16,4%). Sisanya
    refund VAT Rp61,4 M, pengembalian persekot gaji Rp64,5 M, pemulihan lain dan
    properti.
  - Seri: FY2021 Rp413,7 M; FY2022 Rp436,9 M; FY2023 Rp538,2 M; FY2024 Rp534,4 M.
    Realisasi selalu 108–127% dari estimasi.
  - **PP 21/2025 Pasal 5:** PNBP kementerian lain yang dipungut perwakilan adalah PNBP
    Kemlu, tetapi dengan tarif kementerian asal. Jadi paspor dan visa bertarif Imigrasi
    (PP 45/2024), sebesar 59,4% fee; Kemlu hanya menetapkan tarif dokumen (37,0%).
  - Lampiran PP 21/2025 menggantikan PP 49/2016:
    - legalisasi dalam negeri Rp25.000 (hanya WNA) menjadi Rp50.000 (semua pemohon);
    - dokumen bisnis US$125 menjadi US$140;
    - dokumen nonbisnis US$25 menjadi US$30;
    - mulai berlaku Juli 2025.
  - VoA 89,8% dari 5,16 juta visa tahun 2024. PNBP Imigrasi 2024 Rp9,01 T (visa
    Rp5,03 T). Visa di perwakilan turun 27,8% (2023–2025), sementara kedatangan WNA naik
    31,8%.
  - Plafon PNBP FY2026 Rp230,1 M (47,6% PNBP; 70,9% fee). Sebanyak 99,5% ada di program
    Dukungan Manajemen (Setjen 011.01.WA); hanya Rp1,1 M di program pelindungan.
  - MP PNBP: PMK 110/PMK.05/2021 membolehkan tahap I 60% sejak Januari, tetapi FY2024
    hanya 40%. PP 58/2020 sudah dicabut oleh PP 44/2025 (Pasal 46).
  - Kurs: rupiah melemah 10% menambah penerimaan Rp17,9–43,3 M tetapi menambah biaya
    TPLN dan staf lokal Rp333,2 M (estimasi).
  - Pembanding:
    - AS (CBSP): US$3,47 miliar (FY2019), lalu US$1,99 miliar (FY2020); GAO mencatat
      turun 41%; dana darurat US$300 juta.
    - UK: consular premium £18,62 per paspor.
    - Filipina: posts boleh memakai valas sebagai working fund (GAA 2025).
  - Kasus WNI 2024: 67.297 (LKj PWNI). Dipulangkan dari krisis 2025: 27.768.
- **Belum ditemukan:**
  - surat persetujuan penggunaan PNBP Kemlu dan persentasenya;
  - jumlah apostille nasional;
  - volume layanan per perwakilan;
  - biaya per layanan.
- **Call, diurutkan menurut tenggat.**
  - C1: plafon FY2027 di bawah Rp300 M, tenggat 31 Mar 2027.
  - C2, C3 dan C4, tenggat 30 Sep 2027:
    - C2: fee FY2026 di bawah FY2025;
    - C3: visa perwakilan FY2026 di bawah Rp58,6 M;
    - C4: dokumen FY2026 tidak di bawah Rp120,0 M.
  - C5: tidak ada bebas visa untuk Australia, India, Jepang atau Korea Selatan, tenggat
    31 Des 2027.
  - C6 (tidak ada BLU) dan C7 (tidak ada dana pelindungan), tenggat 31 Des 2028.
- **Jebakan baru** dicatat di §13 v3: lampiran regulasi yang berupa pindaian; reproduksi
  DDTC; escape `\u` di tool call; `chart.has_title`; pertanyaan bab yang terpotong
  antarhalaman; anggaran pencarian web yang dipakai bersama oleh agen riset.
