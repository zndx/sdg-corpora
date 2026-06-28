---
chapter_id: ch_live_state_basic_cfa8c7
topic_id: 19
family: 02_observation_measurement
cited_terms: ['state_basic', 'process_produces_ice', 'schema_version_subclass']
model: engine-refine
---

The governance of observable phenomena rests on a disciplined separation between identity, classification, and measured value. Every entity in the system receives a stable identifier—STAT-0001, ICE-0001, VERS-0001—that anchors it across all tables and queries, ensuring that a single process, state, or schema version can be traced unambiguously through its attributes, values, and metadata. These identifiers serve as the primary keys for dimension tables such as `dim_state`, which pairs each identifier with a human-readable label (State Label 01 through State Label 04) and a categorical classification (State Category 01 through State Category 04), and for the process and schema-version tables, where identifiers like ICE-0001 through ICE-0004 denote distinct freezing operations—Plate freezing, Cryogenic freezing, Spray cooling, Direct expansion freezing—and VERS-0001 through VERS-0004 denote schema releases such as EventCatalog release-11.0, AccessControlMatrix rc-2.1, and TelemetryStream patch-3.2. The identifier, in short, is the immutable reference point; everything else is a property of, or a measurement about, that point.

**dim_state**

| id | state_label | state_category |
| --- | --- | --- |
| STAT-0001 | State Label 01 | State Category 01 |
| STAT-0002 | State Label 02 | State Category 02 |
| STAT-0003 | State Label 03 | State Category 03 |
| STAT-0004 | State Label 04 | State Category 04 |
| STAT-0005 | State Label 05 | State Category 05 |
| STAT-0006 | State Label 06 | State Category 06 |
| STAT-0007 | State Label 07 | State Category 07 |
| STAT-0008 | State Label 08 | State Category 08 |

**t_process_produces_ice**

| id | process |
| --- | --- |
| ICE-0001 | Plate freezing |
| ICE-0002 | Cryogenic freezing |
| ICE-0003 | Spray cooling |
| ICE-0004 | Direct expansion freezing |
| ICE-0005 | Directional solidification |
| ICE-0006 | Spiral freezing |

**t_schema_version_subclass**

| id | schema | schema_version |
| --- | --- | --- |
| VERS-0001 | EventCatalog | release-11.0 |
| VERS-0002 | AccessControlMatrix | rc-2.1 |
| VERS-0003 | AccessControlMatrix | alpha-0.9 |
| VERS-0004 | TelemetryStream | patch-3.2 |
| VERS-0005 | AccessControlMatrix | rc-2.1 |
| VERS-0006 | AssetRegistry | hotfix-2.0 |
| VERS-0007 | AccessControlMatrix | alpha-0.9 |
| VERS-0008 | EventCatalog | hotfix-2.0 |

**t_schema_version_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERS-0001 | VERS-0001 | VERS-0006 | 24 |
| VERS-0002 | VERS-0001 | VERS-0008 | 11 |
| VERS-0003 | VERS-0002 | VERS-0006 | 16 |
| VERS-0004 | VERS-0002 | VERS-0008 | 12 |
| VERS-0005 | VERS-0003 | VERS-0006 | 266 |
| VERS-0006 | VERS-0003 | VERS-0008 | 11 |
| VERS-0007 | VERS-0004 | VERS-0006 | 422 |
| VERS-0008 | VERS-0004 | VERS-0008 | 5 |

Attributes and their types form the schema layer that gives structure to what can be observed. The `attr_name` column enumerates the properties under consideration—duration_seconds, end_time, exit_code, host_name for process entities; checksum, created_date, identifier, license for schema-version entities—while the `attr_type` column constrains each to a precise data domain: xsd:decimal for numeric durations such as 5646.64 or 6078.60, xsd:dateTime for timestamps like 2024-12-21T05:38:52, xsd:integer for exit codes such as 140 or 235, xsd:string for hostnames and log levels, xsd:date for creation dates, and cco:DesignativeICE for designative identifiers. This typed attribute model ensures that every value stored in a value table is semantically coherent with its definition, preventing type mismatches at the schema level rather than deferring validation to runtime.

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

