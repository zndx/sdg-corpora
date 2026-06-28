---
chapter_id: ch_live_requirement_traces_to_a920c9
topic_id: 188
family: 03_directive_governance
cited_terms: ['requirement_traces_to', 'kernelhook_subclass', 'ebpfevent_via_program_xref']
model: engine-refine
---

Kernel-level observability and compliance traceability rest on a shared metadata vocabulary in which every governed artifact carries a stable identifier, is classified by category, and participates in typed relationships whose semantics are fixed by role, subject, and target. Kernel functions name the execution loci at which instrumentation attaches—hook points whose operational meaning is carried in descriptive labels while their placement within the control plane is expressed through category membership. A kernel hook fact records not merely that attachment occurred but how large the captured payload is in bytes and which revision of the hooking logic produced it; version therefore governs interpretability of historical telemetry, and size_bytes signals storage, transfer, and retention obligations that scale with observability depth. Where KERN-0002 references a function whose hook payload reaches 560962979 bytes under version 1, whereas KERN-0001 under version 10 yields 456299832 bytes, analysts infer that lineage and revision—not label text alone—must accompany any audit of kernel-captured evidence.

**fact_kernelhook**

| id | at_kernel_function_key | size_bytes | version |
| --- | --- | --- | --- |
| KERN-0001 | KERN-0002 | 36342735 | 3 |
| KERN-0002 | KERN-0003 | 560962979 | 1 |
| KERN-0003 | KERN-0001 | 456299832 | 10 |
| KERN-0004 | KERN-0008 | 272822846 | 1 |

Attribute definition precedes attribute valuation and is what permits heterogeneous event semantics to be stored, queried, and validated uniformly. An attr names the observable dimension—duration_seconds, end_time, exit_code, host_name—while attr_type constrains legal values through an explicit datatype contract such as xsd:decimal, xsd:dateTime, xsd:integer, or xsd:string, so that downstream parsers, retention policies, and compliance filters can reject ill-typed records before they enter the evidentiary chain. The entity key binds a concrete observation instance to the attribute instances that describe it; the same entity may therefore accumulate multiple attrs drawn from a single program cross-reference, as when XREF-0001 carries both a duration_seconds decimal of 523.38 and an end_time of 2024-04-10T05:27:34 alongside exit_code 165 and host_name worker-07. Partitioning storage by attr_type while routing the literal value through a misc field preserves normalization without sacrificing the specificity required for regulatory reconstruction of batch pipelines, sync failures, and heartbeat telemetry.

Requirement traceability extends the same relational discipline from runtime observation to governance artifacts, expressing obligation flow as subject-to-target linkage rather than as undifferentiated documentation. A subject requirement_id such as TRAC-0001 (Network Segmentation Rule) or TRAC-0004 (Privacy Compliance Requirement) traces to a target traces_to_id that may denote HIPAA Security Rule, Risk Assessment Matrix, Compliance Audit Checklist, or ISO 27001 Control depending on the control framework invoked. Role qualifies each subject–target edge: owner establishes accountability, reviewer attests evidentiary sufficiency, and contributor records participatory authorship without custody. When TRAC-0004 appears as reviewer on one edge and TRAC-0001 as contributor on another, both converging on TRAC-0004 as target, the model captures that privacy mandates may be jointly satisfied through a single control instrument while network rules supply supporting evidence under a different stewardship pattern—precisely the many-to-many nuance audit committees require when mapping internal policy to external standard.

Identifiers knit these subsystems into a single evidentiary fabric because they are the only fields guaranteed stable across version churn, personnel turnover, and schema extension. TRAC-0003 may denote a Privacy Compliance Requirement in the requirement dimension and simultaneously index a traces_to association aimed at Compliance Audit Checklist; KERN-0003 may identify both a dimension row labeled At Kernel Function Label 03 within At Kernel Function Category 03 and a fact row whose hook size_bytes equals 456299832 at version 10; XREF-0002 may identify an ebpfevent of type DATA_LAKE_SYNC_FAIL whose duration_seconds misc value reads 5096.06. Category and attr_type thus operate at different granularities—taxonomy versus typing—yet both reduce ambiguity at ingestion: category tells operators which control family or functional class applies, while attr_type tells validators which value relation may legally receive a given literal.

