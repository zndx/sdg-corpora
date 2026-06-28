---
chapter_id: ch_live_black_belt_certification_requirement_c0b79e
topic_id: 16
family: 08_derived
cited_terms: ['black_belt_certification_requirement', 'control_subclass', 'descriptive_only_about_artifact']
model: engine-refine
---

The certification framework anchors on a set of black belt certification requirements—identifiable by codes such as REQU-0001 through REQU-0004—that prescribe domain-specific competencies including ProvenanceTrackingBB and LabQualityControlBB. Each requirement functions as an entity, a discrete unit of governance obligation, and is distinguished by a stable identifier that serves as the primary key across all related value tables. The identifier convention (REQU- prefixed sequences) provides a deterministic handle for referential integrity, ensuring that every attribute assignment, decimal measurement, timestamp, and free-text annotation can be traced back to the exact requirement it qualifies. This identifier-driven architecture supports auditability: an auditor querying for all evidence related to LabQualityControlBB can resolve the requirement through its key and follow foreign keys into every associated value table without ambiguity.

**t_black_belt_certification_requirement**

| id | black_belt_certification_requirement |
| --- | --- |
| REQU-0001 | ProvenanceTrackingBB |
| REQU-0002 | LabQualityControlBB |
| REQU-0003 | ProvenanceTrackingBB |
| REQU-0004 | LabQualityControlBB |
| REQU-0005 | ProvenanceTrackingBB |
| REQU-0006 | DataEngineeringBlackBelt |
| REQU-0007 | MLOpsQualityBB |
| REQU-0008 | APIGatewayBB |

**t_black_belt_certification_requirement_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| REQU-0001 | confidence | xsd:decimal |
| REQU-0002 | dimension_kind | xsd:string |
| REQU-0003 | method | xsd:string |
| REQU-0004 | recorded_at | xsd:dateTime |
| REQU-0005 | uncertainty | xsd:decimal |
| REQU-0006 | unit | xsd:string |
| REQU-0007 | value | xsd:decimal |
| REQU-0008 | encoding | xsd:string |

**t_black_belt_certification_requirement_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0004 | 2025-05-17T18:36:12 |
| REQU-0002 | REQU-0002 | REQU-0004 | 2024-10-05T03:41:40 |
| REQU-0003 | REQU-0003 | REQU-0004 | 2024-07-29T04:57:09 |
| REQU-0004 | REQU-0004 | REQU-0004 | 2025-04-05T22:06:20 |
| REQU-0005 | REQU-0005 | REQU-0004 | 2024-09-27T11:02:14 |
| REQU-0006 | REQU-0006 | REQU-0004 | 2023-05-05T18:06:19 |
| REQU-0007 | REQU-0007 | REQU-0004 | 2023-08-07T06:49:00 |
| REQU-0008 | REQU-0008 | REQU-0004 | 2023-09-09T17:25:37 |

**t_black_belt_certification_requirement_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0001 | 0.856 |
| REQU-0002 | REQU-0001 | REQU-0005 | 807.42 |
| REQU-0003 | REQU-0001 | REQU-0007 | 629.05 |
| REQU-0004 | REQU-0002 | REQU-0001 | 0.026 |
| REQU-0005 | REQU-0002 | REQU-0005 | 321.43 |
| REQU-0006 | REQU-0002 | REQU-0007 | 502.76 |
| REQU-0007 | REQU-0003 | REQU-0001 | 0.827 |
| REQU-0008 | REQU-0003 | REQU-0005 | 134.63 |

**t_black_belt_certification_requirement_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0002 | Dimension Kind 01 |
| REQU-0002 | REQU-0001 | REQU-0008 | Encoding 02 |
| REQU-0003 | REQU-0001 | REQU-0009 | pre-release note |
| REQU-0004 | REQU-0001 | REQU-0010 | ja |
| REQU-0005 | REQU-0001 | REQU-0003 | hybrid |
| REQU-0006 | REQU-0001 | REQU-0006 | m/s |
| REQU-0007 | REQU-0002 | REQU-0002 | Dimension Kind 07 |
| REQU-0008 | REQU-0002 | REQU-0008 | Encoding 08 |

**t_control_subclass**

| id | control |
| --- | --- |
| CONT-0001 | MFA enforcement |
| CONT-0002 | Backup frequency policy |
| CONT-0003 | Access review cycle |
| CONT-0004 | TLS 1.3 mandatory |
| CONT-0005 | Session timeout limit |
| CONT-0006 | Audit log retention |
| CONT-0007 | MFA enforcement |

**t_control_subclass_mitigates**

