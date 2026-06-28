---
chapter_id: ch_live_ganglion_cyst_imaging_finding_763c3c
topic_id: 183
family: 08_derived
cited_terms: ['ganglion_cyst_imaging_finding', 'schemaorg_creativework_author', 'safety_planning_process']
model: engine-refine
---

Stable identification and entity resolution form the foundation of any governed relational architecture, ensuring that records remain traceable across systems and over time. An entity serves as the primary anchor for a domain object, while an identifier provides a deterministic, system-wide key that survives schema migrations and cross-domain joins. In practice, identifiers follow predictable prefixes that signal their domain context: FIND-0001 anchors a clinical imaging record, AUTH-0001 ties to an authorship metadata row, and PROC-0001 references a safety planning workflow. This prefixing strategy does more than prevent collisions; it enables automated routing, audit logging, and referential integrity checks without requiring application-level parsing. When entities are consistently keyed, downstream consumers can reliably resolve relationships, enforce constraints, and maintain lineage regardless of how the underlying storage is partitioned.

**t_schemaorg_creativework_author**

| id | schemaorg | author |
| --- | --- | --- |
| AUTH-0001 | API_Reference_Guide | WorkflowEngineer |
| AUTH-0002 | Provenance_Trace_Report | APIMaintainer |
| AUTH-0003 | API_Reference_Guide | SensorArchitect |
| AUTH-0004 | Provenance_Trace_Report | ModelReviewer |
| AUTH-0005 | Sensor_Network_Spec | ModelReviewer |
| AUTH-0006 | Catalog_Metadata_Index | ModelReviewer |
| AUTH-0007 | Telemetry_Config_Spec | CatalogAdmin |
| AUTH-0008 | Catalog_Metadata_Index | CatalogAdmin |

**t_schemaorg_creativework_author_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUTH-0001 | AUTH-0001 | AUTH-0006 | 363 |
| AUTH-0002 | AUTH-0001 | AUTH-0008 | 12 |
| AUTH-0003 | AUTH-0002 | AUTH-0006 | 393 |
| AUTH-0004 | AUTH-0002 | AUTH-0008 | 3 |
| AUTH-0005 | AUTH-0003 | AUTH-0006 | 58 |
| AUTH-0006 | AUTH-0003 | AUTH-0008 | 9 |
| AUTH-0007 | AUTH-0004 | AUTH-0006 | 306 |
| AUTH-0008 | AUTH-0004 | AUTH-0008 | 8 |

**t_safety_planning_process**

| id | safety_planning_process |
| --- | --- |
| PROC-0001 | SAFEPLAN-RED |
| PROC-0002 | VICTIM-ADVOC-12 |
| PROC-0003 | SHIELD-PROTOCOL |
| PROC-0004 | COMMUNITY-SAFE |
| PROC-0005 | CIRCULAR-RED |
| PROC-0006 | CIRCULAR-RED |

Attribute modeling extends this foundation by decoupling metadata definitions from their stored values, which is where the attr and attr type constructs become essential. An attr captures the semantic name of a property, while its corresponding attr type enforces validation, serialization, and storage semantics. For example, a checksum attribute might be typed as xsd:string, a created_date as xsd:date, and a designative identifier as cco:DesignativeICE. Because relational engines require fixed column types, polymorphic values are typically materialized across separate storage tables, each housing a misc column that holds the actual payload. A varchar misc column might store 7b14de08 or gid://svc/77, an integer misc column might hold 363 or 12, and a date misc column might record 2023-12-01. This separation preserves type safety at the schema level while allowing flexible, domain-appropriate value storage without resorting to generic text fields.

**t_schemaorg_creativework_author_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| AUTH-0001 | checksum | xsd:string |
| AUTH-0002 | created_date | xsd:date |
| AUTH-0003 | identifier | cco:DesignativeICE |
| AUTH-0004 | license | xsd:string |
| AUTH-0005 | mime_type | xsd:string |
| AUTH-0006 | size_bytes | xsd:long |
| AUTH-0007 | uri | xsd:string |
| AUTH-0008 | version | xsd:integer |

**t_schemaorg_creativework_author_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUTH-0001 | AUTH-0001 | AUTH-0002 | 2023-12-01 |
| AUTH-0002 | AUTH-0002 | AUTH-0002 | 2024-12-04 |
| AUTH-0003 | AUTH-0003 | AUTH-0002 | 2023-05-29 |
| AUTH-0004 | AUTH-0004 | AUTH-0002 | 2023-07-08 |
| AUTH-0005 | AUTH-0005 | AUTH-0002 | 2025-04-18 |
| AUTH-0006 | AUTH-0006 | AUTH-0002 | 2023-08-09 |
| AUTH-0007 | AUTH-0007 | AUTH-0002 | 2024-11-19 |
| AUTH-0008 | AUTH-0008 | AUTH-0002 | 2024-04-19 |

**t_schemaorg_creativework_author_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUTH-0001 | AUTH-0001 | AUTH-0001 | 7b14de08 |
| AUTH-0002 | AUTH-0001 | AUTH-0003 | gid://svc/77 |
| AUTH-0003 | AUTH-0001 | AUTH-0004 | GPL-3.0 |
| AUTH-0004 | AUTH-0001 | AUTH-0009 | on-prem-dc1 |
| AUTH-0005 | AUTH-0001 | AUTH-0005 | text/plain |
| AUTH-0006 | AUTH-0001 | AUTH-0010 | Name 06 |
| AUTH-0007 | AUTH-0001 | AUTH-0011 | ml-infra |
| AUTH-0008 | AUTH-0001 | AUTH-0012 | Tags 08 |

