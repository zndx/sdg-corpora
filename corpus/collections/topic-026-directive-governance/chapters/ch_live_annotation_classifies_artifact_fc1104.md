---
chapter_id: ch_live_annotation_classifies_artifact_fc1104
topic_id: 26
family: 02_observation_measurement
cited_terms: ['annotation_classifies_artifact', 'directive_union_constraint_or_policy', 'syscall_subclass']
model: engine-refine
---

In governed data architectures, every observable object is anchored by a unique identifier that serves as the immutable key for all downstream relationships. Artifacts carry identifiers such as ARTI-0001 through ARTI-0004, policy directives are keyed as POLI-0001 through POLI-0004, and syscall subsystem entries use the SYSC-0001 through SYSC-0004 range. These identifiers are not merely labels; they are the join keys that bind classification metadata, typed attribute values, and analytical facts into a coherent knowledge graph. An artifact identified as ARTI-0001, for instance, may carry the annotation "Source Verified" while simultaneously being the entity to which a confidence score of 0.727 and a recorded timestamp of 2024-11-28T13:33:59 are attached. The identifier is the single point of reference across all these disparate data facets.

**t_annotation_classifies_artifact**

| id | annotation |
| --- | --- |
| ARTI-0001 | Source Verified |
| ARTI-0002 | PII Redacted |
| ARTI-0003 | PII Sensitive |
| ARTI-0004 | Deprecated |
| ARTI-0005 | GDPR Compliant |
| ARTI-0006 | GDPR Compliant |

**t_annotation_classifies_artifact_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ARTI-0001 | confidence | xsd:decimal |
| ARTI-0002 | dimension_kind | xsd:string |
| ARTI-0003 | method | xsd:string |
| ARTI-0004 | recorded_at | xsd:dateTime |
| ARTI-0005 | uncertainty | xsd:decimal |
| ARTI-0006 | unit | xsd:string |
| ARTI-0007 | value | xsd:decimal |
| ARTI-0008 | encoding | xsd:string |

**t_annotation_classifies_artifact_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0004 | 2024-11-28T13:33:59 |
| ARTI-0002 | ARTI-0002 | ARTI-0004 | 2024-06-29T04:58:51 |
| ARTI-0003 | ARTI-0003 | ARTI-0004 | 2023-01-05T00:51:32 |
| ARTI-0004 | ARTI-0004 | ARTI-0004 | 2024-11-30T14:24:01 |
| ARTI-0005 | ARTI-0005 | ARTI-0004 | 2023-01-14T09:06:44 |
| ARTI-0006 | ARTI-0006 | ARTI-0004 | 2023-02-15T12:01:42 |

**t_annotation_classifies_artifact_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0002 | Dimension Kind 01 |
| ARTI-0002 | ARTI-0001 | ARTI-0008 | Encoding 02 |
| ARTI-0003 | ARTI-0001 | ARTI-0009 | pre-release note |
| ARTI-0004 | ARTI-0001 | ARTI-0010 | ja |
| ARTI-0005 | ARTI-0001 | ARTI-0003 | automated |
| ARTI-0006 | ARTI-0001 | ARTI-0006 | ratio |
| ARTI-0007 | ARTI-0002 | ARTI-0002 | Dimension Kind 07 |
| ARTI-0008 | ARTI-0002 | ARTI-0008 | Encoding 08 |

**t_directive_union_constraint_or_policy**

| id | directive | directive_2 | directive_3 |
| --- | --- | --- | --- |
| POLI-0001 | Compliance Validation Spec | Retention Duration Rule | Sensor Calibration Directive |
| POLI-0002 | Refresh Cycle Rule | Retention Duration Rule | Batch Size Constraint |
| POLI-0003 | Lab Assay Protocol | pH Range Specification | Telemetry Sampling Rule |
| POLI-0004 | Access Control Policy | Logging Level Directive | Calibration Frequency Spec |
| POLI-0005 | Access Control Policy | Retention Duration Rule | Integrity Check Requirement |
| POLI-0006 | Calibration Frequency Spec | Access Control Policy | Sampling Interval Rule |
| POLI-0007 | Data Quality Standard | Validation Check | Audit Log Requirement |

