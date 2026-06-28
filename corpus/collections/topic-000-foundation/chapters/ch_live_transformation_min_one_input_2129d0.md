---
chapter_id: ch_live_transformation_min_one_input_2129d0
topic_id: 0
family: 05_provo_lineage
cited_terms: ['transformation_min_one_input', 'instrument_only_emits_type', 'observation_with_participant']
model: engine-refine
---

The governance of data transformations rests on a tripartite linkage between transformation definitions, their source datasets, and the functional role each source assumes within a given operation. The transformation registry assigns a unique identifier—such as `INPU-0001` through `INPU-0004`—to each processing rule, whether that rule performs `DataMasking`, `TimestampAlign`, or `FieldEncryption`. A companion mapping table binds each transformation to one or more input datasets, recording the dataset's identity (e.g., `NetworkTrafficLog`, `CustomerTransactions`, `PatientRecords`) and the transformation's own identifier. The junction table `t_transformation_min_one_input__input_dataset` then resolves the many-to-many relationship by pairing a `subject` (the transformation identifier) with a `target` (the input dataset identifier) and annotating the association with a `role` attribute; in the observed corpus every linkage carries the role `observer`, indicating that the dataset is consumed read-only by the transformation pipeline. This separation of concerns—definition, binding, and role annotation—ensures that audit trails can distinguish between what a transformation is, what data it touches, and how it touches it.

**t_transformation_min_one_input**

| id | transformation |
| --- | --- |
| INPU-0001 | DataMasking |
| INPU-0002 | TimestampAlign |
| INPU-0003 | FieldEncryption |
| INPU-0004 | FieldEncryption |
| INPU-0005 | RowFiltering |
| INPU-0006 | DuplicateRemoval |

**t_transformation_min_one_input_input_dataset**

| id | input_dataset |
| --- | --- |
| INPU-0001 | NetworkTrafficLog |
| INPU-0002 | CustomerTransactions |
| INPU-0003 | NetworkTrafficLog |
| INPU-0004 | PatientRecords |
| INPU-0005 | SupplyChainEvents |
| INPU-0006 | NetworkTrafficLog |

**t_transformation_min_one_input__input_dataset**

| id | transformation_id | input_dataset_id | role |
| --- | --- | --- | --- |
| INPU-0001 | INPU-0006 | INPU-0005 | observer |
| INPU-0002 | INPU-0004 | INPU-0001 | observer |
| INPU-0003 | INPU-0003 | INPU-0002 | observer |
| INPU-0004 | INPU-0001 | INPU-0004 | observer |
| INPU-0005 | INPU-0006 | INPU-0003 | reviewer |
| INPU-0006 | INPU-0003 | INPU-0001 | contributor |
| INPU-0007 | INPU-0005 | INPU-0005 | contributor |
| INPU-0008 | INPU-0003 | INPU-0005 | contributor |

Instrument metadata is captured in a dedicated type catalogue that records not only the physical or logical instrument and the signal it emits, but also the provenance timestamp and the storage footprint of its configuration. The `createddate` column anchors each instrument type to a point in time—`2023-01-25` for the Acoustic transducer emitting `Infrared radiation`, `2024-12-01` for the Seismograph producing `Acoustic echo`—enabling temporal queries on instrument lifecycle and compliance windows. The `sizebytes` column quantifies the configuration payload, ranging from approximately 370 MB for the Seismograph type to 632 MB for the Ion chamber type, a figure that matters for capacity planning, replication budgets, and change-management impact assessments. Each instrument type is keyed by a stable identifier (`TYPE-0001` through `TYPE-0004`), and the emitted signal—`Ultrasound pulse`, `Telemetry stream`, `Infrared radiation`, `Acoustic echo`—serves as the semantic bridge to downstream observation records.

**t_instrument_only_emits_type**

