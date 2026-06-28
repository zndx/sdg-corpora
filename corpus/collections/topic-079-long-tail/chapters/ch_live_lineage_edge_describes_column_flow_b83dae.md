---
chapter_id: ch_live_lineage_edge_describes_column_flow_b83dae
topic_id: 79
family: 05_provo_lineage
cited_terms: ['lineage_edge_describes_column_flow', 'claim_observed_by_event', 'kernel_anomaly_supports_claim']
model: engine-refine
---

The architecture of the lineage tracking system rests upon a star-schema decomposition that separates measurable assertions from their categorical metadata. Each fact table—fact_kernel, fact_claim, and fact_lineage—encodes a quantified observation through a composite of confidence, uncertainty, and value, while referencing a corresponding dimension table for semantic classification. The fact_kernel table, for instance, records kernel-level observations identified by keys such as CLAI-0001 through CLAI-0004, each carrying a confidence score ranging from the near-certain 0.943 observed in CLAI-0004 to the virtually negligible 0.004 in CLAI-0003, alongside an uncertainty metric that spans from 157.11 to 449.10 and a value field capturing the magnitude of the underlying measurement. This tripartite structure—confidence as a normalized probability estimate, uncertainty as an absolute dispersion measure, and value as the substantive quantity—provides a complete statistical portrait of each recorded assertion without conflating the measurement itself with its interpretive context.

The dimension tables—dim_kernel, dim_claim, and dim_describes_column_flow—serve as the categorical anchor for every fact record, supplying both a human-readable label and a formal category designation. A kernel identified as CLAI-0002 in the fact table maps to Kernel Label 02 and Kernel Category 02 in the dimension, establishing a stable semantic identity that persists across all fact records referencing that kernel. Similarly, the claim dimension associates identifiers such as EVEN-0001 through EVEN-0004 with their respective labels and categories, while the describes_column_flow dimension provides the same dual classification for column-flow entities labeled Describes Column Flow Label 01 through 04. This separation of concerns ensures that categorical reclassification can occur independently of the quantitative measurements, a design property essential for maintaining audit trails in regulated environments where historical interpretations must remain retrievable even as taxonomies evolve.

Foreign-key relationships bind the fact tables to their respective dimensions through a single denormalized key column: kernel_key in fact_kernel, claim_key in fact_claim, and describes_column_flow_key in fact_lineage. The fact_claim table demonstrates a many-to-one cardinality in this relationship, with three of its four records (EVEN-0001, EVEN-0002, and EVEN-0004) referencing the same claim key EVEN-0002, each carrying a distinct confidence value—0.621, 0.596, and 0.364 respectively—suggesting that multiple independent assessments of the same claim can coexist within the system, each with its own uncertainty and value profile. The fact_lineage table follows an analogous pattern, where FLOW-0002 and FLOW-0004 both reference describes_column_flow_key FLOW-0005, yet diverge substantially in their confidence scores (0.071 versus 0.779) and uncertainty values (133.03 versus 708.23), illustrating how the same column-flow relationship can be evaluated with markedly different degrees of certainty depending on the evidence base or methodology applied.

**fact_lineage**

| id | describes_column_flow_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| FLOW-0001 | FLOW-0006 | 0.645 | 612.22 | 903.86 |
| FLOW-0002 | FLOW-0005 | 0.071 | 133.03 | 832.18 |
| FLOW-0003 | FLOW-0004 | 0.404 | 76.69 | 862.00 |
| FLOW-0004 | FLOW-0005 | 0.779 | 708.23 | 259.55 |
| FLOW-0005 | FLOW-0002 | 0.376 | 801.99 | 986.33 |
| FLOW-0006 | FLOW-0003 | 0.744 | 956.79 | 34.40 |

The misc category, represented by the label columns in each dimension table, provides an additional layer of descriptive metadata that complements the formal category classification. While the category field assigns each entity to a structured taxonomy—Claim Category 01 through 04, Kernel Category 01 through 04, Describes Column Flow Category 01 through 04—the label field carries a more granular, potentially free-form identifier such as Claim Label 01 or Kernel Label 03, enabling both machine-readable categorization and human-readable identification within the same record. This dual-labeling approach supports interoperability with external systems that may rely on either the structured category for aggregation or the label for display purposes, without requiring redundant storage of descriptive text within the fact tables themselves.

