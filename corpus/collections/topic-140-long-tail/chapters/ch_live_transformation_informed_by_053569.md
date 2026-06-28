---
chapter_id: ch_live_transformation_informed_by_053569
topic_id: 140
family: 05_provo_lineage
cited_terms: ['transformation_informed_by', 'column_lineage_for_table_column', 'entity_match_link']
model: engine-refine
---

The provenance of every transformation event is anchored to an identifier that serves as the primary key for temporal and causal tracking, while the informed-by relationship establishes a lineage graph linking one transformation to its predecessor or source. In practice, a transformation bearing the identifier INFO-0001 may itself be informed by INFO-0001, indicating a self-referential or bootstrapped operation, whereas INFO-0003 draws from INFO-0006, a reference that falls outside the immediate set of four observed transformations and implies a broader lineage extending beyond the current observation window. The dimension table for informed-by records decompose this relationship into a human-readable label—such as "Informed By Label 01"—and a categorical classification like "Informed By Category 01," enabling both auditability and aggregation by provenance type. This separation of the factual link from its descriptive metadata follows a star-schema convention that preserves query performance while maintaining the semantic richness required for compliance tracing.

**dim_informed_by**

| id | informed_by_label | informed_by_category |
| --- | --- | --- |
| INFO-0001 | Informed By Label 01 | Informed By Category 01 |
| INFO-0002 | Informed By Label 02 | Informed By Category 02 |
| INFO-0003 | Informed By Label 03 | Informed By Category 03 |
| INFO-0004 | Informed By Label 04 | Informed By Category 04 |
| INFO-0005 | Informed By Label 05 | Informed By Category 05 |
| INFO-0006 | Informed By Label 06 | Informed By Category 06 |

**dim_column_2**

| id | column_2_label | column_2_category |
| --- | --- | --- |
| COLU-0001 | Column 2 Label 01 | Column 2 Category 01 |
| COLU-0002 | Column 2 Label 02 | Column 2 Category 02 |
| COLU-0003 | Column 2 Label 03 | Column 2 Category 03 |
| COLU-0004 | Column 2 Label 04 | Column 2 Category 04 |
| COLU-0005 | Column 2 Label 05 | Column 2 Category 05 |
| COLU-0006 | Column 2 Label 06 | Column 2 Category 06 |
| COLU-0007 | Column 2 Label 07 | Column 2 Category 07 |
| COLU-0008 | Column 2 Label 08 | Column 2 Category 08 |

Execution characteristics of each transformation are captured through duration and exit metrics that together form a minimal but sufficient performance profile. Duration values span an order of magnitude: a brief operation completing in 150.01 seconds contrasts sharply with a prolonged transformation consuming 5474.59 seconds, a ratio exceeding thirty-six-to-one that signals fundamentally different workload classes or resource constraints. The exit code—integer values such as 354, 220, 471, and 302—encodes the termination state of each run, though the specific semantics of these codes are implementation-dependent and must be resolved against the system's error taxonomy. Retry count provides an additional layer of diagnostic signal, with observed values of 25, 357, 150, and 85 indicating that some transformations required substantial back-off and re-execution before reaching a terminal state. A retry count of 357, for instance, suggests a persistent failure mode that warrants investigation into the underlying cause rather than mere statistical noise.

**fact_transformation**

| id | informed_by_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| INFO-0001 | INFO-0001 | 2399.22 | 354 | 25 |
| INFO-0002 | INFO-0002 | 5474.59 | 220 | 357 |
| INFO-0003 | INFO-0006 | 150.01 | 471 | 150 |
| INFO-0004 | INFO-0004 | 5248.45 | 302 | 85 |
| INFO-0005 | INFO-0004 | 6668.88 | 184 | 484 |
| INFO-0006 | INFO-0001 | 777.01 | 996 | 445 |
| INFO-0007 | INFO-0005 | 6572.74 | 634 | 341 |

Column-level measurements introduce a parallel tracking dimension in which each observation carries a confidence score, an uncertainty bound, and a raw value. Confidence values—0.164, 0.068, 0.107, and 0.354—represent the system's calibrated belief in the correctness of the associated measurement, with the highest observed confidence of 0.354 remaining well below certainty and underscoring the inherently probabilistic nature of the data collection process. The corresponding uncertainty figures—560.21, 744.10, 984.09, and 404.01—quantify the absolute error bounds in the measurement domain, while the raw values themselves (257.80, 571.55, 140.18, 131.27) constitute the observable quantities under governance. Each column measurement references a column dimension through a foreign key, and that dimension table supplies a label and a category, mirroring the provenance pattern and enabling consistent classification across all column-level observations.

**fact_column**

