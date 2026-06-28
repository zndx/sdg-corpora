---
chapter_id: ch_live_soc2_availability_subclass_1d8426
topic_id: 34
family: 07_long_tail
cited_terms: ['soc2_availability_subclass', 'control_with_classification_tier', 'transformation_ends_at']
model: engine-refine
---

Within compliance frameworks, identifiers serve as the immutable anchors that bind every attribute, value, and relationship to a specific control or assessment. Each SOC 2 availability subclass—such as the SOC 3 Public Report (AVAI-0001), the SOC 2 Privacy Assessment (AVAI-0002), the SOC 2 Type I Assessment (AVAI-0003), and the SOC 1 Financial Audit (AVAI-0004)—receives a unique identifier that propagates through every dependent record. Similarly, control tiers like Input sanitization (TIER-0001), Role based access (TIER-0002), Encryption at rest (TIER-0003), and Session expiration (TIER-0004) are independently keyed, ensuring that attribute assignments remain unambiguous across the framework. These identifiers are not merely labels; they are the join keys that connect classification metadata to typed value stores, enabling auditors to trace a single assessment or control from its high-level description down to every granular property.

**t_soc2_availability_subclass**

| id | soc | for_s_o_c2_domain |
| --- | --- | --- |
| AVAI-0001 | SOC 3 Public Report | TIER-0006 |
| AVAI-0002 | SOC 2 Privacy Assessment | TIER-0004 |
| AVAI-0003 | SOC 2 Type I Assessment | TIER-0004 |
| AVAI-0004 | SOC 1 Financial Audit | TIER-0001 |
| AVAI-0005 | SOC 2 Type I Assessment | TIER-0001 |
| AVAI-0006 | SOC 1 Type I Report | TIER-0001 |
| AVAI-0007 | SOC 2 Privacy Assessment | TIER-0003 |

**t_soc2_availability_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| AVAI-0001 | effective_date | xsd:date |
| AVAI-0002 | enforcement | xsd:string |
| AVAI-0003 | mandatory | xsd:boolean |
| AVAI-0004 | priority | xsd:integer |
| AVAI-0005 | review_cycle_days | xsd:integer |
| AVAI-0006 | scope | xsd:string |
| AVAI-0007 | encoding | xsd:string |
| AVAI-0008 | label_text | xsd:string |

**t_soc2_availability_subclass_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AVAI-0001 | AVAI-0001 | AVAI-0003 | true |
| AVAI-0002 | AVAI-0002 | AVAI-0003 | true |
| AVAI-0003 | AVAI-0003 | AVAI-0003 | false |
| AVAI-0004 | AVAI-0004 | AVAI-0003 | false |
| AVAI-0005 | AVAI-0005 | AVAI-0003 | false |
| AVAI-0006 | AVAI-0006 | AVAI-0003 | true |
| AVAI-0007 | AVAI-0007 | AVAI-0003 | false |

**t_soc2_availability_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AVAI-0001 | AVAI-0001 | AVAI-0001 | 2024-07-01 |
| AVAI-0002 | AVAI-0002 | AVAI-0001 | 2024-03-01 |
| AVAI-0003 | AVAI-0003 | AVAI-0001 | 2023-09-25 |
| AVAI-0004 | AVAI-0004 | AVAI-0001 | 2024-01-04 |
| AVAI-0005 | AVAI-0005 | AVAI-0001 | 2023-04-30 |
| AVAI-0006 | AVAI-0006 | AVAI-0001 | 2024-05-11 |
| AVAI-0007 | AVAI-0007 | AVAI-0001 | 2023-07-31 |

**t_soc2_availability_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AVAI-0001 | AVAI-0001 | AVAI-0004 | 5 |
| AVAI-0002 | AVAI-0001 | AVAI-0005 | 378 |
| AVAI-0003 | AVAI-0002 | AVAI-0004 | 4 |
| AVAI-0004 | AVAI-0002 | AVAI-0005 | 753 |
| AVAI-0005 | AVAI-0003 | AVAI-0004 | 1 |
| AVAI-0006 | AVAI-0003 | AVAI-0005 | 952 |
| AVAI-0007 | AVAI-0004 | AVAI-0004 | 1 |
| AVAI-0008 | AVAI-0004 | AVAI-0005 | 575 |

