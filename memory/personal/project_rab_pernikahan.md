---
name: RAB Tunangan & Pernikahan
description: "RAB tunangan Rp50 jt (muat, Rumah Rp48,2 jt) + nikah Rp200 jt. Sejak 4 Okt 2026 ada 18 opsi venue di sheet Alternatif Venue (venue dipilih di C5). 300 tamu: CIBIS Park Gold 300 (Rp170 jt, resmi 2026) total Rp232,5 jt — lebih Rp32,5 jt, muat bila cincin/mahar/seserahan terpisah; Swasana premium est. Rp362 jt; Hadjatan mulai Rp52,5 jt tier belum terbit. Intimate termurah NIWA Prive. Builder C:\Users\rivsy\dev\personal\rab-pernikahan (mesin riv)"
metadata:
  type: project
---

Dibuat 4 Okt 2026, sesi Bara di mesin riv. Scope: personal.

**Lokasi (mesin riv):** `C:\Users\rivsy\dev\personal\rab-pernikahan\`. Alur: `data.py` (item, harga, sumber) →
`build.py` → `recalc.ps1` (Excel COM) → `verify.py` (gerbang). Hasil: `out\RAB_Tunangan_Pernikahan.xlsx`, 5 sheet:
Ringkasan, RAB Tunangan, RAB Pernikahan, Alternatif Venue, Sumber. Alat Office: [[reference_office_render]].

**Asumsi yang dipakai:** "300 orang" = 300 tamu, bukan 300 kartu undangan. Tamu tunangan 70 (asumsi). Lokasi tunangan
default Rumah; toggle Rumah/Restoran/Hotel di sel C6. Dana cadangan = persen × semua item: 10% tunangan, 5% nikah.

**Hasil 4 Okt 2026:**
- Tunangan Rumah Rp48,21 jt, muat (sisa Rp1,79 jt). Restoran Rp53,49 jt, muat sampai ±59 tamu. Hotel (contoh Grand
  Whiz Poins Simatupang: Rp15 jt nett/30 pax + Rp300 rb/pax) Rp57,34 jt, muat sampai ±48 tamu.
- Nikah Rp361,96 jt vs anggaran Rp200 jt: lebih Rp161,96 jt. Batas harga paket venue agar muat: Rp139,05 jt. Semua
  item di harga pasar terendah pun Rp217,7 jt sebelum cadangan.

**Fakta Swasana (dicek 4 Okt 2026):**
- Swasana Lippo Kuningan Grand Ballroom: Lt. 9 Gedung Lippo Kuningan, Jl. HR Rasuna Said Kav. B-12. Operator Swasana
  Venue Mastery (bagian Kediaman Corp), dulu HIS Lippo Kuningan, buka Okt 2020. Minimum ideal 200 pax.
- Satu-satunya harga resmi: all-in 400 pax Rp374,8 jt (Bridestory, brosur 2023). Harga 300 pax tidak terbit, hanya lewat
  formulir "Infopricelist" di swasanawedding.com.
- Pembanding di Lippo Kuningan: Clara Wedding (WeddingMarket) 200 pax Rp211,8 jt; Kinang Kilaras 300 pax Rp185 jt
  (listing ditarik, hanya cuplikan mesin pencari). Paket WPI tanpa gedung: Basic 300 porsi Rp67,8 jt (2025).
- Estimasi 300 pax di RAB: Rp293,3 jt = titik tengah 200 pax (Clara) dan 400 pax (Swasana).
- Katering luar: Q&A Bridestory Swasana "Ya", profil HIS lama "Tidak" — bertentangan. Harga sewa venue saja tidak terbit.
- Ulasan Bridestory bintang 1 (24 Jul 2026): desakan DP dan biaya tersembunyi.
- Biaya nikah di luar KUA Rp600 rb (PP 59/2018 masih berlaku, ditegaskan Kemenag Sep 2026).

⚠ OPEN: penawaran resmi Swasana 300 pax — nett atau ++, harga per pax tambahan, lembur, bisa sewa venue saja + vendor
luar? Aldo yang minta. Isi ke baris venue di `data.py`, lalu build ulang.
⚠ OPEN: konfirmasi "300 orang" = 300 tamu, bukan 300 kartu undangan.
⚠ OPEN: jumlah tamu dan lokasi tunangan.

Insiden kecil 4 Okt: subagen riset venue membuka PDF brosur Bridestory (±21 MB) di Browser pane, muncul dialog simpan.
Berkas tidak disimpan.

**Update 4 Okt 2026 — alternatif venue (atas permintaan Aldo, daftar venue dari dia):**
- Workbook kini punya sheet `Alternatif Venue`: 18 opsi, komponen yang tidak termasuk paket ditambah harga standar
  (dekor Rp20 jt, rias Rp10 jt, foto Rp9,5 jt, hiburan Rp6 jt, MC Rp3,5 jt, WO Rp6 jt, undangan digital Rp1,7 jt,
  katering Rp150 rb/tamu). RAB Pernikahan memakai opsi di sel C5 (default CIBIS Gold 300). Verify: 497 rumus, lulus.
- Total (termasuk cincin/mahar/seserahan Rp32 jt, item acara, cadangan 5%) — non-intimate: Leviticus 11 all-in 150 pax
  Rp126 jt (maks 250 orang, Jakbar); CIBIS 100 Rp193,4 jt; CIBIS 200 Rp213,5 jt; CIBIS 300 Rp232,5 jt (Rp198,9 jt tanpa
  pribadi); Clara 200 di Lippo Rp287,5 jt; Swasana premium est. Rp362 jt; Dewandaru 300 (Memopro, cuplikan) Rp441,8 jt.
  Intimate: NIWA Silver 100/200 Rp99,1/112,4 jt; NIWA Gold 100/200 Rp134,3/146 jt; Bunga Rampai 30 pax Rp137,6 jt;
  Cerita Rasa 100 Rp169 jt (listing basi); Arena Lakeside 100/200 Rp220/285,4 jt; Azalia 200 Rp221 jt.
- Fakta baru: CIBIS Park = Sirih Gading Venue Management, Jl. TB Simatupang No.2 (pricelist Gold 2026 upd 31 Jul 2026 dari
  Aldo: 100/200/300/400/500/600 pax = Rp135/153/170/183/199/213 jt; deposit Rp2 jt; DP Rp5 jt hangus). NIWA Prive
  (Cipayung, Jaktim) = venue baru Sirih Gading, open house 4 Okt 2026; Silver 100/200 pax Rp37,5/49 jt, Gold Rp77/87 jt
  (dari gambar carousel IG). Arena Lakeside = Riviera Ballroom Kemayoran, harga ++ (pajak 10% + servis 7%), venue +
  katering saja. Swasana Hadjatan Package (Kulo WO, grup Kediaman Corp) mulai Rp52,5 jt, 100–700 pax (IG 27 Sep 2026).
  "Levictus" = Leviticus 11 (Meruya, Jakbar). Cara riset: [[reference_social_price_research]].

⚠ OPEN: harga Hadjatan 300 pax — harus ≤ ±Rp120 jt agar nikah muat Rp200 jt (≤ ±Rp154 jt bila cincin/mahar/seserahan
terpisah). Aldo yang minta ke Swasana.
⚠ OPEN: apakah Rp200 jt termasuk cincin, mahar, seserahan? Ini menentukan apakah CIBIS 300 muat.
⚠ OPEN: NIWA Prive — porsi, jam, nett/++ belum diketahui (harga dari iklan).

