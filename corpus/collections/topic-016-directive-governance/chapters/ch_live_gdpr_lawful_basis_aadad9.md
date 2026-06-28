---
chapter_id: ch_live_gdpr_lawful_basis_aadad9
topic_id: 16
family: 07_long_tail
cited_terms: ['gdpr_lawful_basis', 'allocation_completed_at', 'measurement_of_artifact']
model: engine-refine
---

The foundational architecture for regulatory and operational metadata rests on a disciplined separation between entities, their attributes, and the concrete values those attributes assume. An entity—whether a GDPR lawful basis such as ARTI-0001, a measurement artifact like latency_p99_ms, or an allocation record identified as batch-scheduler-slot—serves as the atomic unit of governance. Each entity carries a stable identifier, a machine-readable key such as BASI-0001, ARTI-0002, or COMP-0003, that anchors all downstream references. The attribute schema is defined independently of any single entity: the attribute definition tables enumerate names like effective_date, enforcement, mandatory, and priority alongside their corresponding types—xsd:date, xsd:string, xsd:boolean, xsd:integer, xsd:decimal, and xsd:dateTime—establishing a type system that governs how values may be stored and validated. This decoupling ensures that attribute semantics remain consistent across entities and that schema evolution can proceed without restructuring the value storage layer.

**t_gdpr_lawful_basis**

| id | gdpr | lawful_basis |
| --- | --- | --- |
| BASI-0001 | prod-us-east | ARTI-0001 |
| BASI-0002 | Swiss FADP | ARTI-0006 |
| BASI-0003 | NIS Directive | ARTI-0006 |
| BASI-0004 | Swiss FADP | ARTI-0005 |
| BASI-0005 | AI Act Framework | ARTI-0002 |
| BASI-0006 | cdn-edge-cache-b | ARTI-0005 |

**t_gdpr_lawful_basis_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| BASI-0001 | effective_date | xsd:date |
| BASI-0002 | enforcement | xsd:string |
| BASI-0003 | mandatory | xsd:boolean |
| BASI-0004 | priority | xsd:integer |
| BASI-0005 | review_cycle_days | xsd:integer |
| BASI-0006 | scope | xsd:string |
| BASI-0007 | encoding | xsd:string |
| BASI-0008 | label_text | xsd:string |

**t_gdpr_lawful_basis_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BASI-0001 | BASI-0001 | BASI-0003 | false |
| BASI-0002 | BASI-0002 | BASI-0003 | true |
| BASI-0003 | BASI-0003 | BASI-0003 | true |
| BASI-0004 | BASI-0004 | BASI-0003 | false |
| BASI-0005 | BASI-0005 | BASI-0003 | true |
| BASI-0006 | BASI-0006 | BASI-0003 | false |

**t_gdpr_lawful_basis_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BASI-0001 | BASI-0001 | BASI-0001 | 2023-01-18 |
| BASI-0002 | BASI-0002 | BASI-0001 | 2023-01-24 |
| BASI-0003 | BASI-0003 | BASI-0001 | 2025-03-25 |
| BASI-0004 | BASI-0004 | BASI-0001 | 2023-04-09 |
| BASI-0005 | BASI-0005 | BASI-0001 | 2024-12-12 |
| BASI-0006 | BASI-0006 | BASI-0001 | 2025-03-12 |

**t_gdpr_lawful_basis_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BASI-0001 | BASI-0001 | BASI-0004 | 4 |
| BASI-0002 | BASI-0001 | BASI-0005 | 683 |
| BASI-0003 | BASI-0002 | BASI-0004 | 4 |
| BASI-0004 | BASI-0002 | BASI-0005 | 470 |
| BASI-0005 | BASI-0003 | BASI-0004 | 2 |
| BASI-0006 | BASI-0003 | BASI-0005 | 535 |
| BASI-0007 | BASI-0004 | BASI-0004 | 1 |
| BASI-0008 | BASI-0004 | BASI-0005 | 87 |

**t_gdpr_lawful_basis_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BASI-0001 | BASI-0001 | BASI-0007 | Encoding 01 |
| BASI-0002 | BASI-0001 | BASI-0002 | Enforcement 02 |
| BASI-0003 | BASI-0001 | BASI-0008 | intake form |
| BASI-0004 | BASI-0001 | BASI-0009 | ja |
| BASI-0005 | BASI-0001 | BASI-0006 | Scope 05 |
| BASI-0006 | BASI-0002 | BASI-0007 | Encoding 06 |
| BASI-0007 | BASI-0002 | BASI-0002 | Enforcement 07 |
| BASI-0008 | BASI-0002 | BASI-0008 | nightly summary |

**t_measurement_of_artifact**

| id | measurement |
| --- | --- |
| ARTI-0001 | latency_p99_ms |
| ARTI-0002 | yield_stress_test |
| ARTI-0003 | latency_p99_ms |
| ARTI-0004 | pressure_transducer |
| ARTI-0005 | humidity_dew_point |
| ARTI-0006 | ambient_temp_22C |

**t_measurement_of_artifact_attr**

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

**t_measurement_of_artifact_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0004 | 2023-05-19T07:46:35 |
| ARTI-0002 | ARTI-0002 | ARTI-0004 | 2023-01-19T07:45:29 |
| ARTI-0003 | ARTI-0003 | ARTI-0004 | 2023-07-23T03:47:45 |
| ARTI-0004 | ARTI-0004 | ARTI-0004 | 2024-05-29T07:18:18 |
| ARTI-0005 | ARTI-0005 | ARTI-0004 | 2025-04-05T23:37:46 |
| ARTI-0006 | ARTI-0006 | ARTI-0004 | 2025-01-30T06:20:58 |