Clinical and imaging data domains rely on the same structural principles but layer in specialized metadata to guarantee interoperability and archival fidelity. A ganglioncystimagingfinding records the anatomical location of interest, such as Dorsal right ankle or Bilateral distal radius, and must be explicitly linked to the magneticresonanceimagingmodality used to capture it, whether that is MIP reconstruction, Sagittal PD FS, or Gadolinium enhanced T1. Because imaging datasets and associated reports traverse institutional boundaries, encoding and language fields are mandatory for correct rendering and localization. A record might specify ascii or unicode for byte-level encoding, while a language tag like ja or en directs downstream parsers to the appropriate locale for display or translation. Without these explicit metadata anchors, imaging archives risk corruption, misinterpretation, or complete loss of clinical context during exchange.

**t_ganglion_cyst_imaging_finding**

| id | ganglion_cyst_imaging_finding | visualizes | encoding | language |
| --- | --- | --- | --- | --- |
| FIND-0001 | Dorsal right ankle | MIP reconstruction | ascii | ja |
| FIND-0002 | Left medial malleolus | Sagittal PD FS | ascii | ja |
| FIND-0003 | Bilateral distal radius | Gadolinium enhanced T1 | latin1 | en |
| FIND-0004 | Right dorsal metatarsal | T2 weighted fat sat | unicode | ja |
| FIND-0005 | Palmar left thumb | Sagittal PD FS | unicode | de |
| FIND-0006 | Left scapholunate ligament | STIR sequence | unicode | en |
| FIND-0007 | Palmar left thumb | PD weighted fat sat | unicode | en |

Process governance and relationship modeling complete the architecture by binding methods to populations through explicit junction structures. A safety planning workflow employs a crisisinterventionmethod such as HOTLINE-TRIAGE, LEGAL-ADVOCACY, or SAFE-ROOM-SET, and must declare which domesticviolencesurvivor records it serves, whether identified as CLIENT-7734, WITNESS-119, or SURV-2024-X. The relationship is never implicit; it is captured in a linking table that records the subject, the target, and the operational role, such as owner, reviewer, or observer. Crucially, a cardinality note is attached to each relationship row to document the business rule governing the link, for example Cardinality Note 01 or Cardinality Note 04, which dictates whether the association is one-to-one, one-to-many, or many-to-many. This explicit documentation prevents ambiguous joins, enforces compliance boundaries, and provides auditors with a clear map of how interventions map to vulnerable populations.

**t_safety_planning_process_targets**

| id | targets |
| --- | --- |
| PROC-0001 | CLIENT-7734 |
| PROC-0002 | WITNESS-119 |
| PROC-0003 | SURV-2024-X |
| PROC-0004 | REFUGEE-771 |
| PROC-0005 | NOMINEE-338 |
| PROC-0006 | CASE-991-A |
| PROC-0007 | NOMINEE-338 |

**t_safety_planning_process__targets**

| id | safety_id | targets_id | role |
| --- | --- | --- | --- |
| PROC-0001 | PROC-0005 | PROC-0001 | owner |
| PROC-0002 | PROC-0001 | PROC-0001 | observer |
| PROC-0003 | PROC-0004 | PROC-0007 | reviewer |
| PROC-0004 | PROC-0002 | PROC-0005 | owner |
| PROC-0005 | PROC-0006 | PROC-0007 | owner |
| PROC-0006 | PROC-0003 | PROC-0006 | observer |
| PROC-0007 | PROC-0006 | PROC-0006 | observer |
| PROC-0008 | PROC-0003 | PROC-0007 | reviewer |

**t_safety_planning_process_employs**

| id | employs |
| --- | --- |
| PROC-0001 | HOTLINE-TRIAGE |
| PROC-0002 | LEGAL-ADVOCACY |
| PROC-0003 | SAFE-ROOM-SET |
| PROC-0004 | DOCUMENT-GATHER |
| PROC-0005 | HOTLINE-TRIAGE |
| PROC-0006 | DOCUMENT-GATHER |
| PROC-0007 | ESCAPE-BAG-PREP |
| PROC-0008 | SHELTER-NAVIGATE |

**t_safety_planning_process__employs**

| id | safety_id | employs_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| PROC-0001 | PROC-0001 | PROC-0002 | reviewer | Cardinality Note 01 |
| PROC-0002 | PROC-0004 | PROC-0002 | owner | Cardinality Note 02 |
| PROC-0003 | PROC-0005 | PROC-0002 | reviewer | Cardinality Note 03 |
| PROC-0004 | PROC-0005 | PROC-0003 | owner | Cardinality Note 04 |
| PROC-0005 | PROC-0005 | PROC-0002 | owner | Cardinality Note 05 |
| PROC-0006 | PROC-0001 | PROC-0006 | contributor | Cardinality Note 06 |
| PROC-0007 | PROC-0001 | PROC-0008 | observer | Cardinality Note 07 |
| PROC-0008 | PROC-0006 | PROC-0002 | owner | Cardinality Note 08 |

Together, these constructs form a cohesive data governance framework that balances strict type enforcement with domain flexibility. Identifiers and entities guarantee referential stability, while attr and attr type pairings ensure that metadata is validated before values are persisted in misc storage. Clinical records embed encoding and language alongside imaging modalities to preserve fidelity across exchanges, and process tables use cardinality notes and role designations to govern how crisis intervention methods connect to domestic violence survivors. The result is a relational model that does not merely store data but actively enforces semantic boundaries, supports cross-system interoperability, and provides the auditability required for regulated or high-stakes operational environments.