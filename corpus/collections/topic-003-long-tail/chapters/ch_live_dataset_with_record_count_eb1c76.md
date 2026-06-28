---
chapter_id: ch_live_dataset_with_record_count_eb1c76
topic_id: 3
family: 01_foundation
cited_terms: ['dataset_with_record_count', 'process_either_started_or_completed', 'classification_basic']
model: engine-refine
---

The governance of operational data rests on a disciplined separation between entity identity, attribute definition, and value storage. Each process instance carries a unique identifier—`COMP-0001` through `COMP-0004`—that anchors its lifecycle events to a single, immutable record. These identifiers propagate across the value tables as foreign keys, ensuring that every measurement, timestamp, or status code can be traced back to the originating process. Similarly, dataset records are distinguished by identifiers such as `COUN-0001` and `COUN-0002`, each referencing a named dataset like `customer_profile_db` or `network_packet_capture` and carrying a `record` classification—`CLAS-0003`, `CLAS-0006`—that ties the dataset to a specific governance classification. The identifier, therefore, functions as the primary join key across the entire schema, enabling referential integrity between process definitions, their attribute metadata, and the heterogeneous value stores.

**t_process_either_started_or_completed**

| id | process | process_2 | process_3 |
| --- | --- | --- | --- |
| COMP-0001 | Microtome sectioning | Hash partitioning pass | Log rotation routine |
| COMP-0002 | Chromatography elution | Pressure equalization | Data retention purge |
| COMP-0003 | Reactor startup sequence | Hash partitioning pass | Data retention purge |
| COMP-0004 | Reactor startup sequence | Buffer exchange step | Baseline calibration sweep |
| COMP-0005 | ETL data ingestion | Cache invalidation sweep | Sample deidentification pass |
| COMP-0006 | PCR thermal cycle | Cache invalidation sweep | Sample deidentification pass |

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

**t_classification_basic**

| id | classification | phase | triggered_by |
| --- | --- | --- | --- |
| CLAS-0001 | sensor calibration | execution | schedule |
| CLAS-0002 | data validation | review | manual |
| CLAS-0003 | pipeline orchestration | execution | schedule |
| CLAS-0004 | sensor calibration | review | retry |
| CLAS-0005 | data ingestion | execution | event |
| CLAS-0006 | batch processing | review | retry |

Attribute semantics are captured in a dedicated definition table where each attribute is assigned a name and an XML Schema type. The attribute `duration_seconds` is typed as `xsd:decimal`, `end_time` as `xsd:dateTime`, `exit_code` as `xsd:integer`, and `host_name` as `xsd:string`. This type-level discipline ensures that values stored in the four value tables—`val_datetime`, `val_decimal`, `val_int`, and `val_varchar`—are physically and semantically consistent with their declared types. A process instance such as `COMP-0001` may carry a duration of `992.92` seconds, an exit code of `522`, a host name of `node-a01`, and an end time of `2023-09-15T18:52:08`, each value residing in the table whose schema matches its attribute's declared type. The `entity_id` column in each value table points back to the process identifier, while `attr_id` resolves to the corresponding attribute definition, forming a normalized entity-attribute-value model that avoids type collisions and preserves data integrity.

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

Classification records introduce two additional governance dimensions: `phase` and `triggered_by`. A classification such as `sensor calibration` (`CLAS-0001`) or `data validation` (`CLAS-0002`) is assigned to a phase—either `execution` or `review`—and is initiated by a trigger mechanism, which may be `schedule`, `manual`, or `retry`. These fields encode the procedural context of each classification, distinguishing between automated, operator-driven, and recovery-initiated governance actions. The `record` column in the dataset table—`CLAS-0001`, `CLAS-0003`, `CLAS-0006`—links dataset records to these classifications, thereby binding data assets to their governance lifecycle. A dataset like `financial_transactions_q3` may carry the classification `CLAS-0003` (pipeline orchestration, execution phase, schedule-triggered), while another instance of the same dataset name may carry `CLAS-0003` as well, indicating that multiple dataset versions can share a classification while differing in other attributes.

Dataset-level metadata further enriches the governance model through `size_bytes` and `version`. The `size_bytes` column records the physical footprint of each dataset—`177784075` bytes for `customer_profile_db`, `723832596` bytes for `network_packet_capture`, `973314714` bytes for one version of `financial_transactions_q3`, and `658168246` bytes for another—providing capacity planning and cost attribution data. The `version` column, ranging from `3` to `12`, tracks the evolution of each dataset over time, enabling audit trails and reproducibility. Together, `size_bytes` and `version` form a lightweight provenance mechanism: a dataset's size and version, combined with its classification and record linkage, allow operators to reconstruct the state of any data asset at any point in its lifecycle.

**t_dataset_with_record_count**

| id | dataset | record | size_bytes | version |
| --- | --- | --- | --- | --- |
| COUN-0001 | customer_profile_db | CLAS-0003 | 177784075 | 3 |
| COUN-0002 | network_packet_capture | CLAS-0006 | 723832596 | 8 |
| COUN-0003 | financial_transactions_q3 | CLAS-0001 | 973314714 | 3 |
| COUN-0004 | financial_transactions_q3 | CLAS-0003 | 658168246 | 12 |
| COUN-0005 | compliance_audit_trail | CLAS-0003 | 780581245 | 4 |
| COUN-0006 | clinical_trials_arm_b | CLAS-0002 | 519122574 | 10 |
| COUN-0007 | user_session_logs | CLAS-0003 | 692732003 | 3 |