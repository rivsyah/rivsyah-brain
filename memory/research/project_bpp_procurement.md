---
name: project-bpp-procurement
description: "Brief \"From Rulemaker to Buyer\" 31pp tentang LKPP → Badan Pengadaan Pemerintah, di Research Reports\\Rulemaker-to-Buyer"
metadata: 
  node_type: memory
  type: project
  originSessionId: 6d73ebeb-6104-4ffd-92fc-beb275777980
  modified: 2026-08-15T14:55:48.960Z
---

Brief Ignited Research **"From Rulemaker to Buyer"** (31 hlm, PDF) di
`Downloads\Research Reports\Rulemaker-to-Buyer\`, terbit 15 Agustus 2026 —
sehari setelah Prabowo mengumumkan LKPP dinaikkan jadi Badan Pengadaan
Pemerintah dalam pidato RAPBN 2027 (14 Agustus 2026). Seluruh basis bukti baru,
tidak ada yang dipakai ulang dari brief sebelumnya.

**Tesis:** mandatnya benar, angkanya salah. Klaim Rp360trn = 30% × Rp1.200trn
mengasumsikan *seluruh* belanja pengadaan bisa dikonsolidasi. Dekomposisi
penulis (2 langkah terpublikasi + 2 asumsi berlabel) menghasilkan Rp20–58trn
per tahun — 6–16% dari headline. Kerangka: **The Leverage Agenda** (SCOPE ·
STRUCTURE · SAFEGUARD · SETTLE).

**Why:** ini brief pertama yang angka intinya adalah *konstruksi penulis*, bukan
data terbit. Karena itu `verify.py` diberi gerbang tambahan: build gagal kalau
lima label kejujuran hilang dari PDF (`stated assumption`, `author's stated
assumptions`, catatan tidak-ada-data-primer, penanda definisi efisiensi belum
dipublikasi, dan caveat sub judice untuk angka perkara pidana). Master prompt
minta data primer proprietary; tidak ada yang diberikan, jadi kekosongan itu
dinyatakan di halaman scope, bukan ditambal dengan angka karangan.

**How to apply:** kalau brief berikutnya juga bertumpu pada konstruksi sendiri,
tiru pola ini — beri label di setiap titik pakai (cover plate, figure, tabel,
anneks) dan jadikan label itu bagian dari gerbang build. `sources/dossier.md` §9
mencatat lima angka yang ketemu di media tapi **sengaja tidak dipakai** karena
tidak bisa dilacak ke sumber primer (a.l. pangsa e-katalog 19/30/39% dan jumlah
KLPD UKPBJ level 3).

Tiga jebakan baru yang ketemu di build ini, sudah dicatat di README:
`S.note()` wajib membungkus teks (kalau tidak, `bbox_inches="tight"` melebarkan
kanvas SVG dan grafiknya yang menyusut, bukan notanya) · `Circle` di koordinat
axes menggambar elips, radius y harus dikali `W/H` · `tr.grp` punya
`text-transform:uppercase` sehingga baris total jadi `RP20–58TRN`, dipakai
`tr.total` sebagai gantinya.

**Edisi kedua (3 Sep 2026), 37 hlm + deck 16 slide.** Dengar pendapat Kepala
LKPP **Sarah Sadiqa** dengan Komisi XI DPR pada 2 Sep 2026 menutup dua lubang
edisi pertama: LKPP melaporkan efisiensi **Rp14,10 triliun dari pagu Rp25,69
triliun** (= 54,9%), yang **memverifikasi** dugaan Kotak 1 bahwa efisiensi =
selisih pagu-realisasi, bukan penurunan harga. Basis terukur itu cuma 2,1% dari
Rp1.200 triliun — untuk menopang klaim, basisnya harus tumbuh ~47×. Jadi
Gambar 7. Pagu LKPP 2027 belum memuat BPP; ~20.000 SDM PBJ bersertifikat sudah
ada (menutup lubang tenaga kerja, dan justru melawan argumen kapasitas saya
sendiri). Tambahan: Perpres 46/2025 = perubahan kedua Perpres 16/2018.

**Why:** edisi pertama salah menetapkan tanggal — ditulis seolah sehari setelah
pengumuman 14 Agustus padahal hari itu 3 September. Selalu pakai currentDate
dari system prompt sebagai jangkar, bukan tanggal berita.

**PERINGATAN:** folder edisi Indonesia `Dari-Regulator-ke-Pembeli` **hilang dari
disk** per 3 Sep 2026 (beberapa folder proyek lain di Downloads juga hilang —
Bought and Sold, El Nino, Koperasi). Belum dibangun ulang. Kalau diminta lagi,
sumbernya bisa direkonstruksi dari edisi Inggris + catatan di bawah.

**Edisi bahasa Indonesia (hilang, perlu dibangun ulang):** *"Dari Regulator ke Pembeli"* 33 hlm di
`Research Reports\Dari-Regulator-ke-Pembeli\` — folder sibling, `content.py`
sendiri, angka/sumber/argumen identik. Kerangkanya jadi **Agenda Daya Ungkit**
(LINGKUP · STRUKTUR · PENGAMAN · PEMBUKTIAN). Istilah teknis Inggris yang sudah
lazim tetap dipakai (category management, framework agreement, baseline, due
diligence); istilah hukum pengadaan Indonesia dipakai apa adanya. Angka pakai
konvensi Indonesia — dan `verify.py` di sana punya `FORBIDDEN_EN`, daftar hitam
19 pola berformat Inggris yang menggagalkan build kalau satu kalimat disalin
dari edisi Inggris beserta angkanya. Pola ini layak ditiru untuk brief dwibahasa
berikutnya. `sources/dossier.md` sengaja satu berkas untuk dua edisi (tetap
bahasa Inggris) supaya tidak hanyut sendiri-sendiri.

Terkait [[project-ukpbj-kemlu]], [[project-sigap-bup]] dan [[project-pdp-kemlu]]
— domain pengadaan yang sama, jadi istilah UKPBJ/PPK/e-katalog sudah dikenal.
Pipeline sama dengan [[project-seventy-dollar-budget]].
