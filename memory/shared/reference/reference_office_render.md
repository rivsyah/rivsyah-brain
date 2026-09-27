---
name: reference-office-render
description: "Mesin riv: tidak ada LibreOffice/pdftoppm/pandoc; docx→PDF lewat Word 16 COM, xlsx dihitung ulang + diekspor lewat Excel 16 COM, PDF→PNG lewat PyMuPDF (kini global); TEXT() Excel rusak di locale Indonesia"
metadata:
  type: reference
---

Dicek 23 Sep 2026 di mesin riv (Windows), diperbarui 27 Sep 2026. Skill docx/xlsx mengasumsikan `soffice` +
`pdftoppm` — keduanya TIDAK ada, `pandoc` juga tidak ada. Standar tetap berlaku (render dan lihat hasilnya),
mekanismenya diganti:

- **docx → PDF:** Word 16 lewat COM di PowerShell:
  `$w = New-Object -ComObject Word.Application; $d = $w.Documents.Open(path, $false, $true);`
  `$d.ComputeStatistics(2)` (jumlah halaman) lalu `$d.ExportAsFixedFormat(pdfPath, 17)`; tutup dengan `$w.Quit()`.
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

Dipakai untuk [[reference_template_spk]] dan [[project_pengadaan_amdk]].
