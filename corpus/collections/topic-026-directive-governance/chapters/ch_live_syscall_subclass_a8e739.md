---
chapter_id: ch_live_syscall_subclass_a8e739
topic_id: 26
family: 04_ebpf_kernel
cited_terms: ['syscall_subclass', 'counter_metric_subclass', 'subclass_not_basic']
model: engine-refine
---

In syscall observability and compliance telemetry, stable identifiers anchor every auditable fact to a governed entity that outlives label changes, dashboard renames, and schema revisions. An identifier such as `SYSC-0004` or `METR-0003` is not merely a row key; it is the contract by which ingestion pipelines, retention policies, and cross-system joins remain deterministic when human-readable text drifts. Governance frameworks treat identifiers as immutable once issued, which is why fact records reference foreign keys like `in_syscall_subsystem_key` rather than embedding display strings directly. When `SYSC-0004` records 382 events while `SYSC-0002` records only 52, analysts can attribute the disparity to subsystem behavior—not to ambiguous naming—because each count resolves through a single canonical key to exactly one dimension member.

**fact_syscall**

| id | in_syscall_subsystem_key | event_count |
| --- | --- | --- |
| SYSC-0001 | SYSC-0004 | 238 |
| SYSC-0002 | SYSC-0002 | 52 |
| SYSC-0003 | SYSC-0003 | 198 |
| SYSC-0004 | SYSC-0005 | 382 |
| SYSC-0005 | SYSC-0002 | 283 |
| SYSC-0006 | SYSC-0001 | 288 |

The *in syscall subsystem* dimension classifies where kernel-interface activity originates within the monitored estate. Subsystems are the operational unit at which policy is applied: rate limits, anomaly thresholds, forensic sampling, and escalation paths are typically scoped to subsystem category rather than to individual syscalls. A dimension member carries both a governed category—`In Syscall Subsystem Category 04` for `SYSC-0004`—and a misc field, here `in_syscall_subsystem_label`, that supplies the operator-facing name (`In Syscall Subsystem Label 04`) without polluting the analytic grain. Category is the compliance-relevant axis: it groups subsystems for control objectives, segregation of duties, and reporting rollups, while misc labels exist for runbooks, tickets, and executive summaries. The separation matters in practice because relabeling `In Syscall Subsystem Label 02` for clarity does not force a recategorization or invalidate historical `event_count` series tied to `SYSC-0002`.

*Event count* is the primary volume metric on the syscall fact grain: a non-negative integer representing how many observed events accumulated for a given fact identifier within the reporting window. Unlike dimensional attributes, event count is additive and comparable across time buckets when the grain is held constant. The spread in the evidence—238, 52, 198, and 382 events across four syscall facts—illustrates why governance distinguishes *magnitude* from *classification*: two records may share a subsystem lineage yet diverge sharply in volume, signaling hot paths, retry storms, or policy bypass attempts rather than taxonomy errors. Compliance use cases lean on event count for baseline establishment, threshold alerting, and demonstrable due diligence; auditors expect counts to reconcile to raw logs through reproducible aggregation rules keyed on identifier, not on misc text.

Counter facts extend the same identifier discipline to storage- and lifecycle-oriented metrics, pairing each `METR-*` record with a *metric kind* dimension that defines what is being measured. Metric kind plays a role analogous to in-syscall subsystem category: `METR-0003` and `METR-0004` map to `Metric Kind Category 03` and `Metric Kind Category 04` respectively, while misc labels such as `Metric Kind Label 03` describe the counter in operational language. On the fact side, *size_bytes* quantifies footprint—values on the order of 977,102,405 and 422,660,739 bytes show that counters are not abstract counters but concrete allocations whose growth bears on capacity planning, cost attribution, and data-minimization obligations. *Version* captures schema or materialization generation: versions 12, 8, 7, and 5 on four metric facts imply heterogeneous rollout states, backward-compatible reads, or staged migrations that compliance reviews must track when proving continuity of measurement across upgrades.

**dim_in_syscall_subsystem**

| id | in_syscall_subsystem_label | in_syscall_subsystem_category |
| --- | --- | --- |
| SYSC-0001 | In Syscall Subsystem Label 01 | In Syscall Subsystem Category 01 |
| SYSC-0002 | In Syscall Subsystem Label 02 | In Syscall Subsystem Category 02 |
| SYSC-0003 | In Syscall Subsystem Label 03 | In Syscall Subsystem Category 03 |
| SYSC-0004 | In Syscall Subsystem Label 04 | In Syscall Subsystem Category 04 |
| SYSC-0005 | In Syscall Subsystem Label 05 | In Syscall Subsystem Category 05 |
| SYSC-0006 | In Syscall Subsystem Label 06 | In Syscall Subsystem Category 06 |

**fact_counter**

| id | metric_kind_key | size_bytes | version |
| --- | --- | --- | --- |
| METR-0001 | METR-0005 | 977102405 | 12 |
| METR-0002 | METR-0004 | 609833100 | 8 |
| METR-0003 | METR-0003 | 881633277 | 7 |
| METR-0004 | METR-0003 | 422660739 | 5 |

**dim_metric_kind**

| id | metric_kind_label | metric_kind_category |
| --- | --- | --- |
| METR-0001 | Metric Kind Label 01 | Metric Kind Category 01 |
| METR-0002 | Metric Kind Label 02 | Metric Kind Category 02 |
| METR-0003 | Metric Kind Label 03 | Metric Kind Category 03 |
| METR-0004 | Metric Kind Label 04 | Metric Kind Category 04 |
| METR-0005 | Metric Kind Label 05 | Metric Kind Category 05 |
| METR-0006 | Metric Kind Label 06 | Metric Kind Category 06 |
| METR-0007 | Metric Kind Label 07 | Metric Kind Category 07 |

Misc fields—labels, annotations, and other non-key descriptors—are deliberately subordinate to category and identifier in the control model. They reduce friction for humans without becoming join keys or policy triggers, which prevents well-intentioned renaming from breaking lineage. In mature operations, misc is validated against controlled vocabularies but permitted to vary by locale or product line; category and metric kind remain the enforcement surface. Subclass or auxiliary entity tables that carry parallel descriptive columns reinforce the pattern: even when additional attributes exist outside the core basic dimensions, governance still routes authoritative joins through `id` keys, keeping extended descriptors optional rather than structural.

**t_subclass_not_basic**

| id | not | not_2 |
| --- | --- | --- |
| NOT-0001 | Not 01 | Not 2 01 |
| NOT-0002 | Not 02 | Not 2 02 |
| NOT-0003 | Not 03 | Not 2 03 |
| NOT-0004 | Not 04 | Not 2 04 |
| NOT-0005 | Not 05 | Not 2 05 |
| NOT-0006 | Not 06 | Not 2 06 |

Taken together, these elements implement a star-shaped observability contract suitable for handbook-level reference. Identifiers stabilize identity; in-syscall subsystem and metric kind supply categorical context; event count and size_bytes supply measurable evidence; version records temporal evolution of metric definitions; misc humanizes without compromising analytic integrity. Practitioners should treat mismatches—such as a syscall fact pointing at `SYSC-0005` while dimension tables only govern `SYSC-0001` through `SYSC-0004`—as data-quality defects with compliance impact, because unresolved keys silently orphan events from category rollups and undermine the very traceability the framework is designed to guarantee.