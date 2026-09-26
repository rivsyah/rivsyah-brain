---
name: reference-stray-git-home
description: Ada repo git nyasar di C:\Users\rivsy (0 commit, tanpa .gitignore) yang mengklaim seluruh home termasuk .ssh dan env.db; dan Herd\sigap-bup tidak punya version control sendiri
metadata:
  node_type: memory
  type: reference
  modified: 2026-09-26T14:00:00.000Z
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
Menunggu keputusan Aldo per 26 Sep 2026.

## 2. `Herd\sigap-bup` tidak punya version control

Tidak ada `.git` di `C:\Users\rivsy\Herd\sigap-bup`, dan tidak ada di `C:\Users\rivsy\Herd` juga.
Seluruh aplikasi — 22 layar, `BudgetControlService`, `AuditService`, 140 tes Pest — hidup tanpa
riwayat.

**Ini risiko terbesar untuk migrasi SQLite→Postgres yang sedang berjalan.** Migrasi itu menyentuh 13
titik raw SQL, 9 `groupBy`, dan 10 `lockForUpdate` yang belum pernah benar-benar aktif. Tanpa git,
tidak ada rollback kalau salah satu berubah perilaku. Lihat [[project-sigap-bup]].

Proyek Herd lain belum diperiksa apakah punya repo sendiri.
