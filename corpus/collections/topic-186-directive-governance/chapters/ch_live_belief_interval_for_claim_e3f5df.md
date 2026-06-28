---
chapter_id: ch_live_belief_interval_for_claim_e3f5df
topic_id: 186
family: 06_belief_structure
cited_terms: ['belief_interval_for_claim', 'column_pair_object', 'ebpfmap_equiv_kv_typed']
model: engine-refine
---

Within governed data architectures, every record must be anchored by a stable identifier—unique, opaque keys such as CLAI-0001 or OBJE-0001 that serve as the immutable reference point for assertions, measurements, and type definitions. These identifiers decouple identity from meaning: the label attached to an object column, for instance, may change as business terminology evolves, but the identifier OBJE-0001 remains the constant handle by which downstream systems, audit trails, and cross-references resolve to the same entity. In practice, identifiers appear as primary keys in dimension tables like dim_object_column, where they pair with human-readable labels such as Object Column Label 01 and classification categories like Object Column Category 01, and as foreign keys in fact and junction tables that tie observations back to their source definitions.

**dim_object_column**

| id | object_column_label | object_column_category |
| --- | --- | --- |
| OBJE-0001 | Object Column Label 01 | Object Column Category 01 |
| OBJE-0002 | Object Column Label 02 | Object Column Category 02 |
| OBJE-0003 | Object Column Label 03 | Object Column Category 03 |
| OBJE-0004 | Object Column Label 04 | Object Column Category 04 |
| OBJE-0005 | Object Column Label 05 | Object Column Category 05 |
| OBJE-0006 | Object Column Label 06 | Object Column Category 06 |

Object columns themselves represent the atomic units of measured or asserted data—columns that carry values subject to quality controls, confidence assessments, and uncertainty bounds. A fact record such as OBJE-0001 links to its originating column, assigns a confidence of 0.164 and an uncertainty of 560.21, and stores the observed value of 257.80. Confidence and uncertainty operate as complementary quality signals: confidence quantifies the degree of assurance in the measurement (values ranging from 0.068 to 0.354 across the dataset), while uncertainty captures the magnitude of potential deviation (values spanning 404.01 to 984.09). Together they enable downstream consumers to weight evidence appropriately, flagging low-confidence, high-uncertainty records for manual review or exclusion from automated decision pipelines.

**fact_column**

| id | object_column_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| OBJE-0001 | OBJE-0006 | 0.164 | 560.21 | 257.80 |
| OBJE-0002 | OBJE-0001 | 0.068 | 744.10 | 571.55 |
| OBJE-0003 | OBJE-0004 | 0.107 | 984.09 | 140.18 |
| OBJE-0004 | OBJE-0002 | 0.354 | 404.01 | 131.27 |
| OBJE-0005 | OBJE-0006 | 0.790 | 109.97 | 235.19 |
| OBJE-0006 | OBJE-0003 | 0.934 | 653.09 | 813.74 |
| OBJE-0007 | OBJE-0004 | 0.938 | 827.04 | 409.13 |
| OBJE-0008 | OBJE-0006 | 0.734 | 419.22 | 492.32 |

Beyond numeric quality signals, data governance requires semantic classification of observations through dimension kinds and categorical groupings. Dimension kinds—time, length, count, mass—establish the physical or logical unit of a measurement, ensuring that comparisons and aggregations respect dimensional consistency. In the belief-to-claim mapping, each assertion such as Network packet loss or CPU utilization rate is paired with a dimension kind and a numeric value like 547.06, grounding the qualitative claim in a quantifiable, unit-aware context. Categories provide an orthogonal classification layer, grouping object columns into logical families (Object Column Category 01 through 04) that support filtering, access control, and reporting without altering the underlying identifiers.

The most structurally complex governance patterns emerge in junction tables that model many-to-many relationships between typed entities, where subject and target columns form the foreign-key backbone and role columns describe the nature of the association. In the ebpfmap key-type mapping, for example, a subject record (TYPE-0002) relates to a target key type (TYPE-0002) through a role of owner, while another pairing (TYPE-0005 to TYPE-0002) carries the role of reviewer. Roles such as contributor, owner, and reviewer encode the functional relationship between entities, enabling fine-grained provenance tracking and permission derivation. The cardinality note column—holding values like Cardinality Note 01 through Cardinality Note 04—supplements this by documenting whether the relationship is one-to-one, one-to-many, or many-to-many, ensuring that join semantics and aggregation logic remain correct across the data model.

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

Miscellaneous value columns capture auxiliary data that does not fit neatly into the primary quality or classification schema. In the belief-interval table, the value column stores numeric measurements (457.08 to 866.46) that accompany each belief-claim pairing, while in the fact table, the same column holds the observed data point itself. This separation of concerns—keeping identifiers, quality metrics, classifications, and auxiliary values in distinct columns—preserves schema clarity and enables independent evolution of each governance dimension. The result is a data model where every observation can be traced to its source column, assessed for reliability, classified by type and category, and understood within its relational context, all without conflating orthogonal concerns.

**t_belief_interval_for_claim**

| id | belief | for_claim | dimension_kind | value |
| --- | --- | --- | --- | --- |
| CLAI-0001 | Network packet loss | Pipeline latency elevated | time | 547.06 |
| CLAI-0002 | CPU utilization rate | Sensor calibration drift | length | 866.46 |
| CLAI-0003 | Checksum mismatch found | Cache hit ratio low | count | 659.49 |
| CLAI-0004 | Pipeline latency elevated | Cache hit ratio low | mass | 457.08 |