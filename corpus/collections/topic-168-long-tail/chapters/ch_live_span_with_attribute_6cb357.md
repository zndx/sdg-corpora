---
chapter_id: ch_live_span_with_attribute_6cb357
topic_id: 168
family: 07_long_tail
cited_terms: ['span_with_attribute', 'process_either_started_or_completed', 'lineage_edge_at_run_time']
model: engine-refine
---

Span attributes serve as the primary mechanism for instrumenting and measuring discrete execution units within a distributed system. Each span carries an identifier—values such as ATTR-0001 through ATTR-0004—and is classified by a category and labeled for human readability, as seen in Span Attribute Category 01 through 04 and their corresponding labels. The measurable dimensions of a span include its duration in seconds, which ranges from 410.92 seconds for a brief operation to 4963.54 seconds for a prolonged execution, alongside an exit code that captures the termination state—codes like 767, 893, 599, and 91 indicate distinct failure or success conditions—and a retry count that tracks how many times the system attempted recovery, with values spanning from 145 to 494 retries. This triad of duration, exit state, and retry behavior enables operators to distinguish between transient failures that self-healed and persistent errors requiring intervention.

**fact_span**

| id | span_attribute_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| ATTR-0001 | ATTR-0002 | 4963.54 | 767 | 494 |
| ATTR-0002 | ATTR-0004 | 410.92 | 893 | 145 |
| ATTR-0003 | ATTR-0004 | 3549.11 | 599 | 428 |
| ATTR-0004 | ATTR-0004 | 1972.36 | 91 | 306 |
| ATTR-0005 | ATTR-0003 | 1000.45 | 966 | 278 |
| ATTR-0006 | ATTR-0004 | 2614.88 | 676 | 0 |

**dim_span_attribute**

| id | span_attribute_label | span_attribute_category |
| --- | --- | --- |
| ATTR-0001 | Span Attribute Label 01 | Span Attribute Category 01 |
| ATTR-0002 | Span Attribute Label 02 | Span Attribute Category 02 |
| ATTR-0003 | Span Attribute Label 03 | Span Attribute Category 03 |
| ATTR-0004 | Span Attribute Label 04 | Span Attribute Category 04 |
| ATTR-0005 | Span Attribute Label 05 | Span Attribute Category 05 |
| ATTR-0006 | Span Attribute Label 06 | Span Attribute Category 06 |

Process-level attributes extend this observability beyond individual spans to encompass the broader lifecycle of complex operations. A process such as Microtome sectioning, Chromatography elution, or Reactor startup sequence is described by a set of typed attributes defined in a schema that specifies both the attribute name and its data type. The attribute types follow a strict typing discipline: durations are stored as xsd:decimal, timestamps as xsd:dateTime, integer counters as xsd:integer, and free-form text as xsd:string. This type system ensures that values are stored in the appropriate typed value table—decimal values like 992.92 or 6910.53 for duration measurements, datetime values such as 2023-09-15T18:52:08 or 2025-06-15T09:08:30 for temporal markers, integer counts like 522 or 153 for event tallies, and string values including host identifiers like node-a01, log levels, and state descriptors such as initiation or running.

The entity-attribute-value model underlying this design allows a single process instance to carry an arbitrary number of attributes without requiring schema changes to the process definition itself. An entity identifier, such as COMP-0001 or COMP-0002, serves as the anchor point to which attribute values are attached. The same attribute definition—identified by COMP-0001, for example—can be populated with different decimal values across multiple entities, enabling comparative analysis of duration or throughput across parallel executions of the same process. Similarly, the end_time attribute (COMP-0002) is populated with distinct timestamps for each entity, capturing the precise moment each process completed. This normalization eliminates data redundancy while preserving the ability to query across heterogeneous attribute types through a unified entity reference.

**t_process_either_started_or_completed**

| id | process | process_2 | process_3 |
| --- | --- | --- | --- |
| COMP-0001 | Microtome sectioning | Hash partitioning pass | Log rotation routine |
| COMP-0002 | Chromatography elution | Pressure equalization | Data retention purge |
| COMP-0003 | Reactor startup sequence | Hash partitioning pass | Data retention purge |
| COMP-0004 | Reactor startup sequence | Buffer exchange step | Baseline calibration sweep |
| COMP-0005 | ETL data ingestion | Cache invalidation sweep | Sample deidentification pass |
| COMP-0006 | PCR thermal cycle | Cache invalidation sweep | Sample deidentification pass |

**t_process_either_started_or_completed_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| COMP-0001 | duration_seconds | xsd:decimal |
| COMP-0002 | end_time | xsd:dateTime |
| COMP-0003 | exit_code | xsd:integer |
| COMP-0004 | host_name | xsd:string |
| COMP-0005 | log_level | xsd:string |
| COMP-0006 | phase | xsd:string |
| COMP-0007 | retry_count | xsd:integer |
| COMP-0008 | scheduled_at | xsd:dateTime |

