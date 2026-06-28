---
chapter_id: ch_live_trace_in_service_a4eae7
topic_id: 100
family: 02_observation_measurement
cited_terms: ['trace_in_service', 'claim_subclass', 'frame_refinement']
model: engine-refine
---

In governance frameworks that track operational provenance, the distinction between an entity and its attributes forms the foundational schema for auditability. An entity—identified by a stable identifier such as `SERV-0001` or `REFI-0006`—represents a discrete operational artifact, whether a trace execution like `ci-cd-deploy-run` or a frame construct such as `Regulatory Audit Trail`. The entity identifier serves as the immutable anchor across all relational tables, ensuring that every attribute value, claim, and refinement relationship can be traced back to its source. Attributes themselves are defined separately from their values: a schema table declares that `duration_seconds` carries type `xsd:decimal`, that `end_time` is typed `xsd:dateTime`, and that `host_name` is `xsd:string`. This separation of attribute definition from attribute instantiation permits schema evolution without invalidating historical data, a requirement in compliance environments where audit trails must remain intact across system changes.

**t_trace_in_service**

| id | trace | in_service |
| --- | --- | --- |
| SERV-0001 | ci-cd-deploy-run | REFI-0006 |
| SERV-0002 | nightly-data-sync | REFI-0002 |
| SERV-0003 | microservice-call-path | REFI-0005 |
| SERV-0004 | sensor-telemetry-batch | REFI-0003 |
| SERV-0005 | nightly-data-sync | REFI-0002 |
| SERV-0006 | microservice-call-path | REFI-0003 |

**t_trace_in_service_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SERV-0001 | duration_seconds | xsd:decimal |
| SERV-0002 | end_time | xsd:dateTime |
| SERV-0003 | exit_code | xsd:integer |
| SERV-0004 | host_name | xsd:string |
| SERV-0005 | log_level | xsd:string |
| SERV-0006 | phase | xsd:string |
| SERV-0007 | retry_count | xsd:integer |
| SERV-0008 | scheduled_at | xsd:dateTime |

**t_trace_in_service_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SERV-0001 | SERV-0001 | SERV-0002 | 2023-02-11T21:39:45 |
| SERV-0002 | SERV-0001 | SERV-0008 | 2025-04-17T05:33:23 |
| SERV-0003 | SERV-0001 | SERV-0009 | 2024-09-24T02:59:34 |
| SERV-0004 | SERV-0002 | SERV-0002 | 2023-11-01T18:02:16 |
| SERV-0005 | SERV-0002 | SERV-0008 | 2023-07-24T15:59:25 |
| SERV-0006 | SERV-0002 | SERV-0009 | 2023-09-19T06:42:34 |
| SERV-0007 | SERV-0003 | SERV-0002 | 2025-04-22T19:55:46 |
| SERV-0008 | SERV-0003 | SERV-0008 | 2024-12-15T02:05:50 |

**t_trace_in_service_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SERV-0001 | SERV-0001 | SERV-0001 | 4381.06 |
| SERV-0002 | SERV-0002 | SERV-0001 | 2102.62 |
| SERV-0003 | SERV-0003 | SERV-0001 | 5138.88 |
| SERV-0004 | SERV-0004 | SERV-0001 | 2082.99 |
| SERV-0005 | SERV-0005 | SERV-0001 | 6123.82 |
| SERV-0006 | SERV-0006 | SERV-0001 | 5465.25 |

**t_trace_in_service_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SERV-0001 | SERV-0001 | SERV-0003 | 744 |
| SERV-0002 | SERV-0001 | SERV-0007 | 59 |
| SERV-0003 | SERV-0002 | SERV-0003 | 247 |
| SERV-0004 | SERV-0002 | SERV-0007 | 232 |
| SERV-0005 | SERV-0003 | SERV-0003 | 916 |
| SERV-0006 | SERV-0003 | SERV-0007 | 56 |
| SERV-0007 | SERV-0004 | SERV-0003 | 376 |
| SERV-0008 | SERV-0004 | SERV-0007 | 417 |

**t_trace_in_service_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SERV-0001 | SERV-0001 | SERV-0004 | node-b14 |
| SERV-0002 | SERV-0001 | SERV-0005 | Log Level 02 |
| SERV-0003 | SERV-0001 | SERV-0006 | initiation |
| SERV-0004 | SERV-0001 | SERV-0010 | failed |
| SERV-0005 | SERV-0001 | SERV-0011 | Triggered By 05 |
| SERV-0006 | SERV-0002 | SERV-0004 | node-b14 |
| SERV-0007 | SERV-0002 | SERV-0005 | Log Level 07 |
| SERV-0008 | SERV-0002 | SERV-0006 | initiation |

