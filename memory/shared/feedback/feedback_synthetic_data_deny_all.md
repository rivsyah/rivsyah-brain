---
name: Data sintetis dari data asli = tolak-semua
description: Data uji sintetis dari data asli klien wajib tolak-semua (teks asli hanya lolos lewat pola kode ketat/daftar izin), dan daftar "tes/file mana yang aman dikirim ke DB luar" wajib dihitung dari keluaran LENGKAP, bukan `| head`; saat analisis pun ambang frekuensi kata tidak menyaring nama — tiga insiden 27 Sep 2026 (SIGAP-BUP, PANTAS)
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
- **Masker "bentuk" wajib menyamarkan semua huruf Unicode**, bukan hanya `[A-Za-z]`. 27 Sep 2026 masker
  Latin-saja meloloskan satu nama beraksara Arab ke transkrip. Pakai kelas huruf Unicode
  (`[^\W\d_]` dengan flag Unicode), atau cetak panjang dan kelas karakter saja.
- Untuk data dummy yang **realistis** (bukan sekadar sintetis), pola yang terbukti:
  `C:\Users\rivsy\Herd\sigap-bup\scripts\generate-dummy.mjs` (mesin ini) — setiap string dilacak asal-
  usulnya, generator berhenti bila ada yang bukan buatannya/validator atau sama dengan nilai asli.
- **Daftar yang menjaga data** (misalnya file tes mana yang menyemai data asli dan harus dikecualikan)
  dihitung dari keluaran **lengkap** dan dihitung ulang tiap kali dipakai. Jangan dibangun dari
  `grep | head -N`: `head` memotong diam-diam tanpa tanda. Pasang batas bawah jumlah (mis. "≥ 6 file")
  supaya daftar yang menyusut menggagalkan skrip, bukan meloloskan data.

**Why:** 27 Sep 2026, generator pertama untuk uji Postgres SIGAP-BUP meneruskan kolom `kanal`. Delapan
nilai teratasnya nama bank, jadi kolom itu dianggap kategori. Ekor distribusinya ternyata teks bebas:
nama penerima transfer beserta nominal. Satu baris seperti itu terkirim ke branch Neon sandbox di
Singapura. INSERT-nya gagal (`VARCHAR(255)`), transaksinya di-rollback, dan branch-nya dihapus. Tetapi
pesan error Postgres mencetak isi baris itu ke transkrip sesi. Memeriksa nilai yang paling sering
muncul tidak membuktikan sebuah kolom itu kategori.

Insiden kedua di sesi yang sama: daftar tes yang dikecualikan dari run Postgres ditulis tangan dari
keluaran `grep … | head -40`. Keluaran itu terpotong tanpa tanda, jadi `TopbarTest` (yang menyemai data
asli) ikut jalan ke branch sandbox. Data asli masuk di dalam transaksi yang di-rollback, dan pesan error
foreign key mencetak satu baris asli ke transkrip, termasuk nama penerima dan tautan Google Drive.

Kejadian ketiga, 27 Sep 2026 (sesi PANTAS, analisis — bukan generator): untuk memahami kolom uraian BKU,
agen mencetak kata yang muncul di ≥25 baris. Ambang frekuensi itu tetap meloloskan nama depan staf, karena
pembayaran rutin atas nama orang muncul berulang. Hanya ke transkrip sesi, tidak ke layanan lain.
**Ambang frekuensi bukan penyaring nama.** Yang aman dicetak dari teks bebas: bagian nomenklatur standar
(mis. teks sebelum " - " di uraian BKU), kode akun, dan hasil uji keanggotaan terhadap kosakata tetap
(cetak "kata X muncul di N baris", bukan daftar kata).

**How to apply:** berlaku di semua scope, terutama `kemlu/`, dan berlaku juga saat sekadar menganalisis
data asli, bukan hanya saat membuat data sintetis. Pesan error database ikut mencetak nilai baris. Jadi
data yang belum lolos audit tidak boleh dikirim ke database luar mana pun, termasuk branch buangan.
Konteks proyeknya: [[project_sigap_bup]], [[project_pantas_kurs]].
