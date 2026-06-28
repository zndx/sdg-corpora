---
chapter_id: ch_live_entomological_surveillance_record_547715
topic_id: 0
family: 08_derived
cited_terms: ['entomological_surveillance_record', 'shell_dimension_specification', 'instrument_emits_signal']
model: engine-refine
---

Entity resolution and categorical taxonomy form the foundational layer of the operational data model, where each distinct record is anchored by a unique `identifier` such as `RECO-0001` or `RECO-0002`. These identifiers serve as the primary keys within the fact table, linking observational events to their corresponding dimensional attributes. The `realizes` and `associated_with` columns establish the relational topology, mapping how a specific realization, denoted by labels like `Realizes Label 01` or `Realizes Label 02`, connects to an associated entity, categorized under `Associated With Category 01` or `Associated With Category 02`. The volume of activity captured by these relationships is quantified by the `event_count`, which registers significant observational loads, ranging from a baseline of 49 events to a peak of 485 events, thereby providing a quantitative measure of entity engagement across the system.

**fact_entomological**

| id | realizes_key | associated_with_key | event_count |
| --- | --- | --- | --- |
| RECO-0001 | RECO-0002 | RECO-0001 | 311 |
| RECO-0002 | RECO-0005 | RECO-0005 | 166 |
| RECO-0003 | RECO-0004 | RECO-0003 | 49 |
| RECO-0004 | RECO-0004 | RECO-0001 | 485 |
| RECO-0005 | RECO-0006 | RECO-0001 | 380 |
| RECO-0006 | RECO-0003 | RECO-0005 | 490 |
| RECO-0007 | RECO-0004 | RECO-0007 | 321 |
| RECO-0008 | RECO-0002 | RECO-0003 | 179 |

**dim_realizes**

| id | realizes_label | realizes_category |
| --- | --- | --- |
| RECO-0001 | Realizes Label 01 | Realizes Category 01 |
| RECO-0002 | Realizes Label 02 | Realizes Category 02 |
| RECO-0003 | Realizes Label 03 | Realizes Category 03 |
| RECO-0004 | Realizes Label 04 | Realizes Category 04 |
| RECO-0005 | Realizes Label 05 | Realizes Category 05 |
| RECO-0006 | Realizes Label 06 | Realizes Category 06 |

**dim_associated_with**

| id | associated_with_label | associated_with_category |
| --- | --- | --- |
| RECO-0001 | Associated With Label 01 | Associated With Category 01 |
| RECO-0002 | Associated With Label 02 | Associated With Category 02 |
| RECO-0003 | Associated With Label 03 | Associated With Category 03 |
| RECO-0004 | Associated With Label 04 | Associated With Category 04 |
| RECO-0005 | Associated With Label 05 | Associated With Category 05 |
| RECO-0006 | Associated With Label 06 | Associated With Category 06 |
| RECO-0007 | Associated With Label 07 | Associated With Category 07 |
| RECO-0008 | Associated With Label 08 | Associated With Category 08 |

The structural integrity of dimensional specifications relies on a strict typing mechanism governed by the `attr` and `attr type` columns, which enforce data schema compliance across heterogeneous inputs. Within the `shelldimensionspecification` framework, physical and abstract entities—such as `Venus_venerupis_Mediterranean`, `Cypraea_tigris_Asian`, `Littorina_obtusa_Urban`, and `Strombus_gigas_Tropical`—are defined by a suite of attributes including `confidence`, `dimension_kind`, `method`, and `recorded_at`. Each attribute is bound to a precise data type, such as `xsd:decimal` for numerical precision or `xsd:dateTime` for temporal tracking, ensuring that the dimensional metadata remains semantically consistent regardless of the underlying entity's complexity.

**t_shell_dimension_specification**

| id | shell_dimension_specification |
| --- | --- |
| SPEC-0001 | Venus_venerupis_Mediterranean |
| SPEC-0002 | Cypraea_tigris_Asian |
| SPEC-0003 | Littorina_obtusa_Urban |
| SPEC-0004 | Strombus_gigas_Tropical |
| SPEC-0005 | Ostrea_gigas_Brittany |
| SPEC-0006 | Nassa_pertenuis_Coast |
| SPEC-0007 | Strongylocentrotus_pacificus_Puget |

**t_shell_dimension_specification_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SPEC-0001 | confidence | xsd:decimal |
| SPEC-0002 | dimension_kind | xsd:string |
| SPEC-0003 | method | xsd:string |
| SPEC-0004 | recorded_at | xsd:dateTime |
| SPEC-0005 | uncertainty | xsd:decimal |
| SPEC-0006 | unit | xsd:string |
| SPEC-0007 | value | xsd:decimal |
| SPEC-0008 | encoding | xsd:string |

