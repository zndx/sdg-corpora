---
chapter_id: ch_live_artifact_not_revoked_18cd7d
topic_id: 2
family: 07_long_tail
cited_terms: ['artifact_not_revoked', 'belief_interval_subclass', 'constraint_evaluated_during']
model: engine-refine
---

The foundational architecture of this provenance framework rests upon a disciplined separation of identity, property, and value. Each entity—whether an artifact such as "audit-log-sept" or "compliance-report-x", a belief interval classified as "Sensor calibration drift" or "Model convergence state", or a constraint evaluated during a specific period like "Field Length Constraint", "Data Retention Policy", "Audit Log Requirement", or "Null Value Limit"—is assigned a unique identifier, conventionally prefixed to denote its domain: REVO-0001 through REVO-0004 for artifact records, INTE-0001 through INTE-0004 for belief intervals, and DURI-0001 through DURI-0004 for constraint evaluations. These identifiers function as the immutable anchors of the system, ensuring that every property assignment and value binding can be traced to a single, unambiguous referent. The prefix convention itself encodes semantic context, allowing auditors and automated systems to distinguish artifact provenance from belief-state tracking and constraint enforcement without ambiguity.

**t_artifact_not_revoked**

| id | artifact | artifact_2 |
| --- | --- | --- |
| REVO-0001 | audit-log-sept | backup-manifest-9 |
| REVO-0002 | compliance-report-x | inference-pipeline-3 |
| REVO-0003 | schema-def-current | backup-manifest-9 |
| REVO-0004 | dataset-sanitized | runtime-env-prod |
| REVO-0005 | audit-log-sept | backup-manifest-9 |
| REVO-0006 | compliance-report-x | staging-logs-v2 |

**t_belief_interval_subclass**

| id | belief |
| --- | --- |
| INTE-0001 | Sensor calibration drift |
| INTE-0002 | Model convergence state |
| INTE-0003 | Model convergence state |
| INTE-0004 | Sensor calibration drift |
| INTE-0005 | Data ingestion rate |
| INTE-0006 | Reagent shelf life |

**t_constraint_evaluated_during**

| id | constraint | evaluated_during |
| --- | --- | --- |
| DURI-0001 | Field Length Constraint | INTE-0006 |
| DURI-0002 | Data Retention Policy | INTE-0004 |
| DURI-0003 | Audit Log Requirement | INTE-0002 |
| DURI-0004 | Null Value Limit | INTE-0006 |
| DURI-0005 | Data Retention Policy | INTE-0001 |
| DURI-0006 | Data Retention Policy | INTE-0001 |

**t_constraint_evaluated_during_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| DURI-0001 | effective_date | xsd:date |
| DURI-0002 | enforcement | xsd:string |
| DURI-0003 | mandatory | xsd:boolean |
| DURI-0004 | priority | xsd:integer |
| DURI-0005 | review_cycle_days | xsd:integer |
| DURI-0006 | scope | xsd:string |
| DURI-0007 | encoding | xsd:string |
| DURI-0008 | label_text | xsd:string |

**t_constraint_evaluated_during_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DURI-0001 | DURI-0001 | DURI-0003 | false |
| DURI-0002 | DURI-0002 | DURI-0003 | false |
| DURI-0003 | DURI-0003 | DURI-0003 | false |
| DURI-0004 | DURI-0004 | DURI-0003 | true |
| DURI-0005 | DURI-0005 | DURI-0003 | true |
| DURI-0006 | DURI-0006 | DURI-0003 | true |

**t_constraint_evaluated_during_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DURI-0001 | DURI-0001 | DURI-0001 | 2024-01-04 |
| DURI-0002 | DURI-0002 | DURI-0001 | 2025-03-02 |
| DURI-0003 | DURI-0003 | DURI-0001 | 2023-10-02 |
| DURI-0004 | DURI-0004 | DURI-0001 | 2023-03-04 |
| DURI-0005 | DURI-0005 | DURI-0001 | 2023-08-27 |
| DURI-0006 | DURI-0006 | DURI-0001 | 2023-09-26 |

