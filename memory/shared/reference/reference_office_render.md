---
name: reference-office-render
description: "Mesin riv: tidak ada LibreOffice/pdftoppm/pandoc; docx→PDF lewat Word COM MACET sejak 27 Sep 2026 (Adobe PDFMaker) → cek visual docx lewat render EMF per halaman; xlsx dihitung ulang + diekspor lewat Excel 16 COM, PDF→PNG lewat PyMuPDF (kini global); TEXT() Excel rusak di locale Indonesia"
metadata:
  type: reference
---

Dicek 23 Sep 2026 di mesin riv (Windows), diperbarui 27 Sep 2026. Skill docx/xlsx mengasumsikan `soffice` +
`pdftoppm` — keduanya TIDAK ada, `pandoc` juga tidak ada. Standar tetap berlaku (render dan lihat hasilnya),
mekanismenya diganti:

- **docx → PDF:** Word 16 lewat COM di PowerShell:
  `$w = New-Object -ComObject Word.Application; $d = $w.Documents.Open(path, $false, $true);`
  `$d.ComputeStatistics(2)` (jumlah halaman) lalu `$d.ExportAsFixedFormat(pdfPath, 17)`; tutup dengan `$w.Quit()`.
  **MACET sejak 27 Sep 2026:** `ExportAsFixedFormat`, `SaveAs2` ke PDF (17) dan ke XPS (18) menggantung tanpa dialog —
  juga saat TIDAK ada proses Office lain (diuji 09:50). Open dan `ComputeStatistics` tetap jalan. Add-in
  `PDFMaker.OfficeAddin` (Adobe Acrobat; printer default "Adobe PDF") termuat di instance otomasi dan hanya admin yang
  bisa melepasnya — tersangka utama. **Jalur yang jalan (tanpa simpan):** `$d.ActiveWindow.View.Type = 3`, lalu per halaman
  `[byte[]]$d.ActiveWindow.Panes.Item(1).Pages.Item($i).EnhMetaFileBits` → `System.Drawing.Imaging.Metafile` → gambar ke
  Bitmap 1240x1754 → PNG. Angka NUMPAGES di footer tampil bertahap ("2 dari 3") — artefak render, bukan cacat dokumen.
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
  Ekspor PDF Excel jalan normal saat sendirian.
- Skrip skill docx (`merge_runs.py`, `office/validate.py`) butuh `defusedxml`: `pip install --target <scratchpad>/pylib
  defusedxml` lalu `PYTHONPATH=<scratchpad>/pylib`. `lxml` sudah ada global.
- Hapus/sisip baris xlsx yang dirujuk rumus: pakai Excel COM (`Rows(n).Delete()`), bukan openpyxl — openpyxl tidak
  menggeser rumus maupun merge. Pola aman: edit nilai dengan openpyxl di koordinat asli, lalu COM hapus baris +
  `CalculateFull` + `SaveAs(path, 51)`.
- Paragraf kosong terakhir sesudah tabel tanda tangan bisa tumpah jadi halaman kosong: kecilkan (spacing 0,
  line exact 20, sz 2).