**t_schema_version_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| VERS-0001 | checksum | xsd:string |
| VERS-0002 | created_date | xsd:date |
| VERS-0003 | identifier | cco:DesignativeICE |
| VERS-0004 | license | xsd:string |
| VERS-0005 | mime_type | xsd:string |
| VERS-0006 | size_bytes | xsd:long |
| VERS-0007 | uri | xsd:string |
| VERS-0008 | version | xsd:integer |

The value tables themselves—`t_process_produces_ice_val_decimal`, `t_process_produces_ice_val_datetime`, `t_process_produces_ice_val_int`, `t_process_produces_ice_val_varchar`, and their schema-version counterparts—implement an entity-attribute-value (EAV) pattern that decouples the set of observable properties from the set of observed entities. Each row carries an entity_id that points back to the originating entity, an attr_id that resolves to a specific attribute definition, and a value column holding the misc data: the actual measurement or observation. A single entity such as ICE-0001 may appear across multiple value tables, contributing a decimal duration of 5646.64, a datetime of 2024-12-21T05:38:52, an integer exit code of 140, and string values including ingest-21 and running. This design permits heterogeneous attributes to coexist without schema migration, while the entity_id foreign key preserves the relational link that binds each observation to its source.

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

**t_schema_version_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERS-0001 | VERS-0001 | VERS-0002 | 2024-06-07 |
| VERS-0002 | VERS-0002 | VERS-0002 | 2024-09-26 |
| VERS-0003 | VERS-0003 | VERS-0002 | 2024-06-05 |
| VERS-0004 | VERS-0004 | VERS-0002 | 2023-07-15 |
| VERS-0005 | VERS-0005 | VERS-0002 | 2025-03-15 |
| VERS-0006 | VERS-0006 | VERS-0002 | 2024-09-16 |
| VERS-0007 | VERS-0007 | VERS-0002 | 2023-01-08 |
| VERS-0008 | VERS-0008 | VERS-0002 | 2023-05-20 |

**t_schema_version_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERS-0001 | VERS-0001 | VERS-0001 | a3f9c21e |
| VERS-0002 | VERS-0001 | VERS-0003 | doi:10.1109/x |
| VERS-0003 | VERS-0001 | VERS-0004 | MPL-2.0 |
| VERS-0004 | VERS-0001 | VERS-0009 | on-prem-dc1 |
| VERS-0005 | VERS-0001 | VERS-0005 | application/octet-stream |
| VERS-0006 | VERS-0001 | VERS-0010 | Name 06 |
| VERS-0007 | VERS-0001 | VERS-0011 | governance |
| VERS-0008 | VERS-0001 | VERS-0012 | Tags 08 |

State measurement introduces a second layer of quantification, one that explicitly models epistemic quality. The `fact_state` table records each state observation through a state_key that references a dimension entry, a confidence value ranging from 0.012 to 0.523, an uncertainty magnitude between 366.30 and 951.90, and a measured value such as 195.86 or 619.50. Confidence and uncertainty are not derived from one another; both are recorded independently, allowing downstream consumers to assess the reliability of a state reading on two orthogonal axes. A reading with confidence 0.523 and uncertainty 366.30 conveys a materially different assurance profile than one with confidence 0.012 and uncertainty 416.12, even if their raw values are comparable. The state_category from `dim_state` provides the categorical context—State Category 01 through State Category 04—within which these quantitative assessments are interpreted.

**fact_state**

| id | state_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | 0.422 | 951.90 | 195.86 |
| STAT-0002 | STAT-0004 | 0.012 | 416.12 | 143.04 |
| STAT-0003 | STAT-0005 | 0.075 | 421.79 | 237.15 |
| STAT-0004 | STAT-0003 | 0.523 | 366.30 | 619.50 |

Together, these constructs—identifier, attribute, type, entity, value, state, confidence, uncertainty, and category—constitute a minimal but complete ontology for governed observability. The identifier guarantees traceability; the attribute and type guarantee semantic integrity; the entity and value tables guarantee flexibility in what can be observed; the state, confidence, and uncertainty columns guarantee that every measurement carries its own quality assessment; and the category provides the classification framework that makes aggregated analysis possible. In a compliance or governance context, this separation is not academic: it ensures that auditors can reconstruct not only what was observed, but how confidently it was observed, under what categorical framing, and through which attribute definitions—each link in the chain anchored by a stable identifier.