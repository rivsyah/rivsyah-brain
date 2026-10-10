---
name: reference-python-crlf-windows
description: "Python di Windows: open(p, 'w') menulis CRLF; patch berkas vault/repo dengan newline='\n' atau mode biner. Skrip patch ditulis dengan Write tool, bukan heredoc Bash (backslash rusak)"
metadata:
  type: reference
  modified: 2026-10-10
---

Dicek 10 Okt 2026, mesin riv (Windows).

**Jebakan 1 — CRLF.**

- `io.open(p, "w", encoding="utf-8").write(s)` di Windows mengubah setiap LF menjadi CRLF.
  Satu patch kecil mengubah SELURUH berkas jadi CRLF (MEMORY.md: 164 baris, kartu: 171 baris).
- Git menormalkan saat commit karena `core.autocrlf=input` di repo brain, jadi diff tetap kecil.
  Tapi working copy tetap CRLF sampai diperbaiki, dan skrip bash yang membaca baris akan melihat
  karakter CR di ujung baris.
- Tanda: `git diff --stat` memberi warning "CRLF will be replaced by LF".
- Cara benar: tambahkan argumen `newline="\n"` pada `io.open(...)`, atau baca dan tulis biner.
- Perbaikan: dalam mode biner, ganti `b"\r\n"` dengan `b"\n"`, lalu pastikan warning hilang.

**Jebakan 2 — heredoc Bash merusak backslash.**

- Kode Python yang dikirim lewat heredoc di Bash tool kehilangan backslash: `'\\n'` sampai ke
  Python sebagai `'\n'` dan menjadi baris baru sungguhan. Ini memecah satu baris indeks menjadi
  dua (10 Okt 2026), padahal heredoc sudah dikutip (`<<'EOF'`).
- Hal yang sama menimpa `grep -c $'\r'`: backslash hilang, jadi yang dihitung adalah baris yang
  memuat huruf "r". Cek akhir baris dengan `file <berkas>` (menyebut "CRLF line terminators" bila
  CRLF), bukan dengan grep.
- Cara benar: tulis skrip patch sebagai berkas dengan Write tool, lalu jalankan dengan
  `python -I <berkas>`. Untuk teks Markdown, pakai Write atau Edit tool langsung.
