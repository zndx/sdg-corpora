---
chapter_id: ch_live_lift_with_baseline_rate_f9f957
topic_id: 5
family: 02_observation_measurement
cited_terms: ['lift_with_baseline_rate', 'ebpfmap_pinned_at_path', 'control_implements']
model: engine-refine
---

Governance frameworks and operational registries depend upon a disciplined separation between the identity of a record and the properties that describe it. Every entity in the system carries a stable identifier—`RATE-0001`, `PATH-0003`, `IMPL-0002`—that anchors it across all related tables and survives the movement of its attributes into normalized value stores. The identifier is the sole key; it does not encode meaning, it enables joins. A lift metric such as `Conversion Gain` or `Latency Peak Reduction` is distinguished from a control implementation like `Change Advisory Board` or `Database Audit Trails` not by shared naming conventions but by the prefix and the table in which the identifier lives. This convention—`RATE-` for rate measurements, `PATH-` for pinned eBPF map references, `IMPL-` for control implementations—provides an immediate, human-readable signal about the entity's domain without sacrificing referential integrity.

**t_lift_with_baseline_rate**

| id | lift | baseline_rate |
| --- | --- | --- |
| RATE-0001 | Conversion Gain | PATH-0005 |
| RATE-0002 | Latency Peak Reduction | PATH-0006 |
| RATE-0003 | Click Through Uplift | PATH-0004 |
| RATE-0004 | Model v2 Accuracy Lift | PATH-0003 |
| RATE-0005 | Latency Peak Reduction | PATH-0001 |
| RATE-0006 | Ad Improvement | PATH-0006 |

**t_lift_with_baseline_rate_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RATE-0001 | RATE-0001 | RATE-0004 | 2024-01-14T18:32:00 |
| RATE-0002 | RATE-0002 | RATE-0004 | 2023-02-02T03:32:58 |
| RATE-0003 | RATE-0003 | RATE-0004 | 2024-08-11T22:28:18 |
| RATE-0004 | RATE-0004 | RATE-0004 | 2024-10-19T09:19:40 |
| RATE-0005 | RATE-0005 | RATE-0004 | 2023-07-24T08:45:17 |
| RATE-0006 | RATE-0006 | RATE-0004 | 2025-03-24T11:20:59 |

**t_lift_with_baseline_rate_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RATE-0001 | RATE-0001 | RATE-0001 | 0.799 |
| RATE-0002 | RATE-0001 | RATE-0005 | 559.38 |
| RATE-0003 | RATE-0001 | RATE-0007 | 634.64 |
| RATE-0004 | RATE-0002 | RATE-0001 | 0.522 |
| RATE-0005 | RATE-0002 | RATE-0005 | 254.23 |
| RATE-0006 | RATE-0002 | RATE-0007 | 594.57 |
| RATE-0007 | RATE-0003 | RATE-0001 | 0.290 |
| RATE-0008 | RATE-0003 | RATE-0005 | 361.02 |

**t_lift_with_baseline_rate_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RATE-0001 | RATE-0001 | RATE-0002 | Dimension Kind 01 |
| RATE-0002 | RATE-0001 | RATE-0008 | Encoding 02 |
| RATE-0003 | RATE-0001 | RATE-0009 | pre-release note |
| RATE-0004 | RATE-0001 | RATE-0010 | de |
| RATE-0005 | RATE-0001 | RATE-0003 | automated |
| RATE-0006 | RATE-0001 | RATE-0006 | ratio |
| RATE-0007 | RATE-0002 | RATE-0002 | Dimension Kind 07 |
| RATE-0008 | RATE-0002 | RATE-0008 | Encoding 08 |

**t_ebpfmap_pinned_at_path**

| id | ebpfmap | pinned_at_path | owner | tags |
| --- | --- | --- | --- | --- |
| PATH-0001 | sock_hash | RATE-0001 | sre | pii |
| PATH-0002 | cpumap | RATE-0005 | data-engineering | pii |
| PATH-0003 | conntrack_map | RATE-0002 | data-engineering | internal |
| PATH-0004 | flow_table | RATE-0004 | sre | verified |
| PATH-0005 | sock_hash | RATE-0006 | sre | internal |
| PATH-0006 | lru_percpu_hash | RATE-0003 | platform-team | verified |

