---
chapter_id: ch_live_audit_produces_evidence_7827c4
topic_id: 10
family: 07_long_tail
cited_terms: ['audit_produces_evidence', 'ebpfmap_basic', 'tc_classifier_subclass']
model: engine-refine
---

The foundational architecture of audit evidence relies upon a rigid identification scheme wherein each record is anchored by a unique identifier, such as EVID-0001 or EVID-0002, which serves as the immutable reference point for downstream compliance tracing. Within this framework, the entity designation denotes the concrete subject under observation, linking discrete measurements to their originating audit context—whether a Data Retention Policy Audit, an ISO27001 Certification exercise, or a Cloud Infrastructure Scan. Attributes function as the semantic vessels for these observations, each bound to a strictly defined attr type that governs validation, storage, and query semantics. A confidence metric, for instance, is typed as xsd:decimal to preserve numerical precision, while temporal markers like recorded_at are constrained to xsd:dateTime, ensuring that chronological assertions remain machine-interpretable across heterogeneous logging pipelines.

**t_audit_produces_evidence**

| id | audit |
| --- | --- |
| EVID-0001 | Data Retention Policy Audit |
| EVID-0002 | ISO27001 Certification |
| EVID-0003 | Cloud Infrastructure Scan |
| EVID-0004 | Cloud Infrastructure Scan |
| EVID-0005 | Data Retention Policy Audit |
| EVID-0006 | Data Retention Policy Audit |

**t_audit_produces_evidence_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| EVID-0001 | confidence | xsd:decimal |
| EVID-0002 | dimension_kind | xsd:string |
| EVID-0003 | method | xsd:string |
| EVID-0004 | recorded_at | xsd:dateTime |
| EVID-0005 | uncertainty | xsd:decimal |
| EVID-0006 | unit | xsd:string |
| EVID-0007 | value | xsd:decimal |
| EVID-0008 | encoding | xsd:string |

**t_audit_produces_evidence_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0001 | EVID-0004 | 2025-03-28T10:19:21 |
| EVID-0002 | EVID-0002 | EVID-0004 | 2023-02-07T18:23:26 |
| EVID-0003 | EVID-0003 | EVID-0004 | 2025-03-19T12:10:16 |
| EVID-0004 | EVID-0004 | EVID-0004 | 2023-11-17T00:14:22 |
| EVID-0005 | EVID-0005 | EVID-0004 | 2023-04-23T17:18:39 |
| EVID-0006 | EVID-0006 | EVID-0004 | 2024-01-14T13:39:09 |

**t_audit_produces_evidence_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0001 | EVID-0001 | 0.658 |
| EVID-0002 | EVID-0001 | EVID-0005 | 291.89 |
| EVID-0003 | EVID-0001 | EVID-0007 | 838.98 |
| EVID-0004 | EVID-0002 | EVID-0001 | 0.814 |
| EVID-0005 | EVID-0002 | EVID-0005 | 409.44 |
| EVID-0006 | EVID-0002 | EVID-0007 | 534.69 |
| EVID-0007 | EVID-0003 | EVID-0001 | 0.935 |
| EVID-0008 | EVID-0003 | EVID-0005 | 954.22 |

**t_audit_produces_evidence_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0001 | EVID-0002 | Dimension Kind 01 |
| EVID-0002 | EVID-0001 | EVID-0008 | Encoding 02 |
| EVID-0003 | EVID-0001 | EVID-0009 | calibration record |
| EVID-0004 | EVID-0001 | EVID-0010 | en |
| EVID-0005 | EVID-0001 | EVID-0003 | manual |
| EVID-0006 | EVID-0001 | EVID-0006 | deg_C |
| EVID-0007 | EVID-0002 | EVID-0002 | Dimension Kind 07 |
| EVID-0008 | EVID-0002 | EVID-0008 | Encoding 08 |

The enforcement of attr type dictates not only how values are persisted but also how they are aggregated during forensic review. Decimal attributes such as 0.658 or 291.89 are routed through specialized value stores that maintain arithmetic integrity, whereas string-typed attributes capture operational metadata like calibration record or Dimension Kind 01 without imposing numeric constraints. Temporal attributes are similarly isolated, storing timestamps such as 2025-03-28T10:19:21 in dedicated datetime repositories to prevent format drift. This type-aware partitioning eliminates schema ambiguity at ingestion time, allowing auditors to reconstruct precise measurement timelines and verify that each entity’s attribute payload conforms to the declared schema without post-hoc normalization.

