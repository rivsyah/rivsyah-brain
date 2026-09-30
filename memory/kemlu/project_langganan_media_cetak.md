---
name: project-langganan-media-cetak
description: "Paket Langganan Media Cetak (Kompas, Jakarta Post, Tempo, PRISMA) Setjen Kemlu: KAK + RAB/HPS direvisi ke Okt–Des 2026 (27 Sep 2026), RAB Rp18.797.850; BLOCKER: pagu paket di KAK Rp10 jt lebih kecil dari nilai paket"
metadata:
  type: project
---

Paket: Pengadaan Langganan Media Cetak (Surat Kabar, Majalah, dan Jurnal) pada Setjen dan Staf Ahli Kemlu TA 2026.
Barang, Pengadaan Langsung, akun 6023.EBA.994.002.H.521111 "Penyediaan Surat Kabar Kesekjenan". PPK Charles Ivan Bob.
Penyedia paket bulanan sebelumnya: CV. Milan Sentosa.

## File (mesin riv, `C:\Users\rivsy\Downloads\MOFA\Pejabat Pengadaan\`)

- **Terkini (27 Sep 2026):** `RAB dan HPS - Langganan Media Cetak Setjen Kemlu Okt-Des 2026.xlsx` dan
  `Spesifikasi Teknis - Langganan Media Cetak Setjen Kemlu Okt-Des 2026.docx` (docx ini = "KAK" menurut Aldo).
- Versi Sep–Des (8 Sep 2026): nama sama berakhiran `Sep-Des 2026`, TIDAK disentuh.
- Sumber harga: `Koran - Juli.xlsx` = BA evaluasi + negosiasi paket Juli 2026 (sheet PP) dan HPS Juni 2026 (sheet PPK).
- Dokumen tidak punya label "Revisi n" di dalamnya; pembeda hanya nama file.

## Angka revisi Okt–Des (atas arahan Aldo, 27 Sep 2026)

- 3 / 5 / 4 / 3 eks x 3 bulan = 9 / 15 / 12 / 9 Eks/Bln, total 45 Eks/Bln.
- Tarif per eks per bulan, belum PPN (penawaran CV. Milan Sentosa Juli 2026): Kompas 400.000, Jakarta Post 485.000,
  Tempo 400.000, PRISMA 140.000.
- Nilai Dasar Rp16.935.000 + PPN 11% Rp1.862.850 = **RAB Rp18.797.850** (= 3 x Rp6.265.950).
  HPS dibulatkan ke bawah Rp18.797.800. Di bawah Rp50 jt: kuitansi, SPSE tidak wajib.
- HPS "Periode Langganan" diisi 1 Oktober s.d. 31 Desember 2026 (3 bulan). SPK/Surat Pesanan harus terbit paling
  lambat 1 Okt 2026; bila lebih lambat, angka bulan di RAB kolom H dibuat pro rata.
- KAK 4.2: perkiraan biaya Rp7.000.000 (ketikan Aldo di Word) diganti Rp18.797.850 agar sama dengan RAB.

## Perbaikan ikut di revisi ini (bukan soal periode)

- KAK dasar hukum huruf e: Perlem LKPP 9/2021 diganti Perlem LKPP 2/2026 tentang Katalog Elektronik, bunyi sama dengan
  KAK [[project-pengadaan-amdk]]. KAK [[project-ht-poc-satpam]] masih mengutip Perlem 9/2021.
- KAK penomoran 7.2 → 7.4 dirapikan menjadi 7.3 dan 7.4. Tidak ada rujukan silang ke nomor itu.
- xlsx lembar Petunjuk butir 4 (Kejelasan pagu) ditambah catatan pagu KAK Rp10 jt; tinggi baris 22 dinaikkan 48 → 62.

## Terbuka (per 27 Sep 2026)

- **BLOCKER pagu.** KAK 4.1 "Pagu Anggaran Paket" = Rp10.000.000 (ketikan Aldo; angka sama persis dengan KAK HT),
  padahal nilai paket Rp18.797.850. RAB/HPS memakai Rp896.819.000 — itu pagu akun/detail, dipakai juga di RAB AMDK.
  Sel pagu di KAK diberi latar kuning. Menunggu Aldo menyebut pagu paket yang benar (SiRUP/POK), minimal Rp18.797.850.
- **Sumber harga kedua kosong** (Uji Silang #7 BELUM LENGKAP). Kandidat siap pakai: harga hasil negosiasi paket Juli 2026
  di `Koran - Juli.xlsx` — Kompas 370.000, Jakarta Post 465.000, Tempo 375.000, PRISMA 120.000 (Rp5.877.450/bulan
  termasuk PPN), huruf f (kontrak sejenis). HPS sekarang memakai harga penawaran sebelum nego, 4–17% lebih tinggi.
  Belum diisi karena menetapkan harga HPS adalah keputusan PPK.
- Frekuensi Jurnal PRISMA di KAK tabel 7.1 = "Mingguan" (ketikan Aldo); RAB/HPS menulis "berkala". Tidak diubah.
- Tanggal tanda tangan di semua dokumen tetap "......... September 2026".
- Label "KRO / RO" di KAK 4.1 dan RAB berisi nama Komponen 002, bukan RO (pola sama dengan KAK HT).

## Cara bangun ulang

- xlsx: baca dengan openpyxl, tulis nilai lewat Excel COM, `CalculateFull`, `SaveAs` — format, komentar, dan 111 rumus
  utuh. File aslinya disimpan LibreOffice, jadi pane RAB ikut bergeser saat dibuka Excel; sudah direset ke A1.
- docx: edit `document.xml` per `<w:t>` dengan lxml (semua target ada di satu run, tidak perlu merge_runs), zip ulang
  dengan urutan entri asli. Cek visual lewat render EMF, bukan ekspor PDF — lihat [[reference-office-render]].

Koreksi 30 Sep 2026 (dari POK di Wasdit, sheet Sheet94): "Pengadaan Keperluan Sehari-hari Perkantoran Biro Umum" adalah nama
**subkomponen 002.H**, bukan komponen 002. Komponen 002 = "Operasional dan Pemeliharaan Kantor". Baris "002" di RAB paket ini
(dan KAK HT) memakai nama yang keliru. Paket [[project-gws-business-standard]] sudah memakai nama yang benar.
