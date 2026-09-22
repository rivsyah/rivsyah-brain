---
name: project-next-test-2027
description: "The Next Test (27pp, Ignited Research) — third El Niño brief, in Downloads\\Research Reports\\Next Test 2027; opens by scoring its own predecessor's calls, two of which failed"
metadata: 
  node_type: memory
  type: project
  originSessionId: 0d34b9a7-25d0-462c-952c-0099b94c93d2
  modified: 2026-08-16T12:45:38.663Z
---

**The Next Test: Indonesia and the 2027 Super El Niño**, 27 pp A4, built
15 August 2026 at `Downloads\Research Reports\Next Test 2027`. Ignited Research,
PDF only. Framework: **the Lead-Time Agenda** (Watch / Buy / Flex / Say).
Third in the El Niño line after [[project-el-nino-brief]] and
[[project-two-clocks-one-drought]].

**Aldo proposed the title "Super El Niño as the Next Test for Indonesia in 2027"; I proposed the
shorter cover form and he took it.** Worth remembering: he responds well to a title
recommendation with a stated reason, and he had already accepted a title change once
in the previous brief.

## The thing that makes this brief different: it scores its own predecessor

Three of *Bought and Sold*'s six dated calls resolved before the cutoff.
**C1 passed, C2 and C3 failed.** Section I reports that before any new analysis,
and the pattern is the thesis:

- **C1 (climate) PASSED** — CPC went 81% → **>90%** very strong, and added a
  **69% chance of a HISTORIC event** (+2.5°C, exceeding anything since 1950).
  Niño-3.4 +1.2→+1.4, Niño-1+2 +2.7→+2.9.
- **C2 (FAO rice above cereals) FAILED at 1 of 2** — July: cereals +3.4%,
  all-rice flat. The ordering inverted. But my own call required **two
  consecutive months**, so I scored it "failing, not yet falsified" rather than
  taking the more dramatic clean-failure reading. Honour the rule you wrote.
- **C3 (volatile food above core) FAILED both limbs** — VF 2.52% vs core 2.76%,
  and rice not named among July drivers.

**The pass measured the hazard; both failures measured symptoms.** The diagnosis:
the previous brief picked the rice price as its principal observable — the single
most policy-suppressed series in Indonesia, sitting behind a record reserve, an
import halt, a stabilisation programme and a fuel subsidy. Lesson that
generalises: **when choosing an indicator, ask which number the government is
working hardest to hold still, and don't pick that one.**

## New evidence in this edition

- **RAPBN 2027** (Aldo pasted the Kemenkeu release mid-turn, 14 Aug): food
  sovereignty is PKPN cluster #1, Rp195.3trn food security, Rp549.9trn social
  protection, 2.40% deficit. **Tabled one day after CPC published the 69%
  figure** — the fiscal frame for the test year was fixed before the hazard
  estimate for that year moved.
- **EIU fertiliser piece** — the 2027 mechanism. Urea +60% since the Iran war,
  a third of global fertiliser trade via Hormuz, and **Thai rice farmers already
  halving fertiliser application**. A 2027 supply decision taken quietly in 2026.
- **Three price levels**: IHP 5.62% (Q2) → IHPB 5.66% (Jul) → CPI 2.88% (Jul).
  ~2.78 pp of wholesale pressure has not reached households because fuel subsidy
  is acting as a shock absorber.
- **MBG natural experiment completed** — June pause: chicken/eggs fell. July
  resume: chicken +8.2%, DEN attributing it to "schools and the MBG programme
  returning". Both directions, consecutive months, same official attribution.
- **BMKG switched metric** — from a contested intensity probability to a
  territorial rainfall share: **71.55% of Indonesia at 0–10mm in August,
  77.46% in September**. Sidesteps the three-inconsistent-numbers problem from
  the previous brief without resolving it.