| id | instrument | emits_signal | created_date | size_bytes |
| --- | --- | --- | --- | --- |
| TYPE-0001 | Seismograph | Acoustic echo | 2024-12-01 | 370347470 |
| TYPE-0002 | Ion chamber | Ultrasound pulse | 2023-12-08 | 631989835 |
| TYPE-0003 | Acoustic transducer | Infrared radiation | 2023-01-25 | 565520223 |
| TYPE-0004 | Ion chamber | Telemetry stream | 2024-07-30 | 541950157 |
| TYPE-0005 | Spectrometer | RF pulse | 2024-06-22 | 83957422 |
| TYPE-0006 | Magnetometer | Acoustic echo | 2024-05-04 | 105995168 |
| TYPE-0007 | Particle detector | Ultrasound pulse | 2024-10-26 | 587447986 |

Observation records are modelled as a star schema comprising a fact table and a dimension table, each keyed by a distinct identifier prefix (`PART-0001` through `PART-0004`). The fact table, `fact_observation`, stores the measurable attributes of each observation event: the `duration_seconds` of the measurement window, the `exit_code` signalling completion status, and the `retry_count` reflecting transient-failure recovery. Observed durations span from roughly 1 055 seconds to 6 609 seconds, while exit codes vary widely—`130`, `6`, `181`, `901`—suggesting a taxonomy of success, partial failure, and protocol-specific termination conditions. Retry counts are equally dispersed, from a modest 33 retries to a heavy 395, indicating that some observation channels experience persistent instability while others complete cleanly on the first attempt. The `observation` column in the fact table references a higher-level observation entity (e.g., `PART-0002` appearing as the observation key for two distinct fact rows), enabling aggregation across repeated measurement windows.

**fact_observation**

| id | observation_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| PART-0001 | PART-0002 | 5760.93 | 181 | 395 |
| PART-0002 | PART-0001 | 1055.05 | 130 | 277 |
| PART-0003 | PART-0002 | 2397.39 | 6 | 33 |
| PART-0004 | PART-0005 | 6608.55 | 901 | 249 |
| PART-0005 | PART-0001 | 2665.81 | 726 | 235 |
| PART-0006 | PART-0002 | 238.54 | 293 | 25 |
| PART-0007 | PART-0002 | 5114.82 | 801 | 303 |

The dimension table, `dim_observation`, supplies the human-readable and categorical context for each observation identifier. The `misc` column carries a free-form label such as `Observation Label 01` through `Observation Label 04`, while the `category` column assigns each observation to a classification bucket (`Observation Category 01` through `Observation Category 04`). These categorical assignments are the primary axis for compliance reporting: they determine which regulatory framework applies, which retention policy governs the data, and which audit reviewers must be notified. The `identifier` in the dimension table aligns one-to-one with the `identifier` in the fact table, ensuring that every measured duration, exit code, and retry count can be traced back to its categorical and labelled context without ambiguity.

**dim_observation**

| id | observation_label | observation_category |
| --- | --- | --- |
| PART-0001 | Observation Label 01 | Observation Category 01 |
| PART-0002 | Observation Label 02 | Observation Category 02 |
| PART-0003 | Observation Label 03 | Observation Category 03 |
| PART-0004 | Observation Label 04 | Observation Category 04 |
| PART-0005 | Observation Label 05 | Observation Category 05 |
| PART-0006 | Observation Label 06 | Observation Category 06 |

Taken together, these tables form a coherent lineage graph: transformations declare what they do and on which datasets they operate; instruments declare what they measure and when their configurations were last established; observations declare how long measurements ran, whether they succeeded, and under what category they fall. The `identifier` column is the universal join key across all six tables, the `subject` and `target` columns in the junction table encode the directionality of data flow, and the `role` column constrains permissible operations on each linkage. Compliance officers can therefore reconstruct, for any given data element, the full chain from source dataset through transformation rule to instrument type to observation outcome, with timestamps, sizes, exit codes, and retry histories all available as first-class attributes rather than after-the-fact annotations.