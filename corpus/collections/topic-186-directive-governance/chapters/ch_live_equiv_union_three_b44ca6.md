---
chapter_id: ch_live_equiv_union_three_b44ca6
topic_id: 186
family: 01_foundation
cited_terms: ['equiv_union_three', 'annotation_assigned_by', 'measurement_subclass']
model: engine-refine
---

Identifiers serve as the immutable keys that anchor every entity within the data fabric, enabling unambiguous reference across distributed systems. Each entity—whether a telemetry stream, a governance policy, or a measurement subclass—receives a scoped identifier such as `THRE-0001` through `THRE-0004` for equivalence-class records, `ASSI-0001` through `ASSI-0004` for annotation assignments, and `MEAS-0001` through `MEAS-0004` for measurement definitions. These identifiers are not arbitrary; they encode provenance through their prefixes, distinguishing equivalence unions from annotation records and measurement subclasses. An entity is the conceptual thing being described or tracked—a compliance audit annotation, a telemetry ingestion event, a provenance trace—and the identifier is its persistent handle, allowing downstream consumers to resolve, query, and relate entities without ambiguity.

**t_equiv_union_three**

| id | equiv | equiv_2 | equiv_3 | equiv_4 |
| --- | --- | --- | --- | --- |
| THRE-0001 | telemetry_stream_alpha | switch_board | idle_mode | flat_text |
| THRE-0002 | governance_policy_alpha | firewall_rule | rate_limit | json_payload |
| THRE-0003 | governance_policy_alpha | backup_node | maintenance_window | protobuf_msg |
| THRE-0004 | metadata_registry | primary_gateway | rate_limit | yaml_config |
| THRE-0005 | governance_policy_alpha | relay_module | error_recovery | parquet_file |

**t_measurement_subclass**

| id | measurement |
| --- | --- |
| MEAS-0001 | Heart rate |
| MEAS-0002 | Seismic magnitude |
| MEAS-0003 | Soil moisture |
| MEAS-0004 | Soil moisture |
| MEAS-0005 | Bandwidth throughput |
| MEAS-0006 | Seismic magnitude |

**t_measurement_subclass_dimension**

| id | dimension |
| --- | --- |
| MEAS-0001 | Electric current |
| MEAS-0002 | Power |
| MEAS-0003 | Energy |
| MEAS-0004 | Mass |
| MEAS-0005 | Mass |
| MEAS-0006 | Luminous intensity |

Attributes attach descriptive properties to entities, and each attribute carries a declared type that governs how its values are stored, validated, and interpreted. The attribute schema defines names such as `confidence`, `dimension_kind`, `method`, and `recorded_at`, each bound to an XML Schema datatype: `xsd:decimal` for numeric precision, `xsd:string` for free-form text, and `xsd:dateTime` for temporal stamps. This type discipline ensures that a confidence score like `0.167` or `0.404` is always treated as a decimal, that a dimension kind such as `Dimension Kind 01` is always a string, and that a recording timestamp like `2025-05-21T21:38:03` is always a datetime. The separation of attribute definition from attribute value allows the schema to evolve independently of the data, supporting new attributes without restructuring existing stores.

Attribute values are materialized in type-specific value tables, each keyed by a composite of the value record identifier, the entity it belongs to, and the attribute it populates. Decimal values—such as `103.53` and `863.30`—reside in the decimal value store, string values like `calibration record` and `Encoding 02` in the varchar store, and temporal values such as `2024-06-17T00:22:41` and `2025-01-30T17:11:59` in the datetime store. This normalization by type enables efficient indexing and query optimization: a range query on confidence scores does not need to parse strings, and a temporal sort on recording dates does not need to coerce decimals. The entity identifier in each value row ties the materialized fact back to its parent annotation, whether that annotation was assigned by `policy_engine_v2`, `catalog_sync_daemon`, `schema_registry_service`, or `etl_pipeline_runner`.

**t_annotation_assigned_by**

| id | annotation | assigned_by |
| --- | --- | --- |
| ASSI-0001 | compliance_audit | policy_engine_v2 |
| ASSI-0002 | telemetry_ingestion | catalog_sync_daemon |
| ASSI-0003 | provenance_trace | schema_registry_service |
| ASSI-0004 | provenance_trace | etl_pipeline_runner |
| ASSI-0005 | source_system_sync | data_steward_cli |
| ASSI-0006 | source_system_sync | catalog_sync_daemon |

