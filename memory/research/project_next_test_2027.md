---
name: project-next-test-2027
description: "The Next Test (El Niño brief, Downloads\\Research Reports\\Next Test 2027) — standalone, 3 Sep cutoff edition 27pp + deck 24 slides; v3 rebuild to 10 Oct cutoff awaiting Phase 0 approval; live RONI error in circulating edition"
metadata: 
  node_type: memory
  type: project
  originSessionId: 0d34b9a7-25d0-462c-952c-0099b94c93d2
  modified: 2026-10-10
---

## CURRENT STATE — 10 Oct 2026 (read this first; the history below is the August build)

**Delivered and in circulation:** `out\The-Next-Test.pdf` (27 pp, gate 134 checks) and
`out\The-Next-Test-deck.pptx` (24 slides, python-pptx + deck_charts.py, package validates), both
**3 Sep 2026 cutoff**. Aldo posted it on LinkedIn (EN caption, then an ID caption on request).

- **Standalone since 3 Sep.** The predecessor scorecard was removed at Aldo's instruction ("do not
  mention previous research"); Section I rewritten as "The divergence". verify.py has a BACKREF
  check that fails the build on "previous brief / this series / Bought and Sold" etc.
- **Indonesian edition set aside** (see [[feedback-english-only-briefs]]). `*-id.html` and
  `make-id.ps1` are out of sync with content.py and will not build. Do not revive unasked.
- **Calls at 3 Sep:** D3 passed (VF 4.06 > core 2.92, Aug print), D4 failed (BMKG Sep low-rain
  share 75.05% < 77%). Scored in content.CALL_STATUS; the gate requires the prose to say
  "D3 passed" / "D4 failed".
- **By 10 Oct the other two resolved:** D1 passed (CPC historic 75% on 10 Sep), D2 failed (FAO
  rice did not regain its premium; cereals led in Aug +2.2 vs rice +0.5, and Sep +5.1 vs +1.4).
  Record: **2 passed, 2 failed, 2 open (D5, D6)**.

**LIVE ERROR in the circulating edition (found 10 Oct, not yet corrected):** the brief and deck
say CPC's "historic" = Niño-3.4 ≥ +2.5°C, and the RONI box says CPC probabilities "are published
on the raw index". **Wrong.** CPC's 8 Oct 2026 discussion (primary) defines historic as a
**3-month RONI ≥ +2.5°C**. In the brief since 15 Aug. The fix strengthens the hazard case (83% on
the relative index). Whether "very strong" +2.0 is RONI-based too: verify at CPC strengths page.

**v3 rebuild in progress.** Aldo pasted master prompt v3 on 10 Oct ("update this research with this
prompt"), Section 1 unfilled. Phase 0 scope memo written to `Next Test 2027\scope-memo-v3.md`
and shown in chat; **STOPPED for approval** per v3. Recommendations in it: title "The Next Test:
Why Indonesia's 2027 Food Year Is Decided in 2026"; framework Lead-Time Agenda with streams
Watch · Plant · Stock · Flex · Say; EIU = `background` (subscription, unmarked) → replace EIU
charts with USDA PSD / World Bank Pink Sheet / FAO; deliverables PDF + deck; 34 pp; new calls
D7–D10. When he answers, record the picks here.

**New data 3 Sep → 10 Oct (all to verify at primary in Phase 2 except CPC):**
CPC 10 Sep historic 75%, 8 Oct historic 54% SON / **83% OND** / 70% NDJ, synopsis "strong-to-very
strong El Niño likely through JFM 2027 (>83%)", Niño-3.4 Jul +1.4 / Aug +1.8 / **Sep +2.1**,
Niño-1+2 Sep +3.9, next discussion 12 Nov · BPS Sep CPI (1 Oct): headline 3.28%, core 2.84%,
**VF 5.03%**, index 112.31, YTD 2.17%, attributed to weather disruption + input costs, drivers
chilli/chicken/rice/eggs · FAO: Aug cereal 116.3 (+2.2%), rice +0.5%; Sep cereal **122.8**
(+5.1% m/m, +17.2% y/y, highest since Dec 2023), rice +1.4%; FAO world rice 2026/27 −1.9% on
margins and El Niño (Aug value may be revised to 116.8 — check) · BI held 5.75% on 22–23 Sep (4th
hold); oil spiked to US$132 then <US$100 · **APBN 2027 passed 29 Sep**: revenue Rp3,435.1trn,
spending Rp4,106.3trn, deficit 2.4%, rupiah assumed 17,500 vs 17,984 that day, inflation 2.5% ·
**BMKG 22 Sep: onset late in 529 zones = 61.08%**, shorter season over 51.90% of land, IOD +0.376;
8 Oct: very strong, ends late Q1 2027, drought into Oct for Java/Bali/NT; BMKG's own Niño-3.4 +2.83
(end Aug) / +2.63 (JAS) conflicts with CPC — different dataset · Bulog peak 5.4 Mt, absorption 4.09
Mt by 6 Oct; current stock unknown · fertiliser 2026 allocation 9.84 Mt, HET urea Rp1,800/kg
since 22 Oct 2025; 2027 allocation not yet published.

**Traps from this session (also added to v3 §13 where they are build traps):**
- A search summary called the +2.6°C weekly value "Niño-3.4"; the CPC deck shows it was **Niño-3**.
  Never take a region label from a summary.
- DEN reported BMKG low-rainfall shares as "0–10 mm"; BMKG's own "Rendah" band is **0–100 mm**.
- `python -I` (required for untrusted source files) ignores PYTHONIOENCODING, so printing a
  ligature crashes on cp1252. Use `python -I -X utf8`.
- Bash heredocs (`python - <<'PY'`) silently failed every replacement containing `\n` or a
  non-ASCII character; use the Edit tool or a script written to disk.

---

## HISTORY — the August build (15 Aug 2026)

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
