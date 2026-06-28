---
chapter_id: ch_live_belief_interval_subclass_86f7f0
topic_id: 23
family: 06_belief_structure
cited_terms: ['belief_interval_subclass', 'lineage_edge_basic', 'ebpfmap_pinned_at_path']
model: engine-refine
---

The governance of data provenance and attribute management rests on a disciplined separation between entity definitions, their typed properties, and the values those properties assume at a given point in time. Entities—whether they represent belief intervals such as *Sensor calibration drift* or *Model convergence state*, lineage edges like *Financial Reconciliation Trace* and *Supply Chain Audit Trail*, or eBPF maps including *sock_hash*, *cpumap*, *conntrack_map*, and *flow_table*—are each assigned a stable identifier that anchors all downstream references. The belief interval subclass table captures the semantic content of probabilistic assessments, while the lineage edge basic table records the structural relationships through which data flows across systems. These identifiers, ranging from the INTE-0001 series through EDGE-0001 and PATH-0001, serve as the immutable keys that permit cross-referencing without ambiguity, ensuring that every attribute value, every relationship, and every ownership claim can be traced back to its source entity with deterministic precision.

**t_belief_interval_subclass**

| id | belief |
| --- | --- |
| INTE-0001 | Sensor calibration drift |
| INTE-0002 | Model convergence state |
| INTE-0003 | Model convergence state |
| INTE-0004 | Sensor calibration drift |
| INTE-0005 | Data ingestion rate |
| INTE-0006 | Reagent shelf life |

**t_belief_interval_subclass_belief_lower_bound**

| id | belief_lower_bound |
| --- | --- |
| INTE-0001 | 0.85 probability |
| INTE-0002 | Three sigma limit |
| INTE-0003 | ISO ninety eight |
| INTE-0004 | 95 percent threshold |
| INTE-0005 | 99.9 percent uptime |
| INTE-0006 | 0.85 probability |
| INTE-0007 | 128 megabytes |
| INTE-0008 | 256 units |

**t_lineage_edge_basic**

| id | lineage |
| --- | --- |
| EDGE-0001 | Financial Reconciliation Trace |
| EDGE-0002 | Compliance Verification Path |
| EDGE-0003 | Data Lake Ingestion Chain |
| EDGE-0004 | Supply Chain Audit Trail |
| EDGE-0005 | Sensor Calibration Pipeline |
| EDGE-0006 | Supply Chain Audit Trail |
| EDGE-0007 | Document Revision History |
| EDGE-0008 | Genomic Variant Processing |

**t_lineage_edge_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| EDGE-0001 | confidence | xsd:decimal |
| EDGE-0002 | dimension_kind | xsd:string |
| EDGE-0003 | method | xsd:string |
| EDGE-0004 | recorded_at | xsd:dateTime |
| EDGE-0005 | uncertainty | xsd:decimal |
| EDGE-0006 | unit | xsd:string |
| EDGE-0007 | value | xsd:decimal |
| EDGE-0008 | encoding | xsd:string |

**t_lineage_edge_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EDGE-0001 | EDGE-0001 | EDGE-0004 | 2023-06-18T00:21:12 |
| EDGE-0002 | EDGE-0002 | EDGE-0004 | 2023-11-20T00:15:50 |
| EDGE-0003 | EDGE-0003 | EDGE-0004 | 2023-03-09T06:34:54 |
| EDGE-0004 | EDGE-0004 | EDGE-0004 | 2023-04-04T09:21:45 |
| EDGE-0005 | EDGE-0005 | EDGE-0004 | 2025-02-06T04:35:19 |
| EDGE-0006 | EDGE-0006 | EDGE-0004 | 2023-09-20T23:51:28 |
| EDGE-0007 | EDGE-0007 | EDGE-0004 | 2023-03-25T22:49:39 |
| EDGE-0008 | EDGE-0008 | EDGE-0004 | 2025-02-12T13:04:31 |

**t_lineage_edge_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EDGE-0001 | EDGE-0001 | EDGE-0001 | 0.947 |
| EDGE-0002 | EDGE-0001 | EDGE-0005 | 637.72 |
| EDGE-0003 | EDGE-0001 | EDGE-0007 | 513.28 |
| EDGE-0004 | EDGE-0002 | EDGE-0001 | 0.497 |
| EDGE-0005 | EDGE-0002 | EDGE-0005 | 852.97 |
| EDGE-0006 | EDGE-0002 | EDGE-0007 | 198.62 |
| EDGE-0007 | EDGE-0003 | EDGE-0001 | 0.290 |
| EDGE-0008 | EDGE-0003 | EDGE-0005 | 468.80 |

