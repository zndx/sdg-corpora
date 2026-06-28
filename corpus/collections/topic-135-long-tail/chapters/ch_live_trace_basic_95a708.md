---
chapter_id: ch_live_trace_basic_95a708
topic_id: 135
family: 02_observation_measurement
cited_terms: ['trace_basic', 'process_min_one_output', 'constraint_with_predicate']
model: engine-refine
---

In distributed observability and compliance frameworks, the distinction between an entity and its attributes constitutes the foundational schema for all downstream analysis. An entity represents a discrete operational occurrence—a trace such as `load-balancer-routing` or `worker-task-execution`, or a process output like `feature extraction pipeline` or `model training run`—each assigned a stable identifier (`TRAC-0001`, `OUTP-0001`, and so forth) that anchors it across the system. These identifiers are not merely labels; they serve as the primary keys through which all attribute-value associations are resolved, ensuring that a measurement of `1505.64` seconds for `duration_seconds` can be unambiguously attributed to the trace `TRAC-0001` rather than any other concurrent operation. The separation of entity identity from attribute definition permits the same attribute schema—`duration_seconds`, `end_time`, `exit_code`, `host_name`—to be reused across heterogeneous entity types, whether the entity is a trace or a process output, without requiring schema duplication.

**t_trace_basic**

| id | trace | observed_at |
| --- | --- | --- |
| TRAC-0001 | load-balancer-routing | OUTP-0007 |
| TRAC-0002 | frontend-render-loop | OUTP-0001 |
| TRAC-0003 | message-broker-poll | OUTP-0001 |
| TRAC-0004 | worker-task-execution | OUTP-0005 |
| TRAC-0005 | cache-hit-miss-run | OUTP-0004 |
| TRAC-0006 | message-broker-poll | OUTP-0002 |

**t_trace_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| TRAC-0001 | duration_seconds | xsd:decimal |
| TRAC-0002 | end_time | xsd:dateTime |
| TRAC-0003 | exit_code | xsd:integer |
| TRAC-0004 | host_name | xsd:string |
| TRAC-0005 | log_level | xsd:string |
| TRAC-0006 | phase | xsd:string |
| TRAC-0007 | retry_count | xsd:integer |
| TRAC-0008 | scheduled_at | xsd:dateTime |

**t_trace_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TRAC-0001 | TRAC-0001 | TRAC-0002 | 2023-04-16T02:44:01 |
| TRAC-0002 | TRAC-0001 | TRAC-0008 | 2024-07-31T11:49:14 |
| TRAC-0003 | TRAC-0001 | TRAC-0009 | 2025-04-08T10:42:35 |
| TRAC-0004 | TRAC-0002 | TRAC-0002 | 2023-05-20T09:49:51 |
| TRAC-0005 | TRAC-0002 | TRAC-0008 | 2023-07-22T09:50:59 |
| TRAC-0006 | TRAC-0002 | TRAC-0009 | 2023-11-29T05:54:22 |
| TRAC-0007 | TRAC-0003 | TRAC-0002 | 2023-07-03T21:45:54 |
| TRAC-0008 | TRAC-0003 | TRAC-0008 | 2023-03-31T15:28:51 |

**t_trace_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TRAC-0001 | TRAC-0001 | TRAC-0001 | 1505.64 |
| TRAC-0002 | TRAC-0002 | TRAC-0001 | 5061.29 |
| TRAC-0003 | TRAC-0003 | TRAC-0001 | 4957.42 |
| TRAC-0004 | TRAC-0004 | TRAC-0001 | 1589.98 |
| TRAC-0005 | TRAC-0005 | TRAC-0001 | 2846.09 |
| TRAC-0006 | TRAC-0006 | TRAC-0001 | 1626.04 |

**t_trace_basic_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TRAC-0001 | TRAC-0001 | TRAC-0003 | 376 |
| TRAC-0002 | TRAC-0001 | TRAC-0007 | 314 |
| TRAC-0003 | TRAC-0002 | TRAC-0003 | 88 |
| TRAC-0004 | TRAC-0002 | TRAC-0007 | 293 |
| TRAC-0005 | TRAC-0003 | TRAC-0003 | 468 |
| TRAC-0006 | TRAC-0003 | TRAC-0007 | 480 |
| TRAC-0007 | TRAC-0004 | TRAC-0003 | 297 |
| TRAC-0008 | TRAC-0004 | TRAC-0007 | 77 |

