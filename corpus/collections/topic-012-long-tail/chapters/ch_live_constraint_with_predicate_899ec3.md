---
chapter_id: ch_live_constraint_with_predicate_899ec3
topic_id: 12
family: 03_directive_governance
cited_terms: ['constraint_with_predicate', 'labrun_produces_measurement', 'control_with_classification_tier']
model: engine-refine
---

Operational governance relies on precise tracking of execution lifecycles, where each labrun is anchored by a unique identifier that serves as the primary reference point for audit trails and performance analysis. The execution record captures critical telemetry such as duration seconds, which quantifies the elapsed time for a given run, and exit values that signal termination states—codes like 122 or 691 typically denote resource exhaustion or policy violations, whereas a code of 3 may indicate a controlled shutdown. When failures occur, the retry count measures the number of recovery attempts before final termination, with observed values ranging from 12 to 265, reflecting varying degrees of transient instability. These metrics are contextualized through a category designation that groups runs into distinct operational bands, ensuring that performance baselines can be established and compared across homogeneous workloads.

**fact_labrun**

| id | labrun_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| MEAS-0001 | MEAS-0002 | 4856.18 | 122 | 265 |
| MEAS-0002 | MEAS-0006 | 4308.22 | 691 | 244 |
| MEAS-0003 | MEAS-0002 | 4764.89 | 566 | 106 |
| MEAS-0004 | MEAS-0005 | 5155.73 | 3 | 12 |
| MEAS-0005 | MEAS-0002 | 385.91 | 81 | 197 |

**dim_labrun**

| id | labrun_label | labrun_category |
| --- | --- | --- |
| MEAS-0001 | Labrun Label 01 | Labrun Category 01 |
| MEAS-0002 | Labrun Label 02 | Labrun Category 02 |
| MEAS-0003 | Labrun Label 03 | Labrun Category 03 |
| MEAS-0004 | Labrun Label 04 | Labrun Category 04 |
| MEAS-0005 | Labrun Label 05 | Labrun Category 05 |
| MEAS-0006 | Labrun Label 06 | Labrun Category 06 |

Beyond execution telemetry, compliance frameworks enforce behavioral boundaries through structured constraint-predicate mappings. Each constraint, such as a log retention mandate or a quality assurance protocol, is decomposed into technical predicates like authRequirement or checksumValidation, which dictate the exact enforcement mechanisms. The relational architecture binds these elements through a subject-target pairing, where the constraint identifier acts as the subject and the predicate identifier serves as the target. This linkage is further qualified by a role designation—owner, observer, or contributor—that assigns accountability and access granularity. Such role-based segmentation ensures that governance rules are not merely declarative but are operationally distributed across system components with clearly defined responsibilities.

**t_constraint_with_predicate**

| id | constraint |
| --- | --- |
| PRED-0001 | Log retention mandate |
| PRED-0002 | Quality assurance protocol |
| PRED-0003 | Authentication requirement |
| PRED-0004 | Max latency threshold |
| PRED-0005 | Access control directive |
| PRED-0006 | Max latency threshold |
| PRED-0007 | Data retention policy |
| PRED-0008 | Authentication requirement |

**t_constraint_with_predicate_predicate**

| id | predicate |
| --- | --- |
| PRED-0001 | authRequirement |
| PRED-0002 | authRequirement |
| PRED-0003 | unitSpecification |
| PRED-0004 | checksumValidation |
| PRED-0005 | targetDataset |
| PRED-0006 | formatRule |

**t_constraint_with_predicate__predicate**

| id | constraint_id | predicate_id | role |
| --- | --- | --- | --- |
| PRED-0001 | PRED-0003 | PRED-0001 | owner |
| PRED-0002 | PRED-0005 | PRED-0003 | observer |
| PRED-0003 | PRED-0004 | PRED-0002 | contributor |
| PRED-0004 | PRED-0007 | PRED-0001 | contributor |
| PRED-0005 | PRED-0008 | PRED-0001 | reviewer |
| PRED-0006 | PRED-0002 | PRED-0003 | reviewer |
| PRED-0007 | PRED-0006 | PRED-0002 | reviewer |
| PRED-0008 | PRED-0001 | PRED-0005 | observer |

