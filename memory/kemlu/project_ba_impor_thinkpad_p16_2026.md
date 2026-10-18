---
name: project-ba-impor-thinkpad-p16-2026
description: "Draf BA Justifikasi Penggunaan Produk Impor untuk laptop workstation Lenovo ThinkPad P16 Gen 2 (18 Okt 2026; awalnya salah sebut Mac Studio M5 Ultra 17 Okt): Ps 66 (4)/(7) + Ps 19 (2) Perpres 16/2018 jo. 46/2025; 5 hlm, 75 isian kuning; P16 Gen 2 sudah digantikan Gen 3"
metadata:
  type: project
  modified: 2026-10-18
---

17 Okt 2026 Aldo minta BA justifikasi impor "m5 ultra mac studio"; 18 Okt dikoreksi: **barangnya Lenovo ThinkPad
P16 Gen 2, bukan Mac.** Draf Mac sudah diganti seluruhnya. Unit pengguna, jumlah, tujuan, HPS belum disebut.

## Berkas (mesin riv)
- Berlaku: `C:\Users\rivsy\Downloads\MOFA\Pejabat Pengadaan\Pengadaan ThinkPad P16 Gen 2\` — .docx + .pdf (draf),
  5 hlm A4 (BA 4 hlm + Lampiran), Arial 11, isian kuning = stabilo.
- Usang: folder `Pengadaan Mac Studio M5 Ultra\` di tempat yang sama (draf Mac 17 Okt) — dibiarkan, boleh dihapus Aldo.
- Builder: `~/dev/kemlu/ba-justifikasi-impor-thinkpad-p16` (dulu `...-mac-studio`) — `node build.js` →
  `python verify.py <docx>` (17 cek, zipfile) → `render.ps1`.
- Sengaja file lokal, bukan Claude Doc: dokumen resmi ditandatangani basah (pola [[project-ba-selisih-bsbi-2026]]).

## Isi
Penanda tangan: PPK + penanggung jawab unit pengguna; "Menyetujui" = KPA/pejabat yang ditunjuk Menteri (Ps 66 (7)).
Dasar (Ps 66 (1)(2)(4)(7)(11)(12), Ps 19 (2), Inpres 2/2022) → Kebutuhan kritikal (laptop ≥16", GPU workstation
≥12 GB ECC, CPU HX ≥20 core, RAM ≥64 GB s.d. ≥128 GB, sertifikat ISV, garansi resmi RI ≥1 thn) → Penelusuran PDN
(TKDN Kemenperin, SIINas, Katalog INAPROC, info kemampuan industri) → Kesimpulan → Ketentuan (penyedia badan
usaha RI; tidak beli langsung dari LN; HPS termasuk bea masuk/PDRI; unit baru bukan rekondisi, ganti generasi
hanya lewat BA perubahan; tinjau ulang bila PDN ditemukan; BMN). Lampiran: tabel banding + kotak tangkapan layar.

## Fakta dicek live 18 Okt 2026
- PSREF Lenovo P16 Gen 2 (versi 22 Des 2025): Core i5/i7/i9 HX gen 13 atau i7-14700HX (hingga 24 core); GPU s.d.
  RTX 5000 Ada 16 GB ECC (RTX 3500/4000 Ada 12 GB ECC); RAM 4 slot DDR5, 128 GB ECC / 192 GB non-ECC; 2x M.2 s.d.
  8 TB; 16" s.d. 3840x2400; berat mulai 2,95 kg; Thunderbolt 4; garansi dasar 1 thn; MIL-STD-810H; ISV per aplikasi.
- **ThinkPad P16 Gen 3** (Core Ultra 200HX, RTX Pro 5000 Blackwell 24 GB) diumumkan IFA Sep 2025, tersedia Okt 2025
  → Gen 2 sudah model lama; Bhinneka listing 21FAS04200 Rp61,2 jt "Not Available For Sale".
- Harga listing daring RI (i9-13950HX / RTX 3500 Ada): Rp58.790.000–Rp64.500.000 (Tokopedia, FESSA) — bukan acuan HPS.
- TKDN: tidak ditemukan sertifikat TKDN untuk ThinkPad P series. Lenovo ber-TKDN yang ditemukan: K14 Gen 3 dan
  ThinkCentre Neo 50a Gen 5 (rakitan PT Sat Nusapersada, Batam; 41,56% dan 42,28% — sumber tak seragam soal TKDN
  saja vs TKDN+BMP). Belum dicek langsung di tkdn.kemenperin.go.id.
- Pasal 66 Perpres 46/2025 dari pasal.id ("belum ditinjau" → cocokkan JDIH LKPP). Ps 19 (2) Perpres 16/2018:
  merek hanya untuk komponen, suku cadang, bagian sistem yang ada, katalog elektronik, Tender Cepat.

## Risiko yang dilaporkan ke Aldo
1. Membeli model yang sudah digantikan (Gen 2): stok baru langka, risiko unit rekondisi/pajang; pemeriksa bisa
   bertanya kenapa bukan Gen 3.
2. Laptop workstation lokal ber-TKDN (merek lain) bisa memenuhi kriteria → justifikasi gugur. Penelusuran wajib nyata.
3. Menyebut merek di spektek melanggar Ps 19 (2) kecuali masuk pengecualian (mis. tayang di Katalog).
4. Tujuan pakai di draf = usulan Bara.

## Status
Menunggu Aldo: tujuan pakai + aplikasi, unit pengguna, jumlah, PPK/penyetuju, hasil penelusuran nyata, HPS.
