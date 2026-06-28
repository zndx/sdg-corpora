---
chapter_id: ch_live_functional_dependency_rhs_cab59e
topic_id: 20
family: 07_long_tail
cited_terms: ['functional_dependency_rhs', 'kernelhook_with_attached_program', 'regional_quality_benchmark']
model: engine-refine
---

In operational governance frameworks, the integrity of system components depends on precise identification, classification, and version tracking across all attached programs and regional configurations. Every kernel hook and functional dependency is anchored by a unique identifier—such as `PROG-0001` for a kernel hook or `RHS-0001` for a functional dependency—that serves as the immutable reference point for audit trails and compliance reporting. These identifiers link quantitative metadata to descriptive dimensions: a kernel hook identified as `PROG-0001` carries a size of 272,822,846 bytes and is at version 1, while its counterpart `PROG-0002` occupies 560,962,979 bytes at version 1, and `PROG-0003` reaches 456,299,832 bytes at version 10. The version field is critical for change management, ensuring that operators can distinguish between baseline deployments and updated iterations, particularly when the same attached program—such as `PROG-0001`, which appears as the target for both `PROG-0003` and `PROG-0004`—is referenced across multiple hooks.

**t_functional_dependency_rhs**

| id | functional |
| --- | --- |
| RHS-0001 | data ingestion pipeline |
| RHS-0002 | encryption transformation |
| RHS-0003 | telemetry aggregation service |
| RHS-0004 | access control evaluator |
| RHS-0005 | telemetry aggregation service |
| RHS-0006 | schema validation routine |

**fact_kernelhook**

| id | attached_program_key | size_bytes | version |
| --- | --- | --- | --- |
| PROG-0001 | PROG-0006 | 36342735 | 3 |
| PROG-0002 | PROG-0004 | 560962979 | 1 |
| PROG-0003 | PROG-0001 | 456299832 | 10 |
| PROG-0004 | PROG-0001 | 272822846 | 1 |

Classification taxonomy provides the categorical structure necessary for risk assessment and resource allocation. Attached programs are assigned to categories such as "Attached Program Category 01" through "Attached Program Category 04," each paired with a human-readable label like "Attached Program Label 01." Similarly, regional entities are classified under categories including "Regional Category 01" through "Regional Category 04," with corresponding labels such as "Regional Label 01." These categorical assignments enable aggregation and filtering at the governance level, allowing compliance officers to group components by operational domain, security posture, or regulatory scope. The misc field captures supplementary descriptive metadata that does not fit into the primary classification schema, serving as a catch-all for contextual annotations that support manual review processes.

**dim_attached_program**

| id | attached_program_label | attached_program_category |
| --- | --- | --- |
| PROG-0001 | Attached Program Label 01 | Attached Program Category 01 |
| PROG-0002 | Attached Program Label 02 | Attached Program Category 02 |
| PROG-0003 | Attached Program Label 03 | Attached Program Category 03 |
| PROG-0004 | Attached Program Label 04 | Attached Program Category 04 |
| PROG-0005 | Attached Program Label 05 | Attached Program Category 05 |
| PROG-0006 | Attached Program Label 06 | Attached Program Category 06 |

**dim_regional**

| id | regional_label | regional_category |
| --- | --- | --- |
| BENC-0001 | Regional Label 01 | Regional Category 01 |
| BENC-0002 | Regional Label 02 | Regional Category 02 |
| BENC-0003 | Regional Label 03 | Regional Category 03 |
| BENC-0004 | Regional Label 04 | Regional Category 04 |
| BENC-0005 | Regional Label 05 | Regional Category 05 |
| BENC-0006 | Regional Label 06 | Regional Category 06 |

Functional dependencies define the data lineage and ownership relationships that underpin data quality controls. A functional dependency such as "data ingestion pipeline" or "encryption transformation" establishes which right-hand side values—like "aggregated event count," "sanitized email address," "partition key value," or "enriched sensor reading"—are deterministically derived from it. The relationship between a functional dependency and its right-hand side is mediated through a role designation, which distinguishes between an "owner" that asserts full responsibility for the derived value and a "contributor" that participates in its production. For instance, the dependency identified as `RHS-0003` links to right-hand side `RHS-0007` in a contributor capacity, while `RHS-0004` assumes an owner role over `RHS-0001`. This role-based ownership model is essential for accountability, as it clarifies which team or system is answerable for the correctness of each derived data element.

**t_functional_dependency_rhs_f_d_right_hand_side**

| id | f_d_right_hand_side |
| --- | --- |
| RHS-0001 | aggregated event count |
| RHS-0002 | sanitized email address |
| RHS-0003 | partition key value |
| RHS-0004 | enriched sensor reading |
| RHS-0005 | derived priority level |
| RHS-0006 | computed latency metric |
| RHS-0007 | computed latency metric |

**t_functional_dependency_rhs__f_d_right_hand_side**

| id | functional_id | f_d_right_hand_side_id | role |
| --- | --- | --- | --- |
| RHS-0001 | RHS-0003 | RHS-0007 | contributor |
| RHS-0002 | RHS-0004 | RHS-0001 | owner |
| RHS-0003 | RHS-0002 | RHS-0005 | owner |
| RHS-0004 | RHS-0003 | RHS-0006 | owner |
| RHS-0005 | RHS-0003 | RHS-0001 | owner |
| RHS-0006 | RHS-0001 | RHS-0005 | owner |
| RHS-0007 | RHS-0001 | RHS-0006 | contributor |
| RHS-0008 | RHS-0002 | RHS-0001 | contributor |

Regional facts introduce a statistical dimension to governance, quantifying the reliability of measurements through confidence and uncertainty metrics. Each regional fact—identified by keys such as `BENC-0001` or `BENC-0004`—carries a confidence score ranging from 0.036 to 0.818 and an uncertainty value spanning from 253.71 to 762.47, alongside a measured value such as 915.44 or 179.17. These metrics are not merely descriptive; they directly inform risk tolerance thresholds and trigger escalation protocols when confidence falls below acceptable bounds. A regional fact with a confidence of 0.036 and uncertainty of 509.32 signals a measurement of questionable reliability, warranting manual verification or exclusion from automated decision pipelines, whereas a confidence of 0.818 with uncertainty of 510.50, despite a comparable uncertainty magnitude, may still meet operational thresholds depending on the domain. The regional key itself—`BENC-0001`, for example, which appears across multiple facts—ties these statistical measures to a specific regional classification, enabling drill-down analysis from aggregate risk scores to individual measurement records.

**fact_regional**

| id | regional_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| BENC-0001 | BENC-0001 | 0.036 | 509.32 | 915.44 |
| BENC-0002 | BENC-0001 | 0.601 | 253.71 | 567.07 |
| BENC-0003 | BENC-0004 | 0.818 | 510.50 | 179.17 |
| BENC-0004 | BENC-0006 | 0.286 | 762.47 | 261.10 |
| BENC-0005 | BENC-0004 | 0.995 | 619.46 | 410.15 |
| BENC-0006 | BENC-0005 | 0.995 | 647.39 | 276.26 |