---
chapter_id: ch_live_lift_with_support_count_27bbc4
topic_id: 12
family: 02_observation_measurement
cited_terms: ['lift_with_support_count', 'lineage_describes_transformation', 'lineage_edge_at_run_time']
model: engine-refine
---

Attributes and their typed values constitute the foundational metadata layer through which entity properties are catalogued and validated. Each attribute—whether designated as confidence, dimension_kind, method, or recorded_at—is bound to a strict type constraint such as xsd:decimal, xsd:string, or xsd:dateTime, ensuring that downstream consumers can reason about data semantics without ambiguity. A signal amplification lift identified as COUN-0001 carries a decimal-valued confidence of 0.849 alongside a dimension kind encoded as the string Dimension Kind 01, while the same entity records a timestamp of 2024-12-28T07:07:56 under the recorded_at attribute. The support_count associated with this lift reaches 32768, a magnitude that distinguishes it from peers such as COUN-0002 and COUN-0004, each of which register a support_count of merely 2048 despite sharing the sensor drift lift classification. This typed attribute model permits heterogeneous value storage—decimal measures, string labels, and datetime stamps—while preserving a unified reference architecture keyed by identifiers like COUN-0001 through COUN-0004.

**t_lift_with_support_count**

| id | lift | support_count |
| --- | --- | --- |
| COUN-0001 | signal amplification lift | 32768 |
| COUN-0002 | data pipeline lift | 2048 |
| COUN-0003 | sensor drift lift | 16384 |
| COUN-0004 | sensor drift lift | 2048 |
| COUN-0005 | fuel economy lift | 65536 |
| COUN-0006 | aerodynamic lift | 1024 |
| COUN-0007 | signal amplification lift | 32768 |
| COUN-0008 | latency reduction lift | 2048 |

**t_lift_with_support_count_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| COUN-0001 | confidence | xsd:decimal |
| COUN-0002 | dimension_kind | xsd:string |
| COUN-0003 | method | xsd:string |
| COUN-0004 | recorded_at | xsd:dateTime |
| COUN-0005 | uncertainty | xsd:decimal |
| COUN-0006 | unit | xsd:string |
| COUN-0007 | value | xsd:decimal |
| COUN-0008 | encoding | xsd:string |

**t_lift_with_support_count_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COUN-0001 | COUN-0001 | COUN-0004 | 2024-12-28T07:07:56 |
| COUN-0002 | COUN-0002 | COUN-0004 | 2023-08-28T07:06:53 |
| COUN-0003 | COUN-0003 | COUN-0004 | 2023-06-25T23:08:52 |
| COUN-0004 | COUN-0004 | COUN-0004 | 2024-05-16T16:03:55 |
| COUN-0005 | COUN-0005 | COUN-0004 | 2024-10-22T12:30:05 |
| COUN-0006 | COUN-0006 | COUN-0004 | 2023-09-08T00:35:07 |
| COUN-0007 | COUN-0007 | COUN-0004 | 2025-05-03T04:02:17 |
| COUN-0008 | COUN-0008 | COUN-0004 | 2024-04-02T09:45:25 |

**t_lift_with_support_count_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COUN-0001 | COUN-0001 | COUN-0001 | 0.849 |
| COUN-0002 | COUN-0001 | COUN-0005 | 945.35 |
| COUN-0003 | COUN-0001 | COUN-0007 | 331.44 |
| COUN-0004 | COUN-0002 | COUN-0001 | 0.258 |
| COUN-0005 | COUN-0002 | COUN-0005 | 675.58 |
| COUN-0006 | COUN-0002 | COUN-0007 | 197.74 |
| COUN-0007 | COUN-0003 | COUN-0001 | 0.111 |
| COUN-0008 | COUN-0003 | COUN-0005 | 368.51 |

**t_lift_with_support_count_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COUN-0001 | COUN-0001 | COUN-0002 | Dimension Kind 01 |
| COUN-0002 | COUN-0001 | COUN-0008 | Encoding 02 |
| COUN-0003 | COUN-0001 | COUN-0009 | nightly summary |
| COUN-0004 | COUN-0001 | COUN-0010 | es |
| COUN-0005 | COUN-0001 | COUN-0003 | hybrid |
| COUN-0006 | COUN-0001 | COUN-0006 | ratio |
| COUN-0007 | COUN-0002 | COUN-0002 | Dimension Kind 07 |
| COUN-0008 | COUN-0002 | COUN-0008 | Encoding 08 |

