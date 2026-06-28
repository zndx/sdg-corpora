---
chapter_id: ch_live_subclass_to_artifact_164592
topic_id: 186
family: 01_foundation
cited_terms: ['subclass_to_artifact', 'requirement_basic', 'column_pair_subject']
model: engine-refine
---

In compliance and governance systems, every artifact, requirement, and subject must be uniquely identifiable to support auditability and traceability. Identifiers serve as the canonical handles for these entities, following structured naming conventions such as ARTI-0001 for artifacts, REQU-0001 for requirements, and SUBJ-0001 for subjects. An artifact like checksum-manifest-v4 or genomic-sequence-17 is assigned a stable identifier that persists across its lifecycle, while a requirement such as Privacy Constraint or Encryption Standard receives its own identifier (REQU-0001, REQU-0002) to distinguish it from other governance obligations. Similarly, subjects—columns or data elements that are the target of compliance rules, such as log_level, batch_token, or transaction_id—each carry identifiers like SUBJ-0001 through SUBJ-0004. This uniform identification scheme ensures that every object in the compliance domain can be referenced unambiguously across tools, reports, and enforcement mechanisms.

**t_subclass_to_artifact**

| id | artifact | checksum | license |
| --- | --- | --- | --- |
| ARTI-0001 | checksum-manifest-v4 | c0ffee42 | BSD-3-Clause |
| ARTI-0002 | batch-processor-logs | 5e8f3c91 | CC-BY-4.0 |
| ARTI-0003 | genomic-sequence-17 | 1a4b6c2d | MIT |
| ARTI-0004 | sensor-calibration-v2 | 5e8f3c91 | CC-BY-4.0 |
| ARTI-0005 | model-weights-resnet50 | 5e8f3c91 | proprietary |
| ARTI-0006 | pipeline-output-stage3 | 9d2b7a16 | Apache-2.0 |
| ARTI-0007 | lab-reagent-batch-A7 | 7b14de08 | Apache-2.0 |
| ARTI-0008 | batch-processor-logs | 1a4b6c2d | BSD-3-Clause |

**t_requirement_basic**

| id | requirement |
| --- | --- |
| REQU-0001 | Privacy Constraint |
| REQU-0002 | Encryption Standard |
| REQU-0003 | Encryption Standard |
| REQU-0004 | Privacy Constraint |
| REQU-0005 | Latency Threshold |
| REQU-0006 | Performance SLA |
| REQU-0007 | Encryption Standard |
| REQU-0008 | Data Quality Check |

**t_column_pair_subject**

| id | column | subject_column |
| --- | --- | --- |
| SUBJ-0001 | log_level | REQU-0006 |
| SUBJ-0002 | batch_token | REQU-0007 |
| SUBJ-0003 | transaction_id | REQU-0001 |
| SUBJ-0004 | timestamp_utc | REQU-0006 |
| SUBJ-0005 | patient_id | REQU-0001 |
| SUBJ-0006 | transaction_id | REQU-0001 |
| SUBJ-0007 | batch_token | REQU-0001 |

Checksums and licenses provide the integrity and legal provenance layers for managed artifacts. A checksum such as c0ffee42 or 5e8f3c91 is a cryptographic fingerprint computed over an artifact's contents, enabling downstream systems to verify that the artifact has not been altered since it was registered. The same checksum value may appear across multiple artifacts—batch-processor-logs and sensor-calibration-v2 both carry 5e8f3c91—indicating they share identical content or were derived from the same source. Alongside integrity, licensing governs the terms under which an artifact may be used, redistributed, or modified. Artifacts in the system are tagged with licenses including BSD-3-Clause, CC-BY-4.0, and MIT, each imposing distinct obligations on consumers. For instance, the artifact genomic-sequence-17 carries the MIT license, while batch-processor-logs and sensor-calibration-v2 are both licensed under CC-BY-4.0, signaling that attribution is required for their use.

