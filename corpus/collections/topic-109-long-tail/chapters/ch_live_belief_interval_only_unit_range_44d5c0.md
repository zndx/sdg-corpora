---
chapter_id: ch_live_belief_interval_only_unit_range_44d5c0
topic_id: 109
family: 06_belief_structure
cited_terms: ['belief_interval_only_unit_range', 'belief_interval_subclass', 'belief_interval_with_upper_bound']
model: engine-refine
---

A belief interval is identified by a scoped alphanumeric key—`RANG-0001`, `INTE-0001`, `BOUN-0001`—that serves as the immutable anchor for every attribute, value, and relationship attached to that interval. The identifier is not merely a row handle; it is the join key that threads the entire model together, appearing as the primary key in the core belief table and as the foreign key `entity_id` in every value table. An entity, in this schema, is precisely that: a belief interval record brought into the attribute-value dimension by virtue of its identifier being referenced. The entity `RANG-0001`, for instance, carries a confidence value of `0.727` and a dimension kind of `Dimension Kind 01`, while the entity `BOUN-0001` holds a confidence of `0.680` and the same dimension kind, demonstrating that multiple entities can share attribute values without implying identity.

**t_belief_interval_only_unit_range_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RANG-0001 | RANG-0001 | RANG-0004 | 2025-06-14T16:53:04 |
| RANG-0002 | RANG-0002 | RANG-0004 | 2023-08-16T07:36:41 |
| RANG-0003 | RANG-0003 | RANG-0004 | 2023-03-26T19:32:25 |
| RANG-0004 | RANG-0004 | RANG-0004 | 2025-03-17T08:26:16 |
| RANG-0005 | RANG-0005 | RANG-0004 | 2025-04-30T01:20:27 |
| RANG-0006 | RANG-0006 | RANG-0004 | 2023-02-14T23:11:05 |

**t_belief_interval_only_unit_range_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RANG-0001 | RANG-0001 | RANG-0001 | 0.727 |
| RANG-0002 | RANG-0001 | RANG-0005 | 281.42 |
| RANG-0003 | RANG-0001 | RANG-0007 | 343.70 |
| RANG-0004 | RANG-0002 | RANG-0001 | 0.788 |
| RANG-0005 | RANG-0002 | RANG-0005 | 676.76 |
| RANG-0006 | RANG-0002 | RANG-0007 | 95.73 |
| RANG-0007 | RANG-0003 | RANG-0001 | 0.294 |
| RANG-0008 | RANG-0003 | RANG-0005 | 403.37 |

**t_belief_interval_only_unit_range_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RANG-0001 | RANG-0001 | RANG-0002 | Dimension Kind 01 |
| RANG-0002 | RANG-0001 | RANG-0008 | Encoding 02 |
| RANG-0003 | RANG-0001 | RANG-0009 | change rationale |
| RANG-0004 | RANG-0001 | RANG-0010 | fr |
| RANG-0005 | RANG-0001 | RANG-0003 | hybrid |
| RANG-0006 | RANG-0001 | RANG-0006 | ms |
| RANG-0007 | RANG-0002 | RANG-0002 | Dimension Kind 07 |
| RANG-0008 | RANG-0002 | RANG-0008 | Encoding 08 |

**t_belief_interval_subclass**

| id | belief |
| --- | --- |
| INTE-0001 | Batch ingestion failure |
| INTE-0002 | integrity guarantee |
| INTE-0003 | Network latency spike |
| INTE-0004 | Network latency spike |
| INTE-0005 | Thermal runaway risk |
| INTE-0006 | latency threshold |

