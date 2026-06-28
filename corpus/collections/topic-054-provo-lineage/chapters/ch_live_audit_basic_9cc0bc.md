---
chapter_id: ch_live_audit_basic_9cc0bc
topic_id: 54
family: 03_directive_governance
cited_terms: ['audit_basic', 'transformation_with_output_dataset', 'human_rights_impact_report']
model: engine-refine
---

Governance frameworks require a rigorous mechanism for capturing, classifying, and retrieving operational metadata across distributed systems. At the foundation of this architecture lies the identifier, a unique key that anchors every audit record and dimensional catalog, ensuring traceability from raw telemetry to executive reporting. Each audit event—whether a Telemetry Integrity Check, a Logging Compliance Review, or a Model Drift Validation—is enriched through a flexible attribute model that pairs the attr column with the attr type column, while misc fields capture free-text descriptors and operational notes. This type-aware normalization prevents schema drift and guarantees that downstream compliance queries operate against consistently formatted evidence, establishing a single source of truth for regulatory scrutiny.

**t_audit_basic**

| id | audit |
| --- | --- |
| AUDI-0001 | Telemetry Integrity Check |
| AUDI-0002 | Logging Compliance Review |
| AUDI-0003 | Logging Compliance Review |
| AUDI-0004 | Model Drift Validation |
| AUDI-0005 | Model Drift Validation |
| AUDI-0006 | Pipeline Latency Review |

**t_audit_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| AUDI-0001 | duration_seconds | xsd:decimal |
| AUDI-0002 | end_time | xsd:dateTime |
| AUDI-0003 | exit_code | xsd:integer |
| AUDI-0004 | host_name | xsd:string |
| AUDI-0005 | log_level | xsd:string |
| AUDI-0006 | phase | xsd:string |
| AUDI-0007 | retry_count | xsd:integer |
| AUDI-0008 | scheduled_at | xsd:dateTime |

**t_audit_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0002 | 2024-05-14T01:27:39 |
| AUDI-0002 | AUDI-0001 | AUDI-0008 | 2024-03-24T17:57:06 |
| AUDI-0003 | AUDI-0001 | AUDI-0009 | 2023-07-30T11:39:04 |
| AUDI-0004 | AUDI-0002 | AUDI-0002 | 2024-03-11T10:39:38 |
| AUDI-0005 | AUDI-0002 | AUDI-0008 | 2025-01-11T17:40:44 |
| AUDI-0006 | AUDI-0002 | AUDI-0009 | 2024-09-25T22:35:18 |
| AUDI-0007 | AUDI-0003 | AUDI-0002 | 2025-04-27T05:17:32 |
| AUDI-0008 | AUDI-0003 | AUDI-0008 | 2023-12-11T03:24:19 |

**t_audit_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0001 | 2391.38 |
| AUDI-0002 | AUDI-0002 | AUDI-0001 | 1955.36 |
| AUDI-0003 | AUDI-0003 | AUDI-0001 | 919.71 |
| AUDI-0004 | AUDI-0004 | AUDI-0001 | 338.61 |
| AUDI-0005 | AUDI-0005 | AUDI-0001 | 1120.15 |
| AUDI-0006 | AUDI-0006 | AUDI-0001 | 6419.06 |

**t_audit_basic_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0003 | 765 |
| AUDI-0002 | AUDI-0001 | AUDI-0007 | 217 |
| AUDI-0003 | AUDI-0002 | AUDI-0003 | 123 |
| AUDI-0004 | AUDI-0002 | AUDI-0007 | 33 |
| AUDI-0005 | AUDI-0003 | AUDI-0003 | 601 |
| AUDI-0006 | AUDI-0003 | AUDI-0007 | 361 |
| AUDI-0007 | AUDI-0004 | AUDI-0003 | 79 |
| AUDI-0008 | AUDI-0004 | AUDI-0007 | 456 |

**t_audit_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0004 | node-a01 |
| AUDI-0002 | AUDI-0001 | AUDI-0005 | Log Level 02 |
| AUDI-0003 | AUDI-0001 | AUDI-0006 | initiation |
| AUDI-0004 | AUDI-0001 | AUDI-0010 | pending |
| AUDI-0005 | AUDI-0001 | AUDI-0011 | Triggered By 05 |
| AUDI-0006 | AUDI-0002 | AUDI-0004 | ingest-21 |
| AUDI-0007 | AUDI-0002 | AUDI-0005 | Log Level 07 |
| AUDI-0008 | AUDI-0002 | AUDI-0006 | closeout |

