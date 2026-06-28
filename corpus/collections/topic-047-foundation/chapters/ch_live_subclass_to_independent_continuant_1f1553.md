---
chapter_id: ch_live_subclass_to_independent_continuant_1f1553
topic_id: 47
family: 01_foundation
cited_terms: ['subclass_to_independent_continuant', 'subclass_to_information_content_entity', 'subclass_to_process']
model: engine-refine
---

In ontology-driven data modeling, the distinction between an entity and its attributes constitutes the foundational schema for representing both physical and informational phenomena. An entity—whether an independent continuant such as a Firewall Appliance 7 or a Server Rack 14A, an information content entity like a telemetry_stream or compliance_audit, or a process including incident response and batch ingestion—is first and foremost identified by a stable, machine-readable identifier. These identifiers, formatted as CONT-0001 or PROC-0001, serve as the immutable anchor points across all relational joins, ensuring that every attribute value and every cross-reference resolves to a single, unambiguous referent. The entity itself carries descriptive content: an information content entity such as a schema_registry or data_catalog_entry is accompanied by a label_text—nightly summary, pre-release note, intake form, change rationale—that provides human-readable context, while the language field (en, ja, es) disambiguates the linguistic register of that label, enabling multilingual governance frameworks to operate within a single normalized structure.

**t_subclass_to_independent_continuant**

| id | independent |
| --- | --- |
| CONT-0001 | Audit Log Stream 5 |
| CONT-0002 | Audit Log Stream 5 |
| CONT-0003 | Firewall Appliance 7 |
| CONT-0004 | Server Rack 14A |
| CONT-0005 | Sensor Node 7B |
| CONT-0006 | Server Rack 14A |

**t_subclass_to_independent_continuant_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CONT-0001 | location | xsd:string |
| CONT-0002 | name | xsd:string |
| CONT-0003 | owner | cco:Person |
| CONT-0004 | tags | xsd:string |

**t_subclass_to_independent_continuant_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONT-0001 | CONT-0001 | CONT-0001 | on-prem-dc1 |
| CONT-0002 | CONT-0001 | CONT-0002 | Name 02 |
| CONT-0003 | CONT-0001 | CONT-0003 | sre |
| CONT-0004 | CONT-0001 | CONT-0004 | Tags 04 |
| CONT-0005 | CONT-0002 | CONT-0001 | us-east-1 |
| CONT-0006 | CONT-0002 | CONT-0002 | Name 06 |
| CONT-0007 | CONT-0002 | CONT-0003 | sre |
| CONT-0008 | CONT-0002 | CONT-0004 | Tags 08 |

**t_subclass_to_information_content_entity**

| id | information | label_text | language |
| --- | --- | --- | --- |
| ENTI-0001 | schema_registry | nightly summary | en |
| ENTI-0002 | telemetry_stream | pre-release note | ja |
| ENTI-0003 | compliance_audit | intake form | ja |
| ENTI-0004 | data_catalog_entry | change rationale | es |
| ENTI-0005 | model_weights | nightly summary | en |
| ENTI-0006 | deployment_manifest | pre-release note | en |

**t_subclass_to_process**

| id | process |
| --- | --- |
| PROC-0001 | incident response |
| PROC-0002 | data validation |
| PROC-0003 | telemetry aggregation |
| PROC-0004 | batch ingestion |
| PROC-0005 | data validation |
| PROC-0006 | stream processing |

**t_subclass_to_process_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROC-0001 | PROC-0001 | PROC-0003 | 684 |
| PROC-0002 | PROC-0001 | PROC-0007 | 195 |
| PROC-0003 | PROC-0002 | PROC-0003 | 63 |
| PROC-0004 | PROC-0002 | PROC-0007 | 361 |
| PROC-0005 | PROC-0003 | PROC-0003 | 107 |
| PROC-0006 | PROC-0003 | PROC-0007 | 1 |
| PROC-0007 | PROC-0004 | PROC-0003 | 32 |
| PROC-0008 | PROC-0004 | PROC-0007 | 2 |

