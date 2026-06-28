---
chapter_id: ch_live_tc_classifier_subclass_87223b
topic_id: 42
family: 07_long_tail
cited_terms: ['tc_classifier_subclass', 'transformation_not_recoverable', 'foreign_key_relation']
model: engine-refine
---

The classification of data assets rests upon a structured taxonomy in which each entity receives a unique identifier and is assigned to a category that governs its treatment throughout the lifecycle. In the classifier fact table, identifiers such as CLAS-0001 through CLAS-0004 anchor individual classification records, each of which is linked to a direction dimension via the t_c_direction_key column. That dimension table, dim_t_c_direction, supplies both a human-readable label—T C Direction Label 01, T C Direction Label 02, and so forth—and a categorical grouping, T C Direction Category 01 through T C Direction Category 04, which serves as the primary axis for grouping and filtering classification records. The version column on the classifier fact table, taking values from 1 to 9, records the revision state of each classification entry, enabling auditors to trace when a particular categorization was established or amended.

**fact_classifier**

| id | t_c_direction_key | size_bytes | version |
| --- | --- | --- | --- |
| CLAS-0001 | CLAS-0001 | 643947353 | 2 |
| CLAS-0002 | CLAS-0004 | 883422563 | 1 |
| CLAS-0003 | CLAS-0001 | 772730446 | 1 |
| CLAS-0004 | CLAS-0006 | 623892633 | 9 |
| CLAS-0005 | CLAS-0002 | 61512113 | 4 |
| CLAS-0006 | CLAS-0007 | 798328963 | 5 |
| CLAS-0007 | CLAS-0002 | 968248258 | 9 |

**dim_t_c_direction**

| id | t_c_direction_label | t_c_direction_category |
| --- | --- | --- |
| CLAS-0001 | T C Direction Label 01 | T C Direction Category 01 |
| CLAS-0002 | T C Direction Label 02 | T C Direction Category 02 |
| CLAS-0003 | T C Direction Label 03 | T C Direction Category 03 |
| CLAS-0004 | T C Direction Label 04 | T C Direction Category 04 |
| CLAS-0005 | T C Direction Label 05 | T C Direction Category 05 |
| CLAS-0006 | T C Direction Label 06 | T C Direction Category 06 |
| CLAS-0007 | T C Direction Label 07 | T C Direction Category 07 |

Size considerations enter the picture through the size_bytes column on the classifier, which stores values in the hundreds of megabytes—643,947,353 bytes for CLAS-0001, 883,422,563 for CLAS-0002, 772,730,446 for CLAS-0003, and 623,892,633 for CLAS-0004. These figures are not merely metadata; they inform retention policies, storage allocation, and the risk assessment of transformations that operate on the underlying data. A classification record attached to a dataset exceeding 800 megabytes carries different compliance implications than one attached to a dataset under 650 megabytes, particularly when the associated t_c_direction_category dictates that the data must be preserved for audit or regulatory purposes.

Non-recoverable transformations are tracked in a separate fact table, t_transformation_not_recoverable, where each record is identified by a code such as RECO-0001 through RECO-0004. The transformation column enumerates the operation—partition compaction, log rotation, batch compaction, format conversion—while the transformation_2 column captures a secondary or complementary action, including checksum verification, index defragmentation, record purging, and index rebuild. The scheduled_at column records the planned execution time in ISO 8601 format, with entries such as 2023-05-27T08:30:46 and 2025-03-09T11:37:12, and the triggered_by column specifies the origin of the execution request: event, manual, schedule, or api. Together, these fields establish a complete audit trail for every irreversible data operation, enabling post-incident review and regulatory reporting.

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

The relationships between system components are modeled through a three-table foreign-key schema. The t_foreign_key_relation table assigns each relationship a unique identifier—RELA-0001 through RELA-0004—and names the source entity, such as batch_workflows, config_snapshots, metric_snapshots, or schema_versions. The t_foreign_key_relation_foreign_key_to table identifies the target entity, including system_clocks, schema_definitions, data_lake_catalog, and core_products. The junction table, t_foreign_key_relation__foreign_key_to, binds the two together: its foreign_id column (labeled subject) references a source identifier, its foreign_key_to_id column (labeled target) references a destination identifier, and its role column declares the nature of the dependency, taking values of owner or contributor. For example, RELA-0003 appears as a subject in two distinct relationships, pointing to targets RELA-0005 and RELA-0006 under the roles of owner and contributor respectively, while RELA-0006 serves as a target under the contributor role linked to RELA-0002. This structure makes it possible to reconstruct the full dependency graph and to determine, at any point, which component owns which downstream reference and which merely contributes to it.

**t_foreign_key_relation**

| id | foreign |
| --- | --- |
| RELA-0001 | batch_workflows |
| RELA-0002 | config_snapshots |
| RELA-0003 | metric_snapshots |
| RELA-0004 | schema_versions |
| RELA-0005 | query_executions |
| RELA-0006 | batch_workflows |
| RELA-0007 | data_ingestion_jobs |
| RELA-0008 | metric_snapshots |

**t_foreign_key_relation_foreign_key_to**

| id | foreign_key_to |
| --- | --- |
| RELA-0001 | system_clocks |
| RELA-0002 | schema_definitions |
| RELA-0003 | data_lake_catalog |
| RELA-0004 | core_products |
| RELA-0005 | identity_provider |
| RELA-0006 | data_lake_catalog |

**t_foreign_key_relation__foreign_key_to**

| id | foreign_id | foreign_key_to_id | role |
| --- | --- | --- | --- |
| RELA-0001 | RELA-0003 | RELA-0005 | owner |
| RELA-0002 | RELA-0003 | RELA-0006 | owner |
| RELA-0003 | RELA-0007 | RELA-0006 | contributor |
| RELA-0004 | RELA-0006 | RELA-0002 | contributor |
| RELA-0005 | RELA-0008 | RELA-0004 | owner |
| RELA-0006 | RELA-0007 | RELA-0003 | owner |
| RELA-0007 | RELA-0004 | RELA-0002 | owner |
| RELA-0008 | RELA-0005 | RELA-0001 | owner |