Requirements and subjects are not monolithic; they are enriched with attributes that capture the nuanced properties needed for enforcement and reporting. An attribute definition pairs a name—such as effective_date, enforcement, mandatory, priority, confidence, dimension_kind, method, or recorded_at—with a type that constrains the shape of its values. Types follow the XML Schema Definition (XSD) vocabulary: xsd:date for calendar dates, xsd:string for free-form text, xsd:boolean for true/false flags, xsd:integer for whole numbers, xsd:decimal for precise fractions, and xsd:dateTime for timestamped instants. This typed attribute model allows the same requirement entity to carry heterogeneous properties. The requirement Privacy Constraint (REQU-0001), for example, has an effective_date attribute typed as xsd:date and a mandatory attribute typed as xsd:boolean, while the requirement Encryption Standard (REQU-0002) carries an enforcement attribute of type xsd:string and a priority attribute of type xsd:integer.

**t_requirement_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| REQU-0001 | effective_date | xsd:date |
| REQU-0002 | enforcement | xsd:string |
| REQU-0003 | mandatory | xsd:boolean |
| REQU-0004 | priority | xsd:integer |
| REQU-0005 | review_cycle_days | xsd:integer |
| REQU-0006 | scope | xsd:string |
| REQU-0007 | encoding | xsd:string |
| REQU-0008 | label_text | xsd:string |

**t_requirement_basic_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0003 | true |
| REQU-0002 | REQU-0002 | REQU-0003 | false |
| REQU-0003 | REQU-0003 | REQU-0003 | false |
| REQU-0004 | REQU-0004 | REQU-0003 | false |
| REQU-0005 | REQU-0005 | REQU-0003 | true |
| REQU-0006 | REQU-0006 | REQU-0003 | false |
| REQU-0007 | REQU-0007 | REQU-0003 | false |
| REQU-0008 | REQU-0008 | REQU-0003 | false |

**t_requirement_basic_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0001 | 2025-06-11 |
| REQU-0002 | REQU-0002 | REQU-0001 | 2024-12-28 |
| REQU-0003 | REQU-0003 | REQU-0001 | 2023-09-17 |
| REQU-0004 | REQU-0004 | REQU-0001 | 2024-08-31 |
| REQU-0005 | REQU-0005 | REQU-0001 | 2024-05-25 |
| REQU-0006 | REQU-0006 | REQU-0001 | 2024-05-27 |
| REQU-0007 | REQU-0007 | REQU-0001 | 2023-07-24 |
| REQU-0008 | REQU-0008 | REQU-0001 | 2023-09-16 |

**t_requirement_basic_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0004 | 5 |
| REQU-0002 | REQU-0001 | REQU-0005 | 962 |
| REQU-0003 | REQU-0002 | REQU-0004 | 5 |
| REQU-0004 | REQU-0002 | REQU-0005 | 675 |
| REQU-0005 | REQU-0003 | REQU-0004 | 5 |
| REQU-0006 | REQU-0003 | REQU-0005 | 160 |
| REQU-0007 | REQU-0004 | REQU-0004 | 5 |
| REQU-0008 | REQU-0004 | REQU-0005 | 57 |

**t_column_pair_subject_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SUBJ-0001 | SUBJ-0001 | SUBJ-0004 | 2023-03-08T01:00:53 |
| SUBJ-0002 | SUBJ-0002 | SUBJ-0004 | 2023-09-25T09:20:34 |
| SUBJ-0003 | SUBJ-0003 | SUBJ-0004 | 2025-01-28T08:00:28 |
| SUBJ-0004 | SUBJ-0004 | SUBJ-0004 | 2023-08-23T03:35:02 |
| SUBJ-0005 | SUBJ-0005 | SUBJ-0004 | 2024-12-26T07:43:51 |
| SUBJ-0006 | SUBJ-0006 | SUBJ-0004 | 2025-02-08T03:11:44 |
| SUBJ-0007 | SUBJ-0007 | SUBJ-0004 | 2024-12-23T16:25:42 |

