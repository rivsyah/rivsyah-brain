---
name: reference-office-render
description: "Mesin riv: tidak ada LibreOffice/pdftoppm/pandoc; docx→PDF lewat Word 16 COM, PDF→PNG lewat PyMuPDF di scratchpad; paket npm docx tidak global"
metadata:
  type: reference
---

Dicek 23 Sep 2026 di mesin riv (Windows). Skill docx mengasumsikan `soffice` + `pdftoppm` — keduanya TIDAK ada,
`pandoc` juga tidak ada. Standar tetap berlaku (render dan lihat hasilnya), mekanismenya diganti:

- **docx → PDF:** Word 16 lewat COM di PowerShell:
  `$w = New-Object -ComObject Word.Application; $d = $w.Documents.Open(path, $false, $true);`
  `$d.ComputeStatistics(2)` (jumlah halaman) lalu `$d.ExportAsFixedFormat(pdfPath, 17)`; tutup dengan `$w.Quit()`.
- **PDF → PNG:** `python -m pip install --target ./pylib pymupdf` di scratchpad, lalu
  `PYTHONPATH=./pylib python` + `import pymupdf` (`page.get_pixmap(dpi=..).save(..)`). Tidak dipasang global.
- **docx-js:** paket npm `docx` tidak ada di global. `npm install docx` di scratchpad.
- Jebakan docx-js: section tanpa `footers` mewarisi footer section sebelumnya di Word — beri Footer kosong
  eksplisit bila tidak mau paraf/nomor halaman.

Dipakai pertama untuk [[reference-template-spk]].
