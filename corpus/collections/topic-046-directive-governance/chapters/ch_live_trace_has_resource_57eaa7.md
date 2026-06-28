---
chapter_id: ch_live_trace_has_resource_57eaa7
topic_id: 46
family: 02_observation_measurement
cited_terms: ['trace_has_resource', 'schemaorg_person_named', 'control_with_owner']
model: engine-refine
---

In governance and operational registries, the identification of entities and the attribution of properties to them follow a disciplined separation of definition from instantiation. An identifier serves as the stable key by which any record—whether a trace, a resource, or a named person—is referenced across the system. Identifiers such as `RESO-0001` or `NAME-0001` appear not only as primary keys but also as foreign references, binding together disparate facets of the same logical object. An entity, in turn, is the concrete instantiation of a concept within a particular context: the same trace `batch-etl-nightly` may be associated with resource `NAME-0005`, while a person entity identified as `person/alan_turing` carries its own distinct set of attributes. This separation of identifier from entity allows the same logical object to be referenced from multiple relationship tables without duplication, and it ensures that attribute definitions remain decoupled from the values they describe.

**t_trace_has_resource**

| id | trace | resource |
| --- | --- | --- |
| RESO-0001 | batch-etl-nightly | NAME-0005 |
| RESO-0002 | lab-assay-protocol-2b | NAME-0005 |
| RESO-0003 | governance-audit-cycle-9 | NAME-0005 |
| RESO-0004 | lab-assay-protocol-2b | NAME-0001 |
| RESO-0005 | ml-training-run-aurora | NAME-0001 |
| RESO-0006 | governance-audit-cycle-9 | NAME-0005 |
| RESO-0007 | lab-assay-protocol-2b | NAME-0006 |
| RESO-0008 | api-gateway-chain-alpha | NAME-0001 |

**t_trace_has_resource_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| RESO-0001 | duration_seconds | xsd:decimal |
| RESO-0002 | end_time | xsd:dateTime |
| RESO-0003 | exit_code | xsd:integer |
| RESO-0004 | host_name | xsd:string |
| RESO-0005 | log_level | xsd:string |
| RESO-0006 | phase | xsd:string |
| RESO-0007 | retry_count | xsd:integer |
| RESO-0008 | scheduled_at | xsd:dateTime |

**t_trace_has_resource_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RESO-0001 | RESO-0001 | RESO-0002 | 2024-06-04T06:37:56 |
| RESO-0002 | RESO-0001 | RESO-0008 | 2024-12-02T12:01:14 |
| RESO-0003 | RESO-0001 | RESO-0009 | 2023-01-28T15:18:51 |
| RESO-0004 | RESO-0002 | RESO-0002 | 2024-10-26T21:48:09 |
| RESO-0005 | RESO-0002 | RESO-0008 | 2023-05-28T23:57:13 |
| RESO-0006 | RESO-0002 | RESO-0009 | 2024-11-25T19:57:56 |
| RESO-0007 | RESO-0003 | RESO-0002 | 2025-04-19T16:24:22 |
| RESO-0008 | RESO-0003 | RESO-0008 | 2023-04-30T19:04:21 |

**t_trace_has_resource_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RESO-0001 | RESO-0001 | RESO-0001 | 6459.38 |
| RESO-0002 | RESO-0002 | RESO-0001 | 3107.88 |
| RESO-0003 | RESO-0003 | RESO-0001 | 4594.49 |
| RESO-0004 | RESO-0004 | RESO-0001 | 2602.26 |
| RESO-0005 | RESO-0005 | RESO-0001 | 5003.83 |
| RESO-0006 | RESO-0006 | RESO-0001 | 252.98 |
| RESO-0007 | RESO-0007 | RESO-0001 | 239.70 |
| RESO-0008 | RESO-0008 | RESO-0001 | 3334.43 |

**t_trace_has_resource_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RESO-0001 | RESO-0001 | RESO-0003 | 866 |
| RESO-0002 | RESO-0001 | RESO-0007 | 141 |
| RESO-0003 | RESO-0002 | RESO-0003 | 185 |
| RESO-0004 | RESO-0002 | RESO-0007 | 294 |
| RESO-0005 | RESO-0003 | RESO-0003 | 284 |
| RESO-0006 | RESO-0003 | RESO-0007 | 200 |
| RESO-0007 | RESO-0004 | RESO-0003 | 838 |
| RESO-0008 | RESO-0004 | RESO-0007 | 136 |

**t_trace_has_resource_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RESO-0001 | RESO-0001 | RESO-0004 | node-b14 |
| RESO-0002 | RESO-0001 | RESO-0005 | Log Level 02 |
| RESO-0003 | RESO-0001 | RESO-0006 | closeout |
| RESO-0004 | RESO-0001 | RESO-0010 | running |
| RESO-0005 | RESO-0001 | RESO-0011 | Triggered By 05 |
| RESO-0006 | RESO-0002 | RESO-0004 | worker-07 |
| RESO-0007 | RESO-0002 | RESO-0005 | Log Level 07 |
| RESO-0008 | RESO-0002 | RESO-0006 | review |

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

**t_control_with_owner**

| id | control |
| --- | --- |
| OWNE-0001 | Vendor Risk Assessment |
| OWNE-0002 | Data Retention Policy |
| OWNE-0003 | Vendor Risk Assessment |
| OWNE-0004 | Data Retention Policy |
| OWNE-0005 | Password Complexity Policy |
| OWNE-0006 | MFA Enforcement |
| OWNE-0007 | Data Retention Policy |

