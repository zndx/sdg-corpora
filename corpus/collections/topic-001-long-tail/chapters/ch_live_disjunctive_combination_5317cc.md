---
chapter_id: ch_live_disjunctive_combination_5317cc
topic_id: 1
family: 07_long_tail
cited_terms: ['disjunctive_combination', 'bpf_helper_called_by', 'control_only_addresses_threat_class']
model: engine-refine
---

Every relational construct in this framework begins with a stable identifier, a fixed string such as `COMB-0001` or `THRE-0001` that serves as the immutable anchor for an entity. These identifiers do not merely label records; they establish the primary keys that bind together disparate attribute definitions and their corresponding values. An entity, in this context, is not a monolithic row but a relational node that aggregates multiple properties across type-specific value tables. The architecture deliberately decouples the entity’s structural identity from the data it carries, ensuring that each record can be referenced unambiguously while its attributes are stored, validated, and retrieved according to strict type boundaries.

The `attr` column captures the semantic property being measured or enforced—`confidence`, `dimension_kind`, `checksum`, `effective_date`, `enforcement`, or `mandatory`—while the `attr type` column dictates the schema-level constraints governing that property. Type declarations such as `xsd:decimal`, `xsd:string`, `xsd:dateTime`, `xsd:date`, `xsd:boolean`, `xsd:integer`, and `cco:DesignativeICE` enforce precision at the metadata layer, preventing cross-contamination between numeric thresholds, temporal markers, and categorical flags. This separation ensures that a decimal threshold like `0.084` or `689.68` never collides with a temporal stamp like `2023-12-19T10:56:22`, nor with a categorical descriptor such as `Dimension Kind 01` or `Encoding 02`. The type system acts as a gatekeeper, routing each attribute into its appropriate value repository before any downstream query or compliance check executes.

Within this partitioned schema, the `entity` column functions as the foreign key that reattaches typed values to their parent records, while the `misc` column holds the actual payload. Rather than storing heterogeneous data in a single polymorphic field, the model distributes values across discrete tables keyed by their `attr type`. Boolean enforcement flags like `true` or `false` reside alongside integer thresholds such as `5` or `926`; date fields like `2024-12-09` or `2025-01-04` are isolated from string payloads like `1a4b6c2d`, `proprietary`, or `change rationale`. The `entity` identifier bridges this division, ensuring that when a system resolves `THRE-0001`, it retrieves the correct `xsd:date` for `effective_date`, the correct `xsd:boolean` for `mandatory`, and the correct `xsd:integer` for `priority` without ambiguity.

In operational practice, this architecture enables precise, auditable tracing of compliance and control relationships. Consider a control record such as `THRE-0001`, which maps to a risk class via `COMB-0004` and carries an `effective_date` of `2024-12-09`, an `enforcement` flag of `Enforcement 02`, and a `mandatory` status of `true`. The system does not treat these as a single text blob; it resolves each attribute through its declared type, validates the `xsd:boolean` constraint, and cross-references the `entity_id` to confirm that the value belongs to the correct control lineage. Similarly, a disjunctive combination like `COMB-0001` aggregates a `confidence` decimal of `0.084`, a `recorded_at` timestamp of `2023-12-19T10:56:22`, and a `dimension_kind` string of `Dimension Kind 01`, each routed through its respective value table and bound back to the parent identifier. This granular routing eliminates type coercion errors and preserves the provenance of every metric.

**t_disjunctive_combination**

| id | disjunctive | disjunctively_combines |
| --- | --- | --- |
| COMB-0001 | Schema_validation_union | THRE-0006 |
| COMB-0002 | OR_filter_rule | THRE-0007 |
| COMB-0003 | OR_filter_rule | THRE-0007 |
| COMB-0004 | Schema_validation_union | THRE-0003 |
| COMB-0005 | Metric_aggregation_branch | THRE-0008 |
| COMB-0006 | Compliance_check_union | THRE-0002 |

**t_disjunctive_combination_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| COMB-0001 | confidence | xsd:decimal |
| COMB-0002 | dimension_kind | xsd:string |
| COMB-0003 | method | xsd:string |
| COMB-0004 | recorded_at | xsd:dateTime |
| COMB-0005 | uncertainty | xsd:decimal |
| COMB-0006 | unit | xsd:string |
| COMB-0007 | value | xsd:decimal |
| COMB-0008 | encoding | xsd:string |

