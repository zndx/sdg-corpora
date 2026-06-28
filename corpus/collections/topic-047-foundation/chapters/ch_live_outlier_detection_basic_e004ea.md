---
chapter_id: ch_live_outlier_detection_basic_e004ea
topic_id: 47
family: 02_observation_measurement
cited_terms: ['outlier_detection_basic', 'dempster_combination_subclass', 'table_topic_tag']
model: engine-refine
---

The architecture of evidence aggregation rests upon a star-schema topology that separates measured phenomena from their taxonomic descriptors, a design choice that enforces referential integrity while permitting independent evolution of classification ontologies. At the core of this structure lie three fact tables—fact_outlier, fact_dempster, and fact_table—each anchored by a surrogate identifier and linked to a corresponding dimension table through a foreign key that resolves to a categorical taxonomy. The fact_outlier table records the operational footprint of outlier detection events, capturing duration_seconds as a continuous measure of computational effort (values ranging from 1182.39 seconds for DETE-0004 to 6466.78 seconds for DETE-0002), exit_code as a discrete termination signal (codes such as 760, 4, 490, and 124), and retry_count as an integer counter of recovery attempts (spanning from 101 for DETE-0003 to 308 for DETE-0004). Each row in fact_outlier is keyed by an identifier such as DETE-0001 through DETE-0004, and the column outlier_key establishes a many-to-one relationship with dim_outlier, where the dimension table supplies the outlier_label (e.g., Outlier Label 01) and outlier_category (e.g., Outlier Category 01) that classify the event semantically.

**fact_outlier**

| id | outlier_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| DETE-0001 | DETE-0003 | 3360.34 | 760 | 293 |
| DETE-0002 | DETE-0001 | 6466.78 | 4 | 225 |
| DETE-0003 | DETE-0002 | 5282.09 | 490 | 101 |
| DETE-0004 | DETE-0003 | 1182.39 | 124 | 308 |
| DETE-0005 | DETE-0002 | 3041.72 | 808 | 59 |
| DETE-0006 | DETE-0005 | 3852.38 | 619 | 489 |
| DETE-0007 | DETE-0003 | 1453.07 | 682 | 1 |

The fact_dempster table operationalizes Dempster's rule of combination, a foundational mechanism in evidence theory for fusing independent belief assignments into a consolidated mass function. Each record, identified by a surrogate such as COMB-0001 or COMB-0004, carries a confidence value that quantifies the degree of belief assigned to a hypothesis—ranging from the minimal 0.014 recorded for COMB-0002 to the substantial 0.728 for COMB-0004—paired with an uncertainty measure that captures the residual ignorance or uncommitted mass, with values as divergent as 9.49 for COMB-0001 and 687.80 for COMB-0003. The value column holds the numerical payload of the combined evidence (520.46, 137.18, 197.61, 846.10), while the column combines_via_dempster_key references dim_combines_via_dempster, which provides the combines_via_dempster_label (Combines Via Dempster Label 01 through 04) and combines_via_dempster_category (Combines Via Dempster Category 01 through 04) for hierarchical classification. Notably, the key COMB-0004 appears as a foreign key value in two rows (COMB-0001 and COMB-0004), indicating that a single combination method can participate in multiple fusion events—a structural pattern that reflects the reusability of evidence-combination strategies across distinct analytical contexts.

**fact_dempster**

| id | combines_via_dempster_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| COMB-0001 | COMB-0004 | 0.153 | 9.49 | 520.46 |
| COMB-0002 | COMB-0006 | 0.014 | 392.06 | 137.18 |
| COMB-0003 | COMB-0003 | 0.025 | 687.80 | 197.61 |
| COMB-0004 | COMB-0004 | 0.728 | 479.57 | 846.10 |
| COMB-0005 | COMB-0005 | 0.918 | 172.36 | 296.96 |
| COMB-0006 | COMB-0001 | 0.755 | 608.06 | 341.51 |

