---
chapter_id: ch_live_outlier_detection_with_baseline_8cd7c1
topic_id: 60
family: 02_observation_measurement
cited_terms: ['outlier_detection_with_baseline', 'pignistic_transformation', 'outlier_claim_supported_by']
model: engine-refine
---

Outlier detection frameworks require precise identification of anomalous events and the baselines against which they are evaluated. An observation such as a network latency jump or a sensor drift is first catalogued under a unique identifier—BASE-0001 through BASE-0004 in the reference corpus—and then mapped to a reference against which deviation is measured. The against dimension encodes the expected state: an expected distribution, a nominal profile, or a seasonal pattern. This mapping is not one-to-one; a single outlier may be assessed against multiple baselines, and a single baseline may serve as the reference for several distinct anomalies. The relationship between outlier and baseline is mediated by a role attribute that designates the functional position of each entity within the assessment—observer, owner, or reviewer—thereby establishing accountability and clarifying which party is responsible for interpreting the deviation and which is merely recording it.

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

Pignistic transformation extends this structure by introducing a layer of belief quantification. Diagnostic confidence matrices and telemetry belief assignments are themselves identified (TRAN-0001 through TRAN-0004) and then transformed into probability distributions or betting sets that render subjective assessments actionable. The transformation links a source belief state to a target probability construct through a subject-to-target relationship, again annotated with a role that distinguishes contributors from reviewers. This dual-layer design—where raw confidence measures are first captured and then transformed—ensures that the provenance of each probabilistic output is traceable and that the transformation process itself is subject to independent verification.

**t_pignistic_transformation**

| id | pignistic |
| --- | --- |
| TRAN-0001 | diagnostic confidence matrix |
| TRAN-0002 | telemetry belief assignment |
| TRAN-0003 | anomaly likelihood set |
| TRAN-0004 | diagnostic confidence matrix |
| TRAN-0005 | predictive uncertainty record |
| TRAN-0006 | anomaly likelihood set |
| TRAN-0007 | anomaly likelihood set |
| TRAN-0008 | telemetry belief assignment |

**t_pignistic_transformation_pignistic_transform**

| id | pignistic_transform |
| --- | --- |
| TRAN-0001 | pignistic probability distribution |
| TRAN-0002 | transformed belief state |
| TRAN-0003 | transformed belief state |
| TRAN-0004 | betting probability set |
| TRAN-0005 | risk probability assignment |
| TRAN-0006 | decision support distribution |
| TRAN-0007 | betting probability set |
| TRAN-0008 | transformed belief state |

**t_pignistic_transformation__pignistic_transform**

| id | pignistic_id | pignistic_transform_id | role |
| --- | --- | --- | --- |
| TRAN-0001 | TRAN-0008 | TRAN-0005 | reviewer |
| TRAN-0002 | TRAN-0006 | TRAN-0003 | reviewer |
| TRAN-0003 | TRAN-0005 | TRAN-0006 | contributor |
| TRAN-0004 | TRAN-0005 | TRAN-0002 | reviewer |
| TRAN-0005 | TRAN-0006 | TRAN-0002 | owner |
| TRAN-0006 | TRAN-0003 | TRAN-0008 | reviewer |
| TRAN-0007 | TRAN-0007 | TRAN-0005 | observer |
| TRAN-0008 | TRAN-0008 | TRAN-0008 | reviewer |

At the core of the evidentiary model lies the fact table, which anchors every observation to a support dimension and quantifies both the strength and the doubt surrounding it. Each fact carries a confidence value ranging from 0.147 to 0.877, an uncertainty measure spanning from 10.24 to 719.33, and a miscellaneous value that records the raw measurement—453.93, 510.05, and so forth. The supported_by column provides the foreign key linking the fact to its supporting evidence, while the supporting dimension itself is classified by category and labelled for human readability. This separation of concerns—raw measurement, confidence, uncertainty, and categorical provenance—allows analysts to filter, weight, and aggregate observations without conflating the strength of evidence with its classification.

**fact_outlier**

| id | supported_by_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| SUPP-0001 | SUPP-0006 | 0.877 | 516.58 | 453.93 |
| SUPP-0002 | SUPP-0002 | 0.147 | 368.22 | 510.05 |
| SUPP-0003 | SUPP-0001 | 0.792 | 10.24 | 369.89 |
| SUPP-0004 | SUPP-0003 | 0.479 | 719.33 | 757.32 |
| SUPP-0005 | SUPP-0003 | 0.986 | 245.64 | 972.07 |
| SUPP-0006 | SUPP-0004 | 0.386 | 5.02 | 16.62 |
| SUPP-0007 | SUPP-0003 | 0.047 | 979.09 | 828.93 |

**dim_supported_by**

| id | supported_by_label | supported_by_category |
| --- | --- | --- |
| SUPP-0001 | Supported By Label 01 | Supported By Category 01 |
| SUPP-0002 | Supported By Label 02 | Supported By Category 02 |
| SUPP-0003 | Supported By Label 03 | Supported By Category 03 |
| SUPP-0004 | Supported By Label 04 | Supported By Category 04 |
| SUPP-0005 | Supported By Label 05 | Supported By Category 05 |
| SUPP-0006 | Supported By Label 06 | Supported By Category 06 |

The interplay between these tables forms a coherent governance structure. Identifiers provide the immutable keys that bind observations to their baselines, their transformations, and their supporting evidence. Categories organise the support dimension into coherent groups, enabling roll-up analysis and policy-level controls. Roles enforce procedural discipline by distinguishing those who generate assessments from those who review them. Confidence and uncertainty, expressed as numerical pairs, allow the system to rank observations by reliability and to flag those whose doubt exceeds operational thresholds. Together, these constructs ensure that every anomaly detection decision is traceable to its source, quantified in its certainty, and governed by a clear chain of accountability.