**t_disjunctive_combination_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COMB-0001 | COMB-0001 | COMB-0004 | 2023-12-19T10:56:22 |
| COMB-0002 | COMB-0002 | COMB-0004 | 2025-06-13T05:31:45 |
| COMB-0003 | COMB-0003 | COMB-0004 | 2023-09-21T03:35:03 |
| COMB-0004 | COMB-0004 | COMB-0004 | 2025-01-18T01:14:05 |
| COMB-0005 | COMB-0005 | COMB-0004 | 2023-04-13T14:48:56 |
| COMB-0006 | COMB-0006 | COMB-0004 | 2023-06-17T09:04:58 |

**t_disjunctive_combination_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COMB-0001 | COMB-0001 | COMB-0001 | 0.084 |
| COMB-0002 | COMB-0001 | COMB-0005 | 689.68 |
| COMB-0003 | COMB-0001 | COMB-0007 | 250.05 |
| COMB-0004 | COMB-0002 | COMB-0001 | 0.409 |
| COMB-0005 | COMB-0002 | COMB-0005 | 133.59 |
| COMB-0006 | COMB-0002 | COMB-0007 | 440.04 |
| COMB-0007 | COMB-0003 | COMB-0001 | 0.271 |
| COMB-0008 | COMB-0003 | COMB-0005 | 418.58 |

**t_disjunctive_combination_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COMB-0001 | COMB-0001 | COMB-0002 | Dimension Kind 01 |
| COMB-0002 | COMB-0001 | COMB-0008 | Encoding 02 |
| COMB-0003 | COMB-0001 | COMB-0009 | calibration record |
| COMB-0004 | COMB-0001 | COMB-0010 | ja |
| COMB-0005 | COMB-0001 | COMB-0003 | hybrid |
| COMB-0006 | COMB-0001 | COMB-0006 | count |
| COMB-0007 | COMB-0002 | COMB-0002 | Dimension Kind 07 |
| COMB-0008 | COMB-0002 | COMB-0008 | Encoding 08 |

The deliberate fragmentation of `misc` values by `attr type` is not an artifact of legacy design but a governance mechanism. By isolating numeric, temporal, boolean, and string payloads, the framework guarantees that compliance checks, audit trails, and risk assessments operate against homogeneous data sets. The `identifier` remains the constant; the `attr` defines the question; the `attr type` enforces the grammar; the `entity` anchors the context; and the `misc` supplies the answer. When these five elements align, the system achieves deterministic resolution across thousands of control mappings, threat classifications, and helper call relationships, ensuring that every query returns not just data, but validated, type-safe evidence.

**t_bpf_helper_called_by**

| id | bpf | called_by_program |
| --- | --- | --- |
| CALL-0001 | socket_connect_trace | THRE-0001 |
| CALL-0002 | xdp_router | THRE-0004 |
| CALL-0003 | lsm:inode_create | THRE-0003 |
| CALL-0004 | tracepoint:sched_process_exit | THRE-0007 |
| CALL-0005 | raw_tracepoint:sys_enter | THRE-0002 |
| CALL-0006 | cgroup_skb_ingress | THRE-0008 |

**t_bpf_helper_called_by_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CALL-0001 | checksum | xsd:string |
| CALL-0002 | created_date | xsd:date |
| CALL-0003 | identifier | cco:DesignativeICE |
| CALL-0004 | license | xsd:string |
| CALL-0005 | mime_type | xsd:string |
| CALL-0006 | size_bytes | xsd:long |
| CALL-0007 | uri | xsd:string |
| CALL-0008 | version | xsd:integer |

**t_bpf_helper_called_by_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CALL-0001 | CALL-0001 | CALL-0002 | 2024-07-02 |
| CALL-0002 | CALL-0002 | CALL-0002 | 2025-01-26 |
| CALL-0003 | CALL-0003 | CALL-0002 | 2024-10-16 |
| CALL-0004 | CALL-0004 | CALL-0002 | 2023-11-11 |
| CALL-0005 | CALL-0005 | CALL-0002 | 2024-05-09 |
| CALL-0006 | CALL-0006 | CALL-0002 | 2025-02-22 |

**t_bpf_helper_called_by_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CALL-0001 | CALL-0001 | CALL-0006 | 67 |
| CALL-0002 | CALL-0001 | CALL-0008 | 11 |
| CALL-0003 | CALL-0002 | CALL-0006 | 259 |
| CALL-0004 | CALL-0002 | CALL-0008 | 9 |
| CALL-0005 | CALL-0003 | CALL-0006 | 333 |
| CALL-0006 | CALL-0003 | CALL-0008 | 11 |
| CALL-0007 | CALL-0004 | CALL-0006 | 103 |
| CALL-0008 | CALL-0004 | CALL-0008 | 4 |

