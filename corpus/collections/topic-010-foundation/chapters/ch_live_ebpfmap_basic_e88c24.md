---
chapter_id: ch_live_ebpfmap_basic_e88c24
topic_id: 10
family: 04_ebpf_kernel
cited_terms: ['ebpfmap_basic', 'measurement_of_artifact', 'allocation_subclass']
model: engine-refine
---

The governance of artifact measurements rests upon a disciplined attribute model wherein each property is declared with an explicit type constraint before any value is admitted. The attribute catalogue enumerates named properties such as confidence, dimension_kind, method, and recorded_at, each bound to a schema namespace—xsd:decimal, xsd:string, or xsd:dateTime—that governs the shape of admissible data. This type discipline is not decorative; it determines which value store receives a given datum. Decimal measurements such as 0.670, 226.14, and 361.86 flow into the decimal value table, string literals like Dimension Kind 01, Encoding 02, intake form, and fr populate the varchar store, and temporal stamps including 2023-05-19T07:46:35, 2023-01-19T07:45:29, and 2024-05-29T07:18:18 are routed to the datetime repository. The separation of value stores by type enforces schema integrity at ingestion time and eliminates the ambiguity that plagues loosely typed registries.

**t_measurement_of_artifact_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ARTI-0001 | confidence | xsd:decimal |
| ARTI-0002 | dimension_kind | xsd:string |
| ARTI-0003 | method | xsd:string |
| ARTI-0004 | recorded_at | xsd:dateTime |
| ARTI-0005 | uncertainty | xsd:decimal |
| ARTI-0006 | unit | xsd:string |
| ARTI-0007 | value | xsd:decimal |
| ARTI-0008 | encoding | xsd:string |

Every attribute value is anchored to an entity, the measured artifact whose identity is expressed through a stable identifier such as ARTI-0001 or ARTI-0002. The entity table establishes the universe of measurable objects and associates each with a measurement descriptor—latency_p99_ms, yield_stress_test, pressure_transducer—that describes the nature of the observation. An entity may carry multiple attributes across multiple value stores; for instance, ARTI-0001 simultaneously holds decimal readings, categorical labels, and temporal metadata, all traceable to the same entity key. This design permits heterogeneous properties to coexist without schema collision while preserving referential clarity: every value row carries both the entity identifier and the attribute identifier, forming a composite key that guarantees each datum is attributable to a specific property of a specific artifact.

**t_measurement_of_artifact**

| id | measurement |
| --- | --- |
| ARTI-0001 | latency_p99_ms |
| ARTI-0002 | yield_stress_test |
| ARTI-0003 | latency_p99_ms |
| ARTI-0004 | pressure_transducer |
| ARTI-0005 | humidity_dew_point |
| ARTI-0006 | ambient_temp_22C |

**t_measurement_of_artifact_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0004 | 2023-05-19T07:46:35 |
| ARTI-0002 | ARTI-0002 | ARTI-0004 | 2023-01-19T07:45:29 |
| ARTI-0003 | ARTI-0003 | ARTI-0004 | 2023-07-23T03:47:45 |
| ARTI-0004 | ARTI-0004 | ARTI-0004 | 2024-05-29T07:18:18 |
| ARTI-0005 | ARTI-0005 | ARTI-0004 | 2025-04-05T23:37:46 |
| ARTI-0006 | ARTI-0006 | ARTI-0004 | 2025-01-30T06:20:58 |

**t_measurement_of_artifact_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0001 | 0.670 |
| ARTI-0002 | ARTI-0001 | ARTI-0005 | 226.14 |
| ARTI-0003 | ARTI-0001 | ARTI-0007 | 361.86 |
| ARTI-0004 | ARTI-0002 | ARTI-0001 | 0.088 |
| ARTI-0005 | ARTI-0002 | ARTI-0005 | 798.78 |
| ARTI-0006 | ARTI-0002 | ARTI-0007 | 163.07 |
| ARTI-0007 | ARTI-0003 | ARTI-0001 | 0.775 |
| ARTI-0008 | ARTI-0003 | ARTI-0005 | 896.63 |

**t_measurement_of_artifact_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0002 | Dimension Kind 01 |
| ARTI-0002 | ARTI-0001 | ARTI-0008 | Encoding 02 |
| ARTI-0003 | ARTI-0001 | ARTI-0009 | intake form |
| ARTI-0004 | ARTI-0001 | ARTI-0010 | fr |
| ARTI-0005 | ARTI-0001 | ARTI-0003 | manual |
| ARTI-0006 | ARTI-0001 | ARTI-0006 | ratio |
| ARTI-0007 | ARTI-0002 | ARTI-0002 | Dimension Kind 07 |
| ARTI-0008 | ARTI-0002 | ARTI-0008 | Encoding 08 |