**t_trace_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TRAC-0001 | TRAC-0001 | TRAC-0004 | node-b14 |
| TRAC-0002 | TRAC-0001 | TRAC-0005 | Log Level 02 |
| TRAC-0003 | TRAC-0001 | TRAC-0006 | initiation |
| TRAC-0004 | TRAC-0001 | TRAC-0010 | complete |
| TRAC-0005 | TRAC-0001 | TRAC-0011 | Triggered By 05 |
| TRAC-0006 | TRAC-0002 | TRAC-0004 | ingest-21 |
| TRAC-0007 | TRAC-0002 | TRAC-0005 | Log Level 07 |
| TRAC-0008 | TRAC-0002 | TRAC-0006 | initiation |

**t_process_min_one_output**

| id | process | output |
| --- | --- | --- |
| OUTP-0001 | feature extraction pipeline | TRAC-0004 |
| OUTP-0002 | pipeline rollback procedure | TRAC-0004 |
| OUTP-0003 | feature extraction pipeline | TRAC-0002 |
| OUTP-0004 | model training run | TRAC-0006 |
| OUTP-0005 | data validation cycle | TRAC-0004 |
| OUTP-0006 | model training run | TRAC-0006 |
| OUTP-0007 | anomaly detection sweep | TRAC-0006 |

**t_process_min_one_output_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| OUTP-0001 | duration_seconds | xsd:decimal |
| OUTP-0002 | end_time | xsd:dateTime |
| OUTP-0003 | exit_code | xsd:integer |
| OUTP-0004 | host_name | xsd:string |
| OUTP-0005 | log_level | xsd:string |
| OUTP-0006 | phase | xsd:string |
| OUTP-0007 | retry_count | xsd:integer |
| OUTP-0008 | scheduled_at | xsd:dateTime |

**t_process_min_one_output_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OUTP-0001 | OUTP-0001 | OUTP-0002 | 2023-04-19T05:25:34 |
| OUTP-0002 | OUTP-0001 | OUTP-0008 | 2023-03-27T21:29:05 |
| OUTP-0003 | OUTP-0001 | OUTP-0009 | 2025-05-24T00:18:25 |
| OUTP-0004 | OUTP-0002 | OUTP-0002 | 2024-01-13T03:16:51 |
| OUTP-0005 | OUTP-0002 | OUTP-0008 | 2024-09-26T20:27:11 |
| OUTP-0006 | OUTP-0002 | OUTP-0009 | 2023-06-30T01:21:38 |
| OUTP-0007 | OUTP-0003 | OUTP-0002 | 2024-04-05T13:10:28 |
| OUTP-0008 | OUTP-0003 | OUTP-0008 | 2023-07-31T01:33:46 |

**t_process_min_one_output_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OUTP-0001 | OUTP-0001 | OUTP-0001 | 1575.12 |
| OUTP-0002 | OUTP-0002 | OUTP-0001 | 3915.42 |
| OUTP-0003 | OUTP-0003 | OUTP-0001 | 6819.95 |
| OUTP-0004 | OUTP-0004 | OUTP-0001 | 6826.25 |
| OUTP-0005 | OUTP-0005 | OUTP-0001 | 4127.39 |
| OUTP-0006 | OUTP-0006 | OUTP-0001 | 1299.93 |
| OUTP-0007 | OUTP-0007 | OUTP-0001 | 6249.12 |

**t_process_min_one_output_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OUTP-0001 | OUTP-0001 | OUTP-0003 | 695 |
| OUTP-0002 | OUTP-0001 | OUTP-0007 | 449 |
| OUTP-0003 | OUTP-0002 | OUTP-0003 | 903 |
| OUTP-0004 | OUTP-0002 | OUTP-0007 | 474 |
| OUTP-0005 | OUTP-0003 | OUTP-0003 | 215 |
| OUTP-0006 | OUTP-0003 | OUTP-0007 | 204 |
| OUTP-0007 | OUTP-0004 | OUTP-0003 | 967 |
| OUTP-0008 | OUTP-0004 | OUTP-0007 | 241 |

**t_process_min_one_output_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OUTP-0001 | OUTP-0001 | OUTP-0004 | ingest-21 |
| OUTP-0002 | OUTP-0001 | OUTP-0005 | Log Level 02 |
| OUTP-0003 | OUTP-0001 | OUTP-0006 | closeout |
| OUTP-0004 | OUTP-0001 | OUTP-0010 | complete |
| OUTP-0005 | OUTP-0001 | OUTP-0011 | Triggered By 05 |
| OUTP-0006 | OUTP-0002 | OUTP-0004 | worker-07 |
| OUTP-0007 | OUTP-0002 | OUTP-0005 | Log Level 07 |
| OUTP-0008 | OUTP-0002 | OUTP-0006 | closeout |

