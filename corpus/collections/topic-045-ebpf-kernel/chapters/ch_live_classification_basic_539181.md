---
chapter_id: ch_live_classification_basic_539181
topic_id: 45
family: 03_directive_governance
cited_terms: ['classification_basic', 'ebpfmap_only_one_value_type', 'iso27001_clause_subclass']
model: engine-refine
---

Classification identifiers serve as the primary anchor for traceability across operational and compliance registries. In the classification basic table, records such as CLAS-0001 through CLAS-0004 carry distinct classification labels—sensor calibration, data validation, and pipeline orchestration—each assigned to a lifecycle phase of either execution or review and initiated through one of three trigger mechanisms: schedule, manual, or retry. The triggered_by column captures the provenance of each classification event, distinguishing between automated periodic triggers and human-initiated actions, while the phase field establishes whether the classification pertains to an active operational stage or a retrospective assessment. This tripartite structure—identifier, phase, and trigger—enables auditors to reconstruct the sequence and authority behind every classification decision without ambiguity.

**t_classification_basic**

| id | classification | phase | triggered_by |
| --- | --- | --- | --- |
| CLAS-0001 | sensor calibration | execution | schedule |
| CLAS-0002 | data validation | review | manual |
| CLAS-0003 | pipeline orchestration | execution | schedule |
| CLAS-0004 | sensor calibration | review | retry |
| CLAS-0005 | data ingestion | execution | event |
| CLAS-0006 | batch processing | review | retry |

The value type map dimension and its associated fact table form a metadata backbone for eBPF map registries. The dimension table, dim_value_type_map, assigns human-readable labels such as Value Type Map Label 01 through 04 to categorical groupings like Value Type Map Category 01 through 03, providing a stable classification layer that remains decoupled from the raw telemetry data. The fact table, fact_ebpfmap, links each map instance to a type_map key—TYPE-0002 appearing repeatedly across entries—while recording the size in bytes, which ranges from approximately 31 million to 354 million, and a version number spanning from 1 to 12. The size_bytes column is particularly consequential for capacity planning and resource allocation, as the variance between the smallest and largest entries exceeds an order of magnitude, and the version field enables change tracking across map schema evolutions.

**fact_ebpfmap**

| id | value_type_map_key | size_bytes | version |
| --- | --- | --- | --- |
| TYPE-0001 | TYPE-0002 | 208979093 | 3 |
| TYPE-0002 | TYPE-0002 | 156714508 | 6 |
| TYPE-0003 | TYPE-0002 | 31105012 | 12 |
| TYPE-0004 | TYPE-0003 | 354373995 | 5 |
| TYPE-0005 | TYPE-0002 | 866267293 | 2 |

ISO 27001 compliance is modeled through a three-table structure that separates clause definitions from their subclassifications and the roles assigned to each linkage. The clause subclass table, t_iso27001_clause_subclass, enumerates subclasses identified as CLAU-0001 through CLAU-0004, each referencing an ISO standard clause. The clause definition table, t_iso27001_clause_subclass_iso27001_clause, maps these subclasses to their governing clause names—Risk treatment, Performance evaluation, Improvement, and Leadership—establishing the normative framework against which compliance is measured. The junction table, t_iso27001_clause_subclass__iso27001_clause, binds a subclass identifier to both a subject clause and a target clause, with the role column designating whether the responsible party acts as reviewer, contributor, or owner. For instance, record CLAU-0001 assigns a reviewer role to the linkage between subject CLAU-0004 and target CLAU-0001, while CLAU-0004 designates an owner role for the connection between subject CLAU-0005 and target CLAU-0006. This separation of concerns—clause definitions, subclass instances, and role assignments—ensures that accountability is explicitly encoded rather than implied.

**t_iso27001_clause_subclass**

| id | iso |
| --- | --- |
| CLAU-0001 | Iso 01 |
| CLAU-0002 | Iso 02 |
| CLAU-0003 | Iso 03 |
| CLAU-0004 | Iso 04 |
| CLAU-0005 | Iso 05 |
| CLAU-0006 | Iso 06 |

**t_iso27001_clause_subclass_iso27001_clause**

| id | iso27001_clause |
| --- | --- |
| CLAU-0001 | Risk treatment |
| CLAU-0002 | Performance evaluation |
| CLAU-0003 | Improvement |
| CLAU-0004 | Leadership |
| CLAU-0005 | Risk treatment |
| CLAU-0006 | Risk treatment |

**t_iso27001_clause_subclass__iso27001_clause**

| id | iso_id | iso27001_clause_id | role |
| --- | --- | --- | --- |
| CLAU-0001 | CLAU-0004 | CLAU-0001 | reviewer |
| CLAU-0002 | CLAU-0001 | CLAU-0003 | contributor |
| CLAU-0003 | CLAU-0004 | CLAU-0006 | contributor |
| CLAU-0004 | CLAU-0005 | CLAU-0006 | owner |
| CLAU-0005 | CLAU-0005 | CLAU-0004 | owner |
| CLAU-0006 | CLAU-0006 | CLAU-0006 | owner |
| CLAU-0007 | CLAU-0001 | CLAU-0006 | reviewer |
| CLAU-0008 | CLAU-0005 | CLAU-0003 | contributor |

Across all three registries, the identifier column functions as the universal key, whether formatted as CLAS- prefixed classification codes, TYPE- prefixed type map references, or CLAU- prefixed ISO clause identifiers. The category and misc columns from the value type map dimension provide the semantic layer that translates machine-readable keys into organizational categories and human-readable labels, while the role column in the ISO junction table introduces a governance dimension that distinguishes between oversight, authorship, and ownership responsibilities. Together, these tables constitute a structured framework for tracking operational classifications, managing eBPF map metadata, and enforcing ISO 27001 compliance obligations, with each column serving a distinct purpose in the audit trail.

**dim_value_type_map**

| id | value_type_map_label | value_type_map_category |
| --- | --- | --- |
| TYPE-0001 | Value Type Map Label 01 | Value Type Map Category 01 |
| TYPE-0002 | Value Type Map Label 02 | Value Type Map Category 02 |
| TYPE-0003 | Value Type Map Label 03 | Value Type Map Category 03 |
| TYPE-0004 | Value Type Map Label 04 | Value Type Map Category 04 |
| TYPE-0005 | Value Type Map Label 05 | Value Type Map Category 05 |
| TYPE-0006 | Value Type Map Label 06 | Value Type Map Category 06 |