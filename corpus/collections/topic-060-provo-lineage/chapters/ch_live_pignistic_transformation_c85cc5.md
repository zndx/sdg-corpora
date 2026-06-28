---
chapter_id: ch_live_pignistic_transformation_c85cc5
topic_id: 60
family: 07_long_tail
cited_terms: ['pignistic_transformation', 'claim_basic', 'artifact_max_one_owner']
model: engine-refine
---

Operational governance relies on stable, unambiguous anchors to track assets, assertions, and processing steps across distributed systems. Each record is assigned a persistent identifier—such as TRAN-0001 for a transformation step, CLAI-0001 for a compliance claim, or OWNE-0001 for an artifact ownership record—that serves as the immutable reference point for downstream audits. These identifiers decouple logical identity from mutable metadata, ensuring that lineage traces, regulatory reports, and incident investigations can reliably resolve to the same underlying entity regardless of schema evolution or system migration. By treating identifiers as first-class governance keys, organizations maintain referential integrity across model outputs, telemetry archives, and pipeline artifacts without entangling identity with transient state.

**t_claim_basic**

| id | claim |
| --- | --- |
| CLAI-0001 | Model accuracy below SLA |
| CLAI-0002 | Schema version deprecated |
| CLAI-0003 | Model accuracy below SLA |
| CLAI-0004 | File checksum matches |
| CLAI-0005 | Compliance audit passed |
| CLAI-0006 | Compliance audit passed |

**t_artifact_max_one_owner**

| id | artifact | owner |
| --- | --- | --- |
| OWNE-0001 | telemetry-archive-2023 | CLAI-0005 |
| OWNE-0002 | etl-transform-stable | CLAI-0006 |
| OWNE-0003 | etl-transform-stable | CLAI-0005 |
| OWNE-0004 | ml-inference-v2.1 | CLAI-0003 |
| OWNE-0005 | ml-inference-v2.1 | CLAI-0004 |
| OWNE-0006 | etl-transform-stable | CLAI-0006 |

The semantic structure of each entity is governed by attr definitions and their corresponding attr type constraints, which establish the contractual boundaries for permissible data. An attr name like confidence or recorded_at is paired with a strict type declaration—xsd:decimal for numerical thresholds, xsd:dateTime for temporal markers, or cco:DesignativeICE for designative references—so that every property carries both human-readable intent and machine-enforceable validation. This typed attr registry prevents schema drift, enforces regulatory formatting requirements, and guarantees that downstream consumers interpret metadata consistently across reporting pipelines. When a claim such as Model accuracy below SLA is evaluated, its associated confidence metric and recording timestamp are validated against these attr type rules before entering any analytical or compliance workflow.

Actual property values are stored separately from their type definitions, routed into specialized value repositories that enforce type safety at the ingestion layer. These misc containers—decimal, datetime, varchar, integer, and date stores—hold the concrete data points that instantiate abstract attributes. Numeric assertions such as 0.443 or 443.93 populate decimal repositories, while temporal stamps like 2025-05-28T11:02:08 and 2024-03-14T10:07:11 are isolated in datetime tables. String-based metadata—including checksums like c0ffee42, license designations such as MIT, and rack identifiers like rack-7—reside in varchar containers, and integer counters such as 427 or 12 are maintained in dedicated integer tables. This separation allows the system to scale attribute cardinality without compromising query performance or violating data type contracts, while keeping misc values auditable and type-isolated.

Relationships between entities are formalized through subject-target associations that explicitly declare the functional role each party plays in a given interaction. An association record binds a subject identifier, such as pignistic_id, to a target identifier, such as pignistic_transform_id, while attaching a role descriptor like reviewer or contributor to clarify the nature of the linkage. This triad ensures that cross-entity dependencies are not merely structural but semantically annotated, enabling workflow engines to route approvals, compliance auditors to verify chain-of-custody, and automated systems to enforce role-based access controls. When telemetry-archive-2023 or etl-transform-stable moves through a transformation pipeline, the subject-target mapping with its assigned role creates an immutable audit trail that documents who validated the output and how the data state evolved.

**t_pignistic_transformation**

| id | pignistic |
| --- | --- |
| TRAN-0001 | diagnostic confidence matrix |
| TRAN-0002 | telemetry belief assignment |
| TRAN-0003 | anomaly likelihood set |
| TRAN-0004 | diagnostic confidence matrix |
| TRAN-0005 | predictive uncertainty record |
| TRAN-0006 | anomaly likelihood set |
| TRAN-0007 | anomaly likelihood set |
| TRAN-0008 | telemetry belief assignment |

**t_pignistic_transformation_pignistic_transform**

| id | pignistic_transform |
| --- | --- |
| TRAN-0001 | pignistic probability distribution |
| TRAN-0002 | transformed belief state |
| TRAN-0003 | transformed belief state |
| TRAN-0004 | betting probability set |
| TRAN-0005 | risk probability assignment |
| TRAN-0006 | decision support distribution |
| TRAN-0007 | betting probability set |
| TRAN-0008 | transformed belief state |

**t_pignistic_transformation__pignistic_transform**

