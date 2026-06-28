---
chapter_id: ch_live_transformation_informed_by_64b6b2
topic_id: 42
family: 05_provo_lineage
cited_terms: ['transformation_informed_by', 'outlier_detection_with_baseline', 'transformation_min_one_output']
model: engine-refine
---

The governance of data transformation pipelines rests upon a structured taxonomy of identifiers, categories, and metadata that together establish traceability across every stage of processing. Each transformation is assigned a unique identifier—values such as INFO-0001 through INFO-0004 serve as the immutable keys by which individual runs are distinguished and audited. These identifiers anchor the transformation facts to a dimension table that classifies each run by its informed_by category and misc label, where categories range from Informed By Category 01 to Informed By Category 04 and corresponding labels include Informed By Label 01 through Informed By Label 04. The category field provides the high-level classification necessary for compliance reporting, while the misc label offers a human-readable designation that supports operational review and stakeholder communication.

**dim_informed_by**

| id | informed_by_label | informed_by_category |
| --- | --- | --- |
| INFO-0001 | Informed By Label 01 | Informed By Category 01 |
| INFO-0002 | Informed By Label 02 | Informed By Category 02 |
| INFO-0003 | Informed By Label 03 | Informed By Category 03 |
| INFO-0004 | Informed By Label 04 | Informed By Category 04 |
| INFO-0005 | Informed By Label 05 | Informed By Category 05 |
| INFO-0006 | Informed By Label 06 | Informed By Category 06 |

**t_transformation_min_one_output**

| id | transformation |
| --- | --- |
| OUTP-0001 | data normalization |
| OUTP-0002 | data normalization |
| OUTP-0003 | format conversion |
| OUTP-0004 | format conversion |
| OUTP-0005 | record deduplication |
| OUTP-0006 | feature engineering |

The operational characteristics of each transformation are captured through duration_seconds and retry_count, metrics that quantify the resource consumption and resilience of the pipeline. A transformation identified as INFO-0001 completed in 2399.22 seconds with 25 retries, whereas INFO-0002 consumed 5474.59 seconds and required 357 retries—a disparity that signals potential instability or external dependency degradation. The exit_code field, exemplified by values such as 354, 220, 471, and 302, records the termination status of each run and serves as the primary signal for alerting and post-mortem analysis. Together, duration_seconds, retry_count, and exit_code form a triad of observability metrics that enable capacity planning, SLA enforcement, and root-cause investigation across the transformation lifecycle.

**fact_transformation**

| id | informed_by_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| INFO-0001 | INFO-0001 | 2399.22 | 354 | 25 |
| INFO-0002 | INFO-0002 | 5474.59 | 220 | 357 |
| INFO-0003 | INFO-0006 | 150.01 | 471 | 150 |
| INFO-0004 | INFO-0004 | 5248.45 | 302 | 85 |
| INFO-0005 | INFO-0004 | 6668.88 | 184 | 484 |
| INFO-0006 | INFO-0001 | 777.01 | 996 | 445 |
| INFO-0007 | INFO-0005 | 6572.74 | 634 | 341 |

The relationship between outlier detection and its baselines is modeled through a junction table that links subjects to targets via a role designation. In this structure, the subject column references an outlier record—such as BASE-0001, which captures a network latency jump—while the target column references a baseline against which the outlier is evaluated, for instance BASE-0005, representing an expected distribution. The role column distinguishes the nature of the association: observer, owner, or reviewer. BASE-0001 appears as a subject in two distinct relationships, once with role observer against BASE-0005 and again with role observer against BASE-0004, indicating that a single outlier may be assessed against multiple baselines under the same evaluative stance. The outlier dimension itself enumerates phenomena including network latency jump, log flood, and sensor drift, while the baseline dimension specifies the reference models—expected distribution, nominal profile, and seasonal pattern—against which deviations are measured.

**t_outlier_detection_with_baseline**

| id | outlier |
| --- | --- |
| BASE-0001 | network latency jump |
| BASE-0002 | network latency jump |
| BASE-0003 | log flood |
| BASE-0004 | sensor drift |
| BASE-0005 | API error surge |
| BASE-0006 | disk I/O stall |

**t_outlier_detection_with_baseline_against**

| id | against |
| --- | --- |
| BASE-0001 | expected distribution |
| BASE-0002 | nominal profile |
| BASE-0003 | seasonal pattern |
| BASE-0004 | seasonal pattern |
| BASE-0005 | statistical baseline |
| BASE-0006 | control group dataset |
| BASE-0007 | seasonal pattern |

**t_outlier_detection_with_baseline__against**

| id | outlier_id | against_id | role |
| --- | --- | --- | --- |
| BASE-0001 | BASE-0001 | BASE-0005 | observer |
| BASE-0002 | BASE-0001 | BASE-0004 | owner |
| BASE-0003 | BASE-0004 | BASE-0002 | reviewer |
| BASE-0004 | BASE-0003 | BASE-0002 | observer |
| BASE-0005 | BASE-0004 | BASE-0007 | observer |
| BASE-0006 | BASE-0005 | BASE-0003 | observer |
| BASE-0007 | BASE-0006 | BASE-0006 | owner |
| BASE-0008 | BASE-0001 | BASE-0003 | reviewer |

A parallel junction structure governs the mapping between transformations and their output datasets. Here, the subject column references a transformation record such as OUTP-0006, which encompasses data normalization, and the target column references an output dataset like OUTP-0003, identified as a curated events table. The role column again distinguishes the nature of the association, with values of reviewer, contributor, and observer appearing across the relationships. OUTP-0006 demonstrates a fan-out pattern, producing three distinct output datasets—OUTP-0003, OUTP-0005, and OUTP-0001—under roles of contributor, contributor, and reviewer respectively, illustrating how a single transformation can feed multiple downstream consumers with varying levels of accountability. The transformation dimension enumerates operations including data normalization and format conversion, while the output dataset dimension catalogs artifacts such as parsed access logs, curated events tables, and standardized inventory indexes, each representing a concrete deliverable of the processing pipeline.

**t_transformation_min_one_output_output_dataset**

| id | output_dataset |
| --- | --- |
| OUTP-0001 | parsed access logs |
| OUTP-0002 | curated events table |
| OUTP-0003 | curated events table |
| OUTP-0004 | standardized inventory index |
| OUTP-0005 | curated events table |
| OUTP-0006 | normalized feature set |

**t_transformation_min_one_output__output_dataset**

| id | transformation_id | output_dataset_id | role |
| --- | --- | --- | --- |
| OUTP-0001 | OUTP-0006 | OUTP-0003 | reviewer |
| OUTP-0002 | OUTP-0006 | OUTP-0005 | contributor |
| OUTP-0003 | OUTP-0006 | OUTP-0001 | contributor |
| OUTP-0004 | OUTP-0003 | OUTP-0003 | observer |
| OUTP-0005 | OUTP-0001 | OUTP-0004 | contributor |
| OUTP-0006 | OUTP-0002 | OUTP-0006 | observer |
| OUTP-0007 | OUTP-0004 | OUTP-0001 | owner |
| OUTP-0008 | OUTP-0005 | OUTP-0002 | contributor |