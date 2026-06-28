---
chapter_id: ch_live_survey_response_record_65e510
topic_id: 26
family: 08_derived
cited_terms: ['survey_response_record', 'annotation_at_tier', 'claim_basic']
model: engine-refine
---

Within compliance and data governance frameworks, every auditable object requires a stable identifier and a clear record of its provenance. Survey response records serve as the primary capture mechanism for researcher profile attributes, each identified by a unique code such as RECO-0001 or RECO-0002. These records document substantive interactions — a Peer-Review-Submission, a Q3-2023-Feedback entry, or a Safety-Compliance-Check — and each one is tied to a specific researcher profile attribute like Clearance-Level, Domain-Expertise-Code, or Protocol-Approval-Ref. Because such records circulate across multi-lingual, multi-system environments, they carry explicit encoding and language metadata: a record may be encoded in ascii, unicode, or utf8 and associated with a language code such as es, de, or en, ensuring that downstream consumers can interpret the content correctly regardless of origin.

**t_survey_response_record**

| id | survey_response_record | captures_profile_attribute | encoding | language |
| --- | --- | --- | --- | --- |
| RECO-0001 | Peer-Review-Submission | Clearance-Level | ascii | es |
| RECO-0002 | Q3-2023-Feedback | Domain-Expertise-Code | unicode | de |
| RECO-0003 | Safety-Compliance-Check | Protocol-Approval-Ref | ascii | es |
| RECO-0004 | Q3-2023-Feedback | Protocol-Approval-Ref | utf8 | en |
| RECO-0005 | Incident-Report-Form | Funding-Source-ID | ascii | es |
| RECO-0006 | Field-Obs-Log | Institutional-Affiliation | unicode | de |
| RECO-0007 | Dev-Team-Performance | Protocol-Approval-Ref | ascii | ja |

Beyond survey records, the system applies a generic attribute-value model to annotate any entity — whether an annotation at a data tier or a claim about data quality. An entity is any discrete object that requires metadata enrichment. In the annotation domain, entities are labeled with descriptive text such as SensorCalibration Q4, TelemetryLabel HighLatency, QualityFlag Pass, or DatasetVersion v3.2.1, and each is assigned to a processing tier like L0 Unprocessed, Cold Archive, or Baseline Reference. In the claims domain, entities carry assertions such as Model accuracy below SLA, Schema version deprecated, or File checksum matches. The entity identifier — TIER-0001, CLAI-0001, and so on — provides the stable key that links the entity to its attributes and values.

**t_annotation_at_tier**

| id | annotation | at_tier |
| --- | --- | --- |
| TIER-0001 | SensorCalibration Q4 | L0 Unprocessed |
| TIER-0002 | TelemetryLabel HighLatency | Cold Archive |
| TIER-0003 | QualityFlag Pass | Baseline Reference |
| TIER-0004 | DatasetVersion v3.2.1 | L0 Unprocessed |
| TIER-0005 | ProvenanceSource EPA7 | Cold Archive |
| TIER-0006 | ProvenanceSource EPA7 | L0 Unprocessed |
| TIER-0007 | ObservationNote Drift | Derived Metrics |
| TIER-0008 | ComplianceLevel SOC2 | Cold Archive |

**t_annotation_at_tier_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| TIER-0001 | confidence | xsd:decimal |
| TIER-0002 | dimension_kind | xsd:string |
| TIER-0003 | method | xsd:string |
| TIER-0004 | recorded_at | xsd:dateTime |
| TIER-0005 | uncertainty | xsd:decimal |
| TIER-0006 | unit | xsd:string |
| TIER-0007 | value | xsd:decimal |
| TIER-0008 | encoding | xsd:string |

**t_annotation_at_tier_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0001 | TIER-0004 | 2023-08-28T08:07:44 |
| TIER-0002 | TIER-0002 | TIER-0004 | 2024-09-06T16:54:15 |
| TIER-0003 | TIER-0003 | TIER-0004 | 2023-05-23T23:56:22 |
| TIER-0004 | TIER-0004 | TIER-0004 | 2025-03-16T10:06:06 |
| TIER-0005 | TIER-0005 | TIER-0004 | 2023-04-25T04:15:41 |
| TIER-0006 | TIER-0006 | TIER-0004 | 2023-06-14T22:17:53 |
| TIER-0007 | TIER-0007 | TIER-0004 | 2024-03-09T22:47:27 |
| TIER-0008 | TIER-0008 | TIER-0004 | 2023-01-10T07:31:27 |

**t_annotation_at_tier_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0001 | TIER-0001 | 0.089 |
| TIER-0002 | TIER-0001 | TIER-0005 | 784.31 |
| TIER-0003 | TIER-0001 | TIER-0007 | 319.44 |
| TIER-0004 | TIER-0002 | TIER-0001 | 0.223 |
| TIER-0005 | TIER-0002 | TIER-0005 | 427.90 |
| TIER-0006 | TIER-0002 | TIER-0007 | 411.91 |
| TIER-0007 | TIER-0003 | TIER-0001 | 0.933 |
| TIER-0008 | TIER-0003 | TIER-0005 | 35.44 |

