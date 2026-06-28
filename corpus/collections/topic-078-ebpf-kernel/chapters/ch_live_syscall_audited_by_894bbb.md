---
chapter_id: ch_live_syscall_audited_by_894bbb
topic_id: 78
family: 04_ebpf_kernel
cited_terms: ['syscall_audited_by', 'labrun_subclass', 'outlier_claim_against_baseline']
model: engine-refine
---

Audit records are anchored by unique identifiers—AUDI-0001 through AUDI-0004 in the syscall audit registry—that serve as immutable keys across the entire data fabric. Each identifier carries a format designation, whether JSON, UUID, or CSV, which dictates the serialization envelope for the associated record, and a language tag—fr, en, or ja—that governs localization of human-readable content. The syscall dimension itself enumerates concrete operations such as unlinkat, execve, epoll_ctl, and clone, grounding the abstract identifier in executable system behavior. These identifiers do not exist in isolation; they propagate as foreign references throughout downstream tables, most notably as input_sample values in the lab run subclass registry, where AUDI-0004 and AUDI-0001 appear as cross-references to CellCulture-Exp12, FlowCyt-Panel9, ELISA-Plate88, and PCR-Run-Alpha7, establishing a traceable lineage from audit event to experimental artifact.

**t_syscall_audited_by**

| id | syscall | format | language |
| --- | --- | --- | --- |
| AUDI-0001 | unlinkat | JSON | fr |
| AUDI-0002 | execve | UUID | en |
| AUDI-0003 | epoll_ctl | CSV | ja |
| AUDI-0004 | clone | UUID | en |
| AUDI-0005 | openat | E.164 | ja |
| AUDI-0006 | execve | E.164 | de |

**t_labrun_subclass**

| id | labrun | input_sample |
| --- | --- | --- |
| LABR-0001 | CellCulture-Exp12 | AUDI-0004 |
| LABR-0002 | FlowCyt-Panel9 | AUDI-0001 |
| LABR-0003 | ELISA-Plate88 | AUDI-0005 |
| LABR-0004 | PCR-Run-Alpha7 | AUDI-0005 |
| LABR-0005 | MassSpec-MS19 | AUDI-0006 |
| LABR-0006 | NMR-Stand-04A | AUDI-0004 |
| LABR-0007 | FlowCyt-Panel9 | AUDI-0002 |
| LABR-0008 | RNASeq-Lib15 | AUDI-0006 |

**t_labrun_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| LABR-0001 | duration_seconds | xsd:decimal |
| LABR-0002 | end_time | xsd:dateTime |
| LABR-0003 | exit_code | xsd:integer |
| LABR-0004 | host_name | xsd:string |
| LABR-0005 | log_level | xsd:string |
| LABR-0006 | phase | xsd:string |
| LABR-0007 | retry_count | xsd:integer |
| LABR-0008 | scheduled_at | xsd:dateTime |

**t_labrun_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LABR-0001 | LABR-0001 | LABR-0003 | 241 |
| LABR-0002 | LABR-0001 | LABR-0007 | 320 |
| LABR-0003 | LABR-0002 | LABR-0003 | 688 |
| LABR-0004 | LABR-0002 | LABR-0007 | 479 |
| LABR-0005 | LABR-0003 | LABR-0003 | 481 |
| LABR-0006 | LABR-0003 | LABR-0007 | 200 |
| LABR-0007 | LABR-0004 | LABR-0003 | 208 |
| LABR-0008 | LABR-0004 | LABR-0007 | 121 |

Attributes and their types constitute the schema layer that gives structure to measured values. The attribute definition table assigns each attribute a name—duration_seconds, end_time, exit_code, host_name—and an XSD type—xsd:decimal, xsd:dateTime, xsd:integer, xsd:string—that constrains the domain of permissible values. This type discipline is enforced through a family of value tables partitioned by data type: datetime values such as 2023-06-03T03:48:13 and 2024-12-03T15:21:58 reside in the datetime store, decimal measurements like 7187.70, 5360.85, 3249.87, and 649.77 in the decimal store, integer counts including 241, 320, 688, and 479 in the integer store, and string-valued metadata such as node-b14, Log Level 02, closeout, and pending in the varchar store. Each value row binds an entity—LABR-0001, LABR-0002—to an attribute via attr_id, forming a normalized entity-attribute-value pattern that preserves type safety while allowing heterogeneous attribute sets per entity.

