# Collection — topic 146 · 01_foundation

FinePDFs-grounded topic (carried forward from the coverage audit). **6 chapters** · **5 topics** (target + style) · **13 ontology terms** · **13 underlying tables**.

**Topics (many-to-many).** The documents draw on, beyond the anchor topic 146: topic 7, topic 51, topic 138, topic 144.

> **Topic gist** (representative FinePDFs text): MAGAZINE GALLERIES EVENTS CALENDAR NEWSLETTER ABOUT ADVERTISE Art Monthly 393: February 2016 SEARCH DONATE BUY Letters to the Editor Redaction Francis Frascina On Critique Dave Beech Artist and Empire Virginia Whiles Radio Activity Lauren Velvick Buy Now – select: UK (incl P&P): £7.50 >>Read this issue online now at Exact Editions Contents FEATURE Redacted Francis Frascina o... …

## Chapters

- [ch_live_farmland_acquisition_process_1ef863](chapters/ch_live_farmland_acquisition_process_1ef863.md)
- [ch_live_human_rights_impact_report_abce66](chapters/ch_live_human_rights_impact_report_abce66.md)
- [ch_live_ice_with_existential_2c52b9](chapters/ch_live_ice_with_existential_2c52b9.md)
- [ch_live_identifier_subclass_425448](chapters/ch_live_identifier_subclass_425448.md)
- [ch_live_identifier_subclass_bf51af](chapters/ch_live_identifier_subclass_bf51af.md)
- [ch_live_identifier_subclass_c4c355](chapters/ch_live_identifier_subclass_c4c355.md)

## Ontology terms grounding this collection

- `agent_with_role` — {X} is an artifact that has agent role {Y}
- `allocation_with_output_facets` — {X} is a process that has output facet {Y}
- `directive_supersedes_directive` — {X} is a directive information content entity that supersedes directive information content entity
- `existential_two_clauses` — {X} is something that {p} {Y}
- `farmland_acquisition_process` — A FarmlandAcquisitionProcess is a Process that targets an InstitutionalInvestor and acquires an AgriculturalLandParcel.
- `flood_asset_vulnerability_assessment` — FloodAssetVulnerabilityAssessment is an information content entity that assesses FloodAssetCondition and identifies Vuln
- `gdpr_data_subject_right` — {X} is a directive information content entity that grants data subject right {Y}
- `human_rights_impact_report` — A HumanRightsImpactReport is an InformationContentEntity that reportsOn some FindingEntity.
- `ice_with_existential` — {X} is an information content entity that {p} {Y}
- `identifier_subclass` — {X} is a designative information content entity that identifies {Y}
- `identifier_unique` — {X} is a designative information content entity
- `labrun_observed_at_site` — {X} is a process that 0000066 {Y}
- `policy_only_governs_artifacts` — {X} is a directive information content entity

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_agent_with_role`](tables/t_agent_with_role.sql) — realizes `agent_with_role` · _shared with 7 other collection(s)_
- [`t_allocation_with_output_facets`](tables/t_allocation_with_output_facets.sql) — realizes `allocation_with_output_facets` · _shared with 6 other collection(s)_
- [`t_directive_supersedes_directive`](tables/t_directive_supersedes_directive.sql) — realizes `directive_supersedes_directive` · _shared with 6 other collection(s)_
- [`t_existential_two_clauses`](tables/t_existential_two_clauses.sql) — realizes `existential_two_clauses` · _shared with 4 other collection(s)_
- [`t_farmland_acquisition_process`](tables/t_farmland_acquisition_process.sql) — realizes `farmland_acquisition_process` · _shared with 5 other collection(s)_
- [`t_flood_asset_vulnerability_assessment`](tables/t_flood_asset_vulnerability_assessment.sql) — realizes `flood_asset_vulnerability_assessment` · _shared with 8 other collection(s)_
- [`t_gdpr_data_subject_right`](tables/t_gdpr_data_subject_right.sql) — realizes `gdpr_data_subject_right` · _shared with 7 other collection(s)_
- [`t_human_rights_impact_report`](tables/t_human_rights_impact_report.sql) — realizes `human_rights_impact_report` · _shared with 7 other collection(s)_
- [`t_ice_with_existential`](tables/t_ice_with_existential.sql) — realizes `ice_with_existential` · _shared with 3 other collection(s)_
- [`t_identifier_subclass`](tables/t_identifier_subclass.sql) — realizes `identifier_subclass` · _shared with 3 other collection(s)_
- [`t_identifier_unique`](tables/t_identifier_unique.sql) — realizes `identifier_unique` · _shared with 2 other collection(s)_
- [`t_labrun_observed_at_site`](tables/t_labrun_observed_at_site.sql) — realizes `labrun_observed_at_site` · _shared with 8 other collection(s)_
- [`t_policy_only_governs_artifacts`](tables/t_policy_only_governs_artifacts.sql) — realizes `policy_only_governs_artifacts` · _shared with 12 other collection(s)_
