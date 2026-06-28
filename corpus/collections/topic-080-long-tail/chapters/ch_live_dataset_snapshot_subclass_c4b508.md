---
chapter_id: ch_live_dataset_snapshot_subclass_c4b508
topic_id: 80
family: 07_long_tail
cited_terms: ['dataset_snapshot_subclass', 'ebpfprogram_loaded_in_kernel', 'lineage_edge_describes_column_flow']
model: engine-refine
---

Data lineage and provenance are captured through a normalized schema that separates measured quantities from their categorical metadata, ensuring that analytical queries can distinguish between quantitative observations and their descriptive context. The fact tables—`fact_dataset`, `fact_ebpfprogram`, and `fact_lineage`—each carry an `identifier` column (`id`) that serves as the primary key for individual records, alongside `size_bytes` and `version` attributes that track the physical footprint and revision state of the entity being recorded. A dataset snapshot such as `SNAP-0001` occupies 350,697,080 bytes at version 10, while its counterpart `SNAP-0004` reaches 676,110,880 bytes at version 5, illustrating how storage requirements and version numbers vary independently across the collection. Similarly, eBPF program records like `KERN-0001` and `KERN-0002` carry sizes of 784,335,640 and 641,704,069 bytes respectively, both at version 12 and 9, demonstrating that versioning encodes a separate lifecycle dimension from binary size.

**fact_dataset**

| id | snapshot_of_key | size_bytes | version |
| --- | --- | --- | --- |
| SNAP-0001 | SNAP-0004 | 350697080 | 10 |
| SNAP-0002 | SNAP-0003 | 501391865 | 2 |
| SNAP-0003 | SNAP-0002 | 31504133 | 5 |
| SNAP-0004 | SNAP-0003 | 676110880 | 5 |
| SNAP-0005 | SNAP-0002 | 632357991 | 7 |
| SNAP-0006 | SNAP-0001 | 81640033 | 1 |
| SNAP-0007 | SNAP-0007 | 351254327 | 12 |
| SNAP-0008 | SNAP-0001 | 94866870 | 11 |

**fact_ebpfprogram**

| id | loaded_in_key | size_bytes | version |
| --- | --- | --- | --- |
| KERN-0001 | KERN-0003 | 784335640 | 12 |
| KERN-0002 | KERN-0002 | 641704069 | 9 |
| KERN-0003 | KERN-0006 | 113209263 | 11 |
| KERN-0004 | KERN-0004 | 161013093 | 12 |
| KERN-0005 | KERN-0004 | 352203820 | 12 |
| KERN-0006 | KERN-0001 | 167519051 | 1 |

The categorical and descriptive metadata for these entities are externalized into dedicated dimension tables, linked through foreign-key columns that establish the referential backbone of the model. The `snapshot_of_key` in `fact_dataset` resolves to `dim_snapshot_of`, where each `id` is paired with a `snapshot_of_label` (classified as `misc` metadata) and a `snapshot_of_category` (classified as `category`). A record referencing `SNAP-0003` in its `snapshot_of_key` column points to a dimension entry whose label reads "Snapshot Of Label 03" and whose category is "Snapshot Of Category 03." The same pattern governs `fact_ebpfprogram`, whose `loaded_in_key` column references `dim_loaded_in`, pairing identifiers such as `KERN-0001` with labels like "Loaded In Label 01" and categories such as "Loaded In Category 01." This separation of concerns—quantitative facts in one set of tables, qualitative descriptors in another—allows the schema to support many-to-one relationships where multiple fact records may share the same categorical classification without duplication.

**dim_snapshot_of**

| id | snapshot_of_label | snapshot_of_category |
| --- | --- | --- |
| SNAP-0001 | Snapshot Of Label 01 | Snapshot Of Category 01 |
| SNAP-0002 | Snapshot Of Label 02 | Snapshot Of Category 02 |
| SNAP-0003 | Snapshot Of Label 03 | Snapshot Of Category 03 |
| SNAP-0004 | Snapshot Of Label 04 | Snapshot Of Category 04 |
| SNAP-0005 | Snapshot Of Label 05 | Snapshot Of Category 05 |
| SNAP-0006 | Snapshot Of Label 06 | Snapshot Of Category 06 |
| SNAP-0007 | Snapshot Of Label 07 | Snapshot Of Category 07 |

