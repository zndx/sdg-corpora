---
chapter_id: ch_live_equiv_union_ice_branches_3009a5
topic_id: 186
family: 01_foundation
cited_terms: ['equiv_union_ice_branches', 'column_renamed_from', 'ebpf_event_subclass']
model: engine-refine
---

Within metadata-driven data models, the foundational vocabulary revolves around identifiers, entities, attributes, and attribute types, each serving a distinct governance role. An identifier is a stable, human-readable key that anchors every record—`BRAN-0001`, `FROM-0001`, `EVEN-0001`—ensuring referential integrity across the system. An entity represents a concrete instance or subject of interest, such as a captured eBPF event or a renamed column, and is always distinguished by its own identifier. An attribute (attr) is a named property of that entity—`confidence`, `duration_seconds`, `host_name`—that captures a specific dimension of information. The attribute type (attr_type) constrains the kind of value an attribute can hold, typically drawn from the XML Schema Definition vocabulary: `xsd:decimal` for numeric measurements, `xsd:string` for free-form text, `xsd:dateTime` for temporal stamps, and `xsd:integer` for whole-number counts. This separation of attribute definition from value storage enables type-safe validation and flexible schema evolution without altering the underlying data model.

**t_column_renamed_from**

| id | column | renamed_from |
| --- | --- | --- |
| FROM-0001 | node_cpu_load | EVEN-0003 |
| FROM-0002 | measurement_timestamp | EVEN-0004 |
| FROM-0003 | config_version | EVEN-0006 |
| FROM-0004 | batch_run_id | EVEN-0001 |
| FROM-0005 | event_type | EVEN-0001 |
| FROM-0006 | patient_bmi | EVEN-0002 |

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

The attribute type dictates not only the semantics of a value but also its physical storage. Decimal attributes such as `confidence` (typed `xsd:decimal`) store precision-sensitive measurements like `0.429` or `695.20`, while integer attributes like `exit_code` capture discrete counts such as `850` or `274`. Temporal attributes typed `xsd:dateTime`—for example, `recorded_at` or `end_time`—encode ISO 8601 timestamps such as `2025-03-21T00:09:12` or `2024-10-14T13:06:33`, enabling range queries and temporal joins. String attributes typed `xsd:string` accommodate both structured labels like `Dimension Kind 01` and unstructured text such as `audit excerpt` or `closeout`. By partitioning values into type-specific storage tables keyed by entity and attribute identifiers, the model enforces type discipline at query time while preserving a uniform entity–attribute–value (EAV) topology that scales to hundreds of attribute definitions without schema migrations.

Entities serve as the binding layer that ties attribute values together into coherent records. An entity identifier—`EVEN-0001`, `FROM-0001`—appears as a foreign key across multiple value tables, allowing a single entity to carry heterogeneous attributes of different types. For instance, the eBPF event subclass `EVEN-0001` (representing `net_cls` events captured by `FROM-0003`) carries a decimal `duration_seconds` value of `2720.22`, an integer `exit_code` of `850`, and a string `host_name` of `ingest-21`, all linked through the same entity identifier. Similarly, the renamed-column entity `FROM-0001` aggregates a decimal confidence of `0.429`, a string dimension kind of `Dimension Kind 01`, and a datetime `recorded_at` of `2025-03-21T00:09:12`. This design permits entities to evolve organically—new attributes can be added without modifying existing rows—while maintaining a single point of referential entry for downstream analytics and audit trails.

**t_ebpf_event_subclass**

| id | ebpf | captured_by |
| --- | --- | --- |
| EVEN-0001 | net_cls | FROM-0002 |
| EVEN-0002 | sockops | FROM-0004 |
| EVEN-0003 | tcp_sendmsg | FROM-0003 |
| EVEN-0004 | nginx_handle_request | FROM-0006 |
| EVEN-0005 | nginx_handle_request | FROM-0002 |
| EVEN-0006 | net_cls | FROM-0004 |

**t_ebpf_event_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| EVEN-0001 | duration_seconds | xsd:decimal |
| EVEN-0002 | end_time | xsd:dateTime |
| EVEN-0003 | exit_code | xsd:integer |
| EVEN-0004 | host_name | xsd:string |
| EVEN-0005 | log_level | xsd:string |
| EVEN-0006 | phase | xsd:string |
| EVEN-0007 | retry_count | xsd:integer |
| EVEN-0008 | scheduled_at | xsd:dateTime |

