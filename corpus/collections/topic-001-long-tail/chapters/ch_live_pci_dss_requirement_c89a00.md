---
chapter_id: ch_live_pci_dss_requirement_c89a00
topic_id: 1
family: 07_long_tail
cited_terms: ['pci_dss_requirement', 'ringbuf_map_subclass', 'ebpfprogram_basic']
model: engine-refine
---

Operational governance and regulatory compliance depend upon a rigorous taxonomy of identifiers, version controls, and resource footprints that anchor every asset to its authoritative baseline. Within this framework, each entity receives a unique identifier—such as REQU-0001 for a PCI DSS control or EBPF-0001 for a runtime program—that serves as the immutable reference point for audit trails and change management. These identifiers are paired with version metadata to track regulatory drift and software evolution; a requirement tagged to PCI DSS v3.2 must be distinguished from its v1.1 or v4.0 counterparts, just as an ebpfprogram at version 12 requires separate lifecycle management from its version 9 or 11 predecessors. Without this disciplined versioning, compliance mapping fractures, and operational telemetry loses its temporal context.

**t_pci_dss_requirement**

| id | pci |
| --- | --- |
| REQU-0001 | PCI DSS v3.2 |
| REQU-0002 | PCI DSS v1.1 |
| REQU-0003 | PCI DSS v1.1 |
| REQU-0004 | PCI DSS v4.0 |
| REQU-0005 | PCI DSS v3.0 |
| REQU-0006 | PCI DSS v2.0 |

**t_pci_dss_requirement_pci_dss_requirement**

| id | pci_dss_requirement |
| --- | --- |
| REQU-0001 | Requirement 10.6 |
| REQU-0002 | Requirement 2.1 |
| REQU-0003 | Requirement 1.2 |
| REQU-0004 | Requirement 3.4 |
| REQU-0005 | Requirement 6.5 |
| REQU-0006 | Requirement 11.4 |

**t_ringbuf_map_subclass**

| id | ringbuf |
| --- | --- |
| MAP-0001 | metrics capture ring |
| MAP-0002 | diagnostic trace buffer |
| MAP-0003 | audit log ring |
| MAP-0004 | sensor stream buffer |
| MAP-0005 | diagnostic trace buffer |
| MAP-0006 | event queue ring |
| MAP-0007 | telemetry fifo ring |

Classification and quantification follow immediately, ensuring that every tracked asset is both semantically grouped and capacity-planned. The category field assigns each program or buffer to a functional domain, separating Ebpfprogram Category 01 from Category 04, while the misc column supplies operational labels like Ebpfprogram Label 01 that bridge technical metadata with human-readable inventory systems. Resource consumption is captured through size_bytes, a critical metric for infrastructure provisioning and memory budgeting; an eBPF program consuming 784,335,640 bytes demands entirely different allocation strategies than one registering 113,209,263 bytes. Together, these attributes transform raw identifiers into actionable inventory records that feed directly into capacity forecasting and regulatory scoping.

**fact_ebpfprogram**

| id | ebpfprogram_key | size_bytes | version |
| --- | --- | --- | --- |
| EBPF-0001 | EBPF-0001 | 784335640 | 12 |
| EBPF-0002 | EBPF-0003 | 641704069 | 9 |
| EBPF-0003 | EBPF-0003 | 113209263 | 11 |
| EBPF-0004 | EBPF-0005 | 161013093 | 12 |
| EBPF-0005 | EBPF-0004 | 352203820 | 12 |
| EBPF-0006 | EBPF-0003 | 167519051 | 1 |

**dim_ebpfprogram**

| id | ebpfprogram_label | ebpfprogram_category |
| --- | --- | --- |
| EBPF-0001 | Ebpfprogram Label 01 | Ebpfprogram Category 01 |
| EBPF-0002 | Ebpfprogram Label 02 | Ebpfprogram Category 02 |
| EBPF-0003 | Ebpfprogram Label 03 | Ebpfprogram Category 03 |
| EBPF-0004 | Ebpfprogram Label 04 | Ebpfprogram Category 04 |
| EBPF-0005 | Ebpfprogram Label 05 | Ebpfprogram Category 05 |
| EBPF-0006 | Ebpfprogram Label 06 | Ebpfprogram Category 06 |
| EBPF-0007 | Ebpfprogram Label 07 | Ebpfprogram Category 07 |
| EBPF-0008 | Ebpfprogram Label 08 | Ebpfprogram Category 08 |

Dependency resolution and accountability are enforced through a subject-target-role relationship model that governs how components interact across compliance controls, buffer configurations, and program deployments. The subject column designates the originating entity, while the target column identifies the dependent or referenced asset, and the role column dictates the nature of the linkage—whether contributor, observer, reviewer, or owner. For instance, REQU-0001 may function as the owner of REQU-0005 in a compliance dependency chain, whereas MAP-0001 operates as an observer of MAP-0006 in a ring buffer configuration matrix. This tripartite structure ensures that every modification, audit, or configuration drift can be traced to a specific actor and a precise dependency path, eliminating ambiguity during incident response or regulatory examination.

**t_pci_dss_requirement__pci_dss_requirement**

| id | pci_id | pci_dss_requirement_id | role |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0004 | REQU-0002 | contributor |
| REQU-0002 | REQU-0005 | REQU-0005 | observer |
| REQU-0003 | REQU-0001 | REQU-0005 | owner |
| REQU-0004 | REQU-0002 | REQU-0005 | observer |
| REQU-0005 | REQU-0003 | REQU-0004 | owner |
| REQU-0006 | REQU-0003 | REQU-0002 | owner |
| REQU-0007 | REQU-0006 | REQU-0003 | owner |
| REQU-0008 | REQU-0006 | REQU-0002 | owner |

**t_ringbuf_map_subclass__ring_buffer_config**

| id | ringbuf_id | ring_buffer_config_id | role |
| --- | --- | --- | --- |
| MAP-0001 | MAP-0001 | MAP-0006 | observer |
| MAP-0002 | MAP-0003 | MAP-0004 | reviewer |
| MAP-0003 | MAP-0005 | MAP-0004 | contributor |
| MAP-0004 | MAP-0001 | MAP-0007 | owner |
| MAP-0005 | MAP-0002 | MAP-0006 | contributor |
| MAP-0006 | MAP-0006 | MAP-0003 | contributor |
| MAP-0007 | MAP-0005 | MAP-0002 | owner |
| MAP-0008 | MAP-0002 | MAP-0003 | owner |

The cumulative effect of this relational architecture is a governance layer that maintains integrity across heterogeneous systems without sacrificing operational agility. By standardizing how identifiers, versions, classifications, and dependency roles are recorded, organizations can automate compliance validation, enforce configuration baselines, and isolate fault domains with mathematical precision. When a ring buffer shifts from sync mode spec to compression profile, or when a PCI DSS requirement transitions from observer to contributor status, the underlying schema captures the shift without disrupting the broader control environment. Such structural discipline is not merely administrative; it is the operational substrate that allows modern enterprises to scale compliance, optimize resource allocation, and maintain verifiable accountability across every layer of the technology stack.

**t_ringbuf_map_subclass_ring_buffer_config**

| id | ring_buffer_config |
| --- | --- |
| MAP-0001 | sync mode spec |
| MAP-0002 | sync mode spec |
| MAP-0003 | compression profile |
| MAP-0004 | buffer depth spec |
| MAP-0005 | compression profile |
| MAP-0006 | sample rate config |
| MAP-0007 | overflow handling spec |
| MAP-0008 | compression profile |