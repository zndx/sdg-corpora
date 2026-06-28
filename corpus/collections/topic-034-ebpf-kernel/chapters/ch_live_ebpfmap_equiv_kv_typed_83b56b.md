---
chapter_id: ch_live_ebpfmap_equiv_kv_typed_83b56b
topic_id: 34
family: 04_ebpf_kernel
cited_terms: ['ebpfmap_equiv_kv_typed', 'allocation_subclass', 'division_assignment_record']
model: engine-refine
---

The assignment of athletes to divisions forms the backbone of a structured classification system, where each linkage is captured as a factual record bearing a unique identifier such as RECO-0001 or RECO-0004. These identifiers serve as the immutable keys through which every assignment is referenced, queried, and audited across the system. Each record in the assignment fact table connects an athlete dimension to a division dimension, establishing a directed relationship where the athlete is the subject and the division is the target. The athlete dimension carries both a human-readable label—Assigns Athlete Label 01, for instance—and a categorical classification like Assigns Athlete Category 01, which groups athletes into meaningful cohorts for aggregation and reporting. Similarly, the division dimension provides its own label and category pair, enabling parallel classification at the division level. This dual-layer structure—label for display, category for grouping—ensures that assignments are both interpretable by humans and analyzable by machines.

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

Every assignment record carries a confidence score and an associated uncertainty value, quantifying the reliability of the linkage. Confidence values range from 0.083 to 0.806 across the dataset, with RECO-0002 achieving a high confidence of 0.806 while RECO-0004 sits at a notably low 0.083, suggesting a weak or speculative assignment. The corresponding uncertainty metric, expressed as a magnitude such as 96.89 or 740.08, provides the inverse perspective: higher uncertainty accompanies lower confidence, reinforcing the assessment that RECO-0004 is the least reliable assignment in the set. These paired metrics enable downstream systems to filter, weight, or flag assignments based on their trustworthiness, ensuring that decisions grounded in the data account for the quality of the underlying linkage. A raw value field, holding figures like 330.50 or 407.11, provides an additional quantitative attribute tied to each assignment, potentially representing a score, weight, or derived metric relevant to the assignment's context.

Beyond the athlete-division linkage, the system models relationships between other entity types using a consistent subject-target-role pattern. In the eBPF map equivalence domain, records connect an eBPF map identifier to a key type or value type, with the role field specifying the nature of the connection—contributor, owner, observer, or reviewer. For example, the mapping between TYPE-0005 and TYPE-0004 carries the role reviewer, indicating that the referenced key type plays a supervisory or validating function over the map. The cardinality note field, present in value type mappings, documents the multiplicity constraints of these relationships, with entries like Cardinality Note 01 through Cardinality Note 04 providing structured descriptions of whether the relationship is one-to-one, one-to-many, or many-to-many. This role-and-cardinality framework ensures that the semantics of every relationship are explicit and machine-readable, supporting both governance and automated reasoning.

**t_ebpfmap_equiv_kv_typed**

| id | ebpfmap |
| --- | --- |
| TYPE-0001 | interface_stats |
| TYPE-0002 | rate_limit |
| TYPE-0003 | rate_limit |
| TYPE-0004 | socket_stats |
| TYPE-0005 | interface_stats |
| TYPE-0006 | interface_stats |
| TYPE-0007 | rate_limit |
| TYPE-0008 | rate_limit |

**t_ebpfmap_equiv_kv_typed_key_type**

| id | key_type |
| --- | --- |
| TYPE-0001 | bpf_cookie |
| TYPE-0002 | uint32_t |
| TYPE-0003 | uint32_t |
| TYPE-0004 | dev_index |
| TYPE-0005 | pid_t |
| TYPE-0006 | inode_key |

**t_ebpfmap_equiv_kv_typed__key_type**

