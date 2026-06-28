---
chapter_id: ch_live_directive_traces_to_requirement_c2ba2f
topic_id: 23
family: 03_directive_governance
cited_terms: ['directive_traces_to_requirement', 'audit_subclass', 'ebpf_program_governed_by_directive']
model: engine-refine
---

The governance of technical controls rests upon a disciplined separation between the identity of a regulated entity and the mutable properties that describe its compliance posture. Each entity—whether a requirement such as REQU-0001, an audit event such as AUDI-0001, or an eBPF program such as DIRE-0001—receives a stable, opaque identifier that serves as the anchor for all subsequent attribute bindings. These identifiers do not encode semantics; they exist solely to guarantee referential integrity across the model. The substantive meaning of an entity is captured in a single human-readable column: the directive column in the requirement table carries values like ISO 27001:2022, PCI DSS v4.0, and EU AI Act Article 9, while the audit column in the audit subclass table records SOC2 Type II Review and HIPAA Security Audit, and the ebpf column in the eBPF governance table names tracepoint_sched and xdp_fwd. This bifurcation—opaque key versus descriptive label—ensures that downstream queries and joins remain stable even as the human-readable descriptions evolve.

**t_directive_traces_to_requirement**

| id | directive |
| --- | --- |
| REQU-0001 | ISO 27001:2022 |
| REQU-0002 | PCI DSS v4.0 |
| REQU-0003 | EU AI Act Article 9 |
| REQU-0004 | Data Classification Policy |
| REQU-0005 | PCI DSS v4.0 |
| REQU-0006 | HIPAA Privacy Rule |

**t_directive_traces_to_requirement_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| REQU-0001 | effective_date | xsd:date |
| REQU-0002 | enforcement | xsd:string |
| REQU-0003 | mandatory | xsd:boolean |
| REQU-0004 | priority | xsd:integer |
| REQU-0005 | review_cycle_days | xsd:integer |
| REQU-0006 | scope | xsd:string |
| REQU-0007 | encoding | xsd:string |
| REQU-0008 | label_text | xsd:string |

**t_directive_traces_to_requirement_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0003 | false |
| REQU-0002 | REQU-0002 | REQU-0003 | false |
| REQU-0003 | REQU-0003 | REQU-0003 | true |
| REQU-0004 | REQU-0004 | REQU-0003 | false |
| REQU-0005 | REQU-0005 | REQU-0003 | false |
| REQU-0006 | REQU-0006 | REQU-0003 | true |

**t_directive_traces_to_requirement_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0001 | 2023-08-06 |
| REQU-0002 | REQU-0002 | REQU-0001 | 2023-10-19 |
| REQU-0003 | REQU-0003 | REQU-0001 | 2025-05-18 |
| REQU-0004 | REQU-0004 | REQU-0001 | 2023-12-14 |
| REQU-0005 | REQU-0005 | REQU-0001 | 2024-01-08 |
| REQU-0006 | REQU-0006 | REQU-0001 | 2024-04-02 |

**t_directive_traces_to_requirement_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0004 | 4 |
| REQU-0002 | REQU-0001 | REQU-0005 | 132 |
| REQU-0003 | REQU-0002 | REQU-0004 | 4 |
| REQU-0004 | REQU-0002 | REQU-0005 | 453 |
| REQU-0005 | REQU-0003 | REQU-0004 | 4 |
| REQU-0006 | REQU-0003 | REQU-0005 | 497 |
| REQU-0007 | REQU-0004 | REQU-0004 | 4 |
| REQU-0008 | REQU-0004 | REQU-0005 | 899 |

**t_directive_traces_to_requirement_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0007 | Encoding 01 |
| REQU-0002 | REQU-0001 | REQU-0002 | Enforcement 02 |
| REQU-0003 | REQU-0001 | REQU-0008 | nightly summary |
| REQU-0004 | REQU-0001 | REQU-0009 | ja |
| REQU-0005 | REQU-0001 | REQU-0006 | Scope 05 |
| REQU-0006 | REQU-0002 | REQU-0007 | Encoding 06 |
| REQU-0007 | REQU-0002 | REQU-0002 | Enforcement 07 |
| REQU-0008 | REQU-0002 | REQU-0008 | change rationale |

**t_audit_subclass**

| id | audit |
| --- | --- |
| AUDI-0001 | SOC2 Type II Review |
| AUDI-0002 | PCI DSS Certification |
| AUDI-0003 | GDPR Data Flow Assessment |
| AUDI-0004 | HIPAA Security Audit |
| AUDI-0005 | HIPAA Security Audit |
| AUDI-0006 | 21 CFR Part 11 Audit |