**t_lineage_edge_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EDGE-0001 | EDGE-0001 | EDGE-0002 | Dimension Kind 01 |
| EDGE-0002 | EDGE-0001 | EDGE-0008 | Encoding 02 |
| EDGE-0003 | EDGE-0001 | EDGE-0009 | change rationale |
| EDGE-0004 | EDGE-0001 | EDGE-0010 | de |
| EDGE-0005 | EDGE-0001 | EDGE-0003 | manual |
| EDGE-0006 | EDGE-0001 | EDGE-0006 | count |
| EDGE-0007 | EDGE-0002 | EDGE-0002 | Dimension Kind 07 |
| EDGE-0008 | EDGE-0002 | EDGE-0008 | Encoding 08 |

Attributes are not monolithic; they are declared with explicit type constraints that govern how their values are stored, validated, and interpreted. The lineage edge attribute table establishes this type discipline, assigning *confidence* to the xsd:decimal type, *dimension_kind* and *method* to xsd:string, and *recorded_at* to xsd:dateTime. This type annotation is not merely metadata—it dictates which value store a given attribute must inhabit. Decimal values such as 0.947 and 637.72 reside in the decimal value table, string values like *Dimension Kind 01*, *Encoding 02*, and *change rationale* in the varchar value table, and temporal markers such as 2023-06-18T00:21:12 and 2023-11-20T00:15:50 in the datetime value table. The entity_id and attr_id columns in each value table form foreign-key pairs that bind a specific value to a specific attribute on a specific entity, creating a normalized structure that avoids redundancy while preserving the full expressive range of typed data.

The relationship between belief intervals and their lower-bound constraints introduces a further layer of semantic richness, mediated through a junction table that encodes not only which belief connects to which bound but also the role that each party plays in that connection. The belief lower bound junction table carries columns for belief_id, belief_lower_bound_id, and role, where the role field distinguishes between *contributor* and *owner* designations. A belief identified as INTE-0004 may link to a lower bound INTE-0008 with the role of contributor, while INTE-0001 links to INTE-0002 as owner. The lower bounds themselves carry substantive descriptors—*0.85 probability*, *Three sigma limit*, *ISO ninety eight*, *95 percent threshold*—that ground the abstract relationship in domain-specific calibration standards. This role-aware linking model ensures that provenance is not merely recorded but qualified, allowing downstream consumers to distinguish between bounds that were authored by an entity and those it merely references.

**t_belief_interval_subclass__belief_lower_bound**

| id | belief_id | belief_lower_bound_id | role |
| --- | --- | --- | --- |
| INTE-0001 | INTE-0004 | INTE-0008 | contributor |
| INTE-0002 | INTE-0005 | INTE-0006 | owner |
| INTE-0003 | INTE-0001 | INTE-0002 | contributor |
| INTE-0004 | INTE-0002 | INTE-0008 | owner |
| INTE-0005 | INTE-0006 | INTE-0001 | contributor |
| INTE-0006 | INTE-0002 | INTE-0008 | reviewer |
| INTE-0007 | INTE-0001 | INTE-0006 | owner |
| INTE-0008 | INTE-0005 | INTE-0007 | contributor |

Ownership and classification metadata provide the final layer of governance, anchoring technical resources to organizational accountability and compliance posture. The eBPF map pinned-at-path table assigns an owner—*sre* or *data-engineering*—to each pinned map resource, while simultaneously attaching tags such as *pii*, *internal*, and *verified* that signal the sensitivity and audit status of the underlying data. A sock_hash map pinned at /run/bpf/sockops carries the pii tag and is owned by sre, whereas a conntrack_map at /sys/fs/bpf/bpftool_prog carries the internal tag under data-engineering ownership. These tags function as machine-readable compliance markers, enabling automated policy engines to enforce access controls and retention rules without requiring manual intervention. The owner field, in turn, establishes a clear line of responsibility, ensuring that every resource has an accountable steward who can be consulted for remediation, review, or decommissioning.

**t_ebpfmap_pinned_at_path**

| id | ebpfmap | pinned_at_path | owner | tags |
| --- | --- | --- | --- | --- |
| PATH-0001 | sock_hash | /run/bpf/sockops | sre | pii |
| PATH-0002 | cpumap | /sys/fs/bpf/cilium_flow | data-engineering | pii |
| PATH-0003 | conntrack_map | /sys/fs/bpf/bpftool_prog | data-engineering | internal |
| PATH-0004 | flow_table | /sys/fs/bpf/netfilter_flow | sre | verified |
| PATH-0005 | sock_hash | /sys/fs/bpf/cilium_sock | sre | internal |
| PATH-0006 | lru_percpu_hash | /sys/fs/bpf/xdp_ingress | platform-team | verified |