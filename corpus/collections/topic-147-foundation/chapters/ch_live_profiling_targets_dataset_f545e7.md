---
chapter_id: ch_live_profiling_targets_dataset_f545e7
topic_id: 147
family: 02_observation_measurement
cited_terms: ['profiling_targets_dataset', 'verification_basic', 'mass_function_with_focal_element']
model: engine-refine
---

Profiling constitutes the foundational observability layer within the verification governance framework, capturing execution characteristics through a fact-dimension architecture that separates measurable telemetry from descriptive metadata. The fact table records each profiling invocation with a unique identifier—DATA-0001 through DATA-0004—and associates it with a profiling key that groups related runs, such as DATA-0006 appearing across three distinct invocations. Duration in seconds provides the primary temporal measure, ranging from 1113.38 seconds for the shortest execution to 6716.87 seconds for the longest, while exit codes—725, 809, 348, and 827—encode the termination state of each profiling session. Retry counts, spanning from 186 to 303, quantify the number of recovery attempts before final resolution, offering a direct signal of operational stability. The companion dimension table enriches these measurements with a profiling label, such as "Profiling Label 01" through "Profiling Label 04," and a profiling category—"Profiling Category 01" through "Profiling Category 04"—that classifies the nature of the work being measured. This separation of concerns between quantitative telemetry and qualitative classification enables both granular performance analysis and aggregated reporting across category boundaries.

**fact_profiling**

| id | profiling_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| DATA-0001 | DATA-0003 | 6716.87 | 725 | 209 |
| DATA-0002 | DATA-0006 | 1113.38 | 809 | 186 |
| DATA-0003 | DATA-0006 | 2546.61 | 348 | 303 |
| DATA-0004 | DATA-0006 | 2074.93 | 827 | 264 |

**dim_profiling**

| id | profiling_label | profiling_category |
| --- | --- | --- |
| DATA-0001 | Profiling Label 01 | Profiling Category 01 |
| DATA-0002 | Profiling Label 02 | Profiling Category 02 |
| DATA-0003 | Profiling Label 03 | Profiling Category 03 |
| DATA-0004 | Profiling Label 04 | Profiling Category 04 |
| DATA-0005 | Profiling Label 05 | Profiling Category 05 |
| DATA-0006 | Profiling Label 06 | Profiling Category 06 |

**t_verification_basic**

| id | verification |
| --- | --- |
| VERI-0001 | Compliance snapshot test |
| VERI-0002 | Calibration certificate review |
| VERI-0003 | Pipeline integrity check |
| VERI-0004 | Sensor drift assessment |
| VERI-0005 | Access control audit |
| VERI-0006 | Metadata reconciliation |

The attribute-value model provides a flexible schema for storing verification metadata without requiring rigid table structures for every new property. A central attribute definition table enumerates the properties under governance, pairing each attr_name—such as duration_seconds, end_time, exit_code, and host_name—with its attr_type, expressed in XML Schema Datatypes including xsd:decimal, xsd:dateTime, xsd:integer, and xsd:string. This type discipline ensures that values stored in the corresponding value tables conform to their declared semantics. The value tables are partitioned by type: decimal values like 500.97, 4488.38, 4833.98, and 3565.06 reside in one table; integer values such as 182, 65, 828, and 38 in another; datetime values including 2023-02-01T08:41:13, 2023-06-06T17:03:25, 2025-05-09T15:15:58, and 2023-06-08T16:52:03 in a third; and varchar values like "ingest-21," "Log Level 02," "execution," and "complete" in a fourth. Each value row is anchored by an entity_id that references a verification record—VERI-0001 through VERI-0004—and an attr_id that points to the attribute definition, creating a normalized star schema where the entity serves as the grain of observation. The verification records themselves carry descriptive labels such as "Compliance snapshot test," "Calibration certificate review," "Pipeline integrity check," and "Sensor drift assessment," providing human-readable context for the machine-stored attribute values.

**t_verification_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| VERI-0001 | duration_seconds | xsd:decimal |
| VERI-0002 | end_time | xsd:dateTime |
| VERI-0003 | exit_code | xsd:integer |
| VERI-0004 | host_name | xsd:string |
| VERI-0005 | log_level | xsd:string |
| VERI-0006 | phase | xsd:string |
| VERI-0007 | retry_count | xsd:integer |
| VERI-0008 | scheduled_at | xsd:dateTime |

