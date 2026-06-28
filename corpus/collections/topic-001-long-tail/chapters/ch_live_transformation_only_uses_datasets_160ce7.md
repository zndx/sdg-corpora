---
chapter_id: ch_live_transformation_only_uses_datasets_160ce7
topic_id: 1
family: 05_provo_lineage
cited_terms: ['transformation_only_uses_datasets', 'attribute_set_basic', 'hipaa_safeguard_physical']
model: engine-refine
---

The foundational architecture of the data model rests upon a disciplined separation between identifiers, entities, and attributes, each serving a distinct ontological role within the governance framework. Identifiers function as stable, opaque handles—DATA-0001 through DATA-0004 for transformation records, SET-0001 through SET-0004 for attribute sets, and PHYS-0001 through PHYS-0004 for physical safeguards—ensuring referential integrity across all relational joins. Entities represent the concrete objects of interest: the event log archive, feature registry cache, ingestion buffer queue, and historical metrics dataset that transformations consume or produce; the Sensor ID and Data Source attributes that characterize telemetry sources; and the Alarm Siren System, Cabinet Lockdown Procedure, and Access Control Log that constitute HIPAA physical safeguards. Attributes themselves are classified by name and type within a schema registry—confidence as xsd:decimal, dimension_kind and method as xsd:string, recorded_at as xsd:dateTime—establishing a type system that constrains the values permissible in the misc column, which holds the actual data payloads.

**t_transformation_only_uses_datasets**

| id | transformation |
| --- | --- |
| DATA-0001 | validation check |
| DATA-0002 | signal denoising filter |
| DATA-0003 | calibration routine |
| DATA-0004 | telemetry ingestion filter |
| DATA-0005 | feature engineering step |
| DATA-0006 | format conversion layer |

**t_transformation_only_uses_datasets_uses_entity**

| id | uses_entity |
| --- | --- |
| DATA-0001 | event log archive |
| DATA-0002 | feature registry cache |
| DATA-0003 | ingestion buffer queue |
| DATA-0004 | historical metrics dataset |
| DATA-0005 | configuration manifest |
| DATA-0006 | configuration manifest |

**t_attribute_set_basic**

| id | attribute |
| --- | --- |
| SET-0001 | Sensor ID |
| SET-0002 | Sensor ID |
| SET-0003 | Sensor ID |
| SET-0004 | Data Source |
| SET-0005 | Sample Mass |
| SET-0006 | Quality Flag |

**t_attribute_set_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SET-0001 | confidence | xsd:decimal |
| SET-0002 | dimension_kind | xsd:string |
| SET-0003 | method | xsd:string |
| SET-0004 | recorded_at | xsd:dateTime |
| SET-0005 | uncertainty | xsd:decimal |
| SET-0006 | unit | xsd:string |
| SET-0007 | value | xsd:decimal |
| SET-0008 | encoding | xsd:string |

**t_attribute_set_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SET-0001 | SET-0001 | SET-0004 | 2025-04-11T14:14:38 |
| SET-0002 | SET-0002 | SET-0004 | 2024-10-27T12:43:31 |
| SET-0003 | SET-0003 | SET-0004 | 2023-07-18T04:02:37 |
| SET-0004 | SET-0004 | SET-0004 | 2025-04-28T09:26:57 |
| SET-0005 | SET-0005 | SET-0004 | 2023-08-28T23:05:03 |
| SET-0006 | SET-0006 | SET-0004 | 2024-02-14T11:29:41 |

**t_attribute_set_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SET-0001 | SET-0001 | SET-0001 | 0.501 |
| SET-0002 | SET-0001 | SET-0005 | 613.30 |
| SET-0003 | SET-0001 | SET-0007 | 863.60 |
| SET-0004 | SET-0002 | SET-0001 | 0.946 |
| SET-0005 | SET-0002 | SET-0005 | 609.02 |
| SET-0006 | SET-0002 | SET-0007 | 173.62 |
| SET-0007 | SET-0003 | SET-0001 | 0.926 |
| SET-0008 | SET-0003 | SET-0005 | 843.81 |

**t_hipaa_safeguard_physical**

| id | hipaa |
| --- | --- |
| PHYS-0001 | Alarm Siren System |
| PHYS-0002 | Cabinet Lockdown Procedure |
| PHYS-0003 | Access Control Log |
| PHYS-0004 | Cabinet Lockdown Procedure |
| PHYS-0005 | Badge Printer |
| PHYS-0006 | Badge Printer |

**t_hipaa_safeguard_physical_hipaa_safeguard**

| id | hipaa_safeguard |
| --- | --- |
| PHYS-0001 | Media Disposal Protocol |
| PHYS-0002 | Mantrap Entry |
| PHYS-0003 | CCTV Monitoring |
| PHYS-0004 | Equipment Maintenance Schedule |
| PHYS-0005 | Visitor Badge System |
| PHYS-0006 | Power Redundancy Plan |
| PHYS-0007 | Equipment Maintenance Schedule |
| PHYS-0008 | Keycard Reader |