Attributes are declared by name and type in a dedicated registry. The attribute `confidence` is typed as `xsd:decimal`, `dimension_kind` and `method` as `xsd:string`, and `recorded_at` as `xsd:dateTime`. This separation of attribute metadata from attribute values is deliberate: it allows the value store to remain a flat, type-specific fact table rather than a heterogeneous blob. Decimal values such as `0.788`, `281.42`, and `343.70` live in the decimal value table; string values such as `Encoding 02`, `change rationale`, and `fr` in the varchar table; and timestamp values such as `2025-06-14T16:53:04` and `2023-08-16T07:36:41` in the datetime table. Each value row is linked to its entity and its attribute by two foreign keys, `entity_id` and `attr_id`, forming a classic entity-attribute-value (EAV) spine that is type-partitioned for query efficiency.

The `misc` column is the value carrier in these type-specific tables. It holds the actual data—numbers, strings, or dates—depending on the table it inhabits. A decimal row with `id` `RANG-0001` and `entity_id` `RANG-0001` stores `0.727` in `misc`; a varchar row with the same `id` and `entity_id` stores `Dimension Kind 01`. The column name `misc` signals that the schema treats values as a heterogeneous collection, partitioned externally by type rather than by a single generic column. This design avoids the pitfalls of storing everything as text while preserving the flexibility of an EAV model.

Subject and target are the terms used for the two ends of a binary relationship between belief intervals. In the relationship table, `belief_id` is the subject and `belief_lower_bound_id` is the target, and the pair is mediated by a `role` that describes the nature of the link. The role `owner` indicates that the subject belief interval owns or is governed by the target lower bound; the role `contributor` indicates that the subject contributes to the target. The relationship record `INTE-0001` connects subject `INTE-0004` to target `INTE-0008` as a `contributor`, while record `INTE-0003` connects subject `INTE-0001` to target `INTE-0002` as a `contributor` as well. These relationships are themselves identified by their own keys (`INTE-0001` through `INTE-0004`), making them first-class entities that can be queried, filtered, and audited independently of the beliefs they connect.

The practical effect of this architecture is that every belief interval—whether it carries a `belief` value of `Checksum validation fail`, `Network latency spike`, or `Grid frequency stability`—is decomposed into a set of typed attributes, each with its own value, and potentially linked to other intervals through subject-target relationships. The lower bounds and upper bounds that define the interval's confidence range are themselves belief intervals with their own identifiers, attributes, and relationships, creating a recursive structure where bounds are both values and entities. A belief such as `Network latency spike` appears across multiple interval types (`RANG-0002`, `INTE-0003`, `INTE-0004`, `BOUN-0003`), each with its own bounds, attributes, and relationship roles, illustrating that the same semantic concept can be instantiated in multiple analytical contexts without conflating them.

**t_belief_interval_only_unit_range**

| id | belief | belief_lower_bound |
| --- | --- | --- |
| RANG-0001 | Checksum validation fail | 0.89 certainty bound |
| RANG-0002 | Network latency spike | 0.91 confidence baseline |
| RANG-0003 | latency threshold | Forty eight hours |
| RANG-0004 | packet loss guarantee | 128 megabytes |
| RANG-0005 | integrity guarantee | Forty eight hours |
| RANG-0006 | Storage quota warning | Critical threshold |

**t_belief_interval_only_unit_range_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| RANG-0001 | confidence | xsd:decimal |
| RANG-0002 | dimension_kind | xsd:string |
| RANG-0003 | method | xsd:string |
| RANG-0004 | recorded_at | xsd:dateTime |
| RANG-0005 | uncertainty | xsd:decimal |
| RANG-0006 | unit | xsd:string |
| RANG-0007 | value | xsd:decimal |
| RANG-0008 | encoding | xsd:string |

**t_belief_interval_subclass_belief_lower_bound**

| id | belief_lower_bound |
| --- | --- |
| INTE-0001 | Three sigma limit |
| INTE-0002 | 95 percent threshold |
| INTE-0003 | 0.80 reliability floor |
| INTE-0004 | Alpha level 0.05 |
| INTE-0005 | Extreme outlier bound |
| INTE-0006 | 0.72 confidence |
| INTE-0007 | 256 units |
| INTE-0008 | 99.9 percent uptime |

**t_belief_interval_subclass__belief_lower_bound**

