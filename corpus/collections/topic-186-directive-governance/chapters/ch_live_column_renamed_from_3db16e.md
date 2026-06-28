---
chapter_id: ch_live_column_renamed_from_3db16e
topic_id: 186
family: 07_long_tail
cited_terms: ['column_renamed_from', 'campus_event_participation', 'constraint_min_one_check']
model: engine-refine
---

Data lineage and attribute governance form the backbone of any system that must track how information evolves over time. When column names change—such as `CHEC-0003` becoming `node_cpu_load`, or `CHEC-0004` becoming `measurement_timestamp`—the system records each rename through a stable identifier like `FROM-0001` or `FROM-0002`, preserving the original name in the `renamed_from` field. This audit trail ensures that downstream consumers can always trace a current column back to its predecessor, which is critical when schemas shift across releases. Each renamed column is associated with an attribute definition that carries a formal type: `confidence` is typed as `xsd:decimal`, `dimension_kind` as `xsd:string`, `method` as `xsd:string`, and `recorded_at` as `xsd:dateTime`. These type declarations are not cosmetic; they govern how values are stored, validated, and queried across the system.

**t_column_renamed_from**

| id | column | renamed_from |
| --- | --- | --- |
| FROM-0001 | node_cpu_load | CHEC-0003 |
| FROM-0002 | measurement_timestamp | CHEC-0004 |
| FROM-0003 | config_version | CHEC-0006 |
| FROM-0004 | batch_run_id | CHEC-0001 |
| FROM-0005 | event_type | CHEC-0001 |
| FROM-0006 | patient_bmi | CHEC-0002 |

**t_column_renamed_from_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| FROM-0001 | confidence | xsd:decimal |
| FROM-0002 | dimension_kind | xsd:string |
| FROM-0003 | method | xsd:string |
| FROM-0004 | recorded_at | xsd:dateTime |
| FROM-0005 | uncertainty | xsd:decimal |
| FROM-0006 | unit | xsd:string |
| FROM-0007 | value | xsd:decimal |
| FROM-0008 | encoding | xsd:string |

**t_column_renamed_from_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FROM-0001 | FROM-0001 | FROM-0004 | 2025-03-21T00:09:12 |
| FROM-0002 | FROM-0002 | FROM-0004 | 2023-10-22T03:45:48 |
| FROM-0003 | FROM-0003 | FROM-0004 | 2023-09-09T06:02:35 |
| FROM-0004 | FROM-0004 | FROM-0004 | 2024-12-05T07:04:23 |
| FROM-0005 | FROM-0005 | FROM-0004 | 2023-10-09T20:16:15 |
| FROM-0006 | FROM-0006 | FROM-0004 | 2024-04-24T12:53:41 |

**t_column_renamed_from_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FROM-0001 | FROM-0001 | FROM-0001 | 0.429 |
| FROM-0002 | FROM-0001 | FROM-0005 | 695.20 |
| FROM-0003 | FROM-0001 | FROM-0007 | 442.17 |
| FROM-0004 | FROM-0002 | FROM-0001 | 0.690 |
| FROM-0005 | FROM-0002 | FROM-0005 | 345.70 |
| FROM-0006 | FROM-0002 | FROM-0007 | 542.71 |
| FROM-0007 | FROM-0003 | FROM-0001 | 0.828 |
| FROM-0008 | FROM-0003 | FROM-0005 | 957.60 |

**t_column_renamed_from_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FROM-0001 | FROM-0001 | FROM-0002 | Dimension Kind 01 |
| FROM-0002 | FROM-0001 | FROM-0008 | Encoding 02 |
| FROM-0003 | FROM-0001 | FROM-0009 | audit excerpt |
| FROM-0004 | FROM-0001 | FROM-0010 | fr |
| FROM-0005 | FROM-0001 | FROM-0003 | manual |
| FROM-0006 | FROM-0001 | FROM-0006 | deg_C |
| FROM-0007 | FROM-0002 | FROM-0002 | Dimension Kind 07 |
| FROM-0008 | FROM-0002 | FROM-0008 | Encoding 08 |

