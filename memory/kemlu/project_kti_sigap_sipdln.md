---
name: project-kti-sigap-sipdln
description: "DUA KTI terpisah (makalah, Permenlu 23/2020) untuk percepatan pangkat/golongan Aldo (JF Penata Kanselerai): 'Pengendalian Melekat ... SIGAP BUP untuk Satuan Kerja Pusat' 36 hlm dan 'Otomasi Administrasi PDLN Berbasis Aturan ... SIPDLN-BUP untuk Satuan Kerja Pusat' 32 hlm — verify 16/16 masing-masing, 0 kalimat kembar (4 Okt 2026); sasaran satker pusat Kemlu, BUP = purwarupa; + draf kasar netral untuk Dedi (asumsi); builder ~/dev/kemlu/kti-sigap-sipdln"
metadata:
  type: project
  modified: 2026-10-04
---

# KTI SIGAP BUP dan KTI SIPDLN-BUP (4 Okt 2026)

Permintaan Aldo 4 Okt 2026, berurutan:
1. "buatkan karya tulis ilmiah untuk percepatan PGPNS project ... SIGAP-BUP dan SIPDLN-BUP, setelah itu buatkan
   rough draft dari project itu untuk Dedi" (+ Permenlu 2/2026, Renstra 10/2025, Permenlu 23/2020).
2. **"pisahkan karya tulis ilmiah SIGAP dan SIPDLN; tujuan aplikasi ini tidak hanya pemakaian di BUP saja namun
   bisa diterapkan di satuan kerja pusat Kementerian Luar Negeri"** — keputusan framing: BUP = lokasi purwarupa,
   sasaran = satuan kerja pusat.
3. "INGAT SAYA ADALAH JABATAN FUNGSIONAL PENATA KANSELERAI SEKARANG, BUKAN LAGI JF PBBJ" — lihat [[user-jabatan-kemlu]].

Tafsir "PGPNS" = pangkat/golongan PNS [Likely], belum dibantah. Jalur percepatan: [[reference-kti-percepatan-pangkat]].

## Berkas (mesin riv)

