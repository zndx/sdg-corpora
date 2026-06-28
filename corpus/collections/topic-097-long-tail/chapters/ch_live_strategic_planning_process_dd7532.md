---
chapter_id: ch_live_strategic_planning_process_dd7532
topic_id: 97
family: 08_derived
cited_terms: ['strategic_planning_process', 'claim_refuted_by_evidence', 'verification_basic']
model: engine-refine
---

Strategic planning processes are tracked through a fact table keyed by a unique identifier—PROC-0001 through PROC-0004—each representing a discrete planning event whose volume is captured by an event count ranging from 123 to 388 occurrences. These identifiers serve as the primary anchor for all downstream relationships, enabling deterministic joins across the dimensional model. Each strategic process references a business division through a foreign key that resolves to a label such as Targets Business Division Label 01 and a category designation like Targets Business Division Category 01, thereby situating the process within an organizational taxonomy. Similarly, the process references a planning artifact through a separate foreign key, resolving to a label such as Produces Planning Artifact Label 01 and a category such as Produces Planning Artifact Category 01. The dual foreign-key structure—targets_business_division_key and produces_planning_artifact_key—ensures that every strategic event is simultaneously attributable to a business unit and to a specific class of planning output, supporting both operational accountability and artifact lifecycle management.

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

**t_verification_basic**

| id | verification |
| --- | --- |
| VERI-0001 | Compliance snapshot test |
| VERI-0002 | Calibration certificate review |
| VERI-0003 | Pipeline integrity check |
| VERI-0004 | Sensor drift assessment |
| VERI-0005 | Access control audit |
| VERI-0006 | Metadata reconciliation |

Evidence governance operates through a parallel relational structure centered on claims and their refutation. A claim record, identified by an identifier such as EVID-0001, carries a substantive assertion—for example, Carbon emissions peaked or Patient dosage exceeds limit—and is linked to the evidence that refutes it, whether that be Compliance checklist v2.1 or Satellite imagery timestamp. The relationship between claim and refuting evidence is mediated by a junction table that assigns a role to each participant in the refutation: observer or reviewer. In one instance, the role observer appears for the linkage between claim EVID-0006 and evidence EVID-0004, while the role reviewer governs the linkage between claim EVID-0001 and evidence EVID-0003. This role column encodes the functional capacity of the evidence within the refutation chain, distinguishing passive observation from authoritative review.

**t_claim_refuted_by_evidence**

| id | claim |
| --- | --- |
| EVID-0001 | Carbon emissions peaked |
| EVID-0002 | Patient dosage exceeds limit |
| EVID-0003 | Supply chain disruption |
| EVID-0004 | Firmware update breaks encryption |
| EVID-0005 | Algorithm bias flagged |
| EVID-0006 | Market volatility threshold |
| EVID-0007 | Carbon emissions peaked |

**t_claim_refuted_by_evidence_refuted_by_evidence**

| id | refuted_by_evidence |
| --- | --- |
| EVID-0001 | Compliance checklist v2.1 |
| EVID-0002 | Compliance checklist v2.1 |
| EVID-0003 | Compliance checklist v2.1 |
| EVID-0004 | Satellite imagery timestamp |
| EVID-0005 | Peer reviewed study 10.1234 |
| EVID-0006 | Lab bench measurement sheet |
| EVID-0007 | Satellite imagery timestamp |
| EVID-0008 | Clinical trial phase III |

**t_claim_refuted_by_evidence__refuted_by_evidence**

| id | claim_id | refuted_by_evidence_id | role |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0006 | EVID-0004 | observer |
| EVID-0002 | EVID-0007 | EVID-0004 | observer |
| EVID-0003 | EVID-0003 | EVID-0007 | observer |
| EVID-0004 | EVID-0001 | EVID-0003 | reviewer |
| EVID-0005 | EVID-0004 | EVID-0005 | reviewer |
| EVID-0006 | EVID-0001 | EVID-0007 | contributor |
| EVID-0007 | EVID-0007 | EVID-0005 | owner |
| EVID-0008 | EVID-0003 | EVID-0001 | owner |

