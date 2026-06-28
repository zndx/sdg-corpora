---
chapter_id: ch_live_outlier_claim_subclass_95aa8f
topic_id: 2
family: 02_observation_measurement
cited_terms: ['outlier_claim_subclass', 'schemaorg_person_named', 'lift_basic']
model: engine-refine
---

An identifier serves as the immutable anchor of any relational record, a stable handle that survives the churn of attribute values and the reclassification of entities. In the outlier-tracking domain, identifiers such as CLAI-0001 through CLAI-0004 uniquely tag individual anomaly claims, each of which is classified under a specific subclass—Network_Bandwidth_Spike, Patient_Vital_Anomaly, or Log_Flood_Event—while simultaneously being linked to the operational contexts they illuminate, including Automotive_Test_Drive, Power_Grid_Substation, and Financial_Trading_Queue. Similarly, persons in the schema.org namespace are keyed by identifiers like NAME-0001 and NAME-0002, which resolve to canonical entries such as person/tim_berners_ee and person/alan_kay, and lift assets carry identifiers like LIFT-0001 and LIFT-0002 that distinguish an Observatory Lift from a Freight Service Lift. The identifier is the sole invariant across all tables; every other column is a mutable property or a relational pointer that may change without displacing the record itself.

**t_outlier_claim_subclass**

| id | outlier |
| --- | --- |
| CLAI-0001 | Network_Bandwidth_Spike |
| CLAI-0002 | Patient_Vital_Anomaly |
| CLAI-0003 | Network_Bandwidth_Spike |
| CLAI-0004 | Log_Flood_Event |
| CLAI-0005 | Patient_Vital_Anomaly |
| CLAI-0006 | Elevator_Vibration_Spike |
| CLAI-0007 | Reactor_Core_Temp_Peak |

**t_lift_basic**

| id | lift |
| --- | --- |
| LIFT-0001 | Observatory Lift |
| LIFT-0002 | Freight Service Lift |
| LIFT-0003 | Freight Service Lift |
| LIFT-0004 | Observatory Lift |
| LIFT-0005 | Observatory Lift |
| LIFT-0006 | Cargo Bay Lift |
| LIFT-0007 | Cargo Bay Lift |

Attributes and their types constitute the schema layer that gives meaning to the values attached to entities. The attribute definition table enumerates properties such as confidence, dimension_kind, method, and recorded_at, each bound to an XML Schema datatype—xsd:decimal, xsd:string, or xsd:dateTime—that constrains the shape of permissible values. This separation of attribute metadata from attribute values is deliberate: the type declaration lives in one table, while the actual values are stored in dedicated value tables keyed by entity and attribute. A decimal value of 0.624 or 93.24 is routed to the decimal value table, a timestamp like 2024-06-13T06:43:09 to the datetime table, and a freeform string such as Dimension Kind 01 or change rationale to the varchar table. The attr column in each value table points back to the attribute definition, and the entity column points to the record being described, forming a normalized triple of entity, attribute, and value that can accommodate heterogeneous data types without schema migration.

The entity itself is the conceptual object that bears attributes and participates in relationships. In the lift domain, an entity such as LIFT-0001 represents a single physical or logical lift whose recorded_at timestamp, confidence score, and descriptive strings are all resolved through the entity_id foreign key. In the outlier domain, CLAI-0001 is an entity that carries a subclass label and is simultaneously a subject in one or more explanatory relationships. In the person domain, NAME-0003 corresponds to person/alan_turing and serves as the anchor for full-name associations. The entity is not a table; it is the cross-cutting concept that the identifier column materializes across multiple tables, each table representing a different facet or value type of the same underlying object.

**t_lift_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| LIFT-0001 | confidence | xsd:decimal |
| LIFT-0002 | dimension_kind | xsd:string |
| LIFT-0003 | method | xsd:string |
| LIFT-0004 | recorded_at | xsd:dateTime |
| LIFT-0005 | uncertainty | xsd:decimal |
| LIFT-0006 | unit | xsd:string |
| LIFT-0007 | value | xsd:decimal |
| LIFT-0008 | encoding | xsd:string |

Subject, target, and role form the relational triad that connects entities into a graph of meaning. The junction tables—t_outlier_claim_subclass__explains_anomaly_in and t_schemaorg_person_named__full_name—each carry their own surrogate identifier, a subject column that names the originating entity, a target column that names the destination entity, and a role column that qualifies the nature of the link. In the outlier domain, CLAI-0005 acts as a reviewer of CLAI-0002, while CLAI-0001 assumes the role of observer against CLAI-0006; the same pair of roles—reviewer and owner—also appears in the person domain, where NAME-0003 is an owner of NAME-0002 and a reviewer of the same target. The role column is the semantic glue: it transforms a bare foreign-key pair into a typed relationship that can be queried, filtered, and audited.

**t_outlier_claim_subclass_explains_anomaly_in**

| id | explains_anomaly_in |
| --- | --- |
| CLAI-0001 | Automotive_Test_Drive |
| CLAI-0002 | Automotive_Test_Drive |
| CLAI-0003 | Power_Grid_Substation |
| CLAI-0004 | Financial_Trading_Queue |
| CLAI-0005 | US_East_Data_Center |
| CLAI-0006 | Financial_Trading_Queue |

