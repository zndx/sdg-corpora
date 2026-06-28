---
chapter_id: ch_live_training_partnership_development_667cb2
topic_id: 36
family: 08_derived
cited_terms: ['training_partnership_development', 'entity_type_belongs_to', 'process_produces_ice']
model: engine-refine
---

Entities are the fundamental units of observation within the data model, each distinguished by a unique identifier that serves as the primary key for all relational joins. An entity may represent a physical device such as `edge_gateway_12` or `sensor_node_47`, an abstract construct like `governance_policy_fin`, or a programmatic initiative identified as `DEVE-0001` through `DEVE-0004`. The identifier space is partitioned by domain: development-oriented records carry the `DEVE-` prefix, attribute definitions use `BELO-`, and process records are keyed with `ICE-`. Each entity is classified by an entity type, which determines the schema of attributes it may carry. An entity such as `sensor_node_47` is classified as an `IoT Edge Device`, while `governance_policy_fin` belongs to the type `Cloud Storage Bucket`. This classification mechanism ensures that attribute queries are scoped to the appropriate entity type, preventing type mismatches at the schema level.

**t_entity_type_belongs_to**

| id | entity | entity_type_belongs_to |
| --- | --- | --- |
| BELO-0001 | edge_gateway_12 | IoT Edge Device |
| BELO-0002 | sensor_node_47 | Message Broker Topic |
| BELO-0003 | governance_policy_fin | Cloud Storage Bucket |
| BELO-0004 | sensor_node_47 | Data Quality Rule |
| BELO-0005 | edge_gateway_12 | Network Telemetry |
| BELO-0006 | edge_gateway_12 | Data Quality Rule |
| BELO-0007 | ml_feature_store_prod | Message Broker Topic |

**t_entity_type_belongs_to_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| BELO-0001 | confidence | xsd:decimal |
| BELO-0002 | dimension_kind | xsd:string |
| BELO-0003 | method | xsd:string |
| BELO-0004 | recorded_at | xsd:dateTime |
| BELO-0005 | uncertainty | xsd:decimal |
| BELO-0006 | unit | xsd:string |
| BELO-0007 | value | xsd:decimal |
| BELO-0008 | encoding | xsd:string |

**t_process_produces_ice**

| id | process |
| --- | --- |
| ICE-0001 | Plate freezing |
| ICE-0002 | Cryogenic freezing |
| ICE-0003 | Spray cooling |
| ICE-0004 | Direct expansion freezing |
| ICE-0005 | Directional solidification |
| ICE-0006 | Spiral freezing |

**t_process_produces_ice_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ICE-0001 | duration_seconds | xsd:decimal |
| ICE-0002 | end_time | xsd:dateTime |
| ICE-0003 | exit_code | xsd:integer |
| ICE-0004 | host_name | xsd:string |
| ICE-0005 | log_level | xsd:string |
| ICE-0006 | phase | xsd:string |
| ICE-0007 | retry_count | xsd:integer |
| ICE-0008 | scheduled_at | xsd:dateTime |

An attribute, or `attr`, is a named property that describes a characteristic of an entity or process, and each attribute is declared with a precise `attr_type` drawn from the XML Schema definition namespace. The type system enforces value constraints: `xsd:decimal` governs numeric measurements such as `0.703` and `525.54`, `xsd:string` accommodates categorical labels like `Dimension Kind 01` and `Encoding 02`, `xsd:dateTime` constrains temporal observations to the ISO 8601 format (e.g., `2025-04-30T12:57:36`), and `xsd:integer` restricts values to whole numbers such as `140` and `235`. Attribute definitions are themselves entities — identified by keys such as `BELO-0001` for the attribute `confidence` or `ICE-0001` for `duration_seconds` — and are stored in a dedicated registry that maps `attr_name` to `attr_type`. This separation of attribute schema from attribute values enables flexible extension: new attributes can be declared without modifying existing value tables, and the type system guarantees that every value stored in a typed value table conforms to its declared schema.

