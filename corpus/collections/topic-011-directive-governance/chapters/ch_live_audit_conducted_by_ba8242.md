---
chapter_id: ch_live_audit_conducted_by_ba8242
topic_id: 11
family: 03_directive_governance
cited_terms: ['audit_conducted_by', 'transformation_governed_by', 'ebpfprogram_equiv_typed_with_hook']
model: engine-refine
---

Audit execution records are anchored to a canonical audit catalogue in which each audit is identified by a unique code and assigned a descriptive title. The audit catalogue enumerates audits such as Cloud Infrastructure Review, SOC2 Compliance Review, Lab Safety Inspection, and Data Retention Policy under identifiers COND-0001 through COND-0004. Each audit is associated with a fixed schema of attributes—duration_seconds, end_time, exit_code, and host_name—whose semantic types are declared as xsd:decimal, xsd:dateTime, xsd:integer, and xsd:string respectively. This attribute registry establishes the vocabulary through which audit outcomes are measured and reported, ensuring that every captured datum conforms to a known type and can be processed by downstream analytics without ad hoc interpretation.

**t_audit_conducted_by**

| id | audit |
| --- | --- |
| COND-0001 | Cloud Infrastructure Review |
| COND-0002 | SOC2 Compliance Review |
| COND-0003 | Lab Safety Inspection |
| COND-0004 | Data Retention Policy |
| COND-0005 | Legacy Migration Check |
| COND-0006 | SOC2 Compliance Review |

**t_audit_conducted_by_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| COND-0001 | duration_seconds | xsd:decimal |
| COND-0002 | end_time | xsd:dateTime |
| COND-0003 | exit_code | xsd:integer |
| COND-0004 | host_name | xsd:string |
| COND-0005 | log_level | xsd:string |
| COND-0006 | phase | xsd:string |
| COND-0007 | retry_count | xsd:integer |
| COND-0008 | scheduled_at | xsd:dateTime |

**t_audit_conducted_by_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COND-0001 | COND-0001 | COND-0002 | 2023-06-07T00:47:02 |
| COND-0002 | COND-0001 | COND-0008 | 2025-06-08T04:54:48 |
| COND-0003 | COND-0001 | COND-0009 | 2023-02-14T08:05:22 |
| COND-0004 | COND-0002 | COND-0002 | 2023-03-04T06:34:44 |
| COND-0005 | COND-0002 | COND-0008 | 2025-02-11T04:03:38 |
| COND-0006 | COND-0002 | COND-0009 | 2024-11-06T16:59:35 |
| COND-0007 | COND-0003 | COND-0002 | 2024-02-26T03:59:36 |
| COND-0008 | COND-0003 | COND-0008 | 2023-10-26T01:36:07 |

**t_audit_conducted_by_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COND-0001 | COND-0001 | COND-0001 | 1980.42 |
| COND-0002 | COND-0002 | COND-0001 | 6184.62 |
| COND-0003 | COND-0003 | COND-0001 | 3332.18 |
| COND-0004 | COND-0004 | COND-0001 | 5867.45 |
| COND-0005 | COND-0005 | COND-0001 | 1263.06 |
| COND-0006 | COND-0006 | COND-0001 | 5705.65 |

**t_audit_conducted_by_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COND-0001 | COND-0001 | COND-0003 | 395 |
| COND-0002 | COND-0001 | COND-0007 | 293 |
| COND-0003 | COND-0002 | COND-0003 | 558 |
| COND-0004 | COND-0002 | COND-0007 | 143 |
| COND-0005 | COND-0003 | COND-0003 | 950 |
| COND-0006 | COND-0003 | COND-0007 | 140 |
| COND-0007 | COND-0004 | COND-0003 | 458 |
| COND-0008 | COND-0004 | COND-0007 | 234 |

Because the attribute values span heterogeneous data types, they are materialized in separate value tables keyed to the audit entity and the attribute definition. Decimal measurements such as 1980.42, 6184.62, 3332.18, and 5867.45 are persisted in the decimal value store, while temporal observations like 2023-06-07T00:47:02, 2025-06-08T04:54:48, 2023-02-14T08:05:22, and 2023-03-04T06:34:44 reside in the datetime value store. Integer results including 395, 293, 558, and 143 are recorded in the integer value table, and free-form strings such as node-a01, Log Level 02, review, and superseded are held in the varchar value table. This type-disaggregated design preserves precision for numeric and temporal fields while allowing unstructured annotations to coexist within the same audit record, and it enables each value table to enforce schema constraints appropriate to its data type.

**t_audit_conducted_by_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COND-0001 | COND-0001 | COND-0004 | node-a01 |
| COND-0002 | COND-0001 | COND-0005 | Log Level 02 |
| COND-0003 | COND-0001 | COND-0006 | review |
| COND-0004 | COND-0001 | COND-0010 | superseded |
| COND-0005 | COND-0001 | COND-0011 | Triggered By 05 |
| COND-0006 | COND-0002 | COND-0004 | worker-07 |
| COND-0007 | COND-0002 | COND-0005 | Log Level 07 |
| COND-0008 | COND-0002 | COND-0006 | review |

Governance transformations are tracked through a fact table that links each transformation to a priority level and a review cycle measured in days. All recorded transformations carry a priority of 2, indicating a uniform classification across the current dataset, while review cycles range from 89 days to 888 days, with intermediate values of 727 and 407 days reflecting the varying cadences at which different transformations must be reassessed. The transformation fact table references a dimension table that supplies human-readable labels and categorical groupings for each transformation, thereby separating operational metadata from descriptive metadata and allowing governance policies to be applied at the category level without modifying individual transformation records.

**fact_transformation**

| id | transformation_key | priority | review_cycle_days |
| --- | --- | --- | --- |
| GOVE-0001 | GOVE-0004 | 2 | 89 |
| GOVE-0002 | GOVE-0006 | 2 | 727 |
| GOVE-0003 | GOVE-0006 | 2 | 888 |
| GOVE-0004 | GOVE-0006 | 2 | 407 |
| GOVE-0005 | GOVE-0002 | 1 | 356 |
| GOVE-0006 | GOVE-0002 | 1 | 410 |
| GOVE-0007 | GOVE-0004 | 3 | 230 |

**dim_transformation**

| id | transformation_label | transformation_category |
| --- | --- | --- |
| GOVE-0001 | Transformation Label 01 | Transformation Category 01 |
| GOVE-0002 | Transformation Label 02 | Transformation Category 02 |
| GOVE-0003 | Transformation Label 03 | Transformation Category 03 |
| GOVE-0004 | Transformation Label 04 | Transformation Category 04 |
| GOVE-0005 | Transformation Label 05 | Transformation Category 05 |
| GOVE-0006 | Transformation Label 06 | Transformation Category 06 |

eBPF programs are catalogued in a fact table that associates each program with a program type, an attachment hook, a size in bytes, and a version number. Program sizes span from 113,209,263 bytes to 784,335,640 bytes, with intermediate values of 641,704,069 and 161,013,093 bytes, reflecting the substantial memory footprint that eBPF programs can occupy. Versions recorded include 9, 11, and 12, indicating that programs are maintained across multiple releases. The program type and attachment hook are resolved through separate dimension tables, each of which provides a label and a category for its respective concept. This separation allows the system to classify programs by their functional type and by the kernel hook to which they bind, supporting policy enforcement and resource accounting at both the type and hook granularity.

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