**t_labrun_subclass_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LABR-0001 | LABR-0001 | LABR-0002 | 2023-06-03T03:48:13 |
| LABR-0002 | LABR-0001 | LABR-0008 | 2024-12-03T15:21:58 |
| LABR-0003 | LABR-0001 | LABR-0009 | 2023-08-16T05:52:21 |
| LABR-0004 | LABR-0002 | LABR-0002 | 2024-08-31T23:33:13 |
| LABR-0005 | LABR-0002 | LABR-0008 | 2025-02-13T01:21:55 |
| LABR-0006 | LABR-0002 | LABR-0009 | 2023-04-09T20:59:10 |
| LABR-0007 | LABR-0003 | LABR-0002 | 2024-04-14T13:26:56 |
| LABR-0008 | LABR-0003 | LABR-0008 | 2024-07-04T01:41:44 |

**t_labrun_subclass_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LABR-0001 | LABR-0001 | LABR-0001 | 7187.70 |
| LABR-0002 | LABR-0002 | LABR-0001 | 5360.85 |
| LABR-0003 | LABR-0003 | LABR-0001 | 3249.87 |
| LABR-0004 | LABR-0004 | LABR-0001 | 649.77 |
| LABR-0005 | LABR-0005 | LABR-0001 | 3590.34 |
| LABR-0006 | LABR-0006 | LABR-0001 | 456.45 |
| LABR-0007 | LABR-0007 | LABR-0001 | 5720.89 |
| LABR-0008 | LABR-0008 | LABR-0001 | 7012.99 |

**t_labrun_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LABR-0001 | LABR-0001 | LABR-0004 | node-b14 |
| LABR-0002 | LABR-0001 | LABR-0005 | Log Level 02 |
| LABR-0003 | LABR-0001 | LABR-0006 | closeout |
| LABR-0004 | LABR-0001 | LABR-0010 | pending |
| LABR-0005 | LABR-0001 | LABR-0011 | Triggered By 05 |
| LABR-0006 | LABR-0002 | LABR-0004 | ingest-21 |
| LABR-0007 | LABR-0002 | LABR-0005 | Log Level 07 |
| LABR-0008 | LABR-0002 | LABR-0006 | closeout |

The entity concept operates as the central join key across this value architecture. A single entity such as LABR-0001 may simultaneously carry a duration of 7187.70 seconds, an end_time of 2023-06-03T03:48:13, an exit_code of 241, and a host_name of node-b14, with each value sourced from its respective type-specific table. This design permits entities to possess arbitrary attribute profiles without schema migration, while the attr_id column ensures that every value is semantically anchored to a defined attribute. The entity_id column thus functions as the primary axis of aggregation: queries that pivot across value tables reconstruct a complete attribute profile for any given entity, enabling comparative analysis across experimental runs such as CellCulture-Exp12 and FlowCyt-Panel9.

Outlier claims introduce a second relational dimension, where subjects are evaluated against targets through role-labeled relationships. The outlier registry catalogs claims such as telemetry_log_error_404, pH_reading_11_2_deviation, and schema_drift_column_count, each assigned a unique BASE identifier. These outliers are then linked to baseline references—policy_rule_governance, sla_latency_threshold, regulatory_limit_max—through a junction table that encodes the nature of the relationship via a role column. The role values reviewer, contributor, and observer distinguish between parties that assess compliance, those that generate the claim, and those that monitor outcomes, respectively. For instance, the outlier telemetry_log_error_404 appears in multiple relationship rows with the reviewer role, indicating that the same claim may be evaluated against different baselines by different stakeholders, each interaction captured as a distinct subject-target pairing with its own semantic role.

**t_outlier_claim_against_baseline**

| id | outlier |
| --- | --- |
| BASE-0001 | telemetry_log_error_404 |
| BASE-0002 | pH_reading_11_2_deviation |
| BASE-0003 | telemetry_log_error_404 |
| BASE-0004 | schema_drift_column_count |
| BASE-0005 | metric_latency_p99_exceed |
| BASE-0006 | pH_reading_11_2_deviation |

**t_outlier_claim_against_baseline_against**

| id | against |
| --- | --- |
| BASE-0001 | policy_rule_governance |
| BASE-0002 | sla_latency_threshold |
| BASE-0003 | regulatory_limit_max |
| BASE-0004 | policy_rule_governance |
| BASE-0005 | policy_rule_governance |
| BASE-0006 | baseline_model_v4 |

**t_outlier_claim_against_baseline__against**

| id | outlier_id | against_id | role |
| --- | --- | --- | --- |
| BASE-0001 | BASE-0001 | BASE-0005 | reviewer |
| BASE-0002 | BASE-0001 | BASE-0006 | reviewer |
| BASE-0003 | BASE-0005 | BASE-0001 | contributor |
| BASE-0004 | BASE-0005 | BASE-0001 | observer |
| BASE-0005 | BASE-0003 | BASE-0002 | observer |
| BASE-0006 | BASE-0001 | BASE-0003 | observer |
| BASE-0007 | BASE-0002 | BASE-0006 | observer |
| BASE-0008 | BASE-0001 | BASE-0002 | observer |