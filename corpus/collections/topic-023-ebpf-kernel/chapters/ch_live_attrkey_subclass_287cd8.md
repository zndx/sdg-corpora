---
chapter_id: ch_live_attrkey_subclass_287cd8
topic_id: 23
family: 01_foundation
cited_terms: ['attrkey_subclass', 'ebpf_program_governed_by_directive', 'observation_governed_by_policy']
model: engine-refine
---

In governed telemetry and compliance systems, metadata is not an afterthought but the substrate on which auditability, enforcement, and cross-domain reconciliation rest. Seven relational roles—identifier, entity, attr, attr_type, format, namespace, and misc—form a composable vocabulary for describing what is being governed, how it may be serialized, and where authoritative values live. An identifier supplies durable, referentially stable keys that survive schema evolution and permit joins across otherwise heterogeneous record classes; directives such as DIRE-0001 through DIRE-0004, policy observations POLI-0001 through POLI-0004, and attribute-key definitions ATTR-0001 through ATTR-0004 each carry prefixed, opaque identifiers that function as primary anchors rather than as human-readable labels. The entity role, expressed through entity_id in typed value stores, binds a concrete attribute assignment to the governed object that owns it: every boolean, date, integer, and varchar value for directive DIRE-0003, for instance, resolves through entity_id DIRE-0003, while observation POLI-0001 accumulates decimal durations, datetime end markers, integer exit codes, and varchar host names under the same entity key. This separation—identifier for the row, entity for the subject of governance—prevents conflation of storage identity with the operational object under policy.

**t_ebpf_program_governed_by_directive_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0003 | false |
| DIRE-0002 | DIRE-0002 | DIRE-0003 | true |
| DIRE-0003 | DIRE-0003 | DIRE-0003 | true |
| DIRE-0004 | DIRE-0004 | DIRE-0003 | true |
| DIRE-0005 | DIRE-0005 | DIRE-0003 | false |
| DIRE-0006 | DIRE-0006 | DIRE-0003 | false |

**t_ebpf_program_governed_by_directive_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0001 | 2024-06-04 |
| DIRE-0002 | DIRE-0002 | DIRE-0001 | 2025-03-23 |
| DIRE-0003 | DIRE-0003 | DIRE-0001 | 2025-01-20 |
| DIRE-0004 | DIRE-0004 | DIRE-0001 | 2024-06-12 |
| DIRE-0005 | DIRE-0005 | DIRE-0001 | 2025-03-15 |
| DIRE-0006 | DIRE-0006 | DIRE-0001 | 2024-12-23 |

**t_ebpf_program_governed_by_directive_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0007 | Encoding 01 |
| DIRE-0002 | DIRE-0001 | DIRE-0002 | Enforcement 02 |
| DIRE-0003 | DIRE-0001 | DIRE-0008 | audit excerpt |
| DIRE-0004 | DIRE-0001 | DIRE-0009 | en |
| DIRE-0005 | DIRE-0001 | DIRE-0006 | Scope 05 |
| DIRE-0006 | DIRE-0002 | DIRE-0007 | Encoding 06 |
| DIRE-0007 | DIRE-0002 | DIRE-0002 | Enforcement 07 |
| DIRE-0008 | DIRE-0002 | DIRE-0008 | audit excerpt |

**t_observation_governed_by_policy**

| id | observation |
| --- | --- |
| POLI-0001 | north vent temperature spike |
| POLI-0002 | ingestion pipeline backpressure |
| POLI-0003 | core switch packet loss |
| POLI-0004 | edge gateway heartbeat timeout |
| POLI-0005 | core switch packet loss |
| POLI-0006 | backup restore checksum failure |

**t_observation_governed_by_policy_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| POLI-0001 | duration_seconds | xsd:decimal |
| POLI-0002 | end_time | xsd:dateTime |
| POLI-0003 | exit_code | xsd:integer |
| POLI-0004 | host_name | xsd:string |
| POLI-0005 | log_level | xsd:string |
| POLI-0006 | phase | xsd:string |
| POLI-0007 | retry_count | xsd:integer |
| POLI-0008 | scheduled_at | xsd:dateTime |

