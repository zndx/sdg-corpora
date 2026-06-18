# Collection — topic 195 · 02_observation_measurement

FinePDFs-grounded topic (carried forward from the coverage audit). **13 chapters** · **25 topics** (target + style) · **4 ontology terms** · **4 underlying tables**.

**Topics (many-to-many).** The documents draw on, beyond the anchor topic 195: topic 3, topic 23, topic 32, topic 37, topic 56, topic 62, topic 67, topic 68, topic 75, topic 83, topic 97, topic 100, topic 104, topic 107, topic 113, topic 117, topic 118, topic 135, topic 142, topic 148, topic 163, topic 166, topic 178, topic 187.

> **Topic gist** (representative FinePDFs text): Global Simulation of Noble Gases and Their Binary Mixtures Inaugural-Dissertation zur Erlangung des Doktorgrades der Mathematisch-Naturwissenschaftlichen Fakultät der Universität zu Köln Afshin Eskandari Nasrabad aus Mashad-Iran April 3, 2003 To my mother and to Rozita, for the love and encouragement that you have given me while I was doing my PhD. Berichterstatter: Prof. Dr. U. K. Deiters I... …

## Chapters

- [Chapter 4: Structural Frameworks for Kernel-Level Telemetry and Compliance](chapters/052f31a1f74be202.md)
- [Chapter 4: Ontological Frameworks for Kernel Telemetry and Compliance Monitoring](chapters/096acbd8d1df872f.md)
- [Chapter 7: Metric Emission Protocols and Anomaly Detection Frameworks](chapters/0c494cb79fa6446e.md)
- [Chapter 4: Kernel-Level Observability and Automated Compliance Monitoring](chapters/4a8806ad91452b68.md)
- [Chapter 7: Governance Frameworks for Kernel-Level Observability and Anomaly Detection](chapters/5b68432006321a74.md)
- [Chapter 4: Kernel-Level Observability and Automated Compliance Monitoring](chapters/8f46753d967454f7.md)
- [Chapter 4: Kernel-Level Observability and Anomaly Detection Protocols](chapters/921be55b22e15c1a.md)
- [Chapter 4: Process Subclassing for Metric Emission and Alerting in eBPF Observability](chapters/9b417611734c02c6.md)
- [Chapter 4: Observability and Anomaly Detection Protocols](chapters/a237fa15a15a6360.md)
- [Chapter 4: Ontological Foundations of System Observability and Metric Emission](chapters/ac0eb85a27b066f8.md)
- [Observability Process Classification in eBPF-Based Monitoring Systems](chapters/ce0bde0207ae08f4.md)
- [Chapter 4: Ontological Structures for Observability and Anomaly Detection](chapters/d019b0a93da111b2.md)
- [Chapter 7: Ontological Constraints for Kernel Telemetry and Anomaly Detection](chapters/fae1f49979560def.md)

## Ontology terms grounding this collection

- `alert_triggered_by` — {X} is a process that triggered by metric {Y}
- `ebpf_event_min_one_attribute` — {X} is a process
- `metric_emission_subclass` — {X} is a process that emits metric {Y}
- `outlier_detection_targets_dataset` — {X} is a process that targets artifact

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_alert_triggered_by`](tables/t_alert_triggered_by.sql) — realizes `alert_triggered_by` · _shared with 3 other collection(s)_
- [`t_ebpf_event_min_one_attribute`](tables/t_ebpf_event_min_one_attribute.sql) — realizes `ebpf_event_min_one_attribute` · _shared with 1 other collection(s)_
- [`t_metric_emission_subclass`](tables/t_metric_emission_subclass.sql) — realizes `metric_emission_subclass` · _shared with 3 other collection(s)_
- [`t_outlier_detection_targets_dataset`](tables/t_outlier_detection_targets_dataset.sql) — realizes `outlier_detection_targets_dataset`
