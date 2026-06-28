---
chapter_id: ch_live_measurement_with_precision_730832
topic_id: 186
family: 02_observation_measurement
cited_terms: ['measurement_with_precision', 'counter_metric_subclass', 'control_observed_via']
model: engine-refine
---

Identifiers form the backbone of traceability across the measurement, metric, and control domains, each prefixed to signal its domain: PREC-0001 through PREC-0004 for precision records, METR-0001 through METR-0004 for metric counters, and VIA-0001 through VIA-0004 for control observations. These identifiers are not merely labels; they are the stable addresses that enable cross-referencing between entities that would otherwise exist in isolation. A seismic amplitude measurement identified as PREC-0001 can be unambiguously linked to its precision specification, its associated metric kind, and the controls under which it was produced, all through the shared identifier space. This addressing discipline ensures that every data point carries its own provenance chain.

**t_measurement_with_precision**

| id | measurement |
| --- | --- |
| PREC-0001 | seismic amplitude |
| PREC-0002 | seismic amplitude |
| PREC-0003 | acoustic decibels |
| PREC-0004 | seismic amplitude |
| PREC-0005 | voltage drop |
| PREC-0006 | GPS accuracy |
| PREC-0007 | barometric pressure |
| PREC-0008 | particulate count |

**t_measurement_with_precision_precision**

| id | precision |
| --- | --- |
| PREC-0001 | ±10 ppm |
| PREC-0002 | 1 sigma |
| PREC-0003 | 10 µs |
| PREC-0004 | 0.001 K |
| PREC-0005 | ±0.2% FS |
| PREC-0006 | 0.1 dB |
| PREC-0007 | 32-bit |
| PREC-0008 | 0.001 K |

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

**t_control_observed_via**

| id | control |
| --- | --- |
| VIA-0001 | Quality Gate Checkpoint |
| VIA-0002 | Validation Workflow Definition |
| VIA-0003 | Quality Gate Checkpoint |
| VIA-0004 | Quality Gate Checkpoint |
| VIA-0005 | Reference Monitoring Threshold |
| VIA-0006 | Baseline Calibration Protocol |

**t_control_observed_via_observed_via**

| id | observed_via |
| --- | --- |
| VIA-0001 | Audit Log Aggregator |
| VIA-0002 | Quality Check Pipeline |
| VIA-0003 | Audit Log Aggregator |
| VIA-0004 | Audit Log Aggregator |
| VIA-0005 | Reference Monitor Service |
| VIA-0006 | Trace Collector Daemon |

Metric kinds are classified through a categorical taxonomy that groups them into structured categories such as Metric Kind Category 01 through Metric Kind Category 04, each paired with a human-readable label like Metric Kind Label 01. The fact_counter table anchors individual metric instances to these kinds via the metric_kind_key column, while also recording size_bytes values that quantify the scale of each metric—977102405 bytes for METR-0001, 609833100 for METR-0002, and so on down to 422660739 for METR-0004. Alongside size, the version column tracks the iteration state of each metric, with values ranging from 5 to 12, enabling auditors to determine whether a given measurement reflects the latest specification or a legacy variant. Together, size_bytes and version provide the quantitative metadata necessary for capacity planning, compliance verification, and change management.

**fact_counter**

| id | metric_kind_key | size_bytes | version |
| --- | --- | --- | --- |
| METR-0001 | METR-0005 | 977102405 | 12 |
| METR-0002 | METR-0004 | 609833100 | 8 |
| METR-0003 | METR-0003 | 881633277 | 7 |
| METR-0004 | METR-0003 | 422660739 | 5 |

The precision of measurements is itself a first-class concept, stored in its own dimension table where values such as ±10 ppm, 1 sigma, 10 µs, and 0.001 K represent the uncertainty bounds attached to readings like seismic amplitude and acoustic decibels. Rather than embedding precision directly into the measurement record, the schema uses a junction table—t_measurement_with_precision__precision—to mediate the relationship between a measurement (the subject, referenced by measurement_id) and a precision specification (the target, referenced by precision_id). This same subject-target pattern appears in the control domain, where t_control_observed_via__observed_via links a control such as Quality Gate Checkpoint or Validation Workflow Definition to an observed_via mechanism like Audit Log Aggregator or Quality Check Pipeline. The subject column always identifies the originating entity, while the target column identifies the entity being related to, creating a consistent relational grammar across domains.

Role is the attribute that gives meaning to these subject-target relationships. In the precision junction table, roles include contributor, reviewer, and owner—designations that clarify whether a precision specification was authored, validated, or is accountable for a given measurement. In the control junction table, the role values expand to include observer alongside reviewer and owner, reflecting the different ways in which a control can interact with an observed_via mechanism. A control might be observed by an Audit Log Aggregator in an observer capacity, or it might be reviewed by a Quality Check Pipeline, or owned by a mechanism that enforces it. These role assignments transform simple foreign-key links into governance relationships with accountability, enabling audit trails that answer not just which entities are connected, but in what capacity.

**t_measurement_with_precision__precision**

| id | measurement_id | precision_id | role |
| --- | --- | --- | --- |
| PREC-0001 | PREC-0003 | PREC-0008 | contributor |
| PREC-0002 | PREC-0008 | PREC-0007 | reviewer |
| PREC-0003 | PREC-0004 | PREC-0007 | owner |
| PREC-0004 | PREC-0007 | PREC-0001 | reviewer |
| PREC-0005 | PREC-0005 | PREC-0006 | observer |
| PREC-0006 | PREC-0007 | PREC-0007 | reviewer |
| PREC-0007 | PREC-0001 | PREC-0008 | contributor |
| PREC-0008 | PREC-0008 | PREC-0002 | reviewer |

**t_control_observed_via__observed_via**

| id | control_id | observed_via_id | role |
| --- | --- | --- | --- |
| VIA-0001 | VIA-0001 | VIA-0004 | observer |
| VIA-0002 | VIA-0004 | VIA-0004 | reviewer |
| VIA-0003 | VIA-0006 | VIA-0005 | owner |
| VIA-0004 | VIA-0005 | VIA-0003 | reviewer |
| VIA-0005 | VIA-0005 | VIA-0006 | reviewer |
| VIA-0006 | VIA-0005 | VIA-0002 | owner |
| VIA-0007 | VIA-0003 | VIA-0003 | contributor |
| VIA-0008 | VIA-0004 | VIA-0003 | contributor |