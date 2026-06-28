---
chapter_id: ch_live_descriptive_either_evidence_or_claim_fa21f3
topic_id: 92
family: 07_long_tail
cited_terms: ['descriptive_either_evidence_or_claim', 'baseline_for_metric', 'policy_effective_period']
model: engine-refine
---

The structural integrity of any compliance registry relies upon the precise instantiation of entities, each anchored by a unique identifier such as `CLAI-0001` or `METR-0001`. These identifiers serve as the immutable keys for descriptive records—ranging from pipeline run logs to network latency traces—which are subsequently qualified by a defined set of attributes (`attr`). To ensure data fidelity across heterogeneous sources, each attribute is bound to a strict type definition (`attr_type`); for instance, a `confidence` metric is rigorously constrained to an `xsd:decimal` format, while temporal markers like `recorded_at` are serialized as `xsd:dateTime` values, thereby guaranteeing that the underlying evidence or claim adheres to a standardized schema.

**t_descriptive_either_evidence_or_claim**

| id | descriptive | descriptive_2 | descriptive_3 |
| --- | --- | --- | --- |
| CLAI-0001 | pipeline run log | checksum mismatch alert | validation rule set |
| CLAI-0002 | compliance audit trail | field condition note | validation rule set |
| CLAI-0003 | network latency trace | calibration certificate | chain of custody tag |
| CLAI-0004 | pipeline run log | data quality flag | sampling interval ms |
| CLAI-0005 | data ingestion manifest | retention policy label | retention expiry date |
| CLAI-0006 | compliance audit trail | data quality flag | hash algorithm ID |

**t_descriptive_either_evidence_or_claim_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CLAI-0001 | confidence | xsd:decimal |
| CLAI-0002 | dimension_kind | xsd:string |
| CLAI-0003 | method | xsd:string |
| CLAI-0004 | recorded_at | xsd:dateTime |
| CLAI-0005 | uncertainty | xsd:decimal |
| CLAI-0006 | unit | xsd:string |
| CLAI-0007 | value | xsd:decimal |
| CLAI-0008 | encoding | xsd:string |

**t_descriptive_either_evidence_or_claim_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0004 | 2023-12-14T23:50:57 |
| CLAI-0002 | CLAI-0002 | CLAI-0004 | 2024-02-16T02:04:00 |
| CLAI-0003 | CLAI-0003 | CLAI-0004 | 2024-04-20T14:09:40 |
| CLAI-0004 | CLAI-0004 | CLAI-0004 | 2025-04-28T22:05:41 |
| CLAI-0005 | CLAI-0005 | CLAI-0004 | 2023-01-08T15:26:20 |
| CLAI-0006 | CLAI-0006 | CLAI-0004 | 2023-08-14T20:31:38 |

**t_descriptive_either_evidence_or_claim_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0001 | 0.015 |
| CLAI-0002 | CLAI-0001 | CLAI-0005 | 195.73 |
| CLAI-0003 | CLAI-0001 | CLAI-0007 | 92.51 |
| CLAI-0004 | CLAI-0002 | CLAI-0001 | 0.355 |
| CLAI-0005 | CLAI-0002 | CLAI-0005 | 482.72 |
| CLAI-0006 | CLAI-0002 | CLAI-0007 | 420.42 |
| CLAI-0007 | CLAI-0003 | CLAI-0001 | 0.827 |
| CLAI-0008 | CLAI-0003 | CLAI-0005 | 514.52 |

**t_descriptive_either_evidence_or_claim_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0002 | Dimension Kind 01 |
| CLAI-0002 | CLAI-0001 | CLAI-0008 | Encoding 02 |
| CLAI-0003 | CLAI-0001 | CLAI-0009 | change rationale |
| CLAI-0004 | CLAI-0001 | CLAI-0010 | es |
| CLAI-0005 | CLAI-0001 | CLAI-0003 | manual |
| CLAI-0006 | CLAI-0001 | CLAI-0006 | deg_C |
| CLAI-0007 | CLAI-0002 | CLAI-0002 | Dimension Kind 07 |
| CLAI-0008 | CLAI-0002 | CLAI-0008 | Encoding 08 |

