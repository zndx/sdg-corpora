---
chapter_id: ch_live_dataset_was_attributed_to_fc4770
topic_id: 24
family: 05_provo_lineage
cited_terms: ['dataset_was_attributed_to', 'verification_targets_artifact', 'profiling_produces_profile']
model: engine-refine
---

The integrity of any governed data ecosystem rests upon a disciplined taxonomy of identifiers that anchor every observable entity to a stable reference. Across the warehouse, identifiers follow a prefix convention—ATTR- for attribution records, ARTI for artifacts and verification targets, and PROF for profiling runs—ensuring that each row can be unambiguously traced through joins and aggregations. A dataset record such as ATTR-0001 carries a size of 350,697,080 bytes and resides at version 10, while its counterpart ATTR-0004, at 676,110,880 bytes, sits at version 2; the version column thus encodes the evolutionary state of each asset, permitting downstream consumers to distinguish between a legacy snapshot and its current iteration. These identifiers are not merely labels; they are the foreign keys that bind fact tables to their corresponding dimension tables, enabling a single attribution key like ATTR-0003 to resolve across multiple datasets and to carry with it a human-readable label and a categorical classification.

**fact_dataset**

| id | was_attributed_to_key | size_bytes | version |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0004 | 350697080 | 10 |
| ATTR-0002 | ATTR-0003 | 501391865 | 2 |
| ATTR-0003 | ATTR-0006 | 31504133 | 5 |
| ATTR-0004 | ATTR-0003 | 676110880 | 5 |
| ATTR-0005 | ATTR-0005 | 632357991 | 7 |
| ATTR-0006 | ATTR-0002 | 81640033 | 1 |
| ATTR-0007 | ATTR-0005 | 351254327 | 12 |
| ATTR-0008 | ATTR-0001 | 94866870 | 11 |

**t_verification_targets_artifact**

| id | verification |
| --- | --- |
| ARTI-0001 | Compliance review cycle |
| ARTI-0002 | Compliance review cycle |
| ARTI-0003 | Data lineage audit |
| ARTI-0004 | Compliance review cycle |
| ARTI-0005 | Test suite execution |
| ARTI-0006 | Governance policy scan |

**t_verification_targets_artifact_targets_artifact**

| id | targets_artifact |
| --- | --- |
| ARTI-0001 | Sensor calibration matrix |
| ARTI-0002 | Source code branch |
| ARTI-0003 | Sensor calibration matrix |
| ARTI-0004 | Sensor calibration matrix |
| ARTI-0005 | Ingestion manifest |
| ARTI-0006 | Ingestion manifest |

Classification itself is managed through a pair of parallel columns—category and misc—that reside in the dimension tables and serve complementary governance purposes. The misc column holds the human-facing label, such as "Was Attributed To Label 01" or "Produces Label 03," which appears in reports and dashboards, while the category column assigns a structural grouping like "Was Attributed To Category 02" or "Produces Category 04" that drives filtering, aggregation, and access-control policies. This separation of display text from structural taxonomy allows the same underlying entity to be relabeled for a new audience without altering its classification semantics, a distinction that proves essential when regulatory definitions shift or when a single artifact must be presented differently to engineering versus compliance stakeholders.

**dim_was_attributed_to**

| id | was_attributed_to_label | was_attributed_to_category |
| --- | --- | --- |
| ATTR-0001 | Was Attributed To Label 01 | Was Attributed To Category 01 |
| ATTR-0002 | Was Attributed To Label 02 | Was Attributed To Category 02 |
| ATTR-0003 | Was Attributed To Label 03 | Was Attributed To Category 03 |
| ATTR-0004 | Was Attributed To Label 04 | Was Attributed To Category 04 |
| ATTR-0005 | Was Attributed To Label 05 | Was Attributed To Category 05 |
| ATTR-0006 | Was Attributed To Label 06 | Was Attributed To Category 06 |
| ATTR-0007 | Was Attributed To Label 07 | Was Attributed To Category 07 |
| ATTR-0008 | Was Attributed To Label 08 | Was Attributed To Category 08 |

**dim_produces**

| id | produces_label | produces_category |
| --- | --- | --- |
| PROF-0001 | Produces Label 01 | Produces Category 01 |
| PROF-0002 | Produces Label 02 | Produces Category 02 |
| PROF-0003 | Produces Label 03 | Produces Category 03 |
| PROF-0004 | Produces Label 04 | Produces Category 04 |
| PROF-0005 | Produces Label 05 | Produces Category 05 |
| PROF-0006 | Produces Label 06 | Produces Category 06 |

Profiling runs introduce a temporal and operational dimension to the data model, captured through duration_seconds, exit_code, and retry_count. A profiling fact identified as PROF-0001 consumed 6,716.87 seconds and terminated with exit code 725 after 209 retries, whereas PROF-0003 completed in 2,546.61 seconds with exit code 348 but required 303 retries; the divergence between duration and retry count reveals that a high retry count does not necessarily imply a long-running process, since retries may be concentrated in brief, failed sub-steps. Each profiling run is linked to a produces dimension via the produces_key column, meaning that PROF-0001 and PROF-0004 both reference the same production output (PROF-0001 and PROF-0004 respectively map to produces keys PROF-0001 and PROF-0004), allowing auditors to trace which output artifact was generated under which set of operational conditions. The exit_code, an opaque integer such as 809 or 827, serves as the machine-readable signal of success or failure, while retry_count quantifies the resilience of the pipeline, together forming a triad that supports both root-cause analysis and SLA compliance reporting.

**fact_profiling**

| id | produces_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| PROF-0001 | PROF-0001 | 6716.87 | 725 | 209 |
| PROF-0002 | PROF-0004 | 1113.38 | 809 | 186 |
| PROF-0003 | PROF-0004 | 2546.61 | 348 | 303 |
| PROF-0004 | PROF-0006 | 2074.93 | 827 | 264 |

Verification relationships are modeled through a subject-to-target pattern that captures which verification activity applies to which artifact and in what capacity. The join table t_verification_targets_artifact__targets_artifact carries a subject column (holding the verification_id, e.g., ARTI-0002) and a target column (holding the targets_artifact_id, e.g., ARTI-0003), alongside a role column that assigns one of reviewer, owner, or contributor to the relationship. In one instance, verification ARTI-0005 is linked to artifact ARTI-0001 with the role of reviewer, while in another the same verification-artifact pair carries the role of contributor, demonstrating that a single entity can occupy multiple governance positions within the same verification scope. The verification dimension itself distinguishes between activities such as "Compliance review cycle" and "Data lineage audit," while the artifact dimension identifies concrete targets like "Sensor calibration matrix" and "Source code branch," ensuring that every verification event can be traced to both its procedural type and its physical or logical target.

**t_verification_targets_artifact__targets_artifact**

| id | verification_id | targets_artifact_id | role |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0002 | ARTI-0002 | reviewer |
| ARTI-0002 | ARTI-0004 | ARTI-0003 | owner |
| ARTI-0003 | ARTI-0005 | ARTI-0001 | reviewer |
| ARTI-0004 | ARTI-0005 | ARTI-0001 | contributor |
| ARTI-0005 | ARTI-0002 | ARTI-0005 | reviewer |
| ARTI-0006 | ARTI-0005 | ARTI-0006 | owner |
| ARTI-0007 | ARTI-0006 | ARTI-0004 | owner |
| ARTI-0008 | ARTI-0006 | ARTI-0002 | reviewer |