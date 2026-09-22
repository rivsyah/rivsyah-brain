---
name: reference-neon-cli
description: Neon CLI 5.0.1 dipasang global di riv dan di-link ke repo brain; neon mcp mencetak API key akun-penuh ke 6 config agent, dan neon config init bisa menghasilkan zod yang rusak
metadata:
  node_type: memory
  type: reference
  modified: 2026-09-22T12:10:00.000Z
---

Neon CLI versi **5.0.1** terpasang global di mesin riv (`npm i -g neon@latest`). Login pakai
`rivsyah@gmail.com` — akun yang benar menurut aturan identitas. `neon me` memicu alur OAuth browser
sendiri kalau sesi belum terotorisasi, jadi tidak perlu `neon login` terpisah.

Proyek yang di-link: `tiny-pine-06410895`, branch `production`. Link-nya ditulis ke `.neon` di
direktori kerja.

## Jebakan 1 — `neon mcp -y` mencetak API key akun-penuh ke 6 file

Perintah itu **tidak** hanya mendaftarkan MCP ke Claude Code. Ia mencetak satu API key ber-scope
seluruh akun (semua organisasi) lalu menuliskannya apa adanya ke enam config agent sekaligus:

- `~/.claude.json`
- `~/.gemini/config/mcp_config.json`
- `~/.gemini/settings.json`
- `~/.codex/config.toml`
- `~/.config/opencode/opencode.json`
- `~/AppData/Roaming/Zed/settings.json`

Key yang dicetak 22 Sep 2026 bernama `neon-cli-mcp-20260922T120228Z-003e`, id **3356515**. Cabut
dengan `neon api-keys revoke 3356515`. Daftar semua key dengan `neon api-keys list`.

Konsekuensinya: kredensial Neon hidup di enam file di luar `~/brain/env.db`, padahal aturan bilang
rahasia tinggal di env.db. Tidak ada file terlacak yang bocor — keenamnya di luar repo brain — tapi
permukaan seranganya jadi lebar. Kalau mau rapi, cabut key itu dan daftarkan MCP hanya untuk agent
yang dipakai.

## Jebakan 2 — `neon skills -y` melebarkan allowlist izin tanpa bertanya

Ia menulis `.claude/settings.local.json` di direktori kerja berisi grant
`PowerShell(git *)`, `PowerShell(neon mcp *)`, `PowerShell(neon link *)`. Grant `git *` itu luas.
Periksa file ini setiap kali `neon skills` dijalankan di direktori baru.

## Jebakan 3 — `neon config init` bisa memasang zod yang tidak lengkap

Gejalanya `neon deploy` gagal dengan:

```
Failed to evaluate neon.ts.
Underlying error: Cannot find module './v4/classic/external.js'
Require stack: node_modules/zod/index.js
```

Penyebabnya bukan sintaks TypeScript seperti yang disarankan pesan errornya. `zod@4.6.5` terpasang
separuh — seluruh berkas `v4/classic/external.*` tidak ikut ter-ekstrak. Perbaikannya: hapus
`node_modules/` dan `package-lock.json`, lalu `npm install` ulang. Setelah itu `neon deploy` jalan.

## File yang ditulis di direktori kerja

`neon.ts`, `package.json`, `package-lock.json`, `node_modules/`, `.neon`, `.env.local`,
`.claude/`, `skills-lock.json`.

`.env.local` berisi `DATABASE_URL`, `DATABASE_URL_UNPOOLED`, `NEON_BRANCH` — kredensial asli. CLI
menambahkan sendiri `.neon`, `.env.local`, dan `node_modules/` ke `.gitignore`, tapi **tidak**
`.claude/` maupun `skills-lock.json`. Pola `*.env` di gitignore brain tidak menangkap `.env.local`,
jadi jangan mengandalkan pola lama itu.

Lihat juga [[project_aldo_starter]] untuk kunci lain yang terpasang di env.db.