**t_shell_dimension_specification_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SPEC-0001 | SPEC-0001 | SPEC-0004 | 2024-08-09T04:20:11 |
| SPEC-0002 | SPEC-0002 | SPEC-0004 | 2023-01-11T02:33:00 |
| SPEC-0003 | SPEC-0003 | SPEC-0004 | 2025-04-11T22:51:28 |
| SPEC-0004 | SPEC-0004 | SPEC-0004 | 2025-04-30T10:31:45 |
| SPEC-0005 | SPEC-0005 | SPEC-0004 | 2023-04-03T22:35:38 |
| SPEC-0006 | SPEC-0006 | SPEC-0004 | 2023-08-11T07:42:35 |
| SPEC-0007 | SPEC-0007 | SPEC-0004 | 2025-04-06T02:27:44 |

Attribute values are decoupled into type-specific storage tables, where the `entity` column acts as the foreign key linking back to the primary specification, and the `misc` column houses the actual data payload. Temporal attributes are persisted as ISO 8601 timestamps, such as `2024-08-09T04:20:11` or `2025-04-30T10:31:45`, while numerical precision is maintained in decimal stores with values like `0.130`, `733.39`, `125.34`, and `0.624`. String-based metadata, including `Dimension Kind 01`, `Encoding 02`, `nightly summary`, and locale identifiers like `ja`, are similarly resolved through the `entity` linkage, demonstrating a normalized architecture that accommodates diverse data modalities without compromising referential integrity.

**t_shell_dimension_specification_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SPEC-0001 | SPEC-0001 | SPEC-0001 | 0.130 |
| SPEC-0002 | SPEC-0001 | SPEC-0005 | 733.39 |
| SPEC-0003 | SPEC-0001 | SPEC-0007 | 125.34 |
| SPEC-0004 | SPEC-0002 | SPEC-0001 | 0.624 |
| SPEC-0005 | SPEC-0002 | SPEC-0005 | 68.87 |
| SPEC-0006 | SPEC-0002 | SPEC-0007 | 303.82 |
| SPEC-0007 | SPEC-0003 | SPEC-0001 | 0.168 |
| SPEC-0008 | SPEC-0003 | SPEC-0005 | 203.41 |

**t_shell_dimension_specification_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SPEC-0001 | SPEC-0001 | SPEC-0002 | Dimension Kind 01 |
| SPEC-0002 | SPEC-0001 | SPEC-0008 | Encoding 02 |
| SPEC-0003 | SPEC-0001 | SPEC-0009 | nightly summary |
| SPEC-0004 | SPEC-0001 | SPEC-0010 | ja |
| SPEC-0005 | SPEC-0001 | SPEC-0003 | manual |
| SPEC-0006 | SPEC-0001 | SPEC-0006 | nm |
| SPEC-0007 | SPEC-0002 | SPEC-0002 | Dimension Kind 07 |
| SPEC-0008 | SPEC-0002 | SPEC-0008 | Encoding 08 |

At the physical instrumentation layer, the system tracks telemetry signals emitted by hardware components, correlating the `instrument` type with the specific `emits_signal` characteristic. Devices such as a `LiDAR array` emitting an `Optical pulse`, a `Seismometer` generating an `Ultrasonic wave`, a `Mass spectrometer` producing an `Ultrasonic wave`, and a `Radiometer` broadcasting a `Heartbeat ping` are each assigned a unique `identifier` (e.g., `SIGN-0001` through `SIGN-0004`). The data lineage and storage footprint of these signals are explicitly managed through the `uri` and `sizebytes` columns; for instance, data is routed to specific cloud storage tiers—`s3://lake/raw`, `abfss://prod/silver`, `s3://lake/curated`, and `gs://warehouse/gold`—with file sizes ranging from 193,789,751 bytes to 579,891,201 bytes, ensuring precise tracking of data provenance and resource allocation.

**t_instrument_emits_signal**

| id | instrument | emits_signal | size_bytes | uri |
| --- | --- | --- | --- | --- |
| SIGN-0001 | LiDAR array | Optical pulse | 193789751 | s3://lake/raw |
| SIGN-0002 | Seismometer | Ultrasonic wave | 556171171 | abfss://prod/silver |
| SIGN-0003 | Mass spectrometer | Ultrasonic wave | 279461908 | s3://lake/curated |
| SIGN-0004 | Radiometer | Heartbeat ping | 579891201 | gs://warehouse/gold |
| SIGN-0005 | Mass spectrometer | Data packet | 371526447 | abfss://prod/silver |