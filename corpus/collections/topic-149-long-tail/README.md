# Collection — topic 149 · 07_long_tail

FinePDFs-grounded topic (carried forward from the coverage audit). **3 chapters** · **1 topics** (target + style) · **9 ontology terms** · **9 underlying tables**.

> **Topic gist** (representative FinePDFs text): HAZARD COMMUNICATION PROGRAM (MODEL) INSTRUCTIONS FOR ADAPTING THIS MODEL TO A SPECIFIC PROGRAM FOR AN INDIVIDUAL DEPARTMENT This model is available for Southern Illinois University Carbondale campus departments as an aid to complying with the Occupational Safety and Health Administration (OSHA) requirement of maintaining a work place specific written Hazard Communication Program. "Hazard Commun.. …

## Chapters

- [ch_live_indoor_air_quality_action_plan_9c4411](chapters/ch_live_indoor_air_quality_action_plan_9c4411.md)
- [ch_live_measurement_with_unit_c4c04f](chapters/ch_live_measurement_with_unit_c4c04f.md)
- [ch_live_span_within_trace_fa010b](chapters/ch_live_span_within_trace_fa010b.md)

## Ontology terms grounding this collection

- `allocation_subclass` — {X} is a process that executes transformation {Y}
- `belief_interval_basic` — {X} is a descriptive information content entity
- `division_eligibility_constraint` — A DivisionEligibilityConstraint is equivalent to a qualified athlete status that explicitly excludes cross-division tran
- `indoor_air_quality_action_plan` — An IndoorAirQualityActionPlan is a DirectiveICE that targets IndoorAirPollution and is verified by a HealthOutcomeMetric
- `measurement_with_unit` — {X} is a descriptive information content entity that has unit {Y}
- `plausibility_function_for` — {X} is a descriptive information content entity that plausibility for claim {Y}
- `primary_key_designation` — {X} is a descriptive information content entity that is primary key of {Y}
- `professional_experience` — A ProfessionalExperience is an InformationContentEntity that relates a Person to an Organization and records a duration 
- `span_within_trace` — {X} is a process that part of {Y}

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_allocation_subclass`](tables/t_allocation_subclass.sql) — realizes `allocation_subclass` · _shared with 12 other collection(s)_
- [`t_belief_interval_basic`](tables/t_belief_interval_basic.sql) — realizes `belief_interval_basic` · _shared with 9 other collection(s)_
- [`t_division_eligibility_constraint`](tables/t_division_eligibility_constraint.sql) — realizes `division_eligibility_constraint` · _shared with 11 other collection(s)_
- [`t_indoor_air_quality_action_plan`](tables/t_indoor_air_quality_action_plan.sql) — realizes `indoor_air_quality_action_plan` · _shared with 6 other collection(s)_
- [`t_measurement_with_unit`](tables/t_measurement_with_unit.sql) — realizes `measurement_with_unit` · _shared with 9 other collection(s)_
- [`t_plausibility_function_for`](tables/t_plausibility_function_for.sql) — realizes `plausibility_function_for` · _shared with 8 other collection(s)_
- [`t_primary_key_designation`](tables/t_primary_key_designation.sql) — realizes `primary_key_designation` · _shared with 7 other collection(s)_
- [`t_professional_experience`](tables/t_professional_experience.sql) — realizes `professional_experience` · _shared with 8 other collection(s)_
- [`t_span_within_trace`](tables/t_span_within_trace.sql) — realizes `span_within_trace` · _shared with 7 other collection(s)_
