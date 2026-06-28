---
chapter_id: ch_live_schemaorg_place_address_047871
topic_id: 100
family: 07_long_tail
cited_terms: ['schemaorg_place_address', 'trace_with_attributes', 'column_property_subclass']
model: engine-refine
---

Attributes, their types, and the entities they describe form the foundational vocabulary of a property-oriented data model, where every observable characteristic is decomposed into a named attribute, a declared type, and a concrete value bound to an entity. An attribute is a semantic label—`duration_seconds`, `end_time`, `exit_code`, `host_name` in the trace domain; `confidence`, `dimension_kind`, `method`, `recorded_at` in the column-property domain—that captures a dimension of interest independent of any single instance. Each attribute carries a type declaration drawn from the XSD namespace: `xsd:decimal` for numeric measures such as `1085.14` or `0.032`, `xsd:dateTime` for temporal markers like `2024-07-09T10:21:53` or `2023-02-03T11:52:35`, `xsd:integer` for whole-number codes such as `445` or `106`, and `xsd:string` for free-text descriptors including `gw-12`, `Log Level 02`, or `Dimension Kind 01`. The type system enforces value discipline at the schema level, ensuring that the misc column—where actual values reside—contains only data conforming to the attribute's declared cardinality and format.

Entities serve as the anchor points to which attributes and their values are bound. In the trace-with-attributes model, an entity is identified by a trace-level key such as `ATTR-0001` or `ATTR-0002`, and a single entity may carry multiple attribute bindings: `ATTR-0001`, for instance, is associated with `duration_seconds` (value `1085.14`), `end_time` (value `2024-07-09T10:21:53`), `exit_code` (value `445`), and `host_name` (value `gw-12`), each drawn from a distinct typed value table. In the column-property subclass model, entities are identified by property keys such as `PROP-0001` or `PROP-0002`, and each property entity similarly accumulates typed values across the decimal, datetime, and varchar value tables. The entity identifier thus functions as a foreign key that unifies otherwise fragmented value rows into a coherent attribute set, enabling queries that reconstruct the full property profile of any given entity.

**t_trace_with_attributes**

| id | trace |
| --- | --- |
| ATTR-0001 | batch-exec-094 |
| ATTR-0002 | session-gamma-9 |
| ATTR-0003 | gateway-span-55 |
| ATTR-0004 | telemetry-flow-alpha |
| ATTR-0005 | pipeline-run-412 |
| ATTR-0006 | api-call-trace-12 |

**t_trace_with_attributes_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ATTR-0001 | duration_seconds | xsd:decimal |
| ATTR-0002 | end_time | xsd:dateTime |
| ATTR-0003 | exit_code | xsd:integer |
| ATTR-0004 | host_name | xsd:string |
| ATTR-0005 | log_level | xsd:string |
| ATTR-0006 | phase | xsd:string |
| ATTR-0007 | retry_count | xsd:integer |
| ATTR-0008 | scheduled_at | xsd:dateTime |

**t_trace_with_attributes_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0002 | 2024-07-09T10:21:53 |
| ATTR-0002 | ATTR-0001 | ATTR-0008 | 2024-10-26T05:28:10 |
| ATTR-0003 | ATTR-0001 | ATTR-0009 | 2024-01-16T11:34:50 |
| ATTR-0004 | ATTR-0002 | ATTR-0002 | 2023-03-03T12:52:58 |
| ATTR-0005 | ATTR-0002 | ATTR-0008 | 2023-12-16T04:33:56 |
| ATTR-0006 | ATTR-0002 | ATTR-0009 | 2024-09-15T16:03:36 |
| ATTR-0007 | ATTR-0003 | ATTR-0002 | 2024-12-20T02:32:40 |
| ATTR-0008 | ATTR-0003 | ATTR-0008 | 2024-08-26T04:55:34 |

