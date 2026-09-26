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

## Jebakan 1 — `neon mcp -y` bawaan mencetak API key akun-penuh ke 6 file

**HARD — jangan pernah jalankan `neon mcp -y` tanpa flag.** Perintah itu **tidak** hanya
mendaftarkan MCP ke Claude Code. Ia mencetak satu API key ber-scope seluruh akun — semua organisasi,
termasuk org pihak ketiga yang dicatat di [[reference-neon-account]] — lalu menuliskannya apa adanya
ke enam config agent sekaligus: `~/.claude.json`, `~/.gemini/config/mcp_config.json`,
`~/.gemini/settings.json`, `~/.codex/config.toml`, `~/.config/opencode/opencode.json`,
`~/AppData/Roaming/Zed/settings.json`.

Kunci itu juga **keluar dari mesin**: config-nya menunjuk MCP hosted
`https://mcp.neon.tech/mcp` dengan header `Authorization`, jadi kuncinya dikirim ke server Neon tiap
panggilan. Buktinya `Last Used From Addr` di `neon api-keys list` berbeda dari IP mesin ini. Artinya
menghapus kunci dari keenam file **tidak cukup** — hanya `revoke` yang benar-benar mematikannya.

**Bentuk yang benar** — satu agent, kunci ber-scope project, tools read-only:

```
neon mcp --agent claude-code --project-id <project> --read-only -y
```

Empat flag yang menyelamatkan, semuanya ada di `neon mcp --help`:

| Flag | Efek |
|---|---|
| `--agent <nama>` | pasang hanya ke agent itu (bisa diulang), bukan ke semua yang terdeteksi |
| `--project-id <id>` | pin tools ke satu project **dan** batasi kunci yang dicetak ke project itu |
| `--read-only` | tambah `?readonly=true` ke URL |
| `--oauth` | tulis URL saja, **tanpa mencetak API key**; agent sign-in sendiri saat pertama dipakai |

**Dua batas itu tidak sama kuat.** `--project-id` adalah batas kredensial: kunci ber-scope project
secara struktural tidak bisa membaca project lain, bikin project, atau mencetak kunci. `--read-only`
hanya parameter URL yang difilter server — CLI-nya sendiri memperingatkan kunci itu "can still change
and delete everything inside that project". Hapus parameter itu, akses tulis kembali.

**Jebakan turunan: `-y` bisa MEMAKAI ULANG kunci lama.** Help-nya berbunyi "reuse or mint an API
key" — ia membaca header `Authorization` dari config yang sudah ada. Jadi menjalankan ulang dengan
`--project-id` belum tentu mencetak kunci ber-scope baru. Supaya pasti: cabut kunci lama, **bersihkan
entri Neon dari semua config**, baru jalankan.

**Bentuk entri Neon per agent** (untuk pembersihan nanti) — kuncinya `Neon`, huruf N besar:

| File | Lokasi entri | Catatan |
|---|---|---|
| `.claude.json`, `.gemini/settings.json`, `.gemini/config/mcp_config.json` | `mcpServers.Neon` | JSON biasa |
| `.config/opencode/opencode.json` | `mcp.Neon` | JSON biasa |
| `Zed/settings.json` | `context_servers.Neon` | **JSONC** — ada komentar + trailing comma, `JSON.parse` gagal; sunting sebagai teks |
| `.codex/config.toml` | `[mcp_servers.Neon]` + `[mcp_servers.Neon.http_headers]` | TOML; sub-tabelnya menjorok, jadi `\n[` di kolom 0 menandai tabel berikutnya |

### Status per 26 Sep 2026 — sudah dibereskan

Kunci akun-penuh `neon-cli-mcp-20260922T120228Z-003e` (id 3356515) **dicabut** 26 Sep 2026. Ia hidup
empat hari di enam config dan masih terpakai beberapa menit sebelum dicabut, jadi bukan kunci mati
yang dibiarkan.

Penggantinya `neon-cli-mcp-20260926T115353Z-7901` (id **3366951**), ber-scope project
`tiny-pine-06410895`, `readonly=true`, dan **hanya** di `~/.claude.json`. Lima config agent lain
sudah bersih dari Neon.

Mencabut kunci ber-scope project **butuh `--org-id`**, tidak seperti kunci akun:
`neon api-keys revoke 3366951 --org-id <org>`. Ambil org id dengan `neon orgs list` — sengaja tidak
ditulis di sini karena berkas terlacak ditulis seolah publik. Kunci org dan kunci akun juga
dilaporkan terpisah: `neon api-keys list` hanya menampilkan yang level akun,
`neon api-keys list --org-id <org>` sisanya.

Yang **belum** dikerjakan: kunci `Bara` (id 3356477) di `env.db` masih ber-scope akun, jadi masih
melihat org pihak ketiga. Rencananya diganti org-scoped — lihat [[reference-neon-account]].

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