Attribute typing is where the schema acquires its semantic rigor. Each attribute carries a type annotation drawn from the XSD namespace—`xsd:decimal` for `duration_seconds`, `xsd:dateTime` for `end_time`, `xsd:integer` for `exit_code`, and `xsd:string` for `host_name`—and this typing governs not only storage but also validation, query semantics, and cross-entity comparability. The type system is enforced through value partitioning: decimal values such as `5061.29` and `4957.42` reside in a dedicated value store, datetime values like `2023-04-16T02:44:01` and `2024-07-31T11:49:14` in another, integer values such as `376` and `88` in a third, and string values including `node-b14`, `Log Level 02`, `ingest-21`, and `closeout` in a fourth. This normalization by type eliminates ambiguity at query time and ensures that a comparison of `duration_seconds` across traces—say, `1589.98` versus `6826.25`—operates on homogeneous data without implicit coercion.

The value-entity-attribute triad forms a star-like join pattern that is both space-efficient and semantically precise. A single entity, such as trace `TRAC-0001`, may carry multiple attributes across multiple value tables: its `duration_seconds` of `1505.64` in the decimal store, its `end_time` of `2023-04-16T02:44:01` in the datetime store, its `exit_code` of `376` in the integer store, and its `host_name` of `node-b14` in the varchar store. Each value row carries an `entity_id` that points back to the originating trace and an `attr_id` that resolves to the attribute definition, creating a bidirectional link between the concrete measurement and its schema. This design permits heterogeneous attribute sets per entity type while maintaining a uniform query interface; a process output like `OUTP-0001` ("feature extraction pipeline") carries the same attribute vocabulary—`duration_seconds` of `1575.12`, `end_time` of `2023-04-19T05:25:34`, `exit_code` of `695`, `host_name` of `ingest-21`—but the join path is identical regardless of whether the entity is a trace or an output.

Constraint predicates introduce a second relational dimension, one that governs compliance and governance rather than measurement. Here, the subject-target-role triad encodes how constraints relate to predicates: a constraint such as `Authentication requirement` (`PRED-0003`) acts as the subject, a predicate such as `authRequirement` (`PRED-0001`) serves as the target, and the role—`owner`, `observer`, or `contributor`—describes the nature of the association. The constraint `Log retention mandate` (`PRED-0001`) is linked to the predicate `authRequirement` (`PRED-0001`) with role `owner`, while `Quality assurance protocol` (`PRED-0002`) connects to `unitSpecification` (`PRED-0003`) with role `observer`. This structure allows a single predicate to participate in multiple constraint relationships with different roles, enabling fine-grained governance policies where, for instance, the same `checksumValidation` predicate may be a `contributor` to one constraint and an `observer` to another. The role field is the critical discriminator: it transforms a simple bipartite link into a typed relationship that carries semantic weight for policy evaluation and audit trails.

**t_constraint_with_predicate**

| id | constraint |
| --- | --- |
| PRED-0001 | Log retention mandate |
| PRED-0002 | Quality assurance protocol |
| PRED-0003 | Authentication requirement |
| PRED-0004 | Max latency threshold |
| PRED-0005 | Access control directive |
| PRED-0006 | Max latency threshold |
| PRED-0007 | Data retention policy |
| PRED-0008 | Authentication requirement |

**t_constraint_with_predicate_predicate**

| id | predicate |
| --- | --- |
| PRED-0001 | authRequirement |
| PRED-0002 | authRequirement |
| PRED-0003 | unitSpecification |
| PRED-0004 | checksumValidation |
| PRED-0005 | targetDataset |
| PRED-0006 | formatRule |

**t_constraint_with_predicate__predicate**

| id | constraint_id | predicate_id | role |
| --- | --- | --- | --- |
| PRED-0001 | PRED-0003 | PRED-0001 | owner |
| PRED-0002 | PRED-0005 | PRED-0003 | observer |
| PRED-0003 | PRED-0004 | PRED-0002 | contributor |
| PRED-0004 | PRED-0007 | PRED-0001 | contributor |
| PRED-0005 | PRED-0008 | PRED-0001 | reviewer |
| PRED-0006 | PRED-0002 | PRED-0003 | reviewer |
| PRED-0007 | PRED-0006 | PRED-0002 | reviewer |
| PRED-0008 | PRED-0001 | PRED-0005 | observer |

Together, these structures form a two-layered model: the measurement layer, which captures what happened (entities, attributes, typed values), and the governance layer, which captures what rules apply (constraints, predicates, subject-target-role associations). The measurement layer supports operational queries—what was the duration of trace `TRAC-0002`? which host ran `worker-task-execution`?—while the governance layer supports compliance queries—does the `Max latency threshold` constraint reference `unitSpecification` as a `contributor`? The two layers are independent but complementary; an entity's attributes can be validated against predicates that are themselves linked to constraints through the subject-target-role relationship. This separation of concerns is what allows the system to scale: new attribute types can be added to the measurement layer without touching governance rules, and new constraints can be composed from existing predicates without redefining the attribute schema.