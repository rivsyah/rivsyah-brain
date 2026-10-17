---
name: project-cfa-l1-materi
description: "Materi belajar CFA Level I Edisi Kurikulum 2027 (17 Okt 2026): 8 PDF, 887 hlm, 772 soal orisinal (0 galat gerbang) di Downloads\\Riv's Journey\\Materi Bahan Belajar\\CFA\\Edisi 2027; builder ~/dev/personal/cfa-l1-materi; fakta resmi 2027 terverifikasi; 10 berkas lama diaudit (tidak diubah)"
metadata:
  type: project
---

Dibuat 11–17 Okt 2026 atas permintaan Aldo: "perbaiki, lengkapi, buat lebih bagus materi tata cara belajar dan materi belajar ini dari tingkat beginner, intermediate, advance". Scope: personal.

## Hasil (mesin riv)
- Folder hasil: `C:\Users\rivsy\Downloads\Riv's Journey\Materi Bahan Belajar\CFA\Edisi 2027\` — 00 Panduan (36 hlm), 01 Awal (159), 02 Menengah (336, semua 102 LM), 03 Lanjut (117), 04 Bank Soal (300 soal, 133 hlm), 05 Mock 180 soal (73), 06 Lembar Rumus (27), 99 Catatan Koreksi (6). 10 berkas lama dibiarkan di folder induk.
- Builder: `C:\Users\rivsy\dev\personal\cfa-l1-materi\` — Markdown + KaTeX `\( \)` → Chrome headless (puppeteer-core) → PDF, 2 lintasan untuk nomor daftar isi. Aturan penulis: `AUTHORING.md`. Gerbang: `checks/verify.py` (eval setiap blok ```cek, opsi angka urut naik, distribusi kunci, bias opsi terpanjang, istilah usang). Rakit mock & rumus: `python -I build/assemble.py`. Audit lama + fakta resmi: `ref/` (gitignored, berisi teks outline CFA — jangan didistribusikan).
- Bahasa soal: Awal/Menengah Indonesia; Lanjut, Bank Menengah/Lanjut, seluruh Mock bahasa Inggris; pembahasan Indonesia. Format angka gaya ujian (titik desimal).

## Fakta resmi (dicek 11 Okt 2026, cfainstitute.org — volatil)
- Bobot 2027 BERUBAH: Ethics 10–15%, Quant 11–14%, Econ 6–9%, FSA 11–14%, Corporate Finance 6–9%, Equities 11–14%, FI 11–14%, Derivatives & Risk Mgmt 6–9%, Alts 6–9%, Portfolio Construction 8–12%. 102 LM. Berlaku window Feb 2027 dst. GIPS, EMH, market organization/margin keluar; indeks pindah ke Quant.
- Standards 1 Jan 2024: I(E) Competence baru, V(B) ungkap layanan & biaya, VI(A) Avoid or Disclose Conflicts.
- Biaya early USD 1,140 / standard 1,490. Feb 2027: registrasi tutup 5 Nov 2026. Mei 2027: early tutup 14 Okt 2026, registrasi 10 Feb 2027. Agu 2027: early 20 Jan 2027. PSM Level I: Financial Modeling atau Python Programming Fundamentals.
- Pass rate 2026: Feb 45%, Mei 39%, Agu 43%; pernah defer 25–30%.

## Keputusan / rekomendasi
- Rekomendasi ke Aldo: window Mei 2027 (±12 jam/minggu, rencana 29 minggu mulai 19 Okt 2026). BELUM diputuskan Aldo.
- Asumsi: kurikulum 2027 (bukan Nov 2026).

## Catatan mutu
- Peringatan sisa: kunci soal bab Menengah/Lanjut jarang berulang berurutan (13–15%). Bukan galat.
- Butir [Ragu] agen (detail kurikulum yang belum dicocokkan dengan teks resmi 2027) tercatat di laporan sesi; contoh: IFRS 18 vs IAS 7, nama fase siklus bisnis, 4C kredit.
- Jebakan build: judul h2 dua baris yang jatuh di awal halaman membuat outline Chrome ganda → `mapTocPages` sudah dibuat toleran.
- Audit materi lama: 0 kunci salah di 699 soal seri besar; 6 kesalahan konsep kritis (MWR terbalik, Jensen's alpha, synthetic forward, likuiditas asuransi, korelasi 1.20, VI(A) lama).

Terkait: [[project_mba_us_roadmap]].