**t_annotation_assigned_by_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ASSI-0001 | confidence | xsd:decimal |
| ASSI-0002 | dimension_kind | xsd:string |
| ASSI-0003 | method | xsd:string |
| ASSI-0004 | recorded_at | xsd:dateTime |
| ASSI-0005 | uncertainty | xsd:decimal |
| ASSI-0006 | unit | xsd:string |
| ASSI-0007 | value | xsd:decimal |
| ASSI-0008 | encoding | xsd:string |

**t_annotation_assigned_by_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ASSI-0001 | ASSI-0001 | ASSI-0004 | 2025-05-21T21:38:03 |
| ASSI-0002 | ASSI-0002 | ASSI-0004 | 2024-06-17T00:22:41 |
| ASSI-0003 | ASSI-0003 | ASSI-0004 | 2023-06-05T19:53:01 |
| ASSI-0004 | ASSI-0004 | ASSI-0004 | 2025-01-30T17:11:59 |
| ASSI-0005 | ASSI-0005 | ASSI-0004 | 2023-08-08T10:34:13 |
| ASSI-0006 | ASSI-0006 | ASSI-0004 | 2023-06-13T10:27:19 |

**t_annotation_assigned_by_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ASSI-0001 | ASSI-0001 | ASSI-0001 | 0.167 |
| ASSI-0002 | ASSI-0001 | ASSI-0005 | 103.53 |
| ASSI-0003 | ASSI-0001 | ASSI-0007 | 863.30 |
| ASSI-0004 | ASSI-0002 | ASSI-0001 | 0.404 |
| ASSI-0005 | ASSI-0002 | ASSI-0005 | 720.81 |
| ASSI-0006 | ASSI-0002 | ASSI-0007 | 58.05 |
| ASSI-0007 | ASSI-0003 | ASSI-0001 | 0.783 |
| ASSI-0008 | ASSI-0003 | ASSI-0005 | 338.86 |

**t_annotation_assigned_by_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ASSI-0001 | ASSI-0001 | ASSI-0002 | Dimension Kind 01 |
| ASSI-0002 | ASSI-0001 | ASSI-0008 | Encoding 02 |
| ASSI-0003 | ASSI-0001 | ASSI-0009 | calibration record |
| ASSI-0004 | ASSI-0001 | ASSI-0010 | de |
| ASSI-0005 | ASSI-0001 | ASSI-0003 | hybrid |
| ASSI-0006 | ASSI-0001 | ASSI-0006 | nm |
| ASSI-0007 | ASSI-0002 | ASSI-0002 | Dimension Kind 07 |
| ASSI-0008 | ASSI-0002 | ASSI-0008 | Encoding 08 |

Relationships between entities are expressed through subject–target pairs annotated with a role, which captures the semantic nature of the connection. In the measurement-to-dimension mapping, a measurement such as `Soil moisture` (identified as `MEAS-0004`) is linked to a dimension like `Electric current` (identified as `MEAS-0003`) with the role `owner`, indicating that the measurement owns or defines that dimension. The same measurement may link to `Power` (identified as `MEAS-0005`) with the role `reviewer`, indicating a different kind of relationship. Roles such as `owner` and `reviewer` provide the relational glue that transforms a flat set of entities into a navigable graph, enabling queries like "which dimensions does this measurement own" or "which measurements review this dimension."

**t_measurement_subclass__dimension**

| id | measurement_id | dimension_id | role |
| --- | --- | --- | --- |
| MEAS-0001 | MEAS-0004 | MEAS-0003 | owner |
| MEAS-0002 | MEAS-0004 | MEAS-0005 | owner |
| MEAS-0003 | MEAS-0006 | MEAS-0005 | reviewer |
| MEAS-0004 | MEAS-0005 | MEAS-0001 | reviewer |
| MEAS-0005 | MEAS-0003 | MEAS-0002 | owner |
| MEAS-0006 | MEAS-0005 | MEAS-0006 | contributor |
| MEAS-0007 | MEAS-0003 | MEAS-0006 | contributor |
| MEAS-0008 | MEAS-0004 | MEAS-0001 | contributor |

Equivalence relationships extend the graph beyond direct ownership and review, allowing entities from different domains to be recognized as functionally interchangeable. A telemetry stream named `telemetry_stream_alpha` may be equivalent to a governance policy named `governance_policy_alpha` in the context of a `switch_board` operating in `idle_mode` with a `flat_text` encoding, while the same governance policy may also be equivalent to a `metadata_registry` in the context of a `backup_node` operating in `maintenance_window` with a `protobuf_msg` encoding. These equivalence unions—each identified by a `THRE-` prefix—capture the many-to-many mappings that arise in complex systems where a single logical concept manifests across multiple technical abstractions, each with its own format, mode, and infrastructure role.