The actual values assigned to these attributes are stored in dedicated value tables, each specialized for a particular type. Boolean values such as true and false populate the value table for xsd:boolean attributes, recording whether a requirement is mandatory. Date values like 2025-06-11, 2024-12-28, 2023-09-17, and 2024-08-31 fill the xsd:date value table, establishing when each requirement takes effect. Integer values including 5 and 962 for one requirement, and 5 and 675 for another, populate the xsd:integer table to express priority levels. String values such as Encoding 01, Enforcement 02, calibration record, and en are stored in the varchar value table, while decimal values like 0.167, 866.89, and 939.39 capture confidence scores or dimensional measurements. Timestamped values such as 2023-03-08T01:00:53 and 2025-01-28T08:00:28 record when subjects were observed or evaluated. This separation of value types by table ensures type safety and enables efficient querying without sacrificing the flexibility to attach diverse properties to any entity.

**t_requirement_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0007 | Encoding 01 |
| REQU-0002 | REQU-0001 | REQU-0002 | Enforcement 02 |
| REQU-0003 | REQU-0001 | REQU-0008 | calibration record |
| REQU-0004 | REQU-0001 | REQU-0009 | en |
| REQU-0005 | REQU-0001 | REQU-0006 | Scope 05 |
| REQU-0006 | REQU-0002 | REQU-0007 | Encoding 06 |
| REQU-0007 | REQU-0002 | REQU-0002 | Enforcement 07 |
| REQU-0008 | REQU-0002 | REQU-0008 | calibration record |

The entity column in each value table ties a specific attribute value back to the requirement or subject it qualifies. For instance, the boolean value true is associated with entity REQU-0001 and attribute REQU-0003, indicating that the requirement identified as REQU-0001 has its mandatory attribute set to true. Similarly, the decimal value 0.167 is linked to entity SUBJ-0001 and attribute SUBJ-0001, expressing a confidence measure for the subject log_level. This entity-attribute-value triad forms the backbone of the compliance data model: an entity (whether a requirement like Privacy Constraint or a subject column like transaction_id) is characterized by a set of typed attributes, each holding a value that documents its current state. The model supports multiple values per entity-attribute pair, as seen with entity REQU-0001 carrying integer values 5 and 962 across different attributes, enabling rich, multi-dimensional descriptions of governance objects without requiring schema changes.

**t_column_pair_subject_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SUBJ-0001 | confidence | xsd:decimal |
| SUBJ-0002 | dimension_kind | xsd:string |
| SUBJ-0003 | method | xsd:string |
| SUBJ-0004 | recorded_at | xsd:dateTime |
| SUBJ-0005 | uncertainty | xsd:decimal |
| SUBJ-0006 | unit | xsd:string |
| SUBJ-0007 | value | xsd:decimal |
| SUBJ-0008 | encoding | xsd:string |

**t_column_pair_subject_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SUBJ-0001 | SUBJ-0001 | SUBJ-0001 | 0.167 |
| SUBJ-0002 | SUBJ-0001 | SUBJ-0005 | 866.89 |
| SUBJ-0003 | SUBJ-0001 | SUBJ-0007 | 939.39 |
| SUBJ-0004 | SUBJ-0002 | SUBJ-0001 | 0.312 |
| SUBJ-0005 | SUBJ-0002 | SUBJ-0005 | 788.04 |
| SUBJ-0006 | SUBJ-0002 | SUBJ-0007 | 1.19 |
| SUBJ-0007 | SUBJ-0003 | SUBJ-0001 | 0.974 |
| SUBJ-0008 | SUBJ-0003 | SUBJ-0005 | 706.00 |

**t_column_pair_subject_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SUBJ-0001 | SUBJ-0001 | SUBJ-0002 | Dimension Kind 01 |
| SUBJ-0002 | SUBJ-0001 | SUBJ-0008 | Encoding 02 |
| SUBJ-0003 | SUBJ-0001 | SUBJ-0009 | audit excerpt |
| SUBJ-0004 | SUBJ-0001 | SUBJ-0010 | ja |
| SUBJ-0005 | SUBJ-0001 | SUBJ-0003 | manual |
| SUBJ-0006 | SUBJ-0001 | SUBJ-0006 | ms |
| SUBJ-0007 | SUBJ-0002 | SUBJ-0002 | Dimension Kind 07 |
| SUBJ-0008 | SUBJ-0002 | SUBJ-0008 | Encoding 08 |