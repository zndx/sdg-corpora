---
chapter_id: ch_live_transformation_with_output_dataset_456787
topic_id: 54
family: 05_provo_lineage
cited_terms: ['transformation_with_output_dataset', 'dempster_conflict_mass', 'kernel_event_with_comm']
model: engine-refine
---

Execution records across transformation, kernel, and Dempster-Shafer evidence pipelines are anchored by unique identifiers—DATA-0001 through DATA-0004 for transformations, COMM-0001 through COMM-0004 for kernel executions, and MASS-0001 through MASS-0004 for evidence mass assignments—each serving as the primary key that binds operational telemetry to its corresponding categorical metadata. A transformation identified as DATA-0001, for instance, is associated with output dataset DATA-0004 and consumed 2399.22 seconds with an exit code of 354 after 25 retries, whereas DATA-0002, targeting the same output dataset, required 5474.59 seconds, returned exit code 220, and endured 357 retries, illustrating the wide variance in execution profiles even among transformations directed at identical targets.

Duration seconds and retry counts form the core performance telemetry in both the transformation and kernel fact tables. Kernel executions exhibit particularly heavy tail latency: COMM-0002 ran for 6644.30 seconds with 251 retries and exit code 229, while COMM-0001 completed in 5315.83 seconds with 436 retries and exit code 769. The transformation table mirrors this pattern, with DATA-0003 completing in a comparatively brisk 150.01 seconds (exit 471, 150 retries) against DATA-0004's 5248.45 seconds (exit 302, 85 retries). These metrics are not merely descriptive; they quantify the operational cost of each pipeline stage and, when correlated with exit codes, reveal failure modes that range from transient resource contention to structural errors requiring intervention.

**fact_transformation**

| id | output_dataset_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| DATA-0001 | DATA-0004 | 2399.22 | 354 | 25 |
| DATA-0002 | DATA-0004 | 5474.59 | 220 | 357 |
| DATA-0003 | DATA-0005 | 150.01 | 471 | 150 |
| DATA-0004 | DATA-0004 | 5248.45 | 302 | 85 |
| DATA-0005 | DATA-0006 | 6668.88 | 184 | 484 |
| DATA-0006 | DATA-0004 | 777.01 | 996 | 445 |
| DATA-0007 | DATA-0005 | 6572.74 | 634 | 341 |

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

The Dempster-Shafer evidence records introduce a distinct analytical dimension through their confidence and uncertainty fields, which quantify the degree of belief and ignorance assigned to each mass assignment. MASS-0004 carries a confidence of 0.728 and uncertainty of 479.57 with a value of 846.10, indicating a relatively strong evidential commitment, whereas MASS-0002 registers confidence at 0.014 and uncertainty at 392.06 with value 137.18, reflecting near-total skepticism and high ignorance. MASS-0001 and MASS-0003 fall between these extremes, with confidence values of 0.153 and 0.025 respectively, and uncertainty measures of 9.49 and 687.80. The conflict_mass_key column in this fact table links each evidence record to its corresponding conflict mass dimension, enabling aggregation of belief conflicts across categorical groupings.

**fact_dempster**

| id | conflict_mass_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| MASS-0001 | MASS-0003 | 0.153 | 9.49 | 520.46 |
| MASS-0002 | MASS-0002 | 0.014 | 392.06 | 137.18 |
| MASS-0003 | MASS-0005 | 0.025 | 687.80 | 197.61 |
| MASS-0004 | MASS-0001 | 0.728 | 479.57 | 846.10 |
| MASS-0005 | MASS-0006 | 0.918 | 172.36 | 296.96 |
| MASS-0006 | MASS-0001 | 0.755 | 608.06 | 341.51 |

Categorical and descriptive metadata reside in the dimension tables, where category and misc columns provide the human-readable labels and classification schemes that give operational identifiers their semantic meaning. The output dataset dimension assigns labels such as Output Dataset Label 01 through 04 and categories Output Dataset Category 01 through 04 to the DATA-0001 through DATA-0004 identifiers, while the conflict mass dimension similarly maps MASS-0001 through MASS-0004 to Conflict Mass Label and Category designations. The with process comm dimension performs the same function for kernel executions, associating COMM-0001 through COMM-0004 with their respective With Process Comm Label and Category descriptors. These dimension tables are joined to their respective fact tables through foreign key relationships: fact_transformation.output_dataset_key references dim_output_dataset.id, fact_dempster.conflict_mass_key references dim_conflict_mass.id, and fact_kernel.with_process_comm_key references dim_with_process_comm.id, thereby enabling categorical filtering and cross-tabulation of execution and evidence metrics.

**dim_output_dataset**

| id | output_dataset_label | output_dataset_category |
| --- | --- | --- |
| DATA-0001 | Output Dataset Label 01 | Output Dataset Category 01 |
| DATA-0002 | Output Dataset Label 02 | Output Dataset Category 02 |
| DATA-0003 | Output Dataset Label 03 | Output Dataset Category 03 |
| DATA-0004 | Output Dataset Label 04 | Output Dataset Category 04 |
| DATA-0005 | Output Dataset Label 05 | Output Dataset Category 05 |
| DATA-0006 | Output Dataset Label 06 | Output Dataset Category 06 |

**dim_conflict_mass**

| id | conflict_mass_label | conflict_mass_category |
| --- | --- | --- |
| MASS-0001 | Conflict Mass Label 01 | Conflict Mass Category 01 |
| MASS-0002 | Conflict Mass Label 02 | Conflict Mass Category 02 |
| MASS-0003 | Conflict Mass Label 03 | Conflict Mass Category 03 |
| MASS-0004 | Conflict Mass Label 04 | Conflict Mass Category 04 |
| MASS-0005 | Conflict Mass Label 05 | Conflict Mass Category 05 |
| MASS-0006 | Conflict Mass Label 06 | Conflict Mass Category 06 |

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

The exit code field, present in both fact_transformation and fact_kernel, serves as the terminal status indicator for each execution event. Values range from 14 to 769 across the observed records, with no single code dominating the distribution—DATA-0001 exited with 354, DATA-0002 with 220, DATA-0003 with 471, and DATA-0004 with 302, while kernel executions COMM-0001 through COMM-0004 returned 769, 229, 332, and 253 respectively. The absence of a zero or conventional success code across all records suggests that these pipelines either operate under a non-standard exit convention or that the sampled records capture exclusively non-trivial termination states, making exit code analysis essential for diagnosing systematic versus sporadic failures.