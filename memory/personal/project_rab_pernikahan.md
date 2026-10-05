---
name: RAB Tunangan & Pernikahan
description: "RAB tunangan Rp50 jt + nikah Rp200 jt, 7 sheet (RAB + kolom Ditanggung, Alternatif Venue 20 opsi, Rencana Tabungan dua fase, Daftar Undangan). Per 5 Okt 2026: tunangan Rp56,7 jt (lebih Rp6,7 jt karena cincin Frank & co. Rp32 jt), nikah CIBIS 300 Rp213,1 jt (lebih Rp13,1 jt; CIBIS 200 Rp194,8 jt muat). Builder C:\Users\rivsy\dev\personal\rab-pernikahan (mesin riv)"
metadata:
  type: project
---

Dibuat 4 Okt 2026, sesi Bara di mesin riv. Scope: personal.

**Lokasi (mesin riv):** `C:\Users\rivsy\dev\personal\rab-pernikahan\`. Alur: `data.py` (item, harga, sumber) →
`build.py` → `recalc.ps1` (Excel COM) → `verify.py` (gerbang). Hasil: `out\RAB_Tunangan_Pernikahan.xlsx`, 7 sheet:
Ringkasan, RAB Tunangan, RAB Pernikahan, Alternatif Venue, Rencana Tabungan, Daftar Undangan, Sumber. Alat Office: [[reference_office_render]].

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
  Cerita Rasa Glasshouse resmi 2026: 100 pax Rp171,9 jt, 200 pax Rp218,1 jt; Arena Lakeside 100/200 Rp220/285,4 jt; Azalia 200 Rp221 jt.
- Fakta baru: CIBIS Park = Sirih Gading Venue Management, Jl. TB Simatupang No.2 (pricelist Gold 2026 upd 31 Jul 2026 dari
  Aldo: 100/200/300/400/500/600 pax = Rp135/153/170/183/199/213 jt; deposit Rp2 jt; DP Rp5 jt hangus). NIWA Prive
  (Cipayung, Jaktim) = venue baru Sirih Gading, open house 4 Okt 2026; Silver 100/200 pax Rp37,5/49 jt, Gold Rp77/87 jt
  (dari gambar carousel IG). Arena Lakeside = Riviera Ballroom Kemayoran, harga ++ (pajak 10% + servis 7%), venue +
  katering saja. Swasana Hadjatan Package (Kulo WO, grup Kediaman Corp) mulai Rp52,5 jt, 100–700 pax (IG 27 Sep 2026).
  "Levictus" = Leviticus 11 (Meruya, Jakbar). Cara riset: [[reference_social_price_research]].

⚠ OPEN: harga Hadjatan 300 pax — per 5 Okt harus ≤ ±Rp140 jt agar nikah muat Rp200 jt (≤ ±Rp158 jt bila mahar &
seserahan terpisah). Aldo yang minta ke Swasana.
⚠ OPEN: apakah Rp200 jt termasuk cincin, mahar, seserahan? Ini menentukan apakah CIBIS 300 muat.
⚠ OPEN: NIWA Prive — porsi, jam, nett/++ belum diketahui (harga dari iklan).
- Cerita Rasa (PDF Price List Banquet Event 2026 dari Aldo, dibuat 30 Sep 2026): Glasshouse 80–250 pax, 3 jam; buffet
  Menu Cerita/Rasa/Nusantara Rp315/365/415 rb++ per pax; pajak & servis 17,7%; minimum belanja Glasshouse Rp35 jt;
  sewa Glasshouse Rp10 jt (Sen–Kam) / Rp15 jt (Jum–Min) nett — dianggap terpisah dari minimum belanja (⚠ belum
  dikonfirmasi). Joglo/Function Room untuk lamaran: venue + makan ±Rp34–41 jt, tidak muat RAB tunangan Rp50 jt.
  Brosur Glass House (PDF kedua) hanya foto.

**Update 5 Okt 2026 — daftar perubahan dari Aldo (dibuat bersama pasangan):**
- Sheet baru: `Daftar Undangan` (400 baris, dropdown pihak/kelompok/acara/jenis/RSVP, ringkasan vs kapasitas venue dan
  50 undangan cetak) dan `Rencana Tabungan` (setoran dua fase per orang; jadwal bayar venue ikut syarat CIBIS: DP Rp5 jt,
  cicilan 10/20/20/30% di bulan +1..+4, pelunasan H-1 bulan; tanggal masih CONTOH). Kolom `Ditanggung` (Berdua/Pria/
  Wanita/Ortu pria/Ortu wanita) di kedua RAB; default Berdua, mahar/seserahan/hantaran = Pria. Verify 1.105 rumus lulus.
- Tunangan: tenda/kursi/sound, undangan digital, souvenir, Hiace dihapus; MC Rp500 rb; cincin SEKALI untuk tunangan +
  nikah: Frank & co. Love Poetry Marea Diamond Couple 18K Rp32 jt (halaman produk, dicek 5 Okt 2026) masuk RAB Tunangan;
  dekorasi Rp2,5 jt, hantaran Rp3 jt, foto+video Rp2,7 jt, MUA ibu Rp800 rb; cadangan tunangan 10% → 5%.
- Nikah: siraman & midodareni Rp8,5 jt (harga terbawah kisaran invidoto 2025); undangan hardcover 50 lembar; mobil Rp1 jt;
  tip Rp2 jt; seragam keluarga dihapus; prewedding Rp2 jt; seserahan Rp7,5 jt; souvenir Rp5 rb. Opsi CIBIS Gold 400 pax
  Rp183 jt ditambahkan (total Rp227,1 jt).
- Hasil: tunangan Rp56,69 jt; nikah CIBIS 300 Rp213,06 jt (tanpa mahar & seserahan Rp194,7 jt); total dua acara
  Rp269,75 jt vs Rp250 jt. Tabungan contoh (mulai Nov 2026, booking Des 2026, tunangan Mar 2027, nikah Okt 2027): fase 1
  Rp32,9 jt/bln sampai Apr 2027 (puncak cicilan CIBIS), fase 2 Rp12,4 jt/bln. Booking venue lebih dekat ke hari H
  menurunkan setoran puncak (contoh booking Apr 2027: ±Rp23,6 jt/bln).

