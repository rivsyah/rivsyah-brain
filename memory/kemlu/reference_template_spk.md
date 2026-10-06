---
name: reference-template-spk
description: "Template SPK + Adendum SPK Barang/Jasa Lainnya (Claude Doc, 23 Sep 2026) + dasar hukum yang sudah diverifikasi live: batas SPK, Pasal 54/56/79, PPN efektif 11%, Perlem 12/2021 jo. 4/2024 masih berlaku"
metadata:
  type: reference
---

Template SPK dan Adendum SPK untuk Pengadaan Barang/Jasa Lainnya dibuat 23 Sep 2026 sebagai Claude Doc:
https://claude.ai/code/artifact/10c8dee2-6796-4133-a964-edb49980adc1

Isi: catatan penggunaan, SPK (kop Kemlu + [Satker]), Lampiran I rincian harga, Lampiran II Syarat Umum (23 angka),
Adendum SPK (jenis A volume/nilai, B jadwal, C pemberian kesempatan, D administratif), lampiran adendum + daftar periksa.
Versi Word (23 Sep 2026): `C:\Users\rivsy\Documents\Template SPK dan Adendum SPK - Barang Jasa Lainnya.docx`
(mesin ini). 13 hlm A4, dibuat ulang dengan docx-js, BUKAN ekspor mentah Claude Doc. Tambahan dibanding Doc:
isian wajib berlatar kuning, pilihan berlatar biru muda, kaki halaman paraf PPK/Penyedia, nomor halaman mulai
dari 1 di SPK dan di Adendum, lampiran adendum landscape + blok tanda tangan, daftar periksa jadi halaman
terpisah khusus PPK. Doc dan .docx sekarang dua salinan terpisah: edit di satu tidak ikut ke yang lain.
Cara render/cek dokumen di mesin ini: [[reference-office-render]].

Fakta yang sudah dicek live (23 Sep 2026) — pakai ini, jangan riset ulang:
- Pasal 28 ayat (4) Perpres 16/2018 jo. Perpres 46/2025: SPK untuk Barang/Jasa Lainnya > Rp50 jt s.d. Rp200 jt;
  Konstruksi s.d. Rp400 jt (naik dari 200 jt); Konsultansi s.d. Rp100 jt. Konsisten dengan `KONFIG_REGULASI`
  di [[project-ukpbj-kemlu]].
- Perpres 46/2025 berlaku 30 Apr 2025. Pengadaan Langsung > Rp50 jt wajib lewat SPSE fitur transaksional.
- Pasal 54: tambah nilai kontrak maks 10% dari nilai awal + anggaran tersedia. Pasal 56: kesempatan lewat adendum,
  boleh lewat tahun anggaran (batas 50 hari kalender ada di Perlem 12/2021, bukan di Perpres). Pasal 79 (4)-(5):
  denda 1‰ per hari dari nilai kontrak/bagian kontrak sebelum PPN.
- Peraturan LKPP 12/2021 (pedoman via penyedia, memuat model SPK) masih berlaku, diubah Perlem 4/2024.
  Perlem 2/2025 = penunjukan langsung program prioritas. Perlem 2/2026 (terbit 1 Sep 2026) = katalog elektronik,
  mencabut Perlem 9/2021 — bukan soal SPK.
- PPN 2026: 12% x DPP nilai lain 11/12 = efektif 11% untuk nonmewah (PMK 131/2024, tidak berubah untuk 2026).
- (27 Sep 2026) Perpres 46/2025 **menghapus Pasal 33 ayat (2) huruf b** — e-purchasing TIDAK lagi otomatis bebas
  Jaminan Pelaksanaan; yang menentukan hanya Ps. 33 (1): wajib bila nilai kontrak > Rp200 jt. Sumber lama
  (pasal.id halaman Perpres 16/2018, artikel pelatihan) masih memuat huruf b — cek halaman Perpres 46/2025.
- ~~(27 Sep 2026) Pasal 78 ayat (3) hanya huruf a–f; ayat (5) huruf e = ganti kerugian~~ — **SALAH per konsolidasi
  resmi LKPP Perpres 46/2025 (dicek 6 Okt 2026):** Ps. 78 ayat (3) kini huruf a–i (g/h/i = TKDN lebih rendah, barang
  impor, produk impor self declare); **ayat (5) DIHAPUS**; jenis sanksi ada di **ayat (4)** (a. digugurkan, b. pencairan
  jaminan, c. Daftar Hitam, d. ganti kerugian, e. denda). Kutip ganti kerugian sebagai "Ps. 78 ayat (3) huruf e dan ayat
  (4) huruf d". Kewajiban PDN: Ps. 66 (diganti penuh 46/2025, urutan TKDN+BMP 40% / TKDN 25%). Ps. 54 ayat (2) = tambah
  maks 10%; Ps. 85 ayat (1) huruf a + ayat (2) = layanan sengketa LKPP. Lihat [[project-pengadaan-bus-zenix-2026]].

Celah terbuka: Pasal 28 tidak mengatur SPK yang melewati Rp200 jt karena adendum (maks +10%). Ditulis sebagai
butir "minta pendapat UKPBJ/biro hukum" di daftar periksa.
