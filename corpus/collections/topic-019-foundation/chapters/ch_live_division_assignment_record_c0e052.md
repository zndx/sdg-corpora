---
chapter_id: ch_live_division_assignment_record_c0e052
topic_id: 19
family: 08_derived
cited_terms: ['division_assignment_record', 'subclass_to_descriptive_ice', 'kernel_event_with_comm']
model: engine-refine
---

OPERATIONAL METRICS AND CLASSIFICATION FRAMEWORK

Assignment records establish the linkage between athletes and their designated divisions, each entry carrying a quantified measure of reliability alongside a residual uncertainty value. The fact_division table anchors these relationships through composite identifiers—RECO-0001 through RECO-0004—where each row binds a specific athlete (identified by assigns_athlete_key) to a target division (assigns_division_key). Confidence scores span a wide dynamic range: RECO-0001 registers a confidence of 0.517 against an uncertainty of 96.89, whereas RECO-0004 exhibits a markedly lower confidence of 0.083 paired with an uncertainty of 740.08, suggesting that the system's certainty degrades substantially in certain assignments. The misc value column captures supplementary numeric data—330.50, 254.97, 407.11, and 404.52 respectively—which may encode derived metrics or normalization constants relevant to downstream scoring. These assignment facts are enriched through foreign-key joins to dim_assigns_athlete and dim_assigns_division, where categorical labels such as Assigns Athlete Category 01 and Assigns Division Category 03 provide the semantic context necessary for aggregation and reporting.

**fact_division**

| id | assigns_athlete_key | assigns_division_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- | --- |
| RECO-0001 | RECO-0001 | RECO-0007 | 0.517 | 96.89 | 330.50 |
| RECO-0002 | RECO-0004 | RECO-0003 | 0.806 | 738.86 | 254.97 |
| RECO-0003 | RECO-0001 | RECO-0001 | 0.257 | 500.56 | 407.11 |
| RECO-0004 | RECO-0007 | RECO-0001 | 0.083 | 740.08 | 404.52 |
| RECO-0005 | RECO-0006 | RECO-0007 | 0.281 | 881.15 | 8.05 |
| RECO-0006 | RECO-0007 | RECO-0004 | 0.538 | 6.12 | 177.48 |
| RECO-0007 | RECO-0003 | RECO-0005 | 0.833 | 343.27 | 857.73 |

**dim_assigns_athlete**

| id | assigns_athlete_label | assigns_athlete_category |
| --- | --- | --- |
| RECO-0001 | Assigns Athlete Label 01 | Assigns Athlete Category 01 |
| RECO-0002 | Assigns Athlete Label 02 | Assigns Athlete Category 02 |
| RECO-0003 | Assigns Athlete Label 03 | Assigns Athlete Category 03 |
| RECO-0004 | Assigns Athlete Label 04 | Assigns Athlete Category 04 |
| RECO-0005 | Assigns Athlete Label 05 | Assigns Athlete Category 05 |
| RECO-0006 | Assigns Athlete Label 06 | Assigns Athlete Category 06 |
| RECO-0007 | Assigns Athlete Label 07 | Assigns Athlete Category 07 |

**dim_assigns_division**

| id | assigns_division_label | assigns_division_category |
| --- | --- | --- |
| RECO-0001 | Assigns Division Label 01 | Assigns Division Category 01 |
| RECO-0002 | Assigns Division Label 02 | Assigns Division Category 02 |
| RECO-0003 | Assigns Division Label 03 | Assigns Division Category 03 |
| RECO-0004 | Assigns Division Label 04 | Assigns Division Category 04 |
| RECO-0005 | Assigns Division Label 05 | Assigns Division Category 05 |
| RECO-0006 | Assigns Division Label 06 | Assigns Division Category 06 |
| RECO-0007 | Assigns Division Label 07 | Assigns Division Category 07 |

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

Process communication events are tracked through a parallel fact table, fact_kernel, which records the temporal and operational characteristics of inter-process interactions. Each kernel record—COMM-0001 through COMM-0004—associates a process communication entity (with_process_comm_key) with a measured duration in seconds, an exit code, and a retry count that reflects the number of re-attempts before finalization. Durations vary considerably, from 3561.41 seconds for COMM-0004 to 6644.30 seconds for COMM-0002, indicating that communication latency is not uniform across process pairs. Exit codes—769, 229, 332, and 253—serve as discrete status indicators, while retry counts ranging from 14 to 436 reveal the frequency with which transient failures necessitate recovery. The with_process_comm_key column references dim_with_process_comm, where labels such as With Process Comm Label 01 and categories like With Process Comm Category 02 supply the organizational taxonomy for these communication channels.

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

Descriptive metadata is maintained in a separate subclass registry, t_subclass_to_descriptive_ice, which maps descriptive identifiers to human-readable labels and their associated language codes. Entries ICE-0001 through ICE-0004 carry descriptive values including schema_version_patch, annotation_layer_b, and metadata_registry, each paired with a label_text such as intake form or calibration record. The language column distinguishes between English (en) and German (de) variants, with ICE-0001 and ICE-0004 marked as English and ICE-0002 and ICE-0003 as German, reflecting a multilingual documentation strategy. This table operates independently of the assignment and communication facts but provides the glossary and classification layer that underpins the label_text and misc fields across the broader schema.

**t_subclass_to_descriptive_ice**

| id | descriptive | label_text | language |
| --- | --- | --- | --- |
| ICE-0001 | schema_version_patch | intake form | en |
| ICE-0002 | annotation_layer_b | intake form | de |
| ICE-0003 | metadata_registry | calibration record | de |
| ICE-0004 | metadata_registry | audit excerpt | en |

The structural design separates measured facts from their descriptive dimensions, ensuring that quantitative records remain decoupled from categorical and linguistic metadata. Assignment facts in fact_division and process facts in fact_kernel each carry their own confidence, duration, and retry metrics, while the dimension tables supply the stable labels and categories that enable consistent reporting across time. This normalization supports both analytical queries—such as filtering by category or language—and operational dashboards that surface high-uncertainty assignments or elevated retry counts for investigation. The identifier conventions (RECO- prefixed for assignments, COMM- for communications, ICE- for descriptive subclass entries) provide an immediate semantic signal about the provenance and purpose of each record.