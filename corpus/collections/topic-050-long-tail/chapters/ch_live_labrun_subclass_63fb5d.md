---
chapter_id: ch_live_labrun_subclass_63fb5d
topic_id: 50
family: 02_observation_measurement
cited_terms: ['labrun_subclass', 'ganglion_cyst_imaging_finding', 'transformation_generates_entity']
model: engine-refine
---

The data model centers on a flexible attribute-value architecture that supports heterogeneous metadata across laboratory run classifications and medical imaging findings. At the core of this design is the `t_labrun_subclass` table, which serves as the primary entity registry for laboratory run subclasses. Each record carries a unique identifier (LABR-0001 through LABR-0004), a descriptive labrun name such as "CellCulture-Exp12" or "PCR-Run-Alpha7," and an input_sample field capturing the originating material — for instance, "PlasmaCitrate-Lot4," "HumanSerum-A7," "RNAExtract-Brain," or "PlantRoot-Extract." This table anchors the entire schema, providing the entity_id references that downstream attribute-value tables resolve through foreign keys.

**t_labrun_subclass**

| id | labrun | input_sample |
| --- | --- | --- |
| LABR-0001 | CellCulture-Exp12 | PlasmaCitrate-Lot4 |
| LABR-0002 | FlowCyt-Panel9 | HumanSerum-A7 |
| LABR-0003 | ELISA-Plate88 | RNAExtract-Brain |
| LABR-0004 | PCR-Run-Alpha7 | PlantRoot-Extract |
| LABR-0005 | MassSpec-MS19 | DNAFragment-450bp |
| LABR-0006 | NMR-Stand-04A | RNAExtract-Brain |
| LABR-0007 | FlowCyt-Panel9 | DNAFragment-450bp |
| LABR-0008 | RNASeq-Lib15 | HumanSerum-A7 |

**t_labrun_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| LABR-0001 | duration_seconds | xsd:decimal |
| LABR-0002 | end_time | xsd:dateTime |
| LABR-0003 | exit_code | xsd:integer |
| LABR-0004 | host_name | xsd:string |
| LABR-0005 | log_level | xsd:string |
| LABR-0006 | phase | xsd:string |
| LABR-0007 | retry_count | xsd:integer |
| LABR-0008 | scheduled_at | xsd:dateTime |

**t_labrun_subclass_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LABR-0001 | LABR-0001 | LABR-0002 | 2023-06-03T03:48:13 |
| LABR-0002 | LABR-0001 | LABR-0008 | 2024-12-03T15:21:58 |
| LABR-0003 | LABR-0001 | LABR-0009 | 2023-08-16T05:52:21 |
| LABR-0004 | LABR-0002 | LABR-0002 | 2024-08-31T23:33:13 |
| LABR-0005 | LABR-0002 | LABR-0008 | 2025-02-13T01:21:55 |
| LABR-0006 | LABR-0002 | LABR-0009 | 2023-04-09T20:59:10 |
| LABR-0007 | LABR-0003 | LABR-0002 | 2024-04-14T13:26:56 |
| LABR-0008 | LABR-0003 | LABR-0008 | 2024-07-04T01:41:44 |

**t_labrun_subclass_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LABR-0001 | LABR-0001 | LABR-0001 | 7187.70 |
| LABR-0002 | LABR-0002 | LABR-0001 | 5360.85 |
| LABR-0003 | LABR-0003 | LABR-0001 | 3249.87 |
| LABR-0004 | LABR-0004 | LABR-0001 | 649.77 |
| LABR-0005 | LABR-0005 | LABR-0001 | 3590.34 |
| LABR-0006 | LABR-0006 | LABR-0001 | 456.45 |
| LABR-0007 | LABR-0007 | LABR-0001 | 5720.89 |
| LABR-0008 | LABR-0008 | LABR-0001 | 7012.99 |

**t_labrun_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LABR-0001 | LABR-0001 | LABR-0003 | 241 |
| LABR-0002 | LABR-0001 | LABR-0007 | 320 |
| LABR-0003 | LABR-0002 | LABR-0003 | 688 |
| LABR-0004 | LABR-0002 | LABR-0007 | 479 |
| LABR-0005 | LABR-0003 | LABR-0003 | 481 |
| LABR-0006 | LABR-0003 | LABR-0007 | 200 |
| LABR-0007 | LABR-0004 | LABR-0003 | 208 |
| LABR-0008 | LABR-0004 | LABR-0007 | 121 |