Value storage is partitioned by type into distinct tables, each dedicated to a single `attr_type`. The `misc` values — the actual data payloads — are distributed across `t_entity_type_belongs_to_val_datetime`, `t_entity_type_belongs_to_val_decimal`, `t_entity_type_belongs_to_val_varchar`, and `t_process_produces_ice_val_int`, among others. Each row in a value table references its owning entity through `entity_id` and its attribute definition through `attr_id`, forming a normalized many-to-many relationship. For instance, the decimal value `691.11` is stored in the decimal value table with `entity_id` `BELO-0001` and `attr_id` `BELO-0007`, while the datetime value `2023-11-10T02:05:22` occupies the corresponding row in the datetime table with `attr_id` `BELO-0004`. This denormalization by type avoids the overhead of type coercion at query time and ensures that each value table can be optimized for its specific data format.

**t_entity_type_belongs_to_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BELO-0001 | BELO-0001 | BELO-0004 | 2025-04-30T12:57:36 |
| BELO-0002 | BELO-0002 | BELO-0004 | 2023-11-10T02:05:22 |
| BELO-0003 | BELO-0003 | BELO-0004 | 2023-12-19T19:26:36 |
| BELO-0004 | BELO-0004 | BELO-0004 | 2023-01-25T21:39:36 |
| BELO-0005 | BELO-0005 | BELO-0004 | 2023-12-09T03:03:32 |
| BELO-0006 | BELO-0006 | BELO-0004 | 2023-09-18T08:14:48 |
| BELO-0007 | BELO-0007 | BELO-0004 | 2024-05-10T13:50:46 |

**t_entity_type_belongs_to_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BELO-0001 | BELO-0001 | BELO-0001 | 0.703 |
| BELO-0002 | BELO-0001 | BELO-0005 | 525.54 |
| BELO-0003 | BELO-0001 | BELO-0007 | 691.11 |
| BELO-0004 | BELO-0002 | BELO-0001 | 0.351 |
| BELO-0005 | BELO-0002 | BELO-0005 | 906.27 |
| BELO-0006 | BELO-0002 | BELO-0007 | 385.85 |
| BELO-0007 | BELO-0003 | BELO-0001 | 0.357 |
| BELO-0008 | BELO-0003 | BELO-0005 | 529.91 |

**t_entity_type_belongs_to_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BELO-0001 | BELO-0001 | BELO-0002 | Dimension Kind 01 |
| BELO-0002 | BELO-0001 | BELO-0008 | Encoding 02 |
| BELO-0003 | BELO-0001 | BELO-0009 | nightly summary |
| BELO-0004 | BELO-0001 | BELO-0010 | es |
| BELO-0005 | BELO-0001 | BELO-0003 | hybrid |
| BELO-0006 | BELO-0001 | BELO-0006 | ms |
| BELO-0007 | BELO-0002 | BELO-0002 | Dimension Kind 07 |
| BELO-0008 | BELO-0002 | BELO-0008 | Encoding 08 |

**t_process_produces_ice_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ICE-0001 | ICE-0001 | ICE-0002 | 2024-12-21T05:38:52 |
| ICE-0002 | ICE-0001 | ICE-0008 | 2023-10-15T09:29:56 |
| ICE-0003 | ICE-0001 | ICE-0009 | 2023-08-06T18:23:28 |
| ICE-0004 | ICE-0002 | ICE-0002 | 2023-05-16T09:39:52 |
| ICE-0005 | ICE-0002 | ICE-0008 | 2023-09-23T10:34:19 |
| ICE-0006 | ICE-0002 | ICE-0009 | 2025-02-04T21:26:44 |
| ICE-0007 | ICE-0003 | ICE-0002 | 2023-02-04T12:13:18 |
| ICE-0008 | ICE-0003 | ICE-0008 | 2024-02-01T06:54:56 |

