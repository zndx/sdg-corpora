---
chapter_id: ch_live_artifact_min_one_owner_b7c658
topic_id: 0
family: 07_long_tail
cited_terms: ['artifact_min_one_owner', 'subclass_disjoint_from_artifact', 'instrument_only_emits_type']
model: engine-refine
---

Artifact governance in operational environments rests upon a disciplined taxonomy of metadata attributes that together establish provenance, enforce ownership, and constrain lifecycle transitions. At the foundation of this taxonomy is the identifier, a stable, globally scoped key that anchors every artifact record across dimensional and fact tables. Identifiers such as OWNE-0001 through OWNE-0004 in the artifact fact table and ARTI-0001 through ARTI-0004 in the subclass disjointness table serve as the immutable referents by which compliance auditors trace lineage, resolve conflicts, and enforce referential integrity. The identifier is not merely a surrogate; it is the primary contract between the artifact and the governance framework, ensuring that every downstream reference—whether to an owner, a size metric, or a version constraint—resolves to a single, unambiguous entity.

**fact_artifact**

| id | owner_key | size_bytes | version |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0003 | 123155790 | 6 |
| OWNE-0002 | OWNE-0003 | 42978804 | 5 |
| OWNE-0003 | OWNE-0003 | 996080316 | 5 |
| OWNE-0004 | OWNE-0005 | 597369362 | 10 |
| OWNE-0005 | OWNE-0006 | 12061913 | 9 |
| OWNE-0006 | OWNE-0004 | 792675668 | 5 |

Ownership attribution operates through a foreign-key linkage between the artifact fact table and the owner dimension, where the owner_key column in fact_artifact points to the corresponding identifier in dim_owner. This relationship decouples the operational artifact from its administrative metadata, allowing ownership labels and categories to evolve independently of the artifact's structural record. An owner_key value of OWNE-0003, for instance, resolves to an owner_label of "Owner Label 03" and an owner_category of "Owner Category 03" within the dimension table, while the same key may appear across multiple artifact rows—OWNE-0003, OWNE-0002, and OWNE-0001 in the fact table all reference OWNE-0003 as their owner, indicating a many-to-one ownership model. The misc column, realized as the owner_label in the dimension, carries human-readable designations that support operational dashboards and audit reports without polluting the normalized schema.

**dim_owner**

| id | owner_label | owner_category |
| --- | --- | --- |
| OWNE-0001 | Owner Label 01 | Owner Category 01 |
| OWNE-0002 | Owner Label 02 | Owner Category 02 |
| OWNE-0003 | Owner Label 03 | Owner Category 03 |
| OWNE-0004 | Owner Label 04 | Owner Category 04 |
| OWNE-0005 | Owner Label 05 | Owner Category 05 |
| OWNE-0006 | Owner Label 06 | Owner Category 06 |

Size metrics and versioning provide the quantitative backbone for capacity planning and change management. The size_bytes column in fact_artifact records the byte-level footprint of individual artifacts, with values ranging from 42,978,804 bytes for artifact OWNE-0002 to 996,080,316 bytes for OWNE-0003—a nearly twenty-four-fold variance that directly informs storage allocation and transfer scheduling. A parallel size_bytes column, aliased as sizebytes in the instrument emission type table, captures the footprint of instrument-generated signal data, where a seismograph emitting acoustic echo records 370,347,470 bytes and an ion chamber producing a telemetry stream registers 541,950,157 bytes. The version column in fact_artifact, taking integer values from 5 to 10 across the observed artifact set, enforces a monotonic progression that compliance frameworks rely upon to detect unauthorized rollbacks and to validate that the deployed revision matches the approved baseline.

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

Temporal provenance is captured through the created_date column in the instrument emission type table, which anchors each instrument-signal pairing to a specific calendar date. Dates such as 2023-01-25 for an acoustic transducer emitting infrared radiation and 2024-12-01 for a seismograph emitting acoustic echo establish a chronological audit trail that regulatory bodies require for change management documentation. The category column in the owner dimension, with values like "Owner Category 01" through "Owner Category 04," provides a coarse-grained classification that enables aggregation and filtering across ownership hierarchies, supporting governance queries that span multiple artifact families without requiring joins into the fact table.

Disjointness constraints, encoded in the t_subclass_disjoint_from_artifact table through the disjoint column, enforce type-level separation between artifact subclasses. Values such as lab-assay-protocol, sensor-telemetry-stream, and telemetry-metadata-index represent mutually exclusive classification paths that prevent an artifact from being simultaneously assigned to incompatible operational domains. This constraint, paired with the identifier linkage to the artifact fact table, ensures that the governance framework can detect and reject classification conflicts before they propagate into downstream analytics or compliance reporting.

**t_subclass_disjoint_from_artifact**

| id | disjoint |
| --- | --- |
| ARTI-0001 | lab-assay-protocol |
| ARTI-0002 | sensor-telemetry-stream |
| ARTI-0003 | telemetry-metadata-index |
| ARTI-0004 | telemetry-metadata-index |
| ARTI-0005 | artifact-manifest-record |
| ARTI-0006 | feature-vector-cache |
| ARTI-0007 | provenance-chain-hash |