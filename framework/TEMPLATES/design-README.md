# design/ — the design source ({{PROJECT}})

> The owner's **visual intent, imported verbatim** (§4.14). One dated folder per import; an import is
> never edited — a changed design is a new import, diffed against the last. This README is the
> living map; the folders beside it are archive. **Read the artboards' HTML/CSS directly. Do not
> render or screenshot them unless the owner asks.** It is an intake, not a gate: nothing here
> blocks a build or a deploy.

## Source
- **Tool:** {{Claude Design (claude.ai/design) | handoff bundle | Figma export | hand-drawn spec}}
- **Project:** `{{project id or name}}` · **owning account:** {{which login}} · **route:** {{handoff
  zip | handoff link | live project via DesignSync}}
- **Current import:** `{{YYYY-MM-DD}}_{{slug}}/` — imported {{date}} by {{machine/agent}}.

## Imports (newest first)
| folder | date | what changed since the previous import | plan impact |
|---|---|---|---|
| `{{YYYY-MM-DD}}_{{slug}}/` | {{date}} | first import | GRANDPLAN §3.1 written; build files `{{NN}}` cite it |

## Screen map — the bundle's `github.md` is the seed; this table is the truth, keep it current
| Artboard | Repo files | Build file | State |
|---|---|---|---|
| `{{Screen}}.dc.html` | `{{src/…}}` | `{{NN_slug.md}}` | {{planned · built · diverged → §3.1}} |
| `{{Screen — Sekarang}}.dc.html` | — | — | reference only (recreates today's page) |

## Measurement (before the first line of CSS — §4.14 rule 5)
- **Floor:** {{4.5:1 for words · 3:1 for marks — or the project's own tests}}. Script: `{{path}}`.
- {{date}} — {{n}} pairs measured on every ground incl. stacked fills; {{m}} failed; corrected with
  the minimum move, hue kept; value + ratio written beside each token and in GRANDPLAN §3.1.
- Principle findings (not just values): {{e.g. "the word on an accent fill is a theme property"}}.

## Deliberately NOT taken
- The prototype runtime (`support.js`, `<x-dc>`, `style-hover=`, invented state) — read, never shipped
  or imitated.
- Invented data in the artboards — a number the app cannot source does not ship.
- {{anything else — reference-only boards, a component the plan dropped, and why}}

## Write-back (only if the live project is the target)
- {{none | DesignSync plan `{{planId}}` on {{date}} — paths written: … — why: the source had drifted
  from the measured build}}
