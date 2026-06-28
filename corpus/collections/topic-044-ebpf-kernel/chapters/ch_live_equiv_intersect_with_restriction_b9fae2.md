---
chapter_id: ch_live_equiv_intersect_with_restriction_b9fae2
topic_id: 44
family: 01_foundation
cited_terms: ['equiv_intersect_with_restriction', 'ebpfprogram_writes_to_map', 'mass_function_only_assigns_subsets']
model: engine-refine
---

The architecture of evidence-anchored data management rests upon a disciplined separation between entities, their attributes, and the typed values those attributes hold. An entity—identified by a stable key such as `SUBS-0001` or `MAP-0001`—represents a discrete object within the system, whether it be a mass-function assignment governing data-quality constraints or an eBPF program interacting with kernel maps. Each entity carries attributes defined by name and type: `confidence` as an `xsd:decimal`, `dimension_kind` as an `xsd:string`, `method` as an `xsd:string`, and `recorded_at` as an `xsd:dateTime`. This type discipline ensures that the value store remains homogeneous per attribute, with decimal values like `0.589` and `503.17` stored separately from string values such as `Dimension Kind 01` and `Encoding 02`, and from temporal markers like `2024-10-19T15:01:03` and `2023-10-05T14:35:44`. The separation of attribute definitions from their concrete values enables schema evolution without restructuring the value tables themselves, and supports type-safe querying across heterogeneous data domains.

**t_mass_function_only_assigns_subsets_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SUBS-0001 | SUBS-0001 | SUBS-0004 | 2024-10-19T15:01:03 |
| SUBS-0002 | SUBS-0002 | SUBS-0004 | 2023-10-05T14:35:44 |
| SUBS-0003 | SUBS-0003 | SUBS-0004 | 2024-02-24T01:03:34 |
| SUBS-0004 | SUBS-0004 | SUBS-0004 | 2024-04-26T17:49:00 |
| SUBS-0005 | SUBS-0005 | SUBS-0004 | 2024-01-29T11:02:31 |
| SUBS-0006 | SUBS-0006 | SUBS-0004 | 2023-11-16T17:14:50 |

**t_mass_function_only_assigns_subsets_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SUBS-0001 | SUBS-0001 | SUBS-0001 | 0.589 |
| SUBS-0002 | SUBS-0001 | SUBS-0005 | 503.17 |
| SUBS-0003 | SUBS-0001 | SUBS-0007 | 721.15 |
| SUBS-0004 | SUBS-0002 | SUBS-0001 | 0.512 |
| SUBS-0005 | SUBS-0002 | SUBS-0005 | 595.07 |
| SUBS-0006 | SUBS-0002 | SUBS-0007 | 721.26 |
| SUBS-0007 | SUBS-0003 | SUBS-0001 | 0.645 |
| SUBS-0008 | SUBS-0003 | SUBS-0005 | 722.55 |

The `writes_to_map` construct serves as a critical nexus between programmatic behavior and dimensional metadata. In the eBPF program fact table, each program—identified by keys such as `MAP-0001` through `MAP-0004`—declares which map it writes to via the `writes_to_map_key` column, a foreign key into the dimension table `dim_writes_to_map`. This dimension table enriches the relationship with human-readable labels (`Writes To Map Label 01` through `Writes To Map Label 04`) and categorical classifications (`Writes To Map Category 01` through `Writes To Map Category 04`), providing governance-level context for what each map write operation signifies. The programs themselves carry substantial binary footprints—`size_bytes` values ranging from `113209263` to `784335640`—and version identifiers (`9`, `11`, `12`) that track evolution over time. This versioning, combined with the map-write relationship, creates an auditable chain from program binary to kernel-side data structure.

**fact_ebpfprogram**

| id | writes_to_map_key | size_bytes | version |
| --- | --- | --- | --- |
| MAP-0001 | MAP-0003 | 784335640 | 12 |
| MAP-0002 | MAP-0005 | 641704069 | 9 |
| MAP-0003 | MAP-0003 | 113209263 | 11 |
| MAP-0004 | MAP-0001 | 161013093 | 12 |
| MAP-0005 | MAP-0002 | 352203820 | 12 |
| MAP-0006 | MAP-0006 | 167519051 | 1 |

**dim_writes_to_map**

