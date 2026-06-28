---
chapter_id: ch_live_artifact_with_role_570f9f
topic_id: 7
family: 01_foundation
cited_terms: ['artifact_with_role', 'ebpf_event_observed_pid', 'designative_subclass_basic']
model: engine-refine
---

In data governance frameworks, the integrity and traceability of digital artifacts depend upon a layered system of identifiers, checksums, and size metrics that collectively establish an auditable chain of custody. Each artifact—whether designated as patient-cohorts-2023 or feature-store-cache—receives a unique identifier such as ROLE-0001 or ROLE-0003, which serves as the canonical reference point across all downstream operations. The integrity of these artifacts is verified through checksum values like 5e8f3c91 and a3f9c21e, computed at ingestion and re-validated at each transformation stage to detect corruption or unauthorized modification. Storage allocation is tracked through size_bytes fields, where patient-cohorts-2023 occupies 666903238 bytes in its source-dataset role and 309925726 bytes as a transform-stage intermediate, while feature-store-cache registers 29914871 bytes as an output-sink and 347040623 bytes in its archival-copy capacity. These three dimensions—identity, integrity, and volume—form the foundational triad of artifact provenance.

**t_artifact_with_role**

| id | artifact | role | checksum | size_bytes |
| --- | --- | --- | --- | --- |
| ROLE-0001 | patient-cohorts-2023 | source-dataset | 5e8f3c91 | 666903238 |
| ROLE-0002 | patient-cohorts-2023 | transform-stage | 7b14de08 | 309925726 |
| ROLE-0003 | feature-store-cache | output-sink | a3f9c21e | 29914871 |
| ROLE-0004 | feature-store-cache | archival-copy | 9d2b7a16 | 347040623 |

Process observation extends this provenance model into runtime behavior through eBPF-based event tracking, where kernel-level probes capture syscall_trace, disk_io_tracker, and tcp_connect_probe activities. Each event is assigned an identifier such as PID-0001 through PID-0004, and the system records which process each event observes: PID-0001, PID-0002, and PID-0004 all monitor process 11024, while PID-0003 targets process 7743. The relationship between observer and observed is formalized through a junction table that maps ebpf_id as the subject to observes_pid_id as the target, with an additional role column that classifies the nature of the relationship. A single eBPF event may assume multiple relational positions—PID-0002 appears as the subject in two distinct observations, targeting PID-0006 as a contributor and PID-0002 as a reviewer—demonstrating that observational roles are not mutually exclusive but rather compositional.

**t_ebpf_event_observed_pid**

| id | ebpf |
| --- | --- |
| PID-0001 | syscall_trace |
| PID-0002 | disk_io_tracker |
| PID-0003 | tcp_connect_probe |
| PID-0004 | disk_io_tracker |
| PID-0005 | cpu_profile_sampler |
| PID-0006 | disk_io_tracker |

**t_ebpf_event_observed_pid_observes_pid**

| id | observes_pid |
| --- | --- |
| PID-0001 | 11024 |
| PID-0002 | 11024 |
| PID-0003 | 7743 |
| PID-0004 | 11024 |
| PID-0005 | 8891 |
| PID-0006 | 11024 |

**t_ebpf_event_observed_pid__observes_pid**

| id | ebpf_id | observes_pid_id | role |
| --- | --- | --- | --- |
| PID-0001 | PID-0002 | PID-0006 | contributor |
| PID-0002 | PID-0004 | PID-0004 | observer |
| PID-0003 | PID-0003 | PID-0002 | owner |
| PID-0004 | PID-0002 | PID-0002 | reviewer |
| PID-0005 | PID-0005 | PID-0004 | contributor |
| PID-0006 | PID-0005 | PID-0001 | contributor |
| PID-0007 | PID-0006 | PID-0005 | owner |
| PID-0008 | PID-0006 | PID-0002 | contributor |

The role taxonomy itself operates at two levels of granularity. At the artifact level, roles such as source-dataset, transform-stage, output-sink, and archival-copy describe the functional position of a data asset within a pipeline. At the process-observation level, roles like contributor, observer, owner, and reviewer characterize the relational stance between an eBPF event and the process it monitors. This dual taxonomy ensures that both static data assets and dynamic runtime behaviors are classified within a consistent semantic framework, enabling policy enforcement and audit queries that span the full spectrum from file-level integrity to kernel-level process behavior.

Classification and localization of designative elements introduce additional metadata dimensions through the designative_subclass_basic construct. Each designative—such as event_tag_crash, plate_A04, or barcode_8842X—is assigned a classification code (D-33, B-12, E-21) and a language designation (fr, es) that determines the linguistic context for downstream consumption. The repetition of event_tag_crash under both fr and es designations, paired with codes D-33 and B-12 respectively, illustrates that the same designative concept may carry distinct classification codes depending on its language variant, a pattern that necessitates language-aware resolution logic in any system that consumes these designations.

**t_designative_subclass_basic**

| id | designative | code | language |
| --- | --- | --- | --- |
| DESI-0001 | event_tag_crash | D-33 | fr |
| DESI-0002 | plate_A04 | B-12 | es |
| DESI-0003 | barcode_8842X | E-21 | fr |
| DESI-0004 | event_tag_crash | D-33 | es |
| DESI-0005 | reagent_Lot_B22 | B-12 | es |
| DESI-0006 | registry_ISO9001 | C-07 | fr |
| DESI-0007 | event_tag_crash | A-01 | es |