Control classification extends this relational model by attaching typed attributes to specific entities, enabling granular policy configuration. Each control, whether it governs input sanitization, role-based access, encryption at rest, or session expiration, is associated with a set of attr whose names and attr type are strictly defined. Attribute types conform to standardized schemas, including xsd:date for temporal enforcement windows, xsd:boolean for mandatory flags, xsd:integer for priority rankings, and xsd:string for descriptive directives. The entity identifier anchors these attributes to concrete policy objects, ensuring that configuration changes are traceable to their originating control tier.

**t_control_with_classification_tier**

| id | control |
| --- | --- |
| TIER-0001 | Input sanitization |
| TIER-0002 | Role based access |
| TIER-0003 | Encryption at rest |
| TIER-0004 | Session expiration |
| TIER-0005 | Firewall rule set |
| TIER-0006 | Encryption at rest |

**t_control_with_classification_tier_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| TIER-0001 | effective_date | xsd:date |
| TIER-0002 | enforcement | xsd:string |
| TIER-0003 | mandatory | xsd:boolean |
| TIER-0004 | priority | xsd:integer |
| TIER-0005 | review_cycle_days | xsd:integer |
| TIER-0006 | scope | xsd:string |
| TIER-0007 | encoding | xsd:string |
| TIER-0008 | label_text | xsd:string |

**t_control_with_classification_tier_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0001 | TIER-0003 | false |
| TIER-0002 | TIER-0002 | TIER-0003 | true |
| TIER-0003 | TIER-0003 | TIER-0003 | true |
| TIER-0004 | TIER-0004 | TIER-0003 | true |
| TIER-0005 | TIER-0005 | TIER-0003 | true |
| TIER-0006 | TIER-0006 | TIER-0003 | false |

**t_control_with_classification_tier_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0001 | TIER-0001 | 2023-02-10 |
| TIER-0002 | TIER-0002 | TIER-0001 | 2023-09-02 |
| TIER-0003 | TIER-0003 | TIER-0001 | 2024-01-29 |
| TIER-0004 | TIER-0004 | TIER-0001 | 2024-02-25 |
| TIER-0005 | TIER-0005 | TIER-0001 | 2025-05-01 |
| TIER-0006 | TIER-0006 | TIER-0001 | 2023-03-16 |

**t_control_with_classification_tier_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0001 | TIER-0004 | 2 |
| TIER-0002 | TIER-0001 | TIER-0005 | 715 |
| TIER-0003 | TIER-0002 | TIER-0004 | 4 |
| TIER-0004 | TIER-0002 | TIER-0005 | 86 |
| TIER-0005 | TIER-0003 | TIER-0004 | 1 |
| TIER-0006 | TIER-0003 | TIER-0005 | 78 |
| TIER-0007 | TIER-0004 | TIER-0004 | 5 |
| TIER-0008 | TIER-0004 | TIER-0005 | 174 |

**t_control_with_classification_tier_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0001 | TIER-0007 | Encoding 01 |
| TIER-0002 | TIER-0001 | TIER-0002 | Enforcement 02 |
| TIER-0003 | TIER-0001 | TIER-0008 | audit excerpt |
| TIER-0004 | TIER-0001 | TIER-0009 | en |
| TIER-0005 | TIER-0001 | TIER-0006 | Scope 05 |
| TIER-0006 | TIER-0002 | TIER-0007 | Encoding 06 |
| TIER-0007 | TIER-0002 | TIER-0002 | Enforcement 07 |
| TIER-0008 | TIER-0002 | TIER-0008 | change rationale |

The actual configuration values are stored across specialized type-specific repositories, maintaining data integrity while supporting heterogeneous policy requirements. Boolean flags, date stamps, integer thresholds, and variable-length character strings are each persisted in dedicated value stores, with the misc field serving as the universal carrier for these heterogeneous payloads. For instance, an effective_date attribute might resolve to 2023-02-10 for one entity, while a priority integer registers as 715 for another, and a string directive could read as Enforcement 02 or audit excerpt. This typed value segregation prevents schema corruption, accelerates query performance, and allows compliance engines to evaluate heterogeneous policy parameters without runtime type coercion. Together, these interconnected structures form a deterministic governance fabric where identifiers, execution metrics, relational roles, and typed attributes converge to enforce auditable, repeatable operational standards.