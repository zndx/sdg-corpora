---
chapter_id: ch_live_descriptive_either_evidence_or_claim_14688f
topic_id: 26
family: 07_long_tail
cited_terms: ['descriptive_either_evidence_or_claim', 'directive_only_governs_artifact', 'flood_defence_condition_characterisation']
model: engine-refine
---

A robust data governance framework requires that every piece of evidence or claim be uniquely identified, richly described, and precisely typed so that downstream compliance checks and audit trails can reference it unambiguously. Each record carries an identifier—such as CLAI-0001 through CLAI-0004—that serves as the stable key across all related tables. The descriptive layer captures what the record represents in operational terms: a pipeline run log, a compliance audit trail, a network latency trace, or a field condition note. Alongside these primary descriptions, supplementary metadata such as checksum mismatch alerts, calibration certificates, data quality flags, validation rule sets, chain-of-custody tags, and sampling intervals provide the contextual scaffolding needed to assess provenance and trustworthiness. Without this layered identification and description, an auditor or automated compliance engine would have no reliable anchor for tracing decisions back to their source evidence.

**t_descriptive_either_evidence_or_claim**

| id | descriptive | descriptive_2 | descriptive_3 |
| --- | --- | --- | --- |
| CLAI-0001 | pipeline run log | checksum mismatch alert | validation rule set |
| CLAI-0002 | compliance audit trail | field condition note | validation rule set |
| CLAI-0003 | network latency trace | calibration certificate | chain of custody tag |
| CLAI-0004 | pipeline run log | data quality flag | sampling interval ms |
| CLAI-0005 | data ingestion manifest | retention policy label | retention expiry date |
| CLAI-0006 | compliance audit trail | data quality flag | hash algorithm ID |

Attributes and their types form the second structural pillar, separating the definition of what can be measured from the actual values recorded. An attribute definition—such as confidence, dimension_kind, method, or recorded_at—specifies a semantic property and its data type using XML Schema Datatypes: xsd:decimal for numeric precision, xsd:string for categorical labels, and xsd:dateTime for temporal stamps. This separation of schema from instance is critical in compliance contexts because it allows the same attribute definitions to be reused across different evidence records and ensures that validation engines can enforce type constraints consistently. For instance, the confidence attribute expects a decimal value, the recorded_at attribute expects an ISO 8601 timestamp, and dimension_kind expects a string label—each type governing how the value is stored, compared, and validated.

The value tables materialize these definitions by storing actual measurements against specific entities and attributes, with separate tables for each data type to enforce type safety at the storage layer. Decimal values such as 0.015, 195.73, 92.51, and 0.355 populate the decimal value table, each linked to an entity and an attribute identifier. String values like "Dimension Kind 01", "Encoding 02", "change rationale", and the language code "es" reside in the varchar value table. Temporal values such as 2023-12-14T23:50:57, 2024-02-16T02:04:00, 2024-04-20T14:09:40, and 2025-04-28T22:05:41 are stored in the datetime value table. The entity_id column in each value table creates the foreign-key bridge back to the descriptive record, ensuring that every measurement can be traced to its originating evidence or claim. This entity-attribute-value pattern, while denormalized across type-specific tables, provides both type safety and query efficiency—essential properties when compliance audits require rapid retrieval of all attribute values for a given artifact.

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

**t_directive_only_governs_artifact_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0001 | 2023-09-27 |
| ARTI-0002 | ARTI-0002 | ARTI-0001 | 2025-04-15 |
| ARTI-0003 | ARTI-0003 | ARTI-0001 | 2024-03-21 |
| ARTI-0004 | ARTI-0004 | ARTI-0001 | 2024-02-09 |
| ARTI-0005 | ARTI-0005 | ARTI-0001 | 2023-02-02 |
| ARTI-0006 | ARTI-0006 | ARTI-0001 | 2024-08-24 |
| ARTI-0007 | ARTI-0007 | ARTI-0001 | 2023-05-03 |

**t_directive_only_governs_artifact_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0004 | 5 |
| ARTI-0002 | ARTI-0001 | ARTI-0005 | 959 |
| ARTI-0003 | ARTI-0002 | ARTI-0004 | 4 |
| ARTI-0004 | ARTI-0002 | ARTI-0005 | 97 |
| ARTI-0005 | ARTI-0003 | ARTI-0004 | 5 |
| ARTI-0006 | ARTI-0003 | ARTI-0005 | 179 |
| ARTI-0007 | ARTI-0004 | ARTI-0004 | 4 |
| ARTI-0008 | ARTI-0004 | ARTI-0005 | 356 |

