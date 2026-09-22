---
name: aldo-starter install
description: Bagaimana kit aldo-starter dipasang di mesin riv, lima penyimpangan dari default, dan tiga bug hulu yang perlu dilaporkan ke Dedi.
type: project
---

# aldo-starter di mesin `riv`

Kit personal Claude Code dari **Dedi (`galohot/aldo-starter`, commit `a6ff292`)**, dipasang
22 Sep 2026. Repo brain: `rivsyah/rivsyah-brain`. Lihat juga [[project_bara_agent]].

## Tujuh penyimpangan dari default kit — jangan "dikembalikan"

1. **`BRAIN="$HOME/brain"`, bukan `$HOME/claude`.** Di Windows `$HOME/claude` menunjuk ke
   `C:\Users\rivsy\Claude` yang sudah ada (berisi `Artifacts\`), karena filesystem Windows
   case-insensitive. Bootstrap menolak jalan kalau BRAIN sudah terisi.
2. **`brain-build.sh` dipatch** — slug pointer memory dihitung dari path natif lewat `cygpath -w`.
   Aslinya `/c/Users/rivsy` → `-c-Users-rivsy`, padahal Claude Code memakai `C--Users-rivsy`,
   jadi pointer mendarat di folder yang tidak pernah dibaca.
3. **`harness/hooks/session-start.sh` dipatch** — daftar kandidat brain ditambah `$HOME/brain`.
   Tanpa itu hook tidak menemukan `.brain-env` dan jatuh ke placeholder ("your agent").
4. **`harness/hooks/block-confidential.sh` dipatch** — sama. Lebih berbahaya: guard-nya `exit 0`
   diam-diam kalau brain tidak ketemu, jadi `CONFIDENTIAL_DIRS` akan mengizinkan semuanya
   tanpa peringatan.
5. **`brain-build.sh` dipatch (kedua)** — `subst()` dijalankan dua lintasan. Aslinya satu lintasan,
   padahal `{{CONFIDENTIAL_BLOCK}}` memuat `{{OWNER_SHORT}}` di dalamnya, jadi token bersarang itu
   baru muncul setelah gilirannya lewat dan tercetak mentah di rulebook. Urutan iterasi array
   asosiatif bash acak, jadi bug ini muncul-hilang antar mesin.
6. **`brain-push.sh` dipatch** — `fetch` ke repo yang masih kosong gagal dengan
   `couldn't find remote ref main`, dan skrip mati SEBELUM push. Artinya push pertama ke repo
   kosong — alur yang justru disuruh SETUP.md — tidak pernah bisa jalan. Patch: kalau fetch gagal
   DAN `ls-remote --heads` kosong, itu push pertama, bukan error.
7. **`permissions.defaultMode` sengaja TIDAK dipasang** di `settings.json`. Template kit menulis
   `"default"` untuk `AUTONOMY=normal`, yang akan memaksa tiap sesi mulai di mode tanya-dulu dan
   menimpa pilihan mode Aldo sendiri. `deny` juga kosong karena `CONFIDENTIAL_DIRS` kosong.
   Salinan settings yang dipakai: `~/brain/harness/settings.riv.json`.

**Patch 2–6 hilang kalau `bootstrap.sh --update` dijalankan** — skrip itu `rm -rf` lalu menyalin
ulang `bin/`, `rules/`, `harness/`, `framework/`. Pasang ulang patch-nya setelah tiap `--update`.

## Lima bug hulu — laporkan ke Dedi

Patch 2–6 semuanya bug di kit, bukan salah konfigurasi. Patch 2–4 kena ke siapa pun yang memasang
di Windows atau memakai `BRAIN` selain `$HOME/claude`: hook-hook itu menghardcode lokasi brain
padahal `BRAIN` sudah ada di `agent.conf` dan di `.brain-env`. Patch 5 kena ke semua platform,
tapi munculnya tidak pasti karena bergantung urutan iterasi array asosiatif. Patch 6 kena ke
SETIAP pemasangan baru, di platform mana pun: tidak ada yang bisa menyelesaikan push pertamanya.

## Memory

Vault kanonik pindah ke `~/brain/memory/`. 29 kartu dimigrasi dari
`~/.claude/projects/C--Users-rivsy/memory/`, yang kini hanya menyimpan pointer. Kartu baru
ditulis ke vault, bukan ke folder pointer, lalu `~/brain/bin/brain-push.sh` sekali di akhir sesi.

Dua entri indeks lama menunjuk ke kartu yang sudah hilang dari disk — `project_pdp_kemlu` dan
`project_pdp_vms_next`. Proyeknya nyata, kartunya tidak ada. Tulis ulang kalau masih diperlukan.

## Kredensial

`~/brain/env.db` (chmod 600, tidak pernah di-commit, tidak ikut remote). Isinya per 22 Sep 2026 —
**nama kunci saja, nilainya tidak pernah ditulis di mana pun:**

| Terpasang | Belum |
|---|---|
| `GITHUB_PAT`, `CLOUDFLARE_API_TOKEN`, `CLOUDFLARE_ACCOUNT_ID`, `VERCEL_TOKEN` | `NEON_API_KEY`, `NEON_DATABASE_URL`, `ANTHROPIC_API_KEY` |

`VERCEL_TOKEN` diuji hidup 22 Sep 2026 dengan
`~/brain/bin/envdb.sh run VERCEL_TOKEN -- vercel whoami` → akun `rivsyah`. Vercel CLI 54.18.7
terpasang global lewat npm di `C:\Program Files\nodejs`.

Tambah lewat `~/brain/bin/envdb-setup.sh` **di terminal biasa**, jangan di dalam sesi Claude Code —
skripnya sendiri menolak jalan tanpa `/dev/tty`, dan apa pun yang diketik di sesi masuk transkrip.
Cek isi tanpa mengetik apa pun: `~/brain/bin/envdb-setup.sh --check` (hanya mencetak nama kunci).
`brain-push.sh` merakit URL berisi token saat jalan, jadi token tidak pernah mendarat di
`.git/config` — kebalikan dari PAT yang sempat ditemukan tertanam di remote
`Herd\updated smst 1 pbjp kemlu`.