| id | writes_to_map_label | writes_to_map_category |
| --- | --- | --- |
| MAP-0001 | Writes To Map Label 01 | Writes To Map Category 01 |
| MAP-0002 | Writes To Map Label 02 | Writes To Map Category 02 |
| MAP-0003 | Writes To Map Label 03 | Writes To Map Category 03 |
| MAP-0004 | Writes To Map Label 04 | Writes To Map Category 04 |
| MAP-0005 | Writes To Map Label 05 | Writes To Map Category 05 |
| MAP-0006 | Writes To Map Label 06 | Writes To Map Category 06 |
| MAP-0007 | Writes To Map Label 07 | Writes To Map Category 07 |

Cross-cutting relationships bind these structures into a coherent evidence graph. The equivalence-intersection table `t_equiv_intersect_with_restriction` establishes that system components such as `sensor_array_gamma` and `stream_processor_8` are functionally equivalent under certain restrictions, with each equivalence record (e.g., `REST-0001`, `REST-0002`) linked to a mass-function assignment via the `related` column pointing to `SUBS-0005`, `SUBS-0004`, `SUBS-0001`, and `SUBS-0003`. These mass-function assignments, in turn, carry semantic payloads—`data_quality`, `edge_node`, `thermal_fusion`, `telemetry_confidence`—that quantify the degree to which an entity supports a given restriction. The assignment of mass values to restrictions like `REST-0001` and `REST-0003` formalizes uncertainty reasoning, where the decimal attributes of the mass-function entities (e.g., `0.589`, `0.512`) encode confidence levels in the evidence.

**t_equiv_intersect_with_restriction**

| id | equiv | equiv_2 | related |
| --- | --- | --- | --- |
| REST-0001 | sensor_array_gamma | stream_processor_8 | SUBS-0005 |
| REST-0002 | event_bus_core | sensor_bridge_delta | SUBS-0004 |
| REST-0003 | kafka_stream_primary | batch_mirror_main | SUBS-0001 |
| REST-0004 | telemetry_broker_alpha | vector_cache_prod | SUBS-0003 |
| REST-0005 | audit_log_archive | sensor_bridge_delta | SUBS-0004 |
| REST-0006 | data_lake_zone_3 | kafka_mirror_cluster | SUBS-0004 |

The practical significance of this design lies in its capacity to support both operational telemetry and formal reasoning within a single data model. An operator monitoring eBPF programs can trace a binary of `784335640` bytes, version `12`, writing to a map classified as `Writes To Map Category 03`, while a governance analyst can simultaneously query the mass-function assignments that underpin data-quality assertions across the same infrastructure. The entity-attribute-value pattern, with its typed value tables, accommodates the heterogeneity of real-world observability data—numeric metrics, categorical labels, and temporal stamps—without sacrificing the referential integrity that makes cross-domain queries possible. Identifier conventions (`REST-0001`, `SUBS-0001`, `MAP-0001`) provide a consistent addressing scheme across all tables, ensuring that the evidence graph remains navigable regardless of whether one is traversing from a restriction to its supporting mass functions, from a program to its map writes, or from an attribute definition to its concrete values.

**t_mass_function_only_assigns_subsets**

| id | mass | assigns_mass_to |
| --- | --- | --- |
| SUBS-0001 | data_quality | REST-0001 |
| SUBS-0002 | edge_node | REST-0003 |
| SUBS-0003 | thermal_fusion | REST-0004 |
| SUBS-0004 | telemetry_confidence | REST-0003 |
| SUBS-0005 | signal_integrity | REST-0003 |
| SUBS-0006 | edge_node | REST-0006 |

**t_mass_function_only_assigns_subsets_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SUBS-0001 | confidence | xsd:decimal |
| SUBS-0002 | dimension_kind | xsd:string |
| SUBS-0003 | method | xsd:string |
| SUBS-0004 | recorded_at | xsd:dateTime |
| SUBS-0005 | uncertainty | xsd:decimal |
| SUBS-0006 | unit | xsd:string |
| SUBS-0007 | value | xsd:decimal |
| SUBS-0008 | encoding | xsd:string |

**t_mass_function_only_assigns_subsets_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SUBS-0001 | SUBS-0001 | SUBS-0002 | Dimension Kind 01 |
| SUBS-0002 | SUBS-0001 | SUBS-0008 | Encoding 02 |
| SUBS-0003 | SUBS-0001 | SUBS-0009 | nightly summary |
| SUBS-0004 | SUBS-0001 | SUBS-0010 | de |
| SUBS-0005 | SUBS-0001 | SUBS-0003 | manual |
| SUBS-0006 | SUBS-0001 | SUBS-0006 | mg/L |
| SUBS-0007 | SUBS-0002 | SUBS-0002 | Dimension Kind 07 |
| SUBS-0008 | SUBS-0002 | SUBS-0008 | Encoding 08 |