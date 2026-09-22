---
name: bara-agent-workspace
description: "Bara = nama agent all-in-one Aldo; workspace di ~/Bara, dan ~/Herd sengaja TIDAK di-rename"
metadata:
  type: project
---

Agent all-in-one Aldo diberi nama **Bara** (2026-09-01) — bara api, nyambung ke
brand AIgnited, empat huruf enak diketik di CLI. Tagline: "satu nyala, semua
kerja". State pakai metafora yang sama: membara (idle) / menyala (kerja) /
padam (selesai).

- **Workspace:** `C:\Users\rivsy\Bara\` — `CLAUDE.md` (peta kerja + konvensi),
  `README.md`, `scripts/`, `notes/`. Bukan tempat output; pekerjaan tetap di
  repo masing-masing.
- **Definisi agent:** `C:\Users\rivsy\Bara\.claude\agents\bara.md`, scope proyek
  saja. Belum dipasang global ke `~/.claude/agents/` (direktori itu belum ada);
  perintah pemasangannya ada di README workspace.
- **`C:\Users\rivsy\Herd` sengaja TIDAK di-rename.** Sempat diminta jadi `Bara`,
  dibatalkan setelah ketahuan folder itu parked path Laravel Herd
  (`~/.config/herd/config/valet/config.json`) — rename mematikan semua situs
  `.test` sampai di-park ulang, plus 4 app punya `bootstrap/cache/*.php` dengan
  path absolut. Skrip rename-nya sudah dihapus atas permintaan Aldo (2026-09-01);
  kalau suatu saat berubah pikiran, harus dibuat ulang dari nol.

Lihat juga [[gpu-worker-wan2gp-locations]] untuk isi `Herd\AIgnited\`.