**t_observation_governed_by_policy_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0002 | 2023-03-21T06:17:05 |
| POLI-0002 | POLI-0001 | POLI-0008 | 2024-08-23T18:14:17 |
| POLI-0003 | POLI-0001 | POLI-0009 | 2024-06-11T06:45:45 |
| POLI-0004 | POLI-0002 | POLI-0002 | 2023-08-16T19:41:47 |
| POLI-0005 | POLI-0002 | POLI-0008 | 2023-07-01T10:02:32 |
| POLI-0006 | POLI-0002 | POLI-0009 | 2023-11-28T22:50:00 |
| POLI-0007 | POLI-0003 | POLI-0002 | 2025-02-28T14:09:39 |
| POLI-0008 | POLI-0003 | POLI-0008 | 2024-08-01T00:25:22 |

**t_observation_governed_by_policy_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0001 | 2405.99 |
| POLI-0002 | POLI-0002 | POLI-0001 | 5333.00 |
| POLI-0003 | POLI-0003 | POLI-0001 | 2745.86 |
| POLI-0004 | POLI-0004 | POLI-0001 | 5236.87 |
| POLI-0005 | POLI-0005 | POLI-0001 | 6390.38 |
| POLI-0006 | POLI-0006 | POLI-0001 | 4927.03 |

**t_observation_governed_by_policy_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0003 | 46 |
| POLI-0002 | POLI-0001 | POLI-0007 | 468 |
| POLI-0003 | POLI-0002 | POLI-0003 | 386 |
| POLI-0004 | POLI-0002 | POLI-0007 | 493 |
| POLI-0005 | POLI-0003 | POLI-0003 | 146 |
| POLI-0006 | POLI-0003 | POLI-0007 | 163 |
| POLI-0007 | POLI-0004 | POLI-0003 | 133 |
| POLI-0008 | POLI-0004 | POLI-0007 | 341 |

**t_observation_governed_by_policy_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0004 | gw-12 |
| POLI-0002 | POLI-0001 | POLI-0005 | Log Level 02 |
| POLI-0003 | POLI-0001 | POLI-0006 | execution |
| POLI-0004 | POLI-0001 | POLI-0010 | complete |
| POLI-0005 | POLI-0001 | POLI-0011 | Triggered By 05 |
| POLI-0006 | POLI-0002 | POLI-0004 | worker-07 |
| POLI-0007 | POLI-0002 | POLI-0005 | Log Level 07 |
| POLI-0008 | POLI-0002 | POLI-0006 | execution |

Attr and attr_type jointly define the semantic contract of extensible metadata. Attr names the governed facet—effective_date, enforcement, mandatory, priority on eBPF directives; duration_seconds, end_time, exit_code, host_name on policy-bound observations—while attr_type constrains interpretation and routes persistence to the correct physical representation. Typing with XSD-aligned primitives (xsd:date, xsd:string, xsd:boolean, xsd:integer, xsd:decimal, xsd:dateTime) is not decorative: it governs validation, comparison, and aggregation. Effective dates for DIRE-0001 through DIRE-0004 land in a date-valued store as 2024-06-04, 2025-03-23, 2025-01-20, and 2024-06-12 respectively; the mandatory flag for each directive is materialized as misc boolean true or false under attr_id DIRE-0003; priority integers 5, 280, 3, and 996 occupy int-valued tables keyed to attr_id DIRE-0004 and DIRE-0005. Without attr_type, a single misc column would collapse type safety; with it, enforcement logic can treat 2405.99 seconds of north-vent temperature spike duration differently from the string gw-12 or the datetime 2023-03-21T06:17:05 that closes the same observation episode.

Format and namespace extend the contract upstream of instance values, governing how externally sourced or subclassed keys must appear before they enter the governed corpus. Format prescribes lexical or structural shape independent of the XSD storage type: lot_number expects CSV, batch_id and operator_code expect UUID, voltage_read expects E.164 telephony encoding—each paired with describes_property semantics (ambient_temperature, production_batch, equipment_calibration) that clarify the physical or procedural quantity being keyed. Namespace partitions attribute keys into governance versus telemetry scopes so that identically named surface keys do not collide across compliance and operations domains; ATTR-0001 and ATTR-0002 both describe ambient_temperature yet reside under governance, whereas batch and calibration keys under telemetry signal ingestion from plant and instrument channels rather than from policy registries. Practitioners treat namespace as a boundary condition for search, retention, and access control: governance keys participate in directive and audit lineage, telemetry keys in observation and incident correlation.

