# Vault conventions

This tree is the canonical memory. It is a git checkout, so it survives a dead machine and can be
read by a second machine later. The agent and the owner both read and write it. Keep it boring and
predictable. **This file is the authority on vault conventions**; where a card describes conventions
differently, this file wins and that card gets fixed in place.

Pull before you trust it. Push in the same session you write to it — **once, at the end**
(`bin/brain-push.sh`). Note what you did as you go with `bin/brain-note.sh`, which is free and
touches no git.

## Layout

```
MEMORY.md            master index — ONE line per card (two lines is the hard maximum)
README.md            this file — the conventions authority
HOME.md              human landing page
journal/<machine>.md append-only work log, one writer per file
<scope>/             one folder per scope, e.g. personal/ business/ clients/ shared/
shared/              cross-cutting: feedback/ (rules) reference/ ops/ + loose core cards
_archive/            dead or superseded cards, mirrored by scope — move, never delete
```

## Card rules

- One fact or topic per card. Frontmatter: `name`, `description` (one line), `type`
  (feedback | project | idea | reference | service | user).
- A new card gets its one-line entry in `MEMORY.md`, in the right section, path included, in the
  **same turn** it is written. A card with no index line is a card nobody will find.
- Minimal prose. A card is a reference, not an essay.
- Prefix by role: `feedback_` `project_` `idea_` `reference_` `service_`. The folder matches the
  prefix.
- **Every path written in a card names the machine it lives on.** `C:\claude\env.db` and
  `~/claude/env.db` are different facts, not two spellings of one. An unattributed path is a bug,
  and it is how paths from dead machines keep giving orders.

## Wikilinks

- **The filename is the link target.** `[[wikilinks]]` resolve by filename: snake_case, no `.md`,
  no path. Filenames are therefore globally unique across the vault.
- `name:` in the frontmatter is a **display title only**. Never link to it.
- **Renaming a file is one change:** rename it and replace the old filename everywhere in the tree,
  `MEMORY.md` included, in the same turn. A rename that leaves stale links is a broken rename.

## Index rules (MEMORY.md)

- One to two lines per entry, hard cap. History belongs in the card; the index line carries status
  and essence only. An index that holds essays stops being loadable, which defeats its only job.
- A HARD rule keeps the word **HARD** on its line.
- Killed or complete → move the card to `_archive/<scope>/` and fold its index line into the
  Archive section.
- **Query the index, never read it whole.** Once it passes roughly 40 KB, a `cat` returns a
  truncated preview that looks exactly like a successful read, and the session then acts on the
  first twenty lines while believing it has the whole index.

```
grep -in "<topic>" <vault>/MEMORY.md      # the index line for a topic
grep -ril "<topic>" <vault>/              # which cards mention it
sed -n '1,60p' <vault>/MEMORY.md          # the NOW block and the headings
```

  If a tool result says the output was truncated, the read **failed**. Narrow it and read again.

## Amend in place — the correction protocol

The largest defect class in any vault of this kind: a correction written *about* a rule, in a
third document, instead of *into* it. Sessions read the rule card. Nobody reads the retrospective.
So the dead rule keeps giving orders for weeks.

- **A correction is not recorded until it is in the card AND its `MEMORY.md` line.** A chat answer,
  a session summary or a fresh "audit" card is not a correction.
- **Same turn, three edits:** the card body, the `description:` frontmatter (a session reads that
  before opening the card), and the index line. Land all three or land none.
- **Deleting a mechanism never deletes the standard.** When the tool that enforced a rule dies, the
  rule does not. Rewrite the mechanism, keep the rule, and name what died and when.
- **Open questions go INTO the card** as `⚠ OPEN: <question>`, never only into chat. Chat is not
  storage: the next session never sees it.

## Never

- Scaffold applications, code or datasets anywhere under this tree. The vault is memory only.
- Delete a card that has history — archive it. If the thing itself is gone, leave a short card
  saying so, with the lesson.
- Leave a **live instruction** naming a machine, path or service that no longer exists. Past tense
  is fine and useful. An imperative is a bug: amend it in place.

## Rule-card template

Copy this for any `feedback_*` card, or any card that commands behaviour. Every field is here
because its absence causes a real failure.

```markdown
---
name: <display title — a full sentence is fine>
description: "<HARD if hard.> <the rule in one line — what a session sees before opening the card>"
type: feedback
---

**Rule:** <one imperative, testable sentence. It opens with HARD if it is hard.>

**Applies to:** <the triggers that fire it>

**Does NOT apply to:** <the nearest thing someone will over-apply it to>

**Why:** <YYYY-MM-DD + the owner's own words, quoted>

**How to apply:** <concrete moves, as bullets>

**Mechanism:** <the tool, path or hook that enforces it, and the machine it lives on — or
"none, held by hand">

**Verified on:** <machine + YYYY-MM-DD>

**Re-check when:** <the event that would invalidate this>

**Seams:** <every other rule that fires on the same trigger — one line each on which wins where.
Write the same line into that other card, in the same turn.>
```

Why each field, in one line:

- `Rule:` — "be careful with X" gets reinterpreted every session. A testable imperative does not.
- `Applies to:` / `Does NOT apply to:` — hard rules spread. Naming the nearest over-application is
  what stops a real ban from eating an unrelated case.
- `Why:` with a date and quoted words — a rule with no origin gets argued away by the next session
  that finds it inconvenient.
- `Mechanism:` — the rule that dies quietly is the one whose enforcement died unnoticed. "None,
  held by hand" is an honest and common answer. Write it.
- `Verified on:` / `Re-check when:` — undated claims about installed tools and paths are the second
  largest defect class.
- `Seams:` — when two rules fire on the same trigger, a session obeys whichever it read first. The
  tie-break must be written into BOTH cards or it is not written.