The eBPF map inventory operates under a parallel two-table architecture that separates identification and classification from quantitative and version metadata. The dimensional table assigns each map a human-readable label—Ebpfmap Label 01 through Ebpfmap Label 04—and a category designation such as Ebpfmap Category 01 or Ebpfmap Category 03, enabling administrative grouping and audit filtering. The fact table records the operational properties of each map: a unique identifier (EBPF-0001 through EBPF-0004), a key reference (EBPF-0002, EBPF-0005, EBPF-0003, EBPF-0001), a size in bytes ranging from 31105012 to 354373995, and a version number spanning 3 through 12. The size_bytes column, in particular, serves as a capacity constraint indicator; maps approaching the upper bound of several hundred megabytes warrant distinct handling in resource allocation and monitoring policies. Version numbers enable change tracking and rollback procedures, ensuring that any observed behavior can be traced to a specific map revision.

**fact_ebpfmap**

| id | ebpfmap_key | size_bytes | version |
| --- | --- | --- | --- |
| EBPF-0001 | EBPF-0002 | 208979093 | 3 |
| EBPF-0002 | EBPF-0005 | 156714508 | 6 |
| EBPF-0003 | EBPF-0003 | 31105012 | 12 |
| EBPF-0004 | EBPF-0001 | 354373995 | 5 |
| EBPF-0005 | EBPF-0002 | 866267293 | 2 |

**dim_ebpfmap**

| id | ebpfmap_label | ebpfmap_category |
| --- | --- | --- |
| EBPF-0001 | Ebpfmap Label 01 | Ebpfmap Category 01 |
| EBPF-0002 | Ebpfmap Label 02 | Ebpfmap Category 02 |
| EBPF-0003 | Ebpfmap Label 03 | Ebpfmap Category 03 |
| EBPF-0004 | Ebpfmap Label 04 | Ebpfmap Category 04 |
| EBPF-0005 | Ebpfmap Label 05 | Ebpfmap Category 05 |
| EBPF-0006 | Ebpfmap Label 06 | Ebpfmap Category 06 |

Allocation relationships are modeled through a ternary junction that binds a subject to a target under an explicit role. The subject table defines allocation subclasses—nightly-ingest, etl-daily-load, batch-prod-main—while the target table enumerates transformation engines including Celery Worker, dbt Runner, Flink TaskManager, and TensorFlow Serving. The junction table mediates between them, assigning each pairing a role of contributor, owner, or observer. For example, the allocation ALLO-0001 (nightly-ingest) assumes a contributor role with respect to the Celery Worker transformation, whereas ALLO-0003 (batch-prod-main) assumes an observer role with respect to the Flink TaskManager. This role-based linkage provides an auditable record of responsibility: contributor denotes active participation, owner denotes stewardship, and observer denotes passive monitoring. The model supports many-to-many relationships without ambiguity, as each row carries a unique identifier and explicitly declares the nature of the association.

**t_allocation_subclass**

| id | allocation |
| --- | --- |
| ALLO-0001 | nightly-ingest |
| ALLO-0002 | etl-daily-load |
| ALLO-0003 | batch-prod-main |
| ALLO-0004 | batch-prod-main |
| ALLO-0005 | audit-log-rotate |
| ALLO-0006 | nightly-ingest |

**t_allocation_subclass_executes_transformation**

| id | executes_transformation |
| --- | --- |
| ALLO-0001 | Celery Worker |
| ALLO-0002 | dbt Runner |
| ALLO-0003 | Flink TaskManager |
| ALLO-0004 | TensorFlow Serving |
| ALLO-0005 | Ray Actor |
| ALLO-0006 | Pandas Engine |

**t_allocation_subclass__executes_transformation**

| id | allocation_id | executes_transformation_id | role |
| --- | --- | --- | --- |
| ALLO-0001 | ALLO-0001 | ALLO-0001 | contributor |
| ALLO-0002 | ALLO-0002 | ALLO-0005 | owner |
| ALLO-0003 | ALLO-0004 | ALLO-0006 | observer |
| ALLO-0004 | ALLO-0005 | ALLO-0004 | contributor |
| ALLO-0005 | ALLO-0001 | ALLO-0003 | reviewer |
| ALLO-0006 | ALLO-0004 | ALLO-0006 | owner |
| ALLO-0007 | ALLO-0004 | ALLO-0004 | reviewer |
| ALLO-0008 | ALLO-0005 | ALLO-0006 | observer |