To maintain query performance and preserve data integrity, attribute values are partitioned into dedicated storage tables keyed by the entity, which represents the specific audit instance being measured. Temporal markers, such as 2024-05-14T01:27:39 or 2023-07-30T11:39:04, reside in the datetime store, while numerical metrics like 2391.38 or 1955.36 are isolated in the decimal store. Discrete operational counters, including 765 or 217, are routed to the integer store, and categorical descriptors like node-a01, Log Level 02, initiation, or pending are housed in the varchar store. By decoupling value storage from attribute definitions, the system accommodates sparse or evolving audit requirements without requiring costly schema migrations, while the entity linkage guarantees that every extracted datum can be unambiguously traced back to its originating compliance checkpoint.

Beyond system telemetry, the framework extends to data product governance through the output dataset dimension, which classifies downstream artifacts by category and assigns descriptive labels. Transformation pipelines feeding these datasets are monitored through a fact table that captures duration seconds, exit codes, and retry counts as primary reliability indicators. A single transformation may consume 5474.59 seconds to complete, while another finishes in 150.01 seconds, reflecting the inherent variability of batch workloads. Exit codes ranging from 220 to 471 signal non-standard termination states that trigger compliance alerts, and retry counts—spiking to 357 in one instance or holding steady at 25 in another—quantify transient failure rates. Together, these metrics establish a baseline for service-level objectives and provide auditors with quantifiable evidence of data freshness and processing stability.

**fact_transformation**

| id | output_dataset_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| DATA-0001 | DATA-0004 | 2399.22 | 354 | 25 |
| DATA-0002 | DATA-0004 | 5474.59 | 220 | 357 |
| DATA-0003 | DATA-0005 | 150.01 | 471 | 150 |
| DATA-0004 | DATA-0004 | 5248.45 | 302 | 85 |
| DATA-0005 | DATA-0006 | 6668.88 | 184 | 484 |
| DATA-0006 | DATA-0004 | 777.01 | 996 | 445 |
| DATA-0007 | DATA-0005 | 6572.74 | 634 | 341 |

**dim_output_dataset**

| id | output_dataset_label | output_dataset_category |
| --- | --- | --- |
| DATA-0001 | Output Dataset Label 01 | Output Dataset Category 01 |
| DATA-0002 | Output Dataset Label 02 | Output Dataset Category 02 |
| DATA-0003 | Output Dataset Label 03 | Output Dataset Category 03 |
| DATA-0004 | Output Dataset Label 04 | Output Dataset Category 04 |
| DATA-0005 | Output Dataset Label 05 | Output Dataset Category 05 |
| DATA-0006 | Output Dataset Label 06 | Output Dataset Category 06 |

Operational governance ultimately rests on human accountability, which the framework captures through the reports on relationship and associated event counts. Each personnel or team identifier is mapped to a reporting hierarchy, categorized by reports_on_category and annotated with descriptive labels, creating a clear chain of custody for data stewardship. The event_count column aggregates activity volume per record, with observed values spanning from 167 to 491, offering a granular view of workload distribution and compliance engagement. When correlated with transformation metrics and audit attributes, these organizational signals enable risk-based auditing, allowing compliance officers to isolate high-activity reporting lines, validate control ownership, and demonstrate regulatory adherence through structured, queryable lineage.

**fact_human**

| id | reports_on_key | event_count |
| --- | --- | --- |
| REPO-0001 | REPO-0006 | 369 |
| REPO-0002 | REPO-0006 | 491 |
| REPO-0003 | REPO-0005 | 354 |
| REPO-0004 | REPO-0007 | 167 |
| REPO-0005 | REPO-0007 | 8 |
| REPO-0006 | REPO-0001 | 333 |
| REPO-0007 | REPO-0001 | 488 |
| REPO-0008 | REPO-0002 | 207 |

**dim_reports_on**

| id | reports_on_label | reports_on_category |
| --- | --- | --- |
| REPO-0001 | Reports On Label 01 | Reports On Category 01 |
| REPO-0002 | Reports On Label 02 | Reports On Category 02 |
| REPO-0003 | Reports On Label 03 | Reports On Category 03 |
| REPO-0004 | Reports On Label 04 | Reports On Category 04 |
| REPO-0005 | Reports On Label 05 | Reports On Category 05 |
| REPO-0006 | Reports On Label 06 | Reports On Category 06 |
| REPO-0007 | Reports On Label 07 | Reports On Category 07 |