---
chapter_id: ch_live_program_with_entry_exactly_one_f20136
topic_id: 186
family: 01_foundation
cited_terms: ['program_with_entry_exactly_one', 'requirement_applies_to_system', 'cardinality_min_one_generic']
model: engine-refine
---

Within enterprise governance frameworks, identifiers serve as the immutable anchors that bind requirements to the systems they govern. A requirement such as "latency under 50ms" or "encryption at rest" does not exist in the abstract; it is attached to a concrete system identified by codes like `SYST-0001` or `SYST-0002`. These identifiers propagate through the architecture: programs like `inventory_sync` and `nightly_etl` declare their entry points as system identifiers (`SYST-0003`, `SYST-0006`), while resource identifiers such as `ARN:res/41` and `ref-8842` tie those programs to specific deployed assets. The identifier `ONE-0001` through `ONE-0004` further structures these mappings, ensuring that each program-to-system linkage can be uniquely referenced, audited, and versioned.

**t_program_with_entry_exactly_one**

| id | program | entry_point | identifier | version |
| --- | --- | --- | --- | --- |
| ONE-0001 | inventory_sync | SYST-0003 | ARN:res/41 | 12 |
| ONE-0002 | inventory_sync | SYST-0006 | ARN:res/41 | 3 |
| ONE-0003 | nightly_etl | SYST-0006 | ARN:res/41 | 8 |
| ONE-0004 | health_check | SYST-0001 | ref-8842 | 11 |
| ONE-0005 | health_check | SYST-0002 | doi:10.1109/x | 9 |
| ONE-0006 | nightly_etl | SYST-0001 | urn:uuid:9f2a | 7 |
| ONE-0007 | health_check | SYST-0003 | urn:uuid:9f2a | 1 |

**t_requirement_applies_to_system**

| id | requirement |
| --- | --- |
| SYST-0001 | latency under 50ms |
| SYST-0002 | audit logging enabled |
| SYST-0003 | encryption at rest |
| SYST-0004 | backup frequency daily |
| SYST-0005 | network segmentation mandatory |
| SYST-0006 | network segmentation mandatory |

**t_cardinality_min_one_generic**

| id | cardinality | related |
| --- | --- | --- |
| GENE-0001 | exactlyOne | SYST-0004 |
| GENE-0002 | minOne | SYST-0004 |
| GENE-0003 | minOne | SYST-0004 |
| GENE-0004 | required | SYST-0005 |
| GENE-0005 | minOne | SYST-0004 |
| GENE-0006 | many | SYST-0001 |

Attributes and their types provide the dimensional layer that transforms a binary requirement-application into a nuanced compliance posture. When a requirement applies to a system, it carries metadata properties—`effective_date`, `enforcement`, `mandatory`, and `priority`—each typed according to XML Schema definitions. The `effective_date` attribute uses `xsd:date` to record when a requirement becomes operative, with values such as `2025-05-21` and `2024-02-21` marking distinct compliance windows. Boolean attributes like `mandatory` use `xsd:boolean` to indicate whether a requirement is non-negotiable, as seen in the `true` and `false` assignments across system-requirement pairs. Integer attributes such as `priority` employ `xsd:integer` to rank requirements numerically, with values ranging from `1` to `391` reflecting varying degrees of urgency. String attributes (`xsd:string`) capture free-form details like `audit excerpt` or locale codes such as `fr`, while typed values like `Encoding 01` and `Enforcement 02` provide structured descriptors.

**t_requirement_applies_to_system_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SYST-0001 | effective_date | xsd:date |
| SYST-0002 | enforcement | xsd:string |
| SYST-0003 | mandatory | xsd:boolean |
| SYST-0004 | priority | xsd:integer |
| SYST-0005 | review_cycle_days | xsd:integer |
| SYST-0006 | scope | xsd:string |
| SYST-0007 | encoding | xsd:string |
| SYST-0008 | label_text | xsd:string |

The separation of attribute values by type into distinct storage domains reflects a deliberate design choice that preserves data integrity while enabling efficient querying. Boolean values for the `mandatory` attribute are stored in a dedicated boolean table, date values for `effective_date` in a date-specific table, integer values for `priority` in an integer table, and string values in a varchar table. This type-disaggregated architecture ensures that a compliance officer can query all systems where `mandatory` is `true` without scanning mixed-type columns, and that date comparisons on `effective_date` values like `2023-05-13` and `2023-08-26` operate on properly typed fields. The entity column in each value table links the attribute back to the system-requirement pair, while the attribute identifier column (`attr_id`) references the attribute definition, creating a three-way join that reconstructs the full compliance record.

**t_requirement_applies_to_system_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SYST-0001 | SYST-0001 | SYST-0003 | false |
| SYST-0002 | SYST-0002 | SYST-0003 | true |
| SYST-0003 | SYST-0003 | SYST-0003 | true |
| SYST-0004 | SYST-0004 | SYST-0003 | false |
| SYST-0005 | SYST-0005 | SYST-0003 | true |
| SYST-0006 | SYST-0006 | SYST-0003 | false |

**t_requirement_applies_to_system_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SYST-0001 | SYST-0001 | SYST-0001 | 2025-05-21 |
| SYST-0002 | SYST-0002 | SYST-0001 | 2024-02-21 |
| SYST-0003 | SYST-0003 | SYST-0001 | 2023-05-13 |
| SYST-0004 | SYST-0004 | SYST-0001 | 2023-08-26 |
| SYST-0005 | SYST-0005 | SYST-0001 | 2025-01-01 |
| SYST-0006 | SYST-0006 | SYST-0001 | 2023-04-22 |

**t_requirement_applies_to_system_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SYST-0001 | SYST-0001 | SYST-0004 | 1 |
| SYST-0002 | SYST-0001 | SYST-0005 | 391 |
| SYST-0003 | SYST-0002 | SYST-0004 | 5 |
| SYST-0004 | SYST-0002 | SYST-0005 | 295 |
| SYST-0005 | SYST-0003 | SYST-0004 | 2 |
| SYST-0006 | SYST-0003 | SYST-0005 | 418 |
| SYST-0007 | SYST-0004 | SYST-0004 | 4 |
| SYST-0008 | SYST-0004 | SYST-0005 | 590 |

**t_requirement_applies_to_system_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SYST-0001 | SYST-0001 | SYST-0007 | Encoding 01 |
| SYST-0002 | SYST-0001 | SYST-0002 | Enforcement 02 |
| SYST-0003 | SYST-0001 | SYST-0008 | audit excerpt |
| SYST-0004 | SYST-0001 | SYST-0009 | fr |
| SYST-0005 | SYST-0001 | SYST-0006 | Scope 05 |
| SYST-0006 | SYST-0002 | SYST-0007 | Encoding 06 |
| SYST-0007 | SYST-0002 | SYST-0002 | Enforcement 07 |
| SYST-0008 | SYST-0002 | SYST-0008 | intake form |

Versioning and cardinality constraints complete the governance model by enforcing structural discipline and change tracking. Programs are versioned—`inventory_sync` appears at version `12` and version `3`, `nightly_etl` at version `8`, and `health_check` at version `11`—allowing auditors to trace which version of a program was active when a particular compliance state was established. Cardinality constraints such as `exactlyOne`, `minOne`, and `required` govern the multiplicity of relationships between entities, ensuring that systems like `SYST-0004` and `SYST-0005` are referenced according to their contractual obligations. These constraints prevent orphaned requirements and guarantee that every system has at least the minimum set of applicable requirements, while `exactlyOne` relationships enforce singular entry-point assignments that simplify traceability.