**t_directive_union_constraint_or_policy_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| POLI-0001 | effective_date | xsd:date |
| POLI-0002 | enforcement | xsd:string |
| POLI-0003 | mandatory | xsd:boolean |
| POLI-0004 | priority | xsd:integer |
| POLI-0005 | review_cycle_days | xsd:integer |
| POLI-0006 | scope | xsd:string |
| POLI-0007 | encoding | xsd:string |
| POLI-0008 | label_text | xsd:string |

**t_directive_union_constraint_or_policy_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0004 | 3 |
| POLI-0002 | POLI-0001 | POLI-0005 | 17 |
| POLI-0003 | POLI-0002 | POLI-0004 | 5 |
| POLI-0004 | POLI-0002 | POLI-0005 | 854 |
| POLI-0005 | POLI-0003 | POLI-0004 | 1 |
| POLI-0006 | POLI-0003 | POLI-0005 | 61 |
| POLI-0007 | POLI-0004 | POLI-0004 | 4 |
| POLI-0008 | POLI-0004 | POLI-0005 | 65 |

**t_directive_union_constraint_or_policy_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0007 | Encoding 01 |
| POLI-0002 | POLI-0001 | POLI-0002 | Enforcement 02 |
| POLI-0003 | POLI-0001 | POLI-0008 | change rationale |
| POLI-0004 | POLI-0001 | POLI-0009 | fr |
| POLI-0005 | POLI-0001 | POLI-0006 | Scope 05 |
| POLI-0006 | POLI-0002 | POLI-0007 | Encoding 06 |
| POLI-0007 | POLI-0002 | POLI-0002 | Enforcement 07 |
| POLI-0008 | POLI-0002 | POLI-0008 | calibration record |

Attributes are the named properties through which entities acquire descriptive and quantitative detail. Each attribute carries a name—confidence, dimension_kind, method, recorded_at for artifacts; effective_date, enforcement, mandatory, priority for directives—and a declared type that constrains the shape of its values. The type system is explicit and schema-driven: confidence is an xsd:decimal, recorded_at is an xsd:dateTime, mandatory is an xsd:boolean, and priority is an xsd:integer. This typed discipline ensures that a value such as 765.80 is never conflated with a string like "Encoding 02" or a date like 2024-10-31, even when all three belong to the same entity. The separation of attribute definitions from their value assignments allows the schema to evolve independently of the data it describes.

Value storage is partitioned by type to preserve precision and enable efficient querying. Decimal attributes such as confidence and dimension_kind resolve to values like 0.727, 266.33, and 765.80, each stored in a dedicated decimal value table keyed by the entity and the attribute it qualifies. String-valued attributes—dimension_kind, method, encoding schemes, and free-text annotations like "pre-release note" or "change rationale"—are held in varchar value tables, with locale codes such as ja and fr appearing alongside descriptive labels. Boolean attributes capture mandatory enforcement flags, where a value of true indicates a directive is compulsory and false signals an optional or advisory posture. Date and datetime attributes record temporal boundaries: effective dates for policies span from 2023-02-17 through 2024-11-24, while recorded timestamps for artifacts capture moments as precise as 2024-06-29T04:58:51. Integer attributes hold numeric measures such as a priority level of 3 or a batch size constraint of 854.

Categories provide the classification layer that groups entities into meaningful domains. The in_syscall_subsystem dimension, for example, assigns each subsystem entry a category—In Syscall Subsystem Category 01 through Category 04—alongside a human-readable label such as In Syscall Subsystem Label 01. This categorical tagging enables aggregation and filtering at the domain level without requiring analysts to reason about individual identifiers. A directive like the Compliance Validation Spec (POLI-0001) may carry a Retention Duration Rule and a Sensor Calibration Directive, while another directive, Access Control Policy (POLI-0004), carries a Logging Level Directive and a Calibration Frequency Spec. The category structure sits above these directive-level details, providing a coarser-grained lens for governance reporting.

**dim_in_syscall_subsystem**

