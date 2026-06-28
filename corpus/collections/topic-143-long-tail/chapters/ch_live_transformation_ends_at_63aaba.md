---
chapter_id: ch_live_transformation_ends_at_63aaba
topic_id: 143
family: 05_provo_lineage
cited_terms: ['transformation_ends_at', 'ebpfprogram_equiv_typed_with_hook', 'mass_function_assigns_to_subset']
model: engine-refine
---

The governance of low-level system programs necessitates a rigorous taxonomy of identifiers, categories, and version controls to ensure kernel integrity and operational stability. Each program is uniquely distinguished by an identifier, such as `HOOK-0001` or `HOOK-0004`, which anchors its metadata within the operational framework and serves as the primary key for all subsequent audits. The classification of these programs relies heavily on the `program_type` and `attaches_to_hook` attributes, which are cross-referenced against dimensional tables to assign specific `category` designations and `misc` labels. For instance, a program might be categorized under `Program Type Category 01` while bearing the `misc` label `Program Type Label 01`, ensuring that every execution context is precisely defined and traceable. Furthermore, operational compliance demands strict monitoring of the `size_bytes` and `version` attributes; a program like `HOOK-0001` may occupy a substantial memory footprint of 784,335,640 bytes and run on version 12, whereas `HOOK-0003` operates at a leaner 113,209,263 bytes on version 11, requiring distinct resource allocation and security review protocols.

**fact_ebpfprogram**

| id | program_type_key | attaches_to_hook_key | size_bytes | version |
| --- | --- | --- | --- | --- |
| HOOK-0001 | HOOK-0007 | HOOK-0006 | 784335640 | 12 |
| HOOK-0002 | HOOK-0006 | HOOK-0006 | 641704069 | 9 |
| HOOK-0003 | HOOK-0005 | HOOK-0001 | 113209263 | 11 |
| HOOK-0004 | HOOK-0001 | HOOK-0002 | 161013093 | 12 |
| HOOK-0005 | HOOK-0003 | HOOK-0002 | 352203820 | 12 |
| HOOK-0006 | HOOK-0007 | HOOK-0006 | 167519051 | 1 |

**dim_program_type**

| id | program_type_label | program_type_category |
| --- | --- | --- |
| HOOK-0001 | Program Type Label 01 | Program Type Category 01 |
| HOOK-0002 | Program Type Label 02 | Program Type Category 02 |
| HOOK-0003 | Program Type Label 03 | Program Type Category 03 |
| HOOK-0004 | Program Type Label 04 | Program Type Category 04 |
| HOOK-0005 | Program Type Label 05 | Program Type Category 05 |
| HOOK-0006 | Program Type Label 06 | Program Type Category 06 |
| HOOK-0007 | Program Type Label 07 | Program Type Category 07 |
| HOOK-0008 | Program Type Label 08 | Program Type Category 08 |

**dim_attaches_to_hook**

| id | attaches_to_hook_label | attaches_to_hook_category |
| --- | --- | --- |
| HOOK-0001 | Attaches To Hook Label 01 | Attaches To Hook Category 01 |
| HOOK-0002 | Attaches To Hook Label 02 | Attaches To Hook Category 02 |
| HOOK-0003 | Attaches To Hook Label 03 | Attaches To Hook Category 03 |
| HOOK-0004 | Attaches To Hook Label 04 | Attaches To Hook Category 04 |
| HOOK-0005 | Attaches To Hook Label 05 | Attaches To Hook Category 05 |
| HOOK-0006 | Attaches To Hook Label 06 | Attaches To Hook Category 06 |

The structural integrity of these classifications is maintained through dedicated reference tables that map technical keys to human-readable `misc` descriptors and hierarchical `category` groupings. When a program attaches to a specific kernel hook, the `attaches_to_hook` attribute resolves to a standardized label, such as `Attaches To Hook Label 03`, and is simultaneously assigned an `Attaches To Hook Category 03` to dictate its execution privileges and isolation boundaries. This dual-layered classification—spanning both the `program_type` and `attaches_to_hook` dimensions—prevents ambiguous assignments and ensures that every program, whether it is version 9 or version 12, adheres to the established security and performance boundaries. The `misc` fields serve as the primary interface for administrative review, allowing auditors to quickly identify the functional scope of a program without needing to parse raw technical keys, thereby streamlining the compliance verification process.