**t_trace_with_attributes_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0001 | 1085.14 |
| ATTR-0002 | ATTR-0002 | ATTR-0001 | 3252.57 |
| ATTR-0003 | ATTR-0003 | ATTR-0001 | 401.17 |
| ATTR-0004 | ATTR-0004 | ATTR-0001 | 3242.47 |
| ATTR-0005 | ATTR-0005 | ATTR-0001 | 4250.01 |
| ATTR-0006 | ATTR-0006 | ATTR-0001 | 3788.41 |

**t_trace_with_attributes_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0003 | 445 |
| ATTR-0002 | ATTR-0001 | ATTR-0007 | 106 |
| ATTR-0003 | ATTR-0002 | ATTR-0003 | 567 |
| ATTR-0004 | ATTR-0002 | ATTR-0007 | 380 |
| ATTR-0005 | ATTR-0003 | ATTR-0003 | 276 |
| ATTR-0006 | ATTR-0003 | ATTR-0007 | 188 |
| ATTR-0007 | ATTR-0004 | ATTR-0003 | 89 |
| ATTR-0008 | ATTR-0004 | ATTR-0007 | 391 |

**t_trace_with_attributes_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0004 | gw-12 |
| ATTR-0002 | ATTR-0001 | ATTR-0005 | Log Level 02 |
| ATTR-0003 | ATTR-0001 | ATTR-0006 | initiation |
| ATTR-0004 | ATTR-0001 | ATTR-0010 | superseded |
| ATTR-0005 | ATTR-0001 | ATTR-0011 | Triggered By 05 |
| ATTR-0006 | ATTR-0002 | ATTR-0004 | node-b14 |
| ATTR-0007 | ATTR-0002 | ATTR-0005 | Log Level 07 |
| ATTR-0008 | ATTR-0002 | ATTR-0006 | execution |

**t_column_property_subclass**

| id | column | annotates_property_of |
| --- | --- | --- |
| PROP-0001 | user_agent | ATTR-0003 |
| PROP-0002 | device_serial | ATTR-0002 |
| PROP-0003 | request_payload | ATTR-0003 |
| PROP-0004 | event_code | ATTR-0006 |
| PROP-0005 | batch_id | ATTR-0006 |
| PROP-0006 | batch_id | ATTR-0002 |

**t_column_property_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| PROP-0001 | confidence | xsd:decimal |
| PROP-0002 | dimension_kind | xsd:string |
| PROP-0003 | method | xsd:string |
| PROP-0004 | recorded_at | xsd:dateTime |
| PROP-0005 | uncertainty | xsd:decimal |
| PROP-0006 | unit | xsd:string |
| PROP-0007 | value | xsd:decimal |
| PROP-0008 | encoding | xsd:string |

**t_column_property_subclass_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROP-0001 | PROP-0001 | PROP-0004 | 2023-02-03T11:52:35 |
| PROP-0002 | PROP-0002 | PROP-0004 | 2024-03-26T09:45:05 |
| PROP-0003 | PROP-0003 | PROP-0004 | 2024-11-24T00:57:54 |
| PROP-0004 | PROP-0004 | PROP-0004 | 2024-09-15T13:40:19 |
| PROP-0005 | PROP-0005 | PROP-0004 | 2024-02-28T16:30:22 |
| PROP-0006 | PROP-0006 | PROP-0004 | 2023-07-03T15:24:35 |

**t_column_property_subclass_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROP-0001 | PROP-0001 | PROP-0001 | 0.032 |
| PROP-0002 | PROP-0001 | PROP-0005 | 504.02 |
| PROP-0003 | PROP-0001 | PROP-0007 | 422.21 |
| PROP-0004 | PROP-0002 | PROP-0001 | 0.502 |
| PROP-0005 | PROP-0002 | PROP-0005 | 491.17 |
| PROP-0006 | PROP-0002 | PROP-0007 | 376.20 |
| PROP-0007 | PROP-0003 | PROP-0001 | 0.755 |
| PROP-0008 | PROP-0003 | PROP-0005 | 531.73 |

