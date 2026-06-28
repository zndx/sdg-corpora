---
chapter_id: ch_live_requirement_traces_to_b29483
topic_id: 105
family: 03_directive_governance
cited_terms: ['requirement_traces_to', 'measurement_with_precision', 'dataset_under_audit']
model: engine-refine
---

Within any governed data architecture, the integrity of relationships and the fidelity of stored values depend upon a disciplined separation of identity, structure, and content. Every persistent object—whether a compliance requirement, a measurement, or an auditable dataset—is assigned a stable identifier that serves as its immutable reference point across the system. The identifier `TRAC-0001` anchors the Network Segmentation Rule; `PREC-0001` anchors a seismic amplitude measurement; `AUDI-0001` anchors the genomic_variant_calls dataset. These identifiers are not merely labels but the primary keys that permit cross-referencing between structural definitions and their instantiated values, ensuring that every datum can be traced to its originating entity without ambiguity.

The attribute schema defines what properties are recorded for each entity, decoupling the definition of those properties from their actual values. In the audit domain, the attribute `duration_seconds` is declared with type `xsd:decimal`, `end_time` with type `xsd:dateTime`, `exit_code` with type `xsd:integer`, and `host_name` with type `xsd:string`. This separation of attr_name and attr_type from the misc values they carry is fundamental: it permits the system to enforce type discipline at query time while allowing the actual values—`1678.44` for duration, `2025-02-12T00:42:30` for end_time, `966` for exit_code, `node-a01` for host_name—to be stored in type-specific value tables. The same entity `AUDI-0001` may thus carry a decimal measurement, a datetime stamp, an integer code, and a string literal, each routed to its appropriate value store by the attr_id foreign key.

Relationships between entities are modeled through junction tables that explicitly name the subject, the target, and the role that characterizes the connection. A requirement trace from `TRAC-0001` (Network Segmentation Rule) to `TRAC-0004` (Privacy Compliance Requirement) is recorded with role `owner`, indicating that the source requirement bears primary responsibility for the target. The same pair of requirements may appear again with role `contributor`, or a single requirement may relate to multiple targets under different roles—`TRAC-0004` (Privacy Compliance Requirement) maps to `TRAC-0004` (ISO 27001 Control) with role `reviewer`. In the measurement domain, `PREC-0003` (acoustic decibels) relates to `PREC-0008` (1 sigma precision) with role `reviewer`, while `PREC-0007` (seismic amplitude) relates to `PREC-0001` (0.001 K precision) with role `reviewer`. The role column is the semantic glue that distinguishes an ownership relationship from a review or contribution relationship, preventing the collapse of heterogeneous connections into a single undifferentiated link.

The entity column in value tables binds each misc datum to its parent object, completing the chain from identifier through attribute definition to concrete value. Entity `AUDI-0001` carries the decimal value `1678.44` on attribute `AUDI-0001` (duration_seconds), the datetime value `2025-02-12T00:42:30` on attribute `AUDI-0002` (end_time), the integer value `966` on attribute `AUDI-0003` (exit_code), and the string value `node-a01` on attribute `AUDI-0004` (host_name). Entity `AUDI-0002` carries its own distinct set: decimal `5254.25`, datetime `2023-01-27T02:28:31`, integer `222`, and string `Log Level 02`. This entity-attr-value triad, partitioned by type into four value tables, ensures that queries can be routed to the correct store without type coercion or null padding, while the entity_id foreign key guarantees that every value is attributable to a known dataset under audit.

**t_dataset_under_audit**

| id | dataset |
| --- | --- |
| AUDI-0001 | genomic_variant_calls |
| AUDI-0002 | supply_chain_logs |
| AUDI-0003 | user_session_metrics |
| AUDI-0004 | genomic_variant_calls |
| AUDI-0005 | iot_sensor_readings |
| AUDI-0006 | satellite_imagery_band4 |

**t_dataset_under_audit_attr**

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

**t_dataset_under_audit_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0002 | 2025-02-12T00:42:30 |
| AUDI-0002 | AUDI-0001 | AUDI-0008 | 2024-03-05T07:28:41 |
| AUDI-0003 | AUDI-0001 | AUDI-0009 | 2024-05-20T18:48:03 |
| AUDI-0004 | AUDI-0002 | AUDI-0002 | 2023-01-27T02:28:31 |
| AUDI-0005 | AUDI-0002 | AUDI-0008 | 2023-01-08T19:31:43 |
| AUDI-0006 | AUDI-0002 | AUDI-0009 | 2023-02-20T22:50:34 |
| AUDI-0007 | AUDI-0003 | AUDI-0002 | 2024-12-18T21:18:14 |
| AUDI-0008 | AUDI-0003 | AUDI-0008 | 2024-04-14T04:31:20 |

**t_dataset_under_audit_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0001 | 1678.44 |
| AUDI-0002 | AUDI-0002 | AUDI-0001 | 5254.25 |
| AUDI-0003 | AUDI-0003 | AUDI-0001 | 582.65 |
| AUDI-0004 | AUDI-0004 | AUDI-0001 | 741.84 |
| AUDI-0005 | AUDI-0005 | AUDI-0001 | 6993.92 |
| AUDI-0006 | AUDI-0006 | AUDI-0001 | 111.23 |

