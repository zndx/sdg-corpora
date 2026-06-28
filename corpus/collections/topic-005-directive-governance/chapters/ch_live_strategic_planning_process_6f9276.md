---
chapter_id: ch_live_strategic_planning_process_6f9276
topic_id: 5
family: 08_derived
cited_terms: ['strategic_planning_process', 'soc2_security_subclass', 'lift_with_baseline_rate']
model: engine-refine
---

Strategic planning events are captured as discrete records, each identified by a unique identifier such as PROC-0001 through PROC-0004, and quantified by an event count that reflects the volume of activity associated with that planning instance—values ranging from 123 to 388 illustrate the variance in operational intensity across different planning cycles. Each event is anchored to a business division through a foreign-key reference, linking the fact record to a dimension that classifies the division by both a human-readable label and a categorical taxonomy. The division dimension, for instance, assigns labels such as Targets Business Division Label 01 alongside corresponding categories like Targets Business Division Category 01, enabling downstream reporting to aggregate by either the descriptive name or the structural grouping depending on the analytical lens. Similarly, every planning event produces a planning artifact, a relationship mediated by a second foreign key that points to a dimension table where each artifact is described by a label—Produces Planning Artifact Label 01, for example—and assigned to a category such as Produces Planning Artifact Category 01. This dual-dimension design ensures that strategic events can be sliced by both the originating business unit and the type of output generated, supporting governance queries that trace accountability from planning activity through to deliverable classification.

**fact_strategic**

| id | targets_business_division_key | produces_planning_artifact_key | event_count |
| --- | --- | --- | --- |
| PROC-0001 | PROC-0005 | PROC-0005 | 388 |
| PROC-0002 | PROC-0001 | PROC-0002 | 352 |
| PROC-0003 | PROC-0005 | PROC-0002 | 320 |
| PROC-0004 | PROC-0001 | PROC-0001 | 123 |
| PROC-0005 | PROC-0003 | PROC-0003 | 268 |
| PROC-0006 | PROC-0005 | PROC-0004 | 27 |
| PROC-0007 | PROC-0001 | PROC-0004 | 70 |

**dim_targets_business_division**

| id | targets_business_division_label | targets_business_division_category |
| --- | --- | --- |
| PROC-0001 | Targets Business Division Label 01 | Targets Business Division Category 01 |
| PROC-0002 | Targets Business Division Label 02 | Targets Business Division Category 02 |
| PROC-0003 | Targets Business Division Label 03 | Targets Business Division Category 03 |
| PROC-0004 | Targets Business Division Label 04 | Targets Business Division Category 04 |
| PROC-0005 | Targets Business Division Label 05 | Targets Business Division Category 05 |
| PROC-0006 | Targets Business Division Label 06 | Targets Business Division Category 06 |
| PROC-0007 | Targets Business Division Label 07 | Targets Business Division Category 07 |
| PROC-0008 | Targets Business Division Label 08 | Targets Business Division Category 08 |

**dim_produces_planning_artifact**

| id | produces_planning_artifact_label | produces_planning_artifact_category |
| --- | --- | --- |
| PROC-0001 | Produces Planning Artifact Label 01 | Produces Planning Artifact Category 01 |
| PROC-0002 | Produces Planning Artifact Label 02 | Produces Planning Artifact Category 02 |
| PROC-0003 | Produces Planning Artifact Label 03 | Produces Planning Artifact Category 03 |
| PROC-0004 | Produces Planning Artifact Label 04 | Produces Planning Artifact Category 04 |
| PROC-0005 | Produces Planning Artifact Label 05 | Produces Planning Artifact Category 05 |
| PROC-0006 | Produces Planning Artifact Label 06 | Produces Planning Artifact Category 06 |

The attribute-value architecture that underpins the security and performance domains follows a parallel but more granular pattern. Rather than embedding attributes as fixed columns, the model defines attributes as first-class entities with a name and a type—effective_date typed as xsd:date, enforcement as xsd:string, mandatory as xsd:boolean, and priority as xsd:integer—each registered in an attribute definition table. These definitions are then instantiated against entities, which serve as the concrete instances to which attributes are bound. A security subclass entity, identified by a code such as SECU-0001 and classified under a SOC designation like SOC2-CloudInfra or SOC2-Fintech, acquires its attribute values through a set of type-specialized value tables. Boolean attributes resolve to true or false in the value table, date attributes carry ISO-formatted dates such as 2023-08-15 or 2025-05-01, integer attributes store numeric measures like 5 or 926, and string attributes hold free-form content including Encoding 01 or audit excerpt. This normalization by data type eliminates the need for nullable columns and enforces schema discipline at the value layer, while the entity_id foreign key ensures that every value can be traced back to the exact entity and attribute it qualifies.

