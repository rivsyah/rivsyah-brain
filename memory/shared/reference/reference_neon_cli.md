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

`neon link` menulis link-nya ke `.neon` di direktori kerja. **Tidak ada direktori yang di-link lagi
per 26 Sep 2026** — link di `~/brain` dilepas dan project tujuannya dihapus. Lihat bagian pembersihan
di bawah.

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

### Status per 26 Sep 2026 ±12:50Z — selesai

MCP hanya terpasang di `~/.claude.json`, dengan kunci ber-scope project
`rapid-lab-46810989` (id 3367047) dan `readonly=true`. Lima config agent lain bersih — diverifikasi
nol `mcp.neon.tech` dan nol `napi_`. **Tidak ada lagi kunci ber-scope akun di seluruh akun Neon.**
Daftar kunci lengkap dan sejarah rotasinya ada di [[reference-neon-account]].

Dua kunci MCP sebelumnya sudah dicabut. Yang pertama (id 3356515, ber-scope akun) hidup empat hari di
enam config. Yang kedua (id 3366951) aman tapi **dipin ke project yang salah** — project kosong yang
sudah ditinggalkan, jadi MCP-nya tidak berguna selama ±1 jam tanpa memberi tanda apa pun.

**Pelajaran: kunci ber-scope aman tidak berarti benar.** Pin yang menunjuk project mati gagal dalam
diam — MCP tetap menyambung, tools tetap muncul, databasenya saja yang kosong. Setiap kali project
pindah, `?projectId=` di URL MCP ikut basi dan tidak ada yang memperingatkan.

**Melaporkan dan mencabut kunci berbeda per level.** `neon api-keys list` hanya menampilkan kunci
level akun; kunci org dan project butuh `neon api-keys list --org-id <org>`. Begitu juga pencabutan:
kunci akun cukup `neon api-keys revoke <id>`, kunci org atau project **wajib** `--org-id <org>`. Org
id diambil dengan `neon orgs list`, sengaja tidak ditulis di sini karena berkas terlacak ditulis
seolah publik.

Login CLI `neon` sendiri (OAuth) **tetap ber-scope akun** dan masih melihat ketiga org, termasuk org
pihak ketiga. Jadi mencabut semua kunci akun tidak menutup jalur CLI. Aturan HARD "wajib sebut
`org_id`" di [[reference-neon-account]] tetap berlaku untuk tiap perintah `neon`.

**Dua hal kecil di CLI v5.0.1:**

- `neon endpoints list` **tidak ada** — perintahnya dihapus dan errornya berantakan (`Unknown
  commands` plus assertion libuv). Pakai `neon branches list --project-id <id>` lalu
  `neon connection-string <branch> --project-id <id>`.
- `neon api-keys list` menulis baris INFO ke stderr. Di PowerShell 5.1 itu muncul sebagai
  `NativeCommandError` walau exit code-nya 0. Jangan dibaca sebagai kegagalan.

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

### `~/brain` sudah dibersihkan — jangan scaffold Neon di sini lagi

26 Sep 2026 seluruh scaffold deploy dicabut dari repo brain: `.neon`, `.env.local`, `neon.ts`,
`package.json`, `package-lock.json`, `node_modules/`. Yang tersisa hanya `.claude/skills/` dan
`skills-lock.json`, keduanya gitignored.

**Memasangnya di `~/brain` sejak awal memang salah.** Repo itu memory dan infrastruktur agent, dan
aturannya jelas: kode nyata ke `~/dev`, bukan ke sini. Akibat nyatanya bukan teoretis — repo memory
sempat menyimpan kredensial database di `.env.local` dan sebuah link `.neon` ke project yang
kemudian mati. Kerja Neon yang asli ada di `C:\Users\rivsy\Herd\sigap-bup`.

Baris `.neon`, `.env.local`, `node_modules/`, `.claude/`, `skills-lock.json` sengaja **ditinggal** di
`.gitignore` brain. Kalau suatu saat ada yang menjalankan `neon link` di sini lagi, jaringnya sudah
terpasang.

Catatan: `neon` CLI **tidak punya** `unlink`. Melepas link = hapus `.neon` dan `.env.local` sendiri.

Lihat juga [[project_aldo_starter]] untuk kunci lain yang terpasang di env.db.
