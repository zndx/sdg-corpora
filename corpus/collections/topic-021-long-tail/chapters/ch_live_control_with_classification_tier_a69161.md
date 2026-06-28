---
chapter_id: ch_live_control_with_classification_tier_a69161
topic_id: 21
family: 03_directive_governance
cited_terms: ['control_with_classification_tier', 'ebpfmap_equiv_kv_typed', 'column_tag_subclass']
model: engine-refine
---

In governed information systems, stable identifiers anchor every assertion that must survive audit, migration, and cross-system reconciliation. An identifier such as TIER-0001 or TYPE-0005 is not merely a surrogate key; it is the durable handle by which a control, map equivalence, or column annotation is referenced across attribute registries, typed value stores, and association tables without ambiguity. When Input sanitization (TIER-0001) carries an effective_date of 2023-02-10 and Role based access (TIER-0002) carries 2023-09-02, those dates are not free-floating literals but values bound to a specific entity through identifier discipline, so downstream reviewers can determine which obligation became operative when, and whether two systems are describing the same object or conflating homonyms.

**t_control_with_classification_tier**

| id | control |
| --- | --- |
| TIER-0001 | Input sanitization |
| TIER-0002 | Role based access |
| TIER-0003 | Encryption at rest |
| TIER-0004 | Session expiration |
| TIER-0005 | Firewall rule set |
| TIER-0006 | Encryption at rest |

**t_control_with_classification_tier_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| TIER-0001 | effective_date | xsd:date |
| TIER-0002 | enforcement | xsd:string |
| TIER-0003 | mandatory | xsd:boolean |
| TIER-0004 | priority | xsd:integer |
| TIER-0005 | review_cycle_days | xsd:integer |
| TIER-0006 | scope | xsd:string |
| TIER-0007 | encoding | xsd:string |
| TIER-0008 | label_text | xsd:string |

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

The entity is the thing being described—the control tier, the eBPF map type, the annotated column—while attr names the facet of that thing under measurement or policy. Attribute typing (attr_type) is the contract that governs representation and validation: effective_date and recorded_at are declared as xsd:date and xsd:dateTime respectively, mandatory as xsd:boolean, priority as xsd:integer, confidence as xsd:decimal, and enforcement or dimension_kind as xsd:string. That typing is operational, not decorative. It routes each assertion into the correct physical value store—boolean, date, integer, varchar, decimal, or datetime—so that a reviewer comparing Encryption at rest (TIER-0003, mandatory true) against Input sanitization (TIER-0001, mandatory false) is comparing semantically equivalent propositions rather than strings that merely resemble booleans. The misc designation marks the payload itself—the instantiated value—whether it is 715 beside priority on TIER-0001, 0.376 for confidence on TAG-0001, or the audit excerpt attached to a varchar assertion on TIER-0001. Separating attr from misc preserves the distinction between what is being said about an entity and what is actually said.

Subject and target formalize directed relationships in which one registry entry governs, constrains, or is interpreted through another. In eBPF map equivalence modeling, an ebpfmap_id on the subject side—TYPE-0007 paired with key_type bpf_cookie (TYPE-0001), or TYPE-0005 paired twice with uint32_t (TYPE-0002)—asserts that a concrete map participates in a typed key or value association whose meaning depends on orientation. The target side (key_type_id or value_type_map_id) supplies the typing artifact: dev_index, task_struct, flow_key, perf_event. Role qualifies how that subject bears on its target within governance or operational responsibility: contributor for interface_stats keyed by bpf_cookie, owner for rate_limit maps bound to uint32_t keys and task_struct values, reviewer for socket_stats with dev_index keys, observer where a rate_limit subject links to flow_key without ownership. Roles prevent symmetric edges from being misread as interchangeable; the same uint32_t key type can appear under different subjects with different authority postures.

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

