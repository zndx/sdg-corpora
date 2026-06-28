---
chapter_id: ch_live_ebpfprogram_governed_by_security_policy_6ef714
topic_id: 24
family: 04_ebpf_kernel
cited_terms: ['ebpfprogram_governed_by_security_policy', 'dataset_was_derived_from', 'evidence_with_mass_function']
model: engine-refine
---

In systems governed by rigorous provenance and evidence management, the tracking of eBPF programs and their derivation lineage demands a structured separation of factual measurements from descriptive metadata. The eBPF program fact table anchors this architecture with an identifier column that assigns unique keys such as POLI-0001 through POLI-0004, each cross-referenced to an ebpfprogram_key that may itself denote a distinct program variant—POLI-0003, for instance, appears both as a primary identifier and as a referenced key across multiple rows, indicating reuse or versioning relationships. Accompanying these identifiers are size_bytes values that span an order of magnitude, from 113,209,263 bytes for one entry to 784,335,640 bytes for another, and version numbers ranging from 9 to 12, capturing the lifecycle state of each program artifact. The companion dimension table enriches these facts with human-readable labels—Ebpfprogram Label 01 through Ebpfprogram Label 04—and a category column that groups programs into classifications such as Ebpfprogram Category 01 through Ebpfprogram Category 04, enabling analytical rollups without polluting the fact table with descriptive noise.

**fact_ebpfprogram**

| id | ebpfprogram_key | size_bytes | version |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | 784335640 | 12 |
| POLI-0002 | POLI-0003 | 641704069 | 9 |
| POLI-0003 | POLI-0003 | 113209263 | 11 |
| POLI-0004 | POLI-0005 | 161013093 | 12 |
| POLI-0005 | POLI-0004 | 352203820 | 12 |
| POLI-0006 | POLI-0003 | 167519051 | 1 |

**dim_ebpfprogram**

| id | ebpfprogram_label | ebpfprogram_category |
| --- | --- | --- |
| POLI-0001 | Ebpfprogram Label 01 | Ebpfprogram Category 01 |
| POLI-0002 | Ebpfprogram Label 02 | Ebpfprogram Category 02 |
| POLI-0003 | Ebpfprogram Label 03 | Ebpfprogram Category 03 |
| POLI-0004 | Ebpfprogram Label 04 | Ebpfprogram Category 04 |
| POLI-0005 | Ebpfprogram Label 05 | Ebpfprogram Category 05 |
| POLI-0006 | Ebpfprogram Label 06 | Ebpfprogram Category 06 |
| POLI-0007 | Ebpfprogram Label 07 | Ebpfprogram Category 07 |
| POLI-0008 | Ebpfprogram Label 08 | Ebpfprogram Category 08 |

The derivation lineage of datasets is captured through a tripartite relationship structure that distinguishes source artifacts from their derived products and the roles each party plays in the transformation. One table records the derived dataset itself—iot_edge_logs, patient_demographics_clean, market_index_history, and archival patient_demographics_clean—while a parallel table enumerates the originating sources: raw_sensor_stream, warehouse_staging_area, regulatory_filing_pdf, and archival_tape_restore. These two streams converge in a junction table that explicitly names the subject as the dataset_id and the target as the was_derived_from_id, with a role column that classifies the relationship as either contributor or owner. The record FROM-0001, for example, links dataset FROM-0001 to source FROM-0001 with the role of contributor, whereas FROM-0001 also appears as a subject paired with was_derived_from_id FROM-0002 under the role of owner, demonstrating that a single dataset may occupy multiple positions in the derivation graph with distinct responsibilities.

**t_dataset_was_derived_from**

| id | dataset |
| --- | --- |
| FROM-0001 | iot_edge_logs |
| FROM-0002 | patient_demographics_clean |
| FROM-0003 | market_index_history |
| FROM-0004 | patient_demographics_clean |
| FROM-0005 | sensor_readings_2023 |
| FROM-0006 | sensor_readings_2023 |

**t_dataset_was_derived_from_was_derived_from**

| id | was_derived_from |
| --- | --- |
| FROM-0001 | raw_sensor_stream |
| FROM-0002 | warehouse_staging_area |
| FROM-0003 | regulatory_filing_pdf |
| FROM-0004 | archival_tape_restore |
| FROM-0005 | external_credit_bureau |
| FROM-0006 | archival_tape_restore |
| FROM-0007 | external_credit_bureau |
| FROM-0008 | external_credit_bureau |

**t_dataset_was_derived_from__was_derived_from**

| id | dataset_id | was_derived_from_id | role |
| --- | --- | --- | --- |
| FROM-0001 | FROM-0002 | FROM-0004 | contributor |
| FROM-0002 | FROM-0001 | FROM-0001 | contributor |
| FROM-0003 | FROM-0005 | FROM-0006 | contributor |
| FROM-0004 | FROM-0001 | FROM-0002 | owner |
| FROM-0005 | FROM-0006 | FROM-0006 | owner |
| FROM-0006 | FROM-0003 | FROM-0008 | owner |
| FROM-0007 | FROM-0006 | FROM-0005 | reviewer |
| FROM-0008 | FROM-0004 | FROM-0005 | contributor |

Evidence evaluation within this framework is formalized through a table that pairs each piece of evidence with a mass function, a dimension kind, and an assessment method. The evidence column holds concrete artifacts such as a provenance trace log, a calibration certificate, a telemetry dump, and signal capture data, each of which is assigned a mass_function that quantifies its reliability—Gaussian distribution appears for both the provenance trace log and the signal capture data, while a calibration curve and a normalized weight vector serve the certificate and telemetry dump respectively. The dimension_kind column constrains the physical or analytical domain to pressure, temperature, or mass, with mass appearing twice across different evidence items, and the method column distinguishes between automated, inferred, and hybrid assessment approaches, with automated processing applied to the provenance trace log and calibration certificate, inferred analysis used for the telemetry dump, and a hybrid method reserved for the signal capture data.

**t_evidence_with_mass_function**

| id | evidence | mass_function | dimension_kind | method |
| --- | --- | --- | --- | --- |
| FUNC-0001 | provenance trace log | Gaussian distribution | pressure | automated |
| FUNC-0002 | calibration certificate | calibration curve | temperature | automated |
| FUNC-0003 | telemetry dump | normalized weight vector | mass | inferred |
| FUNC-0004 | signal capture data | Gaussian distribution | mass | hybrid |
| FUNC-0005 | system event record | posterior distribution | length | automated |