| id | in_syscall_subsystem_label | in_syscall_subsystem_category |
| --- | --- | --- |
| SYSC-0001 | In Syscall Subsystem Label 01 | In Syscall Subsystem Category 01 |
| SYSC-0002 | In Syscall Subsystem Label 02 | In Syscall Subsystem Category 02 |
| SYSC-0003 | In Syscall Subsystem Label 03 | In Syscall Subsystem Category 03 |
| SYSC-0004 | In Syscall Subsystem Label 04 | In Syscall Subsystem Category 04 |
| SYSC-0005 | In Syscall Subsystem Label 05 | In Syscall Subsystem Category 05 |
| SYSC-0006 | In Syscall Subsystem Label 06 | In Syscall Subsystem Category 06 |

Event count is the analytical measure that transforms categorical and attribute-rich entities into quantifiable facts. The fact table for syscall subsystems records how many events each subsystem has generated: SYSC-0001 reports 238 events, SYSC-0002 reports 52, SYSC-0003 reports 198, and SYSC-0004 reports 382. These counts are the leaf-level metrics that feed dashboards, alerting thresholds, and compliance audits. The foreign key from the fact table back to the dimension table (in_syscall_subsystem) ensures that every event count can be traced to its categorical context and label, closing the loop between raw measurement and governed classification.

**fact_syscall**

| id | in_syscall_subsystem_key | event_count |
| --- | --- | --- |
| SYSC-0001 | SYSC-0004 | 238 |
| SYSC-0002 | SYSC-0002 | 52 |
| SYSC-0003 | SYSC-0003 | 198 |
| SYSC-0004 | SYSC-0005 | 382 |
| SYSC-0005 | SYSC-0002 | 283 |
| SYSC-0006 | SYSC-0001 | 288 |

Miscellaneous string values fill the gaps that typed attributes cannot capture. Free-form annotations such as "Source Verified," "PII Redacted," "PII Sensitive," and "Deprecated" provide human-readable status markers on artifacts. Encoding identifiers like "Encoding 01" and "Encoding 02" appear alongside locale codes and pre-release notes, serving as operational metadata that does not fit neatly into the decimal, boolean, or date buckets. These miscellaneous values are essential for conveying qualitative state—whether an artifact is deprecated, whether a policy rationale has been documented in French (fr)—without imposing rigid type constraints that would hinder practical governance workflows.

**t_annotation_classifies_artifact_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0001 | 0.727 |
| ARTI-0002 | ARTI-0001 | ARTI-0005 | 765.80 |
| ARTI-0003 | ARTI-0001 | ARTI-0007 | 266.33 |
| ARTI-0004 | ARTI-0002 | ARTI-0001 | 0.091 |
| ARTI-0005 | ARTI-0002 | ARTI-0005 | 761.16 |
| ARTI-0006 | ARTI-0002 | ARTI-0007 | 564.24 |
| ARTI-0007 | ARTI-0003 | ARTI-0001 | 0.118 |
| ARTI-0008 | ARTI-0003 | ARTI-0005 | 599.96 |

**t_directive_union_constraint_or_policy_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0003 | true |
| POLI-0002 | POLI-0002 | POLI-0003 | true |
| POLI-0003 | POLI-0003 | POLI-0003 | true |
| POLI-0004 | POLI-0004 | POLI-0003 | false |
| POLI-0005 | POLI-0005 | POLI-0003 | true |
| POLI-0006 | POLI-0006 | POLI-0003 | true |
| POLI-0007 | POLI-0007 | POLI-0003 | false |

**t_directive_union_constraint_or_policy_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0001 | 2024-10-31 |
| POLI-0002 | POLI-0002 | POLI-0001 | 2024-11-24 |
| POLI-0003 | POLI-0003 | POLI-0001 | 2023-02-17 |
| POLI-0004 | POLI-0004 | POLI-0001 | 2024-05-10 |
| POLI-0005 | POLI-0005 | POLI-0001 | 2025-01-01 |
| POLI-0006 | POLI-0006 | POLI-0001 | 2024-10-28 |
| POLI-0007 | POLI-0007 | POLI-0001 | 2023-09-29 |