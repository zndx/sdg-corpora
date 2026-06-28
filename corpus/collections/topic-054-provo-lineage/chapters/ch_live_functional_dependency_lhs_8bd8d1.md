---
chapter_id: ch_live_functional_dependency_lhs_8bd8d1
topic_id: 54
family: 07_long_tail
cited_terms: ['functional_dependency_lhs', 'transformation_with_input_dataset', 'bpf_helper_called_by']
model: engine-refine
---

An identifier is the stable, auditable handle by which every governed object—whether a functional-dependency assertion, a data-transformation run, or a BPF helper invocation—remains addressable across time, systems, and review cycles. In operational telemetry and metadata registries alike, identifiers such as LHS-0001, DATA-0003, and CALL-0002 are not decorative labels; they are the join keys that let compliance officers, pipeline operators, and security auditors retrieve the same fact from dimension tables, fact tables, and typed value stores without ambiguity. When socket_connect_trace is recorded under CALL-0001 and later correlated with checksum and created_date attributes, it is the identifier that preserves lineage: the program that called the helper (envoy, kubelet, falco) can be traced back to the exact invocation row even after schemas evolve or attributes are promoted into separate physical tables.

**t_bpf_helper_called_by**

| id | bpf | called_by_program |
| --- | --- | --- |
| CALL-0001 | socket_connect_trace | envoy |
| CALL-0002 | xdp_router | kubelet |
| CALL-0003 | lsm:inode_create | falco |
| CALL-0004 | tracepoint:sched_process_exit | kubelet |
| CALL-0005 | raw_tracepoint:sys_enter | kubelet |
| CALL-0006 | cgroup_skb_ingress | istiod |

**t_bpf_helper_called_by_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CALL-0001 | checksum | xsd:string |
| CALL-0002 | created_date | xsd:date |
| CALL-0003 | identifier | cco:DesignativeICE |
| CALL-0004 | license | xsd:string |
| CALL-0005 | mime_type | xsd:string |
| CALL-0006 | size_bytes | xsd:long |
| CALL-0007 | uri | xsd:string |
| CALL-0008 | version | xsd:integer |

The functional-dependency left-hand side—abbreviated in governance corpora as f d left hand side—names the determinant side of a declared or inferred dependency between data elements. Each left-hand-side key (for example LHS-0006 or LHS-0002) resolves through a dimension to a human-readable label and a category such as F D Left Hand Side Category 01, which classifies the dependency for policy routing: some categories trigger mandatory human review, others qualify for automated acceptance. Category is therefore not mere taxonomy; it governs which controls apply, which retention rules bind the evidence, and which downstream transformations may treat a dependency as authoritative. A fact row pairing f_d_left_hand_side_key LHS-0001 with confidence 0.950 and uncertainty 187.13 illustrates a high-trust, low-ambiguity assertion suitable for production constraint enforcement, whereas the same structural pattern at confidence 0.130 and uncertainty 994.01 signals a provisional inference that must not drive irreversible masking or aggregation without corroboration.

Confidence and uncertainty form a complementary pair of evidential quantities attached to functional-dependency claims and, by extension, to any automated decision that consumes them. Confidence, expressed on a bounded scale (0.516, 0.117, 0.950 in the sample corpus), communicates the estimated probability or strength of the asserted relationship; uncertainty (249.67, 197.20, 994.01) quantifies residual doubt or measurement spread in the units appropriate to the estimation method. Governance frameworks treat these fields as mandatory disclosure on any machine-generated rule: reviewers must see not only that LHS-0006 is linked to a particular outcome value (139.46 or 896.76 in the miscellaneous value slot) but also whether the linkage was discovered under noisy sampling or validated across complete domains. Low confidence with high uncertainty is an explicit stop signal; high confidence with comparatively low uncertainty authorizes propagation into ETL contracts, access-control matrices, and data-quality monitors.

Duration in seconds and retry count operationalize the reliability envelope of data-processing workloads whose outputs feed the same governance graph. A log-aggregation transformation over patient vitals that runs 7022.59 seconds and accumulates 337 retries presents a different risk profile than feature extraction on network traffic capture at 3575.88 seconds with 418 retries, or data masking on financial trade records that completes in 722.03 seconds after 276 retries. These metrics matter because prolonged duration often correlates with resource contention, partial failures, or schema drift, while elevated retry_count frequently indicates upstream instability that can corrupt inferred dependencies or attribute extractions. Genomic sequencing reads processed through an ETL pipeline in 6380.45 seconds with 352 retries exemplify the class of long-running, failure-prone jobs where compliance teams require run-level identifiers (DATA-0004) to gate publication of derived facts until duration and retry thresholds are within policy.

In observability and metadata subsystems—here illustrated by BPF helper call records—entity, attr, and attr_type implement a disciplined entity–attribute–value pattern that keeps heterogeneous facts queryable under uniform governance rules. The entity (CALL-0001, CALL-0002, etc.) is the invocation or asset instance; attr names the semantic slot (checksum, created_date, identifier, license); attr_type declares the interpretive contract (xsd:string, xsd:date, cco:DesignativeICE). Typed value tables then store miscellaneous payloads appropriate to each attr_type: varchar misc values such as 1a4b6c2d, ARN:res/41, proprietary, and zone-b; integer misc values 67, 11, 259, and 9; date misc values 2024-07-02 through 2025-01-26. This separation prevents silent coercion— a created_date typed as xsd:date cannot be compared to a license typed as xsd:string without an explicit, auditable cast—and it allows attr_type-specific validation, redaction, and retention schedules to attach at registration time rather than at query time.

