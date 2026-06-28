# Collection — topic 120 · 07_long_tail

FinePDFs-grounded topic (carried forward from the coverage audit). **9 chapters** · **8 topics** (target + style) · **20 ontology terms** · **20 underlying tables**.

**Topics (many-to-many).** The documents draw on, beyond the anchor topic 120: topic 5, topic 19, topic 39, topic 94, topic 142, topic 191, topic 195.

> **Topic gist** (representative FinePDFs text): Eastern Canada Seabirds at Sea (ECSAS) standardized protocol for pelagic seabird surveys from moving and stationary platforms Carina Gjerdrum, David A. Fifield, and Sabina I. Wilhelm Atlantic Region Canadian Wildlife Service Technical Report Series Number 515 CANADIAN WILDLIFE SERVICE TECHNICAL REPORT SERIES This series of reports, introduced in 1986, contains technical and scientific informa... …

## Chapters

- [ch_live_column_renamed_from_201679](chapters/ch_live_column_renamed_from_201679.md)
- [ch_live_ebpf_event_basic_62e84a](chapters/ch_live_ebpf_event_basic_62e84a.md)
- [ch_live_lineage_governed_by_directive_174f27](chapters/ch_live_lineage_governed_by_directive_174f27.md)
- [ch_live_lineage_observed_by_event_172b4b](chapters/ch_live_lineage_observed_by_event_172b4b.md)
- [ch_live_lineage_observed_by_event_f95e14](chapters/ch_live_lineage_observed_by_event_f95e14.md)
- [ch_live_outlier_claim_against_baseline_0b0b4c](chapters/ch_live_outlier_claim_against_baseline_0b0b4c.md)
- [ch_live_requirement_min_one_verification_35acbe](chapters/ch_live_requirement_min_one_verification_35acbe.md)
- [ch_live_social_networking_service_usage_ac7a26](chapters/ch_live_social_networking_service_usage_ac7a26.md)
- [ch_live_trace_originates_from_a273c7](chapters/ch_live_trace_originates_from_a273c7.md)

## Ontology terms grounding this collection

- `artifact_min_one_owner` — {X} is an artifact
- `column_renamed_from` — {X} is a descriptive information content entity that renamed from {Y}
- `control_with_owner` — {X} is a directive information content entity
- `ebpf_event_basic` — {X} is a process
- `evidence_basic` — {X} is a descriptive information content entity
- `flood_asset_vulnerability_assessment` — FloodAssetVulnerabilityAssessment is an information content entity that assesses FloodAssetCondition and identifies Vuln
- `kernelhook_max_one_program_attached` — {X} is an artifact
- `lineage_governed_by_directive` — {X} is a descriptive information content entity that governed by directive information content entity
- `lineage_observed_by_event` — {X} is a descriptive information content entity
- `log_record_subclass` — {X} is an artifact that has log severity {Y}
- `ontology_class_match` — {X} is a descriptive information content entity that matches ontology class {Y}
- `outlier_claim_against_baseline` — {X} is a descriptive information content entity that against {Y}
- `outlier_claim_basic` — {X} is a descriptive information content entity
- `outlier_claim_has_confidence` — {X} is a descriptive information content entity that has confidence {Y}
- `policy_authored_by` — {X} is a directive information content entity that authored by {Y}
- `requirement_min_one_verification` — {X} is a directive information content entity
- `social_networking_service_usage` — A SocialNetworkingServiceUsage is a process that involves a StaffMember and utilizes a SocialNetworkingService.
- `storage_structure_composition` — A StorageStructureComposition is a Material Entity that comprises exactly one DatabaseContainer.
- `syscall_with_argument_count` — {X} is a designative information content entity that has argument count {Y}
- `trace_originates_from` — {X} is a process that originates from {Y}

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_artifact_min_one_owner`](tables/t_artifact_min_one_owner.sql) — realizes `artifact_min_one_owner` · _shared with 8 other collection(s)_
- [`t_column_renamed_from`](tables/t_column_renamed_from.sql) — realizes `column_renamed_from` · _shared with 6 other collection(s)_
- [`t_control_with_owner`](tables/t_control_with_owner.sql) — realizes `control_with_owner` · _shared with 9 other collection(s)_
- [`t_ebpf_event_basic`](tables/t_ebpf_event_basic.sql) — realizes `ebpf_event_basic` · _shared with 3 other collection(s)_
- [`t_evidence_basic`](tables/t_evidence_basic.sql) — realizes `evidence_basic` · _shared with 10 other collection(s)_
- [`t_flood_asset_vulnerability_assessment`](tables/t_flood_asset_vulnerability_assessment.sql) — realizes `flood_asset_vulnerability_assessment` · _shared with 8 other collection(s)_
- [`t_kernelhook_max_one_program_attached`](tables/t_kernelhook_max_one_program_attached.sql) — realizes `kernelhook_max_one_program_attached` · _shared with 3 other collection(s)_
- [`t_lineage_governed_by_directive`](tables/t_lineage_governed_by_directive.sql) — realizes `lineage_governed_by_directive` · _shared with 8 other collection(s)_
- [`t_lineage_observed_by_event`](tables/t_lineage_observed_by_event.sql) — realizes `lineage_observed_by_event` · _shared with 2 other collection(s)_
- [`t_log_record_subclass`](tables/t_log_record_subclass.sql) — realizes `log_record_subclass` · _shared with 9 other collection(s)_
- [`t_ontology_class_match`](tables/t_ontology_class_match.sql) — realizes `ontology_class_match` · _shared with 9 other collection(s)_
- [`t_outlier_claim_against_baseline`](tables/t_outlier_claim_against_baseline.sql) — realizes `outlier_claim_against_baseline` · _shared with 5 other collection(s)_
- [`t_outlier_claim_basic`](tables/t_outlier_claim_basic.sql) — realizes `outlier_claim_basic` · _shared with 1 other collection(s)_
- [`t_outlier_claim_has_confidence`](tables/t_outlier_claim_has_confidence.sql) — realizes `outlier_claim_has_confidence` · _shared with 4 other collection(s)_
- [`t_policy_authored_by`](tables/t_policy_authored_by.sql) — realizes `policy_authored_by` · _shared with 10 other collection(s)_
- [`t_requirement_min_one_verification`](tables/t_requirement_min_one_verification.sql) — realizes `requirement_min_one_verification` · _shared with 6 other collection(s)_
- [`t_social_networking_service_usage`](tables/t_social_networking_service_usage.sql) — realizes `social_networking_service_usage` · _shared with 4 other collection(s)_
- [`t_storage_structure_composition`](tables/t_storage_structure_composition.sql) — realizes `storage_structure_composition` · _shared with 8 other collection(s)_
- [`t_syscall_with_argument_count`](tables/t_syscall_with_argument_count.sql) — realizes `syscall_with_argument_count` · _shared with 8 other collection(s)_
- [`t_trace_originates_from`](tables/t_trace_originates_from.sql) — realizes `trace_originates_from` · _shared with 9 other collection(s)_
