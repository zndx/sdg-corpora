# Collection — topic 14 · 03_directive_governance

FinePDFs-grounded topic (carried forward from the coverage audit). **11 chapters** · **14 topics** (target + style) · **24 ontology terms** · **24 underlying tables**.

**Topics (many-to-many).** The documents draw on, beyond the anchor topic 14: topic 20, topic 22, topic 24, topic 29, topic 32, topic 33, topic 38, topic 40, topic 68, topic 69, topic 92, topic 171, topic 186.

> **Topic gist** (representative FinePDFs text): DRAFT AQUACULTURE PLAN FOR SHARK BAY FISHERIES MANAGEMENT PAPER NO. 171 Department of Fisheries 168 St. George's Terrace Perth WA 6000 April 2004 ISSN 0819-4327 Draft Aquaculture Plan For Shark Bay April 2004 Fisheries Management Paper No. 171 ISSN 0819-4327 AN INVITATION TO COMMENT The Department of Fisheries invites people to make a submission on the issues discussed in this report - *... …

## Chapters

- [ch_live_audit_with_findings_04b021](chapters/ch_live_audit_with_findings_04b021.md)
- [ch_live_belief_interval_basic_76cd25](chapters/ch_live_belief_interval_basic_76cd25.md)
- [ch_live_breaking_change_subclass_341572](chapters/ch_live_breaking_change_subclass_341572.md)
- [ch_live_dataset_revision_of_2f0e3f](chapters/ch_live_dataset_revision_of_2f0e3f.md)
- [ch_live_mass_function_only_assigns_subsets_0b33c9](chapters/ch_live_mass_function_only_assigns_subsets_0b33c9.md)
- [ch_live_metric_with_unit_0873cf](chapters/ch_live_metric_with_unit_0873cf.md)
- [ch_live_policy_only_applies_to_5addfc](chapters/ch_live_policy_only_applies_to_5addfc.md)
- [ch_live_policy_only_governs_artifacts_f8339f](chapters/ch_live_policy_only_governs_artifacts_f8339f.md)
- [ch_live_state_transitions_from_5dabe9](chapters/ch_live_state_transitions_from_5dabe9.md)
- [ch_live_trace_supports_claim_983ff1](chapters/ch_live_trace_supports_claim_983ff1.md)
- [ch_live_trace_supports_claim_f5a870](chapters/ch_live_trace_supports_claim_f5a870.md)

## Ontology terms grounding this collection