The fact_table table mirrors this evidentiary structure but is oriented toward topic-level aggregation rather than combination-rule mechanics. Its rows, identified by TAG-0001 through TAG-0004, each carry a confidence (0.140 for TAG-0002, 0.874 for TAG-0004), an uncertainty (289.58 for TAG-0004, 899.39 for TAG-0002), and a value (470.53 for TAG-0003, 720.41 for TAG-0004). The column table_topic_key references dim_table_topic, which supplies the table_topic_label (Table Topic Label 01 through 04) and table_topic_category (Table Topic Category 01 through 04). The foreign key TAG-0001 recurs across three rows (TAG-0001, TAG-0002, TAG-0003), demonstrating that a single topic can accumulate multiple evidence measurements—a pattern analogous to the multi-participation of COMB-0004 in the Dempster fact table and reinforcing the design principle that dimension keys serve as stable anchors for fact-table cardinality.

**fact_table**

| id | table_topic_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| TAG-0001 | TAG-0001 | 0.274 | 648.78 | 608.50 |
| TAG-0002 | TAG-0001 | 0.140 | 899.39 | 639.23 |
| TAG-0003 | TAG-0001 | 0.609 | 885.54 | 470.53 |
| TAG-0004 | TAG-0005 | 0.874 | 289.58 | 720.41 |

Within this schema, the columns labeled misc serve as catch-all attributes for free-form or semi-structured data that does not fit the structured categorical or numeric types; in dim_outlier, the outlier_label column carries values such as Outlier Label 01, while in dim_combines_via_dempster, the combines_via_dempster_label column holds Combines Via Dempster Label 01, and in dim_table_topic, the table_topic_label column contains Table Topic Label 01. These label columns, alongside their corresponding category columns (outlier_category, combines_via_dempster_category, table_topic_category), form the semantic layer that transforms raw identifiers into human-interpretable classifications. The exit_code in fact_outlier, though technically a discrete numeric, functions as a categorical signal—its values (760, 4, 490, 124) encode termination states that may be mapped to operational outcomes such as success, failure, or timeout, depending on the domain's exit-code convention.

**dim_outlier**

| id | outlier_label | outlier_category |
| --- | --- | --- |
| DETE-0001 | Outlier Label 01 | Outlier Category 01 |
| DETE-0002 | Outlier Label 02 | Outlier Category 02 |
| DETE-0003 | Outlier Label 03 | Outlier Category 03 |
| DETE-0004 | Outlier Label 04 | Outlier Category 04 |
| DETE-0005 | Outlier Label 05 | Outlier Category 05 |
| DETE-0006 | Outlier Label 06 | Outlier Category 06 |

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

**dim_table_topic**

| id | table_topic_label | table_topic_category |
| --- | --- | --- |
| TAG-0001 | Table Topic Label 01 | Table Topic Category 01 |
| TAG-0002 | Table Topic Label 02 | Table Topic Category 02 |
| TAG-0003 | Table Topic Label 03 | Table Topic Category 03 |
| TAG-0004 | Table Topic Label 04 | Table Topic Category 04 |
| TAG-0005 | Table Topic Label 05 | Table Topic Category 05 |
| TAG-0006 | Table Topic Label 06 | Table Topic Category 06 |

The interplay between confidence and uncertainty across the three fact tables reveals a tension inherent in evidence-based systems: as confidence increases, uncertainty does not necessarily decrease in a linear fashion, suggesting that the two measures capture orthogonal aspects of belief. In fact_dempster, COMB-0004 exhibits the highest confidence (0.728) alongside a moderate uncertainty (479.57), while COMB-0002 shows the lowest confidence (0.014) with an intermediate uncertainty (392.06). In fact_table, TAG-0004 achieves the highest confidence (0.874) with the lowest uncertainty (289.58), whereas TAG-0002 presents a low confidence (0.140) paired with the highest uncertainty (899.39). This non-monotonic relationship underscores that confidence and uncertainty are not complementary complements but independent parameters that must be interpreted jointly—a distinction that carries direct implications for how thresholds are set in downstream decision logic.