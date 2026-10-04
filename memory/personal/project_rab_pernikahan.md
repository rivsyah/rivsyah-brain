---
name: RAB Tunangan & Pernikahan
description: "RAB tunangan Rp50 jt (keluarga + sahabat) dan nikah Rp200 jt 300 tamu di Swasana Lippo Kuningan. Tunangan muat (Rumah Rp48,2 jt); nikah TIDAK muat (est. Rp362 jt, batas paket venue Rp139 jt); harga Swasana 300 pax belum terbit. Builder di C:\\Users\\rivsy\\dev\\personal\\rab-pernikahan (mesin riv)"
metadata:
  type: project
---

Dibuat 4 Okt 2026, sesi Bara di mesin riv. Scope: personal.

**Lokasi (mesin riv):** `C:\Users\rivsy\dev\personal\rab-pernikahan\`. Alur: `data.py` (item, harga, sumber) →
`build.py` → `recalc.ps1` (Excel COM) → `verify.py` (gerbang). Hasil: `out\RAB_Tunangan_Pernikahan.xlsx`, 4 sheet:
Ringkasan, RAB Tunangan, RAB Pernikahan, Sumber. Alat Office: [[reference_office_render]].

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