| id | pignistic_id | pignistic_transform_id | role |
| --- | --- | --- | --- |
| TRAN-0001 | TRAN-0008 | TRAN-0005 | reviewer |
| TRAN-0002 | TRAN-0006 | TRAN-0003 | reviewer |
| TRAN-0003 | TRAN-0005 | TRAN-0006 | contributor |
| TRAN-0004 | TRAN-0005 | TRAN-0002 | reviewer |
| TRAN-0005 | TRAN-0006 | TRAN-0002 | owner |
| TRAN-0006 | TRAN-0003 | TRAN-0008 | reviewer |
| TRAN-0007 | TRAN-0007 | TRAN-0005 | observer |
| TRAN-0008 | TRAN-0008 | TRAN-0008 | reviewer |

Together, these constructs form a cohesive governance substrate: identifiers provide traceability, typed attributes enforce semantic integrity, decoupled value stores maintain performance and type safety, and role-bound relationships capture operational context. The interplay of entity, identifier, attr, attr type, misc, role, subject, and target transforms raw metadata into a queryable, regulation-ready knowledge graph. Every model assertion, artifact lineage, and processing step can be resolved through a single, auditable path, ensuring that data movements, compliance claims, and system changes remain fully accountable to both internal standards and external regulatory frameworks.

**t_claim_basic_attr**

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

**t_claim_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0004 | 2025-05-28T11:02:08 |
| CLAI-0002 | CLAI-0002 | CLAI-0004 | 2025-04-22T09:44:09 |
| CLAI-0003 | CLAI-0003 | CLAI-0004 | 2025-01-23T06:41:57 |
| CLAI-0004 | CLAI-0004 | CLAI-0004 | 2024-03-14T10:07:11 |
| CLAI-0005 | CLAI-0005 | CLAI-0004 | 2023-08-27T20:51:04 |
| CLAI-0006 | CLAI-0006 | CLAI-0004 | 2025-04-10T08:56:25 |

**t_claim_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0001 | 0.443 |
| CLAI-0002 | CLAI-0001 | CLAI-0005 | 443.93 |
| CLAI-0003 | CLAI-0001 | CLAI-0007 | 257.71 |
| CLAI-0004 | CLAI-0002 | CLAI-0001 | 0.828 |
| CLAI-0005 | CLAI-0002 | CLAI-0005 | 729.35 |
| CLAI-0006 | CLAI-0002 | CLAI-0007 | 717.18 |
| CLAI-0007 | CLAI-0003 | CLAI-0001 | 0.004 |
| CLAI-0008 | CLAI-0003 | CLAI-0005 | 534.68 |

**t_claim_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0002 | Dimension Kind 01 |
| CLAI-0002 | CLAI-0001 | CLAI-0008 | Encoding 02 |
| CLAI-0003 | CLAI-0001 | CLAI-0009 | audit excerpt |
| CLAI-0004 | CLAI-0001 | CLAI-0010 | fr |
| CLAI-0005 | CLAI-0001 | CLAI-0003 | automated |
| CLAI-0006 | CLAI-0001 | CLAI-0006 | m/s |
| CLAI-0007 | CLAI-0002 | CLAI-0002 | Dimension Kind 07 |
| CLAI-0008 | CLAI-0002 | CLAI-0008 | Encoding 08 |

**t_artifact_max_one_owner_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| OWNE-0001 | checksum | xsd:string |
| OWNE-0002 | created_date | xsd:date |
| OWNE-0003 | identifier | cco:DesignativeICE |
| OWNE-0004 | license | xsd:string |
| OWNE-0005 | mime_type | xsd:string |
| OWNE-0006 | size_bytes | xsd:long |
| OWNE-0007 | uri | xsd:string |
| OWNE-0008 | version | xsd:integer |

**t_artifact_max_one_owner_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0002 | 2023-04-04 |
| OWNE-0002 | OWNE-0002 | OWNE-0002 | 2025-04-14 |
| OWNE-0003 | OWNE-0003 | OWNE-0002 | 2024-04-27 |
| OWNE-0004 | OWNE-0004 | OWNE-0002 | 2025-03-27 |
| OWNE-0005 | OWNE-0005 | OWNE-0002 | 2025-06-10 |
| OWNE-0006 | OWNE-0006 | OWNE-0002 | 2023-03-24 |

**t_artifact_max_one_owner_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0006 | 427 |
| OWNE-0002 | OWNE-0001 | OWNE-0008 | 2 |
| OWNE-0003 | OWNE-0002 | OWNE-0006 | 401 |
| OWNE-0004 | OWNE-0002 | OWNE-0008 | 12 |
| OWNE-0005 | OWNE-0003 | OWNE-0006 | 38 |
| OWNE-0006 | OWNE-0003 | OWNE-0008 | 7 |
| OWNE-0007 | OWNE-0004 | OWNE-0006 | 393 |
| OWNE-0008 | OWNE-0004 | OWNE-0008 | 7 |

**t_artifact_max_one_owner_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0001 | c0ffee42 |
| OWNE-0002 | OWNE-0001 | OWNE-0003 | ARN:res/41 |
| OWNE-0003 | OWNE-0001 | OWNE-0004 | MIT |
| OWNE-0004 | OWNE-0001 | OWNE-0009 | rack-7 |
| OWNE-0005 | OWNE-0001 | OWNE-0005 | application/octet-stream |
| OWNE-0006 | OWNE-0001 | OWNE-0010 | Name 06 |
| OWNE-0007 | OWNE-0001 | OWNE-0011 | sre |
| OWNE-0008 | OWNE-0001 | OWNE-0012 | Tags 08 |