---
chapter_id: ch_live_subclass_to_artifact_644350
topic_id: 186
family: 01_foundation
cited_terms: ['subclass_to_artifact', 'ebpf_event_observed_pid', 'national_dataset_augmentation_process']
model: engine-refine
---

An identifier serves as the immutable anchor for every entity in a governed data ecosystem, providing a stable reference that survives system migrations, version changes, and cross-referencing across disparate subsystems. Artifact records carry identifiers such as ARTI-0001 through ARTI-0004, process records use PROC-0001 through PROC-0004, and event records employ PID-0001 through PID-0004, each prefix signaling the entity class while the numeric suffix guarantees uniqueness within that namespace. These identifiers are not merely labels; they are the join keys that bind together checksums, licenses, observation sources, and augmentation processes into a coherent provenance chain. When an augmentation process like DGIWGBase or NRCANMap is registered, its identifier (PROC-0001, PROC-0002) becomes the pivot around which the entire lineage of incorporated data and augmented outputs is traced.

**t_subclass_to_artifact**

| id | artifact | checksum | license |
| --- | --- | --- | --- |
| ARTI-0001 | checksum-manifest-v4 | c0ffee42 | BSD-3-Clause |
| ARTI-0002 | batch-processor-logs | 5e8f3c91 | CC-BY-4.0 |
| ARTI-0003 | genomic-sequence-17 | 1a4b6c2d | MIT |
| ARTI-0004 | sensor-calibration-v2 | 5e8f3c91 | CC-BY-4.0 |
| ARTI-0005 | model-weights-resnet50 | 5e8f3c91 | proprietary |
| ARTI-0006 | pipeline-output-stage3 | 9d2b7a16 | Apache-2.0 |
| ARTI-0007 | lab-reagent-batch-A7 | 7b14de08 | Apache-2.0 |
| ARTI-0008 | batch-processor-logs | 1a4b6c2d | BSD-3-Clause |

Checksums and licenses form the dual pillars of artifact integrity and usage governance. A checksum such as c0ffee42 or 5e8f3c91 provides a cryptographic fingerprint that confirms an artifact has not been altered since it was recorded; the same hash value appearing across distinct artifacts—5e8f3c91 for both batch-processor-logs and sensor-calibration-v2—indicates either a shared base component or a deliberate reuse of a validated payload. Licensing terms like BSD-3-Clause, CC-BY-4.0, and MIT are attached to each artifact to enforce downstream compliance, ensuring that any system consuming these artifacts can programmatically verify that its intended use falls within the permitted scope. Together, checksum and license create a machine-verifiable contract: the checksum guarantees what was delivered matches what was recorded, and the license guarantees that delivery was authorized for the consumer's purpose.

The national dataset augmentation process is the operational mechanism by which existing national datasets are enriched with external observation sources. A process such as TerrainDataMerge or EuroStatSync does not create data from scratch; it incorporates an observation source—CopernicusLand, CMEMSDataCube, GLO30Coverage, or CopernicusCrisis—and applies it against an existing national dataset like SentinelCoreLoad, GADMAdminLevels, CensusMapAlign, or LandCoverSync. This three-way relationship (augmentation process, observation source, existing dataset) is the core of the data enrichment pipeline. The Copernicus observation sources, for instance, provide standardized geospatial layers that, when merged through a defined process, produce an augmented national dataset with higher resolution, broader coverage, or updated temporal fidelity than the original.

**t_national_dataset_augmentation_process**

| id | national_dataset_augmentation_process | incorporates_observation_source | augments_existing_dataset |
| --- | --- | --- | --- |
| PROC-0001 | DGIWGBase | CopernicusLand | SentinelCoreLoad |
| PROC-0002 | NRCANMap | CMEMSDataCube | GADMAdminLevels |
| PROC-0003 | TerrainDataMerge | GLO30Coverage | CensusMapAlign |
| PROC-0004 | EuroStatSync | CopernicusCrisis | LandCoverSync |
| PROC-0005 | CensusMapAlign | CMEMSDataCube | CensusMapAlign |
| PROC-0006 | DGIWGBase | CopernicusCrisis | GADMAdminLevels |
| PROC-0007 | LandCoverSync | CAMSReanalysis | GADMv32 |

Subject, target, and role define the access and accountability graph that governs who or what interacts with which entities and in what capacity. In the relationship table linking ebpf events to observed process identifiers, the subject column (ebpf_id) identifies the initiating entity—PID-0002, PID-0004, or PID-0003—while the target column (observes_pid_id) identifies the entity being observed, such as PID-0006 or PID-0002. The role column assigns a functional relationship between subject and target: contributor, observer, owner, or reviewer. A process like PID-0002 may act as a contributor to PID-0006, meaning it actively produces or modifies data for that target, while the same process may serve as a reviewer for PID-0002, indicating a supervisory or audit relationship. This triad of subject, target, and role enables fine-grained accountability without requiring monolithic permission matrices.

**t_ebpf_event_observed_pid**

| id | ebpf |
| --- | --- |
| PID-0001 | syscall_trace |
| PID-0002 | disk_io_tracker |
| PID-0003 | tcp_connect_probe |
| PID-0004 | disk_io_tracker |
| PID-0005 | cpu_profile_sampler |
| PID-0006 | disk_io_tracker |

**t_ebpf_event_observed_pid_observes_pid**

| id | observes_pid |
| --- | --- |
| PID-0001 | 11024 |
| PID-0002 | 11024 |
| PID-0003 | 7743 |
| PID-0004 | 11024 |
| PID-0005 | 8891 |
| PID-0006 | 11024 |

**t_ebpf_event_observed_pid__observes_pid**

| id | ebpf_id | observes_pid_id | role |
| --- | --- | --- | --- |
| PID-0001 | PID-0002 | PID-0006 | contributor |
| PID-0002 | PID-0004 | PID-0004 | observer |
| PID-0003 | PID-0003 | PID-0002 | owner |
| PID-0004 | PID-0002 | PID-0002 | reviewer |
| PID-0005 | PID-0005 | PID-0004 | contributor |
| PID-0006 | PID-0005 | PID-0001 | contributor |
| PID-0007 | PID-0006 | PID-0005 | owner |
| PID-0008 | PID-0006 | PID-0002 | contributor |

In practice, these concepts operate as an integrated provenance and governance layer. An artifact identified as ARTI-0001 carries a checksum (c0ffee42) and a license (BSD-3-Clause) that constrain how it may be used. An augmentation process identified as PROC-0001 (DGIWGBase) incorporates CopernicusLand as its observation source and augments SentinelCoreLoad as its existing dataset. The ebpf event PID-0002, which tracks a disk I/O operation, may serve as a contributor to PID-0006 and a reviewer of PID-0002, establishing a chain of responsibility. Every identifier in this system is a node in a larger graph where checksums verify integrity, licenses enforce compliance, augmentation processes document enrichment, and subject-target-role triples capture accountability. The result is a traceable, auditable data lifecycle from ingestion through augmentation to consumption.