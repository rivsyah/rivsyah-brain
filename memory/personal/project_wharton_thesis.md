---
name: project-wharton-thesis
description: "Tesis MBA (draft) 'The Landlord That Rents' untuk Wharton/UPenn dari brief BLU Aset Kemlu; 72 hlm, pipeline docx-js + Word PDF + gerbang 86 cek di ~/dev/personal/wharton-thesis"
metadata:
  type: project
---

Dibuat 27 Sep 2026 atas permintaan Aldo ("create a thesis from this topic, ill pursue to MBA
in University of Pennsylvania"). Aldo sendiri yang mengizinkan data dari scope research/
(brief Landlord) dipakai di scope personal/ ini.

**Lokasi:** `C:\Users\rivsy\dev\personal\wharton-thesis\` (mesin riv). Hasilnya ada di `out/`:
`The-Landlord-That-Rents-MBA-Thesis-DRAFT.docx` + `.pdf`. Ukurannya 72 hlm US Letter,
±22,9 ribu kata, 7 bab + 4 lampiran, 8 figure, 21 tabel, 96 rujukan APA 7. Bahasa Inggris
Amerika, bukan British seperti brief.

**Judul:** *The Landlord That Rents — Residual Claims, Retention Rights and the Management of a
Sovereign Estate Abroad: Evidence from Indonesia's Diplomatic Property.*

**Pipeline.** Jalankan `python src/make.py`. Urutannya:
- `facts.py` mengimpor `content.py` brief secara READ-ONLY. Hasilnya snapshot di
  `data/facts.json`. Perintah `--check` mendeteksi drift.
- `charts.py` membuat 8 figure.
- `build.js` (docx-js) merakit `chapters/*.md`. Build GAGAL jika ada `{{fact}}`, `[@ref]`
  atau cross-ref yang tidak dikenal.
- `render.ps1` meminta Word mengekspor PDF saja.
- `verify.py` adalah gerbang keras: 86 cek.
- `out/` baru ditulis kalau gerbang lolos.

**Posisi di Penn** (dicek live 27 Sep 2026; data volatil, cek lagi sebelum dipakai):
- MBA Wharton full-time dan EMBA **tidak punya tesis**.
- Jalur yang tersedia: Independent Study Project. REAL 8990 bernilai 0,5–1 CU dan butuh
  persetujuan dosen Real Estate. FNCE 8990 juga ada. Batas normalnya 1 CU per semester.
- Finance ISP tidak boleh bertumpu pada data proprietary yang tidak bisa direplikasi.
- **Lauder MBA/MA** mewajibkan Lauder Master's Thesis (INTS 9910), makalah solo 30–35 hlm.
  Program Global-nya menerima OPI Superior dalam bahasa ibu non-Inggris.
- Admisi Class of 2029: R1 sudah lewat (8 Sep 2026). **R2 5 Jan 2027**, R3 31 Mar 2027.
  Esai 50+150 kata dan 350 kata, plus esai opsional 500 kata. **Tidak ada upload paper.**
- AI: aturannya ditetapkan tiap dosen dan penggunaan AI wajib diungkap. Code of Academic
  Integrity melarang sitasi fiktif. Karena itu front matter memuat pernyataan AI.

**Temuan baru di atas brief** (brief ed.3 sudah menyerap no. 5):
1. Diagnosis organizational architecture (Brickley, Smith & Zimmerman 1995) dengan tiga kaki:
   hak keputusan, pengukuran kinerja, dan klaim residual. Ketiganya kosong.
2. Yield 0,004% mengukur pemakaian komersial, bukan return ekonomi pemilik-penghuni. Angka
   310× adalah sinyal ketergantungan pada ruang sewaan, jadi pertanyaan utamanya own-vs-lease.
3. **Retensi punya dua kanal hukum.** Tabel C.5 menjelaskan Pasal 33.
   - Hasil BMN (PP 27/2014) butuh Perpres lewat PMK 115/2020 Ps. 3(7). Nilainya kini
     ±Rp 6,8 M/thn.
   - Fee PNBP memakai UU 9/2018 **Ps. 33** + PP 44/2025. Jalurnya adalah persetujuan
     Menkeu, dan **jalur ini sudah ada**. Hampir seluruh gap Rp 304,3 M ada di sini.
4. Retensi adalah transfer intra-negara, sama seperti Tier 0. Nilainya hanya datang lewat
   perilaku dan additionality (Dye & McGuire 1992: dana earmark sangat fungible). Karena itu
   usulannya klausul maintenance-of-effort dan persetujuan multi-tahun.
5. Pos "Administrasi di LN" sebenarnya refund VAT. Fee konsuler Rp 388,3 M (72,7%) dan turun
   5,79%.
6. Aturan belanja pembanding: NACUBO FY2025 4,9%; Norwegia 3% sejak 2017. Dengan 3%, korpus
   yang dibutuhkan Rp 10,14 T.
7. HM Treasury Cm 7567 (2009) para C.38: retensi hasil penjualan aset lebih efektif daripada
   capital charge.

**Belum selesai. Keputusan ada di tangan Aldo:**
- Izin tertulis Kemlu untuk mengutip kertas kerja internal (draf 9 Sep 2026).
- Pernyataan posisi soal hubungan penulis dengan institusi. Agent tidak menulisnya.
- Pilihan jalur ISP atau Lauder. Kalau Lauder, naskah harus dipadatkan ke 30–35 hlm.
- Acknowledgements, yang harus ditulis dengan suara Aldo sendiri.

**Jebakan build** (juga tercatat di README proyek):
- Pukul 10:31–10:45 SaveAs2 Word COM gagal di **setiap** percobaan (hang atau
  RPC_E_DISCONNECTED), bahkan untuk docx satu baris. Saat itu sesi lain juga sedang memakai Word.
  Padahal sesi MDP berhasil menyimpan pukul 10:00–10:25. Dugaan kuat penyebabnya: skrip
  pembersih "bunuh WINWORD yang muncul setelah aku mulai" berbalapan antar-sesi dan saling
  membunuh Word. Solusinya: docx dikirim dari docx-js dengan `updateFields`, Word hanya dipakai
  untuk ekspor PDF, dan proses Word hanya dibunuh saat timeout.
- File lock `~$` yang tertinggal membuat Word membuka dokumen dalam mode read-only.
- docx-js `captionLabel` menghasilkan switch `\a` (label hilang). Pakai
  `captionLabelIncludingNumbers` (`\c`). Field SEQ butuh `\* MERGEFORMAT` supaya nomornya
  tetap tebal.

**Privasi:** satu subagen verifikasi pernah mengirim rivsyah@gmail.com sebagai parameter
`mailto` ke API Crossref, sekali saja. Jangan diulang. Crossref tidak butuh email.

Terkait: [[project-landlord-that-rents]] (sumber data, dibaca read-only),
[[reference-office-render]].

## Update 4 Okt 2026

Neraca dipindah ke **LBP TA 2025 audited** (terbit e-PPID 25 Sep 2026). Modul baru `src/fy2025.py`
(nilai ditranskrip + 9 identitas: komponen = total, satker = total, register = total, persentase
cocok). Arus tetap FY2024, karena LK 2025 audited belum publik. Angka utama kini: BMN Rp59,30 T,
tanah+gedung Rp55,05 T (92,8%), saldo idle Rp128,6 M setelah tanah sewa Rp229,5 M direklasifikasi,
register 13 sewa lawan 499 penggunaan, gedung terdepresiasi 37,1%. Tambahan sumber publik:
- DPR 9 Jul 2025: hanya ±33 dari 132 perwakilan punya gedung + wisma sendiri.
- LPDP ditambah Rp15 T (Periskop, 21 Sep 2026).

Klaim asuransi 1,31% dicabut, karena datanya salah (lihat [[project-landlord-that-rents]]). Cutoff kini
4 Okt 2026. Hasil: 73 hlm, gerbang 89 cek lolos, 100 rujukan.

## Selaras dengan brief edisi 4 — 4 Okt 2026 (siang)

Brief direbase ke ed.4 (judul tetap BPADAD). Nama-nama di content.py berubah makna, jadi
facts.py tesis sudah disesuaikan:
- Nilai pertengahan 2025 kini memakai nama `_JUN25`: `BMN_JUN25`, `INSTRUMENTS_JUN25`, `UNASSIGNED_JUN25`.
- facts.py mengecek bahwa transkripsi `fy2025.py` sama persis dengan nilai brief (BMN, gedung, idle).
- `BMN_SERIES` sudah memuat 2025, jadi facts.py tidak menambahkannya lagi.

Angka tesis yang kini berlaku:
- **Kelipatan sewa akrual di kedua sisi: 226× (FY2025: Rp748,9 M lawan Rp3,31 M), 246× (FY2024).**
  Angka 310× dicabut karena mencampur beban akrual dengan penerimaan kas.
- Yield FY2025 akrual 0,006%.
- **Gap retensi = PNBP FY2025 Rp483,1 M − pagu PNBP 2026 = Rp253,0 M.** Korpus pada imbal 4–7%:
  Rp3,61–6,33 T; pada 3%: Rp8,43 T.
- **Rasio pembaruan gedung bersih cicilan 55% (FY2024)**; bruto 93% ikut menghitung cicilan
  Rp195,7 M atas kredit 7 gedung.
- Subbab baru 4.8 "Buildings bought on credit" + tabel kredit: BNI/Mandiri, 2016–2019, ditarik
  Rp1,90 T, sisa Rp670,8 M akhir 2025.
- Fee konsuler akrual FY2025 −16,06%.

Sumber arus FY2025 adalah neraca percobaan akrual audited yang dilampirkan di LBP 2025, ditambah
identitas akun "Diterima dari Entitas Lain" = PNBP. render.ps1 kini menutup Word miliknya sendiri
setelah sukses, dengan syarat proses baru dan StartTime ≤6 detik setelah job dimulai, karena
Word suka tertinggal dan mengunci file. Hasil: 75 hlm, 22 tabel, gerbang 109 cek lolos.
