---
chapter_id: ch_live_annotation_only_about_artifact_55d3b1
topic_id: 83
family: 02_observation_measurement
cited_terms: ['annotation_only_about_artifact', 'kernel_event_with_comm', 'dempster_conflict_mass']
model: engine-refine
---

The governance of analytical evidence rests upon a structured taxonomy of identifiers, categories, and confidence measures that together form the backbone of traceable decision-making. Each observation is anchored by a unique identifier—ARTI-0001 through ARTI-0004 for annotation records, COMM-0001 through COMM-0004 for process communication events, and MASS-0001 through MASS-0004 for conflict mass assessments—ensuring that every datum can be unambiguously referenced, audited, and reconciled across subsystems. These identifiers serve as the primary keys of fact tables and the foreign keys of their corresponding dimension tables, establishing referential integrity that prevents orphaned records and guarantees that every confidence score, uncertainty estimate, or miscellany value can be traced back to its originating entity. Dimension tables such as dim_annotation, dim_with_process_comm, and dim_conflict_mass attach human-readable labels and categorical classifications—Annotation Category 01, With Process Comm Category 03, Conflict Mass Category 02—to these identifiers, enabling downstream consumers to filter, aggregate, and report without exposing raw key values to business logic.

**fact_annotation**

| id | annotation_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| ARTI-0001 | ARTI-0005 | 0.845 | 690.59 | 979.94 |
| ARTI-0002 | ARTI-0003 | 0.236 | 593.98 | 370.63 |
| ARTI-0003 | ARTI-0004 | 0.271 | 104.01 | 360.27 |
| ARTI-0004 | ARTI-0001 | 0.303 | 22.02 | 284.47 |
| ARTI-0005 | ARTI-0003 | 0.002 | 328.54 | 25.47 |

**dim_annotation**

| id | annotation_label | annotation_category |
| --- | --- | --- |
| ARTI-0001 | Annotation Label 01 | Annotation Category 01 |
| ARTI-0002 | Annotation Label 02 | Annotation Category 02 |
| ARTI-0003 | Annotation Label 03 | Annotation Category 03 |
| ARTI-0004 | Annotation Label 04 | Annotation Category 04 |
| ARTI-0005 | Annotation Label 05 | Annotation Category 05 |
| ARTI-0006 | Annotation Label 06 | Annotation Category 06 |

**dim_with_process_comm**

| id | with_process_comm_label | with_process_comm_category |
| --- | --- | --- |
| COMM-0001 | With Process Comm Label 01 | With Process Comm Category 01 |
| COMM-0002 | With Process Comm Label 02 | With Process Comm Category 02 |
| COMM-0003 | With Process Comm Label 03 | With Process Comm Category 03 |
| COMM-0004 | With Process Comm Label 04 | With Process Comm Category 04 |
| COMM-0005 | With Process Comm Label 05 | With Process Comm Category 05 |
| COMM-0006 | With Process Comm Label 06 | With Process Comm Category 06 |
| COMM-0007 | With Process Comm Label 07 | With Process Comm Category 07 |
| COMM-0008 | With Process Comm Label 08 | With Process Comm Category 08 |

**dim_conflict_mass**

| id | conflict_mass_label | conflict_mass_category |
| --- | --- | --- |
| MASS-0001 | Conflict Mass Label 01 | Conflict Mass Category 01 |
| MASS-0002 | Conflict Mass Label 02 | Conflict Mass Category 02 |
| MASS-0003 | Conflict Mass Label 03 | Conflict Mass Category 03 |
| MASS-0004 | Conflict Mass Label 04 | Conflict Mass Category 04 |
| MASS-0005 | Conflict Mass Label 05 | Conflict Mass Category 05 |
| MASS-0006 | Conflict Mass Label 06 | Conflict Mass Category 06 |

