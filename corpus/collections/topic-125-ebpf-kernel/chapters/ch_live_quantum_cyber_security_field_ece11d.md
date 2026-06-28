---
chapter_id: ch_live_quantum_cyber_security_field_ece11d
topic_id: 125
family: 08_derived
cited_terms: ['quantum_cyber_security_field', 'log_record_subclass', 'perf_buffer_map_subclass']
model: engine-refine
---

Quantum cybersecurity governance rests on a vocabulary of stable concepts that must be named, classified, and linked before any compliance claim can be audited. A **quantumcybersecurityfield** denotes a recognized line of research or operational practice within the broader quantum-security program—examples include Quantum Secure Direct Communication, Measurement-Device-Independent QKD, and Post-Quantum Cryptography. These fields do not exist in isolation; each is associated with one or more **communicationsecurityaspect** concerns that specify what security property or failure mode the field is expected to address. Emitter Calibration Drift, for instance, anchors calibration integrity for direct-communication deployments, whereas Channel Eavesdropping Detection and Quantum Memory Coherence capture orthogonal threat and reliability dimensions. Because the same aspect label can apply to more than one field—as Channel Eavesdropping Detection does for both MDI-QKD and post-quantum cryptography workstreams—governance models must treat aspects as reusable security primitives rather than as private annotations on a single initiative.

Relational integrity across these concepts depends on the **identifier**, a durable surrogate key that survives renaming, reclassification, and cross-system exchange. Identifiers such as FIEL-0001 through FIEL-0004 provide the join surface on which fields, aspects, and their associations are reconciled; without them, a compliance review could not determine whether two reports refer to the same program element or merely to similarly worded labels. Where fields and aspects are many-to-many, the **subject**–target pattern clarifies directionality: the subject (here, a quantum field record referenced by quantum_id) is the entity whose portfolio or accountability scope is being described, while the target (studies_domain_aspect_id) is the security aspect under study. The **role** qualifier then states how that subject participates in the relationship—contributor versus owner—so that responsibility matrices, RACI charts, and audit trails can distinguish nominal participation from authoritative stewardship. When FIEL-0001 appears as owner on a linkage while other records hold contributor roles, reviewers can trace which organization or work package holds decision rights over a given aspect-field pairing without inferring authority from naming alone.

**t_quantum_cyber_security_field_studies_domain_aspect**

| id | studies_domain_aspect |
| --- | --- |
| FIEL-0001 | Emitter Calibration Drift |
| FIEL-0002 | Channel Eavesdropping Detection |
| FIEL-0003 | Quantum Memory Coherence |
| FIEL-0004 | Channel Eavesdropping Detection |
| FIEL-0005 | Protocol Authentication Tokens |
| FIEL-0006 | Network Topology Integrity |

**t_quantum_cyber_security_field__studies_domain_aspect**

| id | quantum_id | studies_domain_aspect_id | role |
| --- | --- | --- | --- |
| FIEL-0001 | FIEL-0003 | FIEL-0001 | contributor |
| FIEL-0002 | FIEL-0005 | FIEL-0003 | contributor |
| FIEL-0003 | FIEL-0001 | FIEL-0001 | contributor |
| FIEL-0004 | FIEL-0001 | FIEL-0001 | owner |
| FIEL-0005 | FIEL-0003 | FIEL-0006 | owner |
| FIEL-0006 | FIEL-0001 | FIEL-0005 | contributor |
| FIEL-0007 | FIEL-0002 | FIEL-0004 | contributor |
| FIEL-0008 | FIEL-0004 | FIEL-0004 | reviewer |

Operational and forensic evidence complements this conceptual layer through **log severity** classification and volumetric metadata. Fact records carry a log_severity_key that resolves, via a severity dimension, to a human-readable label and a coarser **category** bucket—Log Severity Category 01 through Log Severity Category 04 in the reference data—so that monitoring rules, escalation playbooks, and retention policies can key off normalized severity tiers rather than ad hoc strings. The **size_bytes** attribute quantifies each log artifact’s storage footprint (values on the order of hundreds of millions to low billions of bytes in the sample), which matters for capacity planning, transfer-time SLAs, and demonstrating that log preservation obligations were met without silent truncation. Pairing severity with byte size also supports proportionality analysis: a category-appropriate response to a high-severity event should be defensible when the retained payload’s scale is documented alongside its classification.

Structured metadata for performance and instrumentation assets follows an entity–attribute model in which an **entity** represents a concrete mappable object—here, performance buffer subclasses tied to workloads such as cassandra-perf, netperf-tcp, iperf3-stream, and tpch-10gb—and **attr** entries name the governed properties attached to those entities. Each attribute declares an **attr_type** that constrains interpretation and selects the correct persistence path: xsd:string for free text, xsd:date for temporal facts, or domain-specific types such as cco:DesignativeICE for formal identifiers. Storing values in type-aligned tables (date, integer, varchar) prevents schema drift and type coercion errors that would undermine cross-environment comparability; a created_date of 2023-09-17 and an integer threshold of 123 mean nothing comparable if both were forced into a single untyped text column. The **misc** designation captures attribute or dimension values that are intentionally heterogeneous—severity labels, checksum hashes, license strings, regional codes—while still remaining bound to their entity and attribute through foreign keys, so auditors can reconstruct what was asserted, about which object, under which semantic type.

