---
chapter_id: ch_live_kernelhook_with_hook_kind_400085
topic_id: 42
family: 04_ebpf_kernel
cited_terms: ['kernelhook_with_hook_kind', 'transformation_not_recoverable', 'log_record_subclass']
model: engine-refine
---

Kernel hook telemetry and log severity records are anchored by a stable identifier that uniquely distinguishes each observation within the warehouse. In the kernel hook fact table, identifiers such as KIND-0001 through KIND-0004 serve as the primary key for each row, while the log fact table employs a parallel scheme—RECO-0001 through RECO-0004—to disambiguate individual log entries. These identifiers are not merely sequential markers; they provide the join keys that connect fact tables to their respective dimension tables, enabling analysts to resolve human-readable labels and categorical groupings without ambiguity. The same identifier also appears in the transformation tracking table, where RECO-0001 through RECO-0004 denote non-recoverable transformation events, ensuring that operational records can be correlated with log and hook data through a shared namespace.

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

**dim_log_severity**

| id | log_severity_label | log_severity_category |
| --- | --- | --- |
| RECO-0001 | Log Severity Label 01 | Log Severity Category 01 |
| RECO-0002 | Log Severity Label 02 | Log Severity Category 02 |
| RECO-0003 | Log Severity Label 03 | Log Severity Category 03 |
| RECO-0004 | Log Severity Label 04 | Log Severity Category 04 |
| RECO-0005 | Log Severity Label 05 | Log Severity Category 05 |
| RECO-0006 | Log Severity Label 06 | Log Severity Category 06 |
| RECO-0007 | Log Severity Label 07 | Log Severity Category 07 |

The hook kind dimension supplies the categorical taxonomy that classifies each kernel hook observation. Each identifier in dim_hook_kind maps to a hook_kind_label—Hook Kind Label 01, Hook Kind Label 02, and so forth—alongside a hook_kind_category such as Hook Kind Category 01 or Hook Kind Category 04. The fact_kernelhook table references this dimension through its hook_kind_key column, which carries values like KIND-0002 and KIND-0004 to point back to the appropriate dimension row. This star-schema arrangement ensures that every hook measurement carries both a machine-resolvable foreign key and, through the join, a human-readable label and its parent category. The category field, in particular, enables aggregation and filtering at the group level: analysts can roll up all hooks belonging to Hook Kind Category 02 without needing to enumerate individual labels.

**dim_hook_kind**

| id | hook_kind_label | hook_kind_category |
| --- | --- | --- |
| KIND-0001 | Hook Kind Label 01 | Hook Kind Category 01 |
| KIND-0002 | Hook Kind Label 02 | Hook Kind Category 02 |
| KIND-0003 | Hook Kind Label 03 | Hook Kind Category 03 |
| KIND-0004 | Hook Kind Label 04 | Hook Kind Category 04 |
| KIND-0005 | Hook Kind Label 05 | Hook Kind Category 05 |
| KIND-0006 | Hook Kind Label 06 | Hook Kind Category 06 |
| KIND-0007 | Hook Kind Label 07 | Hook Kind Category 07 |

Log severity records follow an identical dimensional pattern. The dim_log_severity table assigns each severity level a log_severity_label—Log Severity Label 01 through Log Severity Label 04—and groups them under a log_severity_category such as Log Severity Category 01 or Log Severity Category 03. The fact_log table references this taxonomy via its log_severity_key column, which holds values like RECO-0006, RECO-0004, and RECO-0001 to resolve to the corresponding severity dimension row. This design permits precise filtering of log data by severity tier while preserving the ability to aggregate across categories for compliance reporting or incident triage.

Size in bytes and version constitute the quantitative and temporal attributes that accompany both hook and log measurements. The size_bytes column in fact_kernelhook captures the byte footprint of individual hook events, ranging from 36,342,735 bytes for KIND-0001 to 560,962,979 bytes for KIND-0002, reflecting the substantial variance in hook payload sizes. Similarly, fact_log records size_bytes values such as 913,386,183 and 303,816,232, indicating the storage impact of log entries at different severity levels. The version column, present in both fact tables, tracks the schema or protocol revision associated with each measurement—values of 1, 3, 6, 7, and 10 appear across the dataset—allowing data engineers to audit version drift and ensure backward compatibility when integrating new instrumentation.

**fact_kernelhook**

| id | hook_kind_key | size_bytes | version |
| --- | --- | --- | --- |
| KIND-0001 | KIND-0002 | 36342735 | 3 |
| KIND-0002 | KIND-0004 | 560962979 | 1 |
| KIND-0003 | KIND-0007 | 456299832 | 10 |
| KIND-0004 | KIND-0004 | 272822846 | 1 |

**fact_log**

| id | log_severity_key | size_bytes | version |
| --- | --- | --- | --- |
| RECO-0001 | RECO-0006 | 913386183 | 6 |
| RECO-0002 | RECO-0004 | 303816232 | 7 |
| RECO-0003 | RECO-0007 | 758542341 | 7 |
| RECO-0004 | RECO-0001 | 442933768 | 2 |

The transformation tracking table introduces operational metadata that extends beyond telemetry into the realm of system maintenance. Each non-recoverable transformation is identified by a record such as RECO-0001 and described through two transformation columns: the primary action, which includes operations like partition compaction, log rotation, batch compaction, and format conversion, and a secondary action, encompassing follow-up procedures such as checksum verification, index defragmentation, record purging, and index rebuild. The scheduled_at column records the planned execution time in ISO 8601 format—2023-05-27T08:30:46, 2024-07-23T05:41:48, 2025-03-09T11:37:12, and 2023-08-05T01:48:14—providing an audit trail for when transformations were intended to occur. The triggered_by column captures the initiation mechanism, with values of event, manual, schedule, and api indicating whether the transformation was driven by an automated event, a human operator, a cron-like schedule, or an external API call. Together, these fields form a comprehensive record of system maintenance activities that can be correlated with log severity and hook telemetry to assess the operational impact of transformations.