**t_audit_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| AUDI-0001 | duration_seconds | xsd:decimal |
| AUDI-0002 | end_time | xsd:dateTime |
| AUDI-0003 | exit_code | xsd:integer |
| AUDI-0004 | host_name | xsd:string |
| AUDI-0005 | log_level | xsd:string |
| AUDI-0006 | phase | xsd:string |
| AUDI-0007 | retry_count | xsd:integer |
| AUDI-0008 | scheduled_at | xsd:dateTime |

**t_audit_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0003 | 943 |
| AUDI-0002 | AUDI-0001 | AUDI-0007 | 337 |
| AUDI-0003 | AUDI-0002 | AUDI-0003 | 718 |
| AUDI-0004 | AUDI-0002 | AUDI-0007 | 453 |
| AUDI-0005 | AUDI-0003 | AUDI-0003 | 258 |
| AUDI-0006 | AUDI-0003 | AUDI-0007 | 371 |
| AUDI-0007 | AUDI-0004 | AUDI-0003 | 509 |
| AUDI-0008 | AUDI-0004 | AUDI-0007 | 469 |

**t_audit_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0004 | node-b14 |
| AUDI-0002 | AUDI-0001 | AUDI-0005 | Log Level 02 |
| AUDI-0003 | AUDI-0001 | AUDI-0006 | execution |
| AUDI-0004 | AUDI-0001 | AUDI-0010 | running |
| AUDI-0005 | AUDI-0001 | AUDI-0011 | Triggered By 05 |
| AUDI-0006 | AUDI-0002 | AUDI-0004 | worker-07 |
| AUDI-0007 | AUDI-0002 | AUDI-0005 | Log Level 07 |
| AUDI-0008 | AUDI-0002 | AUDI-0006 | execution |

**t_ebpf_program_governed_by_directive**

| id | ebpf |
| --- | --- |
| DIRE-0001 | tracepoint_sched |
| DIRE-0002 | xdp_fwd |
| DIRE-0003 | tc_egress |
| DIRE-0004 | xdp_fwd |
| DIRE-0005 | tracepoint_sched |
| DIRE-0006 | tc_egress |

**t_ebpf_program_governed_by_directive_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| DIRE-0001 | effective_date | xsd:date |
| DIRE-0002 | enforcement | xsd:string |
| DIRE-0003 | mandatory | xsd:boolean |
| DIRE-0004 | priority | xsd:integer |
| DIRE-0005 | review_cycle_days | xsd:integer |
| DIRE-0006 | scope | xsd:string |
| DIRE-0007 | encoding | xsd:string |
| DIRE-0008 | label_text | xsd:string |

**t_ebpf_program_governed_by_directive_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0003 | false |
| DIRE-0002 | DIRE-0002 | DIRE-0003 | true |
| DIRE-0003 | DIRE-0003 | DIRE-0003 | true |
| DIRE-0004 | DIRE-0004 | DIRE-0003 | true |
| DIRE-0005 | DIRE-0005 | DIRE-0003 | false |
| DIRE-0006 | DIRE-0006 | DIRE-0003 | false |

**t_ebpf_program_governed_by_directive_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0001 | 2024-06-04 |
| DIRE-0002 | DIRE-0002 | DIRE-0001 | 2025-03-23 |
| DIRE-0003 | DIRE-0003 | DIRE-0001 | 2025-01-20 |
| DIRE-0004 | DIRE-0004 | DIRE-0001 | 2024-06-12 |
| DIRE-0005 | DIRE-0005 | DIRE-0001 | 2025-03-15 |
| DIRE-0006 | DIRE-0006 | DIRE-0001 | 2024-12-23 |

**t_ebpf_program_governed_by_directive_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0004 | 5 |
| DIRE-0002 | DIRE-0001 | DIRE-0005 | 280 |
| DIRE-0003 | DIRE-0002 | DIRE-0004 | 3 |
| DIRE-0004 | DIRE-0002 | DIRE-0005 | 996 |
| DIRE-0005 | DIRE-0003 | DIRE-0004 | 5 |
| DIRE-0006 | DIRE-0003 | DIRE-0005 | 471 |
| DIRE-0007 | DIRE-0004 | DIRE-0004 | 1 |
| DIRE-0008 | DIRE-0004 | DIRE-0005 | 105 |

