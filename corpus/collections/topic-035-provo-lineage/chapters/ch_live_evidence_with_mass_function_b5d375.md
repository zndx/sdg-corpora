---
chapter_id: ch_live_evidence_with_mass_function_b5d375
topic_id: 35
family: 06_belief_structure
cited_terms: ['evidence_with_mass_function', 'dataset_was_generated_by', 'trace_originates_from']
model: engine-refine
---

The provenance infrastructure rests upon a layered taxonomy of identifiers that anchor every observable entity to its source, method, and contextual metadata. Each evidence record carries a unique identifier—FUNC-0001 through FUNC-0004—under which a mass function is assigned to characterize uncertainty: Gaussian distributions appear for both the provenance trace log and the signal capture data, while a calibration curve accompanies the calibration certificate and a normalized weight vector represents the telemetry dump. The dimension kind column classifies each evidence item along a physical axis—pressure, temperature, or mass—and the method column records whether the evidence was derived through automated, inferred, or hybrid processing. These attributes collectively establish a reproducible chain of custody, ensuring that every analytical artifact can be traced to its measurement modality and the computational technique by which it was produced.

**t_evidence_with_mass_function**

| id | evidence | mass_function | dimension_kind | method |
| --- | --- | --- | --- | --- |
| FUNC-0001 | provenance trace log | Gaussian distribution | pressure | automated |
| FUNC-0002 | calibration certificate | calibration curve | temperature | automated |
| FUNC-0003 | telemetry dump | normalized weight vector | mass | inferred |
| FUNC-0004 | signal capture data | Gaussian distribution | mass | hybrid |
| FUNC-0005 | system event record | posterior distribution | length | automated |

**t_dataset_was_generated_by**

| id | dataset |
| --- | --- |
| GENE-0001 | supply-chain-manifest |
| GENE-0002 | satellite-imagery-stack |
| GENE-0003 | lab-culture-growth |
| GENE-0004 | genomic-variant-call |
| GENE-0005 | lab-culture-growth |
| GENE-0006 | genomic-variant-call |
| GENE-0007 | patient-vitals-csv |
| GENE-0008 | telemetry-sensor-readings |

**t_dataset_was_generated_by_was_generated_by**

| id | was_generated_by |
| --- | --- |
| GENE-0001 | edge-compute-node |
| GENE-0002 | telemetry-collector |
| GENE-0003 | ml-training-runner |
| GENE-0004 | telemetry-collector |
| GENE-0005 | kafka-ingestion-job |
| GENE-0006 | batch-cleanup-script |

Dataset generation relationships are modeled through a ternary association that binds a subject dataset to a target producer under an explicit role. The dataset supply-chain-manifest, satellite-imagery-stack, lab-culture-growth, and genomic-variant-call are each linked to their originating systems—edge-compute-node, telemetry-collector, and ml-training-runner—through intermediate records such as GENE-0001 and GENE-0002. Within this association, the role column distinguishes between observer and contributor designations, reflecting whether the target system passively received the dataset or actively participated in its creation. The subject column identifies the dataset entity, while the target column identifies the generating system, together forming a directed provenance edge that can be queried for audit, lineage, or compliance purposes.

**t_dataset_was_generated_by__was_generated_by**

| id | dataset_id | was_generated_by_id | role |
| --- | --- | --- | --- |
| GENE-0001 | GENE-0003 | GENE-0002 | observer |
| GENE-0002 | GENE-0001 | GENE-0002 | contributor |
| GENE-0003 | GENE-0003 | GENE-0003 | contributor |
| GENE-0004 | GENE-0005 | GENE-0001 | contributor |
| GENE-0005 | GENE-0004 | GENE-0003 | observer |
| GENE-0006 | GENE-0005 | GENE-0004 | reviewer |
| GENE-0007 | GENE-0002 | GENE-0002 | reviewer |
| GENE-0008 | GENE-0007 | GENE-0006 | observer |

Temporal and operational characteristics of trace origins are captured in the fact trace dimension, where each record is keyed by an identifier such as FROM-0001 and linked to its source through the originates from column, which references another trace record—FROM-0002, FROM-0001, FROM-0005, or FROM-0004—establishing a recursive lineage graph. The duration seconds column quantifies the elapsed time of each trace event, with observed values ranging from 1874.27 seconds to 3940.66 seconds, while the exit code column records the termination status, including values 491, 900, 420, and 60. The retry count column documents the number of re-attempts before final resolution, spanning from 179 to 459 retries, providing a direct measure of operational instability or transient failure rates within the traced subsystem.

**fact_trace**

| id | originates_from_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| FROM-0001 | FROM-0002 | 1874.27 | 491 | 399 |
| FROM-0002 | FROM-0001 | 2092.44 | 900 | 179 |
| FROM-0003 | FROM-0005 | 3940.66 | 420 | 396 |
| FROM-0004 | FROM-0004 | 3336.66 | 60 | 459 |

The dimensional attributes of trace origins are further enriched by the originates from dimension, which supplies both a human-readable label and a categorical classification for each source. Labels such as Originates From Label 01 through Originates From Label 04 provide a stable display name, while the category column—Originates From Category 01 through Originates From Category 04—groups these sources into logical families for aggregation and reporting. Together with the misc column, which holds the label value, and the category column, which holds the classification, this dimension enables multi-granular filtering of trace data by both semantic label and organizational grouping. The interplay between the fact trace operational metrics and the dimension origin attributes allows analysts to correlate performance degradation—measured in duration and retry frequency—with specific source categories, supporting root-cause analysis and capacity planning across the provenance graph.

**dim_originates_from**

| id | originates_from_label | originates_from_category |
| --- | --- | --- |
| FROM-0001 | Originates From Label 01 | Originates From Category 01 |
| FROM-0002 | Originates From Label 02 | Originates From Category 02 |
| FROM-0003 | Originates From Label 03 | Originates From Category 03 |
| FROM-0004 | Originates From Label 04 | Originates From Category 04 |
| FROM-0005 | Originates From Label 05 | Originates From Category 05 |
| FROM-0006 | Originates From Label 06 | Originates From Category 06 |
| FROM-0007 | Originates From Label 07 | Originates From Category 07 |