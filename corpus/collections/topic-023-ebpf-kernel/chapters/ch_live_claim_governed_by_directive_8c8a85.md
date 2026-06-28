---
chapter_id: ch_live_claim_governed_by_directive_8c8a85
topic_id: 23
family: 06_belief_structure
cited_terms: ['claim_governed_by_directive', 'ebpf_program_governed_by_directive', 'column_value_distribution']
model: engine-refine
---

In governance architectures that bind policy directives to technical enforcement mechanisms, the identifier serves as the immutable anchor for every proposition and its associated metadata. Directives such as DIRE-0001 through DIRE-0004 carry claims—"Mercury threshold exceeded," "Access policy enforced," "Latency within bounds"—and are simultaneously mapped to eBPF programs including tracepoint_sched, xdp_fwd, and tc_egress, each distinguished by a stable identifier that survives schema evolution and cross-referencing. The entity, by contrast, denotes the concrete instantiation to which attributes are affixed; in the claim-governed-by-directive facet, entity identifiers such as DIRE-0001 and DIRE-0002 appear repeatedly as the subject of attribute-value bindings, while in the column-value-distribution facet, entities like DIST-0007 and DIST-0003 are linked to distribution profiles through a separate relationship layer. An identifier is a key; an entity is a referent. The distinction matters because the same identifier may function as a primary key in one table and as a foreign key in another, and conflating the two obscures the provenance of attribute bindings.

**t_claim_governed_by_directive**

| id | claim |
| --- | --- |
| DIRE-0001 | Mercury threshold exceeded |
| DIRE-0002 | Access policy enforced |
| DIRE-0003 | Latency within bounds |
| DIRE-0004 | Mercury threshold exceeded |
| DIRE-0005 | Emission limits met |
| DIRE-0006 | Certificate chain valid |
| DIRE-0007 | Sampling frequency adequate |
| DIRE-0008 | Sensor calibration valid |

**t_claim_governed_by_directive_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| DIRE-0001 | confidence | xsd:decimal |
| DIRE-0002 | dimension_kind | xsd:string |
| DIRE-0003 | method | xsd:string |
| DIRE-0004 | recorded_at | xsd:dateTime |
| DIRE-0005 | uncertainty | xsd:decimal |
| DIRE-0006 | unit | xsd:string |
| DIRE-0007 | value | xsd:decimal |
| DIRE-0008 | encoding | xsd:string |

**t_claim_governed_by_directive_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0004 | 2025-05-26T03:20:10 |
| DIRE-0002 | DIRE-0002 | DIRE-0004 | 2024-09-09T11:00:31 |
| DIRE-0003 | DIRE-0003 | DIRE-0004 | 2023-10-05T17:19:44 |
| DIRE-0004 | DIRE-0004 | DIRE-0004 | 2023-08-28T07:17:18 |
| DIRE-0005 | DIRE-0005 | DIRE-0004 | 2023-09-24T23:34:03 |
| DIRE-0006 | DIRE-0006 | DIRE-0004 | 2025-02-15T08:57:16 |
| DIRE-0007 | DIRE-0007 | DIRE-0004 | 2025-03-19T03:02:46 |
| DIRE-0008 | DIRE-0008 | DIRE-0004 | 2023-07-28T10:43:49 |

**t_claim_governed_by_directive_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0001 | 0.133 |
| DIRE-0002 | DIRE-0001 | DIRE-0005 | 628.22 |
| DIRE-0003 | DIRE-0001 | DIRE-0007 | 405.89 |
| DIRE-0004 | DIRE-0002 | DIRE-0001 | 0.222 |
| DIRE-0005 | DIRE-0002 | DIRE-0005 | 369.68 |
| DIRE-0006 | DIRE-0002 | DIRE-0007 | 150.76 |
| DIRE-0007 | DIRE-0003 | DIRE-0001 | 0.686 |
| DIRE-0008 | DIRE-0003 | DIRE-0005 | 548.91 |

**t_claim_governed_by_directive_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0002 | Dimension Kind 01 |
| DIRE-0002 | DIRE-0001 | DIRE-0008 | Encoding 02 |
| DIRE-0003 | DIRE-0001 | DIRE-0009 | audit excerpt |
| DIRE-0004 | DIRE-0001 | DIRE-0010 | en |
| DIRE-0005 | DIRE-0001 | DIRE-0003 | manual |
| DIRE-0006 | DIRE-0001 | DIRE-0006 | mg/L |
| DIRE-0007 | DIRE-0002 | DIRE-0002 | Dimension Kind 07 |
| DIRE-0008 | DIRE-0002 | DIRE-0008 | Encoding 08 |

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

**t_column_value_distribution**

| id | column |
| --- | --- |
| DIST-0001 | request_count |
| DIST-0002 | patient_bmi |
| DIST-0003 | device_serial |
| DIST-0004 | request_count |
| DIST-0005 | sensor_temperature |
| DIST-0006 | sensor_temperature |
| DIST-0007 | device_serial |

**t_column_value_distribution_value_distribution**

| id | value_distribution |
| --- | --- |
| DIST-0001 | pareto_shape |
| DIST-0002 | binomial_profile |
| DIST-0003 | uniform_range |
| DIST-0004 | poisson_profile |
| DIST-0005 | bernoulli_curve |
| DIST-0006 | binomial_profile |
| DIST-0007 | uniform_range |
| DIST-0008 | uniform_range |