**t_baseline_for_metric**

| id | baseline |
| --- | --- |
| METR-0001 | Standard_Daylight_Cycle |
| METR-0002 | Power_Consumption |
| METR-0003 | Structural_Stress |
| METR-0004 | Steady_State_Vibration |
| METR-0005 | Factory_A_NightShift |
| METR-0006 | Battery_Capacity |
| METR-0007 | Standard_Daylight_Cycle |

**t_baseline_for_metric_baseline_for**

| id | baseline_for |
| --- | --- |
| METR-0001 | Data_Ingestion_Rate |
| METR-0002 | Data_Ingestion_Rate |
| METR-0003 | Steady_State_Vibration |
| METR-0004 | Power_Consumption |
| METR-0005 | Battery_Capacity |
| METR-0006 | Steady_State_Vibration |

The actual evidentiary content is decoupled into value-specific repositories, allowing the system to manage diverse data types without compromising relational integrity. Within these value stores, the attributes are instantiated with concrete values—ranging from numerical precision such as `0.015` or `195.73`, to categorical descriptors like `Dimension Kind 01` or `Encoding 02`, and textual justifications such as `change rationale`. Temporal evidence is equally granular, capturing precise moments of observation, such as `2023-12-14T23:50:57` or `2024-02-16T02:04:00`. By linking these miscellaneous (`misc`) values back to their parent entities and attributes, the framework maintains a complete audit trail of the underlying data quality flags, calibration certificates, and sampling intervals.

Operational governance further requires the establishment of baselines against which performance metrics are evaluated, creating a hierarchical dependency between subjects and targets. In this relational model, a baseline entity—such as `Standard_Daylight_Cycle` or `Steady_State_Vibration`—functions as a subject that is explicitly mapped to a target metric, such as `Data_Ingestion_Rate` or `Power_Consumption`. This mapping is not merely associative but is governed by a specific role, which delineates the nature of the relationship; a baseline may act as the primary `owner` of a target, serve as a secondary `contributor` to its calculation, or function strictly as an `observer`. This role-based linkage ensures that the provenance of every metric is traceable to its foundational standards.

**t_baseline_for_metric__baseline_for**

| id | baseline_id | baseline_for_id | role |
| --- | --- | --- | --- |
| METR-0001 | METR-0007 | METR-0004 | owner |
| METR-0002 | METR-0002 | METR-0005 | contributor |
| METR-0003 | METR-0001 | METR-0005 | observer |
| METR-0004 | METR-0007 | METR-0003 | contributor |
| METR-0005 | METR-0007 | METR-0004 | contributor |
| METR-0006 | METR-0001 | METR-0002 | reviewer |
| METR-0007 | METR-0004 | METR-0006 | reviewer |
| METR-0008 | METR-0007 | METR-0002 | reviewer |

Finally, the enforcement of regulatory standards is contextualized through effective periods that bound the applicability of specific policies. A regulatory instrument, such as the `HIPAA Privacy Rule`, `GDPR Compliance`, or `PCI DSS v4.0`, is assigned a temporal window of validity—such as `Q4 2022` or `Q1 2025`—during which its mandates are active. The operational reach of these policies is further constrained by their designated scope, which may be restricted to a `local` jurisdiction, a specific `team`, or extended to a `global` enterprise level. Concurrently, the `language` attribute ensures that the governing documentation is localized appropriately, supporting multilingual compliance environments where directives are rendered in `es`, `fr`, or other regional languages to guarantee unambiguous interpretation across diverse operational theaters.

**t_policy_effective_period**

| id | policy | effective_during | scope | language |
| --- | --- | --- | --- | --- |
| PERI-0001 | HIPAA Privacy Rule | Q4 2022 | local | es |
| PERI-0002 | GDPR Compliance | Q3 2023 | local | es |
| PERI-0003 | PCI DSS v4.0 | Q1 2025 | global | fr |
| PERI-0004 | NIST SP 800-53 | Q4 2022 | team | es |
| PERI-0005 | CCPA Data Rights | Q4 2025 | team | es |