Beyond audit evidence, the governance of kernel-level observability structures follows an analogous pattern of typed identification and versioned tracking. Extended Berkeley Packet Filter maps, referenced by identifiers such as EBPF-0001 through EBPF-0004, are cataloged alongside their ebpfmap_key, size bytes footprint, and version revision. A single map instance may occupy 354373995 bytes of contiguous memory, while another registers at 31105012 bytes, reflecting the highly variable allocation demands of eBPF data structures. Each map carries a version number—ranging from 3 to 12—that signals compilation lineage, compatibility boundaries, and deployment state. This versioning mechanism, paired with precise size bytes accounting, enables capacity planners to forecast memory pressure and ensures that map evictions or upgrades do not silently break dependent telemetry pipelines.

Traffic classification and directional routing are similarly formalized through a parallel taxonomy anchored by t c direction identifiers and their associated classifier facts. Each directional classifier, denoted by keys such as CLAS-0001 or CLAS-0004, is assigned a size bytes allocation that can exceed 883422563 bytes, alongside a version stamp that tracks policy iteration. The categorical organization of these classifiers—grouped under labels like T C Direction Category 01 or Ebpfmap Category 03—provides a structured hierarchy for filtering, reporting, and compliance mapping. Miscellaneous descriptors, including Ebpfmap Label 02 or Encoding 02, supply human-readable context without compromising the machine-enforced type boundaries that govern the underlying fact tables.

**fact_ebpfmap**

| id | ebpfmap_key | size_bytes | version |
| --- | --- | --- | --- |
| EBPF-0001 | EBPF-0002 | 208979093 | 3 |
| EBPF-0002 | EBPF-0005 | 156714508 | 6 |
| EBPF-0003 | EBPF-0003 | 31105012 | 12 |
| EBPF-0004 | EBPF-0001 | 354373995 | 5 |
| EBPF-0005 | EBPF-0002 | 866267293 | 2 |

**dim_ebpfmap**

| id | ebpfmap_label | ebpfmap_category |
| --- | --- | --- |
| EBPF-0001 | Ebpfmap Label 01 | Ebpfmap Category 01 |
| EBPF-0002 | Ebpfmap Label 02 | Ebpfmap Category 02 |
| EBPF-0003 | Ebpfmap Label 03 | Ebpfmap Category 03 |
| EBPF-0004 | Ebpfmap Label 04 | Ebpfmap Category 04 |
| EBPF-0005 | Ebpfmap Label 05 | Ebpfmap Category 05 |
| EBPF-0006 | Ebpfmap Label 06 | Ebpfmap Category 06 |

**fact_classifier**

| id | t_c_direction_key | size_bytes | version |
| --- | --- | --- | --- |
| CLAS-0001 | CLAS-0001 | 643947353 | 2 |
| CLAS-0002 | CLAS-0004 | 883422563 | 1 |
| CLAS-0003 | CLAS-0001 | 772730446 | 1 |
| CLAS-0004 | CLAS-0006 | 623892633 | 9 |
| CLAS-0005 | CLAS-0002 | 61512113 | 4 |
| CLAS-0006 | CLAS-0007 | 798328963 | 5 |
| CLAS-0007 | CLAS-0002 | 968248258 | 9 |

**dim_t_c_direction**

| id | t_c_direction_label | t_c_direction_category |
| --- | --- | --- |
| CLAS-0001 | T C Direction Label 01 | T C Direction Category 01 |
| CLAS-0002 | T C Direction Label 02 | T C Direction Category 02 |
| CLAS-0003 | T C Direction Label 03 | T C Direction Category 03 |
| CLAS-0004 | T C Direction Label 04 | T C Direction Category 04 |
| CLAS-0005 | T C Direction Label 05 | T C Direction Category 05 |
| CLAS-0006 | T C Direction Label 06 | T C Direction Category 06 |
| CLAS-0007 | T C Direction Label 07 | T C Direction Category 07 |

In operational practice, the interplay between identifier, entity, attr type, category, and version creates a self-describing data fabric that supports both granular auditability and system-wide resource governance. By decoupling semantic type from storage implementation, the architecture permits heterogeneous value types to coexist within a unified query surface, while size bytes and version fields enforce hard constraints on memory allocation and deployment lineage. When an auditor queries for a specific entity’s confidence score or a network classifier’s current revision, the system resolves the request through typed joins that preserve data fidelity from ingestion to report generation. This disciplined separation of concerns ensures that compliance artifacts remain reproducible, that kernel telemetry stays within bounded resource envelopes, and that every measurement can be traced back to its originating identifier without ambiguity.