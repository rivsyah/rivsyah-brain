---
name: project-dpld-kemlu
description: "DPLD-KEMLU (Dashboard Logistik Diplomatik) — DIHAPUS 2026-09-26 atas permintaan Aldo; sumber desain masih ada di Claude Design"
metadata: 
  node_type: memory
  type: project
  originSessionId: 0e325f09-5f7d-42e1-a2b4-60ef83741822
  modified: 2026-09-26T00:00:00.000Z
---

**DIHAPUS 2026-09-26.** Aldo minta hapus proyek ini. Kedua folder dihapus permanen: `C:\Users\rivsy\Herd\dpld` (aplikasi Laravel 13, dpld.test) dan `C:\Users\rivsy\Herd\dpld-kemlu` (prototipe desain, dpld-kemlu.test). Entri launch.json sudah bersih. Jangan mereferensikan path ini lagi.

**Yang masih ada bila proyek dibangun ulang:**
- Project Claude Design "DPLD-KEMLU Design System" (projectId `ac65f596-f985-46d4-8441-89f236777dc1`) — berisi desain lengkap (Canvas.dc.html → app/), design system "Diplomatic Navy & Gold", dan spec bisnis di `uploads/`.
- Spec v3.0: `C:\Users\rivsy\Downloads\Dashboard_Logistik_Diplomatik_Stok_v3.0.md` (fokus stok/kebutuhan/proyeksi, pengadaan dihapus total).
- Sumber produk asli: github.com/galohot/tongdip.

**Pelajaran yang tetap berlaku** (untuk proyek Kemlu lain): Aldo TIDAK mau backend bergaya vms-kemlu (admin panel Filament generik) — backend harus mempertahankan UI desain dari Claude Design. Pola yang berhasil: Laravel murni menyajikan frontend desain sebagai blade (@verbatim) + store React ditulis ulang jadi API-backed (fetch + CSRF + session auth), skema DB mengikuti bentuk store frontend. Kondisi akhir sebelum dihapus: v3.1 lengkap, 17 test hijau, review adversarial bersih. Terkait [[project-vms-kemlu]].