**t_constraint_evaluated_during_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DURI-0001 | DURI-0001 | DURI-0004 | 2 |
| DURI-0002 | DURI-0001 | DURI-0005 | 590 |
| DURI-0003 | DURI-0002 | DURI-0004 | 2 |
| DURI-0004 | DURI-0002 | DURI-0005 | 52 |
| DURI-0005 | DURI-0003 | DURI-0004 | 1 |
| DURI-0006 | DURI-0003 | DURI-0005 | 88 |
| DURI-0007 | DURI-0004 | DURI-0004 | 5 |
| DURI-0008 | DURI-0004 | DURI-0005 | 829 |

**t_constraint_evaluated_during_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DURI-0001 | DURI-0001 | DURI-0007 | Encoding 01 |
| DURI-0002 | DURI-0001 | DURI-0002 | Enforcement 02 |
| DURI-0003 | DURI-0001 | DURI-0008 | pre-release note |
| DURI-0004 | DURI-0001 | DURI-0009 | en |
| DURI-0005 | DURI-0001 | DURI-0006 | Scope 05 |
| DURI-0006 | DURI-0002 | DURI-0007 | Encoding 06 |
| DURI-0007 | DURI-0002 | DURI-0002 | Enforcement 07 |
| DURI-0008 | DURI-0002 | DURI-0008 | audit excerpt |

Attributes define the dimensional space within which entities are described, each attribute carrying a type that constrains the permissible form of its values. The attribute registry captures names such as "checksum", "created_date", "identifier", and "license" alongside their corresponding type declarations—xsd:string, xsd:date, cco:DesignativeICE—establishing a schema that governs data integrity at the point of insertion. This type discipline is enforced through a value partitioning strategy: date-valued attributes are stored in dedicated value tables with entries such as 2024-01-18, 2023-09-26, 2023-01-26, and 2024-08-03; integer-valued attributes through entries like 140, 2, and 115; string-valued attributes through entries including the checksum "c0ffee42", the reference "ref-8842", the license designation "Apache-2.0", and the rack identifier "rack-7"; and boolean-valued attributes through explicit true and false designations. The constraint evaluation domain further demonstrates this pattern, with effective dates such as 2024-01-04 and 2025-03-02, enforcement priorities recorded as 590 and 52, and mandatory flags set to either true or false.

The relationship between entities is mediated through a subject-target-role triad that captures the directional semantics of provenance links. In the belief interval subsystem, for instance, belief records and their lower-bound specifications are connected through association entries where the subject field references a belief identifier such as INTE-0004 or INTE-0001, the target field references a lower-bound identifier such as INTE-0008 or INTE-0002, and the role field specifies the nature of the connection—designated as either "contributor" or "owner". This tripartite structure enables the representation of complex provenance graphs where the same entity may participate in multiple relationships with different roles, and where the semantic weight of a connection is encoded in the role designation rather than in the structural form of the link itself. The lower bounds themselves carry substantive meaning: "0.85 probability", "Three sigma limit", "ISO ninety eight", and "95 percent threshold" are not arbitrary labels but domain-specific thresholds that define the operational boundaries of belief intervals.

**t_belief_interval_subclass_belief_lower_bound**

| id | belief_lower_bound |
| --- | --- |
| INTE-0001 | 0.85 probability |
| INTE-0002 | Three sigma limit |
| INTE-0003 | ISO ninety eight |
| INTE-0004 | 95 percent threshold |
| INTE-0005 | 99.9 percent uptime |
| INTE-0006 | 0.85 probability |
| INTE-0007 | 128 megabytes |
| INTE-0008 | 256 units |

**t_belief_interval_subclass__belief_lower_bound**

| id | belief_id | belief_lower_bound_id | role |
| --- | --- | --- | --- |
| INTE-0001 | INTE-0004 | INTE-0008 | contributor |
| INTE-0002 | INTE-0005 | INTE-0006 | owner |
| INTE-0003 | INTE-0001 | INTE-0002 | contributor |
| INTE-0004 | INTE-0002 | INTE-0008 | owner |
| INTE-0005 | INTE-0006 | INTE-0001 | contributor |
| INTE-0006 | INTE-0002 | INTE-0008 | reviewer |
| INTE-0007 | INTE-0001 | INTE-0006 | owner |
| INTE-0008 | INTE-0005 | INTE-0007 | contributor |

