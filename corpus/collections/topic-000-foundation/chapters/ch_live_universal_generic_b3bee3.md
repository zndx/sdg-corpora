---
chapter_id: ch_live_universal_generic_b3bee3
topic_id: 0
family: 01_foundation
cited_terms: ['universal_generic', 'transformation_min_one_output', 'instrument_emits_signal']
model: engine-refine
---

In any structured data fabric, the identifier serves as the immutable anchor for every entity, whether it denotes a governance framework entry such as GENE-0001, a transformation step like OUTP-0002, or an instrument signal record bearing SIGN-0004. These identifiers are not merely sequential labels; they are the stable keys that permit cross-referencing across heterogeneous tables without ambiguity. A governance framework identified as GENE-0001 may be related to a CSV Stream, while the same identifier space accommodates a Taxonomy Node (GENE-0002) related to a Parquet Format, a Validation Pattern (GENE-0004) bound to a YAML Config, and an Event Category (GENE-0003) associated with a Binary Blob. Similarly, transformation records OUTP-0001 through OUTP-0004 carry distinct processing semantics—data normalization and format conversion—while instrument signal records SIGN-0001 through SIGN-0004 each describe a physical sensing apparatus and its emitted waveform. The identifier, therefore, is the universal addressing primitive that enables every subsequent relationship to be resolved deterministically.

**t_universal_generic**

| id | universal | related |
| --- | --- | --- |
| GENE-0001 | Governance Framework | CSV Stream |
| GENE-0002 | Taxonomy Node | Parquet Format |
| GENE-0003 | Event Category | Binary Blob |
| GENE-0004 | Validation Pattern | YAML Config |
| GENE-0005 | Compliance Rule | MessagePack |
| GENE-0006 | Taxonomy Node | XML Document |
| GENE-0007 | Compliance Rule | Parquet Format |
| GENE-0008 | Data Standard | JSON Schema |

**t_instrument_emits_signal**

| id | instrument | emits_signal | size_bytes | uri |
| --- | --- | --- | --- | --- |
| SIGN-0001 | LiDAR array | Optical pulse | 193789751 | s3://lake/raw |
| SIGN-0002 | Seismometer | Ultrasonic wave | 556171171 | abfss://prod/silver |
| SIGN-0003 | Mass spectrometer | Ultrasonic wave | 279461908 | s3://lake/curated |
| SIGN-0004 | Radiometer | Heartbeat ping | 579891201 | gs://warehouse/gold |
| SIGN-0005 | Mass spectrometer | Data packet | 371526447 | abfss://prod/silver |

The subject and target fields formalize directed relationships between entities, most commonly between a transformation process and its output dataset. In the junction table linking transformations to datasets, the subject column carries the transformation identifier—OUTP-0006, for instance—while the target column carries the output dataset identifier, such as OUTP-0003 or OUTP-0001. A single subject may relate to multiple targets: OUTP-0006 appears as the subject for three distinct output datasets (OUTP-0003, OUTP-0005, OUTP-0001), each with a different role assignment. This subject-to-target linkage is the structural backbone of data lineage, allowing one to trace how a normalization or format-conversion step produces a parsed access log, a curated events table, or a standardized inventory index. The directionality is critical: the subject is the source of the relationship, the target is the recipient, and the pair together defines a directed edge in the data-flow graph.

**t_transformation_min_one_output**

| id | transformation |
| --- | --- |
| OUTP-0001 | data normalization |
| OUTP-0002 | data normalization |
| OUTP-0003 | format conversion |
| OUTP-0004 | format conversion |
| OUTP-0005 | record deduplication |
| OUTP-0006 | feature engineering |

**t_transformation_min_one_output_output_dataset**

| id | output_dataset |
| --- | --- |
| OUTP-0001 | parsed access logs |
| OUTP-0002 | curated events table |
| OUTP-0003 | curated events table |
| OUTP-0004 | standardized inventory index |
| OUTP-0005 | curated events table |
| OUTP-0006 | normalized feature set |

**t_transformation_min_one_output__output_dataset**

| id | transformation_id | output_dataset_id | role |
| --- | --- | --- | --- |
| OUTP-0001 | OUTP-0006 | OUTP-0003 | reviewer |
| OUTP-0002 | OUTP-0006 | OUTP-0005 | contributor |
| OUTP-0003 | OUTP-0006 | OUTP-0001 | contributor |
| OUTP-0004 | OUTP-0003 | OUTP-0003 | observer |
| OUTP-0005 | OUTP-0001 | OUTP-0004 | contributor |
| OUTP-0006 | OUTP-0002 | OUTP-0006 | observer |
| OUTP-0007 | OUTP-0004 | OUTP-0001 | owner |
| OUTP-0008 | OUTP-0005 | OUTP-0002 | contributor |

The role field qualifies the nature of the relationship between subject and target, distinguishing whether an entity acts as a contributor, reviewer, or observer in the context of a given linkage. In the transformation-to-dataset junction, the same transformation OUTP-0006 relates to OUTP-0003 with the role contributor, to OUTP-0005 also as contributor, and to OUTP-0001 as reviewer—indicating that the transformation both produces and validates distinct outputs. The fourth record, bearing identifier OUTP-0004, assigns the role observer to the linkage between transformation OUTP-0003 and output dataset OUTP-0003, suggesting a monitoring or audit relationship rather than direct production. Role, in this sense, is not a property of either endpoint alone but a property of the relationship itself, and it is this relational property that enables fine-grained access control, provenance tracking, and accountability in complex data pipelines.

The size_bytes field quantifies the storage footprint of emitted signals from physical instruments, providing a concrete measure of data volume at the point of ingestion. A LiDAR array emitting an Optical pulse generates a signal record of 193,789,751 bytes; a Seismometer producing an Ultrasonic wave yields 556,171,171 bytes; a Mass spectrometer's Ultrasonic wave registers 279,461,908 bytes; and a Radiometer's Heartbeat ping accounts for 579,891,201 bytes. These values are not arbitrary—they reflect the physical characteristics of the sensing apparatus, the sampling rate, and the encoding format. Size_bytes is essential for capacity planning, cost estimation, and data-tiering decisions, as it determines whether a signal should reside in hot storage, cold storage, or archival tiers.

The uri field specifies the persistent location of data within a distributed storage system, using cloud-native protocols to identify the exact path. Signal records from the LiDAR array and Mass spectrometer both point to s3://lake/raw and s3://lake/curated respectively, indicating AWS S3 buckets organized by data maturity; the Seismometer's record resides at abfss://prod/silver, denoting Azure Blob File System in a production environment at the silver layer; and the Radiometer's record is stored at gs://warehouse/gold, referencing Google Cloud Storage at the gold tier. The uri, combined with size_bytes, forms a complete addressability and sizing contract: it tells any consumer not only where to find the data but how much to expect. Together with the identifier, role, subject, and target fields, the uri completes the set of primitives that enable deterministic data discovery, lineage tracing, and operational governance across heterogeneous storage backends.