Confidence and uncertainty constitute the dual metrics by which the reliability of each observation is quantified, and their inverse relationship is both expected and monitored. In the annotation fact table, record ARTI-0001 exhibits a confidence of 0.845 paired with an uncertainty of 690.59, whereas ARTI-0002 presents a markedly lower confidence of 0.236 alongside an uncertainty of 593.98; these paired values signal that confidence alone does not determine trustworthiness, as the magnitude of uncertainty must be evaluated in tandem. The Dempster-Shafer conflict mass records reinforce this pattern: MASS-0004 achieves a confidence of 0.728 with an uncertainty of 479.57, while MASS-0002 registers a confidence of merely 0.014 against an uncertainty of 392.06, illustrating how low-confidence assessments carry proportionally higher epistemic risk. The misc column—holding values such as 979.94, 370.63, and 846.10—captures auxiliary measurements that, while not directly tied to confidence or uncertainty, provide contextual magnitude for each record and may serve as weighting factors in downstream aggregation.

Process communication events introduce a temporal and operational dimension to the evidence framework, where duration_seconds, exit_code, and retry_count collectively describe the lifecycle of each kernel-level interaction. A process communication record with identifier COMM-0001 consumed 5315.83 seconds and required 436 retries before terminating with exit code 769, a pattern that suggests persistent instability or resource contention. By contrast, COMM-0004 completed in 3561.41 seconds with only 14 retries and an exit code of 253, indicating a comparatively stable execution path. The foreign key with_process_comm_key in the fact_kernel table links each kernel event to its parent process communication entity in dim_with_process_comm, where labels such as With Process Comm Label 01 and categories such as With Process Comm Category 01 provide the semantic context necessary to interpret whether a high retry count or extended duration is anomalous or expected within that category.

**fact_kernel**

| id | with_process_comm_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| COMM-0001 | COMM-0007 | 5315.83 | 769 | 436 |
| COMM-0002 | COMM-0004 | 6644.30 | 229 | 251 |
| COMM-0003 | COMM-0008 | 4698.54 | 332 | 190 |
| COMM-0004 | COMM-0004 | 3561.41 | 253 | 14 |
| COMM-0005 | COMM-0001 | 6092.67 | 910 | 352 |
| COMM-0006 | COMM-0002 | 6729.90 | 888 | 269 |
| COMM-0007 | COMM-0006 | 814.76 | 674 | 214 |
| COMM-0008 | COMM-0008 | 2447.90 | 247 | 434 |

The interconnection between fact and dimension tables follows a consistent star-schema pattern that separates measurable quantities from descriptive metadata. The fact_annotation table references no external foreign keys beyond its own identifier, functioning as a leaf node in the annotation lineage, while fact_kernel and fact_dempster each carry a single foreign key—with_process_comm_key and conflict_mass_key respectively—that points to their corresponding dimension tables, dim_with_process_comm and dim_conflict_mass. This design ensures that categorical attributes such as Annotation Category 04 or Conflict Mass Category 03 can be modified independently of the fact data without violating referential constraints, a property that proves essential when classification taxonomies evolve over time. The misc columns across all fact tables—value in fact_annotation, value in fact_dempster, and the misc column in fact_kernel—serve as catch-alls for domain-specific measurements that do not fit neatly into the standardized confidence, uncertainty, duration, or retry count schema, preserving extensibility without compromising structural integrity.

**fact_dempster**

| id | conflict_mass_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| MASS-0001 | MASS-0003 | 0.153 | 9.49 | 520.46 |
| MASS-0002 | MASS-0002 | 0.014 | 392.06 | 137.18 |
| MASS-0003 | MASS-0005 | 0.025 | 687.80 | 197.61 |
| MASS-0004 | MASS-0001 | 0.728 | 479.57 | 846.10 |
| MASS-0005 | MASS-0006 | 0.918 | 172.36 | 296.96 |
| MASS-0006 | MASS-0001 | 0.755 | 608.06 | 341.51 |