**t_dataset_under_audit_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0003 | 966 |
| AUDI-0002 | AUDI-0001 | AUDI-0007 | 22 |
| AUDI-0003 | AUDI-0002 | AUDI-0003 | 222 |
| AUDI-0004 | AUDI-0002 | AUDI-0007 | 333 |
| AUDI-0005 | AUDI-0003 | AUDI-0003 | 372 |
| AUDI-0006 | AUDI-0003 | AUDI-0007 | 83 |
| AUDI-0007 | AUDI-0004 | AUDI-0003 | 123 |
| AUDI-0008 | AUDI-0004 | AUDI-0007 | 109 |

**t_dataset_under_audit_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0004 | node-a01 |
| AUDI-0002 | AUDI-0001 | AUDI-0005 | Log Level 02 |
| AUDI-0003 | AUDI-0001 | AUDI-0006 | execution |
| AUDI-0004 | AUDI-0001 | AUDI-0010 | running |
| AUDI-0005 | AUDI-0001 | AUDI-0011 | Triggered By 05 |
| AUDI-0006 | AUDI-0002 | AUDI-0004 | gw-12 |
| AUDI-0007 | AUDI-0002 | AUDI-0005 | Log Level 07 |
| AUDI-0008 | AUDI-0002 | AUDI-0006 | review |

Precision measurements follow the same relational discipline. A seismic amplitude measurement (`PREC-0001`) is associated with a precision of `±10 ppm`; another seismic amplitude (`PREC-0002`) carries `1 sigma` precision; acoustic decibels (`PREC-0003`) carry `10 µs` precision; and a third seismic amplitude (`PREC-0004`) carries `0.001 K` precision. The junction table `t_measurement_with_precision__precision` records these associations with subject, target, and role columns, mirroring the pattern used for requirement traces. The consistency of this pattern—identifier, subject, target, role—across requirement traces, measurement precisions, and dataset attribute values means that governance policies can be expressed uniformly: any entity can be a subject, any entity can be a target, and the role column captures the nature of the obligation or relationship between them.

**t_requirement_traces_to**

| id | requirement |
| --- | --- |
| TRAC-0001 | Network Segmentation Rule |
| TRAC-0002 | Access Control Mandate |
| TRAC-0003 | Privacy Compliance Requirement |
| TRAC-0004 | Privacy Compliance Requirement |
| TRAC-0005 | Access Control Mandate |
| TRAC-0006 | Encryption Standard |
| TRAC-0007 | System Availability Target |

**t_requirement_traces_to_traces_to**

| id | traces_to |
| --- | --- |
| TRAC-0001 | HIPAA Security Rule |
| TRAC-0002 | Risk Assessment Matrix |
| TRAC-0003 | Compliance Audit Checklist |
| TRAC-0004 | ISO 27001 Control |
| TRAC-0005 | Penetration Test Suite |
| TRAC-0006 | NIST SP 800-53 |
| TRAC-0007 | Vulnerability Scan Config |

**t_requirement_traces_to__traces_to**

| id | requirement_id | traces_to_id | role |
| --- | --- | --- | --- |
| TRAC-0001 | TRAC-0001 | TRAC-0004 | owner |
| TRAC-0002 | TRAC-0004 | TRAC-0004 | reviewer |
| TRAC-0003 | TRAC-0004 | TRAC-0004 | reviewer |
| TRAC-0004 | TRAC-0001 | TRAC-0004 | contributor |
| TRAC-0005 | TRAC-0007 | TRAC-0005 | contributor |
| TRAC-0006 | TRAC-0002 | TRAC-0003 | observer |
| TRAC-0007 | TRAC-0007 | TRAC-0002 | owner |
| TRAC-0008 | TRAC-0001 | TRAC-0002 | observer |

**t_measurement_with_precision**

| id | measurement |
| --- | --- |
| PREC-0001 | seismic amplitude |
| PREC-0002 | seismic amplitude |
| PREC-0003 | acoustic decibels |
| PREC-0004 | seismic amplitude |
| PREC-0005 | voltage drop |
| PREC-0006 | GPS accuracy |
| PREC-0007 | barometric pressure |
| PREC-0008 | particulate count |

**t_measurement_with_precision_precision**

| id | precision |
| --- | --- |
| PREC-0001 | ±10 ppm |
| PREC-0002 | 1 sigma |
| PREC-0003 | 10 µs |
| PREC-0004 | 0.001 K |
| PREC-0005 | ±0.2% FS |
| PREC-0006 | 0.1 dB |
| PREC-0007 | 32-bit |
| PREC-0008 | 0.001 K |

**t_measurement_with_precision__precision**

| id | measurement_id | precision_id | role |
| --- | --- | --- | --- |
| PREC-0001 | PREC-0003 | PREC-0008 | contributor |
| PREC-0002 | PREC-0008 | PREC-0007 | reviewer |
| PREC-0003 | PREC-0004 | PREC-0007 | owner |
| PREC-0004 | PREC-0007 | PREC-0001 | reviewer |
| PREC-0005 | PREC-0005 | PREC-0006 | observer |
| PREC-0006 | PREC-0007 | PREC-0007 | reviewer |
| PREC-0007 | PREC-0001 | PREC-0008 | contributor |
| PREC-0008 | PREC-0008 | PREC-0002 | reviewer |