| id | mitigates |
| --- | --- |
| CONT-0001 | Service outage |
| CONT-0002 | Service outage |
| CONT-0003 | Phishing attack |
| CONT-0004 | Network intrusion |
| CONT-0005 | System downtime |
| CONT-0006 | Credential stuffing |
| CONT-0007 | Phishing attack |
| CONT-0008 | Data exfiltration |

Attributes attach to requirements through a typed attribute registry that declares both the semantic name and the data type of each property. The attribute catalogue includes confidence, dimension_kind, method, and recorded_at, each bound to an XSD type—xsd:decimal, xsd:string, or xsd:dateTime—that governs validation and storage. This separation of attribute metadata from attribute values enables schema evolution: new properties can be registered without altering the value tables, and type enforcement occurs at the registry level rather than in application logic. The attr column in the value tables holds a reference to this registry, creating a normalized many-to-many relationship between requirements and their typed properties.

Value storage is partitioned by type into three dedicated tables, each dedicated to a single data domain. Decimal values such as 0.856, 807.42, and 629.05 reside in the decimal valuation table, where entity_id links the measurement to a specific requirement and attr_id resolves the attribute being measured. String values—including Dimension Kind 01, Encoding 02, pre-release note, and the locale code ja—are stored in the varchar valuation table under the same entity_id and attr_id referencing pattern. Timestamps such as 2025-05-17T18:36:12 and 2024-10-05T03:41:40 occupy the datetime valuation table, capturing temporal metadata like the recorded_at attribute. This type-partitioned design avoids NULL proliferation and preserves type safety, while the misc column in each table carries the actual value payload.

Control subclass entries define the security and operational policies that mitigate specific risk categories. Controls such as MFA enforcement, Backup frequency policy, Access review cycle, and TLS 1.3 mandatory are identified by CONT- prefixed keys and are linked to the threats they address—Service outage, Phishing attack, and Network intrusion—through a junction table that encodes the relationship with a role qualifier. The role column distinguishes between owner, reviewer, observer, and contributor, establishing a RACI-like structure that clarifies accountability for each control-to-threat linkage. For instance, control CONT-0004 may serve as the owner of a mitigation against CONT-0007 while simultaneously acting as a reviewer for the mitigation of CONT-0002, enabling multi-role governance within a single relationship record.

**t_control_subclass__mitigates**

| id | control_id | mitigates_id | role |
| --- | --- | --- | --- |
| CONT-0001 | CONT-0004 | CONT-0007 | owner |
| CONT-0002 | CONT-0004 | CONT-0002 | reviewer |
| CONT-0003 | CONT-0007 | CONT-0004 | observer |
| CONT-0004 | CONT-0001 | CONT-0002 | contributor |
| CONT-0005 | CONT-0006 | CONT-0002 | observer |
| CONT-0006 | CONT-0005 | CONT-0001 | owner |
| CONT-0007 | CONT-0001 | CONT-0002 | observer |
| CONT-0008 | CONT-0006 | CONT-0008 | observer |

Descriptive facts form the analytical layer of the framework, capturing measured or asserted values about entities identified through the about column, which references the dim_about dimension table. Each fact carries a confidence score—ranging from 0.209 to 0.854 in the observed data—and an uncertainty magnitude expressed as a decimal such as 452.69 or 846.52, providing a dual-axis measure of evidentiary strength. The value column holds the substantive datum, whether 646.43 or 110.10, while the about_key foreign key resolves to a label and category from the dimension table, where about_category values such as About Category 01 through About Category 04 provide classification taxonomies. This structure supports probabilistic reasoning: a fact with confidence 0.854 and uncertainty 452.69 about an entity categorized as About Category 01 carries a different evidentiary weight than one with confidence 0.209 and uncertainty 846.52, enabling downstream systems to weight decisions by the reliability of their inputs.

**fact_descriptive**

| id | about_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| ARTI-0001 | ARTI-0005 | 0.854 | 452.69 | 646.43 |
| ARTI-0002 | ARTI-0002 | 0.209 | 846.52 | 408.39 |
| ARTI-0003 | ARTI-0002 | 0.761 | 532.60 | 850.50 |
| ARTI-0004 | ARTI-0004 | 0.480 | 663.65 | 110.19 |
| ARTI-0005 | ARTI-0006 | 0.697 | 535.73 | 322.53 |
| ARTI-0006 | ARTI-0003 | 0.238 | 734.71 | 457.41 |

**dim_about**

| id | about_label | about_category |
| --- | --- | --- |
| ARTI-0001 | About Label 01 | About Category 01 |
| ARTI-0002 | About Label 02 | About Category 02 |
| ARTI-0003 | About Label 03 | About Category 03 |
| ARTI-0004 | About Label 04 | About Category 04 |
| ARTI-0005 | About Label 05 | About Category 05 |
| ARTI-0006 | About Label 06 | About Category 06 |