- Q2 GDP 5.29%; oil at US$80 "far above the APBN assumption" (DEN's words);
  BoK/BoJ/ECB all hiking — the global cycle turned.

## verify.py grew to 132 checks

Best new one, worth porting to every future brief: **a regex that requires the
brief to state in prose that two calls failed.** An edit that softened the
scorecard into "mixed results" fails the build. Also added: scorecard tallies
recompute, per-crop balance arithmetic against EIU's own table, RAPBN components
sum to totals.

**It caught five figures typed straight into prose that existed nowhere in
`content.py`** (gold's 0.8pp core contribution, global gold 21.9%, and the 1982/
1997/2015 benchmark years). All were correct — but a figure that lives only in
prose is one that survives a later edit to its source and goes stale silently.
Fixed by adding them to content.py, **not** by allow-listing.

## Bilingual, from ONE folder — a change from the previous convention

Aldo asked for an Indonesian version ("continue using English terms if they are more
familiar"). Built as **`BRIEF_LANG=id`** in the same project rather than a separate
folder — [[project-bpp-procurement]] used two folders, but a language switch means
**both editions read the same numeric data, so an EN and an ID figure cannot diverge**.
Outputs: `out/The-Next-Test.pdf` (27pp, 132 checks) and `out/Ujian-Berikutnya.pdf`
(30pp, 136 checks). `make.ps1` and `make-id.ps1`.

**Indonesian number format is non-negotiable and easy to miss.** DEN and BPS write
`2,88%` and `Rp3.426,0 triliun`. `content.num()` swaps the separators via a placeholder;
every chart label goes through it. `verify.py` normalises ID numbers back to machine
form before matching against content.py, and uses a **mirrored NUM regex** — `3.426,0`
there is `3,426.0` here.

**Terms deliberately kept in English**, because DEN and BI write them that way inside
Indonesian prose: *volatile food*, *shock absorber*, *base effect*, *pass-through*,
*lead time*, *call*, BI-Rate, Deposit/Lending Facility. Streams translated:
PANTAU / AMANKAN / LENTURKAN / NYATAKAN.

**Four things that only surfaced by proofing the rendered ID PDF — the gate passed
every time:**
1. **Chrome was still pointed at `build.html`.** The ID run produced an Indonesian
   cover (stamp.py reads META) over an entirely English body. verify.py read
   `build-id.html` and passed at 136 checks while the PDF was wrong. **A green gate
   does not prove you rendered the file you checked.**
2. **Running header is hardcoded in `styles.css` and CSS cannot read content.py.**
   An inline `@page` override is silently ignored — Chrome will not merge margin
   boxes. Fix: build.py generates `styles-id.css` from META.
3. **Figure/Table/Box prefixes are CSS `content:` counters** — same generated
   stylesheet handles "Gambar"/"Tabel"/"Boks".
4. **The reference-list exclusion keyed off the English heading**, so "Daftar Pustaka"
   left the whole bibliography inside the number sweep.

Also caught: one English decimal (`0.2`) surviving into Indonesian prose, and the
scorecard status words (BENAR/MELESET/TERBUKA) breaking both the tally check and the
chart's colour map, which had silently coloured every row as a failure.

## Cover: photograph, not procedural

Aldo supplied `assets/pexels-photo-532358.avif` (figure with umbrella standing in
shallow water among a drowned treeline at sunset) and asked for it on the cover.
`cover_art.py` reverted from the procedural SST field back to the **China-brief
photo-grading pipeline**: `crop_to(top_bias=0.04)` → `tint(NAVY, 0.26)` →
`vgrade` into navy over the bottom third of the band. Source is 3:2 and the band
is 1.57:1, so almost no height is lost. **PIL opens .avif directly** — no plugin
needed. All cover type still reads from `content.META`, so it follows the language
switch and passes the no-hardcoded-masthead check unchanged.

The tint is the judgement call: 0.26 pulls the purple/amber sunset toward the
palette so the cover does not read as a separate object from the charts. The amber
survives and carries the bronze accent. Lower it toward 0.18 if he wants the
photograph louder.

## Reusable

Both CPC and FAO were **fetched from primary**, not taken from search summaries —
the habit that came from the BMKG error two briefs ago. The CPC summary happened
to be accurate, but the 69% figure, the most important number in the brief, was
only visible in the primary document.
