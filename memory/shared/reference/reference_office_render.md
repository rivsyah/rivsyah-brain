---
name: reference-office-render
description: "Mesin riv: tidak ada LibreOffice/pdftoppm/pandoc; docx→PDF lewat Word COM — sempat macet 27 Sep 09:50 tapi JALAN lagi 10:00–10:25 (sesi MDP, ±12x; Close() RPC_E_DISCONNECTED tak berbahaya) dan 13:10–13:35 (sesi SIPDLN, SaveAs 17, instans sendiri), cadangan: render EMF per halaman; xlsx lewat Excel 16 COM, PDF→PNG lewat PyMuPDF (global); TEXT() Excel rusak di locale Indonesia; teks sel berawalan '=' dari openpyxl bikin Excel gagal membuka file; keepNext di sel tabel bikin tabel lompat halaman; pptx→PDF/PNG lewat PowerPoint 16 COM jalan (4 Okt); heredoc Git Bash di sesi agen merusak garis miring terbalik ganda (skrip ber-backslash tulis lewat Write tool)"
metadata:
  type: reference
---

Dicek 23 Sep 2026 di mesin riv (Windows), diperbarui 27 Sep 2026. Skill docx/xlsx mengasumsikan `soffice` +
`pdftoppm` — keduanya TIDAK ada, `pandoc` juga tidak ada. Standar tetap berlaku (render dan lihat hasilnya),
mekanismenya diganti:

- **docx → PDF:** Word 16 lewat COM di PowerShell:
  `$w = New-Object -ComObject Word.Application; $d = $w.Documents.Open(path, $false, $true);`
  `$d.ComputeStatistics(2)` (jumlah halaman) lalu `$d.ExportAsFixedFormat(pdfPath, 17)`; tutup dengan `$w.Quit()`.
  **Jalur paling andal (5 Okt 2026, sesi Media Cetak):** `$d.SaveAs([ref]$pdf, [ref]17)` (SaveAs lama, argumen
  `[ref]`), TANPA `$wd.DisplayAlerts = 0` — selesai 1 detik. Di sesi yang sama `ExportAsFixedFormat` macet 4/4 (buka
  read-only, read-write, dokumen kosong baru, tujuan di luar %TEMP%; semuanya dengan `DisplayAlerts = 0`), padahal sesi
  lain hari itu lancar memakai ExportAsFixedFormat. Jadi: coba SaveAs [ref] dulu; macet → bunuh PID sendiri, jangan ulang
  cara yang sama. Riwayat:
  **Macet 27 Sep 2026 09:39–09:50:** `ExportAsFixedFormat`, `SaveAs2` ke PDF (17) dan ke XPS (18) menggantung tanpa dialog —
  juga saat TIDAK ada proses Office lain (diuji 09:50). Open dan `ComputeStatistics` tetap jalan. Add-in
  `PDFMaker.OfficeAddin` (Adobe Acrobat; printer default "Adobe PDF") termuat di instance otomasi dan hanya admin yang
  bisa melepasnya — tersangka utama. **Jalur yang jalan (tanpa simpan):** `$d.ActiveWindow.View.Type = 3`, lalu per halaman
  `[byte[]]$d.ActiveWindow.Panes.Item(1).Pages.Item($i).EnhMetaFileBits` → `System.Drawing.Imaging.Metafile` → gambar ke
  Bitmap 1240x1754 → PNG. Angka NUMPAGES di footer tampil bertahap ("2 dari 3") — artefak render, bukan cacat dokumen.
  **Pembaruan 27 Sep 13:10–13:35 WIB (sesi SIPDLN-BUP):** `$d.SaveAs([ref]$pdf, [ref]17)` (SaveAs lama, bukan
  SaveAs2) **JALAN 3x berturut-turut**, 4 docx per putaran, padahal satu WINWORD `/Automation` milik sesi lain tetap
  hidup. `New-Object -ComObject Word.Application` membuat instans BARU (PID berbeda); `Quit()` + `ReleaseComObject`
  di `finally` menutupnya bersih dalam 3 detik.
- **Word COM yang macet:** catat PID di awal skrip, matikan HANYA PID itu dan hanya bila command line-nya `/Automation`.
  Sesi lain di mesin yang sama bisa sedang memakai Word. PowerShell tidak peka huruf besar: `$W` menimpa `$w` (objek
  Word) sehingga `Quit()` gagal dan Word tertinggal.
