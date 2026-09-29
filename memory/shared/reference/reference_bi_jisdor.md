---
name: reference-bi-jisdor
description: "Kurs JISDOR Bank Indonesia bisa diunduh otomatis lewat postback tombol Unduh (ASP.NET) → xlsx; GET biasa beri 10 hari; web service wskursbi mati; Frankfurter/ECB beda 15–20 poin — dicek 27 Sep 2026, port PHP jalan 29 Sep 2026"
metadata:
  type: reference
  modified: 2026-09-29
---

Dicek 27 Sep 2026 dari mesin riv.

- **Halaman:** https://www.bi.go.id/id/statistik/informasi-kurs/jisdor/default.aspx. GET biasa (UA peramban)
  mengembalikan HTML berisi tabel 10 hari terakhir. Tidak ada anti-bot JS, beda dengan e-PPID Kemlu.
- **Rentang penuh:** kirim ulang semua `<input type="hidden">` halaman + `…$TextBoxFrom`,
  `…$TextBoxDateTo`, `…$HiddenFieldDateFrom`, `…$HiddenFieldDateTo` (format dd/mm/yyyy) +
  `…$ButtonExport=Unduh`, dengan cookie jar. Balasannya `Informasi Kurs Jisdor.xlsx`: kolom
  `NO | Tanggal | Kurs`, tanggal berupa teks **bulan/hari/tahun** `9/25/2026 12:00:00 AM`.
  Cukup urllib + http.cookiejar + openpyxl; satu implementasi sudah ada di [[project_pantas_kurs]]
  (`tools/update_kurs.py`).
- **Mati:** `biwebservice/wskursbi.asmx/getSubKursLokal3` → respons kosong.
- **Pembanding:** `api.frankfurter.dev` (ECB, CORS terbuka) jalan, tetapi USD/IDR-nya beda 15–20 poin
  dari JISDOR. Bukan pengganti untuk angka resmi.
- Angka publik: JISDOR 2 Jan 2026 = 16.725; tertinggi 2026 = 18.171 (8 Jun); 25 Sep 2026 = 17.917;
  29 Sep 2026 = 17.998.
- **Dicek ulang 29 Sep 2026:** port PHP (Laravel `Http` + Guzzle `CookieJar`, pola sama) jalan; satu
  unduhan rentang 1 Jan 2024 – 29 Sep 2026 = 650 hari bursa, cocok 194/194 dengan data PANTAS. Nama
  field formulir: regex `name="(ctl00\$ctl\d+\$g_[0-9a-f_]+\$ctl00)\$TextBoxFrom"`; periksa
  `Content-Type` balasan (`spreadsheetml`) sebelum membaca xlsx. Implementasi: [[project-sipdln-bup]]
  (`app/Services/JisdorBi.php`).
