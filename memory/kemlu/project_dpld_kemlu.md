---
name: project-dpld-kemlu
description: "Dashboard Logistik Diplomatik DPLD-KEMLU (TongDip Monitor) di Herd\\dpld-kemlu, diimpor dari Claude Design"
metadata: 
  node_type: memory
  type: project
  originSessionId: 0e325f09-5f7d-42e1-a2b4-60ef83741822
  modified: 2026-08-01T18:04:25.480Z
---

Dashboard Pengiriman Logistik Diplomatik Kemlu (kode sistem DPLD-KEMLU, nama app "TongDip Monitor"). Prototipe frontend React (Babel standalone + CDN) di `C:\Users\rivsy\Herd\dpld-kemlu` → http://dpld-kemlu.test. Diimpor 2026-07-12 dari project Claude Design "DPLD-KEMLU Design System" (projectId ac65f596-f985-46d4-8441-89f236777dc1) — spec bisnis lengkap v2.0 ada di `uploads/` project design itu. Revisi user: menu Pengadaan dihapus; role Perwakilan dapat update stok logistik real-time. Design system: "Diplomatic Navy & Gold". Sumber produk asli: github.com/galohot/tongdip. Terkait [[project-vms-kemlu]].

**Penting (2026-07-12):** Backend Laravel 13 + Filament 5 sempat dibangun di `Herd\dpld` lalu di-ROLLBACK atas permintaan user — user TIDAK mau backend bergaya vms-kemlu (admin panel Filament generik). Backend harus mempertahankan UI/desain TongDip Monitor dari Claude Design.

**Backend final (2026-07-12, di-upgrade ke spec v3.0 pada 2026-07-19):** Laravel 13 murni (tanpa Filament) di `C:\Users\rivsy\Herd\dpld` → http://dpld.test. Frontend desain di-serve sebagai `resources/views/app.blade.php`, store API-backed (fetch + CSRF + session auth), controller tunggal `ApiController`, polling /api/poll 5 detik.

**Spec v3.0** (sumber: `C:\Users\rivsy\Downloads\Dashboard_Logistik_Diplomatik_Stok_v3.0.md`): pengadaan DIHAPUS TOTAL (role STAF_PENGADAAN → PERENCANA_LOGISTIK; kantong: received→processing→ready_for_pickup→documents_complete→in_transit→delivered→completed, carrier+AWB di kolom JSON tracking); fokus baru modul Stok & Kebutuhan (tabel jenis_items, stok_items dengan level min/maks + proyeksi derived di model `StokItem` (moving average 6 bln), mutasi_stoks, kebutuhans lifecycle §6.4); loop tutup stok: delivered → mutasi MASUK idempoten → kebutuhan TERPENUHI; dashboard v3 (4 KPI, peta Global Monitoring SVG dgn deep-link filter negara, Status Pipeline/Distribution toggle Kurir⇄Kantong, activity feed dari audit); kurir + gross_weight & jenis_paket enum; SLA end-to-end 18 hari. Login: admin@/operator@/perencana@/verifikator@/tracking@/pimpinan@/auditor@/perwakilan.tokyo@kemlu.go.id, password `password`. Test: tests/Feature/DpldApiTest.php (9 test).

**Pipeline build frontend:** prototipe `Herd\dpld-kemlu\app\index.html` tetap v2 (referensi desain, JANGAN diedit untuk v3); blade v3 dihasilkan `Herd\dpld\frontend-build\build-blade.cjs` (jalankan `node build-blade.cjs`, cek sintaks `node check-blade.cjs` — ekstensi .cjs karena package.json "type":"module") yang mengganti blok store/login/dashboard/pouch/stok/courier/master (file *-block.html di folder yang sama) + patch teks v3.

**v3.1 (2026-08-02, via ultracode workflow 8 agent):** ekspor laporan nyata GET /api/export/{kurir|kantong|stok} (CSV BOM delimiter ";" & XLS HTML ber-meta-charset, filter region/year, anti formula-injection, kolom sesuai spec §10 termasuk "Kebutuhan Terbuka" & "Link Dokumen" placeholder); CRUD master Penyedia & Jenis Item (guard master.manage, hapus-terpakai ditolak 422); Master Data 3 tab; filter Audit Log (action/entity/cari); UserModal binding satker utk PERWAKILAN + set password; CourierForm link kebutuhan (fulfillment kurir saat arrived/completed); Generate PDF = window.print (@media print di public/app.css); KPI dashboard klik + mini-chart Tren Konsumsi 6 bln; topbar search global (#id→kantong, teks→kurir); laju_konsumsi dimemoisasi + pra-hitung grouped (fix N+1); validasi date_format tracking. 17 test / 105 assertion hijau; review adversarial 3 lensa (11 temuan — semua diperbaiki); verifikasi E2E HTTP lolos.