- **xlsx — hitung ulang:** `recalc.py` skill xlsx butuh LibreOffice, jadi tidak jalan. Pakai Excel 16 COM:
  `$x = New-Object -ComObject Excel.Application; $wb = $x.Workbooks.Open(p); $x.CalculateFull(); $wb.Save()`.
  Wajib untuk file hasil openpyxl: tanpa ini semua sel rumus kosong di previewer dan di `data_only=True`.
- **xlsx → PDF:** `$ws.ExportAsFixedFormat(0, pdfPath)`. Sheet **hidden** melempar "Value does not fall within the
  expected range" (juga PrintOut). Buka read-only (`Workbooks.Open(p, 0, $true)`), `$ws.Visible = -1`, ekspor,
  tutup tanpa simpan. Untuk cek visual: `PageSetup.Zoom = $false; FitToPagesWide = 1; FitToPagesTall = $false`.
- **Locale Excel:** desimal "," dan ribuan "." (`$x.International(3)`/`(4)`), walau `Get-Culture` PowerShell = en-US.
  Kode format di `TEXT()` dibaca dengan locale itu: `TEXT(x,"0.0%")` → "07%", `TEXT(x,"#,##0")` → "832419000,0".
  Pakai `FIXED(x, desimal)` — ikut pemisah locale mana pun.
- **PDF → PNG:** `import pymupdf` kini jalan global (cek 27 Sep 2026); bila hilang lagi:
  `python -m pip install --target ./pylib pymupdf` di scratchpad + `PYTHONPATH=./pylib`.
- **validate.py skill docx** butuh `defusedxml` (tidak global): `pip install --target ./pylib defusedxml`.
- **docx-js:** paket npm `docx` tidak ada di global. `npm install docx` di scratchpad.
- Jebakan docx-js: section tanpa `footers` mewarisi footer section sebelumnya di Word — beri Footer kosong
  eksplisit bila tidak mau paraf/nomor halaman.

Dipakai untuk [[reference_template_spk]], [[project_pengadaan_amdk]], dan [[project-langganan-media-cetak]].

Tambahan 27 Sep 2026 (mesin riv):
- **Jangan jalankan dua ekspor PDF Office bersamaan** (mis. sesi utama + subagent). Word dan Excel sama-sama macet
  tanpa dialog (Excel berjudul "Publishing..."); proses harus dibunuh. Satu pengguna COM pada satu waktu.
  Koreksi (sesi Media Cetak, 09:50): ekspor PDF **Word** tetap macet walau sendirian — lihat butir docx → PDF di atas.
  Ekspor PDF Excel jalan normal saat sendirian. Pembaruan: macetnya ternyata tidak permanen — lihat "Jalur paling andal".
- Skrip skill docx (`merge_runs.py`, `office/validate.py`) butuh `defusedxml`: `pip install --target <scratchpad>/pylib
  defusedxml` lalu `PYTHONPATH=<scratchpad>/pylib`. `lxml` sudah ada global.
- Hapus/sisip baris xlsx yang dirujuk rumus: pakai Excel COM (`Rows(n).Delete()`), bukan openpyxl — openpyxl tidak
  menggeser rumus maupun merge. Pola aman: edit nilai dengan openpyxl di koordinat asli, lalu COM hapus baris +
  `CalculateFull` + `SaveAs(path, 51)`.
- Paragraf kosong terakhir sesudah tabel tanda tangan bisa tumpah jadi halaman kosong: kecilkan (spacing 0,
  line exact 20, sz 2).

Koreksi 27 Sep 2026 10:25 (sesi MDP PBJP, [[reference-mdp-pbjp-ringkas]]):
- **Ekspor PDF Word JALAN lagi.** `Documents.Open` → `TablesOfContents.Update()` → `SaveAs2(docx,16)` →
  `ExportAsFixedFormat(pdf,17)` berhasil ±12 kali berturut-turut (dokumen 75–97 hlm, ±20 detik) antara 10:00 dan
  10:25. Satu-satunya gejala: `Close()` sesudah ekspor melempar RPC_E_DISCONNECTED — berkas keluaran tetap utuh
  (lolos validate.py). Jadi "macet 09:50" kemungkinan kondisi sesaat (bentrok sesi lain/PDFMaker), bukan permanen.
  Skrip yang terbukti: `C:\Users\rivsy\dev\kemlu\mdp-pbjp-ringkas\render.ps1` (catat PID WINWORD sebelum, bunuh
  hanya proses baru di `finally`). Kalau menggantung lagi, baru pakai jalur EMF di atas.