**t_verification_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0002 | 2023-02-01T08:41:13 |
| VERI-0002 | VERI-0001 | VERI-0008 | 2023-06-06T17:03:25 |
| VERI-0003 | VERI-0001 | VERI-0009 | 2025-05-09T15:15:58 |
| VERI-0004 | VERI-0002 | VERI-0002 | 2023-06-08T16:52:03 |
| VERI-0005 | VERI-0002 | VERI-0008 | 2025-05-17T22:11:58 |
| VERI-0006 | VERI-0002 | VERI-0009 | 2024-06-13T13:20:10 |
| VERI-0007 | VERI-0003 | VERI-0002 | 2023-04-20T09:43:00 |
| VERI-0008 | VERI-0003 | VERI-0008 | 2023-10-14T11:07:55 |

**t_verification_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0001 | 500.97 |
| VERI-0002 | VERI-0002 | VERI-0001 | 4488.38 |
| VERI-0003 | VERI-0003 | VERI-0001 | 4833.98 |
| VERI-0004 | VERI-0004 | VERI-0001 | 3565.06 |
| VERI-0005 | VERI-0005 | VERI-0001 | 2509.98 |
| VERI-0006 | VERI-0006 | VERI-0001 | 2611.50 |

**t_verification_basic_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0003 | 182 |
| VERI-0002 | VERI-0001 | VERI-0007 | 65 |
| VERI-0003 | VERI-0002 | VERI-0003 | 828 |
| VERI-0004 | VERI-0002 | VERI-0007 | 38 |
| VERI-0005 | VERI-0003 | VERI-0003 | 137 |
| VERI-0006 | VERI-0003 | VERI-0007 | 337 |
| VERI-0007 | VERI-0004 | VERI-0003 | 858 |
| VERI-0008 | VERI-0004 | VERI-0007 | 112 |

**t_verification_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0004 | ingest-21 |
| VERI-0002 | VERI-0001 | VERI-0005 | Log Level 02 |
| VERI-0003 | VERI-0001 | VERI-0006 | execution |
| VERI-0004 | VERI-0001 | VERI-0010 | complete |
| VERI-0005 | VERI-0001 | VERI-0011 | Triggered By 05 |
| VERI-0006 | VERI-0002 | VERI-0004 | edge-03 |
| VERI-0007 | VERI-0002 | VERI-0005 | Log Level 07 |
| VERI-0008 | VERI-0002 | VERI-0006 | initiation |

Confidence assessment operates as a parallel governance mechanism, quantifying the reliability of evidence through a mass function model that assigns belief masses to focal elements. Each focal element—identified by a verification record such as VERI-0002, VERI-0005, or VERI-0003—receives a mass value drawn from a domain-specific measurement scale, exemplified by entries like "1.5L coolant sample," "3.7g soil core," "920g polymer pellet," and a second "3.7g soil core" assignment. The confidence score attached to each assignment, ranging from 0.033 for the least reliable to 0.941 for the most, provides a normalized probability-like measure of evidentiary strength. The method field classifies how the assessment was produced—manual, hybrid, or automated—enabling auditors to distinguish between human-reviewed determinations and system-generated ones. This tripartite classification supports governance policies that may require manual review for high-stakes decisions or permit automated assessments for routine checks. The focal element structure, by linking mass assignments to specific verification records, creates an auditable chain from raw measurement through confidence scoring to the underlying verification activity.

**t_mass_function_with_focal_element**

| id | mass | focal_element | confidence | method |
| --- | --- | --- | --- | --- |
| ELEM-0001 | 1.5L coolant sample | VERI-0002 | 0.863 | manual |
| ELEM-0002 | 3.7g soil core | VERI-0005 | 0.119 | hybrid |
| ELEM-0003 | 920g polymer pellet | VERI-0002 | 0.941 | automated |
| ELEM-0004 | 3.7g soil core | VERI-0003 | 0.033 | hybrid |
| ELEM-0005 | 500MB telemetry dump | VERI-0005 | 0.250 | hybrid |

Together, these components form an integrated observability and assurance architecture. Profiling metrics capture the operational behavior of verification executions, the attribute-value model stores the rich metadata that contextualizes each verification event, and the mass function model quantifies the reliability of the evidence produced. The identifier system—spanning DATA- prefixed keys for profiling, VERI- prefixed keys for verification entities and attributes, and ELEM- prefixed keys for mass function elements—provides a consistent addressing scheme across all three layers. Exit codes and retry counts from the profiling fact table signal operational health, while confidence scores and method classifications from the mass function table signal evidentiary quality. Duration measurements, whether stored as xsd:decimal attributes or captured as profiling duration_seconds, provide the temporal dimension that enables trend analysis and SLA monitoring. The category classifications from the profiling dimension and the method classifications from the mass function table offer orthogonal axes for aggregation and reporting, supporting both operational dashboards and compliance audits.