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
Belum ada versi .docx — ekspor kalau Aldo minta.

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

Celah terbuka: Pasal 28 tidak mengatur SPK yang melewati Rp200 jt karena adendum (maks +10%). Ditulis sebagai
butir "minta pendapat UKPBJ/biro hukum" di daftar periksa.