**t_claim_subclass**

| id | claim | claim_about | method | label_text |
| --- | --- | --- | --- | --- |
| CLAI-0001 | Lab centrifuge unit-7 | REFI-0003 | automated | audit excerpt |
| CLAI-0002 | QC sample failed | REFI-0002 | hybrid | intake form |
| CLAI-0003 | Packet loss SLA breach | REFI-0004 | hybrid | pre-release note |
| CLAI-0004 | Authentication microservice | REFI-0002 | inferred | calibration record |

**t_frame_refinement**

| id | frame |
| --- | --- |
| REFI-0001 | Regulatory Audit Trail |
| REFI-0002 | Lab Sample Container Type |
| REFI-0003 | Data Lake Partition Schema |
| REFI-0004 | Regulatory Audit Trail |
| REFI-0005 | Data Lake Partition Schema |
| REFI-0006 | ISO 9001 Quality Framework |

**t_frame_refinement_refines_frame**

| id | refines_frame |
| --- | --- |
| REFI-0001 | Ground Station Uplink |
| REFI-0002 | Sterile Container Variant |
| REFI-0003 | IPv4 Header Format |
| REFI-0004 | Ku Band Downlink |
| REFI-0005 | Sterile Container Variant |
| REFI-0006 | Ground Station Uplink |

The instantiation of attribute values follows a type-dispatched pattern that reflects the heterogeneity of operational metadata. Decimal measurements—`4381.06`, `2102.62`, `5138.88`—reside in one value table, integer results such as `744` and `59` in another, and temporal markers like `2023-02-11T21:39:45` in a third. String-valued attributes capture identifiers like `node-b14`, status labels such as `failed`, and categorical descriptors including `initiation`. This type-partitioned storage model ensures that each value is stored in a column type that matches its semantic domain, eliminating the ambiguity that arises from untyped string columns while preserving the ability to query, aggregate, and validate each class of metric independently. The `attr_id` column in each value table serves as the foreign key linking back to the attribute definition, completing the chain from schema declaration through to concrete measurement.

Claims introduce a second dimension of provenance, asserting properties about entities through structured statements that carry their own methodological provenance. A claim such as `QC sample failed` is directed at entity `REFI-0002` and is classified as `hybrid` in origin, with supporting evidence recorded as an `intake form`. Another claim, `Packet loss SLA breach`, also targets `REFI-0002` but derives from a `pre-release note` through an `inferred` method. The `label_text` column captures the nature of the evidentiary source—`audit excerpt`, `calibration record`, `intake form`—while the `method` column distinguishes between `automated` detection, `hybrid` human-in-the-loop analysis, and `inferred` derivation from correlated signals. This tripartite structure (claim content, evidentiary label, derivation method) enables downstream systems to weight claims by confidence and to reconstruct the chain of reasoning that produced each assertion.

Refinement relationships between frames are mediated through a junction table that encodes not only which frame refines which other frame, but the functional role of each participant in that relationship. Frame `REFI-0005` refines `REFI-0004` with the role of `observer`, while `REFI-0006` assumes the role of `owner` over `REFI-0005`. The `subject` column identifies the frame doing the refining, and the `target` column identifies the frame being refined, creating a directed graph of refinement dependencies. Roles such as `contributor` and `reviewer` further qualify the nature of the refinement interaction, enabling governance policies that restrict which roles may initiate or approve frame modifications. This role-annotated relationship model transforms a simple parent-child hierarchy into a richly qualified dependency graph suitable for impact analysis and change management in regulated environments.

**t_frame_refinement__refines_frame**

| id | frame_id | refines_frame_id | role |
| --- | --- | --- | --- |
| REFI-0001 | REFI-0005 | REFI-0004 | observer |
| REFI-0002 | REFI-0006 | REFI-0005 | owner |
| REFI-0003 | REFI-0003 | REFI-0006 | contributor |
| REFI-0004 | REFI-0002 | REFI-0005 | reviewer |
| REFI-0005 | REFI-0003 | REFI-0006 | contributor |
| REFI-0006 | REFI-0004 | REFI-0004 | owner |
| REFI-0007 | REFI-0005 | REFI-0003 | owner |
| REFI-0008 | REFI-0002 | REFI-0006 | contributor |