| id | belief_id | belief_lower_bound_id | role |
| --- | --- | --- | --- |
| INTE-0001 | INTE-0004 | INTE-0008 | contributor |
| INTE-0002 | INTE-0005 | INTE-0006 | owner |
| INTE-0003 | INTE-0001 | INTE-0002 | contributor |
| INTE-0004 | INTE-0002 | INTE-0008 | owner |
| INTE-0005 | INTE-0006 | INTE-0001 | contributor |
| INTE-0006 | INTE-0002 | INTE-0008 | reviewer |
| INTE-0007 | INTE-0001 | INTE-0006 | owner |
| INTE-0008 | INTE-0005 | INTE-0007 | contributor |

**t_belief_interval_with_upper_bound**

| id | belief | plausibility_upper_bound |
| --- | --- | --- |
| BOUN-0001 | Grid frequency stability | 0.89 certainty bound |
| BOUN-0002 | reliability bound | 95 pct threshold |
| BOUN-0003 | Network latency spike | 128 megabytes |
| BOUN-0004 | Storage quota warning | 0.72 confidence |
| BOUN-0005 | Data lineage break | 95 percent threshold |
| BOUN-0006 | Latency SLA breach | High severity tier |

**t_belief_interval_with_upper_bound_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| BOUN-0001 | confidence | xsd:decimal |
| BOUN-0002 | dimension_kind | xsd:string |
| BOUN-0003 | method | xsd:string |
| BOUN-0004 | recorded_at | xsd:dateTime |
| BOUN-0005 | uncertainty | xsd:decimal |
| BOUN-0006 | unit | xsd:string |
| BOUN-0007 | value | xsd:decimal |
| BOUN-0008 | encoding | xsd:string |

**t_belief_interval_with_upper_bound_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BOUN-0001 | BOUN-0001 | BOUN-0004 | 2024-12-10T20:43:33 |
| BOUN-0002 | BOUN-0002 | BOUN-0004 | 2024-02-10T17:59:05 |
| BOUN-0003 | BOUN-0003 | BOUN-0004 | 2024-06-16T13:27:28 |
| BOUN-0004 | BOUN-0004 | BOUN-0004 | 2025-04-06T06:40:08 |
| BOUN-0005 | BOUN-0005 | BOUN-0004 | 2025-03-13T22:14:49 |
| BOUN-0006 | BOUN-0006 | BOUN-0004 | 2024-01-19T21:51:57 |

**t_belief_interval_with_upper_bound_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BOUN-0001 | BOUN-0001 | BOUN-0001 | 0.680 |
| BOUN-0002 | BOUN-0001 | BOUN-0005 | 473.67 |
| BOUN-0003 | BOUN-0001 | BOUN-0007 | 703.38 |
| BOUN-0004 | BOUN-0002 | BOUN-0001 | 0.590 |
| BOUN-0005 | BOUN-0002 | BOUN-0005 | 382.46 |
| BOUN-0006 | BOUN-0002 | BOUN-0007 | 678.08 |
| BOUN-0007 | BOUN-0003 | BOUN-0001 | 0.348 |
| BOUN-0008 | BOUN-0003 | BOUN-0005 | 462.48 |

**t_belief_interval_with_upper_bound_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BOUN-0001 | BOUN-0001 | BOUN-0002 | Dimension Kind 01 |
| BOUN-0002 | BOUN-0001 | BOUN-0008 | Encoding 02 |
| BOUN-0003 | BOUN-0001 | BOUN-0009 | change rationale |
| BOUN-0004 | BOUN-0001 | BOUN-0010 | de |
| BOUN-0005 | BOUN-0001 | BOUN-0003 | automated |
| BOUN-0006 | BOUN-0001 | BOUN-0006 | m/s |
| BOUN-0007 | BOUN-0002 | BOUN-0002 | Dimension Kind 07 |
| BOUN-0008 | BOUN-0002 | BOUN-0008 | Encoding 08 |