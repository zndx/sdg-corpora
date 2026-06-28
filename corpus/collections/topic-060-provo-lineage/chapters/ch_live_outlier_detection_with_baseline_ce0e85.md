---
chapter_id: ch_live_outlier_detection_with_baseline_ce0e85
topic_id: 60
family: 02_observation_measurement
cited_terms: ['outlier_detection_with_baseline', 'dempster_combination_subclass', 'trace_subclass']
model: engine-refine
---

Outlier detection in operational telemetry rests on pairing anomalous observations against reference baselines, a relationship mediated through role-based associations. An anomaly such as a network latency jump or sensor drift is never evaluated in isolation; it is measured against a comparative standard—an expected distribution, a nominal profile, or a seasonal pattern—and the linkage between the two carries an assigned role, whether observer, owner, or reviewer. The identifier BASE-0001, for instance, anchors a record whose outlier is a network latency jump, and through its role-based association it connects to a baseline against which that jump is assessed. This triad of subject, target, and role forms the structural backbone of evidence attribution: the subject is the anomaly under scrutiny, the target is the reference against which it is measured, and the role determines the nature of the relationship, whether the baseline passively observes the deviation or actively owns the comparison.

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

Evidence fusion within this framework employs Dempster's rule of combination, a mathematical mechanism for merging uncertain observations into consolidated assessments. Each fusion fact carries a confidence value—ranging from 0.014 in the weakest association to 0.728 in the strongest—alongside a corresponding uncertainty measure that spans from 9.49 to 687.80, and a misc value representing the combined magnitude, such as 520.46 or 846.10. These facts are keyed to a combines_via_dempster dimension that classifies each fusion into a category, with labels like Combines Via Dempster Label 01 providing human-readable identification and categories such as Combines Via Dempster Category 03 enabling aggregation and filtering. The interplay between confidence and uncertainty is critical: a high-confidence fusion at 0.728 with an uncertainty of 479.57 and a misc value of 846.10 signals a robustly supported conclusion, whereas a confidence of 0.014 paired with an uncertainty of 392.06 indicates a tenuous association requiring further corroboration.

**fact_dempster**

| id | combines_via_dempster_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| COMB-0001 | COMB-0004 | 0.153 | 9.49 | 520.46 |
| COMB-0002 | COMB-0006 | 0.014 | 392.06 | 137.18 |
| COMB-0003 | COMB-0003 | 0.025 | 687.80 | 197.61 |
| COMB-0004 | COMB-0004 | 0.728 | 479.57 | 846.10 |
| COMB-0005 | COMB-0005 | 0.918 | 172.36 | 296.96 |
| COMB-0006 | COMB-0001 | 0.755 | 608.06 | 341.51 |

**dim_combines_via_dempster**

| id | combines_via_dempster_label | combines_via_dempster_category |
| --- | --- | --- |
| COMB-0001 | Combines Via Dempster Label 01 | Combines Via Dempster Category 01 |
| COMB-0002 | Combines Via Dempster Label 02 | Combines Via Dempster Category 02 |
| COMB-0003 | Combines Via Dempster Label 03 | Combines Via Dempster Category 03 |
| COMB-0004 | Combines Via Dempster Label 04 | Combines Via Dempster Category 04 |
| COMB-0005 | Combines Via Dempster Label 05 | Combines Via Dempster Category 05 |
| COMB-0006 | Combines Via Dempster Label 06 | Combines Via Dempster Category 06 |
| COMB-0007 | Combines Via Dempster Label 07 | Combines Via Dempster Category 07 |

**dim_spans_category**

| id | category_name |
| --- | --- |
| TRAC-0001 | Category Name 01 |
| TRAC-0002 | Category Name 02 |
| TRAC-0003 | Category Name 03 |
| TRAC-0004 | Category Name 04 |
| TRAC-0005 | Category Name 05 |
| TRAC-0006 | Category Name 06 |

**dim_spans**

| id | spans_label | spans_category | category_id |
| --- | --- | --- | --- |
| TRAC-0001 | Spans Label 01 | Spans Category 01 | TRAC-0001 |
| TRAC-0002 | Spans Label 02 | Spans Category 02 | TRAC-0006 |
| TRAC-0003 | Spans Label 03 | Spans Category 03 | TRAC-0006 |
| TRAC-0004 | Spans Label 04 | Spans Category 04 | TRAC-0003 |
| TRAC-0005 | Spans Label 05 | Spans Category 05 | TRAC-0003 |
| TRAC-0006 | Spans Label 06 | Spans Category 06 | TRAC-0006 |

Trace execution records capture the operational lifecycle of diagnostic processes, with each fact anchored by an identifier such as TRAC-0001 and linked to a parent span through a spans_key reference. The duration_seconds field quantifies the elapsed time of each trace, with values ranging from 1874.27 seconds to 3940.66 seconds, reflecting the temporal extent of the underlying operation. Exit codes—491, 900, 420, and 60 in the observed data—encode the termination status of each trace, while retry_count values spanning 179 to 459 document the resilience behavior, indicating how many times the system attempted recovery before reaching a final state. A trace with a duration of 3940.66 seconds and a retry count of 396 suggests a prolonged operation subject to repeated transient failures, whereas a shorter trace at 1874.27 seconds with 399 retries points to a different failure pattern, one characterized by rapid but frequent re-attempts.

**fact_trace**

| id | spans_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| TRAC-0001 | TRAC-0005 | 1874.27 | 491 | 399 |
| TRAC-0002 | TRAC-0002 | 2092.44 | 900 | 179 |
| TRAC-0003 | TRAC-0004 | 3940.66 | 420 | 396 |
| TRAC-0004 | TRAC-0006 | 3336.66 | 60 | 459 |

The dimensional structure supporting spans introduces a categorical layer that classifies each span by a category_name, with labels such as Spans Label 01 and categories like Spans Category 02 providing both machine-readable and human-readable organization. The category_id field within the spans dimension creates a hierarchical linkage, allowing spans to be grouped under shared categorical parents—for example, multiple spans referencing TRAC-0006 as their category_id share a common classification. This categorical taxonomy operates in parallel with the outlier detection framework, where categories such as Category Name 01 through Category Name 04 serve a similar organizational function for trace facts. The misc field appears across multiple dimensions, carrying supplementary metadata that does not fit neatly into the primary classification schema, whether as a Combines Via Dempster Label or a Spans Label, providing a flexible extension point for annotations that lack a dedicated column.