---
name: reference-stray-git-home
description: Ada repo git nyasar di C:\Users\rivsy (0 commit, 3.515 blob yatim 192 MB dari 2 Jul 2026) yang mengklaim seluruh home — Aldo mengizinkan hapus 27 Sep, tapi agent diblokir pengaman + kunci berkas, jadi Aldo menghapus sendiri; Herd\sigap-bup sudah punya git sendiri
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

**Rekomendasi:** hapus `C:\Users\rivsy\.git`. Tidak ada commit dan tidak ada file terlacak.

**Temuan 27 Sep 2026:** repo itu menyimpan **3.515 blob yatim (192 MB)**, semuanya bertanggal **2 Jul 2026**
— jejak satu kali `git add` di home yang stage-nya kemudian dibatalkan. Tidak ada tree atau commit, jadi
nama berkasnya tidak tercatat. Versi *terkini* `env.db`, `.claude.json`, `.bash_history`, `.gitconfig`
tidak ada di antaranya; versi 2 Juli-nya tidak bisa dipastikan. Alasan tambahan untuk menghapus.

**Status 27 Sep 2026:** Aldo **mengizinkan** hapus ("silahkan"). Agent tetap tidak bisa:
- `rm -rf` ditolak pengaman mode otomatis Claude Code ("Irreversible Local Destruction").
- Ganti nama (`mv` ke `.git-nyasar-2026-09-27`, cara yang bisa dibalik) gagal dua kali: `Permission
  denied` dari Windows, karena berkas di dalamnya dipegang proses lain — kemungkinan sesi Claude lain
  yang berjalan dari `~` (ada 10+ sesi) dan menjalankan `git status` di home. Proses `fsmonitor` tidak
  aktif untuk repo ini.

29 Sep 2026: Aldo bilang **akan menghapus sendiri**. ⚠ OPEN sampai terkonfirmasi hilang (cek di sesi
berikutnya dengan `test -d ~/.git`). Caranya, setelah sesi Claude yang berjalan dari `~` ditutup:
`Remove-Item -Recurse -Force C:\Users\rivsy\.git` (PowerShell). Setelah itu cek dengan
`git -C C:\Users\rivsy rev-parse --show-toplevel` → harus menjawab "not a git repository".

## 2. `Herd\sigap-bup` — SELESAI 27 Sep 2026

Dulu tidak punya version control (26 Sep). **Sekarang punya repo sendiri** di
`C:\Users\rivsy\Herd\sigap-bup\.git` (mesin Windows ini), branch `main`, commit baseline `97d1861`
dibuat saat 140/140 tes hijau di SQLite. `git -C Herd\sigap-bup rev-parse --show-toplevel` kini
menjawab folder proyek, bukan home. Rinciannya di [[project_sigap_bup]].

Proyek Herd lain belum diperiksa apakah punya repo sendiri. Yang tidak punya tetap bicara dengan
repo home sampai `~/.git` dihapus.