Cardinality note extends subject–target bindings where multiplicity cannot be inferred from type alone. When TYPE-0005 associates with value_type_map task_struct under owner and TYPE-0003 associates with flow_key under observer, appended notes—Cardinality Note 02, Cardinality Note 03—document whether one map may map to many value types, whether the association is optional, or whether enforcement expects exactly one canonical pairing. Without such annotation, integrators routinely over-generalize one-to-one assumptions across rate_limit and socket_stats configurations that share identifiers but differ in permitted fan-out. Cardinality notes therefore function as operational guardrails in compliance review: they tell an auditor not only who owns a mapping but how many distinct targets a subject may legitimately carry.

Column-tag subclassing demonstrates how entity, attr, attr_type, and misc compose into field-level governance. Columns such as user_id, patient_id, and sensor_reading receive subclass annotations (TAG-0001 through TAG-0004) whose attrs—confidence, dimension_kind, method, recorded_at—capture provenance and semantic characterization distinct from the raw column name. A confidence of 0.809 on TAG-0002 (log_level) and 0.376 on TAG-0001 (user_id), recorded_at timestamps spanning 2023-08-03T19:45:29 through 2025-05-22T05:44:38, and varchar misc values including Dimension Kind 01 and intake form show that annotation is itself a typed, time-stamped evidentiary layer: identifiers tie each measurement to the column entity, attr declares the dimension of metadata, attr_type selects the validator and store, and misc holds the empirical reading. Reviewers treating patient_id (TAG-0003) and sensor_reading (TAG-0004), both annotating TIER-0006, can align control-tier obligations with column-level confidence and method without collapsing distinct entities into a single undifferentiated tag.

**t_control_with_classification_tier_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0001 | TIER-0003 | false |
| TIER-0002 | TIER-0002 | TIER-0003 | true |
| TIER-0003 | TIER-0003 | TIER-0003 | true |
| TIER-0004 | TIER-0004 | TIER-0003 | true |
| TIER-0005 | TIER-0005 | TIER-0003 | true |
| TIER-0006 | TIER-0006 | TIER-0003 | false |

**t_control_with_classification_tier_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0001 | TIER-0004 | 2 |
| TIER-0002 | TIER-0001 | TIER-0005 | 715 |
| TIER-0003 | TIER-0002 | TIER-0004 | 4 |
| TIER-0004 | TIER-0002 | TIER-0005 | 86 |
| TIER-0005 | TIER-0003 | TIER-0004 | 1 |
| TIER-0006 | TIER-0003 | TIER-0005 | 78 |
| TIER-0007 | TIER-0004 | TIER-0004 | 5 |
| TIER-0008 | TIER-0004 | TIER-0005 | 174 |

**t_control_with_classification_tier_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0001 | TIER-0007 | Encoding 01 |
| TIER-0002 | TIER-0001 | TIER-0002 | Enforcement 02 |
| TIER-0003 | TIER-0001 | TIER-0008 | audit excerpt |
| TIER-0004 | TIER-0001 | TIER-0009 | en |
| TIER-0005 | TIER-0001 | TIER-0006 | Scope 05 |
| TIER-0006 | TIER-0002 | TIER-0007 | Encoding 06 |
| TIER-0007 | TIER-0002 | TIER-0002 | Enforcement 07 |
| TIER-0008 | TIER-0002 | TIER-0008 | change rationale |

**t_column_tag_subclass**

| id | column | annotates_column |
| --- | --- | --- |
| TAG-0001 | user_id | TIER-0001 |
| TAG-0002 | log_level | TIER-0003 |
| TAG-0003 | patient_id | TIER-0006 |
| TAG-0004 | sensor_reading | TIER-0006 |
| TAG-0005 | throughput_mb | TIER-0005 |
| TAG-0006 | sensor_reading | TIER-0006 |
| TAG-0007 | region_code | TIER-0003 |