The misc column serves as the universal value carrier across heterogeneous attribute types, storing temporal stamps such as 2025-04-11T14:14:38 and 2024-10-27T12:43:31 in the datetime valuation table, numeric measurements like 0.501, 613.30, and 863.60 in the decimal valuation table, and free-form strings including Dimension Kind 01, Encoding 02, audit excerpt, and the language code fr in the varchar valuation table. This tripartite value schema—datetime, decimal, varchar—mirrors the attr_type declarations in the attribute definition table, where each attr_id reference in the valuation tables resolves to a specific attribute name and its expected type. The entity_id column in each valuation table anchors the misc value to a particular SET-0001 or SET-0002 entity, while the attr_id column disambiguates which attribute of that entity the value describes, creating a normalized entity-attribute-value pattern that avoids wide, sparse tables while preserving type safety through the attr_type constraint.

**t_attribute_set_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SET-0001 | SET-0001 | SET-0002 | Dimension Kind 01 |
| SET-0002 | SET-0001 | SET-0008 | Encoding 02 |
| SET-0003 | SET-0001 | SET-0009 | audit excerpt |
| SET-0004 | SET-0001 | SET-0010 | fr |
| SET-0005 | SET-0001 | SET-0003 | hybrid |
| SET-0006 | SET-0001 | SET-0006 | ratio |
| SET-0007 | SET-0002 | SET-0002 | Dimension Kind 07 |
| SET-0008 | SET-0002 | SET-0008 | Encoding 08 |

Subject and target columns formalize binary relationships between entities, with the role column specifying the nature of the association. In the transformation-to-entity usage model, DATA-0003 (the calibration routine) assumes a contributor role toward DATA-0003 (the ingestion buffer queue entity), while DATA-0001 (the validation check) operates as an observer of DATA-0002 (the feature registry cache), and also as a reviewer of the same entity—demonstrating that a single subject-target pair can support multiple semantic roles depending on context. The HIPAA physical safeguard model follows an identical pattern: PHYS-0006 (Alarm Siren System) acts as owner of PHYS-0002 (Mantrap Entry), while PHYS-0001 (Cabinet Lockdown Procedure) serves as owner of PHYS-0008 (Equipment Maintenance Schedule), and PHYS-0002 (Access Control Log) functions as observer of the same target. The role enumeration—owner, reviewer, observer, contributor—provides a controlled vocabulary that distinguishes stewardship from passive awareness, enabling fine-grained access control and audit trail generation.

**t_transformation_only_uses_datasets__uses_entity**

| id | transformation_id | uses_entity_id | role |
| --- | --- | --- | --- |
| DATA-0001 | DATA-0003 | DATA-0002 | reviewer |
| DATA-0002 | DATA-0001 | DATA-0002 | observer |
| DATA-0003 | DATA-0003 | DATA-0003 | contributor |
| DATA-0004 | DATA-0001 | DATA-0004 | contributor |
| DATA-0005 | DATA-0005 | DATA-0001 | observer |
| DATA-0006 | DATA-0005 | DATA-0003 | reviewer |
| DATA-0007 | DATA-0003 | DATA-0006 | reviewer |
| DATA-0008 | DATA-0005 | DATA-0003 | contributor |

**t_hipaa_safeguard_physical__hipaa_safeguard**

| id | hipaa_id | hipaa_safeguard_id | role |
| --- | --- | --- | --- |
| PHYS-0001 | PHYS-0006 | PHYS-0002 | owner |
| PHYS-0002 | PHYS-0004 | PHYS-0005 | reviewer |
| PHYS-0003 | PHYS-0002 | PHYS-0008 | observer |
| PHYS-0004 | PHYS-0001 | PHYS-0008 | owner |
| PHYS-0005 | PHYS-0004 | PHYS-0003 | observer |
| PHYS-0006 | PHYS-0006 | PHYS-0004 | owner |
| PHYS-0007 | PHYS-0001 | PHYS-0001 | reviewer |
| PHYS-0008 | PHYS-0002 | PHYS-0008 | contributor |

This relational discipline—where identifiers provide stable keys, entities represent domain objects, attributes define their properties with typed values, and subject-target-role triples encode relationships—constitutes a general-purpose metadata substrate. It supports both the operational telemetry pipeline, where transformations like signal denoising filter and telemetry ingestion filter consume entities such as the event log archive and historical metrics dataset, and the compliance infrastructure, where physical safeguards like Media Disposal Protocol and CCTV Monitoring are governed by defined roles. The model's strength lies in its uniformity: whether describing a data transformation's dependency on a cache, a sensor's recorded confidence score, or a safeguard's ownership chain, the same structural primitives apply, enabling consistent querying, auditing, and policy enforcement across heterogeneous data domains.