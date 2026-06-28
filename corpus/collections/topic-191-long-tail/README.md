# Collection — topic 191 · 07_long_tail

FinePDFs-grounded topic (carried forward from the coverage audit). **10 chapters** · **4 topics** (target + style) · **22 ontology terms** · **22 underlying tables**.

**Topics (many-to-many).** The documents draw on, beyond the anchor topic 191: topic 125, topic 169, topic 181.

> **Topic gist** (representative FinePDFs text): SOLICITATION, OFFER AND AWARD 1. THIS CONTRACT IS A RATED ORDER UNDER DPAS (15 CFR 700) 2. CONTRACT NUMBER: TIB-2007-C-002 3. SOLICITATION NUMBER: TIB-2006-R-002 4. TYPE OF SOLICITATION: [ ] SEALED BID (IFB) [X] NEGOTIATED (RFP) 5. DATE ISSUED: 6. REQUISITION/PURCHASE NUMBER: 7. ISSUED BY: FEDERAL RETIREMENT THRIFT INVESTMENT BOARD 1250 H STREET N.W., SUITE 200 WASHINGTON, DC 20005 8. AD... …

## Chapters

- [ch_live_attestation_basic_d07f72](chapters/ch_live_attestation_basic_d07f72.md)
- [ch_live_attestation_min_one_signer_3828b3](chapters/ch_live_attestation_min_one_signer_3828b3.md)
- [ch_live_dataset_at_version_6c7458](chapters/ch_live_dataset_at_version_6c7458.md)
- [ch_live_descriptive_not_retracted_c7eabe](chapters/ch_live_descriptive_not_retracted_c7eabe.md)
- [ch_live_metric_with_aggregation_037e26](chapters/ch_live_metric_with_aggregation_037e26.md)
- [ch_live_schemaorg_event_starttime_16d3a1](chapters/ch_live_schemaorg_event_starttime_16d3a1.md)
- [ch_live_shell_dimension_specification_23a199](chapters/ch_live_shell_dimension_specification_23a199.md)
- [ch_live_subclass_to_independent_continuant_a2ab5e](chapters/ch_live_subclass_to_independent_continuant_a2ab5e.md)
- [ch_live_subclass_to_process_6f2789](chapters/ch_live_subclass_to_process_6f2789.md)
- [ch_live_transformation_subclass_f7e168](chapters/ch_live_transformation_subclass_f7e168.md)

## Ontology terms grounding this collection