Misc, finally, is the typed payload—the value column in boolean, date, int, varchar, decimal, and datetime stores—whose meaning is recoverable only through the triple (entity_id, attr_id, attr_type). Misc is deliberately generic at the column level and richly specific at the row level: varchar misc may hold Encoding 01, Enforcement 02, audit excerpt, or locale code en for directive DIRE-0001; for POLI-0001 it may record host gw-12, log level descriptors, execution phase labels, or completion state complete. Integer misc captures exit_code 46 versus 468 and complementary counters on POLI-0007; decimal misc quantifies backpressure and packet-loss episodes at 5333.00 and 2745.86 seconds. The misc role thus completes the attribute lifecycle: attr declares intent, attr_type selects representation, entity_id attaches the fact to a governed program or observation, and misc stores the evidentiary scalar or string that auditors, automations, and downstream analytics consume.

Operationally, these roles interlock across program and policy subgraphs. eBPF programs tracepoint_sched, xdp_fwd, tc_egress, and xdp_fwd inherit directive metadata through shared identifier patterns, while observations—north vent temperature spike, ingestion pipeline backpressure, core switch packet loss, edge gateway heartbeat timeout—inherit parallel attribute registries under POLI identifiers. Cross-walking entity_id and attr_id across typed value tables yields a complete compliance portrait without denormalizing wide tables: one retrieves whether DIRE-0003 is mandatory (true), when DIRE-0002 becomes effective (2025-03-23), and at what priority DIRE-0002 competes for scheduler attention (280), each fact typed and keyed independently yet joinable by identifier discipline. Namespace and format rules on subclassed attrkeys ensure that plant identifiers entering telemetry align with enterprise data-quality expectations before they ever populate misc fields tied to POLI or DIRE entities.

**t_attrkey_subclass**

| id | attrkey | describes_property | format | namespace |
| --- | --- | --- | --- | --- |
| ATTR-0001 | lot_number | ambient_temperature | CSV | governance |
| ATTR-0002 | batch_id | ambient_temperature | UUID | governance |
| ATTR-0003 | operator_code | production_batch | UUID | telemetry |
| ATTR-0004 | voltage_read | equipment_calibration | E.164 | telemetry |
| ATTR-0005 | flow_rate | equipment_calibration | E.164 | governance |
| ATTR-0006 | lot_number | data_integrity_status | CSV | governance |
| ATTR-0007 | ambient_temp | electrical_voltage | JSON | catalog |

**t_ebpf_program_governed_by_directive**

| id | ebpf |
| --- | --- |
| DIRE-0001 | tracepoint_sched |
| DIRE-0002 | xdp_fwd |
| DIRE-0003 | tc_egress |
| DIRE-0004 | xdp_fwd |
| DIRE-0005 | tracepoint_sched |
| DIRE-0006 | tc_egress |

**t_ebpf_program_governed_by_directive_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| DIRE-0001 | effective_date | xsd:date |
| DIRE-0002 | enforcement | xsd:string |
| DIRE-0003 | mandatory | xsd:boolean |
| DIRE-0004 | priority | xsd:integer |
| DIRE-0005 | review_cycle_days | xsd:integer |
| DIRE-0006 | scope | xsd:string |
| DIRE-0007 | encoding | xsd:string |
| DIRE-0008 | label_text | xsd:string |

**t_ebpf_program_governed_by_directive_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0004 | 5 |
| DIRE-0002 | DIRE-0001 | DIRE-0005 | 280 |
| DIRE-0003 | DIRE-0002 | DIRE-0004 | 3 |
| DIRE-0004 | DIRE-0002 | DIRE-0005 | 996 |
| DIRE-0005 | DIRE-0003 | DIRE-0004 | 5 |
| DIRE-0006 | DIRE-0003 | DIRE-0005 | 471 |
| DIRE-0007 | DIRE-0004 | DIRE-0004 | 1 |
| DIRE-0008 | DIRE-0004 | DIRE-0005 | 105 |

The architectural payoff is separation of concerns with preserved evidential density. Identifiers stabilize reference; entities scope ownership; attr and attr_type articulate semantics and storage routing; format and namespace govern ingress shape and domain boundaries; misc carries the auditable fact. Systems that honor this decomposition can add attributes—new attr rows with fresh attr_type bindings—without migrating monolithic entity tables, and can prove, row by row, that a boolean mandatory true on DIRE-0004, a datetime 2024-08-23T18:14:17 on POLI-0002, and an E.164-governed voltage_read key under telemetry namespace each satisfied distinct validation and lineage requirements. That is the practical mechanics of governed metadata: not a flat key-value bag, but a typed, namespaced, identifier-anchored fabric in which every misc value remains interpretable, comparable, and defensible long after the originating event has left the live buffer.