**dim_describes_column_flow**

| id | describes_column_flow_label | describes_column_flow_category |
| --- | --- | --- |
| FLOW-0001 | Describes Column Flow Label 01 | Describes Column Flow Category 01 |
| FLOW-0002 | Describes Column Flow Label 02 | Describes Column Flow Category 02 |
| FLOW-0003 | Describes Column Flow Label 03 | Describes Column Flow Category 03 |
| FLOW-0004 | Describes Column Flow Label 04 | Describes Column Flow Category 04 |
| FLOW-0005 | Describes Column Flow Label 05 | Describes Column Flow Category 05 |
| FLOW-0006 | Describes Column Flow Label 06 | Describes Column Flow Category 06 |
| FLOW-0007 | Describes Column Flow Label 07 | Describes Column Flow Category 07 |

**dim_claim**

| id | claim_label | claim_category |
| --- | --- | --- |
| EVEN-0001 | Claim Label 01 | Claim Category 01 |
| EVEN-0002 | Claim Label 02 | Claim Category 02 |
| EVEN-0003 | Claim Label 03 | Claim Category 03 |
| EVEN-0004 | Claim Label 04 | Claim Category 04 |
| EVEN-0005 | Claim Label 05 | Claim Category 05 |
| EVEN-0006 | Claim Label 06 | Claim Category 06 |

**dim_kernel**

| id | kernel_label | kernel_category |
| --- | --- | --- |
| CLAI-0001 | Kernel Label 01 | Kernel Category 01 |
| CLAI-0002 | Kernel Label 02 | Kernel Category 02 |
| CLAI-0003 | Kernel Label 03 | Kernel Category 03 |
| CLAI-0004 | Kernel Label 04 | Kernel Category 04 |
| CLAI-0005 | Kernel Label 05 | Kernel Category 05 |
| CLAI-0006 | Kernel Label 06 | Kernel Category 06 |

The identifier columns across all six tables—each prefixed with a domain-specific abbreviation such as CLAI, EVEN, or FLOW—establish a globally unique namespace that prevents ambiguity when records from different fact tables reference overlapping semantic entities. The prefix convention (CLAI-0001 for kernel facts, EVEN-0001 for claim facts, FLOW-0001 for lineage facts) enables rapid visual disambiguation in query results and audit logs, while the sequential numbering within each namespace supports deterministic ordering and range-based lookups. This identifier discipline, combined with the foreign-key relationships that link fact records to their dimensional metadata, creates a traceable chain from raw measurement through categorical classification, ensuring that every confidence score, uncertainty value, and magnitude recorded in the fact tables can be unambiguously attributed to its source entity and its governing taxonomy.

**fact_claim**

| id | claim_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| EVEN-0001 | EVEN-0002 | 0.621 | 571.46 | 164.54 |
| EVEN-0002 | EVEN-0002 | 0.596 | 43.01 | 173.58 |
| EVEN-0003 | EVEN-0006 | 0.338 | 142.53 | 166.95 |
| EVEN-0004 | EVEN-0002 | 0.364 | 296.86 | 152.06 |
| EVEN-0005 | EVEN-0001 | 0.316 | 715.93 | 997.16 |
| EVEN-0006 | EVEN-0006 | 0.410 | 701.36 | 614.41 |
| EVEN-0007 | EVEN-0003 | 0.162 | 133.33 | 142.05 |

**fact_kernel**

| id | kernel_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| CLAI-0001 | CLAI-0002 | 0.772 | 402.55 | 40.61 |
| CLAI-0002 | CLAI-0005 | 0.607 | 449.10 | 348.13 |
| CLAI-0003 | CLAI-0002 | 0.004 | 157.11 | 830.48 |
| CLAI-0004 | CLAI-0002 | 0.943 | 437.87 | 235.95 |
| CLAI-0005 | CLAI-0003 | 0.101 | 474.03 | 682.21 |
| CLAI-0006 | CLAI-0003 | 0.671 | 334.23 | 633.25 |
| CLAI-0007 | CLAI-0006 | 0.159 | 653.45 | 469.91 |
| CLAI-0008 | CLAI-0004 | 0.545 | 224.87 | 822.30 |