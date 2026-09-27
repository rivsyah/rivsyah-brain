---
name: reference-herd-windows
description: "Herd di mesin riv: `herd link` gagal di sesi agen (Start-Process minta elevasi) — pakai junction di ~/.config/herd/config/valet/Sites; folder ter-link dilayani sebagai <nama>.test tanpa restart"
metadata:
  type: reference
  modified: 2026-09-27
---

Dicek 27 Sep 2026, mesin riv (Windows).

- Konfigurasi: `C:\Users\rivsy\.config\herd\config\valet\config.json` — TLD `test`, path yang dilayani:
  `…\valet\Sites` (tempat link) dan `C:\Users\rivsy\Herd` (parked).
- CLI: `C:\Users\rivsy\.config\herd\bin\herd.bat` (tidak ada di PATH Git Bash sebagai `herd`).
- **`herd link <nama>` gagal dari sesi agen:** PowerShell `Start-Process` melempar InvalidOperationException
  (minta elevasi), tetapi tetap mencetak "symbolic link has been created" padahal tidak ada. Jangan percaya
  pesannya; cek isi folder `Sites`.
- **Jalan keluar tanpa admin:** junction direktori dari PowerShell:
  `New-Item -ItemType Junction -Path "$env:USERPROFILE\.config\herd\config\valet\Sites\<nama>" -Target <folder>`.
  Situs langsung hidup di `http://<nama>.test/`, tanpa restart Herd.
- Situs statis (index.html) dilayani apa adanya; `.xls` keluar sebagai `application/vnd.ms-excel`,
  `.jsx` sebagai `application/octet-stream` (Babel standalone tetap bisa membacanya).
- Dipakai untuk [[project_pantas_kurs]]. Proyek baru di `~/dev` (bukan `~/Herd`) memakai cara ini.
