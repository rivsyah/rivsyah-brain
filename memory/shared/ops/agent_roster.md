---
name: Agent roster
description: Which agent runs on which machine, and the rule that keeps several machines one brain.
type: reference
---

# The roster

| | |
|---|---|
| Agent | Bara |
| Machine | Windows |
| Brain checkout | `~/brain/` → `rivsyah/rivsyah-brain` |
| Vault | `~/brain/memory/` |
| Credentials | `~/brain/env.db` — placed by hand, never synced |
| Projects | `~/dev` |

## The rule, for when there is more than one machine

Several agents are **the same brain on different hardware**. Not a hierarchy, and not two memories.
Everything either one learns goes into the one vault and syncs. Only bare-metal facts and the
agent's name are allowed to differ: paths, shell, package manager, scheduler. **Everything else is
a bug if it differs.**

The protocol is three lines:

- **Pull at session start** (`bin/brain-pull.sh`) before trusting anything the vault says.
- **Note as you go** (`bin/brain-note.sh "what you did"`) — free, local, no git, no network.
- **Push once, at the end** (`bin/brain-push.sh`). A card that exists on one machine only is a card
  the other machine will contradict, confidently, in a week.

No agent may keep a private note store, a second index, or a rule that lives only in its own head.

## Adding a second machine

1. Clone the brain repo on the new machine.
2. Copy `agent.conf`, change `AGENT_NAME`, `MACHINE_ID`, `MACHINE_OS` and the paths.
3. Run `bin/brain-build.sh <new-machine-id>` — it writes that machine's skeleton, rulebook,
   safety net, hooks and settings.
4. Place `env.db` by hand. It is never in the repo.
5. Add a row to the table above, and say in each machine's skeleton which one is which.

**Reading another machine's cards:** a card that names a path which does not exist here is not
wrong. It is true about the other machine. Do not "fix" it. Hold the standard by hand, and add a
line beside it only when the difference actually bites.