Attribute values are materialized in separate value tables keyed by type, each linking an entity to an attribute through foreign keys on `entity_id` and `attr_id`. Decimal attributes—such as a `confidence` score of `0.429` or a measurement of `695.20`—reside in the decimal value table, while string attributes like `Dimension Kind 01`, `Encoding 02`, `audit excerpt`, and the language code `fr` are stored in the varchar table. Temporal attributes such as `recorded_at` hold ISO 8601 timestamps like `2025-03-21T00:09:12` or `2023-10-22T03:45:48` in the datetime table. This type-disaggregated storage pattern avoids the pitfalls of a single wide value column and lets the database engine enforce type constraints at the storage layer. The same entity, identified by `entity_id` values like `FROM-0001` or `FROM-0002`, can carry multiple attributes across these tables, building a rich, typed property bag per entity.

Governance constraints sit atop this attribute-value fabric, enforcing rules that protect data quality and compliance. A constraint such as `Unique Index`, `Latency Limit`, `Primary Key Rule`, or `Range Validation` is assigned an `effective_date`—for example, `2023-05-21` or `2025-03-18`—and a `scope` that determines its reach: `team`, `local`, or `regional`. Each constraint references one or more checks through foreign keys into the attribute-value infrastructure, meaning the validation logic operates directly on the stored attribute data. The scope dimension is particularly important: a `team`-scoped constraint applies within a single organizational unit, while a `regional` constraint spans broader boundaries, and a `local` constraint is confined to a specific dataset or pipeline. Effective dating ensures that constraints can be retired, updated, or rolled forward without breaking historical queries.

**t_constraint_min_one_check**

| id | constraint | checks | effective_date | scope |
| --- | --- | --- | --- | --- |
| CHEC-0001 | Unique Index | FROM-0004 | 2023-05-21 | team |
| CHEC-0002 | Latency Limit | FROM-0002 | 2023-05-17 | team |
| CHEC-0003 | Primary Key Rule | FROM-0003 | 2025-03-18 | local |
| CHEC-0004 | Range Validation | FROM-0001 | 2023-05-11 | regional |
| CHEC-0005 | Referential Integrity | FROM-0002 | 2023-08-12 | regional |
| CHEC-0006 | Format Check | FROM-0006 | 2024-01-08 | global |

Event participation introduces a parallel modeling layer that tracks how groups engage with campus activities. Events such as `Winter Poetry Slam`, `Fall Welcome Week`, and `Astronomy Night` are recorded in a participation table, each linked to a participant group like `Alumni Network Chapter`, `Undergraduate STEM Majors`, or `Graduate Student Association`. The relationship between an event and a participant group is mediated by a junction table that assigns a `role`—`contributor`, `observer`, or `owner`—to each pairing. This role-based association allows the system to distinguish between groups that actively shape an event and those that merely attend, supporting both reporting and access-control decisions. The same participant group, such as `Undergraduate STEM Majors`, can appear in multiple event participations with different roles, reflecting the fluid nature of community engagement.

**t_campus_event_participation**

| id | campus_event |
| --- | --- |
| PART-0001 | Winter Poetry Slam |
| PART-0002 | Fall Welcome Week |
| PART-0003 | Astronomy Night |
| PART-0004 | Winter Poetry Slam |
| PART-0005 | Student Government Election |
| PART-0006 | Summer Internship Fair |

**t_campus_event_participation_has_participant**

| id | has_participant |
| --- | --- |
| PART-0001 | Alumni Network Chapter |
| PART-0002 | Undergraduate STEM Majors |
| PART-0003 | Graduate Student Association |
| PART-0004 | Undergraduate STEM Majors |
| PART-0005 | Campus Sustainability Volunteers |
| PART-0006 | Campus Sustainability Volunteers |
| PART-0007 | First-Year Resident Advisors |

**t_campus_event_participation__has_participant**

| id | campus_id | has_participant_id | role |
| --- | --- | --- | --- |
| PART-0001 | PART-0003 | PART-0004 | contributor |
| PART-0002 | PART-0005 | PART-0003 | observer |
| PART-0003 | PART-0002 | PART-0006 | observer |
| PART-0004 | PART-0006 | PART-0001 | owner |
| PART-0005 | PART-0003 | PART-0004 | observer |
| PART-0006 | PART-0004 | PART-0005 | reviewer |
| PART-0007 | PART-0002 | PART-0003 | owner |
| PART-0008 | PART-0004 | PART-0002 | observer |