**t_outlier_claim_subclass__explains_anomaly_in**

| id | outlier_id | explains_anomaly_in_id | role |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0005 | CLAI-0002 | reviewer |
| CLAI-0002 | CLAI-0006 | CLAI-0002 | owner |
| CLAI-0003 | CLAI-0001 | CLAI-0005 | reviewer |
| CLAI-0004 | CLAI-0001 | CLAI-0006 | observer |
| CLAI-0005 | CLAI-0007 | CLAI-0002 | owner |
| CLAI-0006 | CLAI-0005 | CLAI-0004 | observer |
| CLAI-0007 | CLAI-0003 | CLAI-0005 | owner |
| CLAI-0008 | CLAI-0002 | CLAI-0001 | owner |

**t_schemaorg_person_named**

| id | schemaorg |
| --- | --- |
| NAME-0001 | person/tim_berners_lee |
| NAME-0002 | person/alan_kay |
| NAME-0003 | person/alan_turing |
| NAME-0004 | person/john_von_neumann |
| NAME-0005 | person/donald_knuth |
| NAME-0006 | person/grace_hopper |
| NAME-0007 | person/john_von_neumann |

**t_schemaorg_person_named_full_name**

| id | full_name |
| --- | --- |
| NAME-0001 | Grace Hopper |
| NAME-0002 | Donald Knuth |
| NAME-0003 | John von Neumann |
| NAME-0004 | Grace Hopper |
| NAME-0005 | Ada Lovelace |
| NAME-0006 | Alan Kay |

**t_schemaorg_person_named__full_name**

| id | schemaorg_id | full_name_id | role |
| --- | --- | --- | --- |
| NAME-0001 | NAME-0003 | NAME-0002 | owner |
| NAME-0002 | NAME-0004 | NAME-0003 | observer |
| NAME-0003 | NAME-0003 | NAME-0002 | reviewer |
| NAME-0004 | NAME-0005 | NAME-0002 | owner |
| NAME-0005 | NAME-0003 | NAME-0001 | contributor |
| NAME-0006 | NAME-0007 | NAME-0005 | observer |
| NAME-0007 | NAME-0006 | NAME-0002 | observer |
| NAME-0008 | NAME-0006 | NAME-0005 | owner |

The misc column in the value tables is the catch-all for the actual data payload—the decimal, the datetime, the varchar—that the type system has already classified. It is here that evidence lives: 0.175 as a confidence reading, 2024-12-03T09:28:05 as a recorded timestamp, Encoding 02 as a classification string. The misc value is meaningless without the attr column that names the property and the entity_id that grounds it, but it is the only column that carries the raw observation. Together, identifier, attr, attr_type, entity, misc, role, subject, and target form a complete vocabulary for describing what exists, what it is like, and how it relates to everything else.

**t_lift_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LIFT-0001 | LIFT-0001 | LIFT-0004 | 2024-06-13T06:43:09 |
| LIFT-0002 | LIFT-0002 | LIFT-0004 | 2024-12-03T09:28:05 |
| LIFT-0003 | LIFT-0003 | LIFT-0004 | 2024-01-28T22:31:03 |
| LIFT-0004 | LIFT-0004 | LIFT-0004 | 2024-06-11T06:27:27 |
| LIFT-0005 | LIFT-0005 | LIFT-0004 | 2023-05-13T18:59:00 |
| LIFT-0006 | LIFT-0006 | LIFT-0004 | 2023-02-07T19:19:23 |
| LIFT-0007 | LIFT-0007 | LIFT-0004 | 2023-12-22T04:56:51 |

**t_lift_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LIFT-0001 | LIFT-0001 | LIFT-0001 | 0.624 |
| LIFT-0002 | LIFT-0001 | LIFT-0005 | 93.24 |
| LIFT-0003 | LIFT-0001 | LIFT-0007 | 541.29 |
| LIFT-0004 | LIFT-0002 | LIFT-0001 | 0.175 |
| LIFT-0005 | LIFT-0002 | LIFT-0005 | 180.41 |
| LIFT-0006 | LIFT-0002 | LIFT-0007 | 256.73 |
| LIFT-0007 | LIFT-0003 | LIFT-0001 | 0.866 |
| LIFT-0008 | LIFT-0003 | LIFT-0005 | 594.06 |

**t_lift_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LIFT-0001 | LIFT-0001 | LIFT-0002 | Dimension Kind 01 |
| LIFT-0002 | LIFT-0001 | LIFT-0008 | Encoding 02 |
| LIFT-0003 | LIFT-0001 | LIFT-0009 | change rationale |
| LIFT-0004 | LIFT-0001 | LIFT-0010 | de |
| LIFT-0005 | LIFT-0001 | LIFT-0003 | manual |
| LIFT-0006 | LIFT-0001 | LIFT-0006 | m/s |
| LIFT-0007 | LIFT-0002 | LIFT-0002 | Dimension Kind 07 |
| LIFT-0008 | LIFT-0002 | LIFT-0008 | Encoding 08 |