Lineage tracking introduces a parallel dimension of provenance governance, where each lineage instance is characterized by a label, a category, and a pair of quantitative assessments: confidence and uncertainty. The lineage identified as TRAN-0001, classified under Lineage Category 01 and labelled Lineage Label 01, exhibits a confidence of 0.645 paired with an uncertainty magnitude of 612.22, suggesting a moderately reliable but imprecise provenance chain. By contrast, TRAN-0004—belonging to Lineage Category 04—achieves a confidence of 0.779 while carrying the highest uncertainty of 708.23, illustrating that confidence and uncertainty measure orthogonal aspects of provenance quality: one reflecting the assessor's degree of belief, the other quantifying the absolute dispersion of the underlying value, which in this case registers 259.55. The lineage TRAN-0003 appears twice in the evidence, once with confidence 0.404 and uncertainty 76.69, and again with confidence 0.071 and uncertainty 133.03, demonstrating that the same lineage key can support multiple provenance assessments under differing conditions or evaluation rounds.

**fact_lineage**

| id | lineage_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| TRAN-0001 | TRAN-0001 | 0.645 | 612.22 | 903.86 |
| TRAN-0002 | TRAN-0003 | 0.071 | 133.03 | 832.18 |
| TRAN-0003 | TRAN-0005 | 0.404 | 76.69 | 862.00 |
| TRAN-0004 | TRAN-0003 | 0.779 | 708.23 | 259.55 |
| TRAN-0005 | TRAN-0003 | 0.376 | 801.99 | 986.33 |
| TRAN-0006 | TRAN-0008 | 0.744 | 956.79 | 34.40 |

**dim_lineage**

| id | lineage_label | lineage_category |
| --- | --- | --- |
| TRAN-0001 | Lineage Label 01 | Lineage Category 01 |
| TRAN-0002 | Lineage Label 02 | Lineage Category 02 |
| TRAN-0003 | Lineage Label 03 | Lineage Category 03 |
| TRAN-0004 | Lineage Label 04 | Lineage Category 04 |
| TRAN-0005 | Lineage Label 05 | Lineage Category 05 |
| TRAN-0006 | Lineage Label 06 | Lineage Category 06 |
| TRAN-0007 | Lineage Label 07 | Lineage Category 07 |
| TRAN-0008 | Lineage Label 08 | Lineage Category 08 |

Runtime execution relationships are modelled through a subject-target-role triad that captures how lineage edges materialise during actual processing. A lineage edge identified as TIME-0001 connects the subject TIME-0004 to the target TIME-0005 under the role of owner, establishing clear accountability for the batch-revenue-aggregation pipeline executing on worker-node-12. The same subject TIME-0004 also participates in a second edge, TIME-0003, where the target shifts to TIME-0001 and the role changes to reviewer, indicating that a single lineage can be both owned and audited within the same execution context. Meanwhile, TIME-0002 links subject TIME-0006 to target TIME-0003 under the observer role, reflecting a passive monitoring relationship for the customer-churn-pipeline running on job-run-8842. These role distinctions—owner, observer, reviewer—provide a granular access and accountability model that maps directly onto the operational topology of worker nodes and job runs.

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

The interplay between these three conceptual layers—typed attributes, provenance lineage, and runtime execution—forms a coherent governance architecture. Entities such as COUN-0001 are described through their attributes, traced through lineage chains annotated with confidence and uncertainty, and executed within runtime contexts where subjects and targets assume defined roles. A sensor drift lift with support_count 2048 may carry a recorded_at timestamp of 2023-08-28T07:06:53, belong to a lineage with confidence 0.779, and execute under an owner role on worker-node-12, thereby anchoring the same data asset across metadata, provenance, and operational dimensions simultaneously. This tripartite structure ensures that every data element can be queried not only for its intrinsic properties but also for its provenance reliability and its position within the active processing fabric.