- `attestation_basic` — {X} is a process
- `attestation_min_one_signer` — {X} is a process
- `attestation_signed_by` — {X} is a process that signed by person
- `audit_targets_data_artifact` — {X} is a process that audits control artifact
- `dataset_at_version` — {X} is an artifact that at dataset version {Y}
- `descriptive_not_retracted` — {X} is not {Y}
- `evidence_basic` — {X} is a descriptive information content entity
- `financial_strategy_oversight` — A FinancialStrategyOversight is a Process that directs some FinancialActivity and oversees some RiskManagementActivity.
- `measurement_subclass_only_one_unit` — {X} is a descriptive information content entity that has unit {Y}
- `metric_with_aggregation` — {X} is an artifact that has aggregation temporality {Y}
- `nist80053_low_impact` — {X} is a directive information content entity that at nistimpact level {Y}
- `opentelemetry_span_subclass` — {X} is a process that has span context {Y}
- `qualification_process` — A QualificationProcess is an occurrent behavior that requires a membership registration and yields a championship entry.
- `requirement_min_one_verification` — {X} is a directive information content entity
- `schemaorg_event_starttime` — {X} is an artifact that has event start time {Y}
- `shell_dimension_specification` — ShellDimensionSpecification is a descriptive information content entity with exactly one decimal dimension value.
- `social_networking_service_usage` — A SocialNetworkingServiceUsage is a process that involves a StaffMember and utilizes a SocialNetworkingService.
- `strategic_planning_process` — A StrategicPlanningProcess is a Process that targets a BusinessDivision and produces a PlanningArtifact.
- `subclass_to_independent_continuant` — {X} is an independent continuant
- `subclass_to_process` — {X} is a process
- `transformation_associated_with_agent` — {X} is a process that was associated with {Y}
- `transformation_subclass` — {X} is a process that uses entity {Y}

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_attestation_basic`](tables/t_attestation_basic.sql) — realizes `attestation_basic` · _shared with 8 other collection(s)_
- [`t_attestation_min_one_signer`](tables/t_attestation_min_one_signer.sql) — realizes `attestation_min_one_signer` · _shared with 4 other collection(s)_
- [`t_attestation_signed_by`](tables/t_attestation_signed_by.sql) — realizes `attestation_signed_by` · _shared with 5 other collection(s)_
- [`t_audit_targets_data_artifact`](tables/t_audit_targets_data_artifact.sql) — realizes `audit_targets_data_artifact` · _shared with 5 other collection(s)_
- [`t_dataset_at_version`](tables/t_dataset_at_version.sql) — realizes `dataset_at_version` · _shared with 6 other collection(s)_
- [`t_descriptive_not_retracted`](tables/t_descriptive_not_retracted.sql) — realizes `descriptive_not_retracted` · _shared with 14 other collection(s)_
- [`t_evidence_basic`](tables/t_evidence_basic.sql) — realizes `evidence_basic` · _shared with 10 other collection(s)_
- [`t_financial_strategy_oversight`](tables/t_financial_strategy_oversight.sql) — realizes `financial_strategy_oversight` · _shared with 7 other collection(s)_
- [`t_measurement_subclass_only_one_unit`](tables/t_measurement_subclass_only_one_unit.sql) — realizes `measurement_subclass_only_one_unit` · _shared with 7 other collection(s)_
- [`t_metric_with_aggregation`](tables/t_metric_with_aggregation.sql) — realizes `metric_with_aggregation` · _shared with 8 other collection(s)_
- [`t_nist80053_low_impact`](tables/t_nist80053_low_impact.sql) — realizes `nist80053_low_impact` · _shared with 6 other collection(s)_
- [`t_opentelemetry_span_subclass`](tables/t_opentelemetry_span_subclass.sql) — realizes `opentelemetry_span_subclass` · _shared with 7 other collection(s)_
- [`t_qualification_process`](tables/t_qualification_process.sql) — realizes `qualification_process` · _shared with 6 other collection(s)_
- [`t_requirement_min_one_verification`](tables/t_requirement_min_one_verification.sql) — realizes `requirement_min_one_verification` · _shared with 6 other collection(s)_
- [`t_schemaorg_event_starttime`](tables/t_schemaorg_event_starttime.sql) — realizes `schemaorg_event_starttime` · _shared with 10 other collection(s)_
- [`t_shell_dimension_specification`](tables/t_shell_dimension_specification.sql) — realizes `shell_dimension_specification` · _shared with 12 other collection(s)_
- [`t_social_networking_service_usage`](tables/t_social_networking_service_usage.sql) — realizes `social_networking_service_usage` · _shared with 4 other collection(s)_
- [`t_strategic_planning_process`](tables/t_strategic_planning_process.sql) — realizes `strategic_planning_process` · _shared with 9 other collection(s)_
- [`t_subclass_to_independent_continuant`](tables/t_subclass_to_independent_continuant.sql) — realizes `subclass_to_independent_continuant` · _shared with 7 other collection(s)_
- [`t_subclass_to_process`](tables/t_subclass_to_process.sql) — realizes `subclass_to_process` · _shared with 13 other collection(s)_
- [`t_transformation_associated_with_agent`](tables/t_transformation_associated_with_agent.sql) — realizes `transformation_associated_with_agent` · _shared with 8 other collection(s)_
- [`t_transformation_subclass`](tables/t_transformation_subclass.sql) — realizes `transformation_subclass` · _shared with 5 other collection(s)_
