---
chapter_id: ch_live_span_within_trace_fa010b
topic_id: 149
family: 02_observation_measurement
cited_terms: ['span_within_trace', 'belief_interval_basic', 'primary_key_designation']
model: engine-refine
---

In distributed tracing and belief-interval frameworks, every observable unit of work or assessment is anchored by a unique identifier—a stable, human-readable token such as `TRAC-0001` or `INTE-0001` that serves as the primary key for the entity. An entity represents a discrete record: a trace span like `lambda-process-image` or `http-get-users`, a belief statement such as "Model confidence elevated" or "Data integrity compromised," or a primary-key designation like `hardware_sn` and `lab_specimens`. The identifier is the immutable handle by which the entity is referenced across the system; it never changes, and every relationship, attribute assignment, and value binding routes back to it.

**t_span_within_trace**

| id | span |
| --- | --- |
| TRAC-0001 | lambda-process-image |
| TRAC-0002 | http-get-users |
| TRAC-0003 | http-get-users |
| TRAC-0004 | auth-validate-token |
| TRAC-0005 | kafka-produce-metrics |
| TRAC-0006 | http-get-users |
| TRAC-0007 | batch-ingest-logs |
| TRAC-0008 | cache-lookup-session |

**t_span_within_trace_part_of**

| id | part_of |
| --- | --- |
| TRAC-0001 | data-ingest-job |
| TRAC-0002 | auth-flow |
| TRAC-0003 | checkout-session |
| TRAC-0004 | api-request |
| TRAC-0005 | payment-route |
| TRAC-0006 | auth-flow |

**t_belief_interval_basic**

| id | belief |
| --- | --- |
| INTE-0001 | Model confidence elevated |
| INTE-0002 | Data integrity compromised |
| INTE-0003 | Sensor drift confirmed |
| INTE-0004 | Risk threshold exceeded |
| INTE-0005 | Model confidence elevated |
| INTE-0006 | Inference reliability moderate |

**t_primary_key_designation**

| id | primary | primary_key_of |
| --- | --- | --- |
| DESI-0001 | hardware_sn | INTE-0005 |
| DESI-0002 | lab_specimens | INTE-0005 |
| DESI-0003 | manufacturing_batches | INTE-0006 |
| DESI-0004 | asset_inventory | INTE-0004 |
| DESI-0005 | network_traffic_db | INTE-0001 |
| DESI-0006 | manufacturing_batches | INTE-0005 |

Attributes describe the properties of an entity, and each attribute carries a name and a type. Attribute names such as `confidence`, `dimension_kind`, `method`, and `recorded_at` define what dimension of the entity is being measured or described. The attribute type—expressed in XML Schema Datatypes like `xsd:decimal`, `xsd:string`, and `xsd:dateTime`—constrains the shape of the value that may be assigned. This separation of attribute metadata from attribute values is a deliberate normalization strategy: the attribute definition table declares what can be measured and in what format, while the value tables store the actual observations. For instance, the attribute `confidence` is typed as `xsd:decimal`, and its assigned values appear as `0.436` or `0.913`; the attribute `recorded_at` is typed as `xsd:dateTime`, and its values are ISO 8601 timestamps such as `2024-02-01T15:25:49` or `2023-01-18T17:21:37`.

The misc column is the generic value container where the actual data lives, typed according to the attribute's declared type. Because relational databases do not support polymorphic columns, the system distributes values across three specialized tables: `t_belief_interval_basic_val_decimal` for numeric measurements like `621.02` or `821.31`, `t_belief_interval_basic_val_varchar` for free-text descriptors such as `Dimension Kind 01`, `Encoding 02`, `intake form`, and `es`, and `t_belief_interval_basic_val_datetime` for temporal stamps. Each misc row is bound to an entity through the entity_id foreign key and to an attribute through the attr_id foreign key, forming a clean entity–attribute–value triad. The same pattern repeats for primary-key designations, where values like `0.354`, `612.82`, `audit excerpt`, and `de` are stored alongside their corresponding entity and attribute references.

**t_belief_interval_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| INTE-0001 | confidence | xsd:decimal |
| INTE-0002 | dimension_kind | xsd:string |
| INTE-0003 | method | xsd:string |
| INTE-0004 | recorded_at | xsd:dateTime |
| INTE-0005 | uncertainty | xsd:decimal |
| INTE-0006 | unit | xsd:string |
| INTE-0007 | value | xsd:decimal |
| INTE-0008 | encoding | xsd:string |

**t_belief_interval_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INTE-0001 | INTE-0001 | INTE-0004 | 2024-02-01T15:25:49 |
| INTE-0002 | INTE-0002 | INTE-0004 | 2023-01-18T17:21:37 |
| INTE-0003 | INTE-0003 | INTE-0004 | 2023-02-06T04:43:18 |
| INTE-0004 | INTE-0004 | INTE-0004 | 2024-05-21T20:07:12 |
| INTE-0005 | INTE-0005 | INTE-0004 | 2023-06-22T00:22:40 |
| INTE-0006 | INTE-0006 | INTE-0004 | 2023-05-13T22:41:07 |

**t_belief_interval_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INTE-0001 | INTE-0001 | INTE-0001 | 0.436 |
| INTE-0002 | INTE-0001 | INTE-0005 | 621.02 |
| INTE-0003 | INTE-0001 | INTE-0007 | 821.31 |
| INTE-0004 | INTE-0002 | INTE-0001 | 0.913 |
| INTE-0005 | INTE-0002 | INTE-0005 | 437.48 |
| INTE-0006 | INTE-0002 | INTE-0007 | 190.62 |
| INTE-0007 | INTE-0003 | INTE-0001 | 0.640 |
| INTE-0008 | INTE-0003 | INTE-0005 | 909.96 |

