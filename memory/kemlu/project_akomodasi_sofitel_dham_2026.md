---
name: project-akomodasi-sofitel-dham-2026
description: "Kontrak hotel Sofitel Bali Nusa Dua untuk Retreat/Rapat Dewan HAM (PTRI Jenewa, 16-22 Okt 2026) + addendum 1 (6 Okt) dan addendum 2 (14/16 Okt): angka, jadwal bayar, klausul pengurangan yang kini mati"
metadata:
  type: project
---

Dibedah 18 Okt 2026 atas permintaan Aldo ("hal yang perlu dipahami dari addendum terakhir").
Berkas: `C:\Users\rivsy\Downloads\Retreat Dewan HAM\Pengadaan Akomodasi\` (mesin riv). Addendum 2 = PDF hasil scan
(tanpa lapisan teks), dibaca sebagai gambar.

## Angka
- Kontrak induk 16 Sep 2026 = HPS = Rp1.395.550.000 (kamar 176 RN Rp936,8 jt + acara Rp458,75 jt, 110/100 pax).
- RAB 31 Agu = Rp1.535.105.000 (= HPS + cadangan "addendum 10%"); akun 521219 Rp1.163.258.800, 524219 Rp371.846.200.
- Addendum 1 (6 Okt): Prestige Suite +1 malam (17 Okt) -> kamar Rp944,128 jt; pax acara turun 110->100, 100->90
  (hotel: "10% attrition allowance has already been applied") -> acara Rp415,28 jt. Total Rp1.359.408.000.
- Addendum 2 (hotel teken 14 Okt, PPK Nurul Sofia teken 16 Okt): Luxury Plunge Pool +1 malam 17 Okt (Rp7.328.000) ->
  178 RN, kamar Rp951.456.000; Formal/Gala Dinner pindah 19 -> 20 Okt (nilai tetap). Total Rp1.366.736.000
  (-Rp28.814.000 dari kontrak induk; sisa RAB Rp168.369.000).
- Jadwal bayar addendum 2: 40% Rp558,22 jt diterima 21 Sep; 40% Rp558,22 jt tenggat 16 Okt; pelunasan Rp250.296.000
  saat check-out 22 Okt. (Kontrak induk: 16 Sep / 21 Sep / Rp279,11 jt.) 40% dihitung dari nilai induk.

## Klausul yang mengikat sekarang
- Kontrak induk "Kebijakan Penambahan Kamar": begitu kamar tambahan diminta, kelonggaran pengurangan hilang; setiap
  pengurangan blok awal/tambahan = 100%. Sudah terpicu sejak addendum 1. Plus <14 hari: batal/no-show = 100%.
- F&B: kelonggaran 10% sudah dipakai di addendum 1 -> 100/90 pax = minimum yang dibayar.
- Deposit tidak dapat dikembalikan; denda 5%/minggu atas saldo terutang; acara luar ruang (Retreat Garden) pindah karena
  cuaca = USD 25/org (min USD 5.000) bila memilih tetap di luar.
- Cacat kecil: sampul addendum 2 tertulis "16-22 November 2026"; PPK teken 16 Okt, lewat tenggat hotel 15 Okt.
Terkait: [[project_pco_retreat_dham_2026]], [[project_jamuan_lunch_retreat_dham_2026]], [[project_sewa_kendaraan_retreat_dham_2026]].

## Dokumen perubahan versi pemerintah (18 Okt 2026)
- `Downloads\Retreat Dewan HAM\Pengadaan Akomodasi\Dokumen Adendum II\`: 1 Nota Dinas Justifikasi (Ketua Panitia -> PPK),
  2 BA Klarifikasi dan Negosiasi Perubahan, 3 Adendum II Kontrak (7 pasal + lampiran landscape). .docx + .pdf, verify 33/0.
  Builder `C:\Users\rivsy\dev\kemlu\adendum2-sofitel-dham-2026\` (data.py satu-satunya sumber angka).
- Isian kuning: nomor, tanggal (sengaja kosong, jangan dimundurkan), NIP + SK PPK, tamu dan alasan kamar 17 Okt, alasan
  dinner pindah, akun tambahan (521219/524219), nama pengusul.
- Asumsi agent: pihak penyedia = PT Griya Pancaloka (nama penerima rekening; cek NIB), wakil = Michael Maramis, Director
  of Sales (penanda tangan addendum hotel; cek kewenangan). Adendum I belum punya dokumen pemerintah yang setara.

## Cek ulang dengan sumber Excel/KAK 6 Okt (18 Okt 2026)
- Sumber: `RAB HPS DKH SPEKTEK HOTEL Bali Kegiatan DHAM,6 Okt sebelum addendum.xlsx` + `KAK ... 6 Okt.docx` (KAK sama dengan KAK.pdf, tidak perlu diubah).
- Pemakai Plunge Pool di HPS: Sekjen/Plt. Dirjen KSM (18-20 Okt) dan Hassan Wirajuda, narasumber (18-19 Okt) -> tamu malam 17 Okt kemungkinan salah satunya (belum dikonfirmasi).
- Komentar RAB: 521219 = akomodasi undangan+narsum Rp655.076.000 + paket meeting undangan Rp137.882.000 + resepsi/dinner Rp264.550.000; 524219 = akomodasi panitia Rp281.724.000 + paket meeting panitia Rp56.318.000.
- Cacat sumber: lembar HPS berjudul "DAFTAR KUANTITAS HARGA" (juga di PDF HPS yang diteken), lembar Spektek berjudul "HARGA PERKIRAAN SENDIRI"; kolom bantu R-U berisi #REF!. DKH 4 Sep diteken "PT. Griya Panca Loka" (Michael Maramis, Director of Sales); rekening "PT. Griya Pancaloka".
- Output 4: `Dokumen Adendum II\4. RAB HPS DKH SPEKTEK ... setelah Adendum II.xlsx/.pdf` (salinan via Excel COM, `revisi_xlsx.ps1`): Menlu +20 Okt (Add I), baris 50 "Tambahan Adendum II" plunge pool 17 Okt (peruntukan isian), FDM 90/90, resepsi 100 + dinner 100 pada 20 Okt, judul lembar dibetulkan, tanggal teken dikosongkan. Total Excel = Rp1.366.736.000 (cocok hotel).

## Surat Perjanjian pemerintah (cek 18 Okt 2026) -> adendum diganti jadi "Adendum Pertama Surat Perjanjian"
- `Pengadaan Akomodasi\1. Surat Perjanjian - sofitel.docx`: Kontrak Jasa Lainnya Harga Satuan, 16 Sep 2026, Rp1.395.550.000,
  5 pasal saja (istilah, ruang lingkup, jenis/nilai, dokumen kontrak, masa berlaku). Nomor SP KOSONG. Penyedia diwakili Michael
  Maramis (Director of Sales) via Surat Kuasa 01/GPL-SK/IX/2026 tgl 2 Sep 2026; PT. Griya Pancaloka; PPK SK Dirjen Aspasaf
  00912/B/KU/09/2025/04.
- Cacat SP: SPPBJ di pembuka "15 Sep 2026" vs huruf b "044/SPPBJ/11/2025/26 tgl 21 Nov 2025" (salin dari paket lain);
  BAHP "PL-POKJA" padahal KAK pakai Perlem 5/2021 (dikecualikan); "termasuk PPN" padahal jasa hotel kena PBJT;
  tak ada pasal pembayaran/deposit/pembatalan/sanksi/kahar/sengketa; Pasal 4 tak menyebut MICE Agreement maupun KAK.
- Belum ada adendum SP -> satu "Adendum Pertama SP" menampung Add I + II hotel (nilai 1,3956 M -> 1,3667 M): Pasal I volume/
  jadwal, II ubah Ps 3(2) nilai + sisip 3(3a) jadwal bayar, III ubah Ps 4(1)c masukkan MICE Agreement + adendumnya,
  IV pembetulan SPPBJ + sampul "November", V penutup. data.ADENDUM_KE bila ternyata sudah ada adendum SP. verify 41/0.
- Aldo sendiri menyimpan `4. DKH Addendum II.xlsx` (lembar DKH saja, total 1,3667 M) dan membuka draf lama "(Adendum II)" di Word.
