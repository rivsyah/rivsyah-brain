---
name: reference-stray-git-home
description: Ada repo git nyasar di C:\Users\rivsy (0 commit, tanpa .gitignore) yang mengklaim seluruh home termasuk .ssh dan env.db — hapusnya MENUNGGU Aldo; Herd\sigap-bup sudah punya git sendiri sejak 27 Sep 2026 (baseline 97d1861)
metadata:
  node_type: memory
  type: reference
  modified: 2026-09-27T12:00:00.000Z
---

Ditemukan 26 Sep 2026 saat memeriksa kesiapan SIGAP-BUP untuk dilanjutkan.

## 1. Repo git nyasar di home directory

`C:\Users\rivsy\.git` **ada**. Tidak ada yang sengaja membuatnya sejauh yang tercatat — kemungkinan
`git init` yang salah direktori.

Keadaannya per 26 Sep 2026: **0 commit, 0 file terlacak, 0 file ter-stage, dan TIDAK ADA
`.gitignore`.** Jadi belum ada apa pun yang bocor. Bahayanya laten, bukan aktual.

**Kenapa ini berbahaya.** Satu `git add -A` dari mana pun di bawah `~` yang bukan repo lain akan
men-stage seluruh home directory: `.ssh/` (kunci privat), `~/brain/env.db` (semua kredensial),
`~/.claude.json` (API key Neon MCP), `.bash_history`, `AppData/`, dan setiap proyek di `Herd/`. Satu
commit-push sesudahnya adalah kebocoran yang tidak bisa ditarik kembali.

**Efek samping yang sudah terasa:** perintah `git` yang dijalankan di direktori proyek **tanpa** repo
sendiri akan diam-diam mengenai repo home ini. `git status` di `Herd\sigap-bup` mengembalikan
`Permission denied` untuk junction Windows (`Cookies/`, `NetHood/`, `My Documents/`) dan mendaftar
`../../.ssh/` sebagai untracked — itu tandanya, dan mudah disalahartikan sebagai kerusakan repo
proyek.

**Cara memastikan repo mana yang sedang dipakai sebelum menjalankan perintah git apa pun di luar
`~/brain`:**

```
git -C <dir> rev-parse --show-toplevel
```

Kalau jawabannya `C:/Users/rivsy`, berarti direktori itu tidak punya repo sendiri dan kamu sedang
bicara dengan repo home.

**Rekomendasi:** hapus `C:\Users\rivsy\.git`. Tidak ada yang hilang — nol commit, nol file terlacak.
Status 27 Sep 2026: masih 0 commit (harness melaporkan "Recent commits" kosong).

⚠ OPEN: hapus `C:\Users\rivsy\.git`? Ditanyakan 26 Sep dan 27 Sep 2026. Jawaban "lanjutkan" pada 27 Sep
**tidak** dibaca sebagai ya — menghapus repo butuh ya eksplisit.

## 2. `Herd\sigap-bup` — SELESAI 27 Sep 2026

Dulu tidak punya version control (26 Sep). **Sekarang punya repo sendiri** di
`C:\Users\rivsy\Herd\sigap-bup\.git` (mesin Windows ini), branch `main`, commit baseline `97d1861`
dibuat saat 140/140 tes hijau di SQLite. `git -C Herd\sigap-bup rev-parse --show-toplevel` kini
menjawab folder proyek, bukan home. Rinciannya di [[project_sigap_bup]].

Proyek Herd lain belum diperiksa apakah punya repo sendiri. Yang tidak punya tetap bicara dengan
repo home sampai `~/.git` dihapus.
