---
name: feedback-english-only-briefs
description: Aldo does not want Indonesian editions of the research briefs any more — English only
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 442198e7-41cd-48b8-9da8-ca7988158a76
  modified: 2026-09-03T09:07:43.316Z
---

Aldo instructed on 3 September 2026: **"do not bring ID version indonesia version again."**
Research briefs are **English only** from now on. Do not build, deliver, or offer a Bahasa
Indonesia edition unless he explicitly asks for one.

**Why:** he had been running bilingual editions (see [[project-koperasi-merah-putih]] and
[[project-next-test-2027]]), and decided the Indonesian output was not worth carrying.
He did not ask for the Indonesian sources to be deleted — only for them to stop arriving.

**How to apply:** keep any existing `*_id.html` sources and the language machinery in
`content.py` / `charts.py` in place, but make the default build target produce English
only. In `Too-Big-to-Fail`, `make.ps1 all` now builds the English PDF plus the deck;
`make.ps1 id` still exists as an explicit opt-in and is never reached by default. Do not
re-add an Indonesian file to a delivery message or to `out/`.

Note this is about the *edition*, not about the language of conversation — he still writes
and is answered in Indonesian when he opens in Indonesian.