**t_measurement_of_artifact_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0001 | 0.670 |
| ARTI-0002 | ARTI-0001 | ARTI-0005 | 226.14 |
| ARTI-0003 | ARTI-0001 | ARTI-0007 | 361.86 |
| ARTI-0004 | ARTI-0002 | ARTI-0001 | 0.088 |
| ARTI-0005 | ARTI-0002 | ARTI-0005 | 798.78 |
| ARTI-0006 | ARTI-0002 | ARTI-0007 | 163.07 |
| ARTI-0007 | ARTI-0003 | ARTI-0001 | 0.775 |
| ARTI-0008 | ARTI-0003 | ARTI-0005 | 896.63 |

**t_measurement_of_artifact_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0002 | Dimension Kind 01 |
| ARTI-0002 | ARTI-0001 | ARTI-0008 | Encoding 02 |
| ARTI-0003 | ARTI-0001 | ARTI-0009 | intake form |
| ARTI-0004 | ARTI-0001 | ARTI-0010 | fr |
| ARTI-0005 | ARTI-0001 | ARTI-0003 | manual |
| ARTI-0006 | ARTI-0001 | ARTI-0006 | ratio |
| ARTI-0007 | ARTI-0002 | ARTI-0002 | Dimension Kind 07 |
| ARTI-0008 | ARTI-0002 | ARTI-0008 | Encoding 08 |

Value storage follows a type-partitioned design that routes attribute values into dedicated tables according to their declared attr_type. Boolean attributes such as mandatory resolve to true or false in the value_boolean table, where entity_id BASI-0001 maps to false while BASI-0002 and BASI-0003 both resolve to true, all referencing the same attr_id BASI-0003. Date and datetime attributes occupy their own partitions: effective_date values for GDPR lawful basis records include 2023-01-18 and 2025-03-25, while recorded_at timestamps for measurement artifacts span from 2023-01-19T07:45:29 through 2024-05-29T07:18:18. Integer attributes such as priority carry values like 683 and 470, and varchar attributes hold freeform strings including Encoding 01, Enforcement 02, intake form, and ja. The entity_id column in each value table serves as the foreign key back to the core entity, while attr_id references the attribute definition, creating a normalized triple of entity, attribute, and typed value that can be queried across heterogeneous data types without type coercion.

The identifier column in every table functions as both a primary key and a cross-referencing handle. In the lawful basis table, the identifier BASI-0001 links to gdpr scope prod-us-east and lawful_basis ARTI-0001; in the measurement artifact table, ARTI-0001 identifies a latency_p99_ms measurement with a confidence of 0.670 and a dimension_kind of Dimension Kind 01. The allocation tables use identifiers such as COMP-0001 through COMP-0004 to distinguish completed-at records, each associated with an allocation like k8s-pod-quota or GDPR Article 6, and a completion timestamp ranging from 2023-10-25T22:48:55Z to 2024-06-30T15:05:33Z. This uniform identification scheme enables referential integrity across the entire metadata graph, allowing any component to locate and resolve related records through simple key lookups.

**t_allocation_completed_at**

| id | allocation |
| --- | --- |
| COMP-0001 | batch-scheduler-slot |
| COMP-0002 | GDPR Article 6 |
| COMP-0003 | batch-scheduler-slot |
| COMP-0004 | k8s-pod-quota |
| COMP-0005 | Swiss FADP |
| COMP-0006 | AI Act Framework |

**t_allocation_completed_at_completed_at**

| id | completed_at |
| --- | --- |
| COMP-0001 | 2023-10-25T22:48:55Z |
| COMP-0002 | 2024-06-30T15:05:33Z |
| COMP-0003 | 2024-04-12T09:11:08Z |
| COMP-0004 | 2023-10-25T22:48:55Z |
| COMP-0005 | 2023-08-09T19:33:47Z |
| COMP-0006 | 2023-08-09T19:33:47Z |

Relationships between entities are captured through junction tables that encode not only which entities are connected but the nature of the connection via a role attribute. The allocation junction table, for instance, links allocation records to completed-at records through subject and target columns—allocation_id and completed_at_id respectively—while a role column disambiguates the relationship: observer, owner, or contributor. A single completed-at record with identifier COMP-0003 may appear as the target of two different allocations, once with role observer and once with role owner, demonstrating how the same entity can participate in multiple relationships with distinct semantic meanings. This role-based relationship model supports complex governance scenarios where the same resource may be observed by one team, owned by another, and contributed to by a third, all within a single normalized structure.

**t_allocation_completed_at__completed_at**

| id | allocation_id | completed_at_id | role |
| --- | --- | --- | --- |
| COMP-0001 | COMP-0005 | COMP-0003 | observer |
| COMP-0002 | COMP-0006 | COMP-0003 | observer |
| COMP-0003 | COMP-0002 | COMP-0005 | owner |
| COMP-0004 | COMP-0001 | COMP-0002 | contributor |
| COMP-0005 | COMP-0004 | COMP-0004 | owner |
| COMP-0006 | COMP-0001 | COMP-0005 | owner |
| COMP-0007 | COMP-0003 | COMP-0003 | reviewer |
| COMP-0008 | COMP-0004 | COMP-0006 | observer |

The practical consequence of this architecture is a metadata system that scales horizontally across domains without requiring schema changes. Adding a new attribute type—say, a new xsd:decimal measurement for a GDPR lawful basis—requires only inserting a definition into the attribute table and corresponding rows into the appropriate value table; no table modifications are needed. The type system enforces data integrity at the schema level, while the entity-attribute-value pattern ensures that queries can be expressed uniformly regardless of the underlying data type. Governance frameworks built on this foundation can trace a measurement artifact like pressure_transducer through its recorded_at timestamp, its confidence score of 361.86, and its dimension_kind of Encoding 02, all while maintaining referential links to the entities and relationships that govern its collection and use.