**t_labrun_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LABR-0001 | LABR-0001 | LABR-0004 | node-b14 |
| LABR-0002 | LABR-0001 | LABR-0005 | Log Level 02 |
| LABR-0003 | LABR-0001 | LABR-0006 | closeout |
| LABR-0004 | LABR-0001 | LABR-0010 | pending |
| LABR-0005 | LABR-0001 | LABR-0011 | Triggered By 05 |
| LABR-0006 | LABR-0002 | LABR-0004 | ingest-21 |
| LABR-0007 | LABR-0002 | LABR-0005 | Log Level 07 |
| LABR-0008 | LABR-0002 | LABR-0006 | closeout |

The attribute definition layer lives in `t_labrun_subclass_attr`, which decouples metadata schema from data storage. Rather than embedding fixed columns for every possible attribute, this table declares attribute names (attr_name) alongside their semantic types (attr_type). For example, the attribute "duration_seconds" is typed as xsd:decimal, "end_time" as xsd:dateTime, "exit_code" as xsd:integer, and "host_name" as xsd:string. This separation enables the system to evolve its metadata vocabulary without schema migrations, since new attributes can be registered declaratively before any values are recorded.

Actual attribute values are distributed across four type-specific value tables, each keyed by a composite of entity_id and attr_id that references back to `t_labrun_subclass` and `t_labrun_subclass_attr` respectively. The `t_labrun_subclass_val_decimal` table stores numeric measurements — values like 7187.70, 5360.85, 3249.87, and 649.77 — while `t_labrun_subclass_val_int` holds integer-valued attributes such as 241, 320, 688, and 479. Temporal data resides in `t_labrun_subclass_val_datetime`, recording timestamps like 2023-06-03T03:48:13 and 2024-12-03T15:21:58, and string-valued attributes populate `t_labrun_subclass_val_varchar` with entries including "node-b14," "Log Level 02," "closeout," and "pending." This type-disaggregated value storage ensures type safety at query time while preserving the flexibility of an entity-attribute-value pattern.

Beyond laboratory runs, the schema extends into clinical imaging metadata through the `t_ganglion_cyst_imaging_finding` table, which records anatomical findings alongside their imaging context. Each finding entry identifies a specific anatomical location — such as "Dorsal right ankle," "Left medial malleolus," "Bilateral distal radius," or "Right dorsal metatarsal" — and specifies the imaging modality used, including "MIP reconstruction," "Sagittal PD FS," "Gadolinium enhanced T1," and "T2 weighted fat sat." The table also captures encoding (ascii, latin1, unicode) and language (ja, en) attributes, reflecting the internationalized nature of the imaging reports and their associated documentation.

**t_ganglion_cyst_imaging_finding**

| id | ganglion_cyst_imaging_finding | visualizes | encoding | language |
| --- | --- | --- | --- | --- |
| FIND-0001 | Dorsal right ankle | MIP reconstruction | ascii | ja |
| FIND-0002 | Left medial malleolus | Sagittal PD FS | ascii | ja |
| FIND-0003 | Bilateral distal radius | Gadolinium enhanced T1 | latin1 | en |
| FIND-0004 | Right dorsal metatarsal | T2 weighted fat sat | unicode | ja |
| FIND-0005 | Palmar left thumb | Sagittal PD FS | unicode | de |
| FIND-0006 | Left scapholunate ligament | STIR sequence | unicode | en |
| FIND-0007 | Palmar left thumb | PD weighted fat sat | unicode | en |

Finally, the `t_transformation_generates_entity` table documents the data engineering lifecycle by linking transformations to the entities they produce. Each record identifies a transformation (e.g., "schema migration routine," "batch ingestion pipeline," "archival compression job," "feature engineering step"), the entity it generates (such as "calibrated sensor readings," "feature matrix," or "cleaned telemetry dataset"), the duration in seconds (ranging from 2309.83 to 6875.45), and the operational phase (all recorded as "execution" in the sample data). This table provides traceability across the data pipeline, enabling auditors and engineers to reconstruct the provenance of derived datasets and assess the computational cost of each transformation step.

**t_transformation_generates_entity**

| id | transformation | generates_entity | duration_seconds | phase |
| --- | --- | --- | --- | --- |
| ENTI-0001 | schema migration routine | calibrated sensor readings | 5649.07 | execution |
| ENTI-0002 | batch ingestion pipeline | feature matrix | 2309.83 | execution |
| ENTI-0003 | archival compression job | feature matrix | 2913.69 | execution |
| ENTI-0004 | feature engineering step | cleaned telemetry dataset | 6875.45 | execution |
| ENTI-0005 | telemetry aggregation task | feature matrix | 2931.10 | closeout |
| ENTI-0006 | batch ingestion pipeline | reconciliation report | 4817.44 | review |