Artifact relationships extend this model through paired artifact references, where each artifact record associates a primary artifact with a secondary artifact—linking "audit-log-sept" to "backup-manifest-9", "compliance-report-x" to "inference-pipeline-3", "schema-def-current" to "backup-manifest-9", and "dataset-sanitized" to "runtime-env-prod". These pairings establish a chain of custody that can be traversed to reconstruct the lineage of any given artifact, with the identifier serving as the join key across all attribute and value tables. The multi-table value storage pattern—where date, integer, string, and boolean values are segregated into distinct tables but unified through the entity_id and attr_id foreign keys—ensures type safety while maintaining a consistent query surface. An auditor querying for the created_date of artifact REVO-0001 would traverse from the artifact identifier to its attribute definition, then to the date value table, retrieving the specific value 2024-01-18 through a sequence of well-defined joins.

**t_artifact_not_revoked_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| REVO-0001 | checksum | xsd:string |
| REVO-0002 | created_date | xsd:date |
| REVO-0003 | identifier | cco:DesignativeICE |
| REVO-0004 | license | xsd:string |
| REVO-0005 | mime_type | xsd:string |
| REVO-0006 | size_bytes | xsd:long |
| REVO-0007 | uri | xsd:string |
| REVO-0008 | version | xsd:integer |

**t_artifact_not_revoked_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REVO-0001 | REVO-0001 | REVO-0002 | 2024-01-18 |
| REVO-0002 | REVO-0002 | REVO-0002 | 2023-09-26 |
| REVO-0003 | REVO-0003 | REVO-0002 | 2023-01-26 |
| REVO-0004 | REVO-0004 | REVO-0002 | 2024-08-03 |
| REVO-0005 | REVO-0005 | REVO-0002 | 2024-04-14 |
| REVO-0006 | REVO-0006 | REVO-0002 | 2023-07-20 |

**t_artifact_not_revoked_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REVO-0001 | REVO-0001 | REVO-0006 | 140 |
| REVO-0002 | REVO-0001 | REVO-0008 | 2 |
| REVO-0003 | REVO-0002 | REVO-0006 | 115 |
| REVO-0004 | REVO-0002 | REVO-0008 | 2 |
| REVO-0005 | REVO-0003 | REVO-0006 | 293 |
| REVO-0006 | REVO-0003 | REVO-0008 | 12 |
| REVO-0007 | REVO-0004 | REVO-0006 | 361 |
| REVO-0008 | REVO-0004 | REVO-0008 | 1 |

**t_artifact_not_revoked_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REVO-0001 | REVO-0001 | REVO-0001 | c0ffee42 |
| REVO-0002 | REVO-0001 | REVO-0003 | ref-8842 |
| REVO-0003 | REVO-0001 | REVO-0004 | Apache-2.0 |
| REVO-0004 | REVO-0001 | REVO-0009 | rack-7 |
| REVO-0005 | REVO-0001 | REVO-0005 | text/plain |
| REVO-0006 | REVO-0001 | REVO-0010 | Name 06 |
| REVO-0007 | REVO-0001 | REVO-0011 | analytics |
| REVO-0008 | REVO-0001 | REVO-0012 | Tags 08 |

This architecture reflects a deliberate design philosophy: identity is immutable, attributes are typed and enumerable, values are type-constrained and partitioned, and relationships are explicit and role-bearing. The result is a provenance system where every datum can be independently verified, where the type of a value is guaranteed by the schema rather than enforced at query time, and where the semantic relationships between entities are captured as first-class data rather than implicit structural conventions. The constraint evaluation domain reinforces this discipline, with each constraint record carrying its own set of typed attributes—effective dates, enforcement levels, mandatory flags, and priority scores—allowing the system to track not only what artifacts exist and how they relate, but also which governance rules apply to them and under what conditions.