**t_column_tag_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| TAG-0001 | confidence | xsd:decimal |
| TAG-0002 | dimension_kind | xsd:string |
| TAG-0003 | method | xsd:string |
| TAG-0004 | recorded_at | xsd:dateTime |
| TAG-0005 | uncertainty | xsd:decimal |
| TAG-0006 | unit | xsd:string |
| TAG-0007 | value | xsd:decimal |
| TAG-0008 | encoding | xsd:string |

**t_column_tag_subclass_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TAG-0001 | TAG-0001 | TAG-0004 | 2023-08-03T19:45:29 |
| TAG-0002 | TAG-0002 | TAG-0004 | 2025-03-24T11:46:10 |
| TAG-0003 | TAG-0003 | TAG-0004 | 2025-05-22T05:44:38 |
| TAG-0004 | TAG-0004 | TAG-0004 | 2025-01-14T19:12:47 |
| TAG-0005 | TAG-0005 | TAG-0004 | 2024-02-24T06:52:57 |
| TAG-0006 | TAG-0006 | TAG-0004 | 2024-10-16T08:04:03 |
| TAG-0007 | TAG-0007 | TAG-0004 | 2025-02-04T08:16:45 |

**t_column_tag_subclass_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TAG-0001 | TAG-0001 | TAG-0001 | 0.376 |
| TAG-0002 | TAG-0001 | TAG-0005 | 922.76 |
| TAG-0003 | TAG-0001 | TAG-0007 | 942.47 |
| TAG-0004 | TAG-0002 | TAG-0001 | 0.809 |
| TAG-0005 | TAG-0002 | TAG-0005 | 398.44 |
| TAG-0006 | TAG-0002 | TAG-0007 | 718.52 |
| TAG-0007 | TAG-0003 | TAG-0001 | 0.172 |
| TAG-0008 | TAG-0003 | TAG-0005 | 254.23 |

**t_column_tag_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TAG-0001 | TAG-0001 | TAG-0002 | Dimension Kind 01 |
| TAG-0002 | TAG-0001 | TAG-0008 | Encoding 02 |
| TAG-0003 | TAG-0001 | TAG-0009 | intake form |
| TAG-0004 | TAG-0001 | TAG-0010 | en |
| TAG-0005 | TAG-0001 | TAG-0003 | automated |
| TAG-0006 | TAG-0001 | TAG-0006 | m/s |
| TAG-0007 | TAG-0002 | TAG-0002 | Dimension Kind 07 |
| TAG-0008 | TAG-0002 | TAG-0008 | Encoding 08 |

Taken together, identifier, entity, attr, attr_type, misc, subject, target, role, and cardinality note constitute a separable but interlocking vocabulary for evidence-backed governance. Identifiers and entities stabilize what is being governed; attrs and attr_types define what may be asserted and how it must be encoded; misc carries the factual content of those assertions; subject, target, role, and cardinality note articulate relational structure and accountability where singleton records are insufficient. Whether the domain is control-tier enforcement (Encryption at rest mandatory from 2024-01-29, Session expiration priority 86) or kernel map typing (rate_limit as owner of uint32_t keys and task_struct values), the same compositional logic applies: typed attributes on entities, directed associations with explicit roles, and cardinality notes where multiplicity governs compliance interpretation. Practitioners who internalize that separation can trace any displayed value back through entity and attr to its identifier, validate it against attr_type, and situate it within subject–target graphs without conflating names, values, or responsibilities—precisely the traceability compliance handbooks require when controls, telemetry schemas, and annotated data columns must be shown to mean the same thing in operations, audit, and design.

**t_control_with_classification_tier_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0001 | TIER-0001 | 2023-02-10 |
| TIER-0002 | TIER-0002 | TIER-0001 | 2023-09-02 |
| TIER-0003 | TIER-0003 | TIER-0001 | 2024-01-29 |
| TIER-0004 | TIER-0004 | TIER-0001 | 2024-02-25 |
| TIER-0005 | TIER-0005 | TIER-0001 | 2025-05-01 |
| TIER-0006 | TIER-0006 | TIER-0001 | 2023-03-16 |

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