---
chapter_id: ch_live_measurement_with_op_artifact_d97b43
topic_id: 186
family: 02_observation_measurement
cited_terms: ['measurement_with_op_artifact', 'directive_union_constraint_or_policy', 'attribute_set_basic']
model: engine-refine
---

In governed operational and compliance systems, every fact that must be audited, compared, or enforced begins with a stable identifier—a durable surrogate key that outlives renaming, reclassification, or downstream system migration. Identifiers such as ARTI-0001, POLI-0003, and SET-0002 are not merely database keys; they are the contractual handles by which measurements, policies, and attribute sets are referenced across ingestion pipelines, validation engines, retention schedulers, and access-control matrices. When a seismic calibration unit measurement is tied to a network switch port under ARTI-0001, or when a Lab Assay Protocol is registered as POLI-0003, those codes become the anchors for lineage, obligation tracking, and cross-domain joins. Without such identifiers, attribute values would float unattached, policies could not be versioned against the entities they govern, and compliance evidence would collapse into ambiguous prose rather than machine-verifiable records.

**t_attribute_set_basic**

| id | attribute |
| --- | --- |
| SET-0001 | Sensor ID |
| SET-0002 | Sensor ID |
| SET-0003 | Sensor ID |
| SET-0004 | Data Source |
| SET-0005 | Sample Mass |
| SET-0006 | Quality Flag |

An entity, in this architectural sense, is the thing to which attributes are ascribed—the subject of description rather than the description itself. The entity is not always synonymous with the identifier on the primary record; in value-bearing relations, entity_id explicitly marks which governed object carries a given fact. A single measurement artifact may accumulate many attribute bindings: ARTI-0001 holds a confidence score of 0.340, a dimension kind of "Dimension Kind 01," and a recorded_at timestamp of 2024-07-05T11:56:13, each linked back to the same entity_id. Likewise, directive records POLI-0001 through POLI-0004 each function as entities whose enforcement posture, effective dates, and priority tiers are asserted through separate value rows. Treating entity as a first-class concept matters because governance logic operates on objects—sensors, protocols, calibration runs—not on rows in isolation; auditors ask what was true about ARTI-0002's reactor fuel rod context at a point in time, not which insert statement last touched a table.

**t_measurement_with_op_artifact**

| id | measurement | about |
| --- | --- | --- |
| ARTI-0001 | Seismic Calibration Unit | Network Switch Port |
| ARTI-0002 | Seismic Calibration Unit | Reactor Fuel Rod |
| ARTI-0003 | Turbidity Index | Network Switch Port |
| ARTI-0004 | Seismic Calibration Unit | Drone Battery Pack |
| ARTI-0005 | pH Batch Alpha Assay | Soil Core B |
| ARTI-0006 | Soil Moisture Profile | Drone Battery Pack |

**t_measurement_with_op_artifact_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ARTI-0001 | confidence | xsd:decimal |
| ARTI-0002 | dimension_kind | xsd:string |
| ARTI-0003 | method | xsd:string |
| ARTI-0004 | recorded_at | xsd:dateTime |
| ARTI-0005 | uncertainty | xsd:decimal |
| ARTI-0006 | unit | xsd:string |
| ARTI-0007 | value | xsd:decimal |
| ARTI-0008 | encoding | xsd:string |

**t_measurement_with_op_artifact_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0004 | 2024-07-05T11:56:13 |
| ARTI-0002 | ARTI-0002 | ARTI-0004 | 2024-04-19T15:36:13 |
| ARTI-0003 | ARTI-0003 | ARTI-0004 | 2023-08-09T17:12:55 |
| ARTI-0004 | ARTI-0004 | ARTI-0004 | 2023-08-07T05:21:09 |
| ARTI-0005 | ARTI-0005 | ARTI-0004 | 2024-01-27T15:32:18 |
| ARTI-0006 | ARTI-0006 | ARTI-0004 | 2024-09-24T04:37:52 |

