---
chapter_id: ch_live_subclass_basic_c65e27
topic_id: 81
family: 01_foundation
cited_terms: ['subclass_basic', 'professional_expertise_domain', 'entomological_surveillance_record']
model: engine-refine
---

Professional expertise domains serve as the foundational classification mechanism for organizing specialized competencies across regulated industries. Each domain—whether a Cybersecurity Auditor operating within Manufacturing Operations, a Forensic Accountant serving Commercial Real Estate, or a Clinical Psychologist engaged in Public Infrastructure—is uniquely identified and scoped by the sector it covers and the service type it provides. A single domain can encompass multiple service offerings; for instance, the Cybersecurity Auditor role appears across both Asset Valuation and Regulatory Compliance engagements, while Public Infrastructure is served by both Forensic Accountant and Clinical Psychologist domains under Contract Drafting and Asset Valuation service types respectively. This multi-dimensional classification ensures that expertise is not merely catalogued by job title but is contextualized by the industry vertical and the specific deliverable expected.

**t_professional_expertise_domain**

| id | professional_expertise_domain | covers_sector | provides_service_type |
| --- | --- | --- | --- |
| DOMA-0001 | Cybersecurity Auditor | Manufacturing Operations | Asset Valuation |
| DOMA-0002 | Cybersecurity Auditor | Commercial Real Estate | Regulatory Compliance |
| DOMA-0003 | Forensic Accountant | Public Infrastructure | Contract Drafting |
| DOMA-0004 | Clinical Psychologist | Public Infrastructure | Asset Valuation |
| DOMA-0005 | Data Architect | Healthcare Delivery | Regulatory Compliance |
| DOMA-0006 | Data Architect | Manufacturing Operations | Clinical Diagnosis |
| DOMA-0007 | Forensic Accountant | Manufacturing Operations | Network Penetration Testing |
| DOMA-0008 | Structural Engineer | Financial Services | Asset Valuation |

Attributes attach granular metadata to each expertise domain, enabling precise measurement and auditability. Attribute definitions specify both a name—such as confidence, dimension_kind, method, or recorded_at—and a strict type constraint drawn from the XML Schema Definition namespace, including xsd:decimal, xsd:string, and xsd:dateTime. The type discipline is enforced through a value-normalization strategy that routes attribute values into type-specific storage: decimal attributes like confidence scores (0.863, 0.147) and dimensional measurements (628.37, 315.52) are persisted in a dedicated decimal value table; string attributes such as dimension kinds (Dimension Kind 01), encoding identifiers (Encoding 02), calibration records, and locale codes (ja) reside in a varchar value table; and temporal attributes like recorded_at timestamps (2024-07-30T07:07:17, 2024-12-04T20:31:19, 2024-05-12T06:41:36, 2024-07-23T14:51:29) are stored in a separate datetime value table. This separation by type preserves data integrity while supporting efficient query patterns for each attribute class.

**t_professional_expertise_domain_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| DOMA-0001 | confidence | xsd:decimal |
| DOMA-0002 | dimension_kind | xsd:string |
| DOMA-0003 | method | xsd:string |
| DOMA-0004 | recorded_at | xsd:dateTime |
| DOMA-0005 | uncertainty | xsd:decimal |
| DOMA-0006 | unit | xsd:string |
| DOMA-0007 | value | xsd:decimal |
| DOMA-0008 | encoding | xsd:string |

**t_professional_expertise_domain_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DOMA-0001 | DOMA-0001 | DOMA-0004 | 2024-07-30T07:07:17 |
| DOMA-0002 | DOMA-0002 | DOMA-0004 | 2024-12-04T20:31:19 |
| DOMA-0003 | DOMA-0003 | DOMA-0004 | 2024-05-12T06:41:36 |
| DOMA-0004 | DOMA-0004 | DOMA-0004 | 2024-07-23T14:51:29 |
| DOMA-0005 | DOMA-0005 | DOMA-0004 | 2023-05-19T17:35:21 |
| DOMA-0006 | DOMA-0006 | DOMA-0004 | 2023-07-26T00:07:35 |
| DOMA-0007 | DOMA-0007 | DOMA-0004 | 2023-03-21T08:57:17 |
| DOMA-0008 | DOMA-0008 | DOMA-0004 | 2023-06-16T10:20:06 |

**t_professional_expertise_domain_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DOMA-0001 | DOMA-0001 | DOMA-0001 | 0.863 |
| DOMA-0002 | DOMA-0001 | DOMA-0005 | 628.37 |
| DOMA-0003 | DOMA-0001 | DOMA-0007 | 315.52 |
| DOMA-0004 | DOMA-0002 | DOMA-0001 | 0.147 |
| DOMA-0005 | DOMA-0002 | DOMA-0005 | 438.62 |
| DOMA-0006 | DOMA-0002 | DOMA-0007 | 381.17 |
| DOMA-0007 | DOMA-0003 | DOMA-0001 | 0.471 |
| DOMA-0008 | DOMA-0003 | DOMA-0005 | 940.55 |

