---
name: project-ba-impor-mac-studio-2026
description: "Draf BA Justifikasi Penggunaan Produk Impor untuk pengadaan Mac Studio (Apple M5 Ultra), 17 Okt 2026: dasar Pasal 66 (4)/(7) + Pasal 19 (2) Perpres 16/2018 jo. 46/2025; 4 hlm, 66 isian kuning; tujuan pakai = usulan (AI lokal), belum dikonfirmasi Aldo"
metadata:
  type: project
---

Dibuat 17 Okt 2026 atas permintaan Aldo: "buatkan Berita Acara untuk justifikasi pembelian pengadaan import m5
ultra mac studio". Tanpa konteks lain (unit pengguna, jumlah, tujuan, HPS tidak disebut).

## Berkas (mesin riv)
- `C:\Users\rivsy\Downloads\MOFA\Pejabat Pengadaan\Pengadaan Mac Studio M5 Ultra\` — .docx + .pdf (draf), 4 hlm A4,
  Arial 11, isian kuning = stabilo.
- Builder: `~/dev/kemlu/ba-justifikasi-impor-mac-studio` — `node build.js` → `python verify.py <docx>` (14 cek,
  zipfile, tanpa python-docx) → `render.ps1` (salin dari BA BSBI).
- Sengaja file lokal, bukan Claude Doc: dokumen resmi untuk ditandatangani basah (pola sama dengan
  [[project-ba-selisih-bsbi-2026]]).

## Isi
Penanda tangan: PPK + penanggung jawab unit pengguna; "Menyetujui" = KPA/pejabat yang ditunjuk Menteri (Pasal 66 (7)).
5 bagian: Dasar (Ps 66 (1)(2)(4)(7)(11)(12), Ps 19 (2), Inpres 2/2022) → Kebutuhan (kritikal: memori GPU ≥96 GB,
bandwidth, SSD, garansi resmi RI) → Penelusuran PDN (tabel: inventarisasi TKDN Kemenperin, SIINas, Katalog
INAPROC, info kemampuan industri) → Kesimpulan → Ketentuan (penyedia badan usaha RI, tidak beli langsung dari LN,
HPS termasuk bea masuk/PDRI, tinjau ulang bila PDN ditemukan, catat BMN). Lampiran: tabel banding + kotak
tangkapan layar.

## Fakta dicek live 17 Okt 2026
- Mac Studio M5 Max/M5 Ultra diumumkan 25 Agu 2026, kirim 22 Sep; M5 Ultra mulai US$5.499 (edu US$5.099),
  dasar 96 GB/1 TB, hingga 512 GB (512 GB baru akhir Okt), CPU hingga 36 core, GPU hingga 80 core, bandwidth
  hingga 1,2 TB/s (9to5Mac, Macworld).
- Indonesia: Apple menyebut "segera tersedia"; harga resmi iBox M5 Ultra belum ditemukan; listing Tokopedia
  Rp55–100 jt (tak bisa jadi acuan HPS).
- Teks Pasal 66 Perpres 46/2025 ayat (1)–(12) dari pasal.id (status "belum ditinjau" → cocokkan dengan JDIH LKPP).
- Pasal 19 (2) Perpres 16/2018: merek hanya untuk komponen, suku cadang, bagian sistem yang ada, katalog
  elektronik, Tender Cepat. Belum dicek apakah diubah 12/2021 / 46/2025.

## Risiko yang dilaporkan ke Aldo
1. Workstation PDN dengan GPU profesional 96 GB (mis. kelas RTX PRO 6000) bisa saja memenuhi kriteria memori →
   justifikasi gugur bila ternyata ber-TKDN. Penelusuran wajib nyata, bukan formalitas.
2. Menyebut merek "Mac Studio" di spektek melanggar Ps 19 (2) kecuali masuk salah satu pengecualian.
3. Tujuan pakai (AI lokal) = usulan Bara, wajib diganti tujuan sebenarnya.

## Status
Menunggu Aldo: tujuan pakai, unit pengguna, jumlah, PPK/penyetuju, hasil penelusuran nyata, HPS.
