---
chapter_id: ch_live_ebpfmap_only_one_value_type_2e96ae
topic_id: 45
family: 04_ebpf_kernel
cited_terms: ['ebpfmap_only_one_value_type', 'requirement_applies_to_system', 'division_assignment_record']
model: engine-refine
---

Operational governance mandates a disciplined taxonomy wherein every resource is anchored to a stable identifier and classified through a structured type map. The type map functions as the primary indexing mechanism, routing discrete records into standardized category partitions that dictate downstream processing rules and storage allocation. Entries designated as TYPE-0001 through TYPE-0004 are systematically catalogued with associated category labels and descriptive misc annotations, ensuring that classification remains both machine-readable and auditable. Storage footprint is explicitly quantified via size bytes, a critical metric for capacity planning and compliance reporting; records consuming 208,979,093 or 354,373,995 bytes are version-tracked to maintain historical integrity, while dimension tables preserve human-readable labels and categorical groupings that support cross-system reconciliation.

**dim_value_type_map**

| id | value_type_map_label | value_type_map_category |
| --- | --- | --- |
| TYPE-0001 | Value Type Map Label 01 | Value Type Map Category 01 |
| TYPE-0002 | Value Type Map Label 02 | Value Type Map Category 02 |
| TYPE-0003 | Value Type Map Label 03 | Value Type Map Category 03 |
| TYPE-0004 | Value Type Map Label 04 | Value Type Map Category 04 |
| TYPE-0005 | Value Type Map Label 05 | Value Type Map Category 05 |
| TYPE-0006 | Value Type Map Label 06 | Value Type Map Category 06 |

**t_requirement_applies_to_system**

| id | requirement |
| --- | --- |
| SYST-0001 | latency under 50ms |
| SYST-0002 | audit logging enabled |
| SYST-0003 | encryption at rest |
| SYST-0004 | backup frequency daily |
| SYST-0005 | network segmentation mandatory |
| SYST-0006 | network segmentation mandatory |

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

Compliance requirements are operationalized through a parameterized attribute framework that decouples rule definitions from their concrete instantiations. Each requirement is enriched with attr definitions and corresponding attr type declarations—ranging from xsd:date and xsd:string to xsd:boolean and xsd:integer—that enforce schema-level validation and prevent type coercion during evaluation. The entity_id column binds these attribute-value pairs to specific system instances, allowing granular policy application across heterogeneous environments. Boolean flags such as false or true govern enforcement states, temporal constraints are captured as ISO-formatted dates like 2025-05-21, and numeric thresholds are stored as discrete integers including 391 or 295. String-valued misc fields further capture contextual metadata, such as Encoding 01 or audit excerpt, ensuring that every requirement carries both executable parameters and descriptive provenance.

**t_requirement_applies_to_system_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SYST-0001 | effective_date | xsd:date |
| SYST-0002 | enforcement | xsd:string |
| SYST-0003 | mandatory | xsd:boolean |
| SYST-0004 | priority | xsd:integer |
| SYST-0005 | review_cycle_days | xsd:integer |
| SYST-0006 | scope | xsd:string |
| SYST-0007 | encoding | xsd:string |
| SYST-0008 | label_text | xsd:string |

**t_requirement_applies_to_system_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SYST-0001 | SYST-0001 | SYST-0003 | false |
| SYST-0002 | SYST-0002 | SYST-0003 | true |
| SYST-0003 | SYST-0003 | SYST-0003 | true |
| SYST-0004 | SYST-0004 | SYST-0003 | false |
| SYST-0005 | SYST-0005 | SYST-0003 | true |
| SYST-0006 | SYST-0006 | SYST-0003 | false |

**t_requirement_applies_to_system_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SYST-0001 | SYST-0001 | SYST-0001 | 2025-05-21 |
| SYST-0002 | SYST-0002 | SYST-0001 | 2024-02-21 |
| SYST-0003 | SYST-0003 | SYST-0001 | 2023-05-13 |
| SYST-0004 | SYST-0004 | SYST-0001 | 2023-08-26 |
| SYST-0005 | SYST-0005 | SYST-0001 | 2025-01-01 |
| SYST-0006 | SYST-0006 | SYST-0001 | 2023-04-22 |

**t_requirement_applies_to_system_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SYST-0001 | SYST-0001 | SYST-0004 | 1 |
| SYST-0002 | SYST-0001 | SYST-0005 | 391 |
| SYST-0003 | SYST-0002 | SYST-0004 | 5 |
| SYST-0004 | SYST-0002 | SYST-0005 | 295 |
| SYST-0005 | SYST-0003 | SYST-0004 | 2 |
| SYST-0006 | SYST-0003 | SYST-0005 | 418 |
| SYST-0007 | SYST-0004 | SYST-0004 | 4 |
| SYST-0008 | SYST-0004 | SYST-0005 | 590 |

**t_requirement_applies_to_system_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SYST-0001 | SYST-0001 | SYST-0007 | Encoding 01 |
| SYST-0002 | SYST-0001 | SYST-0002 | Enforcement 02 |
| SYST-0003 | SYST-0001 | SYST-0008 | audit excerpt |
| SYST-0004 | SYST-0001 | SYST-0009 | fr |
| SYST-0005 | SYST-0001 | SYST-0006 | Scope 05 |
| SYST-0006 | SYST-0002 | SYST-0007 | Encoding 06 |
| SYST-0007 | SYST-0002 | SYST-0002 | Enforcement 07 |
| SYST-0008 | SYST-0002 | SYST-0008 | intake form |

Resource allocation and role assignment are governed by probabilistic matching engines that quantify assignment certainty through confidence and uncertainty metrics. The assigns athlete and assigns division keys establish bidirectional mappings between personnel and organizational units, but these mappings are never treated as absolute; instead, they are scored against a confidence interval and paired with an uncertainty magnitude that reflects data sparsity or model divergence. A record yielding a confidence of 0.806 alongside an uncertainty of 738.86 indicates a high-probability match with substantial variance, whereas a confidence of 0.083 and uncertainty of 740.08 signals a low-reliability assignment requiring manual review. The associated value field, ranging from 254.97 to 407.11, provides a continuous scoring baseline that feeds into downstream optimization routines, while underlying dimension tables maintain categorical boundaries and misc descriptors to support human-in-the-loop adjudication.

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

The interplay between deterministic classification and probabilistic assignment forms the backbone of modern compliance architectures. By separating identifier resolution, type mapping, and categorical labeling from attribute evaluation and assignment scoring, the framework achieves both auditability and adaptability. Size bytes and version tracking preserve storage lineage, typed attributes enforce structural integrity across heterogeneous data sources, and confidence-uncertainty pairs enable risk-weighted decisioning without sacrificing traceability. This separation of concerns ensures that governance policies can be updated independently of underlying resource inventories, while assignment metrics provide actionable signals for reallocation, exception handling, and regulatory reporting. Ultimately, the system transforms raw relational artifacts into a verifiable control plane where every classification, parameter, and assignment carries explicit provenance, measurable reliability, and enforceable boundaries.

**fact_ebpfmap**

| id | value_type_map_key | size_bytes | version |
| --- | --- | --- | --- |
| TYPE-0001 | TYPE-0002 | 208979093 | 3 |
| TYPE-0002 | TYPE-0002 | 156714508 | 6 |
| TYPE-0003 | TYPE-0002 | 31105012 | 12 |
| TYPE-0004 | TYPE-0003 | 354373995 | 5 |
| TYPE-0005 | TYPE-0002 | 866267293 | 2 |