- **Jebakan tabel Word:** paragraf ber-`keepNext` di sel tabel mana pun membuat Word menahan baris itu bersama baris
  berikutnya. Beberapa baris berturut-turut ber-keepNext → seluruh tabel lompat ke halaman baru dan menyisakan
  halaman hampir kosong. Untuk judul pasal di tabel dwibahasa: jadikan baris judul sendiri (keepNext, cantSplit)
  dan biarkan baris isi boleh terbelah (`cantSplit: false`).
- `validate.py` juga butuh `lxml` bila dipasang ke `--target` terpisah (global sudah ada).

Catatan 27 Sep 2026 10:31-10:45 (sesi tesis MBA, [[project-wharton-thesis]]):
- SaveAs2 via COM gagal di SEMUA percobaan (hang / RPC_E_DISCONNECTED), termasuk docx 1 baris, saat
  beberapa sesi lain juga memakai Word. ExportAsFixedFormat tetap jalan (72 hlm, ~40 detik).
- Dugaan kuat: pembersihan "bunuh WINWORD yang PID-nya muncul setelah aku mulai" BERBALAPAN antar-sesi;
  dua sesi yang start bersamaan saling membunuh Word. Bunuh proses hanya saat timeout, bukan di finally.
- File kunci `~$nama.docx` yang tertinggal dari Word yang dibunuh membuat Word berikutnya membuka read-only;
  hapus dulu sebelum Open.

Tambahan 28 Sep 2026 (sesi KKE Furniture Lt 3, [[project-kke-furniture-lt3]]):
- **COUNTIF/COUNTIFS dengan kriteria teks berawalan operator** ("> 110%", "<=…") dibaca sebagai perbandingan, bukan teks → hasil 0. Pakai penanda teks biasa (mis. "TIMPANG").
- **SEARCH("BELUM") ikut cocok dengan kata "sebelum"** (tidak peka huruf) — hati-hati di aturan conditional formatting.
- Validasi daftar lintas-sheet (mis. `='Rekap'!$B$9:$B$18`) disimpan Excel sebagai ekstensi x14; openpyxl membuangnya saat membaca ("Data Validation extension is not supported"). Urutan aman: bangun dengan openpyxl → Excel COM hitung ulang + simpan → JANGAN disimpan ulang dengan openpyxl.
- Format angka `#,##0.##` tampil "1," untuk bilangan bulat di Excel locale ID → pakai General untuk volume.
- Excel COM ekspor PDF per sheet (`$ws.ExportAsFixedFormat(0, path)`) jalan normal 28 Sep 14:10–14:35 (3x).

Tambahan 29 Sep 2026 ([[project-kke-furniture-lt3]]):
- **Kriteria COUNTIF berisi desimal literal** ("<0.5", ">1.1") gagal di Excel locale ID (desimal koma) → selalu 0. Pakai `SUMPRODUCT(ISNUMBER(r)*(r<0.5))` atau `"<"&0.5`. Konkatenasi angka (`"<"&C7`) aman karena dikonversi dengan locale yang sama.
- `recalc.ps1` lewat `powershell -File`: parameter array tidak terbaca — kirim daftar sheet sebagai satu string dipisah titik koma.
- Sheet bernama diawali angka/berisi "&" (mis. `4 Harga & Spek`) aman di rumus asal dikutip tunggal.

Tambahan 30 Sep 2026 (sesi AMDK alamat, [[project_pengadaan_amdk]]):
- Word COM `ExportAsFixedFormat(pdf, 17)` jalan 3x berturut-turut di instans baru (catat PID WINWORD sebelum/sesudah
  `New-Object`; instans keluar sendiri ≤5 detik setelah `Quit()`). Dua WINWORD lain (PID /Automation sisa 27 Sep dan
  /Embedding) dibiarkan hidup — bukan milik sesi ini.
- Excel `$wb.ExportAsFixedFormat(0, pdf)` tingkat workbook hanya mengekspor sheet visible. Ukuran halaman PDF ikut
  driver printer (mis. 1218x942 pt), bukan A4 — sama dengan ekspor Aldo; printer menskalakan saat cetak.
- Halaman kosong di akhir PDF Word bisa berasal dari `pageBreakBefore` pada paragraf kosong terakhir, bukan hanya
  dari tinggi paragraf. Cek pPr-nya.