Attributes and their types form the schema layer that sits above raw values. The attribute definition table declares what can be measured or recorded: `confidence`, `dimension_kind`, `method`, `recorded_at`. Each attribute is bound to an XSD type—`xsd:decimal`, `xsd:string`, `xsd:dateTime`—which determines which value table receives the data. A decimal attribute such as `confidence` flows into `t_lift_with_baseline_rate_val_decimal`, where its value might be `0.799` or `559.38`. A string attribute like `dimension_kind` lands in the varchar store, carrying values such as `Dimension Kind 01` or `Encoding 02`. A datetime attribute, `recorded_at`, is written to the datetime table with timestamps like `2024-01-14T18:32:00` or `2023-02-02T03:32:58`. The type-driven routing ensures that queries against value tables are always type-safe and that the schema evolves without requiring DDL changes to the value stores themselves.

**t_lift_with_baseline_rate_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| RATE-0001 | confidence | xsd:decimal |
| RATE-0002 | dimension_kind | xsd:string |
| RATE-0003 | method | xsd:string |
| RATE-0004 | recorded_at | xsd:dateTime |
| RATE-0005 | uncertainty | xsd:decimal |
| RATE-0006 | unit | xsd:string |
| RATE-0007 | value | xsd:decimal |
| RATE-0008 | encoding | xsd:string |

The entity column in each value table—`entity_id`—ties a specific attribute value back to the record it describes. An entity such as `RATE-0001` may accumulate multiple attribute values across different stores: a decimal of `0.799` for one attribute, a string like `pre-release note` for another, and a datetime stamp for a third. This EAV (entity-attribute-value) pattern sacrifices join simplicity for schema flexibility, allowing the system to attach arbitrary metadata to any entity without predefining columns. The trade-off is real—queries must pivot across three value tables to reconstruct a complete entity profile—but the gain is that new attributes can be introduced by inserting a single row into the attribute definition table, with no migration required.

Ownership and tagging provide the operational overlay that turns raw data into accountable assets. The eBPF map registry assigns an `owner` to each pinned map: `sre` teams manage `sock_hash` and `flow_table` instances, while `data-engineering` owns `cpumap` and `conntrack_map`. Tags such as `pii`, `internal`, and `verified` attach classification metadata that drives downstream policy—data handling rules, access controls, retention schedules. An owner is a single string, a team or role designation; a tag is a label that can be queried in combination with other tags to produce filtered views of the registry. Together, they answer the operational questions of who is responsible and what constraints apply.

Priority and scope govern the implementation of controls within a compliance framework. The control implementation table records which technical artifact satisfies which governance requirement—`Automated Backup Scripts` implements `Change Advisory Board`, `Database Audit Trails` implements `Access Review Cycle`—and assigns a `priority` level from 1 to 5 and a `scope` of `team`, `regional`, or `global`. A control with priority `1` and `team` scope, such as the implementation of `Access Review Cycle` via `Database Audit Trails`, signals a high-urgency, narrowly scoped obligation. A control with priority `3` and `global` scope, like the `Data Retention Schedule` implemented through `Automated Backup Scripts`, indicates a medium-priority requirement that spans the entire organization. These two dimensions—priority and scope—allow compliance officers to triage remediation efforts and allocate resources proportionally to risk.

**t_control_implements**

| id | control | implements | priority | scope |
| --- | --- | --- | --- | --- |
| IMPL-0001 | Change Advisory Board | Automated Backup Scripts | 5 | regional |
| IMPL-0002 | Data Retention Schedule | Automated Backup Scripts | 3 | global |
| IMPL-0003 | Access Review Cycle | Database Audit Trails | 1 | team |
| IMPL-0004 | Data Retention Schedule | Patch Deployment Pipeline | 3 | team |
| IMPL-0005 | GDPR Data Minimization | Container Image Scanning | 1 | global |
| IMPL-0006 | Incident Response Protocol | Network Firewall Rules | 1 | global |
| IMPL-0007 | NIST SP 800-53 | Container Image Scanning | 2 | local |