- `audit_with_findings` — {X} is a process that has findings {Y}
- `backward_compatible_with` — {X} is a descriptive information content entity that backward compatible with {Y}
- `baseline_for_metric` — {X} is a descriptive information content entity that baseline for {Y}
- `belief_interval_basic` — {X} is a descriptive information content entity
- `breaking_change_subclass` — {X} is a descriptive information content entity that breaking change for {Y}
- `counter_metric_subclass` — {X} is an artifact that has metric kind {Y}
- `dataset_at_version` — {X} is an artifact that at dataset version {Y}
- `dataset_revision_of` — {X} is an artifact that was revision of {Y}
- `ebpfmap_subclass` — {X} is an artifact that has map type {Y}
- `equiv_intersect_with_two_restrictions` — {X} is equivalent to {Y} that {p} {Z} and {q} {W}
- `flood_asset_vulnerability_assessment` — FloodAssetVulnerabilityAssessment is an information content entity that assesses FloodAssetCondition and identifies Vuln
- `gdpr_article_subclass` — {X} is a directive information content entity that gdpr article {Y}
- `ice_subclass_with_part` — {X} is an information content entity that has part information content entity
- `labrun_subclass` — {X} is a process that has input sample {Y}
- `mass_function_only_assigns_subsets` — {X} is a descriptive information content entity that assigns mass to {Y}
- `mass_function_subclass` — {X} is a descriptive information content entity that over frame of discernment {Y}
- `metric_with_unit` — {X} is an artifact that has metric unit {Y}
- `nist80053_control_subclass` — {X} is a directive information content entity that nist80053 control {Y}
- `policy_only_applies_to` — {X} is a directive information content entity that applies to {Y}
- `policy_only_governs_artifacts` — {X} is a directive information content entity
- `schemaorg_event_starttime` — {X} is an artifact that has event start time {Y}
- `schemaorg_person_roleat` — {X} is an artifact that has role at {Y}
- `state_transitions_from` — {X} is a descriptive information content entity that transitions from {Y}
- `trace_supports_claim` — {X} is a process that supports claim descriptive information content entity

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_audit_with_findings`](tables/t_audit_with_findings.sql) — realizes `audit_with_findings` · _shared with 2 other collection(s)_
- [`t_backward_compatible_with`](tables/t_backward_compatible_with.sql) — realizes `backward_compatible_with` · _shared with 6 other collection(s)_
- [`t_baseline_for_metric`](tables/t_baseline_for_metric.sql) — realizes `baseline_for_metric` · _shared with 6 other collection(s)_
- [`t_belief_interval_basic`](tables/t_belief_interval_basic.sql) — realizes `belief_interval_basic` · _shared with 9 other collection(s)_
- [`t_breaking_change_subclass`](tables/t_breaking_change_subclass.sql) — realizes `breaking_change_subclass` · _shared with 4 other collection(s)_
- [`t_counter_metric_subclass`](tables/t_counter_metric_subclass.sql) — realizes `counter_metric_subclass` · _shared with 9 other collection(s)_
- [`t_dataset_at_version`](tables/t_dataset_at_version.sql) — realizes `dataset_at_version` · _shared with 6 other collection(s)_
- [`t_dataset_revision_of`](tables/t_dataset_revision_of.sql) — realizes `dataset_revision_of` · _shared with 1 other collection(s)_
- [`t_ebpfmap_subclass`](tables/t_ebpfmap_subclass.sql) — realizes `ebpfmap_subclass` · _shared with 7 other collection(s)_
- [`t_equiv_intersect_with_two_restrictions`](tables/t_equiv_intersect_with_two_restrictions.sql) — realizes `equiv_intersect_with_two_restrictions` · _shared with 12 other collection(s)_
- [`t_flood_asset_vulnerability_assessment`](tables/t_flood_asset_vulnerability_assessment.sql) — realizes `flood_asset_vulnerability_assessment` · _shared with 8 other collection(s)_
- [`t_gdpr_article_subclass`](tables/t_gdpr_article_subclass.sql) — realizes `gdpr_article_subclass` · _shared with 9 other collection(s)_
- [`t_ice_subclass_with_part`](tables/t_ice_subclass_with_part.sql) — realizes `ice_subclass_with_part` · _shared with 9 other collection(s)_
- [`t_labrun_subclass`](tables/t_labrun_subclass.sql) — realizes `labrun_subclass` · _shared with 10 other collection(s)_
- [`t_mass_function_only_assigns_subsets`](tables/t_mass_function_only_assigns_subsets.sql) — realizes `mass_function_only_assigns_subsets` · _shared with 5 other collection(s)_
- [`t_mass_function_subclass`](tables/t_mass_function_subclass.sql) — realizes `mass_function_subclass` · _shared with 3 other collection(s)_
- [`t_metric_with_unit`](tables/t_metric_with_unit.sql) — realizes `metric_with_unit` · _shared with 1 other collection(s)_
- [`t_nist80053_control_subclass`](tables/t_nist80053_control_subclass.sql) — realizes `nist80053_control_subclass` · _shared with 5 other collection(s)_
- [`t_policy_only_applies_to`](tables/t_policy_only_applies_to.sql) — realizes `policy_only_applies_to` · _shared with 5 other collection(s)_
- [`t_policy_only_governs_artifacts`](tables/t_policy_only_governs_artifacts.sql) — realizes `policy_only_governs_artifacts` · _shared with 12 other collection(s)_
- [`t_schemaorg_event_starttime`](tables/t_schemaorg_event_starttime.sql) — realizes `schemaorg_event_starttime` · _shared with 10 other collection(s)_
- [`t_schemaorg_person_roleat`](tables/t_schemaorg_person_roleat.sql) — realizes `schemaorg_person_roleat` · _shared with 7 other collection(s)_
- [`t_state_transitions_from`](tables/t_state_transitions_from.sql) — realizes `state_transitions_from` · _shared with 8 other collection(s)_
- [`t_trace_supports_claim`](tables/t_trace_supports_claim.sql) — realizes `trace_supports_claim`
