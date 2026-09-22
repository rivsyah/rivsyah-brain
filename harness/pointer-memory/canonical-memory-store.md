---
name: canonical-memory-store
description: The ONE canonical memory store is {{VAULT}} — this folder is only a pointer to it.
metadata:
  type: reference
---

All durable memory lives in **`{{VAULT}}`**, a git checkout of the private `{{BRAIN_REPO}}` repo.
This folder is Claude Code's own per-directory memory, and it holds nothing but this pointer.

- Read `{{VAULT_INDEX}}` at session start. Query it with `grep`; it grows past what one tool result
  can return, and a truncated read looks exactly like a successful one.
- Write cards in `{{VAULT}}`, never here. A card is a file plus one line in `MEMORY.md`, same turn.
- Note what you did with `{{BRAIN}}bin/brain-note.sh "..."`. Push once, at the end, with `{{SYNC}}`.