**t_column_property_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROP-0001 | PROP-0001 | PROP-0002 | Dimension Kind 01 |
| PROP-0002 | PROP-0001 | PROP-0008 | Encoding 02 |
| PROP-0003 | PROP-0001 | PROP-0009 | pre-release note |
| PROP-0004 | PROP-0001 | PROP-0010 | es |
| PROP-0005 | PROP-0001 | PROP-0003 | manual |
| PROP-0006 | PROP-0001 | PROP-0006 | m/s |
| PROP-0007 | PROP-0002 | PROP-0002 | Dimension Kind 07 |
| PROP-0008 | PROP-0002 | PROP-0008 | Encoding 08 |

The identifier space extends beyond attribute-value bindings to encompass the entities themselves and the relationships that connect them. Place addresses are identified by keys such as `ADDR-0001` through `ADDR-0004`, each associated with a schema.org entity—`CERN Main Campus`, `Smithsonian Institution`, `Royal Society`, `UN Secretariat`—and a corresponding postal address line like `700 1st Ave`, `350 Fifth Ave`, `2875 Broadway`, or `1000 Independence Ave`. The junction table `t_schemaorg_place_address__postal_address` resolves the many-to-many relationship between schema.org entities and postal addresses, using a composite structure where `schemaorg_id` serves as the subject, `postal_address_id` as the target, and `role` as the semantic qualifier of the link. Within this relationship table, the role column carries values such as `contributor` and `reviewer`, indicating the functional capacity in which the subject entity engages with the target—`ADDR-0001` acts as a contributor to `ADDR-0003`, while `ADDR-0004` assumes the same role toward `ADDR-0001`.

**t_schemaorg_place_address**

| id | schemaorg |
| --- | --- |
| ADDR-0001 | CERN Main Campus |
| ADDR-0002 | Smithsonian Institution |
| ADDR-0003 | Royal Society |
| ADDR-0004 | UN Secretariat |
| ADDR-0005 | Royal Society |
| ADDR-0006 | RAND Corporation |
| ADDR-0007 | CERN Main Campus |

**t_schemaorg_place_address_postal_address**

| id | postal_address |
| --- | --- |
| ADDR-0001 | 700 1st Ave |
| ADDR-0002 | 350 Fifth Ave |
| ADDR-0003 | 2875 Broadway |
| ADDR-0004 | 1000 Independence Ave |
| ADDR-0005 | 1 Infinite Loop |
| ADDR-0006 | 1000 Independence Ave |

**t_schemaorg_place_address__postal_address**

| id | schemaorg_id | postal_address_id | role |
| --- | --- | --- | --- |
| ADDR-0001 | ADDR-0001 | ADDR-0003 | contributor |
| ADDR-0002 | ADDR-0004 | ADDR-0001 | contributor |
| ADDR-0003 | ADDR-0001 | ADDR-0006 | reviewer |
| ADDR-0004 | ADDR-0001 | ADDR-0003 | contributor |
| ADDR-0005 | ADDR-0002 | ADDR-0005 | observer |
| ADDR-0006 | ADDR-0004 | ADDR-0005 | contributor |
| ADDR-0007 | ADDR-0004 | ADDR-0003 | owner |
| ADDR-0008 | ADDR-0003 | ADDR-0001 | observer |

This decomposition into attributes, types, entities, identifiers, values, subjects, targets, and roles provides a general-purpose schema for representing heterogeneous data without prescribing a fixed ontology. The same structural pattern recurs across domains: traces carry operational metadata (a duration of `3252.57` seconds, an exit code of `567`), column properties carry classification metadata (a confidence of `0.032`, a recorded-at timestamp of `2024-11-24T00:57:54`), and places carry geographic metadata (a schema.org entity linked to a postal address via a contributor role). The separation of attribute definition from value storage—where `attr_name` and `attr_type` are declared once in the attribute catalog and values are stored separately by type in dedicated tables—enables schema evolution without migration, as new attributes can be introduced and bound to existing entities without altering the value tables. The role column, appearing in relationship tables, adds a layer of semantic expressiveness that distinguishes between different kinds of association between the same pair of entities, while the subject-target distinction preserves directionality in relationships that are not symmetric.