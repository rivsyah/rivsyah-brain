---
name: project-lestari-advisors
description: "Lestari Advisors job application pack (Junior Business Analyst, Sustainability) + 'The Delivery Gap' research paper, in Downloads\\Research Reports\\Lestari Advisors"
metadata: 
  node_type: memory
  type: project
  originSessionId: ebb6cdea-3cfa-4ee9-b0d0-463e05cfe82d
  modified: 2026-08-01T04:55:54.200Z
---

Application pack for **Junior Business Analyst (Sustainability)** at **Lestari Advisors**
(PT Mitra Lingkungan Abadi), built 27 July 2026 at
`Downloads\Research Reports\Lestari Advisors\Indonesia-Sustainability-Paper`.
(Aldo reorganised on 27 July: every brief now lives under `Downloads\Research Reports\`,
including the Indonesia, China, Koperasi and Price of Proof projects.)
Deadline **2 August 2026**; submit one consolidated PDF to contact@lestariadvisors.com,
subject "Application for Junior Business Analyst (Sustainability) Position".
Aldo framed this as a **side job** alongside his Kemlu procurement role.

**Deliverable:** 26pp bookmarked A4 PDF = CV (2) + statement letter (1) + *The Delivery Gap*
research paper (23). Unlike [[project-indonesia-outlook-brief]] and
[[project-china-outlook-brief]], the byline is **Rivaldo Harviansyah personally**, not
Ignited Research — the paper is a work sample, so it has to be his.

**The paper's thesis, chosen over three alternatives:** Indonesia's headline sustainability
score moved 47→49 in a decade while decarbonisation *fell* 46→40. RUPTL 2025–34 promises
52.9 GW of renewables+storage; EIU forecasts ~40% delivery. The binding constraint is
**contract structure**, diagnosed through a named framework, **the Four Gates** (tariff,
counterparty, risk, permit): Indonesia reformed gates 3–4 in 2024–25 while leaving gates 1–2
— the PR 112 ceiling mechanism and PLN's dual role as monopoly offtaker *and* coal incumbent —
untouched. The angle was picked to exploit Aldo's procurement/tender expertise, which no other
applicant will have.

**The master CV lives at `Downloads\Riv's Journey\Berkas\Rivaldo Harviansyah Resume.pdf`**, not
in any application folder; `merge.py` now reads it from there so every pack picks up the current
version. Two things about it:
1. **It still has no machine-readable text layer** — same subsetted-glyph/broken-ToUnicode
   problem as the EIU exports. It renders fine but an ATS parses it as empty. Any future CV
   work should rebuild it from source, not patch the PDF. Flagged repeatedly, still open.
2. As of the 27 July version, English is stated as **Duolingo 95/160 (CEFR B1)**, replacing the
   earlier EF SET 61/100 (CEFR C1). Both statement letters had claimed C1 and were corrected —
   **check any letter's English claim against the current CV before sending.** The AIgnited
   "Present 2026" date has been fixed to "Present".

**Also flagged:** as an ASN civil servant, a consultancy contract may run into Indonesian
dual-employment rules — his call to verify, not something to paper over in the letter.

**New build traps** (the rest of the pipeline is as recorded in
[[project-china-outlook-brief]]): PyMuPDF's base-14 `helv` is **Latin-1**, so a curly
apostrophe or en dash in a stamped folio silently becomes a middle dot — stamp ASCII only.
And **Acrobat holds a write lock** on an open output PDF, which surfaces as a bare
`Permission denied` traceback from `doc.save()`.