**t_soc2_security_subclass_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SECU-0001 | SECU-0001 | SECU-0003 | true |
| SECU-0002 | SECU-0002 | SECU-0003 | false |
| SECU-0003 | SECU-0003 | SECU-0003 | true |
| SECU-0004 | SECU-0004 | SECU-0003 | false |
| SECU-0005 | SECU-0005 | SECU-0003 | false |
| SECU-0006 | SECU-0006 | SECU-0003 | false |
| SECU-0007 | SECU-0007 | SECU-0003 | false |

**t_soc2_security_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SECU-0001 | SECU-0001 | SECU-0001 | 2023-08-15 |
| SECU-0002 | SECU-0002 | SECU-0001 | 2024-04-12 |
| SECU-0003 | SECU-0003 | SECU-0001 | 2024-01-26 |
| SECU-0004 | SECU-0004 | SECU-0001 | 2025-05-01 |
| SECU-0005 | SECU-0005 | SECU-0001 | 2023-05-03 |
| SECU-0006 | SECU-0006 | SECU-0001 | 2025-05-11 |
| SECU-0007 | SECU-0007 | SECU-0001 | 2024-10-21 |

Performance measurements employ the same attribute-value pattern but with a different attribute vocabulary and type distribution. Lift records—identified as RATE-0001 through RATE-0004 and labeled with descriptors such as Conversion Gain, Latency Peak Reduction, and Click Through Uplift—are associated with baseline security entities through a foreign key and enriched with attributes like confidence (xsd:decimal), dimension_kind (xsd:string), method (xsd:string), and recorded_at (xsd:dateTime). Decimal values such as 0.799 or 559.38 capture precision-sensitive metrics, while datetime values like 2024-01-14T18:32:00 provide temporal anchoring for when each measurement was recorded. String values in this domain include Dimension Kind 01 and pre-release note, demonstrating that the varchar value table accommodates both structured codes and narrative annotations within the same column. The cross-referencing between lift records and security subclasses—where a SOC2-CloudInfra entity rated RATE-0001 might carry a confidence of 0.799 recorded at a specific timestamp—creates a traceable chain from raw measurement through attribute binding to the security control it evaluates.

**t_soc2_security_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SECU-0001 | SECU-0001 | SECU-0007 | Encoding 01 |
| SECU-0002 | SECU-0001 | SECU-0002 | Enforcement 02 |
| SECU-0003 | SECU-0001 | SECU-0008 | audit excerpt |
| SECU-0004 | SECU-0001 | SECU-0009 | de |
| SECU-0005 | SECU-0001 | SECU-0006 | Scope 05 |
| SECU-0006 | SECU-0002 | SECU-0007 | Encoding 06 |
| SECU-0007 | SECU-0002 | SECU-0002 | Enforcement 07 |
| SECU-0008 | SECU-0002 | SECU-0008 | audit excerpt |

**t_lift_with_baseline_rate_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RATE-0001 | RATE-0001 | RATE-0004 | 2024-01-14T18:32:00 |
| RATE-0002 | RATE-0002 | RATE-0004 | 2023-02-02T03:32:58 |
| RATE-0003 | RATE-0003 | RATE-0004 | 2024-08-11T22:28:18 |
| RATE-0004 | RATE-0004 | RATE-0004 | 2024-10-19T09:19:40 |
| RATE-0005 | RATE-0005 | RATE-0004 | 2023-07-24T08:45:17 |
| RATE-0006 | RATE-0006 | RATE-0004 | 2025-03-24T11:20:59 |

**t_lift_with_baseline_rate_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RATE-0001 | RATE-0001 | RATE-0001 | 0.799 |
| RATE-0002 | RATE-0001 | RATE-0005 | 559.38 |
| RATE-0003 | RATE-0001 | RATE-0007 | 634.64 |
| RATE-0004 | RATE-0002 | RATE-0001 | 0.522 |
| RATE-0005 | RATE-0002 | RATE-0005 | 254.23 |
| RATE-0006 | RATE-0002 | RATE-0007 | 594.57 |
| RATE-0007 | RATE-0003 | RATE-0001 | 0.290 |
| RATE-0008 | RATE-0003 | RATE-0005 | 361.02 |