**t_directive_only_governs_artifact_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0007 | Encoding 01 |
| ARTI-0002 | ARTI-0001 | ARTI-0002 | Enforcement 02 |
| ARTI-0003 | ARTI-0001 | ARTI-0008 | nightly summary |
| ARTI-0004 | ARTI-0001 | ARTI-0009 | en |
| ARTI-0005 | ARTI-0001 | ARTI-0006 | Scope 05 |
| ARTI-0006 | ARTI-0002 | ARTI-0007 | Encoding 06 |
| ARTI-0007 | ARTI-0002 | ARTI-0002 | Enforcement 07 |
| ARTI-0008 | ARTI-0002 | ARTI-0008 | pre-release note |

Compliance directives introduce a parallel governance structure that governs artifacts rather than describing evidence. Directives such as the ISO 27001 Security Policy, SOC 2 Type II Standard, GDPR Compliance Mandate, and PCI DSS v4.0 Compliance each carry their own attribute definitions—effective_date, enforcement, mandatory, and priority—typed as xsd:date, xsd:string, xsd:boolean, and xsd:integer respectively. The boolean mandatory attribute, for example, takes values of true or false to indicate whether compliance is obligatory, while the integer priority attribute assigns levels such as 4 or 5 to establish enforcement hierarchy. Effective dates like 2023-09-27, 2024-02-09, 2024-03-21, and 2025-04-15 define when each directive becomes operative, and enforcement metadata such as "Enforcement 02" and "nightly summary" describe the operational mechanism. These directives govern specific artifacts—Sensor Data Streams, Network Access Control Lists, and the Data Lake Metadata Catalog—creating a traceable chain from regulatory requirement through artifact to the evidence that demonstrates compliance.

**t_directive_only_governs_artifact**

| id | directive | governs |
| --- | --- | --- |
| ARTI-0001 | ISO 27001 Security Policy | Sensor Data Streams |
| ARTI-0002 | SOC 2 Type II Standard | Network Access Control Lists |
| ARTI-0003 | GDPR Compliance Mandate | Data Lake Metadata Catalog |
| ARTI-0004 | PCI DSS v4.0 Compliance | Data Lake Metadata Catalog |
| ARTI-0005 | FISMA Moderate Baseline | Laboratory Reagent Inventory |
| ARTI-0006 | OWASP Top Ten Control | Access Control Matrices |
| ARTI-0007 | NIST Cybersecurity Framework | Sensor Data Streams |

**t_directive_only_governs_artifact_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ARTI-0001 | effective_date | xsd:date |
| ARTI-0002 | enforcement | xsd:string |
| ARTI-0003 | mandatory | xsd:boolean |
| ARTI-0004 | priority | xsd:integer |
| ARTI-0005 | review_cycle_days | xsd:integer |
| ARTI-0006 | scope | xsd:string |
| ARTI-0007 | encoding | xsd:string |
| ARTI-0008 | label_text | xsd:string |

**t_directive_only_governs_artifact_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0003 | true |
| ARTI-0002 | ARTI-0002 | ARTI-0003 | true |
| ARTI-0003 | ARTI-0003 | ARTI-0003 | true |
| ARTI-0004 | ARTI-0004 | ARTI-0003 | false |
| ARTI-0005 | ARTI-0005 | ARTI-0003 | false |
| ARTI-0006 | ARTI-0006 | ARTI-0003 | true |
| ARTI-0007 | ARTI-0007 | ARTI-0003 | false |

In the domain of flood defence infrastructure, the framework extends to characterise the condition of physical assets through structured validation processes and earth observation data. A flood defence condition characterisation—such as ExpertReviewPanel, GroundTruthSampling, CrossSensorCalibration, or UncertaintyPropagated—describes the methodology used to assess the state of a defence asset. Each characterisation involves specific earth observation data sources, including CopernicusDEM, Sentinel1GRD, and LiDARBathymetry, which provide the remote sensing inputs necessary for condition assessment. The validation process employed—whether HistoricalBaselineMatch, GroundTruthSampling, or a named event assessment like SeineBreach2016—documents how the characterisation was verified against known ground truth or historical records. This triad of characterisation method, earth observation data source, and validation process creates a defensible audit trail for infrastructure condition assessments, linking remote sensing evidence to engineering conclusions through documented and repeatable procedures.

**t_flood_defence_condition_characterisation**

| id | flood_defence_condition_characterisation | involves_earth_observation_data | employs_validation_process |
| --- | --- | --- | --- |
| CHAR-0001 | ExpertReviewPanel | CopernicusDEM | HistoricalBaselineMatch |
| CHAR-0002 | GroundTruthSampling | Sentinel1GRD | GroundTruthSampling |
| CHAR-0003 | CrossSensorCalibration | LiDARBathymetry | SeineBreach2016 |
| CHAR-0004 | UncertaintyPropagated | LiDARBathymetry | SeineBreach2016 |
| CHAR-0005 | VeniceTide2019 | RADARSAT2 | CrossSensorCalibration |