**t_control_with_owner_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0003 | true |
| OWNE-0002 | OWNE-0002 | OWNE-0003 | true |
| OWNE-0003 | OWNE-0003 | OWNE-0003 | false |
| OWNE-0004 | OWNE-0004 | OWNE-0003 | true |
| OWNE-0005 | OWNE-0005 | OWNE-0003 | true |
| OWNE-0006 | OWNE-0006 | OWNE-0003 | true |
| OWNE-0007 | OWNE-0007 | OWNE-0003 | true |

**t_control_with_owner_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0001 | 2024-04-04 |
| OWNE-0002 | OWNE-0002 | OWNE-0001 | 2025-04-01 |
| OWNE-0003 | OWNE-0003 | OWNE-0001 | 2025-05-22 |
| OWNE-0004 | OWNE-0004 | OWNE-0001 | 2024-09-08 |
| OWNE-0005 | OWNE-0005 | OWNE-0001 | 2023-05-30 |
| OWNE-0006 | OWNE-0006 | OWNE-0001 | 2023-06-07 |
| OWNE-0007 | OWNE-0007 | OWNE-0001 | 2025-03-19 |

**t_control_with_owner_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0004 | 4 |
| OWNE-0002 | OWNE-0001 | OWNE-0005 | 806 |
| OWNE-0003 | OWNE-0002 | OWNE-0004 | 5 |
| OWNE-0004 | OWNE-0002 | OWNE-0005 | 150 |
| OWNE-0005 | OWNE-0003 | OWNE-0004 | 1 |
| OWNE-0006 | OWNE-0003 | OWNE-0005 | 596 |
| OWNE-0007 | OWNE-0004 | OWNE-0004 | 2 |
| OWNE-0008 | OWNE-0004 | OWNE-0005 | 663 |

**t_control_with_owner_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0007 | Encoding 01 |
| OWNE-0002 | OWNE-0001 | OWNE-0002 | Enforcement 02 |
| OWNE-0003 | OWNE-0001 | OWNE-0008 | change rationale |
| OWNE-0004 | OWNE-0001 | OWNE-0009 | es |
| OWNE-0005 | OWNE-0001 | OWNE-0006 | Scope 05 |
| OWNE-0006 | OWNE-0002 | OWNE-0007 | Encoding 06 |
| OWNE-0007 | OWNE-0002 | OWNE-0002 | Enforcement 07 |
| OWNE-0008 | OWNE-0002 | OWNE-0008 | intake form |

Attributes and their types form the schema layer that gives meaning to otherwise opaque values. An attribute—`duration_seconds`, `effective_date`, `mandatory`—is declared once in a definition table alongside its type, such as `xsd:decimal`, `xsd:dateTime`, or `xsd:boolean`. The type annotation is not merely documentation; it governs which value table receives the data. A decimal attribute like `duration_seconds` is stored in the decimal value table with a value of `6459.38`, while a boolean attribute such as `mandatory` is persisted in the boolean value table with the value `true`. This type-dispatched storage pattern means that the schema layer alone—`attr_name` paired with `attr_type`—is sufficient to determine where any given attribute's value resides, and it enforces type safety at the point of insertion rather than at query time.

The value tables themselves, often referred to in data modeling as misc or miscellaneous value stores, are the terminal destination for all attribute data. Each value table is homogeneous: it holds a single data type across all rows, and each row is identified by a composite of an entity reference and an attribute reference. A datetime value such as `2024-06-04T06:37:56` is stored alongside its entity key `RESO-0001` and its attribute key `RESO-0002`, forming a triple that can be resolved by any consumer of the data. A varchar value like `node-b14` or `closeout` follows the same pattern in its own table, and an integer value such as `866` or `185` is stored analogously. The misc designation reflects the fact that these tables are not semantically distinguished by content type but rather by the data type of their `value` column; the semantic meaning of `closeout` versus `running` is determined entirely by the attribute to which the value is attached.

Subject, target, and role constitute the relationship layer that connects entities beyond simple attribute-value pairs. In the person-naming construct, a subject entity such as `NAME-0003` (corresponding to `person/alan_turing`) is linked to a target entity `NAME-0002` (the full name `Donald Knuth`) through a relationship row that carries a role—`reviewer` in this case. Another row links `NAME-0003` to `NAME-0002` with the role `owner`, demonstrating that the same subject-target pair can carry multiple roles, each representing a distinct relationship. The role column is the semantic differentiator: it answers not just who is connected to whom, but in what capacity. This three-column relationship model—subject, target, role—generalizes beyond person-name associations to any domain where entities participate in typed relationships, and it avoids the need for a separate relationship table per relationship type.

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

**t_control_with_owner_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| OWNE-0001 | effective_date | xsd:date |
| OWNE-0002 | enforcement | xsd:string |
| OWNE-0003 | mandatory | xsd:boolean |
| OWNE-0004 | priority | xsd:integer |
| OWNE-0005 | review_cycle_days | xsd:integer |
| OWNE-0006 | scope | xsd:string |
| OWNE-0007 | encoding | xsd:string |
| OWNE-0008 | label_text | xsd:string |

The practical effect of this architecture is a system in which new attribute types and new relationship roles can be introduced without schema migration. Adding a new attribute to a trace—say, `cpu_utilization` of type `xsd:decimal`—requires only an insertion into the attribute definition table; the value will be stored in the existing decimal value table without any structural change. Similarly, introducing a new role such as `auditor` in the subject-target relationship layer requires no table alteration. The trade-off is query complexity: resolving a complete record demands joins across the definition tables and the appropriate value table, and the type-dispatched storage means that a single logical entity may have its attributes scattered across multiple value tables. Nevertheless, for domains where attribute sets are heterogeneous and evolve independently—governance controls with properties like `enforcement` and `priority`, or operational traces with properties ranging from `exit_code` to `end_time`—this pattern provides the flexibility that rigid schemas cannot.