- Hasil: `C:\Users\rivsy\Downloads\Riv's Journey\KTI SIGAP-SIPDLN\`
  - `KTI SIGAP BUP - Rivaldo H.docx/.pdf` — 36 hlm, abstrak 176 kata, pokok bahasan 5.656 kata, 13 tabel, 3 gambar.
  - `KTI SIPDLN-BUP - Rivaldo H.docx/.pdf` — 32 hlm, abstrak 179 kata, pokok bahasan 4.610 kata, 12 tabel, 3 gambar.
  - `Draf Kasar SIGAP-SIPDLN untuk Dedi.docx/.pdf` — 4 hlm, netral, kini menyebut "dirancang untuk satuan kerja lain".
  - `arsip - KTI gabungan 4 Okt\` — versi gabungan 41 hlm (diganti, jangan dipakai).
- Builder: `C:\Users\rivsy\dev\kemlu\kti-sigap-sipdln\` — `build-kti.js sigap|sipdln`, `render.ps1` (Word COM),
  `verify.py <docx> <kode>` (16 cek; tolak kata "PPBJ"), `verify-pair.py` (kalimat kembar ≥12 kata = gagal),
  `verify-dedi.py`. README di sana. Tanpa git (folder masuk repo nyasar home, abaikan).

## Isi dan keputusan (bisa dibalik Aldo)

- Bentuk **makalah** (Pasal 11 b + 13). Metode DSRM + FEDS. Jabatan di naskah: "Penata Kanselerai [[Ahli Pertama]]"
  (jenjang disorot, belum dikonfirmasi). Kedua naskah menyebut posisi penulis sebagai Penata Kanselerai dan bidang
  kekanseleraian (Permenlu 23/2020 Pasal 1 angka 4).
- **SIGAP**: teori pengendalian komitmen (Potter & Diamond 1999; Radev & Khemani 2009 IMF TNM 09/04), multi-tenant
  (Bezemer & Zaidman 2010), COSO/SPIP, konkurensi. Bagian baru "Model Penerapan di Satuan Kerja Pusat": tabel
  kesiapan 10 komponen, model platform bersama (Biro Keuangan = pemilik proses, Pasal 99; Pusat Data dan TI = pemilik
  platform, Pasal 673; Itjen pengawas; SAKTI impor; SIMKEU pertukaran data), 5 tahap (uji coba BUP Tw IV 2026 →
  penguatan Sem I 2027 → percontohan 2–3 satker Sem II 2027 → perluasan TA 2028 → kajian Perwakilan).
- **SIPDLN**: teori aturan sebagai kode (Mohun & Roberts 2020, OECD WP 42), Codd, Goldberg (sen bulat), TAM/SUS.
  Tabel ketertelusuran 13 ketentuan PMK (9 penuh, 2 sebagian, 2 belum). Model penerapan: aturan/SBM/kurs/templat
  bersama; per unit: penandatangan, **kode Kepmenlu 40/B/HK/09/2025/01**, kop, operator; integrasi Sistem Informasi
  SDM, e-Office, SIGAP/SAKTI, izin Kemensetneg; 5 tahap.
- Fakta struktur yang dipakai (Permenlu 4/2025 Pasal 7 + Kepmenlu 40/2025): 11 unit eselon I (Setjen 03, 8 Ditjen
  04–11, Itjen 12, BSKLN 13) + 5 Staf Ahli; **63 unit kerja eselon II** (7 biro, 10 sekretariat, 35 direktorat,
  4 inspektorat wilayah, 7 pusat), kode penandatangan 19–81; **BUP = 25** → "/25" di nomor ST BUP.
- Renstra yang dikutip: sasaran program "Pengelolaan Anggaran Kemlu yang Optimal dan Akuntabel" (opini WTP tiap
  tahun), maturitas SPIP 3,86 (skala 5), IKPA Ditjen Kerja Sama ASEAN 94 (2025) → 98 (2029), Indeks SPBE 2,87 →
  3,93; Renstra menyebut SIMKEU (Biro Keuangan), Sistem Informasi SDM, e-Office.
- Kejujuran: manfaat belum diukur; kondisi PDLN "sebelum" = asumsi; SIGAP 10/16 aturan penuh, peran di sesi;
  replikasi belum diuji. Pengungkapan AI (pengembangan + penulisan) ada di Metode kedua naskah.
- Anti plagiasi diri: tiap naskah ditulis tersendiri, saling mengutip sebagai makalah pendamping
  (Harviansyah 2026a/b); `verify-pair.py`: 0 kalimat kembar, 0,2% rangkaian 10 kata sama (hanya kutipan pasal).

## Draf untuk Dedi — ASUMSI

Dedi = pembuat kit aldo-starter (`galohot`), pihak ketiga → draf netral tanpa nama kementerian/angka riil
(keputusan 29 Sep). Kalau Dedi ternyata rekan Kemlu yang butuh KTI atas namanya: tanyakan perannya di proyek;
KTI kedua tidak boleh menyalin naskah ini.

## Terbuka (Aldo)

1. Isian kuning: NIP, jenjang (Ahli Pertama?), nomor/tanggal surat, nama Kepala BUP, pejabat perpustakaan, meterai.
2. Konfirmasi maksud "untuk Dedi".
3. Cek uraian proses lama sesuai pengamatannya; putuskan pengungkapan AI + surat pernyataan butir b.
4. Opsional: tangkapan layar aplikasi berdata contoh; nama aplikasi tingkat Kementerian (mis. tanpa "BUP").

Terkait: [[project-sigap-bup]], [[project-sipdln-bup]], [[reference-kti-percepatan-pangkat]], [[user-jabatan-kemlu]], [[reference-office-render]].
