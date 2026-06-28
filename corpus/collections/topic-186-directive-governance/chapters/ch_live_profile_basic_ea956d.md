---
chapter_id: ch_live_profile_basic_ea956d
topic_id: 186
family: 02_observation_measurement
cited_terms: ['profile_basic', 'lineage_edge_at_run_time', 'aggregation_aggregates_measurement']
model: engine-refine
---

Aggregates and profiles constitute the two principal entity types in a data governance architecture, each tracked through a pair of fact and dimension tables that separate measurable quantities from descriptive metadata. The fact tables—fact_aggregation and fact_profile—store numeric observations alongside quality signals, while the dimension tables—dim_aggregates and dim_profile—attach human-readable labels and categorical classifications to the same identifiers. An identifier such as MEAS-0001 or PROF-0001 serves as the stable key that binds a fact record to its corresponding dimension record, enabling joins across the schema without ambiguity. The dimension tables further introduce a category hierarchy: dim_aggregates carries a category_id foreign key that references dim_aggregates_category, so that Aggregates Category 01 maps through Category Name 01, and similarly dim_profile classifies each profile into a profile_category such as Profile Category 01 or Profile Category 02. This separation of measure from classification supports both analytical roll-ups and governance audits.

**dim_profile**

| id | profile_label | profile_category |
| --- | --- | --- |
| PROF-0001 | Profile Label 01 | Profile Category 01 |
| PROF-0002 | Profile Label 02 | Profile Category 02 |
| PROF-0003 | Profile Label 03 | Profile Category 03 |
| PROF-0004 | Profile Label 04 | Profile Category 04 |
| PROF-0005 | Profile Label 05 | Profile Category 05 |
| PROF-0006 | Profile Label 06 | Profile Category 06 |
| PROF-0007 | Profile Label 07 | Profile Category 07 |

**dim_aggregates_category**

| id | category_name |
| --- | --- |
| MEAS-0001 | Category Name 01 |
| MEAS-0002 | Category Name 02 |
| MEAS-0003 | Category Name 03 |
| MEAS-0004 | Category Name 04 |
| MEAS-0005 | Category Name 05 |
| MEAS-0006 | Category Name 06 |

**dim_aggregates**

| id | aggregates_label | aggregates_category | category_id |
| --- | --- | --- | --- |
| MEAS-0001 | Aggregates Label 01 | Aggregates Category 01 | MEAS-0002 |
| MEAS-0002 | Aggregates Label 02 | Aggregates Category 02 | MEAS-0003 |
| MEAS-0003 | Aggregates Label 03 | Aggregates Category 03 | MEAS-0003 |
| MEAS-0004 | Aggregates Label 04 | Aggregates Category 04 | MEAS-0005 |
| MEAS-0005 | Aggregates Label 05 | Aggregates Category 05 | MEAS-0001 |
| MEAS-0006 | Aggregates Label 06 | Aggregates Category 06 | MEAS-0001 |
| MEAS-0007 | Aggregates Label 07 | Aggregates Category 07 | MEAS-0003 |

Confidence and uncertainty form a complementary pair of quality signals that accompany every measurement in the fact tables. Confidence is expressed as a probability between zero and one—0.994 for PROF-0002 indicates near-certainty, whereas 0.024 for MEAS-0004 signals extreme doubt—while uncertainty is an absolute magnitude, ranging from 284.36 to 622.09 for profiles and from 527.80 to 850.83 for aggregates. These two dimensions capture different aspects of measurement error: confidence reflects the model's or process's self-assessed reliability, and uncertainty quantifies the expected deviation in the units of the measured value itself. A record like PROF-0003 with confidence 0.773 and uncertainty 622.09 illustrates that moderate self-assurance can coexist with a wide error band, a pattern that downstream consumers must account for when aggregating or comparing results. The misc column—holding values such as 728.94 or 952.80—stores the actual measurement or derived quantity, completing the triad of what was measured, how sure the system is, and how much error to expect.

**fact_profile**

| id | profile_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| PROF-0001 | PROF-0005 | 0.299 | 284.36 | 728.94 |
| PROF-0002 | PROF-0005 | 0.994 | 557.92 | 380.57 |
| PROF-0003 | PROF-0003 | 0.773 | 622.09 | 607.36 |
| PROF-0004 | PROF-0006 | 0.226 | 488.10 | 448.09 |

**fact_aggregation**

| id | aggregates_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| MEAS-0001 | MEAS-0003 | 0.857 | 811.48 | 835.01 |
| MEAS-0002 | MEAS-0004 | 0.688 | 850.83 | 952.80 |
| MEAS-0003 | MEAS-0006 | 0.639 | 844.56 | 52.67 |
| MEAS-0004 | MEAS-0003 | 0.024 | 527.80 | 996.14 |
| MEAS-0005 | MEAS-0004 | 0.062 | 315.40 | 941.21 |

Lineage tracking introduces a second relational layer that records how data flows through pipelines and which systems or processes are responsible at execution time. The table t_lineage_edge_at_run_time stores lineage descriptors—batch-revenue-aggregation, customer-churn-pipeline, climate-data-ingest, genomic-sequence-align—each keyed by an identifier such as TIME-0001. The companion table t_lineage_edge_at_run_time_at_run_time captures the runtime context in which those lineage edges materialized, recording values like worker-node-12, job-run-8842, and batch-queue-primary. Together, these two tables describe not just what pipeline produced a datum but where and under what execution conditions it was generated, which is essential for incident response, reproducibility, and regulatory compliance.

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

The junction table t_lineage_edge_at_run_time__at_run_time binds lineage edges to their runtime contexts through a subject-target-role pattern. The lineage_id column (subject) references a record in t_lineage_edge_at_run_time, the at_run_time_id column (target) references a record in t_lineage_edge_at_run_time_at_run_time, and the role column—taking values such as owner, observer, or reviewer—describes the nature of the relationship. For example, TIME-0004 (genomic-sequence-align) appears as the subject in three rows, linked to different runtime targets under different roles: owner against TIME-0005, owner again against TIME-0005 in a separate edge, and reviewer against TIME-0001. This structure supports fine-grained accountability, allowing an organization to distinguish which component owns a pipeline, which observes its output, and which reviews its correctness, all within a single normalized relationship table.

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