**t_ebpf_program_governed_by_directive_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0007 | Encoding 01 |
| DIRE-0002 | DIRE-0001 | DIRE-0002 | Enforcement 02 |
| DIRE-0003 | DIRE-0001 | DIRE-0008 | audit excerpt |
| DIRE-0004 | DIRE-0001 | DIRE-0009 | en |
| DIRE-0005 | DIRE-0001 | DIRE-0006 | Scope 05 |
| DIRE-0006 | DIRE-0002 | DIRE-0007 | Encoding 06 |
| DIRE-0007 | DIRE-0002 | DIRE-0002 | Enforcement 07 |
| DIRE-0008 | DIRE-0002 | DIRE-0008 | audit excerpt |

Attributes are defined independently of any single entity, establishing a schema of permissible properties before any value is assigned. The attribute definition tables enumerate attr_name and attr_type pairs, where attr_name conveys the semantic intent—effective_date, enforcement, mandatory, priority, duration_seconds, exit_code, host_name—and attr_type constrains the value domain to an XSD type such as xsd:date, xsd:string, xsd:boolean, xsd:integer, xsd:decimal, or xsd:dateTime. This decoupling means that the attribute definition for mandatory (xsd:boolean) exists as a single row and can be referenced by any number of entities that carry that property. The type declaration is not merely documentation; it governs which value table receives the data and enforces type safety at the schema level. An attribute typed as xsd:date will never appear in the integer value table, and an xsd:boolean attribute is routed exclusively to the boolean value table, creating a compile-time guarantee that the value store and the attribute definition remain consistent.

The value tables implement a type-disaggregated entity-attribute-value pattern, where each XSD type has its own dedicated table. Within each value table, the composite key of entity_id and attr_id forms a foreign-key pair that references the entity identifier and the attribute identifier respectively, while the value column—labeled misc in the schema—holds the actual data. For boolean attributes, the value column stores literals such as false and true; the mandatory attribute (attr_id REQU-0003) evaluates to true for entity REQU-0003 but false for REQU-0001, REQU-0002, and REQU-0004, a distribution that can be queried without type coercion. Date attributes resolve to ISO 8601 strings like 2023-08-06 and 2025-05-18 in the date value table, while datetime attributes carry full timestamps including time and offset, as in 2023-11-27T16:16:19 and 2024-07-11T22:06:19. Integer values range from small priorities such as 3 and 4 to large counters like 132 and 996, and decimal values capture fractional durations including 6622.09 and 3520.06 seconds. String values encompass coded labels such as Encoding 01 and Enforcement 02, free-form text like nightly summary and audit excerpt, and locale indicators such as ja and en.

**t_audit_subclass_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0002 | 2023-11-27T16:16:19 |
| AUDI-0002 | AUDI-0001 | AUDI-0008 | 2024-01-27T14:20:44 |
| AUDI-0003 | AUDI-0001 | AUDI-0009 | 2024-07-11T22:06:19 |
| AUDI-0004 | AUDI-0002 | AUDI-0002 | 2023-02-20T00:46:50 |
| AUDI-0005 | AUDI-0002 | AUDI-0008 | 2024-05-24T19:51:15 |
| AUDI-0006 | AUDI-0002 | AUDI-0009 | 2024-12-09T14:14:21 |
| AUDI-0007 | AUDI-0003 | AUDI-0002 | 2024-03-22T08:33:34 |
| AUDI-0008 | AUDI-0003 | AUDI-0008 | 2024-07-04T21:25:06 |

**t_audit_subclass_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0001 | 6622.09 |
| AUDI-0002 | AUDI-0002 | AUDI-0001 | 3520.06 |
| AUDI-0003 | AUDI-0003 | AUDI-0001 | 6281.16 |
| AUDI-0004 | AUDI-0004 | AUDI-0001 | 5487.90 |
| AUDI-0005 | AUDI-0005 | AUDI-0001 | 1334.65 |
| AUDI-0006 | AUDI-0006 | AUDI-0001 | 3072.32 |

This architecture yields two practical advantages for compliance operations. First, the separation of attribute definition from attribute value allows a single entity to carry a heterogeneous set of properties without requiring a fixed row schema; the requirement REQU-0001, for instance, references attributes REQU-0001 through REQU-0009 across five different value tables, each contributing a distinct typed property. Second, the foreign-key chain from value table through entity_id to the base entity table and through attr_id to the attribute definition table provides a complete audit trail: any stored value can be traced back to its entity, its attribute name, and its declared type in a single join. The entity_id column in the value tables is the linchpin of this traceability, and its role as a foreign key ensures that orphaned values—values referencing an entity or attribute that no longer exists—are impossible under referential integrity constraints.