**t_lift_with_baseline_rate_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RATE-0001 | RATE-0001 | RATE-0002 | Dimension Kind 01 |
| RATE-0002 | RATE-0001 | RATE-0008 | Encoding 02 |
| RATE-0003 | RATE-0001 | RATE-0009 | pre-release note |
| RATE-0004 | RATE-0001 | RATE-0010 | de |
| RATE-0005 | RATE-0001 | RATE-0003 | automated |
| RATE-0006 | RATE-0001 | RATE-0006 | ratio |
| RATE-0007 | RATE-0002 | RATE-0002 | Dimension Kind 07 |
| RATE-0008 | RATE-0002 | RATE-0008 | Encoding 08 |

The structural coherence of this design rests on the consistent use of identifiers as stable keys across all tables. Whether the identifier follows the PROC prefix for strategic planning, SECU for security subclasses, or RATE for lift measurements, each serves as the immutable anchor for foreign-key relationships that bind facts to dimensions and entities to their attribute values. The event count in the strategic fact table, the category assignments in the dimension tables, and the misc values in the type-specialized attribute tables all derive their meaning from these key-based connections. Governance frameworks that depend on auditing planning artifacts, tracking security attribute compliance, or measuring performance lifts against baseline controls can traverse this graph of relationships with deterministic joins, because every value, label, and category is reachable through a chain of identifier references that the model enforces at the schema level.

**t_soc2_security_subclass**

| id | soc | for_s_o_c2_domain |
| --- | --- | --- |
| SECU-0001 | SOC2-CloudInfra | RATE-0001 |
| SECU-0002 | SOC3-Public | RATE-0004 |
| SECU-0003 | SOC2-Fintech | RATE-0004 |
| SECU-0004 | SOC2-IdentityProvider | RATE-0001 |
| SECU-0005 | SOC2-SaaS | RATE-0004 |
| SECU-0006 | SOC2-TypeII | RATE-0006 |
| SECU-0007 | SOC2-SaaS | RATE-0001 |

**t_soc2_security_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SECU-0001 | effective_date | xsd:date |
| SECU-0002 | enforcement | xsd:string |
| SECU-0003 | mandatory | xsd:boolean |
| SECU-0004 | priority | xsd:integer |
| SECU-0005 | review_cycle_days | xsd:integer |
| SECU-0006 | scope | xsd:string |
| SECU-0007 | encoding | xsd:string |
| SECU-0008 | label_text | xsd:string |

**t_soc2_security_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SECU-0001 | SECU-0001 | SECU-0004 | 5 |
| SECU-0002 | SECU-0001 | SECU-0005 | 926 |
| SECU-0003 | SECU-0002 | SECU-0004 | 1 |
| SECU-0004 | SECU-0002 | SECU-0005 | 849 |
| SECU-0005 | SECU-0003 | SECU-0004 | 2 |
| SECU-0006 | SECU-0003 | SECU-0005 | 409 |
| SECU-0007 | SECU-0004 | SECU-0004 | 5 |
| SECU-0008 | SECU-0004 | SECU-0005 | 551 |

**t_lift_with_baseline_rate**

| id | lift | baseline_rate |
| --- | --- | --- |
| RATE-0001 | Conversion Gain | SECU-0007 |
| RATE-0002 | Latency Peak Reduction | SECU-0002 |
| RATE-0003 | Click Through Uplift | SECU-0004 |
| RATE-0004 | Model v2 Accuracy Lift | SECU-0002 |
| RATE-0005 | Latency Peak Reduction | SECU-0005 |
| RATE-0006 | Ad Improvement | SECU-0007 |

**t_lift_with_baseline_rate_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| RATE-0001 | confidence | xsd:decimal |
| RATE-0002 | dimension_kind | xsd:string |
| RATE-0003 | method | xsd:string |
| RATE-0004 | recorded_at | xsd:dateTime |
| RATE-0005 | uncertainty | xsd:decimal |
| RATE-0006 | unit | xsd:string |
| RATE-0007 | value | xsd:decimal |
| RATE-0008 | encoding | xsd:string |