**t_process_either_started_or_completed_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COMP-0001 | COMP-0001 | COMP-0002 | 2023-09-15T18:52:08 |
| COMP-0002 | COMP-0001 | COMP-0008 | 2024-08-13T16:34:41 |
| COMP-0003 | COMP-0001 | COMP-0009 | 2025-03-15T23:53:33 |
| COMP-0004 | COMP-0002 | COMP-0002 | 2025-06-15T09:08:30 |
| COMP-0005 | COMP-0002 | COMP-0008 | 2025-01-13T18:32:01 |
| COMP-0006 | COMP-0002 | COMP-0009 | 2023-05-31T03:15:32 |
| COMP-0007 | COMP-0003 | COMP-0002 | 2024-08-17T22:03:21 |
| COMP-0008 | COMP-0003 | COMP-0008 | 2023-03-17T02:37:48 |

**t_process_either_started_or_completed_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COMP-0001 | COMP-0001 | COMP-0001 | 992.92 |
| COMP-0002 | COMP-0002 | COMP-0001 | 6910.53 |
| COMP-0003 | COMP-0003 | COMP-0001 | 4781.54 |
| COMP-0004 | COMP-0004 | COMP-0001 | 3156.19 |
| COMP-0005 | COMP-0005 | COMP-0001 | 593.89 |
| COMP-0006 | COMP-0006 | COMP-0001 | 5472.77 |

**t_process_either_started_or_completed_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COMP-0001 | COMP-0001 | COMP-0003 | 522 |
| COMP-0002 | COMP-0001 | COMP-0007 | 9 |
| COMP-0003 | COMP-0002 | COMP-0003 | 153 |
| COMP-0004 | COMP-0002 | COMP-0007 | 96 |
| COMP-0005 | COMP-0003 | COMP-0003 | 508 |
| COMP-0006 | COMP-0003 | COMP-0007 | 474 |
| COMP-0007 | COMP-0004 | COMP-0003 | 5 |
| COMP-0008 | COMP-0004 | COMP-0007 | 25 |

**t_process_either_started_or_completed_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COMP-0001 | COMP-0001 | COMP-0004 | node-a01 |
| COMP-0002 | COMP-0001 | COMP-0005 | Log Level 02 |
| COMP-0003 | COMP-0001 | COMP-0006 | initiation |
| COMP-0004 | COMP-0001 | COMP-0010 | running |
| COMP-0005 | COMP-0001 | COMP-0011 | Triggered By 05 |
| COMP-0006 | COMP-0002 | COMP-0004 | ingest-21 |
| COMP-0007 | COMP-0002 | COMP-0005 | Log Level 07 |
| COMP-0008 | COMP-0002 | COMP-0006 | review |

Lineage tracking at run time provides a complementary view of how processes and their attributes relate to the infrastructure that executed them. A lineage edge—identified by values such as batch-revenue-aggregation, customer-churn-pipeline, climate-data-ingest, or genomic-sequence-align—represents a data or control dependency between system components. At any given run, this lineage is realized on specific runtime targets: worker-node-12, job-run-8842, or batch-queue-primary. The relationship between a lineage edge and its runtime target is mediated by a role that defines the nature of the association. An entity may serve as the owner of a lineage edge on a particular worker node, act as an observer monitoring the execution, or function as a reviewer responsible for audit and compliance. This role-based assignment—values such as owner, observer, and reviewer—enables fine-grained governance over which systems and operators are accountable for each step in the data pipeline.

**t_lineage_edge_at_run_time**

| id | lineage |
| --- | --- |
| TIME-0001 | batch-revenue-aggregation |
| TIME-0002 | customer-churn-pipeline |
| TIME-0003 | climate-data-ingest |
| TIME-0004 | genomic-sequence-align |
| TIME-0005 | model-training-workflow |
| TIME-0006 | user-behavior-trace |

**t_lineage_edge_at_run_time_at_run_time**

| id | at_run_time |
| --- | --- |
| TIME-0001 | worker-node-12 |
| TIME-0002 | job-run-8842 |
| TIME-0003 | worker-node-12 |
| TIME-0004 | batch-queue-primary |
| TIME-0005 | job-run-8842 |
| TIME-0006 | execution-window-4 |

**t_lineage_edge_at_run_time__at_run_time**

| id | lineage_id | at_run_time_id | role |
| --- | --- | --- | --- |
| TIME-0001 | TIME-0004 | TIME-0005 | owner |
| TIME-0002 | TIME-0006 | TIME-0003 | observer |
| TIME-0003 | TIME-0004 | TIME-0005 | owner |
| TIME-0004 | TIME-0004 | TIME-0001 | reviewer |
| TIME-0005 | TIME-0002 | TIME-0006 | contributor |
| TIME-0006 | TIME-0004 | TIME-0006 | owner |
| TIME-0007 | TIME-0005 | TIME-0004 | contributor |
| TIME-0008 | TIME-0005 | TIME-0003 | observer |