**t_bpf_helper_called_by_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CALL-0001 | CALL-0001 | CALL-0002 | 2024-07-02 |
| CALL-0002 | CALL-0002 | CALL-0002 | 2025-01-26 |
| CALL-0003 | CALL-0003 | CALL-0002 | 2024-10-16 |
| CALL-0004 | CALL-0004 | CALL-0002 | 2023-11-11 |
| CALL-0005 | CALL-0005 | CALL-0002 | 2024-05-09 |
| CALL-0006 | CALL-0006 | CALL-0002 | 2025-02-22 |

**t_bpf_helper_called_by_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CALL-0001 | CALL-0001 | CALL-0006 | 67 |
| CALL-0002 | CALL-0001 | CALL-0008 | 11 |
| CALL-0003 | CALL-0002 | CALL-0006 | 259 |
| CALL-0004 | CALL-0002 | CALL-0008 | 9 |
| CALL-0005 | CALL-0003 | CALL-0006 | 333 |
| CALL-0006 | CALL-0003 | CALL-0008 | 11 |
| CALL-0007 | CALL-0004 | CALL-0006 | 103 |
| CALL-0008 | CALL-0004 | CALL-0008 | 4 |

**t_bpf_helper_called_by_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CALL-0001 | CALL-0001 | CALL-0001 | 1a4b6c2d |
| CALL-0002 | CALL-0001 | CALL-0003 | ARN:res/41 |
| CALL-0003 | CALL-0001 | CALL-0004 | proprietary |
| CALL-0004 | CALL-0001 | CALL-0009 | zone-b |
| CALL-0005 | CALL-0001 | CALL-0005 | application/octet-stream |
| CALL-0006 | CALL-0001 | CALL-0010 | Name 06 |
| CALL-0007 | CALL-0001 | CALL-0011 | data-engineering |
| CALL-0008 | CALL-0001 | CALL-0012 | Tags 08 |

Taken together, identifier, category, f d left hand side, confidence, uncertainty, durationseconds, retrycount, entity, attr, attr_type, and misc constitute the evidentiary lattice on which compliance handbooks anchor automated and human decisions. Identifiers stitch functional-dependency analytics to pipeline telemetry and kernel-level helper provenance; categories and attr_types encode which policies fire; confidence and uncertainty qualify whether a dependency or derived attribute may be acted upon; durationseconds and retrycount qualify whether the producing job was trustworthy; entity–attr bindings with typed misc values supply the concrete facts auditors inspect. A reviewer examining whether kubelet’s invocation of xdp_router may rely on a checksum of 1a4b6c2d or whether falco’s lsm:inode_create trace supports an identifier misc of ARN:res/41 is never reading isolated numbers—each value is meaningful only in the presence of its identifier, its attr_type contract, and the operational context (retries, runtime, dependency confidence) under which it was materialized. That interdependence is the domain’s central design principle: governance metadata is not documentation about data; it is data structured so that evidence, risk, and action remain jointly traceable.

**fact_functional**

| id | f_d_left_hand_side_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| LHS-0001 | LHS-0006 | 0.516 | 249.67 | 163.64 |
| LHS-0002 | LHS-0002 | 0.130 | 197.20 | 234.79 |
| LHS-0003 | LHS-0006 | 0.117 | 994.01 | 139.46 |
| LHS-0004 | LHS-0001 | 0.950 | 187.13 | 896.76 |
| LHS-0005 | LHS-0003 | 0.902 | 938.45 | 27.14 |
| LHS-0006 | LHS-0002 | 0.388 | 256.27 | 476.93 |
| LHS-0007 | LHS-0001 | 0.665 | 479.74 | 169.53 |

**dim_f_d_left_hand_side**

| id | f_d_left_hand_side_label | f_d_left_hand_side_category |
| --- | --- | --- |
| LHS-0001 | F D Left Hand Side Label 01 | F D Left Hand Side Category 01 |
| LHS-0002 | F D Left Hand Side Label 02 | F D Left Hand Side Category 02 |
| LHS-0003 | F D Left Hand Side Label 03 | F D Left Hand Side Category 03 |
| LHS-0004 | F D Left Hand Side Label 04 | F D Left Hand Side Category 04 |
| LHS-0005 | F D Left Hand Side Label 05 | F D Left Hand Side Category 05 |
| LHS-0006 | F D Left Hand Side Label 06 | F D Left Hand Side Category 06 |

**t_transformation_with_input_dataset**

| id | transformation | input_dataset | duration_seconds | retry_count |
| --- | --- | --- | --- | --- |
| DATA-0001 | log aggregation | patient vitals | 7022.59 | 337 |
| DATA-0002 | feature extraction | network traffic capture | 3575.88 | 418 |
| DATA-0003 | data masking | financial trade records | 722.03 | 276 |
| DATA-0004 | ETL pipeline | genomic sequencing reads | 6380.45 | 352 |
| DATA-0005 | metadata enrichment | raw sensor logs | 5901.31 | 65 |
| DATA-0006 | ETL pipeline | genomic sequencing reads | 1979.98 | 431 |
| DATA-0007 | ETL pipeline | field survey records | 6357.24 | 452 |