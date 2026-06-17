---
chapter_id: fce843befc6a41d2
topic_id: 34
family: 04_ebpf_kernel
cited_terms: ['ebpf_event_min_one_attribute', 'alert_triggered_by', 'syscall_invoked_by_event', 'ebpfevent_observes_syscall_xref']
model: xai/grok-4.3
---

# Kernel Event Modeling in eBPF-Based Audit Systems

This chapter defines four ontological categories that structure the representation of kernel-level observation processes. The categories are realized as a four-table relational schema in which primary keys identify process instances and foreign keys encode invocation and triggering relations. The schema supports cross-table queries that recover multi-hop dependencies among events, metrics, and designative entities.

## 1 Ontological Grounding

The four categories are derived directly from the supplied OWL axioms. Each category is treated as a subclass of either bfo:0000015 (process) or cco:DesignativeICE (designative information content entity). The relational tables that follow preserve the existential restrictions stated in the axioms while exposing them for set-oriented retrieval.

### 1.1 Base Event Table

Axiom ebpf_event_min_one_attribute states that every instance of the covered class is a process possessing at least one attribute. Table t_ebpf_event_min_one_attribute therefore records the minimal identifying tuple for each such process. Column id is the primary key; column x stores the required attribute value. A reader can join this table to any dependent table on id to retrieve the attribute that satisfies the minimum-cardinality restriction.

```sql
CREATE TABLE t_ebpf_event_min_one_attribute (
  id VARCHAR(255),
  x VARCHAR(255),
  PRIMARY KEY (id)
);
```

| id | x |
|----|---|
| evt-001 | open |
| evt-002 | read |
| evt-003 | write |
| evt-004 | connect |
| evt-005 | execve |

### 1.2 Alert Trigger Relation

Axiom alert_triggered_by asserts that an alert process is triggered by a metric that itself satisfies the base-event restriction. Table t_alert_triggered_by therefore contains a foreign key y that references t_ebpf_event_min_one_attribute.id. Column id remains the primary key of the alert. A two-table join on y recovers, for any alert, both the triggering metric and the attribute required by the first axiom.

```sql
CREATE TABLE t_alert_triggered_by (
  id VARCHAR(255),
  x VARCHAR(255),
  y VARCHAR(255) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (y) REFERENCES t_ebpf_event_min_one_attribute(id)
);
```

| id | x | y |
|----|---|---|
| alt-101 | threshold_exceeded | evt-001 |
| alt-102 | rate_anomaly | evt-002 |
| alt-103 | latency_violation | evt-003 |
| alt-104 | connection_refused | evt-004 |
| alt-105 | binary_mismatch | evt-005 |

### 1.3 Syscall Invocation Relation

Axiom syscall_invoked_by_event states that a designative information content entity is invoked by an event that satisfies the base-event restriction. Table t_syscall_invoked_by_event therefore stores a foreign key y that again references t_ebpf_event_min_one_attribute.id. Column id is the primary key of the designative entity. Joining on y yields the event that performed the invocation together with its mandatory attribute.

```sql
CREATE TABLE t_syscall_invoked_by_event (
  id VARCHAR(255),
  x VARCHAR(255),
  y VARCHAR(255) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (y) REFERENCES t_ebpf_event_min_one_attribute(id)
);
```

| id | x | y |
|----|---|---|
| sys-201 | sys_open | evt-001 |
| sys-202 | sys_read | evt-002 |
| sys-203 | sys_write | evt-003 |
| sys-204 | sys_connect | evt-004 |
| sys-205 | sys_execve | evt-005 |

### 1.4 Observation Cross-Reference Table

Axiom ebpfevent_observes_syscall_xref asserts that an event process observes a syscall designative entity. Table t_ebpfevent_observes_syscall_xref records each such observation. Column id is the primary key; column x stores the identifier of the observed designative entity. Although no foreign key is declared, x values are drawn from the id column of t_syscall_invoked_by_event, permitting an equi-join that traverses event, metric, and designative layers.

```sql
CREATE TABLE t_ebpfevent_observes_syscall_xref (
  id VARCHAR(255),
  x VARCHAR(255),
  PRIMARY KEY (id)
);
```

| id | x |
|----|---|
| xref-301 | sys-201 |
| xref-302 | sys-202 |
| xref-303 | sys-203 |
| xref-304 | sys-204 |
| xref-305 | sys-205 |

## 2 Cross-Join Demonstration

Consider the multi-hop question: “Which alert was triggered by the metric whose attribute is ‘open’ and which syscall designative entity did the corresponding observation record?” The query path traverses three tables:

1. Select from t_ebpf_event_min_one_attribute where x = 'open' → evt-001.
2. Join t_alert_triggered_by on y = evt-001 → alt-101.
3. Join t_ebpfevent_observes_syscall_xref on x = 'sys-201' (obtained via t_syscall_invoked_by_event.y = evt-001).

The resulting joined row is:

alt-101 | evt-001 | open | sys-201

All values are obtained solely by following declared primary-key and foreign-key links; no additional predicates are required.

```json
{"tables": [{"name": "t_ebpf_event_min_one_attribute", "rows": [["evt-001", "open"], ["evt-002", "read"], ["evt-003", "write"], ["evt-004", "connect"], ["evt-005", "execve"]]}, {"name": "t_alert_triggered_by", "rows": [["alt-101", "threshold_exceeded", "evt-001"], ["alt-102", "rate_anomaly", "evt-002"], ["alt-103", "latency_violation", "evt-003"], ["alt-104", "connection_refused", "evt-004"], ["alt-105", "binary_mismatch", "evt-005"]]}, {"name": "t_syscall_invoked_by_event", "rows": [["sys-201", "sys_open", "evt-001"], ["sys-202", "sys_read", "evt-002"], ["sys-203", "sys_write", "evt-003"], ["sys-204", "sys_connect", "evt-004"], ["sys-205", "sys_execve", "evt-005"]]}, {"name": "t_ebpfevent_observes_syscall_xref", "rows": [["xref-301", "sys-201"], ["xref-302", "sys-202"], ["xref-303", "sys-203"], ["xref-304", "sys-204"], ["xref-305", "sys-205"]]}]}
```