| id | column_2_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| COLU-0001 | COLU-0003 | 0.164 | 560.21 | 257.80 |
| COLU-0002 | COLU-0004 | 0.068 | 744.10 | 571.55 |
| COLU-0003 | COLU-0006 | 0.107 | 984.09 | 140.18 |
| COLU-0004 | COLU-0002 | 0.354 | 404.01 | 131.27 |
| COLU-0005 | COLU-0003 | 0.790 | 109.97 | 235.19 |
| COLU-0006 | COLU-0003 | 0.934 | 653.09 | 813.74 |
| COLU-0007 | COLU-0005 | 0.938 | 827.04 | 409.13 |
| COLU-0008 | COLU-0003 | 0.734 | 419.22 | 492.32 |

Entity matching records establish pairwise relationships between operational entities and their reference counterparts, with each match carrying typed attributes that enrich the linkage with machine-readable metadata. A laboratory instrument identified as SN-4491 may be matched against reference standard RS-004, while a sample batch SB-2214 and a dataset version v4.2.1 both resolve to the same validation suite VS-605, suggesting that the validation suite serves as a shared quality gate across multiple entity types. A governance policy DOC-992, by contrast, matches against a standard template ST-099, indicating a compliance-oriented linkage rather than a technical validation. The attributes attached to these matches—confidence, dimension_kind, method, and recorded_at—are each typed with an XML Schema datatype such as xsd:decimal, xsd:string, or xsd:dateTime, ensuring that downstream consumers can perform type-safe comparisons and aggregations without schema inference.

**t_entity_match_link**

| id | entity | matches_entity |
| --- | --- | --- |
| LINK-0001 | Lab instrument SN-4491 | Reference standard RS-004 |
| LINK-0002 | Sample batch SB-2214 | Validation suite VS-605 |
| LINK-0003 | Dataset v4.2.1 | Validation suite VS-605 |
| LINK-0004 | Governance policy DOC-992 | Standard template ST-099 |
| LINK-0005 | Governance policy DOC-992 | Matched registry MR-881 |
| LINK-0006 | Provenance log PR-7741 | Validation suite VS-605 |

**t_entity_match_link_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| LINK-0001 | confidence | xsd:decimal |
| LINK-0002 | dimension_kind | xsd:string |
| LINK-0003 | method | xsd:string |
| LINK-0004 | recorded_at | xsd:dateTime |
| LINK-0005 | uncertainty | xsd:decimal |
| LINK-0006 | unit | xsd:string |
| LINK-0007 | value | xsd:decimal |
| LINK-0008 | encoding | xsd:string |

**t_entity_match_link_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LINK-0001 | LINK-0001 | LINK-0004 | 2025-02-02T03:38:54 |
| LINK-0002 | LINK-0002 | LINK-0004 | 2024-07-01T04:17:43 |
| LINK-0003 | LINK-0003 | LINK-0004 | 2023-10-04T15:34:58 |
| LINK-0004 | LINK-0004 | LINK-0004 | 2025-05-20T07:58:08 |
| LINK-0005 | LINK-0005 | LINK-0004 | 2023-04-10T04:16:09 |
| LINK-0006 | LINK-0006 | LINK-0004 | 2023-09-16T03:40:04 |

**t_entity_match_link_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LINK-0001 | LINK-0001 | LINK-0001 | 0.249 |
| LINK-0002 | LINK-0001 | LINK-0005 | 448.20 |
| LINK-0003 | LINK-0001 | LINK-0007 | 699.43 |
| LINK-0004 | LINK-0002 | LINK-0001 | 0.772 |
| LINK-0005 | LINK-0002 | LINK-0005 | 156.67 |
| LINK-0006 | LINK-0002 | LINK-0007 | 439.51 |
| LINK-0007 | LINK-0003 | LINK-0001 | 0.389 |
| LINK-0008 | LINK-0003 | LINK-0005 | 388.52 |

**t_entity_match_link_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LINK-0001 | LINK-0001 | LINK-0002 | Dimension Kind 01 |
| LINK-0002 | LINK-0001 | LINK-0008 | Encoding 02 |
| LINK-0003 | LINK-0001 | LINK-0009 | audit excerpt |
| LINK-0004 | LINK-0001 | LINK-0010 | es |
| LINK-0005 | LINK-0001 | LINK-0003 | manual |
| LINK-0006 | LINK-0001 | LINK-0006 | count |
| LINK-0007 | LINK-0002 | LINK-0002 | Dimension Kind 07 |
| LINK-0008 | LINK-0002 | LINK-0008 | Encoding 08 |

The attribute values are materialized across three type-specific value tables, each dedicated to a single XML Schema type. Decimal attributes store numeric measurements such as 0.249 and 0.772 for confidence, alongside larger magnitudes like 448.20 and 699.43 that may represent derived scores or weighted aggregates. String attributes capture categorical descriptors including "Dimension Kind 01," "Encoding 02," and "audit excerpt," the latter suggesting a free-text annotation attached to a match record. DateTime attributes record the moment of observation with microsecond precision, with timestamps ranging from October 2023 through May 2025, establishing a temporal horizon that spans more than a year and enabling trend analysis across the entity matching lifecycle. This type-disaggregated value storage pattern, while denormalizing the schema, eliminates the need for type coercion at query time and enforces value integrity at the storage layer.