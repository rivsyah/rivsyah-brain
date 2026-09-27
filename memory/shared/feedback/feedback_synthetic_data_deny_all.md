---
name: Data sintetis dari data asli = tolak-semua
description: Data uji sintetis yang diturunkan dari data asli klien wajib tolak-semua — teks asli hanya lolos bila cocok pola kode ketat atau daftar izin; kolom yang tampak "kategori" bisa berisi nama orang (insiden kanal SIGAP-BUP, 27 Sep 2026)
metadata:
  type: feedback
  modified: 2026-09-27T12:00:00.000Z
---

**Aturan.** Generator data sintetis yang membaca data asli wajib **tolak-semua**:

- Nilai teks asli hanya boleh lewat bila cocok **pola kode yang ketat** atau **persis** token di daftar
  izin. Pola kode yang ketat artinya tanpa huruf kecil, dan tiap token hanya angka atau 1–3 huruf
  kapital diikuti angka. Pola seperti `[A-Z0-9]{1,6}` masih meloloskan nama kapital pendek ("BUDI").
- Kolom yang tidak dikenal membuat generator **berhenti**, bukan diteruskan apa adanya.
- Teks pengganti dibuat **sepanjang aslinya**, supaya uji batas `VARCHAR` tetap sah.
- Audit keluaran sebelum dikirim ke mana pun. Setiap string harus palsu, kode, tanggal, atau token
  izin.
- Saat memeriksa data asli, cetak nama kolom, panjang, dan jumlah saja, jangan nilainya.

**Why:** 27 Sep 2026, generator pertama untuk uji Postgres SIGAP-BUP meneruskan kolom `kanal`. Delapan
nilai teratasnya nama bank, jadi kolom itu dianggap kategori. Ekor distribusinya ternyata teks bebas:
nama penerima transfer beserta nominal. Satu baris seperti itu terkirim ke branch Neon sandbox di
Singapura. INSERT-nya gagal (`VARCHAR(255)`), transaksinya di-rollback, dan branch-nya dihapus. Tetapi
pesan error Postgres mencetak isi baris itu ke transkrip sesi. Memeriksa nilai yang paling sering
muncul tidak membuktikan sebuah kolom itu kategori.

**How to apply:** berlaku di semua scope, terutama `kemlu/`. Pesan error database ikut mencetak nilai
baris. Jadi data yang belum lolos audit tidak boleh dikirim ke database luar mana pun, termasuk
branch buangan. Konteks proyeknya: [[project_sigap_bup]].
