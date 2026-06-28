---
chapter_id: ch_live_frozen_artifact_governed_by_31b6c1
topic_id: 23
family: 07_long_tail
cited_terms: ['frozen_artifact_governed_by', 'designative_for_specific_role', 'belief_function_for']
model: engine-refine
---

Attributes constitute the named properties by which governed artifacts are characterized, each bound to a strict type that governs both storage semantics and validation. An attribute such as *effective_date* carries the type `xsd:date`, constraining its values to the ISO 8601 format—`2025-04-28`, `2024-02-08`, `2024-10-20`, `2024-01-16`—while *mandatory* is typed `xsd:boolean`, admitting only `true` or `false`. The attribute *priority* is an `xsd:integer`, permitting values such as `718` and `330` to express ordinal significance, and *enforcement* is a `xsd:string`, receiving free-form text like `Enforcement 02` and `calibration record`. This type discipline ensures that every attribute value, whether a date, a boolean flag, an integer rank, or an unstructured string, is interpretable without ambiguity across systems.

**t_frozen_artifact_governed_by_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| GOVE-0001 | effective_date | xsd:date |
| GOVE-0002 | enforcement | xsd:string |
| GOVE-0003 | mandatory | xsd:boolean |
| GOVE-0004 | priority | xsd:integer |
| GOVE-0005 | review_cycle_days | xsd:integer |
| GOVE-0006 | scope | xsd:string |
| GOVE-0007 | encoding | xsd:string |
| GOVE-0008 | label_text | xsd:string |

The entity identifier serves as the anchor to which attribute values are affixed. Each governed artifact—*Log-Archive-23Q4*, *Model-Prod-v4*, *Q3-2023-Snapshot*, *Compliance-09*—is assigned a unique identifier such as `GOVE-0001` through `GOVE-0004`, and these identifiers appear as foreign keys in the value tables, linking concrete data back to the artifact they describe. The same identifier recurs across multiple value tables, allowing a single entity to carry heterogeneous attributes: a date value, a boolean flag, an integer, and a string, all resolved through the shared entity key.

**t_frozen_artifact_governed_by**

| id | frozen |
| --- | --- |
| GOVE-0001 | Log-Archive-23Q4 |
| GOVE-0002 | Model-Prod-v4 |
| GOVE-0003 | Q3-2023-Snapshot |
| GOVE-0004 | Compliance-09 |
| GOVE-0005 | Audit-Baseline-2024 |
| GOVE-0006 | Log-Archive-23Q4 |

**t_frozen_artifact_governed_by_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| GOVE-0001 | GOVE-0001 | GOVE-0003 | false |
| GOVE-0002 | GOVE-0002 | GOVE-0003 | true |
| GOVE-0003 | GOVE-0003 | GOVE-0003 | false |
| GOVE-0004 | GOVE-0004 | GOVE-0003 | true |
| GOVE-0005 | GOVE-0005 | GOVE-0003 | false |
| GOVE-0006 | GOVE-0006 | GOVE-0003 | false |

**t_frozen_artifact_governed_by_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| GOVE-0001 | GOVE-0001 | GOVE-0001 | 2025-04-28 |
| GOVE-0002 | GOVE-0002 | GOVE-0001 | 2024-02-08 |
| GOVE-0003 | GOVE-0003 | GOVE-0001 | 2024-10-20 |
| GOVE-0004 | GOVE-0004 | GOVE-0001 | 2024-01-16 |
| GOVE-0005 | GOVE-0005 | GOVE-0001 | 2024-06-17 |
| GOVE-0006 | GOVE-0006 | GOVE-0001 | 2024-04-05 |

**t_frozen_artifact_governed_by_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| GOVE-0001 | GOVE-0001 | GOVE-0004 | 1 |
| GOVE-0002 | GOVE-0001 | GOVE-0005 | 718 |
| GOVE-0003 | GOVE-0002 | GOVE-0004 | 5 |
| GOVE-0004 | GOVE-0002 | GOVE-0005 | 330 |
| GOVE-0005 | GOVE-0003 | GOVE-0004 | 4 |
| GOVE-0006 | GOVE-0003 | GOVE-0005 | 316 |
| GOVE-0007 | GOVE-0004 | GOVE-0004 | 5 |
| GOVE-0008 | GOVE-0004 | GOVE-0005 | 796 |

**t_frozen_artifact_governed_by_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| GOVE-0001 | GOVE-0001 | GOVE-0007 | Encoding 01 |
| GOVE-0002 | GOVE-0001 | GOVE-0002 | Enforcement 02 |
| GOVE-0003 | GOVE-0001 | GOVE-0008 | calibration record |
| GOVE-0004 | GOVE-0001 | GOVE-0009 | es |
| GOVE-0005 | GOVE-0001 | GOVE-0006 | Scope 05 |
| GOVE-0006 | GOVE-0002 | GOVE-0007 | Encoding 06 |
| GOVE-0007 | GOVE-0002 | GOVE-0002 | Enforcement 07 |
| GOVE-0008 | GOVE-0002 | GOVE-0008 | nightly summary |

Encoding governs the character repertoire used to represent designative labels that identify and classify operational resources. A designative such as *Sensor-Array-Beta* or *CoreSample-X22* is stored using either `ascii` or `unicode` encoding, a distinction that matters when interoperating with legacy systems or internationalized data pipelines. The encoding field, alongside the designative itself, the resource it identifies—*Calibration-Standard-ISO*, *Network-Edge-Router*, *Data-Lake-Partition*, *Quality-Control-Log*—and a classification code like `D-33` or `A-01`, forms a self-contained descriptor record. These records are not merely labels; they are the referents that bind abstract identifiers to concrete, observable entities within the governed environment.

**t_designative_for_specific_role**

| id | designative | identifies | code | encoding |
| --- | --- | --- | --- | --- |
| ROLE-0001 | Sensor-Array-Beta | Calibration-Standard-ISO | D-33 | ascii |
| ROLE-0002 | Unit-Shift-Log | Network-Edge-Router | B-12 | unicode |
| ROLE-0003 | CoreSample-X22 | Data-Lake-Partition | E-21 | unicode |
| ROLE-0004 | Batch-Alpha-99 | Quality-Control-Log | A-01 | ascii |
| ROLE-0005 | CoreSample-X22 | Bioreactor-Module-B | D-33 | latin1 |
| ROLE-0006 | LIDAR-Array-7 | Data-Lake-Partition | C-07 | ascii |
| ROLE-0007 | LIDAR-Array-7 | Quality-Control-Log | D-33 | ascii |
| ROLE-0008 | LIDAR-Array-7 | Geolocation-Map-Grid | A-01 | latin1 |

The relationship between belief functions and their associated claims is mediated by a subject–target pairing, where the subject is the belief function identifier and the target is the claim identifier. A belief function such as `FUNC-0001`, whose belief statement reads *Data quality baseline*, may be linked to a claim about *API response latency* through a role assignment—`owner`, `observer`, or `contributor`—that specifies the functional relationship between the two. The same belief function can serve as the target of another, creating a chain of dependency: `FUNC-0001` appears both as a subject (linking to `FUNC-0007`) and as a target (linked from `FUNC-0003`), with roles shifting accordingly. This structure supports audit trails and accountability matrices, making it possible to trace which belief underpins which claim and who bears responsibility for each link.

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