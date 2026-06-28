---
chapter_id: ch_live_ebpfprogram_writes_to_map_46d9ac
topic_id: 44
family: 04_ebpf_kernel
cited_terms: ['ebpfprogram_writes_to_map', 'belief_function_for', 'policy_only_governs_artifacts']
model: engine-refine
---

The operational telemetry model centers on a star schema that captures eBPF program metadata alongside their map interaction patterns. The fact table fact_ebpfprogram records program-level attributes including identifier, memory footprint, and version, while foreign-keying to the dimension table dim_writes_to_map through the writes_to_map_key column. This relationship anchors each program to its classification metadata—label and category—enabling categorical aggregation of programs by their map-writing behavior. Program MAP-0001, for instance, occupies 784,335,640 bytes at version 12 and references map category "Writes To Map Category 01," whereas MAP-0003, at 113,209,263 bytes and version 11, references "Writes To Map Category 03." The dimension table dim_writes_to_map provides the controlled vocabulary for these classifications, with entries such as "Writes To Map Label 01" through "Writes To Map Label 04" paired against their corresponding categories, establishing a consistent taxonomy across the telemetry corpus.

**fact_ebpfprogram**

| id | writes_to_map_key | size_bytes | version |
| --- | --- | --- | --- |
| MAP-0001 | MAP-0003 | 784335640 | 12 |
| MAP-0002 | MAP-0005 | 641704069 | 9 |
| MAP-0003 | MAP-0003 | 113209263 | 11 |
| MAP-0004 | MAP-0001 | 161013093 | 12 |
| MAP-0005 | MAP-0002 | 352203820 | 12 |
| MAP-0006 | MAP-0006 | 167519051 | 1 |

**dim_writes_to_map**

| id | writes_to_map_label | writes_to_map_category |
| --- | --- | --- |
| MAP-0001 | Writes To Map Label 01 | Writes To Map Category 01 |
| MAP-0002 | Writes To Map Label 02 | Writes To Map Category 02 |
| MAP-0003 | Writes To Map Label 03 | Writes To Map Category 03 |
| MAP-0004 | Writes To Map Label 04 | Writes To Map Category 04 |
| MAP-0005 | Writes To Map Label 05 | Writes To Map Category 05 |
| MAP-0006 | Writes To Map Label 06 | Writes To Map Category 06 |
| MAP-0007 | Writes To Map Label 07 | Writes To Map Category 07 |

The belief and claim framework introduces a reasoning layer that links analytical assertions to operational claims through a role-based association table. The table t_belief_function_for stores belief statements—such as "Data quality baseline," "Data quality score below baseline," and "Storage volume capacity critical"—while t_belief_function_for_belief_for_claim enumerates the claims they support, including "API response latency," "Compute node availability compromised," "Data pipeline throughput," and "Authentication service unresponsive." The junction table t_belief_function_for__belief_for_claim materializes the many-to-many relationship between beliefs and claims, assigning each linkage a role designation: owner, observer, or contributor. A single belief such as FUNC-0001 may serve as the owner of claim FUNC-0007 while simultaneously functioning as a contributor to claim FUNC-0001, reflecting the multi-faceted nature of analytical reasoning in operational contexts.

**t_belief_function_for**

| id | belief |
| --- | --- |
| FUNC-0001 | Data quality baseline |
| FUNC-0002 | Data quality score below baseline |
| FUNC-0003 | Data quality baseline |
| FUNC-0004 | Storage volume capacity critical |
| FUNC-0005 | Model convergence failure observed |
| FUNC-0006 | Storage volume utilization |

**t_belief_function_for_belief_for_claim**

| id | belief_for_claim |
| --- | --- |
| FUNC-0001 | API response latency |
| FUNC-0002 | Compute node availability compromised |
| FUNC-0003 | Data pipeline throughput |
| FUNC-0004 | Authentication service unresponsive |
| FUNC-0005 | Network topology state |
| FUNC-0006 | Data pipeline throughput degraded |
| FUNC-0007 | Compliance audit status |

Governance enforcement is modeled through the t_policy_only_governs_artifacts table, which catalogs policy instruments alongside their enforcement posture and priority ranking. Policies such as "Data Retention Policy," "Access Control Policy," "Privacy Compliance Policy," and "Immutable Audit Policy" are each assigned an enforcement mode—blocking, advisory, or deprecated—and a numeric priority from 1 through 5. The enforcement designation determines whether a policy is actively enforced (blocking), recommended but not enforced (advisory), or no longer applicable (deprecated), while the priority field establishes resolution order when multiple policies apply to the same artifact. Privacy Compliance Policy carries priority 1, indicating its precedence over Access Control Policy at priority 4 and Immutable Audit Policy at priority 5.

**t_policy_only_governs_artifacts**

| id | policy | enforcement | priority |
| --- | --- | --- | --- |
| ARTI-0001 | Data Retention Policy | blocking | 2 |
| ARTI-0002 | Access Control Policy | advisory | 4 |
| ARTI-0003 | Privacy Compliance Policy | deprecated | 1 |
| ARTI-0004 | Immutable Audit Policy | advisory | 5 |
| ARTI-0005 | Provenance Tracking Policy | deprecated | 5 |
| ARTI-0006 | Access Control Policy | mandatory | 1 |

The architecture integrates these layers through explicit foreign-key relationships that preserve referential integrity across the operational data model. The writes_to_map_key in fact_ebpfprogram references dim_writes_to_map.id, ensuring every program's map classification is traceable to the controlled vocabulary. The belief-to-claim associations in t_belief_function_for__belief_for_claim reference both t_belief_function_for.id (as subject) and t_belief_function_for_belief_for_claim.id (as target), creating a directed graph of analytical reasoning that can be traversed by role. This design supports auditability: any operational claim can be traced back through its contributing beliefs, and any belief can be evaluated against the policies that govern the artifacts it references.

**t_belief_function_for__belief_for_claim**

| id | belief_id | belief_for_claim_id | role |
| --- | --- | --- | --- |
| FUNC-0001 | FUNC-0001 | FUNC-0007 | owner |
| FUNC-0002 | FUNC-0006 | FUNC-0005 | observer |
| FUNC-0003 | FUNC-0004 | FUNC-0001 | owner |
| FUNC-0004 | FUNC-0005 | FUNC-0003 | contributor |
| FUNC-0005 | FUNC-0005 | FUNC-0002 | observer |
| FUNC-0006 | FUNC-0005 | FUNC-0007 | owner |
| FUNC-0007 | FUNC-0006 | FUNC-0007 | reviewer |
| FUNC-0008 | FUNC-0004 | FUNC-0007 | owner |