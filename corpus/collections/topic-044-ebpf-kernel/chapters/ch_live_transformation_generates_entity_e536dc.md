---
chapter_id: ch_live_transformation_generates_entity_e536dc
topic_id: 44
family: 05_provo_lineage
cited_terms: ['transformation_generates_entity', 'ebpfprogram_writes_to_map', 'counter_metric_subclass']
model: engine-refine
---

The governance of data transformation pipelines and kernel-level observability infrastructure rests upon a dual architecture of dimensional classification and factual measurement. Transformation workflows—such as the schema migration routine, batch ingestion pipeline, archival compression job, and feature engineering step—are each assigned a unique identifier (ENTI-0001 through ENTI-0004) and tracked against the entities they produce, whether calibrated sensor readings, feature matrices, or cleaned telemetry datasets. Each transformation carries a measured duration, ranging from 2,309.83 seconds for the batch ingestion pipeline to 6,875.45 seconds for the feature engineering step, all recorded within the execution phase. This temporal accounting provides the audit trail necessary for capacity planning and compliance verification, ensuring that every data movement operation can be traced from initiation through completion with deterministic timing.

**t_transformation_generates_entity**

| id | transformation | generates_entity | duration_seconds | phase |
| --- | --- | --- | --- | --- |
| ENTI-0001 | schema migration routine | calibrated sensor readings | 5649.07 | execution |
| ENTI-0002 | batch ingestion pipeline | feature matrix | 2309.83 | execution |
| ENTI-0003 | archival compression job | feature matrix | 2913.69 | execution |
| ENTI-0004 | feature engineering step | cleaned telemetry dataset | 6875.45 | execution |
| ENTI-0005 | telemetry aggregation task | feature matrix | 2931.10 | closeout |
| ENTI-0006 | batch ingestion pipeline | reconciliation report | 4817.44 | review |

At the kernel level, eBPF programs are catalogued through a fact table that records their interaction with maps—the in-kernel data structures that serve as the primary mechanism for program-to-program and program-to-user-space communication. Each program is identified by a map-level key (MAP-0001 through MAP-0004) and carries a size measurement that reflects its compiled footprint, with values spanning from 113,209,263 bytes for the smallest program to 784,335,640 bytes for the largest. Version numbers (ranging from 9 to 12) provide the lineage necessary for change management and rollback procedures. The writes_to_map_key column establishes the foreign-key linkage to the dimensional classification of map types, enabling the separation of mutable measurement data from its categorical metadata.

**fact_ebpfprogram**

| id | writes_to_map_key | size_bytes | version |
| --- | --- | --- | --- |
| MAP-0001 | MAP-0003 | 784335640 | 12 |
| MAP-0002 | MAP-0005 | 641704069 | 9 |
| MAP-0003 | MAP-0003 | 113209263 | 11 |
| MAP-0004 | MAP-0001 | 161013093 | 12 |
| MAP-0005 | MAP-0002 | 352203820 | 12 |
| MAP-0006 | MAP-0006 | 167519051 | 1 |

The dimensional table for map classifications provides the categorical and labeling infrastructure that supports the factual records. Each map identifier (MAP-0001 through MAP-0004) is associated with a human-readable label (Writes To Map Label 01 through Writes To Map Label 04) and a category designation (Writes To Map Category 01 through Writes To Map Category 04). This separation of concerns—where factual programs carry only the foreign key reference while the dimension table holds the descriptive attributes—ensures that categorical reclassification can occur without modifying the measurement records themselves. The pattern mirrors standard dimensional modeling practices, where the fact table remains stable and the dimension table absorbs the volatility of business definitions.

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

A parallel structure governs the measurement of counter-based observability data. The counter fact table records each metric instance with an identifier (METR-0001 through METR-0004), a size measurement ranging from 422,660,739 bytes to 977,102,405 bytes, and a version number spanning from 5 to 12. The metric_kind_key column references the dimension table for metric kinds, which provides labels (Metric Kind Label 01 through Metric Kind Label 04) and categories (Metric Kind Category 01 through Metric Kind Category 04) for each classification. Notably, multiple counter records may reference the same metric kind—METR-0003 is referenced by both METR-0003 and METR-0004—demonstrating the one-to-many relationship that is fundamental to this modeling approach.

**fact_counter**

| id | metric_kind_key | size_bytes | version |
| --- | --- | --- | --- |
| METR-0001 | METR-0005 | 977102405 | 12 |
| METR-0002 | METR-0004 | 609833100 | 8 |
| METR-0003 | METR-0003 | 881633277 | 7 |
| METR-0004 | METR-0003 | 422660739 | 5 |

**dim_metric_kind**

| id | metric_kind_label | metric_kind_category |
| --- | --- | --- |
| METR-0001 | Metric Kind Label 01 | Metric Kind Category 01 |
| METR-0002 | Metric Kind Label 02 | Metric Kind Category 02 |
| METR-0003 | Metric Kind Label 03 | Metric Kind Category 03 |
| METR-0004 | Metric Kind Label 04 | Metric Kind Category 04 |
| METR-0005 | Metric Kind Label 05 | Metric Kind Category 05 |
| METR-0006 | Metric Kind Label 06 | Metric Kind Category 06 |
| METR-0007 | Metric Kind Label 07 | Metric Kind Category 07 |

The consistency of the dimensional model across both eBPF program and counter domains reflects a deliberate governance strategy. Both fact tables employ the same columnar pattern: an identifier, a foreign key to a classification dimension, a size measurement in bytes, and a version number. This uniformity simplifies the construction of cross-domain queries and enables aggregate reporting on resource consumption, version distribution, and categorical coverage. The phase column in the transformation table, uniformly set to execution, indicates that the current governance scope captures only live operational data, with historical or planned phases reserved for future expansion. Together, these tables form a coherent framework for tracking the lifecycle of data transformations and kernel observability programs, providing the evidentiary basis required for compliance audits, capacity forecasts, and operational incident response.