Beyond static program definitions, the operational lifecycle of data transformations is governed by strict logging and retry protocols that quantify system resilience. The terminal state of any transformation process is captured through an `identifier`, such as `ENDS-0001`, which documents the final `log_level` and the total `retry_count` incurred during execution. High-frequency processes, such as an ETL pipeline run or a telemetry normalization pass, are subject to rigorous scrutiny; a transformation might conclude with a `critical` log level after 216 retries, signaling a systemic instability that requires immediate remediation. Conversely, a routine feature engineering task might complete with a `warning` log level after 446 retries, indicating a degraded but recoverable state. These metrics are essential for maintaining service level agreements, as they provide a quantifiable history of system resilience and the frequency of transient failures across different transformation endpoints.

The assignment of mass functions to specific subsets introduces a relational framework defined by `subject`, `target`, and `role` attributes, establishing precise behavioral constraints within the system. In this context, a `subject`—identified by a code like `SUBS-0006`—is assigned to a `target`, such as `SUBS-0002` or `SUBS-0003`, assuming a specific `role` that dictates its operational behavior relative to that target. For example, a subject designated as `SUBS-0006` may assume the `observer` role when linked to various targets, establishing a passive monitoring relationship within the subset that restricts its ability to modify underlying data. This tripartite relationship ensures that every mass assignment is fully traceable, allowing the system to enforce constraints based on the `role` a subject plays. The precision of these assignments is critical for maintaining the logical consistency of the mass function, particularly when dealing with complex subsets like `FlightMass_Empty` or `DroneMass_Complete`.

**t_mass_function_assigns_to_subset**

| id | mass |
| --- | --- |
| SUBS-0001 | FlightMass_Empty |
| SUBS-0002 | TestMass_Aluminum |
| SUBS-0003 | FlightMass_Empty |
| SUBS-0004 | DroneMass_Complete |
| SUBS-0005 | CargoMass_Max |
| SUBS-0006 | DroneMass_Complete |

**t_mass_function_assigns_to_subset_assigns_mass_to**

| id | assigns_mass_to |
| --- | --- |
| SUBS-0001 | ObservationRecord |
| SUBS-0002 | SensorNode |
| SUBS-0003 | CalibrationEvent |
| SUBS-0004 | DataQualityMetric |
| SUBS-0005 | TelemetryStream |
| SUBS-0006 | GovernanceRule |

**t_mass_function_assigns_to_subset__assigns_mass_to**

| id | mass_id | assigns_mass_to_id | role |
| --- | --- | --- | --- |
| SUBS-0001 | SUBS-0006 | SUBS-0002 | observer |
| SUBS-0002 | SUBS-0006 | SUBS-0004 | observer |
| SUBS-0003 | SUBS-0001 | SUBS-0003 | observer |
| SUBS-0004 | SUBS-0006 | SUBS-0003 | observer |
| SUBS-0005 | SUBS-0002 | SUBS-0004 | owner |
| SUBS-0006 | SUBS-0002 | SUBS-0003 | reviewer |
| SUBS-0007 | SUBS-0005 | SUBS-0004 | reviewer |
| SUBS-0008 | SUBS-0006 | SUBS-0003 | observer |

Collectively, these attributes and their associated relationships form a comprehensive governance framework that bridges static program definitions with dynamic operational metrics. By standardizing the use of `identifier`, `category`, `misc`, `loglevel`, `retrycount`, `program_type`, `attaches_to_hook`, `size_bytes`, `version`, `subject`, `target`, and `role`, the system ensures that every component, from the smallest kernel hook to the most complex data transformation, is fully auditable. This level of granularity supports rigorous compliance reporting, enabling administrators to trace the lineage of a program from its initial categorization to its final execution state. Ultimately, the meticulous tracking of these attributes provides the evidentiary basis required for maintaining system integrity, optimizing resource utilization, and ensuring that all operational activities align with established regulatory and technical standards.

**t_transformation_ends_at**

| id | transformation | ended_at_time | log_level | retry_count |
| --- | --- | --- | --- | --- |
| ENDS-0001 | ETL pipeline run | 2024-02-28T16:45:12Z | info | 210 |
| ENDS-0002 | Feature engineering routine | 2024-05-17T07:30:00Z | critical | 216 |
| ENDS-0003 | Telemetry normalization pass | 2024-02-28T16:45:12Z | warning | 307 |
| ENDS-0004 | Schema migration script | 2024-04-09T11:15:30Z | warning | 446 |
| ENDS-0005 | Audit record sync | 2024-03-15T14:22:01Z | info | 371 |
| ENDS-0006 | Schema migration script | 2024-05-17T07:30:00Z | info | 187 |
| ENDS-0007 | Data reconciliation workflow | 2023-09-30T23:59:59Z | error | 426 |
| ENDS-0008 | ETL pipeline run | 2024-01-22T18:10:55Z | warning | 196 |