---
chapter_id: ch_live_outlier_claim_min_one_attribute_22a381
topic_id: 1
family: 02_observation_measurement
cited_terms: ['outlier_claim_min_one_attribute', 'lineage_edge_basic', 'hipaa_safeguard_physical']
model: engine-refine
---

In data governance architectures, entities serve as the foundational units of description, each identified by a stable identifier that anchors all subsequent attribute-value associations. An outlier claim such as ATTR-0001, classified under the anomaly type count_mismatch_feedA and linked to the physical safeguard set PHYS-0001, constitutes one such entity; similarly, a lineage edge identified as EDGE-0001 and designated as a Financial Reconciliation Trace operates as an entity of a different class. The entity model is not monolithic — outlier claims, lineage edges, and HIPAA physical safeguards each inhabit their own entity namespace, yet all share the same structural discipline: a primary identifier column that functions as the universal key for every attribute and relationship table that follows. This identifier-level anchoring ensures that every attribute value, regardless of its data type, can be traced back to a single, unambiguous entity instance.

**t_outlier_claim_min_one_attribute**

| id | outlier | attribute_set |
| --- | --- | --- |
| ATTR-0001 | count_mismatch_feedA | PHYS-0001 |
| ATTR-0002 | log_checksum_fail | PHYS-0001 |
| ATTR-0003 | telemetry_gap_night | PHYS-0006 |
| ATTR-0004 | voltage_sag_event | PHYS-0004 |
| ATTR-0005 | telemetry_gap_night | PHYS-0004 |
| ATTR-0006 | throughput_drop_zone3 | PHYS-0004 |

**t_outlier_claim_min_one_attribute_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ATTR-0001 | confidence | xsd:decimal |
| ATTR-0002 | dimension_kind | xsd:string |
| ATTR-0003 | method | xsd:string |
| ATTR-0004 | recorded_at | xsd:dateTime |
| ATTR-0005 | uncertainty | xsd:decimal |
| ATTR-0006 | unit | xsd:string |
| ATTR-0007 | value | xsd:decimal |
| ATTR-0008 | encoding | xsd:string |

**t_outlier_claim_min_one_attribute_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0001 | 0.179 |
| ATTR-0002 | ATTR-0001 | ATTR-0005 | 145.76 |
| ATTR-0003 | ATTR-0001 | ATTR-0007 | 830.74 |
| ATTR-0004 | ATTR-0002 | ATTR-0001 | 0.034 |
| ATTR-0005 | ATTR-0002 | ATTR-0005 | 316.10 |
| ATTR-0006 | ATTR-0002 | ATTR-0007 | 304.68 |
| ATTR-0007 | ATTR-0003 | ATTR-0001 | 0.373 |
| ATTR-0008 | ATTR-0003 | ATTR-0005 | 478.83 |

**t_lineage_edge_basic**

| id | lineage |
| --- | --- |
| EDGE-0001 | Financial Reconciliation Trace |
| EDGE-0002 | Compliance Verification Path |
| EDGE-0003 | Data Lake Ingestion Chain |
| EDGE-0004 | Supply Chain Audit Trail |
| EDGE-0005 | Sensor Calibration Pipeline |
| EDGE-0006 | Supply Chain Audit Trail |
| EDGE-0007 | Document Revision History |
| EDGE-0008 | Genomic Variant Processing |

**t_lineage_edge_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| EDGE-0001 | confidence | xsd:decimal |
| EDGE-0002 | dimension_kind | xsd:string |
| EDGE-0003 | method | xsd:string |
| EDGE-0004 | recorded_at | xsd:dateTime |
| EDGE-0005 | uncertainty | xsd:decimal |
| EDGE-0006 | unit | xsd:string |
| EDGE-0007 | value | xsd:decimal |
| EDGE-0008 | encoding | xsd:string |

**t_lineage_edge_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EDGE-0001 | EDGE-0001 | EDGE-0004 | 2023-06-18T00:21:12 |
| EDGE-0002 | EDGE-0002 | EDGE-0004 | 2023-11-20T00:15:50 |
| EDGE-0003 | EDGE-0003 | EDGE-0004 | 2023-03-09T06:34:54 |
| EDGE-0004 | EDGE-0004 | EDGE-0004 | 2023-04-04T09:21:45 |
| EDGE-0005 | EDGE-0005 | EDGE-0004 | 2025-02-06T04:35:19 |
| EDGE-0006 | EDGE-0006 | EDGE-0004 | 2023-09-20T23:51:28 |
| EDGE-0007 | EDGE-0007 | EDGE-0004 | 2023-03-25T22:49:39 |
| EDGE-0008 | EDGE-0008 | EDGE-0004 | 2025-02-12T13:04:31 |

**t_lineage_edge_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EDGE-0001 | EDGE-0001 | EDGE-0001 | 0.947 |
| EDGE-0002 | EDGE-0001 | EDGE-0005 | 637.72 |
| EDGE-0003 | EDGE-0001 | EDGE-0007 | 513.28 |
| EDGE-0004 | EDGE-0002 | EDGE-0001 | 0.497 |
| EDGE-0005 | EDGE-0002 | EDGE-0005 | 852.97 |
| EDGE-0006 | EDGE-0002 | EDGE-0007 | 198.62 |
| EDGE-0007 | EDGE-0003 | EDGE-0001 | 0.290 |
| EDGE-0008 | EDGE-0003 | EDGE-0005 | 468.80 |