**dim_loaded_in**

| id | loaded_in_label | loaded_in_category |
| --- | --- | --- |
| KERN-0001 | Loaded In Label 01 | Loaded In Category 01 |
| KERN-0002 | Loaded In Label 02 | Loaded In Category 02 |
| KERN-0003 | Loaded In Label 03 | Loaded In Category 03 |
| KERN-0004 | Loaded In Label 04 | Loaded In Category 04 |
| KERN-0005 | Loaded In Label 05 | Loaded In Category 05 |
| KERN-0006 | Loaded In Label 06 | Loaded In Category 06 |

The lineage tracking table, `fact_lineage`, introduces a distinct analytical dimension by recording the confidence and uncertainty associated with column-level data flow observations. Each lineage record carries an `identifier` (`id`), a `describes_column_flow_key` that references `dim_describes_column_flow`, and three numeric attributes: `confidence`, `uncertainty`, and `value` (the latter classified as `misc`). The `confidence` field holds a probability-like value between 0 and 1—record `FLOW-0001` reports 0.645, while `FLOW-0004` reaches 0.779, and `FLOW-0002` drops to 0.071—indicating the model's or system's degree of certainty about the provenance claim. The `uncertainty` field, measured in absolute units, ranges from 76.69 for `FLOW-0003` to 708.23 for `FLOW-0004`, providing a complementary measure of dispersion or error bound. The `value` column, also `misc`, records the observed quantity itself—259.55 through 903.86 across the sample—allowing downstream consumers to correlate confidence levels with the magnitude of the underlying measurement.

**fact_lineage**

| id | describes_column_flow_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| FLOW-0001 | FLOW-0006 | 0.645 | 612.22 | 903.86 |
| FLOW-0002 | FLOW-0005 | 0.071 | 133.03 | 832.18 |
| FLOW-0003 | FLOW-0004 | 0.404 | 76.69 | 862.00 |
| FLOW-0004 | FLOW-0005 | 0.779 | 708.23 | 259.55 |
| FLOW-0005 | FLOW-0002 | 0.376 | 801.99 | 986.33 |
| FLOW-0006 | FLOW-0003 | 0.744 | 956.79 | 34.40 |

The foreign-key relationships between fact and dimension tables form a star-schema topology that supports both drill-down and roll-up analysis. `fact_lineage.describes_column_flow_key` resolves to `dim_describes_column_flow`, where identifiers such as `FLOW-0001` are annotated with a `describes_column_flow_label` ("Describes Column Flow Label 01") and a `describes_column_flow_category` ("Describes Column Flow Category 01"). This structure ensures that every provenance assertion can be classified and filtered by its categorical context without embedding that classification within the fact table itself. The `misc` columns across all dimension tables—`snapshot_of_label`, `loaded_in_label`, and `describes_column_flow_label`—serve as human-readable descriptors that remain decoupled from the analytical keys, enabling label changes or localization without altering the referential integrity of the fact records. Together, these tables provide a complete provenance framework: identifiers anchor each record, sizes and versions track physical and revision state, foreign keys connect observations to their categorical taxonomy, and confidence-uncertainty pairs quantify the reliability of lineage claims.

**dim_describes_column_flow**

| id | describes_column_flow_label | describes_column_flow_category |
| --- | --- | --- |
| FLOW-0001 | Describes Column Flow Label 01 | Describes Column Flow Category 01 |
| FLOW-0002 | Describes Column Flow Label 02 | Describes Column Flow Category 02 |
| FLOW-0003 | Describes Column Flow Label 03 | Describes Column Flow Category 03 |
| FLOW-0004 | Describes Column Flow Label 04 | Describes Column Flow Category 04 |
| FLOW-0005 | Describes Column Flow Label 05 | Describes Column Flow Category 05 |
| FLOW-0006 | Describes Column Flow Label 06 | Describes Column Flow Category 06 |
| FLOW-0007 | Describes Column Flow Label 07 | Describes Column Flow Category 07 |