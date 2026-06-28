---
chapter_id: ch_live_soc2_confidentiality_subclass_ba266f
topic_id: 34
family: 07_long_tail
cited_terms: ['soc2_confidentiality_subclass', 'column_value_distribution', 'transformation_only_uses_datasets']
model: engine-refine
---

SOC2 domain categories serve as the primary organizational axis for mapping controls to their respective trust service criteria, enabling organizations to structure compliance efforts around distinct operational domains rather than treating controls as an undifferentiated collection. Each domain category—such as For S O C2 Domain Category 01 through For S O C2 Domain Category 04—encapsulates a coherent set of controls that share a common objective, whether that objective pertains to security, availability, processing integrity, confidentiality, or privacy. This categorical grouping is not merely administrative; it directly informs risk assessment, audit scoping, and the allocation of remediation resources across the compliance lifecycle.

**dim_for_s_o_c2_domain**

| id | for_s_o_c2_domain_label | for_s_o_c2_domain_category |
| --- | --- | --- |
| CONF-0001 | For S O C2 Domain Label 01 | For S O C2 Domain Category 01 |
| CONF-0002 | For S O C2 Domain Label 02 | For S O C2 Domain Category 02 |
| CONF-0003 | For S O C2 Domain Label 03 | For S O C2 Domain Category 03 |
| CONF-0004 | For S O C2 Domain Label 04 | For S O C2 Domain Category 04 |
| CONF-0005 | For S O C2 Domain Label 05 | For S O C2 Domain Category 05 |
| CONF-0006 | For S O C2 Domain Label 06 | For S O C2 Domain Category 06 |

The relationship between domain categories and their governing controls is materialized through a fact table that anchors each control to its parent domain via a foreign key reference. A control identified as CONF-0001, for instance, is linked to domain CONF-0002, which itself carries the label For S O C2 Domain Label 02 and belongs to For S O C2 Domain Category 02. This join between the dimension table and the fact table is the structural mechanism that allows an auditor or compliance engineer to traverse from a specific control requirement up to its broader categorical context, and then back down to sibling controls that share the same domain classification. The same domain category may encompass multiple controls—CONF-0003 and CONF-0004 both reference domain CONF-0005, demonstrating that a single category can aggregate a family of related controls under a unified governance umbrella.

Priority and review cycle parameters attached to each control-fact record introduce a temporal and risk-weighted dimension to category management. Controls are assigned priority levels ranging from 1 (highest) to 5 (lowest), and each is associated with a review cycle measured in days—values such as 372, 494, 767, and 890 days reflect the varying cadences at which different controls must be re-evaluated. A control with priority 1 and a review cycle of 890 days signals a foundational requirement that, while assessed less frequently, carries the greatest organizational risk if it lapses. Conversely, a priority 5 control with a 372-day review cycle indicates a lower-impact control that nonetheless requires regular attention. These parameters enable compliance programs to tier their monitoring efforts, ensuring that high-priority controls within each category receive proportionally more scrutiny.

**fact_soc**

| id | for_s_o_c2_domain_key | priority | review_cycle_days |
| --- | --- | --- | --- |
| CONF-0001 | CONF-0002 | 3 | 494 |
| CONF-0002 | CONF-0005 | 2 | 767 |
| CONF-0003 | CONF-0003 | 1 | 890 |
| CONF-0004 | CONF-0005 | 5 | 372 |

The categorical framework also supports downstream analytical capabilities, including value distribution analysis and transformation lineage tracking, which feed into evidence collection and control effectiveness assessment. Column-level value distributions—such as the binomial profile observed for patient_bmi or the Poisson profile for request_count—provide statistical baselines against which control outputs can be measured for anomalies. Similarly, transformation processes like the validation check or signal denoising filter are linked to the datasets they consume, with roles such as contributor and reviewer establishing accountability chains. When a transformation marked as a reviewer role operates on a dataset like the event log archive, it creates an auditable trail that can be traced back to the originating domain category, thereby closing the loop between control design, data processing, and evidence generation.

**t_column_value_distribution**

| id | column |
| --- | --- |
| DIST-0001 | request_count |
| DIST-0002 | patient_bmi |
| DIST-0003 | device_serial |
| DIST-0004 | request_count |
| DIST-0005 | sensor_temperature |
| DIST-0006 | sensor_temperature |
| DIST-0007 | device_serial |

**t_column_value_distribution_value_distribution**

| id | value_distribution |
| --- | --- |
| DIST-0001 | pareto_shape |
| DIST-0002 | binomial_profile |
| DIST-0003 | uniform_range |
| DIST-0004 | poisson_profile |
| DIST-0005 | bernoulli_curve |
| DIST-0006 | binomial_profile |
| DIST-0007 | uniform_range |
| DIST-0008 | uniform_range |

**t_column_value_distribution__value_distribution**

| id | column_id | value_distribution_id | role |
| --- | --- | --- | --- |
| DIST-0001 | DIST-0007 | DIST-0006 | contributor |
| DIST-0002 | DIST-0003 | DIST-0002 | reviewer |
| DIST-0003 | DIST-0007 | DIST-0006 | contributor |
| DIST-0004 | DIST-0007 | DIST-0001 | contributor |
| DIST-0005 | DIST-0002 | DIST-0007 | contributor |
| DIST-0006 | DIST-0007 | DIST-0002 | owner |
| DIST-0007 | DIST-0004 | DIST-0001 | reviewer |
| DIST-0008 | DIST-0002 | DIST-0003 | contributor |

**t_transformation_only_uses_datasets**

| id | transformation |
| --- | --- |
| DATA-0001 | validation check |
| DATA-0002 | signal denoising filter |
| DATA-0003 | calibration routine |
| DATA-0004 | telemetry ingestion filter |
| DATA-0005 | feature engineering step |
| DATA-0006 | format conversion layer |

**t_transformation_only_uses_datasets_uses_entity**

| id | uses_entity |
| --- | --- |
| DATA-0001 | event log archive |
| DATA-0002 | feature registry cache |
| DATA-0003 | ingestion buffer queue |
| DATA-0004 | historical metrics dataset |
| DATA-0005 | configuration manifest |
| DATA-0006 | configuration manifest |

**t_transformation_only_uses_datasets__uses_entity**

| id | transformation_id | uses_entity_id | role |
| --- | --- | --- | --- |
| DATA-0001 | DATA-0003 | DATA-0002 | reviewer |
| DATA-0002 | DATA-0001 | DATA-0002 | observer |
| DATA-0003 | DATA-0003 | DATA-0003 | contributor |
| DATA-0004 | DATA-0001 | DATA-0004 | contributor |
| DATA-0005 | DATA-0005 | DATA-0001 | observer |
| DATA-0006 | DATA-0005 | DATA-0003 | reviewer |
| DATA-0007 | DATA-0003 | DATA-0006 | reviewer |
| DATA-0008 | DATA-0005 | DATA-0003 | contributor |