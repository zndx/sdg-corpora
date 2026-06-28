---
chapter_id: ch_live_ebpfprogram_governed_by_security_policy_5bde8b
topic_id: 44
family: 04_ebpf_kernel
cited_terms: ['ebpfprogram_governed_by_security_policy', 'subclass_not_basic', 'transformation_generates_entity']
model: engine-refine
---

The governance of eBPF program artifacts rests on a structured registry that captures both their technical characteristics and their operational provenance. Each program is assigned a unique identifier—POLI-0001 through POLI-0004 in the current inventory—serving as the primary key across fact and dimension tables. The fact table records the binary footprint of each program, with size_bytes ranging from 113,209,263 bytes for POLI-0003 to 784,335,640 bytes for POLI-0001, and a version number that tracks revisions across the set, encompassing versions 9, 11, and 12. The ebpfprogram_key column provides an additional linkage layer, permitting multiple fact records to reference the same program key—POLI-0003 appears twice as a key value, indicating either versioned snapshots or deployment variants of the same underlying program.

**fact_ebpfprogram**

| id | ebpfprogram_key | size_bytes | version |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | 784335640 | 12 |
| POLI-0002 | POLI-0003 | 641704069 | 9 |
| POLI-0003 | POLI-0003 | 113209263 | 11 |
| POLI-0004 | POLI-0005 | 161013093 | 12 |
| POLI-0005 | POLI-0004 | 352203820 | 12 |
| POLI-0006 | POLI-0003 | 167519051 | 1 |

The dimension table enriches these identifiers with categorical and descriptive metadata. Each program carries an ebpfprogram_label, such as "Ebpfprogram Label 01" or "Ebpfprogram Label 04," which functions as a human-readable designation within operational dashboards and audit trails. More structurally significant is the ebpfprogram_category field, which classifies programs into categories ranging from "Ebpfprogram Category 01" through "Ebpfprogram Category 04." This categorization enables aggregation queries across program families, supports access control policies scoped to category membership, and facilitates capacity planning by revealing the distribution of binary sizes within each category—POLI-0001, for instance, occupies Category 01 and accounts for the largest binary at 784,335,640 bytes, while POLI-0003 in Category 03 is the smallest at 113,209,263 bytes.

**dim_ebpfprogram**

| id | ebpfprogram_label | ebpfprogram_category |
| --- | --- | --- |
| POLI-0001 | Ebpfprogram Label 01 | Ebpfprogram Category 01 |
| POLI-0002 | Ebpfprogram Label 02 | Ebpfprogram Category 02 |
| POLI-0003 | Ebpfprogram Label 03 | Ebpfprogram Category 03 |
| POLI-0004 | Ebpfprogram Label 04 | Ebpfprogram Category 04 |
| POLI-0005 | Ebpfprogram Label 05 | Ebpfprogram Category 05 |
| POLI-0006 | Ebpfprogram Label 06 | Ebpfprogram Category 06 |
| POLI-0007 | Ebpfprogram Label 07 | Ebpfprogram Category 07 |
| POLI-0008 | Ebpfprogram Label 08 | Ebpfprogram Category 08 |

Beyond the program registry itself, the transformation lineage table documents the operational processes that generate or consume these artifacts. Each transformation record carries an identifier such as ENTI-0001 through ENTI-0004 and describes a specific operational routine: a schema migration routine, a batch ingestion pipeline, an archival compression job, or a feature engineering step. The generates_entity column specifies the output artifact produced by each transformation—calibrated sensor readings, a feature matrix, or a cleaned telemetry dataset—establishing a traceable chain from raw data through transformation to the eBPF programs that may subsequently process or monitor those outputs.

**t_transformation_generates_entity**

| id | transformation | generates_entity | duration_seconds | phase |
| --- | --- | --- | --- | --- |
| ENTI-0001 | schema migration routine | calibrated sensor readings | 5649.07 | execution |
| ENTI-0002 | batch ingestion pipeline | feature matrix | 2309.83 | execution |
| ENTI-0003 | archival compression job | feature matrix | 2913.69 | execution |
| ENTI-0004 | feature engineering step | cleaned telemetry dataset | 6875.45 | execution |
| ENTI-0005 | telemetry aggregation task | feature matrix | 2931.10 | closeout |
| ENTI-0006 | batch ingestion pipeline | reconciliation report | 4817.44 | review |

The duration_seconds field quantifies the execution time of each transformation, with values spanning from 2,309.83 seconds for the batch ingestion pipeline (ENTI-0002) to 6,875.45 seconds for the feature engineering step (ENTI-0004). These durations are critical for capacity planning and SLA compliance; the feature engineering step alone requires nearly two hours of compute time, while the archival compression job completes in approximately 49 minutes. All recorded transformations currently reside in the execution phase, indicating that the pipeline has progressed beyond design and validation into active production operation. The phase field, while currently uniform across the dataset, serves as a lifecycle state marker that will differentiate between stages such as design, testing, execution, and retirement as the pipeline matures.

A secondary subclass table, t_subclass_not_basic, provides an additional classification layer with identifiers NOT-0001 through NOT-0004 and two descriptive columns that distinguish between primary and secondary subclass designations. This table supports multi-dimensional categorization of entities that do not fit the basic classification scheme, enabling more granular governance policies for edge-case program variants or specialized transformation outputs. The existence of this table alongside the primary eBPF program and transformation tables reflects a design pattern common in operational data warehouses: a core fact-dimension structure augmented by auxiliary classification tables that capture attributes too specialized or infrequently used to warrant inclusion in the primary schema.

**t_subclass_not_basic**

| id | not | not_2 |
| --- | --- | --- |
| NOT-0001 | Not 01 | Not 2 01 |
| NOT-0002 | Not 02 | Not 2 02 |
| NOT-0003 | Not 03 | Not 2 03 |
| NOT-0004 | Not 04 | Not 2 04 |
| NOT-0005 | Not 05 | Not 2 05 |
| NOT-0006 | Not 06 | Not 2 06 |