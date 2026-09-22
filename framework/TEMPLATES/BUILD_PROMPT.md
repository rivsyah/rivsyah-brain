# 01_BUILD_PROMPT — {{COMPONENT}} (separate repo: `{{ORG}}/{{component-repo}}`)

> **Contract handoff, not a plan** (§6.10). This file lives in the PARENT project at
> `ai_context/{{component}}/01_BUILD_PROMPT.md`; the component repo scaffolds its own framework tree
> *from* it. When this contract changes, both repos change in the same pass — it is the §4.1 sync
> rule across a repo boundary.

## What it is — the one job
{{2–3 sentences: what this component does and the single responsibility it owns. If it has two
jobs, it is two components.}}

## Shared schema (THE cross-repo test boundary — §4.11)
- **Package/name:** `{{exact schema package or file both repos import}}`
- **Distribution:** {{published (registry + version) | vendored (copy mechanism + who owns master)}}
- Both repos assert against **this schema**, never hand-written fixtures. A contract change bumps
  {{version/copy}} in the same change on both sides.

## API surface it must expose
| Surface | Shape | Notes |
|---|---|---|
| {{e.g. `POST /v1/…`}} | {{request → response, by schema type name}} | {{auth, idempotency, limits}} |

## Non-negotiables inherited from the parent (quote the ledger — do not re-litigate)
- {{Dn}} — {{the parent decision this component must honor, verbatim intent}}
- {{Dn}} — …

## What it must NEVER assume about its caller
- {{e.g. that requests arrive authenticated / ordered / retried / from one region}}
- {{e.g. that the caller and component deploy together}}

## Operational bounds
{{deploy target per binding · secrets it may read and from where · budgets (latency/size/cost) ·
what it logs and what it must never log}}

## Done when
- {{observable acceptance: the parent's integration checks pass against the shared schema; deployed
  to {{target}}; health surface green from outside}}