**t_bpf_helper_called_by_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CALL-0001 | CALL-0001 | CALL-0001 | 1a4b6c2d |
| CALL-0002 | CALL-0001 | CALL-0003 | ARN:res/41 |
| CALL-0003 | CALL-0001 | CALL-0004 | proprietary |
| CALL-0004 | CALL-0001 | CALL-0009 | zone-b |
| CALL-0005 | CALL-0001 | CALL-0005 | application/octet-stream |
| CALL-0006 | CALL-0001 | CALL-0010 | Name 06 |
| CALL-0007 | CALL-0001 | CALL-0011 | data-engineering |
| CALL-0008 | CALL-0001 | CALL-0012 | Tags 08 |

**t_control_only_addresses_threat_class**

| id | control | addresses_risk |
| --- | --- | --- |
| THRE-0001 | Multi-Factor Authentication | COMB-0004 |
| THRE-0002 | Incident Response Plan | COMB-0001 |
| THRE-0003 | Incident Response Plan | COMB-0002 |
| THRE-0004 | Access Review Policy | COMB-0005 |
| THRE-0005 | Backup Retention Schedule | COMB-0001 |
| THRE-0006 | Backup Retention Schedule | COMB-0003 |
| THRE-0007 | Access Review Policy | COMB-0002 |
| THRE-0008 | Incident Response Plan | COMB-0005 |

**t_control_only_addresses_threat_class_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| THRE-0001 | effective_date | xsd:date |
| THRE-0002 | enforcement | xsd:string |
| THRE-0003 | mandatory | xsd:boolean |
| THRE-0004 | priority | xsd:integer |
| THRE-0005 | review_cycle_days | xsd:integer |
| THRE-0006 | scope | xsd:string |
| THRE-0007 | encoding | xsd:string |
| THRE-0008 | label_text | xsd:string |

**t_control_only_addresses_threat_class_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| THRE-0001 | THRE-0001 | THRE-0003 | true |
| THRE-0002 | THRE-0002 | THRE-0003 | false |
| THRE-0003 | THRE-0003 | THRE-0003 | false |
| THRE-0004 | THRE-0004 | THRE-0003 | true |
| THRE-0005 | THRE-0005 | THRE-0003 | true |
| THRE-0006 | THRE-0006 | THRE-0003 | false |
| THRE-0007 | THRE-0007 | THRE-0003 | true |
| THRE-0008 | THRE-0008 | THRE-0003 | true |

**t_control_only_addresses_threat_class_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| THRE-0001 | THRE-0001 | THRE-0001 | 2024-12-09 |
| THRE-0002 | THRE-0002 | THRE-0001 | 2024-12-21 |
| THRE-0003 | THRE-0003 | THRE-0001 | 2025-01-04 |
| THRE-0004 | THRE-0004 | THRE-0001 | 2023-01-13 |
| THRE-0005 | THRE-0005 | THRE-0001 | 2023-09-02 |
| THRE-0006 | THRE-0006 | THRE-0001 | 2023-12-08 |
| THRE-0007 | THRE-0007 | THRE-0001 | 2025-01-04 |
| THRE-0008 | THRE-0008 | THRE-0001 | 2024-03-28 |

**t_control_only_addresses_threat_class_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| THRE-0001 | THRE-0001 | THRE-0004 | 5 |
| THRE-0002 | THRE-0001 | THRE-0005 | 99 |
| THRE-0003 | THRE-0002 | THRE-0004 | 5 |
| THRE-0004 | THRE-0002 | THRE-0005 | 926 |
| THRE-0005 | THRE-0003 | THRE-0004 | 1 |
| THRE-0006 | THRE-0003 | THRE-0005 | 740 |
| THRE-0007 | THRE-0004 | THRE-0004 | 4 |
| THRE-0008 | THRE-0004 | THRE-0005 | 301 |

**t_control_only_addresses_threat_class_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| THRE-0001 | THRE-0001 | THRE-0007 | Encoding 01 |
| THRE-0002 | THRE-0001 | THRE-0002 | Enforcement 02 |
| THRE-0003 | THRE-0001 | THRE-0008 | change rationale |
| THRE-0004 | THRE-0001 | THRE-0009 | fr |
| THRE-0005 | THRE-0001 | THRE-0006 | Scope 05 |
| THRE-0006 | THRE-0002 | THRE-0007 | Encoding 06 |
| THRE-0007 | THRE-0002 | THRE-0002 | Enforcement 07 |
| THRE-0008 | THRE-0002 | THRE-0008 | nightly summary |