---
name: project-dtiif-2026
description: DTIIF 2026 (Danantara, Fairmont Jakarta 26-28 Okt 2026) - Aldo hadir sebagai CEO AIgnited + Pejabat Pengadaan Kemlu; kartu nama dua set terpisah, checklist, risiko konflik kepentingan
metadata:
  type: project
  modified: 2026-10-24
---

Scope: Aldo SENDIRI menggabungkan aignited + kemlu untuk acara ini (24 Okt 2026). Jangan bawa isi kartu ini ke luar acara DTIIF.

- Acara: Danantara Technology Innovation Investment Forum, 26-28 Okt 2026, Fairmont Jakarta. Ambil badge 25 Okt
  13.00-21.00 WIB di South Lobby (bawa QR/e-mail konfirmasi). Badge wajib untuk semua sesi.
- Format (berita, 15 Okt): hari 1 prioritas strategis + kemitraan global; hari 2 teknologi x industri x modal
  (project pitching, business matching, bilateral terbatas); hari 3 ekosistem inklusif. 6 pilar: energi, pangan &
  kesehatan, hilirisasi mineral, infrastruktur digital & mobilitas, perbankan & fintech, industri pendukung.
  Target >1.500 peserta. Jadwal per jam belum ditemukan.
- Tujuan Aldo: expose "main project Bentala" (milik/bersama Dedi - detail BELUM ada di vault), networking untuk AIgnited,
  dan kepentingan pengadaan Kemlu.
- Kartu nama (v2, 24 Okt): `Downloads\DTIIF 2026\kartu-nama.html` (blok DATA) + `kartu-nama-aignited.pdf`, `kartu-nama-kemlu.pdf`
  (90x55 mm, 2 hlm masing-masing, render Chrome headless; QR diuji jsQR). Data dari Aldo: HP +62 851-7432-3265 (pribadi,
  dipakai di KEDUA kartu), e-mail dinas rivaldo.syah@kemlu.go.id (izin Aldo di sesi ini, khusus kartu Kemlu), web aignited.id
  (hidup, Cloudflare, tolak curl tanpa UA browser; Aldo: "associated with irawan.dev"), QR AIgnited -> https://aignited.id,
  QR Kemlu -> https://kemlu.go.id/.
- Kartu Kemlu v3 (24 Okt) dibangun dari TEMPLATE RESMI `Downloads\KEMLU Name Card Editable.ai` (PDF-compatible, 4 hlm
  94x59 mm = 90x55 + bleed 2 mm: depan ID, belakang ID, depan EN, belakang EN; ada juga `KEMLU Name Card.pdf` versi
  outline). Builder `~/dev/kemlu/kartu-nama-dtiif/build.py` + `overlay.html`: hapus teks contoh (redaksi teks saja,
  vektor tetap), hapus QR lama (isinya kemlu.go.id/portal/id dan /portal/en), tempel teks + QR baru (https://kemlu.go.id/,
  sesuai permintaan Aldo) hasil Chrome headless. Output `Downloads\DTIIF 2026\kartu-nama-kemlu.pdf` 4 hlm; QR didekode jsQR = OK.
  Font resmi = SECONDA (subset di .ai tidak lengkap, tidak terpasang) -> pengganti Hind. Untuk hasil persis: percetakan
  ketik ulang di .ai dengan Seconda. Pola template: ID kiri miring = jabatan, kanan medium = unit; EN kebalikannya.
  Versi tiruan v2 (aset logo negatif/batik buatan agent) sudah DIBUANG.
- Kartu AIgnited: logo Spark Tile (Downloads\AIgnited\AIgnited logo design.zip, #FF4D00 / #0B0C0E, Space Grotesk).
  Tagline sengaja kosong (agent tidak mengarang slogan). LinkedIn kosong.
- Keputusan agent: DUA kartu terpisah, bukan satu kartu dua jabatan - alasan konflik kepentingan (pelaku pengadaan
  wajib hindari konflik kepentingan, Perpres 16/2018 jo 12/2021 Ps 7) dan [[user-jabatan-kemlu]] (JF Penata Kanselerai,
  "Pejabat Pengadaan" = peran, bukan JF PPBJ). DISETUJUI Aldo 24 Okt: dua kartu terpisah.
- Materi networking (25 Okt): `Downloads\DTIIF 2026\onepager-aignited.pdf` (A4 2 hlm EN: AIgnited + Belantara, QR ke
  aignited.id dan belantara.aignited.id) + `briefing-networking.pdf` (A5 4 hlm ID: aturan main, checklist, poin pitch,
  Q&A, target, log kontak). Sumber fakta: `Downloads\AIgnited\Slide Deck\AIgnited Company Profile v2.md` (tagline resmi
  "Intelligence, Automated."; CTO = M. Dedi Irawan) + `Balantaran\AI Incubation Public Sector\Belantara_Proposal_Deck_Bappenas.md`
  + situs live. KOREKSI 25 Okt: asumsi "bentala = Belantara" SALAH. **Bentala** = proyek tersendiri (bentala.aignited.id, "the world, measured against itself": tiap negara vs normalnya sendiri, data publik). Belantara (belantara.aignited.id, v0.9, 23 skill, 25 playbook) proyek lain. One-pager hlm 2 & briefing masih berfokus Belantara -> perlu disesuaikan bila Aldo mau Bentala jadi sorotan.
- Status situs 25 Okt: hidup = aignited.id, belantara, fiskal, umkm, labiru; MATI = terminal, reelo (tidak resolve), tdc (500).
- Bendera: deck Bappenas Apr 2026 klaim kedua founder "full-time" -> tidak cocok dengan status PNS Aldo. OPEN: angka
  pendanaan yang diminta, status proposal Bappenas.
- Proyek AIgnited live per 25 Okt (dari Aldo + cek): Bentala, Cakrawala (peta situasi Indonesia), Transit (simulasi
  KRL/MRT/LRT/TJ Jabodetabek), Gapmap (celah usaha per kecamatan, data BPS), Belantara, Fiskal, UMKM Digital, Labiru.
  aignited.id sendiri (Astro) belum memuat Bentala/Cakrawala/Transit/Gapmap dan masih menonjolkan Terminal yang mati.
- Zona aignited.id = akun Cloudflare LAIN (NS ulla/yadiel), bukan akun Aldo (gracie/syeef) -> agent tak bisa deploy.
- Halaman satu-link "All projects": `Downloads\DTIIF 2026\projects-hub\index.html` (statis, 1 berkas). Aldo pilih:
  Dedi yang pasang di **https://projects.aignited.id**. QR kartu AIgnited sudah mengarah ke sana (didekode OK), tapi per
  25 Okt subdomain BELUM ADA -> jangan cetak sebelum hidup.
- LinkedIn Aldo di kartu = linkedin.com/in/rivaldoharviansyah (dari Aldo). Situs aignited.id memakai URL lain:
  /in/rivaldo-harviansyah-aa3782136/ -> salah satu perlu diselaraskan.
