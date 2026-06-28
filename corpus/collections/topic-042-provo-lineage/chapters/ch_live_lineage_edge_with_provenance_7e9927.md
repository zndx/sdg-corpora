---
chapter_id: ch_live_lineage_edge_with_provenance_7e9927
topic_id: 42
family: 05_provo_lineage
cited_terms: ['lineage_edge_with_provenance', 'kernelhook_with_attached_program', 'transformation_not_recoverable']
model: engine-refine
---

The governance of data lineage and transformation operations depends on a structured registry of identifiers, program metadata, and execution parameters that together establish traceability across the operational lifecycle. Each lineage edge carries a unique identifier—PROV-0001 through PROV-0004—anchoring records of processes such as log-rotation-archival, climate-model-updates, sensor-calibration-pipeline, and financial-reconciliation-run. These identifiers serve as the primary keys that bind provenance metadata to the transformations themselves, ensuring that every data movement can be traced back to its source system. The provenance attribution is explicit: Audit-Trail-Service and Edge-Gateway-Router appear as the responsible systems, with the latter cited for both sensor-calibration-pipeline and financial-reconciliation-run, indicating shared infrastructure across distinct operational domains.

**t_lineage_edge_with_provenance**

| id | lineage | with_provenance | encoding | label_text |
| --- | --- | --- | --- | --- |
| PROV-0001 | log-rotation-archival | Audit-Trail-Service | utf8 | nightly summary |
| PROV-0002 | climate-model-updates | Edge-Gateway-Router | unicode | nightly summary |
| PROV-0003 | sensor-calibration-pipeline | Edge-Gateway-Router | utf8 | nightly summary |
| PROV-0004 | financial-reconciliation-run | Regulatory-Reporting-API | ascii | calibration record |
| PROV-0005 | batch-ingestion-v4 | Regulatory-Reporting-API | ascii | audit excerpt |
| PROV-0006 | telemetry-aggregation-flow | Field-Sensor-Array | unicode | audit excerpt |
| PROV-0007 | climate-model-updates | Primary-Database-Cluster | ascii | change rationale |
| PROV-0008 | log-rotation-archival | AWS-S3-source-bucket | latin1 | change rationale |

**t_transformation_not_recoverable**

| id | transformation | transformation_2 | scheduled_at | triggered_by |
| --- | --- | --- | --- | --- |
| RECO-0001 | partition compaction | checksum verification | 2023-05-27T08:30:46 | event |
| RECO-0002 | log rotation | index defragmentation | 2024-07-23T05:41:48 | manual |
| RECO-0003 | batch compaction | record purging | 2025-03-09T11:37:12 | schedule |
| RECO-0004 | format conversion | index rebuild | 2023-08-05T01:48:14 | api |
| RECO-0005 | format conversion | feature scaling | 2023-09-25T17:59:19 | manual |
| RECO-0006 | batch compaction | telemetry filtering | 2024-03-31T12:21:12 | event |
| RECO-0007 | snapshot commit | batch compaction | 2023-07-05T00:36:15 | schedule |
| RECO-0008 | index defragmentation | index defragmentation | 2025-04-13T18:22:12 | schedule |

Encoding standards and labeling conventions provide the semantic layer that enables interoperability between heterogeneous systems. The lineage edges employ utf8, unicode, and ascii encodings depending on the nature of the data being tracked, with utf8 appearing for log-rotation-archival and financial-reconciliation-run, unicode for climate-model-updates, and ascii for sensor-calibration-pipeline. Label text such as nightly summary and calibration record accompanies each edge, offering human-readable context that complements the machine-parsable encoding declarations. This dual representation—machine-readable encoding paired with descriptive labels—ensures that both automated processing pipelines and human auditors can interpret the lineage records without ambiguity.

Kernel hooks and attached programs form the execution layer, where each hook is identified by PROG-0001 through PROG-0004 and references an attached program via the attached_program_key column, which itself points to identifiers such as PROG-0006, PROG-0004, and PROG-0001. The size_bytes field quantifies the binary footprint of each hook, ranging from 27,282,286 bytes for PROG-0004 to 560,962,979 bytes for PROG-0002, a spread that reflects the varying complexity of the operations these hooks mediate. Version numbers—1, 3, and 10—track the evolution of program bindings, with PROG-0001 appearing in multiple versions (1 and 10), suggesting iterative refinement of the same attached program across different hook contexts.

**fact_kernelhook**

| id | attached_program_key | size_bytes | version |
| --- | --- | --- | --- |
| PROG-0001 | PROG-0006 | 36342735 | 3 |
| PROG-0002 | PROG-0004 | 560962979 | 1 |
| PROG-0003 | PROG-0001 | 456299832 | 10 |
| PROG-0004 | PROG-0001 | 272822846 | 1 |

The dimension table for attached programs provides categorical classification and labeling that contextualizes the raw program identifiers. Each program—PROG-0001 through PROG-0004—is assigned an attached_program_label (Attached Program Label 01 through 04) and an attached_program_category (Attached Program Category 01 through 04), establishing a taxonomy that supports filtering, aggregation, and compliance reporting. These categorical attributes operate independently of the binary metadata in the kernel hook table, creating a separation between operational characteristics (size, version) and governance characteristics (category, label) that allows policy engines to evaluate programs on multiple dimensions simultaneously.

**dim_attached_program**

| id | attached_program_label | attached_program_category |
| --- | --- | --- |
| PROG-0001 | Attached Program Label 01 | Attached Program Category 01 |
| PROG-0002 | Attached Program Label 02 | Attached Program Category 02 |
| PROG-0003 | Attached Program Label 03 | Attached Program Category 03 |
| PROG-0004 | Attached Program Label 04 | Attached Program Category 04 |
| PROG-0005 | Attached Program Label 05 | Attached Program Category 05 |
| PROG-0006 | Attached Program Label 06 | Attached Program Category 06 |

Non-recoverable transformations are governed by scheduling and trigger mechanisms that determine when irreversible operations execute. The transformation records—RECO-0001 through RECO-0004—document operations such as partition compaction, log rotation, batch compaction, and format conversion, each paired with a secondary transformation like checksum verification, index defragmentation, record purging, or index rebuild. The scheduled_at column records execution timestamps in ISO 8601 format, spanning from 2023-05-27T08:30:46 to 2025-03-09T11:37:12, while the triggered_by column distinguishes between event-driven, manual, scheduled, and API-initiated invocations. This four-way classification of trigger sources ensures that every non-recoverable transformation can be attributed to a specific operational mode, supporting both audit requirements and capacity planning.