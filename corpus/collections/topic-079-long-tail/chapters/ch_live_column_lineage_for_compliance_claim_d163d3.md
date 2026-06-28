---
chapter_id: ch_live_column_lineage_for_compliance_claim_d163d3
topic_id: 79
family: 07_long_tail
cited_terms: ['column_lineage_for_compliance_claim', 'backward_compatible_with', 'span_with_status']
model: engine-refine
---

In systems of record that track the provenance and quality of structured data, the identifier serves as the immutable anchor for every entity under observation. Whether the identifier takes the form of `CLAI-0001` for a data column, `WITH-0001` for a compatibility relationship, or `STAT-0001` for a span with an associated status, it provides the stable reference point across all fact and dimension tables. The identifier is never reused, never ambiguous, and always present — a design choice that ensures referential integrity when entities are joined across disparate tables. A column identified as `CLAI-0001` carries a column key of `CLAI-0005` and is labeled `Column Label 01` within `Column Category 01`; the same identifier appears as the foreign key in the fact table, linking the column's metadata to its measured properties. This separation of identity from attribute is deliberate: it allows the identifier to function as a join key without carrying the semantic weight of the column's label or category.

**dim_column**

| id | column_label | column_category |
| --- | --- | --- |
| CLAI-0001 | Column Label 01 | Column Category 01 |
| CLAI-0002 | Column Label 02 | Column Category 02 |
| CLAI-0003 | Column Label 03 | Column Category 03 |
| CLAI-0004 | Column Label 04 | Column Category 04 |
| CLAI-0005 | Column Label 05 | Column Category 05 |
| CLAI-0006 | Column Label 06 | Column Category 06 |

**t_span_with_status**

| id | span |
| --- | --- |
| STAT-0001 | certificate-renewal-cycle |
| STAT-0002 | certificate-renewal-cycle |
| STAT-0003 | data-ingestion-batch |
| STAT-0004 | api-gateway-request |
| STAT-0005 | certificate-renewal-cycle |
| STAT-0006 | session-initialization |

**t_span_with_status_span_status**

| id | span_status |
| --- | --- |
| STAT-0001 | degraded |
| STAT-0002 | timeout |
| STAT-0003 | partial_failure |
| STAT-0004 | partial_failure |
| STAT-0005 | partial_failure |
| STAT-0006 | degraded |

The column itself is the unit of measurement, the atomic element to which confidence and uncertainty are assigned. Confidence, expressed as a probability between zero and one, quantifies the degree of belief in the correctness of a measurement — values such as `0.354` for identifier `CLAI-0004` indicate moderate certainty, while `0.068` for `CLAI-0002` signals near-total doubt. Uncertainty, by contrast, is expressed on a wider scale and captures the magnitude of potential deviation: `984.09` for `CLAI-0003` versus `404.01` for `CLAI-0004` reveals that the same column can carry vastly different uncertainty profiles depending on context. These two measures are complementary, not redundant. Confidence answers how likely the value is correct; uncertainty answers how far wrong it could be. The actual measured value — `257.80`, `571.55`, `140.18`, `131.27` — sits at the intersection of both, representing the best available estimate given the stated confidence and uncertainty bounds.

**fact_column**

| id | column_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| CLAI-0001 | CLAI-0005 | 0.164 | 560.21 | 257.80 |
| CLAI-0002 | CLAI-0006 | 0.068 | 744.10 | 571.55 |
| CLAI-0003 | CLAI-0004 | 0.107 | 984.09 | 140.18 |
| CLAI-0004 | CLAI-0001 | 0.354 | 404.01 | 131.27 |
| CLAI-0005 | CLAI-0006 | 0.790 | 109.97 | 235.19 |
| CLAI-0006 | CLAI-0003 | 0.934 | 653.09 | 813.74 |
| CLAI-0007 | CLAI-0005 | 0.938 | 827.04 | 409.13 |
| CLAI-0008 | CLAI-0002 | 0.734 | 419.22 | 492.32 |