**t_annotation_at_tier_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0001 | TIER-0002 | Dimension Kind 01 |
| TIER-0002 | TIER-0001 | TIER-0008 | Encoding 02 |
| TIER-0003 | TIER-0001 | TIER-0009 | change rationale |
| TIER-0004 | TIER-0001 | TIER-0010 | es |
| TIER-0005 | TIER-0001 | TIER-0003 | hybrid |
| TIER-0006 | TIER-0001 | TIER-0006 | kg |
| TIER-0007 | TIER-0002 | TIER-0002 | Dimension Kind 07 |
| TIER-0008 | TIER-0002 | TIER-0008 | Encoding 08 |

**t_claim_basic**

| id | claim |
| --- | --- |
| CLAI-0001 | Model accuracy below SLA |
| CLAI-0002 | Schema version deprecated |
| CLAI-0003 | Model accuracy below SLA |
| CLAI-0004 | File checksum matches |
| CLAI-0005 | Compliance audit passed |
| CLAI-0006 | Compliance audit passed |

**t_claim_basic_attr**

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

Attributes define what properties are tracked on each entity, and each attribute has a declared type that constrains the shape of its values. Common attribute names include confidence, dimension_kind, method, and recorded_at. The attr_type column maps these names to XML Schema types: xsd:decimal for numeric measures, xsd:string for categorical labels, and xsd:dateTime for temporal stamps. This type declaration is not merely documentation — it governs how values are stored, validated, and queried. A confidence attribute typed as xsd:decimal will hold values like 0.089 or 0.443, while a recorded_at attribute typed as xsd:dateTime will hold ISO 8601 timestamps such as 2023-08-28T08:07:44 or 2025-05-28T11:02:08. The system separates attribute definitions from their values, storing each value in a typed column — datetime, decimal, or varchar — so that type safety is enforced at the storage layer.

The misc column captures the actual value content across all these typed stores. For decimal attributes, misc holds floating-point numbers like 784.31 or 443.93; for varchar attributes, it holds free-form strings such as Dimension Kind 01, Encoding 02, change rationale, or audit excerpt; and for datetime attributes, it holds precise timestamps. This separation of attribute schema from value instances enables the same entity to carry heterogeneous properties without schema migration — a claim about model accuracy can simultaneously carry a confidence decimal, a dimension_kind string, a method string, and a recorded_at timestamp, each validated against its declared attr_type.

**t_claim_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0004 | 2025-05-28T11:02:08 |
| CLAI-0002 | CLAI-0002 | CLAI-0004 | 2025-04-22T09:44:09 |
| CLAI-0003 | CLAI-0003 | CLAI-0004 | 2025-01-23T06:41:57 |
| CLAI-0004 | CLAI-0004 | CLAI-0004 | 2024-03-14T10:07:11 |
| CLAI-0005 | CLAI-0005 | CLAI-0004 | 2023-08-27T20:51:04 |
| CLAI-0006 | CLAI-0006 | CLAI-0004 | 2025-04-10T08:56:25 |

**t_claim_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0001 | 0.443 |
| CLAI-0002 | CLAI-0001 | CLAI-0005 | 443.93 |
| CLAI-0003 | CLAI-0001 | CLAI-0007 | 257.71 |
| CLAI-0004 | CLAI-0002 | CLAI-0001 | 0.828 |
| CLAI-0005 | CLAI-0002 | CLAI-0005 | 729.35 |
| CLAI-0006 | CLAI-0002 | CLAI-0007 | 717.18 |
| CLAI-0007 | CLAI-0003 | CLAI-0001 | 0.004 |
| CLAI-0008 | CLAI-0003 | CLAI-0005 | 534.68 |

**t_claim_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0002 | Dimension Kind 01 |
| CLAI-0002 | CLAI-0001 | CLAI-0008 | Encoding 02 |
| CLAI-0003 | CLAI-0001 | CLAI-0009 | audit excerpt |
| CLAI-0004 | CLAI-0001 | CLAI-0010 | fr |
| CLAI-0005 | CLAI-0001 | CLAI-0003 | automated |
| CLAI-0006 | CLAI-0001 | CLAI-0006 | m/s |
| CLAI-0007 | CLAI-0002 | CLAI-0002 | Dimension Kind 07 |
| CLAI-0008 | CLAI-0002 | CLAI-0008 | Encoding 08 |

Language and encoding metadata operate at two levels. At the survey response level, they describe the human language and character encoding of the record itself — a Safety-Compliance-Check record might be in Spanish (es) with ascii encoding, while a Q3-2023-Feedback record might be in German (de) with unicode encoding. At the attribute level, varchar values can themselves encode language information — an attribute value of es or fr may indicate the language of the underlying claim or annotation. This dual-layer approach ensures that both the record container and its structured metadata are self-describing, which is essential for cross-border compliance, auditability, and data lineage tracking.