**t_professional_expertise_domain_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DOMA-0001 | DOMA-0001 | DOMA-0002 | Dimension Kind 01 |
| DOMA-0002 | DOMA-0001 | DOMA-0008 | Encoding 02 |
| DOMA-0003 | DOMA-0001 | DOMA-0009 | calibration record |
| DOMA-0004 | DOMA-0001 | DOMA-0010 | ja |
| DOMA-0005 | DOMA-0001 | DOMA-0003 | manual |
| DOMA-0006 | DOMA-0001 | DOMA-0006 | mg/L |
| DOMA-0007 | DOMA-0002 | DOMA-0002 | Dimension Kind 07 |
| DOMA-0008 | DOMA-0002 | DOMA-0008 | Encoding 08 |

The entity-attribute-value model extends beyond simple key-value pairs by anchoring every attribute value to both an entity identifier and an attribute identifier, creating a fully traceable provenance chain. An entity—identified by a domain code such as DOMA-0001—can carry multiple attributes of different types, and each attribute definition can be instantiated across multiple entities. The foreign-key relationship between the value tables and the attribute definition table ensures that only attributes with a registered schema definition can receive values, preventing schema drift and guaranteeing that every stored value is semantically interpretable. This design supports dynamic attribute addition without schema migration, as new attribute definitions are registered in the attribute table before values are populated in the corresponding type-specific value table.

Event tracking and realization semantics are captured through a star-schema fact table that links operational events to their contextual dimensions. The fact table records an event count for each observation—values ranging from 49 to 485 occurrences—while foreign keys connect each fact row to two dimension tables: one describing what is realized and another describing what the event is associated with. The realizes dimension provides a label and a category for each realization, with entries such as Realizes Label 01 through Realizes Label 04 mapped to categories Realizes Category 01 through Realizes Category 04. Similarly, the associated-with dimension supplies labels (Associated With Label 01 through Associated With Label 04) and categories (Associated With Category 01 through Associated With Category 04) that contextualize the event's relationships. A single fact record, identified by a code like RECO-0001, simultaneously references a realization and an association, enabling multi-axis analysis of event patterns.

**fact_entomological**

| id | realizes_key | associated_with_key | event_count |
| --- | --- | --- | --- |
| RECO-0001 | RECO-0002 | RECO-0001 | 311 |
| RECO-0002 | RECO-0005 | RECO-0005 | 166 |
| RECO-0003 | RECO-0004 | RECO-0003 | 49 |
| RECO-0004 | RECO-0004 | RECO-0001 | 485 |
| RECO-0005 | RECO-0006 | RECO-0001 | 380 |
| RECO-0006 | RECO-0003 | RECO-0005 | 490 |
| RECO-0007 | RECO-0004 | RECO-0007 | 321 |
| RECO-0008 | RECO-0002 | RECO-0003 | 179 |

**dim_realizes**

| id | realizes_label | realizes_category |
| --- | --- | --- |
| RECO-0001 | Realizes Label 01 | Realizes Category 01 |
| RECO-0002 | Realizes Label 02 | Realizes Category 02 |
| RECO-0003 | Realizes Label 03 | Realizes Category 03 |
| RECO-0004 | Realizes Label 04 | Realizes Category 04 |
| RECO-0005 | Realizes Label 05 | Realizes Category 05 |
| RECO-0006 | Realizes Label 06 | Realizes Category 06 |

**dim_associated_with**

| id | associated_with_label | associated_with_category |
| --- | --- | --- |
| RECO-0001 | Associated With Label 01 | Associated With Category 01 |
| RECO-0002 | Associated With Label 02 | Associated With Category 02 |
| RECO-0003 | Associated With Label 03 | Associated With Category 03 |
| RECO-0004 | Associated With Label 04 | Associated With Category 04 |
| RECO-0005 | Associated With Label 05 | Associated With Category 05 |
| RECO-0006 | Associated With Label 06 | Associated With Category 06 |
| RECO-0007 | Associated With Label 07 | Associated With Category 07 |
| RECO-0008 | Associated With Label 08 | Associated With Category 08 |

Subclass relationships further enrich the ontology by capturing direct mappings between conceptual entities. A subclass table records pairs of identifiers where one subject—such as a Query execution engine, Remote sensing platform, Parquet row group, or ISO 8601 timestamp—is linked to a related subject like a Kestrel telemetry probe, Atmospheric instrument, Edge gateway node, or another Query execution engine. These bidirectional or hierarchical links establish the semantic topology that underpins the classification system, allowing queries to traverse from a high-level domain to its constituent technical components and vice versa. The identifier scheme (TSUB-0001 through TSUB-0004) provides a stable reference for these relationships, ensuring that subclass membership is auditable and reproducible across system versions.

**t_subclass_basic**

| id | subject | subject_2 |
| --- | --- | --- |
| TSUB-0001 | ISO 8601 timestamp | Query execution engine |
| TSUB-0002 | Parquet row group | Kestrel telemetry probe |
| TSUB-0003 | Remote sensing platform | Atmospheric instrument |
| TSUB-0004 | Query execution engine | Edge gateway node |
| TSUB-0005 | Edge gateway node | Data serialization method |
| TSUB-0006 | Argo float array | ISO 8601 timestamp |
| TSUB-0007 | Measurement apparatus | Environmental monitoring device |