---
chapter_id: ch_live_ebpfprogram_writes_to_map_32a42b
topic_id: 20
family: 04_ebpf_kernel
cited_terms: ['ebpfprogram_writes_to_map', 'measurement_equiv_with_dim_unit', 'verification_traces_requirement']
model: engine-refine
---

The integrity of any governance framework rests upon the unambiguous identification of its constituent elements. Within this relational architecture, the `identifier` serves as the immutable primary key, anchoring records across disparate domains—ranging from `MAP-0001` through `MAP-0004` for eBPF program mappings, to `UNIT-0001` for measurement equivalencies, and `REQU-0001` for verification trace requirements. These identifiers do not merely label static rows; they function as the `entity` reference points that bind dynamic attribute values to their respective contexts. When a compliance event occurs, such as a Functional Safety Assessment or a Type Certification Review, the `entity` identifier ensures that the resulting telemetry and audit artifacts are permanently affixed to the correct operational baseline, preventing data fragmentation during cross-referencing.

**t_measurement_equiv_with_dim_unit**

| id | measurement |
| --- | --- |
| UNIT-0001 | packet_loss_rate |
| UNIT-0002 | motor_rpm |
| UNIT-0003 | motor_rpm |
| UNIT-0004 | bandwidth_utilization |
| UNIT-0005 | packet_loss_rate |
| UNIT-0006 | storage_capacity |
| UNIT-0007 | core_temperature |

**t_measurement_equiv_with_dim_unit_dimension**

| id | dimension |
| --- | --- |
| UNIT-0001 | temporal_interval |
| UNIT-0002 | test_phase |
| UNIT-0003 | firmware_version |
| UNIT-0004 | test_phase |
| UNIT-0005 | sampling_rate |
| UNIT-0006 | device_class |

**t_measurement_equiv_with_dim_unit_unit**

| id | unit |
| --- | --- |
| UNIT-0001 | microseconds |
| UNIT-0002 | terabytes |
| UNIT-0003 | milligrams_per_deciliter |
| UNIT-0004 | percent_volume |
| UNIT-0005 | cells_per_microliter |
| UNIT-0006 | microseconds |
| UNIT-0007 | microseconds |
| UNIT-0008 | milligrams_per_deciliter |

**t_verification_traces_requirement**

| id | verification |
| --- | --- |
| REQU-0001 | Functional Safety Assessment |
| REQU-0002 | Type Certification Review |
| REQU-0003 | ISO 9001 Compliance Audit |
| REQU-0004 | FAT Factory Acceptance |
| REQU-0005 | Type Certification Review |
| REQU-0006 | Type Certification Review |

**t_verification_traces_requirement_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| REQU-0001 | duration_seconds | xsd:decimal |
| REQU-0002 | end_time | xsd:dateTime |
| REQU-0003 | exit_code | xsd:integer |
| REQU-0004 | host_name | xsd:string |
| REQU-0005 | log_level | xsd:string |
| REQU-0006 | phase | xsd:string |
| REQU-0007 | retry_count | xsd:integer |
| REQU-0008 | scheduled_at | xsd:dateTime |

**t_verification_traces_requirement_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0002 | 2025-01-18T10:03:30 |
| REQU-0002 | REQU-0001 | REQU-0008 | 2023-06-09T08:44:28 |
| REQU-0003 | REQU-0001 | REQU-0009 | 2025-02-02T23:23:29 |
| REQU-0004 | REQU-0002 | REQU-0002 | 2024-03-08T07:44:16 |
| REQU-0005 | REQU-0002 | REQU-0008 | 2024-10-17T04:41:38 |
| REQU-0006 | REQU-0002 | REQU-0009 | 2024-09-18T04:36:09 |
| REQU-0007 | REQU-0003 | REQU-0002 | 2025-05-20T16:00:41 |
| REQU-0008 | REQU-0003 | REQU-0008 | 2025-05-09T00:47:08 |

**t_verification_traces_requirement_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0001 | 5386.82 |
| REQU-0002 | REQU-0002 | REQU-0001 | 3098.08 |
| REQU-0003 | REQU-0003 | REQU-0001 | 4624.20 |
| REQU-0004 | REQU-0004 | REQU-0001 | 6273.82 |
| REQU-0005 | REQU-0005 | REQU-0001 | 833.29 |
| REQU-0006 | REQU-0006 | REQU-0001 | 3490.28 |

**t_verification_traces_requirement_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0003 | 954 |
| REQU-0002 | REQU-0001 | REQU-0007 | 329 |
| REQU-0003 | REQU-0002 | REQU-0003 | 641 |
| REQU-0004 | REQU-0002 | REQU-0007 | 69 |
| REQU-0005 | REQU-0003 | REQU-0003 | 829 |
| REQU-0006 | REQU-0003 | REQU-0007 | 87 |
| REQU-0007 | REQU-0004 | REQU-0003 | 46 |
| REQU-0008 | REQU-0004 | REQU-0007 | 237 |

