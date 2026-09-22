---
name: gpu-worker-wan2gp-locations
description: "File paths for GPU worker, Wan2GP, and login-autostart state on Aldo's machine"
metadata: 
  node_type: memory
  type: reference
  originSessionId: 2cd18318-57ec-4cc7-914a-c22b15e36296
  modified: 2026-07-28T03:08:39.952Z
---

- GPU Worker: C:\Users\rivsy\Herd\AIgnited\gpu_worker_aldo_setup_v2\gpu_worker\
  - Config: .env in that folder
  - API: gpu-pipeline-api.galohot.workers.dev
  - Start: start_worker.bat
  - Desktop shortcut: C:\Users\rivsy\Desktop\Restart GPU Worker.bat (force-kill + restart)
  - Junction: C:\Users\rivsy\Herd\aii\ -> C:\Users\rivsy\Herd\AIgnited\ (backward compat)
  - NOTE (2026-04-09): GPU Worker scheduled task + polling to VPS stopped; processes killed. Scheduled task "AIgnited GPU Worker" needs admin to delete (still present in Task Scheduler).
- Wan2GP: C:\Users\rivsy\Herd\AIgnited\Wan2GP\
  - Python venv: C:\Users\rivsy\Herd\AIgnited\Wan2GP\venv\
  - Models: ckpts/ folder (~40GB)
  - Run: python wgp.py (Gradio UI on port 7860)
  - Cannot run simultaneously with GPU worker (VRAM conflict)
- OpenClaw: REMOVED on 2026-04-09 (workspace, .openclaw dir, watchdog task, gateway, temp logs all deleted)
- Temp output dir: C:\tmp\wgp\

## Login autostart (Startup folder + Task Scheduler), state as of 2026-07-28
- Startup folder `%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\` now holds only `Send to OneNote.lnk`.
  - `OpenClaw Gateway.cmd` deleted 2026-07-28 (leftover from the April removal, pointed at a path that no longer existed).
  - `idx-tunnel.vbs` deleted 2026-07-28 — Aldo doesn't need the tunnel anymore. Was throwing a WSH 80070002 popup at every login because it was a *copy* of start-tunnel-hidden.vbs rather than a shortcut, so it looked for start-tunnel.bat next to itself in Startup.
- IDX tunnel still on disk at `C:\Users\rivsy\idx-tunnel\` (socks5.py :1080 + SSH reverse tunnel to tunnel@148.230.99.175, key `~\.ssh\idx_tunnel`). Run `start-tunnel-hidden.vbs` manually if ever needed again.
- Task Scheduler task "AIgnited GPU Worker" is STILL ENABLED (logon trigger, 30s delay → start_worker.bat). Its VPS endpoints 404 now, so it just spams errors. Root-folder task: `Disable-ScheduledTask` fails with Access denied unless elevated — needs `schtasks /Change /TN "AIgnited GPU Worker" /DISABLE` from an admin terminal.