| id | ebpfmap_id | key_type_id | role |
| --- | --- | --- | --- |
| TYPE-0001 | TYPE-0007 | TYPE-0001 | contributor |
| TYPE-0002 | TYPE-0002 | TYPE-0002 | owner |
| TYPE-0003 | TYPE-0005 | TYPE-0002 | owner |
| TYPE-0004 | TYPE-0005 | TYPE-0004 | reviewer |
| TYPE-0005 | TYPE-0004 | TYPE-0005 | reviewer |
| TYPE-0006 | TYPE-0002 | TYPE-0003 | owner |
| TYPE-0007 | TYPE-0006 | TYPE-0006 | owner |
| TYPE-0008 | TYPE-0004 | TYPE-0003 | owner |

**t_ebpfmap_equiv_kv_typed_value_type_map**

| id | value_type_map |
| --- | --- |
| TYPE-0001 | dev_entry |
| TYPE-0002 | task_struct |
| TYPE-0003 | flow_key |
| TYPE-0004 | perf_event |
| TYPE-0005 | stack_trace |
| TYPE-0006 | perf_event |
| TYPE-0007 | stack_trace |

**t_ebpfmap_equiv_kv_typed__value_type_map**

| id | ebpfmap_id | value_type_map_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| TYPE-0001 | TYPE-0005 | TYPE-0002 | contributor | Cardinality Note 01 |
| TYPE-0002 | TYPE-0002 | TYPE-0006 | contributor | Cardinality Note 02 |
| TYPE-0003 | TYPE-0003 | TYPE-0003 | observer | Cardinality Note 03 |
| TYPE-0004 | TYPE-0006 | TYPE-0001 | owner | Cardinality Note 04 |
| TYPE-0005 | TYPE-0007 | TYPE-0005 | owner | Cardinality Note 05 |
| TYPE-0006 | TYPE-0002 | TYPE-0002 | reviewer | Cardinality Note 06 |
| TYPE-0007 | TYPE-0005 | TYPE-0004 | observer | Cardinality Note 07 |
| TYPE-0008 | TYPE-0007 | TYPE-0001 | reviewer | Cardinality Note 08 |

The allocation subclass domain mirrors this relational structure, linking allocation entities such as nightly-ingest or batch-prod-main to the transformations they execute, including Celery Worker, dbt Runner, Flink TaskManager, and TensorFlow Serving. The same subject-target-role pattern applies: an allocation is the subject, the transformation is the target, and the role—contributor or observer—describes the allocation's relationship to the transformation. This uniformity across domains means that the system's data model is composable and extensible; new entity types can be introduced without redesigning the relationship infrastructure. The identifier convention, consistently formatted as ALLO-0001 or TYPE-0001, reinforces traceability across the entire graph of relationships, allowing any entity to be located, cross-referenced, and contextualized regardless of its domain.

**t_allocation_subclass**

| id | allocation |
| --- | --- |
| ALLO-0001 | nightly-ingest |
| ALLO-0002 | etl-daily-load |
| ALLO-0003 | batch-prod-main |
| ALLO-0004 | batch-prod-main |
| ALLO-0005 | audit-log-rotate |
| ALLO-0006 | nightly-ingest |

**t_allocation_subclass_executes_transformation**

| id | executes_transformation |
| --- | --- |
| ALLO-0001 | Celery Worker |
| ALLO-0002 | dbt Runner |
| ALLO-0003 | Flink TaskManager |
| ALLO-0004 | TensorFlow Serving |
| ALLO-0005 | Ray Actor |
| ALLO-0006 | Pandas Engine |

**t_allocation_subclass__executes_transformation**

| id | allocation_id | executes_transformation_id | role |
| --- | --- | --- | --- |
| ALLO-0001 | ALLO-0001 | ALLO-0001 | contributor |
| ALLO-0002 | ALLO-0002 | ALLO-0005 | owner |
| ALLO-0003 | ALLO-0004 | ALLO-0006 | observer |
| ALLO-0004 | ALLO-0005 | ALLO-0004 | contributor |
| ALLO-0005 | ALLO-0001 | ALLO-0003 | reviewer |
| ALLO-0006 | ALLO-0004 | ALLO-0006 | owner |
| ALLO-0007 | ALLO-0004 | ALLO-0004 | reviewer |
| ALLO-0008 | ALLO-0005 | ALLO-0006 | observer |