**t_verification_traces_requirement_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0004 | gw-12 |
| REQU-0002 | REQU-0001 | REQU-0005 | Log Level 02 |
| REQU-0003 | REQU-0001 | REQU-0006 | execution |
| REQU-0004 | REQU-0001 | REQU-0010 | complete |
| REQU-0005 | REQU-0001 | REQU-0011 | Triggered By 05 |
| REQU-0006 | REQU-0002 | REQU-0004 | ingest-21 |
| REQU-0007 | REQU-0002 | REQU-0005 | Log Level 07 |
| REQU-0008 | REQU-0002 | REQU-0006 | execution |

Attribute definitions govern the semantic structure of the data, dictating both the nature of the information captured and its permissible formats. The `attr` column specifies the property name—such as `duration_seconds`, `end_time`, `exit_code`, or `host_name`—while the corresponding `attr type` enforces strict schema compliance using standard data definitions like `xsd:decimal`, `xsd:dateTime`, `xsd:integer`, and `xsd:string`. This typed enforcement is critical when ingesting heterogeneous evidence; for instance, a decimal value of `5386.82` must be routed to a dedicated decimal valuation table, whereas a timestamp like `2025-01-18T10:03:30` requires a datetime-specific store. By segregating these `misc` values into type-specific containers, the system preserves data fidelity and eliminates the ambiguity inherent in untyped string storage.

The relational model relies on associative structures to map complex dependencies between measurement units, dimensions, and verification requirements. In these junction tables, the `subject` and `target` columns act as foreign keys, establishing directional links between a source measurement—such as `packet_loss_rate` or `motor_rpm`—and its associated dimension or unit. The nature of this linkage is further qualified by the `role` attribute, which designates the operational relationship, assigning entities as `owner`, `reviewer`, or `observer`. To prevent over-association, the `cardinality note` provides explicit constraints on the relationship, ensuring that a single measurement unit, such as `microseconds` or `terabytes`, is bound to its corresponding measurement according to predefined business rules, such as `Cardinality Note 01` or `Cardinality Note 02`.

**t_measurement_equiv_with_dim_unit__dimension**

| id | measurement_id | dimension_id | role |
| --- | --- | --- | --- |
| UNIT-0001 | UNIT-0002 | UNIT-0001 | reviewer |
| UNIT-0002 | UNIT-0006 | UNIT-0006 | owner |
| UNIT-0003 | UNIT-0001 | UNIT-0002 | observer |
| UNIT-0004 | UNIT-0004 | UNIT-0003 | owner |
| UNIT-0005 | UNIT-0007 | UNIT-0003 | owner |
| UNIT-0006 | UNIT-0002 | UNIT-0002 | reviewer |
| UNIT-0007 | UNIT-0006 | UNIT-0004 | owner |
| UNIT-0008 | UNIT-0001 | UNIT-0006 | reviewer |

**t_measurement_equiv_with_dim_unit__unit**

| id | measurement_id | unit_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| UNIT-0001 | UNIT-0001 | UNIT-0001 | owner | Cardinality Note 01 |
| UNIT-0002 | UNIT-0006 | UNIT-0008 | owner | Cardinality Note 02 |
| UNIT-0003 | UNIT-0004 | UNIT-0003 | reviewer | Cardinality Note 03 |
| UNIT-0004 | UNIT-0002 | UNIT-0007 | reviewer | Cardinality Note 04 |
| UNIT-0005 | UNIT-0002 | UNIT-0008 | contributor | Cardinality Note 05 |
| UNIT-0006 | UNIT-0004 | UNIT-0004 | reviewer | Cardinality Note 06 |
| UNIT-0007 | UNIT-0001 | UNIT-0005 | contributor | Cardinality Note 07 |
| UNIT-0008 | UNIT-0003 | UNIT-0003 | reviewer | Cardinality Note 08 |

Beyond structural relationships, the framework maintains a comprehensive metadata registry to track the classification and physical characteristics of system components. The `category` column provides a high-level taxonomy for classification, grouping items under labels such as `Writes To Map Category 01` or `Writes To Map Category 02`. Simultaneously, the `size_bytes` metric offers a precise quantification of resource consumption, capturing values as substantial as `784335640` bytes for specific eBPF programs. Finally, the `version` attribute ensures traceability across system updates, allowing auditors to correlate specific program states—such as version `12` or `9`—with their corresponding compliance artifacts, thereby maintaining a complete and auditable lineage from deployment to verification.

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