An attribute—abbreviated attr in the schema—captures a named property of an entity, and its attr type constrains the domain of permissible values to a precise XML Schema datatype. The claim facet declares attributes such as confidence (xsd:decimal), dimension_kind (xsd:string), method (xsd:string), and recorded_at (xsd:dateTime), while the eBPF facet defines effective_date (xsd:date), enforcement (xsd:string), mandatory (xsd:boolean), and priority (xsd:integer). This type discipline is not decorative: it governs how values are stored, validated, and queried across a family of value tables that partition by type. Decimal values like 0.133, 628.22, and 405.89 reside in the decimal value table; boolean flags such as false and true populate the boolean table; integer priorities including 5, 280, 3, and 996 occupy the integer table; and temporal values—2025-05-26T03:20:10, 2024-09-09T11:00:31, 2023-10-05T17:19:44, 2023-08-28T07:17:18—fill the datetime table. The misc column in each value table is the carrier for these typed payloads, and its name signals that the column's semantic content is determined entirely by the attr type of the referenced attribute, not by the column itself.

The entity–attr–value triad forms the core storage pattern. Each value row carries an entity_id that identifies the entity being described, an attr_id that identifies the attribute whose value is being recorded, and the value itself drawn from the misc column. In the claim facet, entity DIRE-0001 accumulates multiple attribute bindings: a decimal confidence of 0.133, a string dimension_kind of "Dimension Kind 01," an audit excerpt, and a recorded_at timestamp of 2025-05-26T03:20:10. In the eBPF facet, entity DIRE-0001 binds an effective_date of 2024-06-04, an enforcement string of "Enforcement 02," a mandatory flag of false, and a priority of 5. The same entity may appear across multiple value tables because each table is partitioned by attr type, and a single entity can possess attributes of different types. This normalization avoids sparse columns and enforces type safety at the storage layer, at the cost of requiring joins across value tables to reconstruct a complete attribute profile.

Relationships between entities are expressed through the subject–target–role triad, which appears in the column-value-distribution linkage table. Here, the subject (column_id) references a column entity such as DIST-0007 or DIST-0003, the target (value_distribution_id) references a distribution entity such as DIST-0006, DIST-0002, or DIST-0001, and the role—contributor or reviewer—describes the nature of the association. A single subject may relate to multiple targets under different roles: DIST-0007 appears as a contributor to DIST-0006, DIST-0001, and DIST-0007 itself, while DIST-0003 serves as a reviewer of DIST-0002. The distribution entities themselves are catalogued in a separate table where columns like request_count, patient_bmi, and device_serial are associated with distribution profiles including pareto_shape, binomial_profile, uniform_range, and poisson_profile. The role column is the semantic glue that distinguishes, for example, a column that contributes data to a distribution from one that merely reviews it, enabling fine-grained provenance tracking without proliferating relationship tables.

**t_column_value_distribution__value_distribution**

| id | column_id | value_distribution_id | role |
| --- | --- | --- | --- |
| DIST-0001 | DIST-0007 | DIST-0006 | contributor |
| DIST-0002 | DIST-0003 | DIST-0002 | reviewer |
| DIST-0003 | DIST-0007 | DIST-0006 | contributor |
| DIST-0004 | DIST-0007 | DIST-0001 | contributor |
| DIST-0005 | DIST-0002 | DIST-0007 | contributor |
| DIST-0006 | DIST-0007 | DIST-0002 | owner |
| DIST-0007 | DIST-0004 | DIST-0001 | reviewer |
| DIST-0008 | DIST-0002 | DIST-0003 | contributor |

Together, these constructs—identifier, entity, attr, attr type, misc, subject, target, role—form a minimal but expressive vocabulary for encoding governance metadata. The identifier provides referential stability; the entity provides the thing being described; the attr and its type provide the property and its constraint; the misc column provides the value carrier; and the subject–target–role triad provides the relationship semantics. In practice, a directive like DIRE-0001 governs both a claim ("Mercury threshold exceeded") and an eBPF program (tracepoint_sched), and its attributes—confidence, dimension_kind, recorded_at, effective_date, enforcement, mandatory, priority—are distributed across six value tables, each typed and each linked back to the directive through entity_id and attr_id. The governance framework does not require a monolithic table; it requires that every value be traceable to an entity, an attribute, and a type, and that every relationship be annotated with a role. This design supports auditability, type safety, and schema extensibility without sacrificing the ability to reconstruct a complete picture of any entity's attributes and relationships through well-defined joins.

**t_ebpf_program_governed_by_directive_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0001 | 2024-06-04 |
| DIRE-0002 | DIRE-0002 | DIRE-0001 | 2025-03-23 |
| DIRE-0003 | DIRE-0003 | DIRE-0001 | 2025-01-20 |
| DIRE-0004 | DIRE-0004 | DIRE-0001 | 2024-06-12 |
| DIRE-0005 | DIRE-0005 | DIRE-0001 | 2025-03-15 |
| DIRE-0006 | DIRE-0006 | DIRE-0001 | 2024-12-23 |