Attributes bridge the gap between abstract entity definitions and concrete, queryable data. An attribute such as location, name, owner, or tags is not merely a column header but a typed property whose semantics are governed by its attr_type declaration. The attr_type enforces a strict type discipline: xsd:string accommodates free-form values like on-prem-dc1 or Tags 04; xsd:decimal captures numeric measurements such as 5106.96 or 6532.76; xsd:dateTime records temporal boundaries including 2024-02-25T00:58:35 and 2025-01-11T16:52:13; xsd:integer constrains discrete counts like 684 or 361; and domain-specific types such as cco:Person model structured relationships to organizational roles. This type-aware attribute system ensures that every value stored against an entity carries both its semantic meaning and its type constraint, eliminating the ambiguity that plagues untyped key-value stores.

The separation of attribute definitions from their values is not an artifact of normalization alone but a deliberate architectural choice that supports polymorphic storage. Because attribute values span heterogeneous types, the system distributes them across dedicated value tables—varchar-valued properties, datetime measurements, decimal durations, and integer exit codes—each governed by a composite key consisting of the entity identifier, the attribute identifier, and a surrogate row identifier. A single entity such as the process identified as PROC-0001 may simultaneously hold a host_name value of worker-07, a duration_seconds measurement of 5106.96, an exit_code of 684, and an end_time of 2024-02-25T00:58:35, each resolved through its respective value table. This distribution preserves referential integrity while allowing the schema to accommodate new attribute types without structural migration.

**t_subclass_to_process_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| PROC-0001 | duration_seconds | xsd:decimal |
| PROC-0002 | end_time | xsd:dateTime |
| PROC-0003 | exit_code | xsd:integer |
| PROC-0004 | host_name | xsd:string |
| PROC-0005 | log_level | xsd:string |
| PROC-0006 | phase | xsd:string |
| PROC-0007 | retry_count | xsd:integer |
| PROC-0008 | scheduled_at | xsd:dateTime |

**t_subclass_to_process_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROC-0001 | PROC-0001 | PROC-0002 | 2024-02-25T00:58:35 |
| PROC-0002 | PROC-0001 | PROC-0008 | 2025-01-11T16:52:13 |
| PROC-0003 | PROC-0001 | PROC-0009 | 2024-01-24T01:55:59 |
| PROC-0004 | PROC-0002 | PROC-0002 | 2024-06-21T23:54:50 |
| PROC-0005 | PROC-0002 | PROC-0008 | 2023-12-17T03:43:06 |
| PROC-0006 | PROC-0002 | PROC-0009 | 2023-12-07T20:42:12 |
| PROC-0007 | PROC-0003 | PROC-0002 | 2024-06-16T15:41:50 |
| PROC-0008 | PROC-0003 | PROC-0008 | 2025-01-20T06:41:15 |

**t_subclass_to_process_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROC-0001 | PROC-0001 | PROC-0001 | 5106.96 |
| PROC-0002 | PROC-0002 | PROC-0001 | 6532.76 |
| PROC-0003 | PROC-0003 | PROC-0001 | 6219.83 |
| PROC-0004 | PROC-0004 | PROC-0001 | 2715.88 |
| PROC-0005 | PROC-0005 | PROC-0001 | 3614.44 |
| PROC-0006 | PROC-0006 | PROC-0001 | 6690.61 |

**t_subclass_to_process_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROC-0001 | PROC-0001 | PROC-0004 | worker-07 |
| PROC-0002 | PROC-0001 | PROC-0005 | Log Level 02 |
| PROC-0003 | PROC-0001 | PROC-0006 | closeout |
| PROC-0004 | PROC-0001 | PROC-0010 | pending |
| PROC-0005 | PROC-0001 | PROC-0011 | Triggered By 05 |
| PROC-0006 | PROC-0002 | PROC-0004 | worker-07 |
| PROC-0007 | PROC-0002 | PROC-0005 | Log Level 07 |
| PROC-0008 | PROC-0002 | PROC-0006 | closeout |

This architecture yields a governance framework in which entities, attributes, and values are independently extensible. New attribute definitions can be introduced into the attribute registry without modifying any value table; new value types can be added as dedicated storage tables without altering the entity or attribute schemas; and label_text entries can be localized into additional languages without affecting the underlying information content. The result is a system where the identifier provides permanence, the attribute provides semantic structure, the attr_type provides type safety, and the value tables provide storage flexibility—all while maintaining a single, queryable model of the operational environment.