Tambahan 30 Sep 2026 (sesi GWS, [[project-gws-business-standard]]):
- **Excel COM `.NumberFormat` lewat PowerShell memakai konvensi locale ID** (getter mengembalikan `#.##0,00`). Menulis kode en-US
  (`"Rp"#,##0.00`) terbaca salah → tampil `Rp75000000,000`. Aman: baca format sel yang benar lalu tulis balik apa adanya
  (round-trip), atau tambahkan literal teks ke bagian pertama format lama.
- Parameter skrip `$Src` tertimpa variabel `$src` (PowerShell tidak peka huruf besar) dan tipe `[string]`-nya ikut → array hasil
  `Split` jadi teks, COM melempar DISP_E_BADINDEX. Jangan pakai nama variabel yang sama dengan parameter.
- Word COM `ExportAsFixedFormat(pdf,17)` jalan 2x (16:22–16:25) di instans baru; Excel `$wb.ExportAsFixedFormat(0,pdf)` jalan 4x.
- Pola docx dari template (lxml, klon paragraf/tabel prototipe, sampul + footer dipertahankan) terbukti; tabel ≤ 8 baris diberi
  keepNext di semua baris kecuali terakhir agar tidak terbelah — sengaja, dan menggeser tabel utuh ke halaman berikut.

Tambahan 4 Okt 2026 (sesi RAB pernikahan, [[project_rab_pernikahan]]):
- **Teks sel yang diawali `=`** (mis. keterangan "= tamu − 30") ditulis openpyxl sebagai rumus rusak. Excel COM lalu
  melempar "Unable to get the Open property of the Workbooks class" — mode repair (`CorruptLoad=1`) juga gagal dan tidak
  ada log `error*.xml` di %TEMP%. Uji pembeda: workbook openpyxl 1 sel terbuka normal. Perbaikan: jangan awali teks
  dengan `=` (atau set `cell.data_type = "s"`); builder sebaiknya menolak teks seperti itu sebelum menyimpan.
- Excel COM `CalculateFull` + `UsedRange.Rows.AutoFit()` + `ExportAsFixedFormat(0, pdf)` jalan 4x berturut-turut
  (09:00–09:20 WIB). AutoFit mengabaikan sel merge: tinggi baris judul merge harus diset ulang sesudahnya.

Tambahan 4 Okt 2026 (sesi rapat Kemendag PBJ LN, [[project-rapat-kemendag-pbjln]]):
- **PowerPoint 16 COM jalan**: `Presentations.Open(path, -1, 0, 0)` lalu `SaveAs(pdf, 32)` untuk PDF dan
  `Slides(i).Export(png, "PNG", 1600, 900)` untuk QA per slide. Instans keluar sendiri beberapa detik setelah `Quit()`.
  Skrip: `C:\Users\rivsy\dev\kemlu\rapat-kemendag-pbjln\render.ps1` (juga docx lewat Word COM).
- Word COM `ExportAsFixedFormat(pdf, 17)` jalan 2x (10:40–10:50 WIB) berdampingan dengan WINWORD milik sesi lain.
- **Heredoc Git Bash di tool Bash agen merusak escape**: dua garis miring terbalik berturut-turut runtuh jadi satu,
  walau delimiter heredoc dikutip. Akibatnya regex JS berisi pembatas kata berubah jadi karakter backspace, dan jalur
  awalan jalur panjang Windows (`\\?\`) di Python patah. Skrip yang memuat garis miring terbalik ditulis dengan
  Write tool, lalu dijalankan. Untuk menyalin berkas di jalur > 260 karakter: PowerShell `Copy-Item -LiteralPath`
  dengan awalan `\\?\`.
- pptxgenjs 4.x: margin sel tabel dalam **inci**; nilai ≥ 1 dibaca sebagai poin. `margin: [0, 6, 0, 6]` = 6 inci → tabel rusak.

Tambahan 5 Okt 2026 (sesi kajian P3I, [[project_kajian_p3i_permenlu3]]):
- **`pdftotext -layout` menggeser isi sel tabel** bila tinggi sel di satu baris berbeda: kolom kanan tampak "bergeser"
  satu baris padahal di PDF rapi. Klaim "tabel rusak" sempat masuk reviu lalu harus ditarik. Jangan mengklaim cacat
  tata letak dari teks ekstraksi; render halamannya dengan PyMuPDF (`page.get_pixmap(dpi=80).save(png)`) lalu lihat.
- Read tool untuk PDF gagal (butuh pdftoppm). Jalur yang jalan: `pdftotext` (ada di /mingw64/bin Git Bash) atau PyMuPDF
  `get_text()` per halaman — cocok untuk skrip cek klaim per nomor halaman.
