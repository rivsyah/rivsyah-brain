---
name: project_nusaterra_venture
description: NusaTerra Venture — venture builder + investor pribadi Aldo (AI × transisi energi); blueprint v0.2 30 Okt 2026, PT Perorangan, modal Rp1 M, belum ada entitas
metadata:
  type: project
---

# NusaTerra Venture

**Mulai 30 Okt 2026.** Aldo: build + invest di AI, teknologi, new energy, sustainability; privat dan
publik; Indonesia dan luar negeri. Keputusan desain diserahkan ke agent.

Blueprint v0.2: `C:\Users\rivsy\dev\personal\nusaterra-venture\BLUEPRINT.md` (mesin riv).

## Jawaban Aldo (30 Okt 2026) — HARD
- Pendiri tunggal, Aldo = co-founder dan direksi sendiri.
- ~~Terpisah penuh dari AIgnited~~ → **DIGANTI 30 Okt 2026 (kata Aldo): AIgnited berada di bawah NusaTerra Ventures.** Kartu tetap di scope `personal/`; Aldo sendiri yang menautkan kedua scope, jadi nama/peran AIgnited boleh muncul di NusaTerra. Fakta operasional AIgnited lain (klien, GPU, keuangan) tetap jangan dibawa tanpa izin.
- Nama tetap NusaTerra, domain **nusaterra.vc**.
- Modal tahun 1: **Rp1 miliar** (asumsi agent: "1M" = Rp1 miliar).

## Keputusan agent (v0.2)
- D1 PT Perorangan (satu pemegang saham; modal Rp1 M masuk kriteria mikro ≤ Rp1 M PP 7/2021) → PT biasa saat ada pemegang saham kedua.
- D2 Modal sendiri, belum fund berizin. D3 Tesis "AI × transisi energi". D4 Tiga buku: Studio Rp400 jt / Ventures Rp300 jt / Public Book Rp200 jt / ops Rp100 jt. D5 Dana luar = Fase 2.

## Fakta dicek 30 Okt 2026
- PMV VCC ekuitas min Rp50 M (POJK 25/2023, sekunder). Dana pihak ketiga di saham listed = izin MI.
- PT Perorangan: WNI, satu pemegang saham, usaha mikro/kecil; >1 pemegang saham wajib jadi PT biasa (sekunder). Belum pasti boleh KBLI 64200 holding → tanya notaris.
- nusaterra.com + .id terdaftar pihak lain; nusaterra.vc NXDOMAIN (kemungkinan bebas, belum dibeli — beli = Aldo).
- Restricted list wajib: Aldo juga memiliki unit riset yang menerbitkan rekomendasi saham.

## Memo tesis v0.1 (30 Okt 2026)
Claude Doc privat: https://claude.ai/artifact/5h3DnG7NXLF6yu4knp8hBA — "AI × Transisi Energi".
- Celah: dana iklim ID menumpuk di PLTS atap + motor listrik; software AI operasi energi hampir tak punya investor; belum ada startup ID murni AI-energy software yang terdanai → isi lewat Studio.
- Studio: SolarWatch, CarbonLedger Ekspor (paralel dulu), FactoryMeter (tunggu, butuh hardware). Nama = placeholder, belum cek merek.
- 30 target privat; cocok tiket kecil (7): Arysun, Lumio Solar, Alternō, Blitz, Jejakin, CarbonEthics, Noovoleum.
- 10 emiten pantau: PGEO, BREN, KEEN, NCKL, MBMA, ANTM, INCO, ADRO, TOBA, DCII (+ARKO); batas sektor nikel 40%.
- Pesaing terdekat: 100x100 (venture builder iklim regional, US$100 jt, Jun 2026).
- Fakta: IDXCarbon Jan–Jul 2026 hanya 165.240 tCO2e; JETP komitmen US$21,8 M, terpakai US$3,1–3,5 M; listrik 2025 batu bara 66,5%.

## KOREKSI ALDO 30 Okt 2026 — HARD
- Induk = **NusaTerra Venture**. "NusaTerra Capital" adalah salah tangkap agent; JANGAN dipakai lagi.
- Struktur: NusaTerra Venture (Studio + investasi privat) → **Maxxing Capital** + **AIgnited**. Tidak ada sub-merek "NusaTerra Ventures" terpisah.
- Website: Platforms = 3 kartu sejajar (Studio & Ventures, Maxxing, AIgnited dgn logo api dari `Downloads\AIgnited\New Logo\logosmall.png` → `site/assets/aignited-mark.png`); baris "A NusaTerra Capital company" di kartu Maxxing DIHAPUS (Aldo).
- Folder kembali ke `~/dev/personal/nusaterra-venture`; launch.json `nusaterra-site` sudah diarahkan ke sana.
- AIgnited punya dua pendiri (Aldo + Dedi) → klaim "di bawah NusaTerra Venture" secara publik butuh persetujuan Dedi + dasar kepemilikan.

