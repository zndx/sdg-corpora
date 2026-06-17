# Collection — topic 89 · 02_observation_measurement

FinePDFs-grounded topic (carried forward from the coverage audit). **8 chapters** · **5 ontology terms** · **5 underlying tables**.

> **Topic gist** (representative FinePDFs text): DATA REQUIREMENTS FOR METROPOLITAN TRANSPORTATION PLANNING NAS-NAE OCT 26 1972 LIBRARY HIGWAY RESEARCH BOARD RESEARCH COUNCIL ACADEMY OF SCIENCES—NATIONAL ACADEMY OF ENGINEERING HIGHWAY RESEARCH BOARD 1971 Officers CHARLES E. SHUMATE, Chairman ALAN M. VOORHEES, First Vice Chairman WILLIAM L. GARRISON, Second Vice Chairman W. N. CAREY, JR., Executive Director Executive Committee F. C. TURNER, ... …

## Chapters

- [Chapter 4: Ontological Frameworks for Governance and Evidence Assurance](chapters/4ce31db5cf8c7288.md)
- [Chapter 4: Governance Directives and Evidentiary Verification in Uncertain Environments](chapters/5537c81fecda9e96.md)
- [Chapter 4: Quantitative Governance and Conflict Resolution in Compliance Frameworks](chapters/5d39f6337520079b.md)
- [Chapter 4: Governance Frameworks and Evidentiary Conflict Resolution](chapters/7f9101fafd473056.md)
- [Chapter 7: Structural Governance of Uncertainty and Evidence in Compliance Frameworks](chapters/b6a601414acf3106.md)
- [Chapter 4: Ontological Structures for Governance and Compliance Verification](chapters/b9506836e9ca3fea.md)
- [Chapter 4: Axiomatic Governance of Directive Conflicts and Evidence Verification](chapters/baee8f392a9e68d9.md)
- [Chapter 7: Ontological Structures for Governance and Evidence Aggregation](chapters/fe7baad25fa8939c.md)

## Ontology terms grounding this collection

- `control_subclass` — {X} is a directive information content entity that mitigates {Y}
- `control_with_evidence_requirement` — {X} is a directive information content entity that requires evidence {Y}
- `dempster_conflict_mass` — {X} is a descriptive information content entity that has conflict mass {Y}
- `policy_supersedes` — {X} is a directive information content entity that supersedes {Y}
- `verification_produces_evidence` — {X} is a process that produces evidence {Y}

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_control_subclass`](tables/t_control_subclass.sql) — realizes `control_subclass`
- [`t_control_with_evidence_requirement`](tables/t_control_with_evidence_requirement.sql) — realizes `control_with_evidence_requirement`
- [`t_dempster_conflict_mass`](tables/t_dempster_conflict_mass.sql) — realizes `dempster_conflict_mass`
- [`t_policy_supersedes`](tables/t_policy_supersedes.sql) — realizes `policy_supersedes`
- [`t_verification_produces_evidence`](tables/t_verification_produces_evidence.sql) — realizes `verification_produces_evidence`