Verification records follow an entity-attribute-value (EAV) pattern that decouples the definition of an attribute from its runtime values. A verification record, identified by VERI-0001 through VERI-0004 and described by a verification label such as Compliance snapshot test or Calibration certificate review, is associated with a set of attributes defined in a separate attribute catalog. Each attribute carries an attr_name—duration_seconds, end_time, exit_code, host_name—and an attr_type drawn from the XSD namespace: xsd:decimal, xsd:dateTime, xsd:integer, xsd:string. The attr_type constrains the permissible value domain and determines which value table receives the data. For instance, duration_seconds of type xsd:decimal receives values like 500.97 or 4488.38, while end_time of type xsd:dateTime receives ISO 8601 timestamps such as 2023-02-01T08:41:13 or 2025-05-09T15:15:58. Integer attributes of type xsd:integer hold values like 182 or 828, and string attributes of type xsd:string carry values such as ingest-21, Log Level 02, execution, or complete.

**t_verification_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| VERI-0001 | duration_seconds | xsd:decimal |
| VERI-0002 | end_time | xsd:dateTime |
| VERI-0003 | exit_code | xsd:integer |
| VERI-0004 | host_name | xsd:string |
| VERI-0005 | log_level | xsd:string |
| VERI-0006 | phase | xsd:string |
| VERI-0007 | retry_count | xsd:integer |
| VERI-0008 | scheduled_at | xsd:dateTime |

The entity column in each value table identifies the verification record to which the attribute value belongs, creating a many-to-one relationship between values and their parent verification. A single verification record such as VERI-0001 may accumulate values across multiple attribute tables: a decimal value of 500.97 for duration_seconds, a datetime value of 2023-02-01T08:41:13 for end_time, an integer value of 182 for exit_code, and a string value of ingest-21 for host_name. This normalization strategy permits heterogeneous attribute types to coexist within a single verification record without schema modification, while the attr_id column in each value table resolves back to the attribute definition, ensuring type safety at query time. The misc column, used as the value container across all four value tables, holds the actual data regardless of type, with the attr_type providing the semantic context necessary for interpretation.

**t_verification_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0002 | 2023-02-01T08:41:13 |
| VERI-0002 | VERI-0001 | VERI-0008 | 2023-06-06T17:03:25 |
| VERI-0003 | VERI-0001 | VERI-0009 | 2025-05-09T15:15:58 |
| VERI-0004 | VERI-0002 | VERI-0002 | 2023-06-08T16:52:03 |
| VERI-0005 | VERI-0002 | VERI-0008 | 2025-05-17T22:11:58 |
| VERI-0006 | VERI-0002 | VERI-0009 | 2024-06-13T13:20:10 |
| VERI-0007 | VERI-0003 | VERI-0002 | 2023-04-20T09:43:00 |
| VERI-0008 | VERI-0003 | VERI-0008 | 2023-10-14T11:07:55 |

**t_verification_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0001 | 500.97 |
| VERI-0002 | VERI-0002 | VERI-0001 | 4488.38 |
| VERI-0003 | VERI-0003 | VERI-0001 | 4833.98 |
| VERI-0004 | VERI-0004 | VERI-0001 | 3565.06 |
| VERI-0005 | VERI-0005 | VERI-0001 | 2509.98 |
| VERI-0006 | VERI-0006 | VERI-0001 | 2611.50 |

**t_verification_basic_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0003 | 182 |
| VERI-0002 | VERI-0001 | VERI-0007 | 65 |
| VERI-0003 | VERI-0002 | VERI-0003 | 828 |
| VERI-0004 | VERI-0002 | VERI-0007 | 38 |
| VERI-0005 | VERI-0003 | VERI-0003 | 137 |
| VERI-0006 | VERI-0003 | VERI-0007 | 337 |
| VERI-0007 | VERI-0004 | VERI-0003 | 858 |
| VERI-0008 | VERI-0004 | VERI-0007 | 112 |

**t_verification_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0004 | ingest-21 |
| VERI-0002 | VERI-0001 | VERI-0005 | Log Level 02 |
| VERI-0003 | VERI-0001 | VERI-0006 | execution |
| VERI-0004 | VERI-0001 | VERI-0010 | complete |
| VERI-0005 | VERI-0001 | VERI-0011 | Triggered By 05 |
| VERI-0006 | VERI-0002 | VERI-0004 | edge-03 |
| VERI-0007 | VERI-0002 | VERI-0005 | Log Level 07 |
| VERI-0008 | VERI-0002 | VERI-0006 | initiation |