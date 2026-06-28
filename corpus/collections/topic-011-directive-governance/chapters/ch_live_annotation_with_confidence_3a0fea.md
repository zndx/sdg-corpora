---
chapter_id: ch_live_annotation_with_confidence_3a0fea
topic_id: 11
family: 02_observation_measurement
cited_terms: ['annotation_with_confidence', 'requirement_has_priority', 'claim_subclass']
model: engine-refine
---

Attributes in this governance framework are typed, entity-scoped properties that bind structured values to operational requirements. The attribute registry distinguishes names such as `effective_date`, `enforcement`, `mandatory`, and `priority` from their corresponding data types—`xsd:date`, `xsd:string`, `xsd:boolean`, and `xsd:integer`—ensuring that every value assignment is validated against a schema. An entity, identified by a unique key like `PRIO-0001` or `PRIO-0002`, serves as the anchor point for these attribute-value bindings; the same entity may carry multiple attributes of different types, each stored in its own typed value table. For instance, the requirement identified as `PRIO-0001` carries an `effective_date` of `2023-09-07`, a boolean `mandatory` flag set to `false`, an integer value of `3` under one attribute and `56` under another, and a string attribute holding `Encoding 01`. This separation of attribute metadata from value storage by type avoids the pitfalls of wide, sparse tables and permits type-safe queries across heterogeneous data.

**t_requirement_has_priority_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PRIO-0001 | PRIO-0001 | PRIO-0003 | false |
| PRIO-0002 | PRIO-0002 | PRIO-0003 | false |
| PRIO-0003 | PRIO-0003 | PRIO-0003 | false |
| PRIO-0004 | PRIO-0004 | PRIO-0003 | false |
| PRIO-0005 | PRIO-0005 | PRIO-0003 | true |
| PRIO-0006 | PRIO-0006 | PRIO-0003 | false |
| PRIO-0007 | PRIO-0007 | PRIO-0003 | false |
| PRIO-0008 | PRIO-0008 | PRIO-0003 | true |

**t_requirement_has_priority_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PRIO-0001 | PRIO-0001 | PRIO-0001 | 2023-09-07 |
| PRIO-0002 | PRIO-0002 | PRIO-0001 | 2024-08-03 |
| PRIO-0003 | PRIO-0003 | PRIO-0001 | 2024-06-06 |
| PRIO-0004 | PRIO-0004 | PRIO-0001 | 2023-04-21 |
| PRIO-0005 | PRIO-0005 | PRIO-0001 | 2025-04-04 |
| PRIO-0006 | PRIO-0006 | PRIO-0001 | 2024-12-07 |
| PRIO-0007 | PRIO-0007 | PRIO-0001 | 2025-04-01 |
| PRIO-0008 | PRIO-0008 | PRIO-0001 | 2024-09-28 |

**t_requirement_has_priority_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PRIO-0001 | PRIO-0001 | PRIO-0004 | 3 |
| PRIO-0002 | PRIO-0001 | PRIO-0005 | 56 |
| PRIO-0003 | PRIO-0002 | PRIO-0004 | 2 |
| PRIO-0004 | PRIO-0002 | PRIO-0005 | 806 |
| PRIO-0005 | PRIO-0003 | PRIO-0004 | 5 |
| PRIO-0006 | PRIO-0003 | PRIO-0005 | 944 |
| PRIO-0007 | PRIO-0004 | PRIO-0004 | 4 |
| PRIO-0008 | PRIO-0004 | PRIO-0005 | 343 |

The identifier is the primary key that threads through every layer of the model, from the requirement itself to its attributes, values, and associated claims. In the priority registry, identifiers such as `PRIO-0001` through `PRIO-0004` map to human-readable requirement descriptions—`Latency threshold`, `Backup interval`, `Throughput minimum`, `Audit log frequency`—while in the claim registry, identifiers like `CLAI-0001` through `CLAI-0004` anchor assertions such as `Lab centrifuge unit-7`, `QC sample failed`, `Packet loss SLA breach`, and `Authentication microservice`. These identifiers are not merely labels; they are the join keys that connect requirements to their typed attributes, their confidence annotations, and the claims that reference them. A claim about `PRIO-0008`, for example, is traceable back to the underlying requirement through this identifier chain.

**t_requirement_has_priority**

| id | requirement | priority |
| --- | --- | --- |
| PRIO-0001 | Latency threshold | CLAI-0003 |
| PRIO-0002 | Backup interval | CLAI-0002 |
| PRIO-0003 | Throughput minimum | CLAI-0006 |
| PRIO-0004 | Audit log frequency | CLAI-0005 |
| PRIO-0005 | Throughput minimum | CLAI-0001 |
| PRIO-0006 | Encryption standard | CLAI-0003 |
| PRIO-0007 | Throughput minimum | CLAI-0001 |
| PRIO-0008 | Fault tolerance level | CLAI-0005 |

**t_requirement_has_priority_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| PRIO-0001 | effective_date | xsd:date |
| PRIO-0002 | enforcement | xsd:string |
| PRIO-0003 | mandatory | xsd:boolean |
| PRIO-0004 | priority | xsd:integer |
| PRIO-0005 | review_cycle_days | xsd:integer |
| PRIO-0006 | scope | xsd:string |
| PRIO-0007 | encoding | xsd:string |
| PRIO-0008 | label_text | xsd:string |