**t_perf_buffer_map_subclass**

| id | perf | perf_buffer_config |
| --- | --- | --- |
| MAP-0001 | cassandra-perf | tracepoint-raw |
| MAP-0002 | netperf-tcp | kprobe-struct |
| MAP-0003 | iperf3-stream | tracepoint-raw |
| MAP-0004 | tpch-10gb | commit-atomic |
| MAP-0005 | spec-jbb2015 | flush-threshold-256 |
| MAP-0006 | pgbench-default | kprobe-struct |
| MAP-0007 | spark-stress | polling-sync |

**t_perf_buffer_map_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| MAP-0001 | checksum | xsd:string |
| MAP-0002 | created_date | xsd:date |
| MAP-0003 | identifier | cco:DesignativeICE |
| MAP-0004 | license | xsd:string |
| MAP-0005 | mime_type | xsd:string |
| MAP-0006 | size_bytes | xsd:long |
| MAP-0007 | uri | xsd:string |
| MAP-0008 | version | xsd:integer |

**t_perf_buffer_map_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| MAP-0001 | MAP-0001 | MAP-0002 | 2023-01-21 |
| MAP-0002 | MAP-0002 | MAP-0002 | 2023-09-17 |
| MAP-0003 | MAP-0003 | MAP-0002 | 2023-07-22 |
| MAP-0004 | MAP-0004 | MAP-0002 | 2024-09-18 |
| MAP-0005 | MAP-0005 | MAP-0002 | 2025-02-25 |
| MAP-0006 | MAP-0006 | MAP-0002 | 2024-02-08 |
| MAP-0007 | MAP-0007 | MAP-0002 | 2024-05-18 |

**t_perf_buffer_map_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| MAP-0001 | MAP-0001 | MAP-0006 | 60 |
| MAP-0002 | MAP-0001 | MAP-0008 | 11 |
| MAP-0003 | MAP-0002 | MAP-0006 | 123 |
| MAP-0004 | MAP-0002 | MAP-0008 | 12 |
| MAP-0005 | MAP-0003 | MAP-0006 | 190 |
| MAP-0006 | MAP-0003 | MAP-0008 | 10 |
| MAP-0007 | MAP-0004 | MAP-0006 | 100 |
| MAP-0008 | MAP-0004 | MAP-0008 | 1 |

**t_perf_buffer_map_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| MAP-0001 | MAP-0001 | MAP-0001 | a3f9c21e |
| MAP-0002 | MAP-0001 | MAP-0003 | gid://svc/77 |
| MAP-0003 | MAP-0001 | MAP-0004 | CC-BY-4.0 |
| MAP-0004 | MAP-0001 | MAP-0009 | ap-south-2 |
| MAP-0005 | MAP-0001 | MAP-0005 | application/xml |
| MAP-0006 | MAP-0001 | MAP-0010 | Name 06 |
| MAP-0007 | MAP-0001 | MAP-0011 | governance |
| MAP-0008 | MAP-0001 | MAP-0012 | Tags 08 |

Taken together, these constructs form a layered governance fabric. Identifiers anchor identity; quantumcybersecurityfield and communicationsecurityaspect supply the controlled vocabulary of technical scope; subject, target, and role articulate directed, accountable relationships; log severity, category, and size_bytes document the scale and criticality of operational evidence; and entity, attr, attr_type, and misc implement a typed extensibility model for instrument and configuration metadata. Mature programs treat each layer as independently versionable yet jointly auditable: a field may be reclassified, a severity taxonomy may gain a new category, or an entity may acquire additional attributes, but the identifier graph preserves lineage so that historical compliance statements remain interpretable in light of present definitions rather than being orphaned by silent semantic change.

**t_quantum_cyber_security_field**

| id | quantum_cyber_security_field |
| --- | --- |
| FIEL-0001 | Quantum Secure Direct Communication |
| FIEL-0002 | Measurement-Device-Independent QKD |
| FIEL-0003 | Post-Quantum Cryptography |
| FIEL-0004 | Post-Quantum Cryptography |
| FIEL-0005 | Quantum Digital Signatures |
| FIEL-0006 | Quantum Key Distribution |

**fact_log**

| id | log_severity_key | size_bytes | version |
| --- | --- | --- | --- |
| RECO-0001 | RECO-0006 | 913386183 | 6 |
| RECO-0002 | RECO-0004 | 303816232 | 7 |
| RECO-0003 | RECO-0007 | 758542341 | 7 |
| RECO-0004 | RECO-0001 | 442933768 | 2 |

**dim_log_severity**

| id | log_severity_label | log_severity_category |
| --- | --- | --- |
| RECO-0001 | Log Severity Label 01 | Log Severity Category 01 |
| RECO-0002 | Log Severity Label 02 | Log Severity Category 02 |
| RECO-0003 | Log Severity Label 03 | Log Severity Category 03 |
| RECO-0004 | Log Severity Label 04 | Log Severity Category 04 |
| RECO-0005 | Log Severity Label 05 | Log Severity Category 05 |
| RECO-0006 | Log Severity Label 06 | Log Severity Category 06 |
| RECO-0007 | Log Severity Label 07 | Log Severity Category 07 |