**t_process_produces_ice_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ICE-0001 | ICE-0001 | ICE-0001 | 5646.64 |
| ICE-0002 | ICE-0002 | ICE-0001 | 6078.60 |
| ICE-0003 | ICE-0003 | ICE-0001 | 2298.30 |
| ICE-0004 | ICE-0004 | ICE-0001 | 3884.97 |
| ICE-0005 | ICE-0005 | ICE-0001 | 5116.46 |
| ICE-0006 | ICE-0006 | ICE-0001 | 5090.16 |

**t_process_produces_ice_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ICE-0001 | ICE-0001 | ICE-0003 | 140 |
| ICE-0002 | ICE-0001 | ICE-0007 | 235 |
| ICE-0003 | ICE-0002 | ICE-0003 | 217 |
| ICE-0004 | ICE-0002 | ICE-0007 | 99 |
| ICE-0005 | ICE-0003 | ICE-0003 | 880 |
| ICE-0006 | ICE-0003 | ICE-0007 | 326 |
| ICE-0007 | ICE-0004 | ICE-0003 | 176 |
| ICE-0008 | ICE-0004 | ICE-0007 | 291 |

**t_process_produces_ice_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ICE-0001 | ICE-0001 | ICE-0004 | ingest-21 |
| ICE-0002 | ICE-0001 | ICE-0005 | Log Level 02 |
| ICE-0003 | ICE-0001 | ICE-0006 | initiation |
| ICE-0004 | ICE-0001 | ICE-0010 | running |
| ICE-0005 | ICE-0001 | ICE-0011 | Triggered By 05 |
| ICE-0006 | ICE-0002 | ICE-0004 | edge-03 |
| ICE-0007 | ICE-0002 | ICE-0005 | Log Level 07 |
| ICE-0008 | ICE-0002 | ICE-0006 | closeout |

The training partnership development domain illustrates how entities encode organizational relationships. Records in the training partnership development table are identified by keys such as `DEVE-0001` through `DEVE-0004` and describe programs including the `Advanced Analytics Cohort`, `Machine Learning Track`, `Biostatistics Collaboration`, and `Engineering Mentorship Program`. Each program is associated with a `has_participant` field typed as `educationalinstitution`, which captures the participating entities — ranging from institutional units like the `Clinical Preceptor Team` and `Industry Liaison Office` to individual practitioners such as `Elena Rostova` and `Research Associate Kim`. The `educationalinstitution` type serves as a domain constraint on the participant field, ensuring that only entities recognized as educational institutions can be linked to a training partnership, thereby maintaining referential integrity across the organizational graph.

**t_training_partnership_development**

| id | training_partnership_development | has_participant |
| --- | --- | --- |
| DEVE-0001 | Advanced Analytics Cohort | Clinical Preceptor Team |
| DEVE-0002 | Machine Learning Track | Elena Rostova |
| DEVE-0003 | Biostatistics Collaboration | Research Associate Kim |
| DEVE-0004 | Engineering Mentorship Program | Industry Liaison Office |
| DEVE-0005 | Engineering Mentorship Program | Industry Liaison Office |
| DEVE-0006 | Data Governance Workshop | Research Associate Kim |
| DEVE-0007 | Research Methods Alliance | Elena Rostova |
| DEVE-0008 | Machine Learning Track | Elena Rostova |

Process tracking follows an analogous structure, where each process — such as `Plate freezing`, `Cryogenic freezing`, `Spray cooling`, or `Direct expansion freezing` — is identified by an `ICE-` prefixed key and annotated with a suite of operational attributes. The process attribute schema includes `duration_seconds` (typed as `xsd:decimal`, with observed values of `5646.64`, `6078.60`, `2298.30`, and `3884.97`), `end_time` (`xsd:dateTime`, recording timestamps such as `2024-12-21T05:38:52`), `exit_code` (`xsd:integer`, with values like `140` and `217`), and `host_name` (`xsd:string`, capturing host identifiers such as `ingest-21`). Additional process attributes capture `Log Level 02`, the state `initiation`, and the operational status `running`. The uniformity of this attribute-value pattern across both the entity and process domains — despite their fundamentally different subject matters — demonstrates a consistent modeling approach where identifiers, attribute types, and typed value tables form a reusable backbone for heterogeneous data.