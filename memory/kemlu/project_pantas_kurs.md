---
name: project-pantas-kurs
description: "PANTAS — aplikasi pantau kas UP (petty cash) Perwakilan + selisih kurs IDR/USD + proyeksi kekurangan pagu; SPA statis di ~/dev/kemlu/pantas-kurs → pantas-kurs.test; sampel BKU/BKT KBRI Washington TA 2026; dibangun 27 Sep 2026"
metadata:
  type: project
  modified: 2026-09-27
---

**Apa:** permintaan Aldo 27 Sep 2026 — aplikasi monitoring "petty cash" satker Perwakilan Washington DC
dari Excel BKU dan BKT, untuk melihat fluktuasi/kerugian kurs IDR–USD dan memproyeksikan kekurangan
anggaran/pembayaran. "Petty cash" ditafsirkan = Uang Persediaan (UP) dalam US$ (bank + tunai).

**Di mana (mesin riv):** `C:\Users\rivsy\dev\kemlu\pantas-kurs`, disajikan Herd di
`http://pantas-kurs.test/` lewat junction `~/.config/herd/config/valet/Sites/pantas-kurs` (lihat
[[reference_herd_windows]]). Git lokal di-`init`, **belum ada commit** (Aldo belum meminta), belum ada
remote. `.claude/ai_context/` (GRANDPLAN, STATUS, DECISIONS D1–D6 `proposed`) lokal saja.

**Stack:** SPA statis tanpa build, pola sama dengan SIPAMA/UKPBJ — React 18.3.1 UMD + Babel standalone
7.29.9 + ECharts 5.5.0 + SheetJS 0.20.3 (dari cdn.sheetjs.com, bukan npm 0.18.5 yang rentan), semua
di `vendor/` (jalan offline). Modul UMD murni: `app/format.js`, `parser.js`, `engine.js`, `export.js`;
UI `app/app.jsx`. Enam tampilan: Ringkasan, Kurs JISDOR, Selisih Kurs, Proyeksi, Buku Kas, Data &
Pengaturan. Ekspor .xlsx 8 sheet.

**Data:** `data/sampel/FormulirBKU.xls` + `FormulirBKT.xls` = salinan Downloads, **gitignored** (juga
`*.xls`, `*.xlsx`). Kurs `data/kurs-jisdor.json` (publik, dilacak), diperbarui `tools/update_kurs.py`
(lihat [[reference_bi_jisdor]]). Nama satker/rekening/uraian sampel sengaja tidak ada di file terlacak.

**Temuan data yang mengikat desain:**
- BKU (Formulir 3) hanya US$, tanpa kolom kurs/rupiah. `TGL` = tanggal transaksi (teks), `TGL INSERT`
  0–15 hari sesudahnya. `KET` = rekening (operasional / RPL PNBP / kosong = tunai).
- Kurs SP2D penerimaan UP = **JISDOR observasi ke-2 sebelum TGL** — 8 dari 8 kurs yang tertulis di
  uraian (Rp17.717, Rp17.762) cocok persis.
- BKU sudah memuat sisi kas tunai; BKT (Formulir 4A, 6 baris) hanya dicocokkan, tidak dijumlahkan.
- Kode: MAK `…/akun` (belanja), 825111 UP masuk, 815xxx setoran sisa UP/TUP, 425xxx PNBP, KB kas besi,
  MU mutasi uang, BPJ/BPPR/BBPA titipan.
- Belanja modal tidak rutin (Jul US$1,85 jt) → proyeksi hanya melajukan pegawai + barang.

**Angka sampel (1 Jan–27 Sep 2026):** rekonsiliasi formulir cocok persis (terima 12.457.275,85; keluar
11.012.136,12; saldo 1.445.139,73). Belanja bersih US$10,06 jt; beban kurs vs asumsi APBN Rp16.500 =
**Rp10,55 M** (silang-cek Python sama sampai rupiah). JISDOR 2026: 16.725 → 17.917 (+7,1%), selalu di atas
asumsi (173/173 hari). Laju pegawai+barang US$906 rb/bulan; kebutuhan s.d. 31 Des US$2,83 jt. Dengan
**pagu contoh** (kebutuhan setahun × 16.500): kurang Rp14,6 M pada kurs terakhir.

**Terbuka (GRANDPLAN Q1–Q7):** pagu DIPA nyata; kurs pengakuan belanja (JISDOR tanggal vs SP2D GUP);
aturan T-2 baru terbukti di 2 tanggal SP2D; kurs asumsi DIPA; tempat jalan (lokal dulu); simpan data di
peramban (tidak); nama PANTAS.

**Verifikasi:** `node --test "tests/*.test.js"` (15 tes; pola glob wajib — `node --test tests/` gagal di
Node 25) dan `node tests/render.js http://pantas-kurs.test/ <folder> 1440` (Chrome headless via CDP:
error konsol + tangkapan layar; env `PRE_JS`, `UPLOAD`, `VIEWS`, `PREFIX`).

**Jebakan:** SheetJS standalone di Node tidak bisa `writeFile` tanpa `set_fs` → pakai
`XLSX.write(wb,{type:'buffer'})`. Tool Edit menolak file yang baru diubah skrip Python — baca ulang dulu.
Privasi: lihat [[feedback_synthetic_data_deny_all]] (frekuensi kata uraian meloloskan nama).
Konteks topik yang sama (lindung nilai/kurs Perwakilan): [[project_tesis_erna]].
