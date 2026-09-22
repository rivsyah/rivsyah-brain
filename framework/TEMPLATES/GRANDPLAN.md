# {{PROJECT}} — GRANDPLAN (v1)

> Ground-truth blueprint: the whole **why** + deep design. The `implementation/` build files are
> birthed from this and reference it by section (§N.M). When they conflict and `DECISIONS.md` is
> silent, it's drift to reconcile.
> **Reporting note:** when this is written or meaningfully updated, deliver it to the owner the way
> the binding says ({{e.g. print INLINE in chat}}) — the plan gate needs eyes on the actual plan.

## §0 Owner Decisions (the load-bearing calls; mirrored & locked in implementation/DECISIONS.md)
- {{decision}} — {{why}}

## §1 Problem & primary user
{{who this is really for; what they fear/value; what exists today and why it isn't enough}}

## §2 Goals / non-goals
{{goals — observable, not aspirational}}
{{explicit non-goals — the scope fence}}

## §3 Architecture (components, data flow, trust boundaries)
{{stack per binding + interview; one-screen flow; where data lives; what talks to what}}

### §3.1 Design source (delete this block if the project has none — §4.14)
- **Source:** {{Claude Design project `id` / handoff bundle `name`}} · **owning account:** {{login}}
  · **import:** `ai_context/design/{{YYYY-MM-DD}}_{{slug}}/` (map: `design/README.md`).
- **Tokens — as taken → as measured:** {{table: role · artboard value · shipped value · ratio ·
  why it moved}}. Floor: {{4.5:1 words / 3:1 marks}}.
- **Surfaces → artboards:** {{S1 `/` ← `Screen.dc.html` · S2 … }} (build files cite these as
  `Design ref`).
- **Deliberately not taken:** {{invented data, the prototype runtime, reference-only boards, a
  component dropped and why}}.
- **Divergence log:** {{none yet — every on-purpose departure from an artboard lands here, with the
  `Dn` if it was a decision}}.

## §4…§N Deep design (one concern per section; the build files cite these)

## Tier matrix
{{feature tiers T1/T2/T3, if applicable — delete if not}}

## Open Questions (resolve → promote to a DECISIONS.md entry)
- Q1 — {{unknown}} · blocks {{which milestone/file}} · **Rec:** {{inline recommendation}}