**t_requirement_traces_to**

| id | requirement |
| --- | --- |
| TRAC-0001 | Network Segmentation Rule |
| TRAC-0002 | Access Control Mandate |
| TRAC-0003 | Privacy Compliance Requirement |
| TRAC-0004 | Privacy Compliance Requirement |
| TRAC-0005 | Access Control Mandate |
| TRAC-0006 | Encryption Standard |
| TRAC-0007 | System Availability Target |

**t_requirement_traces_to_traces_to**

| id | traces_to |
| --- | --- |
| TRAC-0001 | HIPAA Security Rule |
| TRAC-0002 | Risk Assessment Matrix |
| TRAC-0003 | Compliance Audit Checklist |
| TRAC-0004 | ISO 27001 Control |
| TRAC-0005 | Penetration Test Suite |
| TRAC-0006 | NIST SP 800-53 |
| TRAC-0007 | Vulnerability Scan Config |

**dim_at_kernel_function**

| id | at_kernel_function_label | at_kernel_function_category |
| --- | --- | --- |
| KERN-0001 | At Kernel Function Label 01 | At Kernel Function Category 01 |
| KERN-0002 | At Kernel Function Label 02 | At Kernel Function Category 02 |
| KERN-0003 | At Kernel Function Label 03 | At Kernel Function Category 03 |
| KERN-0004 | At Kernel Function Label 04 | At Kernel Function Category 04 |
| KERN-0005 | At Kernel Function Label 05 | At Kernel Function Category 05 |
| KERN-0006 | At Kernel Function Label 06 | At Kernel Function Category 06 |
| KERN-0007 | At Kernel Function Label 07 | At Kernel Function Category 07 |
| KERN-0008 | At Kernel Function Label 08 | At Kernel Function Category 08 |

In operational practice, kernel function metadata, typed event attributes, and requirement traces compose a closed loop from mandate to measurement to attestation. Kernel hooks sized in the hundreds of megabytes supply the raw substrate from which ebpfevent records—DATA_LAKE_SYNC_FAIL, TELEMETRY_HEARTBEAT, BATCH_ETL_COMPLETE—are distilled into normalized attrs; those attrs, keyed by entity and typed by attr_type, become the quantitative and temporal facts auditors cite when demonstrating that segmentation, access control, or privacy requirements were monitored rather than merely asserted. Trace rows then re-anchor those measurements to normative targets under explicit roles, so that an ISO 27001 Control or HIPAA Security Rule is not an orphaned citation but a target with owners, reviewers, and contributors named on the graph. Version on kernel artifacts and attr_type on event fields jointly enforce temporal and logical consistency: neither hook payload nor exit_code 408 on XREF-0002 can be interpreted without knowing which implementation generation produced it and which schema generation authorized its storage, which is why mature governance programs treat identifier, role, subject, target, category, attr, attr_type, entity, misc, size_bytes, and version not as incidental columns but as the minimum contract for defensible compliance evidence.

**t_requirement_traces_to__traces_to**

| id | requirement_id | traces_to_id | role |
| --- | --- | --- | --- |
| TRAC-0001 | TRAC-0001 | TRAC-0004 | owner |
| TRAC-0002 | TRAC-0004 | TRAC-0004 | reviewer |
| TRAC-0003 | TRAC-0004 | TRAC-0004 | reviewer |
| TRAC-0004 | TRAC-0001 | TRAC-0004 | contributor |
| TRAC-0005 | TRAC-0007 | TRAC-0005 | contributor |
| TRAC-0006 | TRAC-0002 | TRAC-0003 | observer |
| TRAC-0007 | TRAC-0007 | TRAC-0002 | owner |
| TRAC-0008 | TRAC-0001 | TRAC-0002 | observer |

**t_ebpfevent_via_program_xref**

