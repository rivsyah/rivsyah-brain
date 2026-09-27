---
name: reference-mdp-pbjp-ringkas
description: "MDP PBJP Luar Negeri edisi ringkas (27 Sep 2026): FINAL 137 hlm -> 75 hlm, 36 formulir dwibahasa, 12 kontradiksi naskah asli yang diselesaikan + 9 celah terbuka; builder docx-js di ~/dev/kemlu/mdp-pbjp-ringkas"
metadata:
  type: reference
---

Dibuat 27 Sep 2026 di mesin riv atas permintaan Aldo ("buat MDP ... simple, ringkas, rapi").
MDP = Model Dokumen Pengadaan (judul sampul asli; batang tubuh asli kadang menulis "Modul").

- Sumber: `C:\Users\rivsy\Downloads\MDP-PBJP-Luar-Negeri-FINAL.docx` (137 hlm render Word, Bookman 12, tidak disentuh).
- Hasil: `C:\Users\rivsy\Downloads\MDP-PBJP-Luar-Negeri-RINGKAS.docx` + `.pdf` (75 hlm A4, Arial, palet navy logo Kemlu 2D3985).
- Builder: `C:\Users\rivsy\dev\kemlu\mdp-pbjp-ringkas\` (docx-js + `render.ps1` Word COM untuk isi TOC). Baca README-nya.

Struktur: Bab 1 Pendahuluan, Bab 2 Peta Cepat (alur 6 tahap, tabel bentuk kontrak/metode, siapa-apa,
empat jenis kurs, 7 aturan dasar LN, penyesuaian praktik setempat), Bab 3-7 per tahap, Lampiran 1 daftar
periksa, Lampiran 2 formulir F-01..F-36 (tiap formulir 1 hlm kecuali F-07+lampiran dan F-20 NDA),
Lampiran 3 kontrak dwibahasa (SP + SSUK 18 klausul), Lampiran 4 glosarium.

Kontradiksi di naskah asli yang DISELESAIKAN (ikut revisi terakhir penyusun / batang tubuh):
1. Kurs kunci dua tanggal (RUP vs HPS) -> satu: JISDOR tgl penetapan RUP; kurs uji ambang (bank sentral setempat, tgl HPS) dipisah.
2. Deposit tunai: pedoman membolehkan, SSUK Klausul 7 melarang -> dilarang.
3. SPK vs kontrak tepat USD14.000 -> SPK < 14.000, kontrak >= 14.000.
4. Diagram alur "undang 1 Pelaku Usaha" -> minimal 2 (single-source wajib didokumentasikan).
5. Penawaran > HPS: formulir bilang gugur, batang tubuh bilang klarifikasi -> gugur; klarifikasi untuk < 80% HPS.
6. BA PDN & RAB "ditetapkan KPA" (formulir) vs PPK (batang tubuh) -> PPK menetapkan, KPA mengetahui.
7. NDA asli: naskah Inggris berlaku + hukum & pengadilan setempat -> diselaraskan: naskah Indonesia, hukum RI, BANI, tanpa pelepasan imunitas; Pihak Pertama = Pemerintah RI.
8. Urutan prioritas dokumen kontrak -> versi 3-BIL (SP, BAKN, SSKK, SSUK, penawaran, lampiran).
9. Blanko SSUK diisi dari batang tubuh: asuransi 100%/110%/standar setempat, pengurus & penanggung pajak, pemutusan krn daftar sanksi, meterai UU 10/2020.
10. Plafon denda 5% tidak ada di Pasal 79 Perpres -> ditulis sebagai ketentuan kontrak, 1‰ tetap dikutip Pasal 79.
11. Bahasa kuitansi: batang tubuh mengecualikan, riwayat revisi A.7 bilang dihapus -> ikut batang tubuh (dikecualikan). PERLU KEPUTUSAN TIM.
12. Laporan darurat ke BUP 14 hari kalender dipakai juga di formulir Keputusan (asli kosong).

Dibuang: formulir Inggris-saja (sudah dipensiunkan di revisi D.16), duplikat BAKN/BAHPL/HPS, BA 8J (digabung ke F-36),
"ketentuan penandatanganan a-f" yang diulang 8x, Lampiran 18 riwayat revisi, catatan penyusun, TOC rusak, butir PnL benih/pupuk.

Celah TERBUKA (tidak ditambahkan, dilaporkan ke Aldo):
- Angka ambang metode per wilayah (Lampiran Permenlu huruf A) tidak ada di MDP.
- Batas bebas HPS Rp10 jt (riwayat revisi B.1b) tidak ada di batang tubuh.
- Batas kirim Keputusan penyesuaian ke Pusat (A.1: 10 hari kerja) tidak ada di batang tubuh.
- Tidak ada model: pakta integritas dwibahasa (wajib!), SSKK, BA evaluasi/pembuktian kualifikasi, surat penawaran.
- Rancangan revisi Permenlu Pasal 25(1) menghapus surat/bukti pesanan; Lampiran B lama masih memuatnya.
- Meterai/tanda tangan elektronik (UU 10/2020, UU ITE) dan versi Incoterms ditandai "perlu verifikasi" di naskah asli.
- Perlem LKPP 2/2026 (katalog elektronik) belum masuk dasar hukum.
- Kutipan Pasal 30 ayat (5) (konsultansi bebas jaminan) dan Pasal 53 (eskalasi) dipertahankan apa adanya, belum dicek live.

Jebakan build: lihat [[reference-office-render]]. Dokumen Kemlu terkait: [[reference-template-spk]], [[reference-dokumen-pokja-sppbj]].
