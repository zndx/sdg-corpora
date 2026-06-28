# Collection — topic 38 · 07_long_tail

FinePDFs-grounded topic (carried forward from the coverage audit). **10 chapters** · **12 topics** (target + style) · **21 ontology terms** · **21 underlying tables**.

**Topics (many-to-many).** The documents draw on, beyond the anchor topic 38: topic 47, topic 54, topic 60, topic 65, topic 95, topic 106, topic 136, topic 155, topic 186, topic 195, topic 196.

> **Topic gist** (representative FinePDFs text): UNITED STATES ENVIRONMENTAL PROTECTION AGENCY REGIONS 1595 Wynkoop Street DENVER, CO 80202-1129 PhOne 800-227-8917 http://www.epa.govlregion08 PORTIONS OF THIS DOCUMENT HAVE BEEN REDACTED. THE AGENCY HAS DETERMINED PORTIONS NOTED AS "**,, TO BE CONFIDENTIAL BUSINESS INFORMATION AND NOT TO BE RELEASED REDACTIONS APPEAR ON THE FOLLOWING PAGES OF THE TITLE V PETITION BEFORE THE ADMINISTRATOR UNI... …

## Chapters

- [ch_live_transformation_associated_with_agent_659d32](chapters/ch_live_transformation_associated_with_agent_659d32.md)
- [ch_live_verification_subclass_0e1684](chapters/ch_live_verification_subclass_0e1684.md)
- [ch_live_verification_subclass_14b8df](chapters/ch_live_verification_subclass_14b8df.md)
- [ch_live_verification_subclass_182d66](chapters/ch_live_verification_subclass_182d66.md)
- [ch_live_verification_subclass_664feb](chapters/ch_live_verification_subclass_664feb.md)
- [ch_live_verification_subclass_827fe1](chapters/ch_live_verification_subclass_827fe1.md)
- [ch_live_verification_subclass_8df316](chapters/ch_live_verification_subclass_8df316.md)
- [ch_live_verification_subclass_a24c6f](chapters/ch_live_verification_subclass_a24c6f.md)
- [ch_live_verification_subclass_a78bc5](chapters/ch_live_verification_subclass_a78bc5.md)
- [ch_live_verification_subclass_fa8960](chapters/ch_live_verification_subclass_fa8960.md)

## Ontology terms grounding this collection

- `agent_with_role` — {X} is an artifact that has agent role {Y}
- `cardinality_min_two_generic` — Class: {X:Class} SubClassOf: {p:ObjectProperty} min 2 {Y:Class}
- `constraint_with_violation_consequence` — {X} is a directive information content entity that on violation {Z}
- `dempster_combinant_first` — {X} is a descriptive information content entity that has first combinant {Y}
- `disjunctive_combination` — {X} is a descriptive information content entity that disjunctively combines {Y}
- `ebpf_event_min_one_attribute` — {X} is a process
- `histogram_metric_subclass` — {X} is an artifact that has metric kind {Y}
- `ice_exactly_one_subject` — {X} is an information content entity
- `internal_communication_requirement` — InternalCommunicationRequirement is a directive ICE that specifies an EnterpriseSocialMedia and targets an Organizationa
- `kernelhook_observes_event_class` — {X} is an artifact that observes event {Y}
- `measurement_with_method` — {X} is a descriptive information content entity that via method {Y}
- `process_min_one_input` — {X} is a process
- `profile_over_time_window` — {X} is a descriptive information content entity that over time window {Y}
- `profiling_basic` — {X} is a process
- `schema_evolution_under_directive` — {X} is a descriptive information content entity that governed by directive information content entity
- `school_security_policy` — SchoolSecurityPolicy is a DirectiveICE that targets some SafetyObjective and mustSatisfy some ConstitutionalConstraint.
- `span_with_attribute` — {X} is a process that has span attribute {Y}
- `syscall_only_in_kernel_subsystem` — {X} is a designative information content entity that in syscall subsystem {Y}
- `transformation_associated_with_agent` — {X} is a process that was associated with {Y}
- `transformation_with_output_dataset` — {X} is a process that has output dataset {Y}
- `verification_subclass` — {X} is a process that verifies directive information content entity

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_agent_with_role`](tables/t_agent_with_role.sql) — realizes `agent_with_role` · _shared with 7 other collection(s)_
- [`t_cardinality_min_two_generic`](tables/t_cardinality_min_two_generic.sql) — realizes `cardinality_min_two_generic` · _shared with 8 other collection(s)_
- [`t_constraint_with_violation_consequence`](tables/t_constraint_with_violation_consequence.sql) — realizes `constraint_with_violation_consequence` · _shared with 8 other collection(s)_
- [`t_dempster_combinant_first`](tables/t_dempster_combinant_first.sql) — realizes `dempster_combinant_first` · _shared with 8 other collection(s)_
- [`t_disjunctive_combination`](tables/t_disjunctive_combination.sql) — realizes `disjunctive_combination` · _shared with 11 other collection(s)_
- [`t_ebpf_event_min_one_attribute`](tables/t_ebpf_event_min_one_attribute.sql) — realizes `ebpf_event_min_one_attribute` · _shared with 6 other collection(s)_
- [`t_histogram_metric_subclass`](tables/t_histogram_metric_subclass.sql) — realizes `histogram_metric_subclass` · _shared with 9 other collection(s)_
- [`t_ice_exactly_one_subject`](tables/t_ice_exactly_one_subject.sql) — realizes `ice_exactly_one_subject` · _shared with 5 other collection(s)_
- [`t_internal_communication_requirement`](tables/t_internal_communication_requirement.sql) — realizes `internal_communication_requirement` · _shared with 9 other collection(s)_
- [`t_kernelhook_observes_event_class`](tables/t_kernelhook_observes_event_class.sql) — realizes `kernelhook_observes_event_class` · _shared with 5 other collection(s)_
- [`t_measurement_with_method`](tables/t_measurement_with_method.sql) — realizes `measurement_with_method` · _shared with 9 other collection(s)_
- [`t_process_min_one_input`](tables/t_process_min_one_input.sql) — realizes `process_min_one_input` · _shared with 7 other collection(s)_
- [`t_profile_over_time_window`](tables/t_profile_over_time_window.sql) — realizes `profile_over_time_window` · _shared with 4 other collection(s)_
- [`t_profiling_basic`](tables/t_profiling_basic.sql) — realizes `profiling_basic` · _shared with 7 other collection(s)_
- [`t_schema_evolution_under_directive`](tables/t_schema_evolution_under_directive.sql) — realizes `schema_evolution_under_directive` · _shared with 4 other collection(s)_
- [`t_school_security_policy`](tables/t_school_security_policy.sql) — realizes `school_security_policy` · _shared with 8 other collection(s)_
- [`t_span_with_attribute`](tables/t_span_with_attribute.sql) — realizes `span_with_attribute` · _shared with 8 other collection(s)_
- [`t_syscall_only_in_kernel_subsystem`](tables/t_syscall_only_in_kernel_subsystem.sql) — realizes `syscall_only_in_kernel_subsystem` · _shared with 4 other collection(s)_
- [`t_transformation_associated_with_agent`](tables/t_transformation_associated_with_agent.sql) — realizes `transformation_associated_with_agent` · _shared with 8 other collection(s)_
- [`t_transformation_with_output_dataset`](tables/t_transformation_with_output_dataset.sql) — realizes `transformation_with_output_dataset` · _shared with 4 other collection(s)_
- [`t_verification_subclass`](tables/t_verification_subclass.sql) — realizes `verification_subclass` · _shared with 4 other collection(s)_
