---
chapter_id: ch_live_dataset_snapshot_subclass_92b8d8
topic_id: 186
family: 07_long_tail
cited_terms: ['dataset_snapshot_subclass', 'quantum_cyber_security_field', 'lineage_governed_by_directive']
model: engine-refine
---

In governance frameworks that track data lineage and compliance, every artifact must be anchored to a directive with unambiguous provenance. The lineage governed by directive table captures this anchoring through an identifier, a named lineage such as Model Training Registry or Patient Cohort Dataset, a unit of measurement, and a language code. Units encode the physical or logical scale of the data—milliseconds for timing-sensitive telemetry streams, meters per second for velocity measurements, or raw counts for aggregated sensor readings. Language codes such as ja, de, and en specify the linguistic context in which the lineage documentation is authored, ensuring that regulatory artifacts are traceable to the correct jurisdictional and operational audience. This combination of identifier, lineage name, unit, and language forms the foundational metadata that allows auditors to reconstruct the chain of custody for any dataset or model artifact.

**t_lineage_governed_by_directive**

| id | lineage | unit | language |
| --- | --- | --- | --- |
| DIRE-0001 | Model Training Registry | ms | ja |
| DIRE-0002 | Patient Cohort Dataset | m/s | de |
| DIRE-0003 | Sensor Telemetry Stream | count | en |
| DIRE-0004 | Patient Cohort Dataset | m/s | en |
| DIRE-0005 | API Request Trace | ratio | es |
| DIRE-0006 | Laboratory Batch Records | nm | de |
| DIRE-0007 | Patient Cohort Dataset | kg | en |
| DIRE-0008 | Inventory Sync Job | nm | ja |

Quantum cybersecurity research introduces a parallel taxonomy that classifies both the technical domain and the specific security concerns under investigation. The quantum cybersecurity field table enumerates distinct research areas, including Quantum Secure Direct Communication, Measurement-Device-Independent QKD, and Post-Quantum Cryptography, each assigned a unique identifier such as FIEL-0001 or FIEL-0003. The communication security aspect table captures the particular threats or phenomena being studied—Emitter Calibration Drift, Channel Eavesdropping Detection, and Quantum Memory Coherence—again keyed by identifier. These two dimensions are not independent; a many-to-many relationship table links each quantum field to one or more security aspects, designating the field as the subject and the security aspect as the target of the relationship. A role attribute further qualifies the nature of each linkage, distinguishing between contributor relationships, where a field engages with an aspect in a supporting capacity, and owner relationships, where the field bears primary responsibility for addressing the security concern.

**t_quantum_cyber_security_field**

| id | quantum_cyber_security_field |
| --- | --- |
| FIEL-0001 | Quantum Secure Direct Communication |
| FIEL-0002 | Measurement-Device-Independent QKD |
| FIEL-0003 | Post-Quantum Cryptography |
| FIEL-0004 | Post-Quantum Cryptography |
| FIEL-0005 | Quantum Digital Signatures |
| FIEL-0006 | Quantum Key Distribution |

**t_quantum_cyber_security_field_studies_domain_aspect**

| id | studies_domain_aspect |
| --- | --- |
| FIEL-0001 | Emitter Calibration Drift |
| FIEL-0002 | Channel Eavesdropping Detection |
| FIEL-0003 | Quantum Memory Coherence |
| FIEL-0004 | Channel Eavesdropping Detection |
| FIEL-0005 | Protocol Authentication Tokens |
| FIEL-0006 | Network Topology Integrity |

**t_quantum_cyber_security_field__studies_domain_aspect**

| id | quantum_id | studies_domain_aspect_id | role |
| --- | --- | --- | --- |
| FIEL-0001 | FIEL-0003 | FIEL-0001 | contributor |
| FIEL-0002 | FIEL-0005 | FIEL-0003 | contributor |
| FIEL-0003 | FIEL-0001 | FIEL-0001 | contributor |
| FIEL-0004 | FIEL-0001 | FIEL-0001 | owner |
| FIEL-0005 | FIEL-0003 | FIEL-0006 | owner |
| FIEL-0006 | FIEL-0001 | FIEL-0005 | contributor |
| FIEL-0007 | FIEL-0002 | FIEL-0004 | contributor |
| FIEL-0008 | FIEL-0004 | FIEL-0004 | reviewer |

Dataset snapshots are managed through a fact table that records each snapshot's identifier, its size in bytes, its version number, and a foreign key pointing to a dimension table that classifies the snapshot. Snapshot sizes vary considerably across the registry: one entry records 350,697,080 bytes, another 501,391,865 bytes, while smaller snapshots reach as low as 31,504,133 bytes and the largest approaches 676,110,880 bytes. Version numbers—ranging from 2 to 10—track the evolution of each snapshot over time. The dimension table, labeled dim_snapshot_of, provides the categorical context for each snapshot through a misc label and a category classification. Labels such as Snapshot Of Label 01 through Snapshot Of Label 04 pair with categories like Snapshot Of Category 01 through Snapshot Of Category 04, enabling analysts to filter and aggregate snapshots by their organizational or operational classification.

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

The identifier column appears consistently across all tables as the primary key, serving as the universal reference that enables joins and cross-referencing. In the quantum cybersecurity relationship table, the subject column references the quantum field identifier while the target column references the security aspect identifier, creating a navigable graph of research domains and their associated threats. This structural consistency means that a single identifier such as SNAP-0001 can be traced from the fact dataset through its snapshot_of_key to the dimension table, revealing both the category and misc label that contextualize the snapshot's purpose. Similarly, identifiers like FIEL-0001 appear in the quantum field table, the security aspect table, and the relationship table, allowing auditors to follow the complete chain from a named field through its associated security concerns and the roles assigned to each linkage.