## Arsitektur merek + logo + website (30 Okt 2026, sebagian digantikan koreksi di atas)
- Aldo: induk bernama **NusaTerra Capital**; **Maxxing Capital berada di bawahnya**, fokus active funds investing & trading.
- Struktur (keputusan agent): NusaTerra Capital → NusaTerra Ventures (Studio + privat) + Maxxing Capital (ambil alih Public Book; brand D24 tetap, baris "A NusaTerra Capital company").
- Folder: ~/dev/personal/nusaterra-venture (brand/ + site/ + BLUEPRINT.md). Belum git.
- Logo v1 "Horizon" (PROPOSAL): cakram, atas matahari laterit #B5532C, bawah 3 lapisan tanah ink #13221D; Paper #F4F0E8; Fraunces + Libre Franklin + IBM Plex Mono (2 terakhir sama dgn Maxxing).
- Website statis 1 halaman, English, dicek desktop + 375 px (tanpa overflow). Preview: launch.json `nusaterra-site` di ~/Bara/.claude (python http.server 8731). Disclaimer: modal sendiri, bukan penawaran efek, tak terima dana publik. Kontak placeholder hello@nusaterra.vc (domain belum dibeli). Tanpa nama pendiri dan tanpa portofolio palsu.
- Jebakan: IntersectionObserver tidak jalan di pane tersembunyi → isi tak tampil; pakai cek getBoundingClientRect saat scroll + kelas `.js`.

## Opsi desain deep blue (30 Okt 2026)
- Aldo suka deep blue → `site/options.html`: A Deep Horizon (Horizon biru #0B1F3A + amber #F2A541, Fraunces; REKOMENDASI), B Archipelago (monogram N 3 pulau, #071A33 + biru elektrik #4D8DFF, Space Grotesk), C Tidal (3 gelombang dalam lingkaran, gradasi biru + lime #C4F25C, Sora). Menunggu pilihan Aldo; website penuh dibangun ulang setelah dipilih.
- Website: AIgnited ditambahkan (kartu portofolio "NusaTerra Ventures company" → aignited.id, baris di kartu Ventures, footer).
- Konflik makin nyata: Ignited Research (di bawah AIgnited) kini satu grup dengan Maxxing (trading) → restricted list wajib sebelum transaksi pertama.

## Brand v2 DIPILIH (30 Okt 2026)
- Aldo pilih **opsi A Deep Horizon** → locked. Deep Blue #0B1F3A, Mid Blue #1D3A66, Amber #F2A541 (teks di atasnya Deep Blue), Amber Deep #B06A12 (teks di latar terang), Mist #EEF3FA, Slate #5B6B82; Fraunces + Libre Franklin + IBM Plex Mono.
- brand/*.svg, favicon, README, dan site/index.html sudah dipindah ke palet ini; dicek desktop + 375 px (tanpa overflow). Laterit v1, B Archipelago, C Tidal tidak dipakai.
- Jangan pakai emas Maxxing #B08D46 di materi NusaTerra.

## Peta jalan pendirian (30 Okt 2026)
- Aldo: belum ada badan hukum, legalitas, atau administrasi. Claude Doc privat: https://claude.ai/artifact/CmwVCXLSSbgiuHKbFB92jb (peta entitas + Gerbang 0 + 9 langkah + administrasi + isu khusus + checklist 4 tahap).
- Rekomendasi: 1 PT induk; Maxxing & Studio = divisi; PT AIgnited terpisah (PT biasa, bersama Dedi). Langkah #1 = izin tertulis atasan, karena PT Perorangan memaksa pendiri jadi direktur. Izin ditolak → PT biasa, Aldo pemegang saham + komisaris, direktur non-ASN (BUKAN nominee).
- KBLI induk: 64210 + 70209. Software/AI dijalankan PT AIgnited.
- Perps Hyperliquid jangan atas nama PT sampai ada pendapat konsultan pajak & hukum.
- Fakta regulasi lengkap: [[reference_pendirian_pt_2026]].

- Bahan surat izin atasan (kerangka, poin per paragraf, 7 komitmen, lampiran, langkah setelah kirim) = Claude Doc privat: https://claude.ai/artifact/Kqs9mvjfMT1CDbkgkMcxgy. Bahan saja; Aldo menulis kalimatnya sendiri. Tanpa nama instansi/NIP.

## Website v2 — gaya aignited.id (31 Okt 2026)
- Aldo minta UI/UX website NusaTerra mengikuti aignited.id. `site/index.html` ditulis ulang: latar hitam #050608, font Geist + Geist Mono (Google Fonts), kicker bernomor (01 Point of view, 02 Platforms, 03 Index, 04 Approach, 05 Portfolio, 06 Contact), angka besar + baris sumber, baris index dengan tag (Validating/Next/Focus), tombol pill putih.
- Hero: lengkung planet biru + matahari amber (mark Horizon) yang naik saat scroll (CSS var --p dari JS, sticky stage 190vh). Contact ditutup lengkung yang sama.
- Platforms = 3 chapter (Studio & Ventures, Maxxing dgn mark M asli, AIgnited dgn logo api). Aksen amber #f2a541.
- Versi Deep Horizon lama disimpan: `site/index-v1-deephorizon.html`. Belum deploy, belum git.

## OPEN
1. Kelayakan Aldo sebagai direktur PT (status kepegawaian; PP 94/2021 tak melarang tegas, tapi benturan kepentingan + izin instansi) — chat saja, jangan masuk berkas terlacak.
2. Setujui isi website; status hukum AIgnited (PT? pemegang saham lain?) sebelum ditulis 'under' secara publik; nama pendiri di situs? (risiko status kepegawaian). Kota basis belum ditulis di situs.
3. Beli nusaterra.vc + cek AHU/PDKI. 4. Notaris: PT Perorangan + KBLI.