**t_claim_subclass**

| id | claim | claim_about | method | label_text |
| --- | --- | --- | --- | --- |
| CLAI-0001 | Lab centrifuge unit-7 | PRIO-0003 | automated | audit excerpt |
| CLAI-0002 | QC sample failed | PRIO-0008 | hybrid | intake form |
| CLAI-0003 | Packet loss SLA breach | PRIO-0008 | hybrid | pre-release note |
| CLAI-0004 | Authentication microservice | PRIO-0008 | inferred | calibration record |
| CLAI-0005 | Telemetry endpoint offline | PRIO-0001 | automated | intake form |
| CLAI-0006 | Pipeline latency spike | PRIO-0006 | automated | change rationale |

The method column captures the provenance of a claim—whether it was derived through `automated` analysis, `hybrid` human-machine review, or `inferred` reasoning. This distinction matters for auditability and risk assessment: a claim labeled `QC sample failed` with method `hybrid` and label text `intake form` carries a different evidentiary weight than `Packet loss SLA breach`, also `hybrid` but grounded in a `pre-release note`. The `label_text` field itself provides the document or artifact that substantiates the claim—`audit excerpt`, `intake form`, `pre-release note`, `calibration record`—creating a paper trail that can be independently verified. Together, method and label_text form a lightweight provenance model that does not require a separate audit log table.

Subject and target are the relational axes of the confidence annotation model. The junction table `t_annotation_with_confidence__confidence` links an annotation (the subject) to a confidence level (the target) through a role that specifies the annotator's function—`contributor`, `observer`, or `reviewer`. An annotation such as `Telemetry Stream US East` (identifier `CONF-0007`) may appear as a subject linked to the confidence level `Expert Verified` (identifier `CONF-0006`) with the role `contributor`, while the same annotation `Lab Assay Plate 12B` (identifier `CONF-0001`) can simultaneously serve as a subject linked to `95 Percent Confidence` (identifier `CONF-0004`) with role `contributor` and to `Cross Referenced` (identifier `CONF-0005`) with role `observer`. This many-to-many structure allows a single piece of evidence to carry multiple confidence assessments from different stakeholders, each with a distinct role.

**t_annotation_with_confidence**

| id | annotation |
| --- | --- |
| CONF-0001 | Telemetry Stream US East |
| CONF-0002 | Lab Assay Plate 12B |
| CONF-0003 | Lab Assay Plate 12B |
| CONF-0004 | Lab Assay Plate 12B |
| CONF-0005 | Gene Expression Run X42 |
| CONF-0006 | Telemetry Stream US East |
| CONF-0007 | Clinical Trial Arm C |

**t_annotation_with_confidence_confidence**

| id | confidence |
| --- | --- |
| CONF-0001 | 95 Percent Confidence |
| CONF-0002 | Cross Referenced |
| CONF-0003 | Ensemble Agreement |
| CONF-0004 | Expert Verified |
| CONF-0005 | P Value 0.01 |
| CONF-0006 | Expert Verified |

**t_annotation_with_confidence__confidence**

| id | annotation_id | confidence_id | role |
| --- | --- | --- | --- |
| CONF-0001 | CONF-0007 | CONF-0006 | contributor |
| CONF-0002 | CONF-0001 | CONF-0004 | observer |
| CONF-0003 | CONF-0001 | CONF-0005 | contributor |
| CONF-0004 | CONF-0002 | CONF-0001 | reviewer |
| CONF-0005 | CONF-0006 | CONF-0005 | observer |
| CONF-0006 | CONF-0001 | CONF-0001 | owner |
| CONF-0007 | CONF-0004 | CONF-0005 | owner |
| CONF-0008 | CONF-0006 | CONF-0002 | contributor |

The misc column houses the actual attribute values, partitioned by type into boolean, date, integer, and varchar tables. This design choice reflects the heterogeneity of operational data: a requirement's `mandatory` flag is a simple `false`, its `effective_date` is `2024-08-03`, its priority score is the integer `806`, and its enforcement instruction is the string `ja`. The varchar table also captures free-form values like `intake form` and `Encoding 01`, demonstrating that not all string attributes are controlled vocabularies. By segregating values by type, the model enforces schema discipline at the storage layer while keeping the attribute registry decoupled from any single value domain.

**t_requirement_has_priority_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PRIO-0001 | PRIO-0001 | PRIO-0007 | Encoding 01 |
| PRIO-0002 | PRIO-0001 | PRIO-0002 | Enforcement 02 |
| PRIO-0003 | PRIO-0001 | PRIO-0008 | intake form |
| PRIO-0004 | PRIO-0001 | PRIO-0009 | ja |
| PRIO-0005 | PRIO-0001 | PRIO-0006 | Scope 05 |
| PRIO-0006 | PRIO-0002 | PRIO-0007 | Encoding 06 |
| PRIO-0007 | PRIO-0002 | PRIO-0002 | Enforcement 07 |
| PRIO-0008 | PRIO-0002 | PRIO-0008 | intake form |