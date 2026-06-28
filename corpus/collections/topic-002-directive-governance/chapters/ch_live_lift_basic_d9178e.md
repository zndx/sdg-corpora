---
chapter_id: ch_live_lift_basic_d9178e
topic_id: 2
family: 02_observation_measurement
cited_terms: ['lift_basic', 'artifact_with_existential', 'requirement_verified_by']
model: engine-refine
---

In complex operational registries, the integrity of asset tracking depends upon a rigorous Entity-Attribute-Value (EAV) architecture, where distinct entities are decoupled from their descriptive properties to accommodate evolving compliance schemas. Each entity is anchored by a unique identifier—such as `LIFT-0001` for an Observatory Lift or `EXIS-0001` for a provenance-cert artifact—which serves as the immutable primary key across the system. This structural separation ensures that the core identity of an operational component remains distinct from its mutable characteristics, allowing the registry to scale without requiring rigid, pre-defined column structures for every asset class.

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

**t_artifact_with_existential**

| id | artifact | related |
| --- | --- | --- |
| EXIS-0001 | provenance-cert | VERI-0003 |
| EXIS-0002 | edge-gateway | VERI-0006 |
| EXIS-0003 | edge-gateway | VERI-0004 |
| EXIS-0004 | audit-log-2023 | VERI-0001 |
| EXIS-0005 | edge-gateway | VERI-0003 |
| EXIS-0006 | audit-log-2023 | VERI-0004 |

**t_artifact_with_existential_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EXIS-0001 | EXIS-0001 | EXIS-0002 | 2024-03-17 |
| EXIS-0002 | EXIS-0002 | EXIS-0002 | 2024-10-14 |
| EXIS-0003 | EXIS-0003 | EXIS-0002 | 2023-12-18 |
| EXIS-0004 | EXIS-0004 | EXIS-0002 | 2023-02-05 |
| EXIS-0005 | EXIS-0005 | EXIS-0002 | 2024-03-19 |
| EXIS-0006 | EXIS-0006 | EXIS-0002 | 2025-01-11 |

**t_artifact_with_existential_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EXIS-0001 | EXIS-0001 | EXIS-0006 | 401 |
| EXIS-0002 | EXIS-0001 | EXIS-0008 | 10 |
| EXIS-0003 | EXIS-0002 | EXIS-0006 | 361 |
| EXIS-0004 | EXIS-0002 | EXIS-0008 | 7 |
| EXIS-0005 | EXIS-0003 | EXIS-0006 | 386 |
| EXIS-0006 | EXIS-0003 | EXIS-0008 | 10 |
| EXIS-0007 | EXIS-0004 | EXIS-0006 | 351 |
| EXIS-0008 | EXIS-0004 | EXIS-0008 | 8 |

**t_artifact_with_existential_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EXIS-0001 | EXIS-0001 | EXIS-0001 | 5e8f3c91 |
| EXIS-0002 | EXIS-0001 | EXIS-0003 | urn:uuid:9f2a |
| EXIS-0003 | EXIS-0001 | EXIS-0004 | proprietary |
| EXIS-0004 | EXIS-0001 | EXIS-0009 | on-prem-dc1 |
| EXIS-0005 | EXIS-0001 | EXIS-0005 | application/json |
| EXIS-0006 | EXIS-0001 | EXIS-0010 | Name 06 |
| EXIS-0007 | EXIS-0001 | EXIS-0011 | platform-team |
| EXIS-0008 | EXIS-0001 | EXIS-0012 | Tags 08 |

The descriptive properties of these entities are governed by a dynamic attribute registry, where each attribute is explicitly defined by a name and a strict data type to ensure semantic consistency. For instance, an attribute named `confidence` is bound to the `xsd:decimal` type, while a `checksum` property is constrained to `xsd:string`, and specialized designative properties utilize the `cco:DesignativeICE` type. By enforcing these type constraints at the schema level—ranging from `xsd:dateTime` for temporal tracking to `xsd:date` for historical records—the framework guarantees that all subsequent value entries adhere to the required format, thereby preventing data corruption and maintaining the auditability of the registry.

Actual attribute values are persisted in specialized, type-specific value tables, each linked to its parent entity and attribute through foreign keys. A decimal attribute such as `confidence` might hold a precise measurement like 0.624 or 93.24 for entity `LIFT-0001`, while a string attribute like `dimension_kind` could store a classification such as "Dimension Kind 01" or "Encoding 02". Temporal data is similarly segregated; a `recorded_at` attribute for the same entity might capture a specific timestamp like 2024-06-13T06:43:09, ensuring that numerical, textual, and temporal data are stored in optimized formats while remaining traceable to their originating entity and attribute definition.

Beyond asset tracking, the framework extends into compliance governance through a structured mapping of requirements to their verification mechanisms. A requirement, such as a "Data retention policy" or "Compliance baseline," is formally linked to a verifying entity—ranging from an "Automated scanner" to a "Lab director"—through a tripartite relationship defined by subject, target, and role. In this model, the requirement identifier acts as the subject, the verifier identifier serves as the target, and the interaction is mediated by a specific role, such as "owner," "observer," or "reviewer." This explicit role assignment clarifies accountability, ensuring that every compliance mandate is not only satisfied but also attributed to the correct organizational function or automated system.

**t_requirement_verified_by**

| id | requirement |
| --- | --- |
| VERI-0001 | Data retention policy |
| VERI-0002 | Compliance baseline |
| VERI-0003 | Data retention policy |
| VERI-0004 | Data retention policy |
| VERI-0005 | Audit logging mandate |
| VERI-0006 | Provenance tracking spec |

**t_requirement_verified_by_verified_by**

| id | verified_by |
| --- | --- |
| VERI-0001 | Automated scanner |
| VERI-0002 | Lab director |
| VERI-0003 | Internal audit team |
| VERI-0004 | System validator |
| VERI-0005 | Automated scanner |
| VERI-0006 | Automated scanner |

**t_requirement_verified_by__verified_by**

| id | requirement_id | verified_by_id | role |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0006 | VERI-0006 | owner |
| VERI-0002 | VERI-0002 | VERI-0003 | observer |
| VERI-0003 | VERI-0004 | VERI-0006 | reviewer |
| VERI-0004 | VERI-0003 | VERI-0005 | observer |
| VERI-0005 | VERI-0004 | VERI-0001 | owner |
| VERI-0006 | VERI-0004 | VERI-0002 | owner |
| VERI-0007 | VERI-0001 | VERI-0002 | reviewer |
| VERI-0008 | VERI-0004 | VERI-0001 | observer |

The integrity of this entire verification chain is underpinned by existential artifacts that provide cryptographic and temporal proof of compliance. An artifact such as `EXIS-0001`, identified as a "provenance-cert," is associated with a specific requirement (e.g., `VERI-0003`) and enriched with its own set of typed attributes. These attributes capture critical metadata, including a unique hash like "5e8f3c91", a creation date of 2024-03-17, and integer-based metrics such as 401 or 10. By anchoring these verifiable proofs to both the underlying assets and the compliance requirements they satisfy, the system establishes a complete, auditable lineage from the physical or digital asset to the regulatory standard it meets.

**t_artifact_with_existential_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| EXIS-0001 | checksum | xsd:string |
| EXIS-0002 | created_date | xsd:date |
| EXIS-0003 | identifier | cco:DesignativeICE |
| EXIS-0004 | license | xsd:string |
| EXIS-0005 | mime_type | xsd:string |
| EXIS-0006 | size_bytes | xsd:long |
| EXIS-0007 | uri | xsd:string |
| EXIS-0008 | version | xsd:integer |