**t_measurement_with_op_artifact_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0001 | 0.340 |
| ARTI-0002 | ARTI-0001 | ARTI-0005 | 723.57 |
| ARTI-0003 | ARTI-0001 | ARTI-0007 | 106.04 |
| ARTI-0004 | ARTI-0002 | ARTI-0001 | 0.434 |
| ARTI-0005 | ARTI-0002 | ARTI-0005 | 258.77 |
| ARTI-0006 | ARTI-0002 | ARTI-0007 | 846.45 |
| ARTI-0007 | ARTI-0003 | ARTI-0001 | 0.917 |
| ARTI-0008 | ARTI-0003 | ARTI-0005 | 397.02 |

**t_measurement_with_op_artifact_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0002 | Dimension Kind 01 |
| ARTI-0002 | ARTI-0001 | ARTI-0008 | Encoding 02 |
| ARTI-0003 | ARTI-0001 | ARTI-0009 | change rationale |
| ARTI-0004 | ARTI-0001 | ARTI-0010 | fr |
| ARTI-0005 | ARTI-0001 | ARTI-0003 | manual |
| ARTI-0006 | ARTI-0001 | ARTI-0006 | m/s |
| ARTI-0007 | ARTI-0002 | ARTI-0002 | Dimension Kind 07 |
| ARTI-0008 | ARTI-0002 | ARTI-0008 | Encoding 08 |

Attributes—denoted attr in schema metadata and realized as attr_name in definition records—name the semantic slots into which typed values may be placed. They are the controlled vocabulary of describable properties: confidence, dimension_kind, method, recorded_at on measurement and attribute-set artifacts; effective_date, enforcement, mandatory, and priority on policy directives. Defining attributes separately from their values allows the same conceptual property to appear across domains without duplicating validation rules or storage strategy. When three separate attribute sets all declare a Sensor ID while a fourth declares Data Source, the attr layer expresses what may be said about each set; the value layer expresses what was actually said. This separation is why attr functions as a governance primitive: attribute names can be cataloged, authorized, mapped to regulatory fields, and restricted so that only approved properties enter the compliance record.

Attr type completes the semantic contract by specifying how an attribute may be interpreted, validated, and physically stored. Types drawn from XSD—xsd:decimal for confidence scores, xsd:string for enforcement labels and dimension kinds, xsd:dateTime for acquisition timestamps, xsd:date for policy effective dates, xsd:boolean for mandatory flags, xsd:integer for priority ranks—are not cosmetic labels. They determine permissible precision, comparison semantics, timezone handling, and which value repository accepts the payload. A confidence value of 0.434 and a priority value of 854 belong in decimal and integer stores respectively; coercing them into a generic string column would preserve characters while destroying the comparability that automated compliance checks require. In practice, attr type is the bridge between human-readable policy language ("mandatory," "effective_date") and the typed operations—threshold tests, date-window enforcement, boolean gatekeeping—that operational systems execute without ambiguity.

The misc designation marks the residual payload category: the concrete value instance that satisfies an attribute definition for a specific entity at a specific binding. Misc is deliberately type-agnostic in metadata because the authoritative representation lives in type-partitioned value stores—decimal tables for 0.340 and 723.57, varchar tables for "Encoding 02" and "change rationale," datetime tables for 2023-08-09T17:12:55, boolean tables for mandatory=true on POLI-0001 through POLI-0003, date tables for effective_date 2024-10-31. Partitioning misc by attr type prevents schema pollution, keeps indexes efficient, and allows validators to reject ill-typed assertions before they enter the evidentiary record. The pattern also surfaces operational nuance: multiple value rows may reference the same entity_id with different attr_id values, modeling a rich attribute graph rather than a flat document, while attr_id consistently points back to the attribute definition that gives each misc value its meaning.

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

Together, identifier, entity, attr, attr_type, and misc form an evidence-grade attribution model suited to heterogeneous compliance domains—from seismic calibration units and turbidity indices to retention rules and access-control policies. Identifiers stabilize reference; entities designate what is being characterized; attrs name the governed properties; attr types enforce interpretability; misc carries the attestable facts. When an auditor verifies that POLI-0004's Access Control Policy is non-mandatory as of effective_date 2024-05-10 with priority 854, or that SET-0001's Sensor ID attribute set recorded confidence 0.501 on 2025-04-11T14:14:38, they are traversing this model, not reading ad hoc fields. That is why these constructs matter in practice: they transform operational telemetry and policy prose into structured, typed, entity-bound evidence that can be validated, retained, queried across directives, and defended under scrutiny without collapsing the distinction between what something is, what may be said about it, and what was in fact recorded.

