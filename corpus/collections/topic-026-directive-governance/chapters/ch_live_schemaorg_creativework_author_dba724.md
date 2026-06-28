---
chapter_id: ch_live_schemaorg_creativework_author_dba724
topic_id: 26
family: 07_long_tail
cited_terms: ['schemaorg_creativework_author', 'quantum_computer', 'allocation_with_run_status']
model: engine-refine
---

In compliance and governance frameworks, every auditable object is anchored by a unique identifier that serves as the immutable reference point for all downstream tracking. An identifier such as `AUTH-0001` or `COMP-0001` is not merely a label; it is the primary key through which entities, attributes, events, and relationships are correlated across the system. These identifiers appear consistently across every layer of the data model, from the top-level creative work records down through their typed attributes and value assignments, ensuring that any query or audit trail can be resolved to a single, unambiguous source. The identifier pattern itself—prefixed by domain (`AUTH`, `COMP`, `STAT`) and zero-padded for ordering—provides an immediate signal of the entity's classification without requiring a join to a type registry.

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

Attributes and their types form the descriptive backbone of each entity, capturing metadata that is essential for compliance verification. An attribute such as `checksum` or `created_date` is not stored inline with its entity; instead, it is defined separately with a precise type—`xsd:string`, `xsd:date`, or `cco:DesignativeICE`—that governs validation and rendering. This separation of attribute definition from attribute value enables schema evolution without breaking existing records. Values are further partitioned by type into dedicated storage tables: date values like `2023-12-01` and `2024-12-04` reside in a date-specific table, integer values such as `363` and `12` in an integer-specific table, and string values like `7b14de08`, `gid://svc/77`, `GPL-3.0`, and `on-prem-dc1` in a varchar-specific table. The entity that owns these values is referenced by its identifier, and the attribute being assigned is similarly identified, creating a clean triple of entity, attribute, and value that can be queried, filtered, and audited independently.

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

Hierarchical organization is expressed through the part-of relationship, which maps individual components into larger aggregations. A component identified as `COMP-0001` may belong to a parent grouping labeled `Part Of Label 01` under the category `Part Of Category 01`, while `COMP-0004` maps to `Part Of Label 04` under `Part Of Category 04`. This categorization is not decorative; it determines how event counts roll up for reporting. The fact table records an event count of `446` for `COMP-0001` and `467` for `COMP-0004`, with `COMP-0002` and `COMP-0003` contributing `75` and `224` events respectively. These counts are the quantitative measures that compliance officers and operations teams monitor, and the part-of hierarchy ensures they can be aggregated or disaggregated according to organizational boundaries.

**fact_quantum**

| id | part_of_key | event_count |
| --- | --- | --- |
| COMP-0001 | COMP-0001 | 446 |
| COMP-0002 | COMP-0004 | 75 |
| COMP-0003 | COMP-0005 | 224 |
| COMP-0004 | COMP-0001 | 467 |
| COMP-0005 | COMP-0002 | 463 |
| COMP-0006 | COMP-0001 | 52 |
| COMP-0007 | COMP-0001 | 434 |
| COMP-0008 | COMP-0002 | 284 |

Resource allocation and execution status are tracked through a subject-target relationship mediated by role. An allocation such as `kafka-consumer-group` or `gpu-cluster-alpha` is linked to a run status—`timeout-expired`, `disconnected-drift`, or `succeeded-final`—through a junction record that specifies the role of the allocation within that status context. The role values `reviewer`, `observer`, and `contributor` define the nature of the relationship: a `reviewer` allocation may be responsible for validating compliance before a status transition, an `observer` allocation passively monitors without intervention, and a `contributor` allocation actively participates in the execution that produces the status outcome. This three-way relationship between subject (the allocation), target (the run status), and role (the relationship type) provides a flexible mechanism for expressing complex operational dependencies without hardcoding them into the schema.

Together, these constructs—identifiers, typed attributes, hierarchical part-of relationships, event counts, and role-mediated subject-target links—form a coherent model for tracking what exists, what it is composed of, what has happened to it, and who or what was involved. The model supports both granular, entity-level queries and broad, category-level aggregations, making it suitable for compliance reporting, audit trails, and operational dashboards. By separating definitions from instances, values from types, and relationships from the entities they connect, the framework remains extensible: new attributes can be introduced without schema migration, new categories can be added without altering existing records, and new roles can be defined for allocation-status relationships without modifying the core tables.

**dim_part_of**

| id | part_of_label | part_of_category |
| --- | --- | --- |
| COMP-0001 | Part Of Label 01 | Part Of Category 01 |
| COMP-0002 | Part Of Label 02 | Part Of Category 02 |
| COMP-0003 | Part Of Label 03 | Part Of Category 03 |
| COMP-0004 | Part Of Label 04 | Part Of Category 04 |
| COMP-0005 | Part Of Label 05 | Part Of Category 05 |
| COMP-0006 | Part Of Label 06 | Part Of Category 06 |

**t_allocation_with_run_status**

| id | allocation |
| --- | --- |
| STAT-0001 | kafka-consumer-group |
| STAT-0002 | kafka-consumer-group |
| STAT-0003 | vault-secret-rotate |
| STAT-0004 | gpu-cluster-alpha |
| STAT-0005 | gpu-cluster-alpha |
| STAT-0006 | batch-etl-nightly |

**t_allocation_with_run_status_run_status**

| id | run_status |
| --- | --- |
| STAT-0001 | timeout-expired |
| STAT-0002 | disconnected-drift |
| STAT-0003 | succeeded-final |
| STAT-0004 | succeeded-final |
| STAT-0005 | succeeded-final |
| STAT-0006 | retrying-backoff |

**t_allocation_with_run_status__run_status**

| id | allocation_id | run_status_id | role |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0006 | reviewer |
| STAT-0002 | STAT-0006 | STAT-0004 | observer |
| STAT-0003 | STAT-0004 | STAT-0002 | contributor |
| STAT-0004 | STAT-0001 | STAT-0005 | contributor |
| STAT-0005 | STAT-0006 | STAT-0001 | observer |
| STAT-0006 | STAT-0006 | STAT-0006 | reviewer |
| STAT-0007 | STAT-0006 | STAT-0006 | reviewer |
| STAT-0008 | STAT-0005 | STAT-0006 | observer |