**t_belief_interval_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INTE-0001 | INTE-0001 | INTE-0002 | Dimension Kind 01 |
| INTE-0002 | INTE-0001 | INTE-0008 | Encoding 02 |
| INTE-0003 | INTE-0001 | INTE-0009 | intake form |
| INTE-0004 | INTE-0001 | INTE-0010 | es |
| INTE-0005 | INTE-0001 | INTE-0003 | hybrid |
| INTE-0006 | INTE-0001 | INTE-0006 | mg/L |
| INTE-0007 | INTE-0002 | INTE-0002 | Dimension Kind 07 |
| INTE-0008 | INTE-0002 | INTE-0008 | Encoding 08 |

**t_primary_key_designation_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DESI-0001 | DESI-0001 | DESI-0004 | 2024-07-25T13:27:19 |
| DESI-0002 | DESI-0002 | DESI-0004 | 2024-03-16T21:31:41 |
| DESI-0003 | DESI-0003 | DESI-0004 | 2023-06-18T02:34:37 |
| DESI-0004 | DESI-0004 | DESI-0004 | 2023-02-27T13:30:12 |
| DESI-0005 | DESI-0005 | DESI-0004 | 2024-09-26T23:46:39 |
| DESI-0006 | DESI-0006 | DESI-0004 | 2024-08-10T21:30:38 |

**t_primary_key_designation_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DESI-0001 | DESI-0001 | DESI-0001 | 0.354 |
| DESI-0002 | DESI-0001 | DESI-0005 | 612.82 |
| DESI-0003 | DESI-0001 | DESI-0007 | 317.84 |
| DESI-0004 | DESI-0002 | DESI-0001 | 0.186 |
| DESI-0005 | DESI-0002 | DESI-0005 | 917.05 |
| DESI-0006 | DESI-0002 | DESI-0007 | 468.15 |
| DESI-0007 | DESI-0003 | DESI-0001 | 0.339 |
| DESI-0008 | DESI-0003 | DESI-0005 | 505.24 |

**t_primary_key_designation_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DESI-0001 | DESI-0001 | DESI-0002 | Dimension Kind 01 |
| DESI-0002 | DESI-0001 | DESI-0008 | Encoding 02 |
| DESI-0003 | DESI-0001 | DESI-0009 | audit excerpt |
| DESI-0004 | DESI-0001 | DESI-0010 | de |
| DESI-0005 | DESI-0001 | DESI-0003 | hybrid |
| DESI-0006 | DESI-0001 | DESI-0006 | mg/L |
| DESI-0007 | DESI-0002 | DESI-0002 | Dimension Kind 07 |
| DESI-0008 | DESI-0002 | DESI-0008 | Encoding 08 |

Relationships between entities are expressed through join tables that carry three structural columns: subject, target, and role. The subject identifies the entity that initiates or participates in the relationship—in the trace hierarchy, a span like `TRAC-0006` acting as the subject of a `part_of` relationship. The target identifies the entity that is the recipient or container of that relationship—such as `TRAC-0001` or `TRAC-0006` as the parent span. The role column qualifies the nature of the participation: a span may be a `contributor` to its parent trace, or an `observer` of it. This three-column pattern—subject, target, role—generalizes across the schema, enabling any entity to relate to any other entity in a typed, directional manner without hardcoding relationship semantics into the entity tables themselves.

**t_span_within_trace__part_of**

| id | span_id | part_of_id | role |
| --- | --- | --- | --- |
| TRAC-0001 | TRAC-0006 | TRAC-0006 | contributor |
| TRAC-0002 | TRAC-0007 | TRAC-0001 | contributor |
| TRAC-0003 | TRAC-0002 | TRAC-0006 | observer |
| TRAC-0004 | TRAC-0003 | TRAC-0006 | observer |
| TRAC-0005 | TRAC-0007 | TRAC-0003 | owner |
| TRAC-0006 | TRAC-0008 | TRAC-0006 | owner |
| TRAC-0007 | TRAC-0001 | TRAC-0006 | contributor |
| TRAC-0008 | TRAC-0007 | TRAC-0003 | owner |

The practical effect of this design is a system where identifiers provide stable anchors, entities carry typed attributes whose values are stored in a normalized, type-specific manner, and relationships between entities are expressed as first-class triples of subject, target, and role. A trace span identified as `TRAC-0002` with the operation `http-get-users` is a member of the parent span `auth-flow` in the role of `observer`; a belief interval identified as `INTE-0001` with the statement "Model confidence elevated" carries a confidence value of `0.436` and a recorded-at timestamp of `2024-02-01T15:25:49`; and a primary-key designation identified as `DESI-0001` for the key `hardware_sn` carries a confidence of `0.354` and a recorded-at timestamp of `2024-07-25T13:27:19`. The schema does not prescribe what these entities mean—it provides the structural vocabulary for any domain to express entities, their properties, and their relationships in a uniform, queryable form.

**t_primary_key_designation_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| DESI-0001 | confidence | xsd:decimal |
| DESI-0002 | dimension_kind | xsd:string |
| DESI-0003 | method | xsd:string |
| DESI-0004 | recorded_at | xsd:dateTime |
| DESI-0005 | uncertainty | xsd:decimal |
| DESI-0006 | unit | xsd:string |
| DESI-0007 | value | xsd:decimal |
| DESI-0008 | encoding | xsd:string |