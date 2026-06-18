# Collection — topic 199 · 07_long_tail

FinePDFs-grounded topic (carried forward from the coverage audit). **11 chapters** · **21 topics** (target + style) · **4 ontology terms** · **4 underlying tables**.

**Topics (many-to-many).** The documents draw on, beyond the anchor topic 199: topic 1, topic 7, topic 23, topic 27, topic 40, topic 44, topic 46, topic 93, topic 101, topic 102, topic 111, topic 129, topic 138, topic 145, topic 153, topic 155, topic 166, topic 170, topic 178, topic 188.

> **Topic gist** (representative FinePDFs text): Topic 2.4 Pharmaceuticals and personal care products: A source of endocrine disruption in the environment?* Flemming Ingerslev ‡ , Elvira Vaclavik, and Bent Halling-Sørensen The Royal Danish School of Pharmacy, Universitetsparken 2, Copenhagen 2100, Denmark Abstract: A wide variety of chemicals are used in pharmaceuticals. Most of these are already under thorough control for endocrine activity... …

## Chapters

- [Regulatory Directive Modeling: Publication Dates, Specifications, and Event Temporal Anchors](chapters/018a51a58d0f2dd6.md)
- [Chapter 4: Governance of Academic Artifacts and Temporal Directives](chapters/053abff5e18682c5.md)
- [Chapter 4: Governance of Temporal Artifacts and Institutional Directives](chapters/08699e12b4336d29.md)
- [Chapter 4: Temporal Anchoring and Directive Compliance in Artifact Governance](chapters/65243d2525c6821c.md)
- [Commission Directive Scheduling and Event Timing](chapters/73cad78c87342581.md)
- [Chapter 7: Temporal Governance and Compliance Artifacts](chapters/845cfa5f82810b42.md)
- [Chapter 4: Temporal Governance and Artifact Compliance Protocols](chapters/9ddba983605f1b86.md)
- [Chapter 4: Governance of Artifacts and Directives in Compliance Frameworks](chapters/b2ba7aa53fe4d237.md)
- [Chapter 4: Temporal Anchoring and Directive Compliance in Governance Artifacts](chapters/c24982d1150f638a.md)
- [Chapter 4: Temporal Governance and Directive Compliance in Artifact Lifecycle Management](chapters/c2612d5033e29f40.md)
- [Chapter 4: Governance of Temporal Artifacts and Directive Compliance](chapters/f98be3e920a08da9.md)

## Ontology terms grounding this collection

- `requirement_equiv_specifies_target` — Class: {X:Class} EquivalentTo: cco:DirectiveICE and (sdg:specifies some {Y:Class}) and (sdg:appliesTo some {Z:Class})
- `schemaorg_creativework_date` — {X} is an artifact that has date published {Y}
- `schemaorg_event_endtime` — {X} is an artifact that has event end time {Y}
- `schemaorg_event_starttime` — {X} is an artifact that has event start time {Y}

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_requirement_equiv_specifies_target`](tables/t_requirement_equiv_specifies_target.sql) — realizes `requirement_equiv_specifies_target` · _shared with 27 other collection(s)_
- [`t_schemaorg_creativework_date`](tables/t_schemaorg_creativework_date.sql) — realizes `schemaorg_creativework_date`
- [`t_schemaorg_event_endtime`](tables/t_schemaorg_event_endtime.sql) — realizes `schemaorg_event_endtime`
- [`t_schemaorg_event_starttime`](tables/t_schemaorg_event_starttime.sql) — realizes `schemaorg_event_starttime` · _shared with 2 other collection(s)_
