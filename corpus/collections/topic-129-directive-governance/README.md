# Collection — topic 129 · 03_directive_governance

FinePDFs-grounded topic (carried forward from the coverage audit). **17 chapters** · **5 ontology terms** · **5 underlying tables**.

> **Topic gist** (representative FinePDFs text): DOCUMENT OF THE EUROPEAN BANK FOR RECONSTRUCTION AND DEVELOPMENT ENERGY SECTOR STRATEGY As approved by the Board of Directors at its Meeting on 10 December 2013 TABLE OF CONTENTS Page ABBREVIATIONS ADB Asian Development Bank. AfDB African Development Bank. BAT Best available techniques. BiH Bosnia and Herzegovina. CCGT Combined Cycle Gas Turbines. CCS Carbon Capture and Storage. C... …

## Chapters

- [Chapter 4: Ontological Formalization of ISO/IEC 27001 Governance Structures](chapters/0c922a7dc66d97ba.md)
- [Chapter 4: Governance Directives and Evidence Verification in ISO 27001 Frameworks](chapters/0e6c2650df89df0a.md)
- [Chapter 4: Governance Frameworks and Evidence Verification in ISO/IEC 27001 Compliance](chapters/207e5691f6c3e372.md)
- [Governance Frameworks and Evidence Mapping in ISO 27001 Compliance](chapters/220b1cca0049361d.md)
- [Chapter 4: Ontological Mapping of ISO 27001 Governance and Verification Protocols](chapters/25d1a262132148b6.md)
- [Chapter 4: Governance Directives and Evidence Verification in ISO/IEC 27001 Compliance Frameworks](chapters/5d6dea7c84aae963.md)
- [Chapter 7: Directive Subclassing and Evidence Production in ISO 27001 Compliance Records](chapters/5e42bc8bf91fca36.md)
- [Governance Frameworks: ISO 27001 Annex A and Evidence Verification Protocols](chapters/615163674555c04c.md)
- [Chapter 4: Governance Frameworks and ISO/IEC 27001 Directive Mapping](chapters/704bb0280c6ff613.md)
- [Chapter 4: Governance Frameworks and ISO 27001 Control Mapping](chapters/763d80a99d1b73bc.md)
- [Chapter 4: Governance Directives and ISO 27001 Alignment](chapters/7fc6872900250436.md)
- [Chapter 4: Governance Frameworks and Evidence Verification in ISO/IEC 27001](chapters/8a7baebc333a7049.md)
- [Chapter 4: Ontological Structuring of ISO 27001 Governance and Verification Protocols](chapters/9a8c3320bbd82314.md)
- [Chapter 4: ISO/IEC 27001 Governance Structures and Verification Protocols](chapters/b43c457ecf1d91ab.md)
- [Chapter 4. Directive Instances and Evidence Chains in ISO 27001 Audit Records](chapters/cab8a2f8ab8d3097.md)
- [Chapter 4: Governance Frameworks and Evidence Verification in ISO/IEC 27001](chapters/e4a54c2184b88556.md)
- [Chapter 4: Governance Frameworks and ISO 27001 Ontological Mapping](chapters/fb23ea9930ac4e5c.md)

## Ontology terms grounding this collection

- `iso27001_annexa_subclass` — {X} is a directive information content entity that iso27001 annex a {Y}
- `iso27001_clause_subclass` — {X} is a directive information content entity that iso27001 clause {Y}
- `requirement_has_priority` — {X} is a directive information content entity that has priority {Y}
- `verification_min_one_evidence` — {X} is a process
- `verification_produces_evidence` — {X} is a process that produces evidence {Y}

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_iso27001_annexa_subclass`](tables/t_iso27001_annexa_subclass.sql) — realizes `iso27001_annexa_subclass`
- [`t_iso27001_clause_subclass`](tables/t_iso27001_clause_subclass.sql) — realizes `iso27001_clause_subclass`
- [`t_requirement_has_priority`](tables/t_requirement_has_priority.sql) — realizes `requirement_has_priority`
- [`t_verification_min_one_evidence`](tables/t_verification_min_one_evidence.sql) — realizes `verification_min_one_evidence`
- [`t_verification_produces_evidence`](tables/t_verification_produces_evidence.sql) — realizes `verification_produces_evidence`