**t_lineage_edge_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EDGE-0001 | EDGE-0001 | EDGE-0002 | Dimension Kind 01 |
| EDGE-0002 | EDGE-0001 | EDGE-0008 | Encoding 02 |
| EDGE-0003 | EDGE-0001 | EDGE-0009 | change rationale |
| EDGE-0004 | EDGE-0001 | EDGE-0010 | de |
| EDGE-0005 | EDGE-0001 | EDGE-0003 | manual |
| EDGE-0006 | EDGE-0001 | EDGE-0006 | count |
| EDGE-0007 | EDGE-0002 | EDGE-0002 | Dimension Kind 07 |
| EDGE-0008 | EDGE-0002 | EDGE-0008 | Encoding 08 |

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

Attributes and their types form the descriptive layer that sits atop entities. An attribute definition — whether it names confidence, dimension_kind, method, or recorded_at — carries an associated attr_type that constrains the permissible value domain: xsd:decimal for numeric precision, xsd:string for categorical labels, and xsd:dateTime for temporal markers. The attr_type is not metadata for display purposes; it is a schema-level enforcement mechanism that determines which value table a given attr_id must reference. A confidence attribute typed as xsd:decimal resolves to the decimal value store, where entries such as 0.179 or 145.76 are recorded against entity identifiers like ATTR-0001 and ATTR-0002. A recorded_at attribute typed as xsd:dateTime resolves to the datetime value store, anchoring timestamps such as 2023-09-29T17:50:45 or 2025-03-24T15:12:01 to the same entity. This type-driven dispatch into separate value tables — decimal, datetime, varchar — is the mechanism by which the model achieves both type safety and storage efficiency without sacrificing query flexibility.

The value tables themselves embody the misc concept: they are heterogeneous containers that hold the actual descriptive content of attributes, each partitioned by attr_type. A varchar value table stores strings such as Dimension Kind 01, Encoding 02, calibration record, and de, each associated with an entity_id and an attr_id that together form a composite foreign key. The entity_id in these value tables does not always point to the entity the attribute semantically describes — in the outlier claim model, ATTR-0001 through ATTR-0004 appear as entity_id values in the datetime value table, each paired with attr_id ATTR-0004 (recorded_at), indicating that the recorded_at attribute is itself being attributed to other attributes. This self-referential pattern, where attributes become entities that carry their own attributes, is a deliberate design choice that enables metamodeling: the system can describe how it describes data.

**t_outlier_claim_min_one_attribute_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0004 | 2023-09-29T17:50:45 |
| ATTR-0002 | ATTR-0002 | ATTR-0004 | 2023-11-30T14:55:48 |
| ATTR-0003 | ATTR-0003 | ATTR-0004 | 2024-10-03T15:06:44 |
| ATTR-0004 | ATTR-0004 | ATTR-0004 | 2025-03-24T15:12:01 |
| ATTR-0005 | ATTR-0005 | ATTR-0004 | 2025-03-04T01:17:47 |
| ATTR-0006 | ATTR-0006 | ATTR-0004 | 2024-12-29T13:19:15 |

**t_outlier_claim_min_one_attribute_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0002 | Dimension Kind 01 |
| ATTR-0002 | ATTR-0001 | ATTR-0008 | Encoding 02 |
| ATTR-0003 | ATTR-0001 | ATTR-0009 | calibration record |
| ATTR-0004 | ATTR-0001 | ATTR-0010 | de |
| ATTR-0005 | ATTR-0001 | ATTR-0003 | hybrid |
| ATTR-0006 | ATTR-0001 | ATTR-0006 | m/s |
| ATTR-0007 | ATTR-0002 | ATTR-0002 | Dimension Kind 07 |
| ATTR-0008 | ATTR-0002 | ATTR-0008 | Encoding 08 |

Relationships between entities are expressed through junction tables that encode subject, target, and role. The HIPAA physical safeguard model illustrates this triad: a junction record with identifier PHYS-0001 links a subject entity (hipaa_id PHYS-0006) to a target entity (hipaa_safeguard_id PHYS-0002) under the role owner, while PHYS-0004 links subject PHYS-0001 to target PHYS-0008 under the role owner. The role column is not a passive label; it semantically qualifies the direction and nature of the relationship, distinguishing between owner, reviewer, and observer in the same subject-target pair space. The subject and target columns are both foreign keys into the entity namespace, meaning that any entity — whether an outlier claim, a lineage edge, or a safeguard — can serve as either the source or the destination of a relationship. This symmetry allows the model to represent bidirectional dependencies without requiring separate tables for inverse relationships.

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

The practical consequence of this architecture is that every piece of descriptive data — whether it is a confidence score of 0.947 attached to a lineage edge, a Cabinet Lockdown Procedure safeguard, or a timestamp of 2023-11-30T14:55:48 on an outlier claim — exists at the intersection of three dimensions: the entity it describes, the attribute that qualifies it, and the value type that constrains it. When an audit trail requires reconstructing the full provenance of a Compliance Verification Path (EDGE-0002), the system resolves the entity EDGE-0002 through its identifier, dispatches each of its attributes to the appropriate value table based on attr_type, and follows any relationship edges through subject-target-role triples. The result is a queryable, type-safe, and semantically rich representation of data governance artifacts that scales without requiring schema changes as new attribute types or relationship roles are introduced.