**t_soc2_availability_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AVAI-0001 | AVAI-0001 | AVAI-0007 | Encoding 01 |
| AVAI-0002 | AVAI-0001 | AVAI-0002 | Enforcement 02 |
| AVAI-0003 | AVAI-0001 | AVAI-0008 | nightly summary |
| AVAI-0004 | AVAI-0001 | AVAI-0009 | fr |
| AVAI-0005 | AVAI-0001 | AVAI-0006 | Scope 05 |
| AVAI-0006 | AVAI-0002 | AVAI-0007 | Encoding 06 |
| AVAI-0007 | AVAI-0002 | AVAI-0002 | Enforcement 07 |
| AVAI-0008 | AVAI-0002 | AVAI-0008 | pre-release note |

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

Attributes define the dimensions along which each entity is evaluated, and their types enforce data integrity at the schema level. The attribute catalog includes effective_date (xsd:date), enforcement (xsd:string), mandatory (xsd:boolean), and priority (xsd:integer), among others such as AVAI-0007, AVAI-0008, and AVAI-0009. By separating attribute definitions from their values, the framework supports extensibility: new attributes can be introduced without restructuring existing records. The type system—spanning dates, strings, booleans, and integers—ensures that each value is validated against its declared schema, preventing type mismatches that could corrupt compliance evidence. For instance, the mandatory flag for AVAI-0001 through AVAI-0004 is stored as a boolean, with values of true for the first two assessments and false for the latter two, reflecting differing regulatory obligations across SOC report types.

Entity records materialize attributes as concrete values through a normalized value-store pattern. Each entity_id references a specific assessment or control, while attr_id points to the attribute definition, and the value column holds the misc data in its appropriate type-specific table. A single entity can carry multiple attributes: AVAI-0001, for example, has an effective_date of 2024-07-01, a mandatory flag of true, a priority of 5, and a varchar value of Encoding 01. The same entity also carries a secondary integer value of 378 under attribute AVAI-0005, demonstrating that entities are not limited to a single attribute per type. This design allows compliance teams to attach heterogeneous metadata—dates for policy effective periods, integers for risk scores, strings for enforcement descriptions—without conflating data types or sacrificing query performance.

Operational transformations are tracked through log levels and retry counts, providing an audit trail for the processes that populate and maintain compliance data. The transformation registry records entries such as the ETL pipeline run (ENDS-0001), which ended at 2024-02-28T16:45:12Z with a log level of info and a retry count of 210, and the Feature engineering routine (ENDS-0002), which logged a critical severity and required 216 retries before completion. Higher retry counts—such as the 446 retries for the Schema migration script (ENDS-0004) or the 307 retries for the Telemetry normalization pass (ENDS-0003)—signal systemic instability that warrants investigation. Log levels ranging from info through warning to critical enable tiered alerting, ensuring that operators can distinguish routine processing from failures that threaten data integrity or compliance reporting deadlines.

**t_transformation_ends_at**

| id | transformation | ended_at_time | log_level | retry_count |
| --- | --- | --- | --- | --- |
| ENDS-0001 | ETL pipeline run | 2024-02-28T16:45:12Z | info | 210 |
| ENDS-0002 | Feature engineering routine | 2024-05-17T07:30:00Z | critical | 216 |
| ENDS-0003 | Telemetry normalization pass | 2024-02-28T16:45:12Z | warning | 307 |
| ENDS-0004 | Schema migration script | 2024-04-09T11:15:30Z | warning | 446 |
| ENDS-0005 | Audit record sync | 2024-03-15T14:22:01Z | info | 371 |
| ENDS-0006 | Schema migration script | 2024-05-17T07:30:00Z | info | 187 |
| ENDS-0007 | Data reconciliation workflow | 2023-09-30T23:59:59Z | error | 426 |
| ENDS-0008 | ETL pipeline run | 2024-01-22T18:10:55Z | warning | 196 |