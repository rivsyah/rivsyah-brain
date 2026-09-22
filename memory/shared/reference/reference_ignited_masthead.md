---
name: reference-ignited-masthead
description: "House masthead for all Ignited Research briefs — \"Ignited Research · Independent Analysis\"; the name \"Independent Research\" is retired"
metadata: 
  node_type: memory
  type: reference
  originSessionId: d0294719-a594-447e-9fd8-bb38c92ca61f
  modified: 2026-08-02T16:50:44.773Z
---

**Masthead for every brief in the Ignited Research series:**

- **Publisher:** Ignited Research
- **Tagline / pairing:** Independent Analysis  → rendered as **"Ignited Research · Independent Analysis"**
- **Byline:** Rivaldo Harviansyah, Research Lead, Ignited Research
- **Audience:** senior Indonesian government decision-makers and business leaders

**"Independent Research" is a retired name and must not appear as a publisher anywhere** — not on
covers, running headers, PDF metadata, decks, or infographics. Prose phrasing such as "this is
independent analysis by ..." is fine; the retired *brand* string is not.

Where it must appear in a build: cover sponsor line, `stamp.py` SPONSOR (running header),
PDF metadata author, deck title + closing slides, infographic header + footer.

`verify.py` in [[project-seventy-dollar-budget]] enforces this. Two gotchas that made the first
attempt fail:
1. **Squash case and whitespace when checking.** The cover masthead is CSS small-caps and
   letter-spaced, so extraction returns e.g. "I G N I T E D  R E S E A R C H".
2. **The running header is stamped after the verify gate runs**, so at gate time the only instance
   in the PDF is the cover line. Do not assume the header is checkable pre-stamp.

**Two more gaps found when the same checks were added to [[project-two-clocks-one-drought]]
(2 Aug 2026), both of which had been live and invisible:**
3. **The cover generators each carried their own copy of the masthead.** `cover_art.py` (bakes type
   into the JPEG) and `stamp.py` (draws vector type on the PDF) both hardcoded it, so they could
   drift apart silently. Fix: put `kicker`, `imprint_line`, `title_lines`, `strapline` and
   `cover_deck` in `content.META` and have both read from it — then assert in `verify.py` that
   neither generator contains a publisher string literal. This is the same duplication class that
   shipped a stale figure to the deck on the El Niño v1 build.
4. **The byline appeared nowhere in the document body** — only on the cover, which is drawn
   post-render and so is invisible to a gate that reads `build.html`. The disclaimer said "its
   author(s)" without ever naming them. Add an explicit **Author.** line to the scope note, and
   check that `META["author"]` actually appears in the built HTML.
