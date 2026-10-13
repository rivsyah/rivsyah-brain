---
name: project-rab-monev-jamkes-pimpri-2026
description: "RAB PDLN Monev Jamkes Pimpri TA 2026 (Paris–Oslo, Canberra–Sydney, Buenos Aires) dari templat RAB LN Biro Keuangan; SBM 2026 PMK 32/2025; total Rp730.189.600 @kurs 18.000 (tiket dipecah per negara 13 Okt)"
metadata:
  type: project
  modified: 2026-10-13
---

13 Okt 2026. Aldo minta RAB seperti `Downloads\RAB LN.xlsx` (templat Asistensi Biro Keuangan, Mei 2025)
untuk rundown `04. Monev 2026 - Tentative Rundown_rev.docx`. Hasil: `Downloads\RAB LN Monev Jamkes Pimpri 2026.xlsx`
(builder di scratchpad sesi, tidak disimpan).

Keputusan agent (belum dikonfirmasi Aldo):
- Gol PDLN: IV/a → C, III/b → D, III/c → C, IV/d Eselon I → A (tiket bisnis). Aturan: [[project-sipdln-bup]] GolonganPdln.
- Hari: Pasal 8 ayat 4 per arah (≤24 j = 1 hari, 25–48 j = 2 hari). Paris 3+1×40%, Oslo 3+1, Canberra 3+1,
  Sydney 2+1, Buenos Aires 4 penuh + 4×40% (31j50m tiap arah).
- Tiket = SBM PP Lamp. II angka 18 (bukan harga pasar seperti templat): Paris–Oslo open-jaw pakai SBM Oslo
  (ekonomi 4.049); Canberra PP mencakup ruas Sydney. Taksi = SBM transport bandara DKI Rp250.000 (Lamp. II angka 16).
- Kurs asumsi Rp18.000 (JISDOR 29 Sep 2026 Rp17.998), satu sel F17 per sheet. Templat lama pakai 17.000.
- Header satker/RO masih punya Biro Keuangan (6023.EBD.955) — belum tentu pemilik program Jamkes Pimpri.
Total: Paris 195,36 jt; Oslo 47,43 jt; Canberra 224,34 jt; Sydney 45,79 jt; Buenos Aires 223,08 jt = Rp736,0 jt.

**Revisi 13 Okt (Aldo: "tiket pesawat dibreakdown tiap negara").** Tiket kini dipecah per sheet: ruas internasional =
½ SBM PP kota itu (pergi di kota pertama, pulang di kota terakhir). Ruas antar-kota TIDAK ada di SBM → estimasi
pasar: Paris–Oslo US$300/org, Canberra–Sydney US$400/org (Eselon I ikut ekonomi; QantasLink rute ini [Likely] tanpa
kelas bisnis). Taksi juga dibagi 1 kali per kota pertama/terakhir. Buenos Aires tetap PP (satu negara).
Total baru: Paris 109,05 jt; Oslo 131,61 jt; Canberra 144,61 jt; Sydney 121,84 jt; Buenos Aires 223,08 jt = Rp730,19 jt.
Yang lama (Rp736,0 jt, tiket open-jaw SBM Oslo) sudah diganti.