**t_ebpf_event_subclass_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0002 | 2023-12-16T10:45:28 |
| EVEN-0002 | EVEN-0001 | EVEN-0008 | 2024-10-14T13:06:33 |
| EVEN-0003 | EVEN-0001 | EVEN-0009 | 2023-04-24T00:44:09 |
| EVEN-0004 | EVEN-0002 | EVEN-0002 | 2025-02-16T07:35:15 |
| EVEN-0005 | EVEN-0002 | EVEN-0008 | 2025-04-20T08:07:57 |
| EVEN-0006 | EVEN-0002 | EVEN-0009 | 2024-07-28T17:18:43 |
| EVEN-0007 | EVEN-0003 | EVEN-0002 | 2023-11-26T07:43:04 |
| EVEN-0008 | EVEN-0003 | EVEN-0008 | 2024-06-08T03:25:45 |

**t_ebpf_event_subclass_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0001 | 2720.22 |
| EVEN-0002 | EVEN-0002 | EVEN-0001 | 5609.93 |
| EVEN-0003 | EVEN-0003 | EVEN-0001 | 2196.86 |
| EVEN-0004 | EVEN-0004 | EVEN-0001 | 3453.77 |
| EVEN-0005 | EVEN-0005 | EVEN-0001 | 849.28 |
| EVEN-0006 | EVEN-0006 | EVEN-0001 | 5507.03 |

**t_ebpf_event_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0003 | 850 |
| EVEN-0002 | EVEN-0001 | EVEN-0007 | 82 |
| EVEN-0003 | EVEN-0002 | EVEN-0003 | 274 |
| EVEN-0004 | EVEN-0002 | EVEN-0007 | 150 |
| EVEN-0005 | EVEN-0003 | EVEN-0003 | 331 |
| EVEN-0006 | EVEN-0003 | EVEN-0007 | 359 |
| EVEN-0007 | EVEN-0004 | EVEN-0003 | 62 |
| EVEN-0008 | EVEN-0004 | EVEN-0007 | 407 |

**t_ebpf_event_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0004 | ingest-21 |
| EVEN-0002 | EVEN-0001 | EVEN-0005 | Log Level 02 |
| EVEN-0003 | EVEN-0001 | EVEN-0006 | closeout |
| EVEN-0004 | EVEN-0001 | EVEN-0010 | superseded |
| EVEN-0005 | EVEN-0001 | EVEN-0011 | Triggered By 05 |
| EVEN-0006 | EVEN-0002 | EVEN-0004 | gw-12 |
| EVEN-0007 | EVEN-0002 | EVEN-0005 | Log Level 07 |
| EVEN-0008 | EVEN-0002 | EVEN-0006 | initiation |

Beyond the structural layer, labeltext and language provide the human-readable metadata that makes the model interpretable to operators and auditors. A labeltext is a localized, human-readable description of an entity or concept—`calibration record`, `change rationale`, `intake form`—that appears alongside its identifier in user-facing interfaces. The language column disambiguates which locale a label belongs to, with values such as `fr`, `es`, and `de` enabling multilingual deployments. In the equivalence branch table, the same conceptual entity can carry multiple labeled variants across languages, ensuring that a `Calibration_Offset` is rendered as `calibration record` in German (`de`) or `change rationale` in Spanish (`es`). This separation of machine-readable identifiers from human-readable labels supports compliance workflows where auditors must trace a technical column rename—such as `node_cpu_load` formerly known as `EVEN-0003`—back to its business meaning without parsing schema definitions.

**t_equiv_union_ice_branches**

| id | equiv | label_text | language |
| --- | --- | --- | --- |
| BRAN-0001 | Calibration_Offset | calibration record | fr |
| BRAN-0002 | Equipment_Model | change rationale | es |
| BRAN-0003 | Data_Retention_Policy | calibration record | es |
| BRAN-0004 | Quality_Score | intake form | de |
| BRAN-0005 | Quality_Score | change rationale | de |
| BRAN-0006 | Observation_Code | nightly summary | es |
| BRAN-0007 | Safety_Protocol | nightly summary | es |
| BRAN-0008 | Quality_Score | pre-release note | fr |