**t_directive_union_constraint_or_policy**

| id | directive | directive_2 | directive_3 |
| --- | --- | --- | --- |
| POLI-0001 | Compliance Validation Spec | Retention Duration Rule | Sensor Calibration Directive |
| POLI-0002 | Refresh Cycle Rule | Retention Duration Rule | Batch Size Constraint |
| POLI-0003 | Lab Assay Protocol | pH Range Specification | Telemetry Sampling Rule |
| POLI-0004 | Access Control Policy | Logging Level Directive | Calibration Frequency Spec |
| POLI-0005 | Access Control Policy | Retention Duration Rule | Integrity Check Requirement |
| POLI-0006 | Calibration Frequency Spec | Access Control Policy | Sampling Interval Rule |
| POLI-0007 | Data Quality Standard | Validation Check | Audit Log Requirement |

**t_directive_union_constraint_or_policy_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| POLI-0001 | effective_date | xsd:date |
| POLI-0002 | enforcement | xsd:string |
| POLI-0003 | mandatory | xsd:boolean |
| POLI-0004 | priority | xsd:integer |
| POLI-0005 | review_cycle_days | xsd:integer |
| POLI-0006 | scope | xsd:string |
| POLI-0007 | encoding | xsd:string |
| POLI-0008 | label_text | xsd:string |

**t_directive_union_constraint_or_policy_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0003 | true |
| POLI-0002 | POLI-0002 | POLI-0003 | true |
| POLI-0003 | POLI-0003 | POLI-0003 | true |
| POLI-0004 | POLI-0004 | POLI-0003 | false |
| POLI-0005 | POLI-0005 | POLI-0003 | true |
| POLI-0006 | POLI-0006 | POLI-0003 | true |
| POLI-0007 | POLI-0007 | POLI-0003 | false |

**t_directive_union_constraint_or_policy_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0001 | 2024-10-31 |
| POLI-0002 | POLI-0002 | POLI-0001 | 2024-11-24 |
| POLI-0003 | POLI-0003 | POLI-0001 | 2023-02-17 |
| POLI-0004 | POLI-0004 | POLI-0001 | 2024-05-10 |
| POLI-0005 | POLI-0005 | POLI-0001 | 2025-01-01 |
| POLI-0006 | POLI-0006 | POLI-0001 | 2024-10-28 |
| POLI-0007 | POLI-0007 | POLI-0001 | 2023-09-29 |

**t_directive_union_constraint_or_policy_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0004 | 3 |
| POLI-0002 | POLI-0001 | POLI-0005 | 17 |
| POLI-0003 | POLI-0002 | POLI-0004 | 5 |
| POLI-0004 | POLI-0002 | POLI-0005 | 854 |
| POLI-0005 | POLI-0003 | POLI-0004 | 1 |
| POLI-0006 | POLI-0003 | POLI-0005 | 61 |
| POLI-0007 | POLI-0004 | POLI-0004 | 4 |
| POLI-0008 | POLI-0004 | POLI-0005 | 65 |

**t_directive_union_constraint_or_policy_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0007 | Encoding 01 |
| POLI-0002 | POLI-0001 | POLI-0002 | Enforcement 02 |
| POLI-0003 | POLI-0001 | POLI-0008 | change rationale |
| POLI-0004 | POLI-0001 | POLI-0009 | fr |
| POLI-0005 | POLI-0001 | POLI-0006 | Scope 05 |
| POLI-0006 | POLI-0002 | POLI-0007 | Encoding 06 |
| POLI-0007 | POLI-0002 | POLI-0002 | Enforcement 07 |
| POLI-0008 | POLI-0002 | POLI-0008 | calibration record |

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