# Collection — topic 27 · 01_foundation

FinePDFs-grounded topic (carried forward from the coverage audit). **9 chapters** · **13 topics** (target + style) · **19 ontology terms** · **19 underlying tables**.

**Topics (many-to-many).** The documents draw on, beyond the anchor topic 27: topic 41, topic 47, topic 52, topic 70, topic 86, topic 95, topic 97, topic 100, topic 105, topic 115, topic 135, topic 183.

> **Topic gist** (representative FinePDFs text): CHANNEL ASSIGNMENT IN MULTI-HOP TDD W-CDMA CELLULAR NETWORKS BY MOHAMMED K. AL-RIYAMI A thesis submitted to the School of Computing In conformity with the requirement for the degree of Master of Science Queen’s University Kingston, Ontario, Canada April 2004 Copyright © Mohammed K. Al-Riyami, 2004 NOTICE: The author has granted a non-exclusive license allowing Library and Archives Canada to ... …

## Chapters

- [ch_live_alert_triggered_by_257f6a](chapters/ch_live_alert_triggered_by_257f6a.md)
- [ch_live_breaking_change_subclass_7289ae](chapters/ch_live_breaking_change_subclass_7289ae.md)
- [ch_live_claim_observed_by_event_3888ba](chapters/ch_live_claim_observed_by_event_3888ba.md)
- [ch_live_labrun_with_protocol_23f037](chapters/ch_live_labrun_with_protocol_23f037.md)
- [ch_live_labrun_with_protocol_74b6c2](chapters/ch_live_labrun_with_protocol_74b6c2.md)
- [ch_live_mental_health_education_program_1a27cb](chapters/ch_live_mental_health_education_program_1a27cb.md)
- [ch_live_mental_health_education_program_e63a84](chapters/ch_live_mental_health_education_program_e63a84.md)
- [ch_live_metric_emission_subclass_d02444](chapters/ch_live_metric_emission_subclass_d02444.md)
- [ch_live_metric_emission_subclass_f17d55](chapters/ch_live_metric_emission_subclass_f17d55.md)

## Ontology terms grounding this collection

- `account_authorization_record` — An AccountAuthorizationRecord is an information content entity that registers a SocialNetworkingApplication and assigns 
- `aggregation_over_time_window` — {X} is a descriptive information content entity that over time window {Y}
- `alert_triggered_by` — {X} is a process that triggered by metric {Y}
- `breaking_change_subclass` — {X} is a descriptive information content entity that breaking change for {Y}
- `claim_observed_by_event` — {X} is a descriptive information content entity
- `column_value_distribution` — {X} is a descriptive information content entity that has value distribution {Y}
- `control_basic` — {X} is a directive information content entity
- `evidence_refutes_claim` — {X} is a descriptive information content entity that refutes claim {Y}
- `labrun_with_protocol` — {X} is a process that follows protocol {Y}
- `lane_compliance_behavior` — LaneComplianceBehavior is a Process that involvesOperator some VehicleOperator and occursOnStreetType some StreetTraffic
- `legal_advocate_role` — A LegalAdvocateRole is an agent_role that has exactly one Person as its bearer and assists some DomesticViolenceSurvivor
- `mental_health_education_program` — A MentalHealthEducationProgram is an Occurrent that hasDeliveredPresentation some EducationalPresentation and targetsDem
- `metric_emission_subclass` — {X} is a process that emits metric {Y}
- `metric_observed_by_event` — {X} is a descriptive information content entity
- `process_either_started_or_completed` — {X} is equivalent to process and {Y} or {Z}
- `safety_planning_process` — A SafetyPlanningProcess is an action that targets some DomesticViolenceSurvivor and employs some CrisisInterventionMetho
- `schemaorg_creativework_author` — {X} is an artifact that has author {Y}
- `subclass_to_directive_ice` — {X} is a directive information content entity
- `verification_targets_artifact` — {X} is a process that targets artifact {Y}

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_account_authorization_record`](tables/t_account_authorization_record.sql) — realizes `account_authorization_record` · _shared with 5 other collection(s)_
- [`t_aggregation_over_time_window`](tables/t_aggregation_over_time_window.sql) — realizes `aggregation_over_time_window` · _shared with 10 other collection(s)_
- [`t_alert_triggered_by`](tables/t_alert_triggered_by.sql) — realizes `alert_triggered_by` · _shared with 2 other collection(s)_
- [`t_breaking_change_subclass`](tables/t_breaking_change_subclass.sql) — realizes `breaking_change_subclass` · _shared with 4 other collection(s)_
- [`t_claim_observed_by_event`](tables/t_claim_observed_by_event.sql) — realizes `claim_observed_by_event` · _shared with 11 other collection(s)_
- [`t_column_value_distribution`](tables/t_column_value_distribution.sql) — realizes `column_value_distribution` · _shared with 9 other collection(s)_
- [`t_control_basic`](tables/t_control_basic.sql) — realizes `control_basic` · _shared with 8 other collection(s)_
- [`t_evidence_refutes_claim`](tables/t_evidence_refutes_claim.sql) — realizes `evidence_refutes_claim` · _shared with 5 other collection(s)_
- [`t_labrun_with_protocol`](tables/t_labrun_with_protocol.sql) — realizes `labrun_with_protocol` · _shared with 3 other collection(s)_
- [`t_lane_compliance_behavior`](tables/t_lane_compliance_behavior.sql) — realizes `lane_compliance_behavior` · _shared with 9 other collection(s)_
- [`t_legal_advocate_role`](tables/t_legal_advocate_role.sql) — realizes `legal_advocate_role` · _shared with 5 other collection(s)_
- [`t_mental_health_education_program`](tables/t_mental_health_education_program.sql) — realizes `mental_health_education_program` · _shared with 9 other collection(s)_
- [`t_metric_emission_subclass`](tables/t_metric_emission_subclass.sql) — realizes `metric_emission_subclass` · _shared with 4 other collection(s)_
- [`t_metric_observed_by_event`](tables/t_metric_observed_by_event.sql) — realizes `metric_observed_by_event` · _shared with 7 other collection(s)_
- [`t_process_either_started_or_completed`](tables/t_process_either_started_or_completed.sql) — realizes `process_either_started_or_completed` · _shared with 7 other collection(s)_
- [`t_safety_planning_process`](tables/t_safety_planning_process.sql) — realizes `safety_planning_process` · _shared with 7 other collection(s)_
- [`t_schemaorg_creativework_author`](tables/t_schemaorg_creativework_author.sql) — realizes `schemaorg_creativework_author` · _shared with 8 other collection(s)_
- [`t_subclass_to_directive_ice`](tables/t_subclass_to_directive_ice.sql) — realizes `subclass_to_directive_ice` · _shared with 3 other collection(s)_
- [`t_verification_targets_artifact`](tables/t_verification_targets_artifact.sql) — realizes `verification_targets_artifact` · _shared with 7 other collection(s)_