| id | ebpfevent |
| --- | --- |
| XREF-0001 | DATA_LAKE_SYNC_FAIL |
| XREF-0002 | DATA_LAKE_SYNC_FAIL |
| XREF-0003 | TELEMETRY_HEARTBEAT |
| XREF-0004 | BATCH_ETL_COMPLETE |
| XREF-0005 | BATCH_ETL_COMPLETE |
| XREF-0006 | BATCH_ETL_COMPLETE |
| XREF-0007 | AUDIT_LOG_ROTATE |
| XREF-0008 | SYS_METRIC_COLLECT_9 |

**t_ebpfevent_via_program_xref_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| XREF-0001 | duration_seconds | xsd:decimal |
| XREF-0002 | end_time | xsd:dateTime |
| XREF-0003 | exit_code | xsd:integer |
| XREF-0004 | host_name | xsd:string |
| XREF-0005 | log_level | xsd:string |
| XREF-0006 | phase | xsd:string |
| XREF-0007 | retry_count | xsd:integer |
| XREF-0008 | scheduled_at | xsd:dateTime |

**t_ebpfevent_via_program_xref_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| XREF-0001 | XREF-0001 | XREF-0002 | 2024-04-10T05:27:34 |
| XREF-0002 | XREF-0001 | XREF-0008 | 2023-11-22T11:52:36 |
| XREF-0003 | XREF-0001 | XREF-0009 | 2023-03-12T23:52:23 |
| XREF-0004 | XREF-0002 | XREF-0002 | 2023-06-01T11:10:59 |
| XREF-0005 | XREF-0002 | XREF-0008 | 2025-03-29T17:45:15 |
| XREF-0006 | XREF-0002 | XREF-0009 | 2025-05-05T19:52:00 |
| XREF-0007 | XREF-0003 | XREF-0002 | 2025-04-08T16:02:54 |
| XREF-0008 | XREF-0003 | XREF-0008 | 2023-08-28T04:07:50 |

**t_ebpfevent_via_program_xref_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| XREF-0001 | XREF-0001 | XREF-0001 | 523.38 |
| XREF-0002 | XREF-0002 | XREF-0001 | 5096.06 |
| XREF-0003 | XREF-0003 | XREF-0001 | 3292.30 |
| XREF-0004 | XREF-0004 | XREF-0001 | 4000.50 |
| XREF-0005 | XREF-0005 | XREF-0001 | 6997.28 |
| XREF-0006 | XREF-0006 | XREF-0001 | 6461.53 |
| XREF-0007 | XREF-0007 | XREF-0001 | 396.42 |
| XREF-0008 | XREF-0008 | XREF-0001 | 2149.89 |

**t_ebpfevent_via_program_xref_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| XREF-0001 | XREF-0001 | XREF-0003 | 165 |
| XREF-0002 | XREF-0001 | XREF-0007 | 480 |
| XREF-0003 | XREF-0002 | XREF-0003 | 408 |
| XREF-0004 | XREF-0002 | XREF-0007 | 150 |
| XREF-0005 | XREF-0003 | XREF-0003 | 507 |
| XREF-0006 | XREF-0003 | XREF-0007 | 419 |
| XREF-0007 | XREF-0004 | XREF-0003 | 413 |
| XREF-0008 | XREF-0004 | XREF-0007 | 9 |

**t_ebpfevent_via_program_xref_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| XREF-0001 | XREF-0001 | XREF-0004 | worker-07 |
| XREF-0002 | XREF-0001 | XREF-0005 | Log Level 02 |
| XREF-0003 | XREF-0001 | XREF-0006 | review |
| XREF-0004 | XREF-0001 | XREF-0010 | failed |
| XREF-0005 | XREF-0001 | XREF-0011 | Triggered By 05 |
| XREF-0006 | XREF-0002 | XREF-0004 | ingest-21 |
| XREF-0007 | XREF-0002 | XREF-0005 | Log Level 07 |
| XREF-0008 | XREF-0002 | XREF-0006 | execution |