Category provides the classification layer that groups columns by their functional or semantic purpose. A column labeled `Column Label 01` belongs to `Column Category 01`; `Column Label 02` to `Column Category 02`. This categorization is not merely organizational — it determines which quality thresholds apply, which validation rules are enforced, and how the column's confidence and uncertainty are interpreted. A column in `Column Category 01` with confidence `0.164` may be acceptable if the category tolerates low-confidence inputs, whereas the same confidence in `Column Category 04` might trigger an alert. The category thus acts as a contextual lens through which the raw numbers of confidence and uncertainty acquire meaning.

The relationship between entities is captured through the subject-target-role triad, a pattern that appears consistently across the compatibility and status tables. In the backward compatibility domain, a subject such as `WITH-0001` (representing `gRPC 1.50`) is linked to a target `WITH-0005` (representing `Kafka 2.8`) with the role of `observer`, indicating that the subject monitors but does not control the target. The same pattern repeats: `WITH-0005` relates to `WITH-0001` as `owner`, a fundamentally different relationship that implies authority and responsibility. In the span-status domain, the subject `STAT-0001` (span `certificate-renewal-cycle`) is linked to status `STAT-0005` (`degraded`) as `contributor`, while the same subject links to `STAT-0001` (`partial_failure`) as `observer`. The role column is the critical discriminator — it transforms a simple many-to-many relationship into a semantically rich graph where the direction and nature of the connection are explicit.

**t_backward_compatible_with__backward_compatible_with**

| id | backward_id | backward_compatible_with_id | role |
| --- | --- | --- | --- |
| WITH-0001 | WITH-0001 | WITH-0005 | observer |
| WITH-0002 | WITH-0007 | WITH-0007 | observer |
| WITH-0003 | WITH-0005 | WITH-0001 | owner |
| WITH-0004 | WITH-0008 | WITH-0005 | observer |
| WITH-0005 | WITH-0002 | WITH-0002 | reviewer |
| WITH-0006 | WITH-0008 | WITH-0006 | reviewer |
| WITH-0007 | WITH-0004 | WITH-0004 | owner |
| WITH-0008 | WITH-0008 | WITH-0001 | observer |

**t_span_with_status__span_status**

| id | span_id | span_status_id | role |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0005 | contributor |
| STAT-0002 | STAT-0005 | STAT-0006 | observer |
| STAT-0003 | STAT-0001 | STAT-0001 | contributor |
| STAT-0004 | STAT-0001 | STAT-0002 | observer |
| STAT-0005 | STAT-0003 | STAT-0002 | owner |
| STAT-0006 | STAT-0001 | STAT-0001 | owner |
| STAT-0007 | STAT-0004 | STAT-0006 | observer |
| STAT-0008 | STAT-0003 | STAT-0004 | reviewer |

Miscellaneous attributes — the column labels, the span names, the version strings — populate the dimension tables and provide the human-readable context that identifiers and categories alone cannot convey. A span identified as `STAT-0001` carries the label `certificate-renewal-cycle`; another, `STAT-0004`, carries `api-gateway-request`. These labels are not join keys and carry no structural weight, but they are essential for operational awareness. Similarly, the backward compatibility table records `Terraform v1.4` and `Avro 1.9` as version strings, and the span status table records `timeout` and `partial_failure` as status descriptors. These values are the interface between the machine-readable schema and the human operators who must act on its output. Without them, the system would be technically complete but operationally opaque.

**t_backward_compatible_with**

| id | backward |
| --- | --- |
| WITH-0001 | gRPC 1.50 |
| WITH-0002 | Terraform v1.4 |
| WITH-0003 | Kafka 2.8 |
| WITH-0004 | Rust 1.50 |
| WITH-0005 | gRPC 1.50 |
| WITH-0006 | gRPC 1.27 |
| WITH-0007 | Parquet 2.0 |
| WITH-0008 | OAuth 1.0 |

**t_backward_compatible_with_backward_compatible_with**

| id | backward_compatible_with |
| --- | --- |
| WITH-0001 | OpenTelemetry 1.10 |
| WITH-0002 | Avro 1.9 |
| WITH-0003 | Kafka 2.8 |
| WITH-0004 | Avro 1.9 |
| WITH-0005 | Parquet 2.0 |
| WITH-0006 | Parquet 2.0 |
| WITH-0007 | Terraform v0.13 |