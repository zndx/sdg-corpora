---
chapter_id: ch_live_ebpfmap_with_max_entries_bbb767
topic_id: 186
family: 04_ebpf_kernel
cited_terms: ['ebpfmap_with_max_entries', 'profile_has_cardinality', 'span_within_trace']
model: engine-refine
---

In distributed observability and kernel instrumentation governance, every auditable assertion must be anchored to a durable identifier that survives schema evolution, personnel turnover, and toolchain upgrades. Identifiers such as ENTR-0001 or TRAC-0003 are not display labels; they are the canonical keys through which policies, lineage records, and remediation tickets refer to the same underlying fact across time. When an eBPF map record (devmap) and a trace span (http-get-users) each carry distinct identifier namespaces, the separation is deliberate: mixing ENTR-* and TRAC-* keys would collapse unrelated domains into a single collision-prone namespace. Governance therefore treats identifiers as immutable handles; what changes over time is the descriptive and relational metadata hung off those handles, not the handles themselves.

**t_span_within_trace**

| id | span |
| --- | --- |
| TRAC-0001 | lambda-process-image |
| TRAC-0002 | http-get-users |
| TRAC-0003 | http-get-users |
| TRAC-0004 | auth-validate-token |
| TRAC-0005 | kafka-produce-metrics |
| TRAC-0006 | http-get-users |
| TRAC-0007 | batch-ingest-logs |
| TRAC-0008 | cache-lookup-session |

Relational governance depends on distinguishing subject from target and on encoding the semantic of the link through role. A subject is the entity whose behavior or placement is under review—an ebpfmap_id pointing at ENTR-0004 (stack_trace) or a span_id pointing at TRAC-0002—while the target is the resource or context to which that subject is bound, such as max_entries_id ENTR-0002 (262144) or part_of_id TRAC-0006. Role completes the triplet: the same subject-target pair means different things when role is reviewer versus owner, or contributor versus observer. An observer on TRAC-0003’s link to part_of checkout-session signals read-only attestation without operational authority, whereas a contributor on TRAC-0001’s attachment to data-ingest-job implies an obligation to supply or validate telemetry within that workflow. Compliance reviews therefore audit triplets, not isolated entities, because authorization, accountability, and data-flow boundaries are properties of directed, typed edges.

**t_ebpfmap_with_max_entries**

| id | ebpfmap |
| --- | --- |
| ENTR-0001 | devmap |
| ENTR-0002 | cgroup_storage |
| ENTR-0003 | queue |
| ENTR-0004 | stack_trace |
| ENTR-0005 | sockhash |
| ENTR-0006 | queue |

**t_ebpfmap_with_max_entries_max_entries**

| id | max_entries |
| --- | --- |
| ENTR-0001 | 1048576 |
| ENTR-0002 | 262144 |
| ENTR-0003 | 16384 |
| ENTR-0004 | 16384 |
| ENTR-0005 | 32768 |
| ENTR-0006 | 1048576 |
| ENTR-0007 | 524288 |

**t_ebpfmap_with_max_entries__max_entries**

| id | ebpfmap_id | max_entries_id | role |
| --- | --- | --- | --- |
| ENTR-0001 | ENTR-0004 | ENTR-0002 | reviewer |
| ENTR-0002 | ENTR-0001 | ENTR-0001 | owner |
| ENTR-0003 | ENTR-0004 | ENTR-0006 | reviewer |
| ENTR-0004 | ENTR-0002 | ENTR-0004 | observer |
| ENTR-0005 | ENTR-0006 | ENTR-0002 | observer |
| ENTR-0006 | ENTR-0006 | ENTR-0006 | owner |
| ENTR-0007 | ENTR-0004 | ENTR-0005 | owner |
| ENTR-0008 | ENTR-0006 | ENTR-0004 | observer |

**t_span_within_trace_part_of**

| id | part_of |
| --- | --- |
| TRAC-0001 | data-ingest-job |
| TRAC-0002 | auth-flow |
| TRAC-0003 | checkout-session |
| TRAC-0004 | api-request |
| TRAC-0005 | payment-route |
| TRAC-0006 | auth-flow |

**t_span_within_trace__part_of**

| id | span_id | part_of_id | role |
| --- | --- | --- | --- |
| TRAC-0001 | TRAC-0006 | TRAC-0006 | contributor |
| TRAC-0002 | TRAC-0007 | TRAC-0001 | contributor |
| TRAC-0003 | TRAC-0002 | TRAC-0006 | observer |
| TRAC-0004 | TRAC-0003 | TRAC-0006 | observer |
| TRAC-0005 | TRAC-0007 | TRAC-0003 | owner |
| TRAC-0006 | TRAC-0008 | TRAC-0006 | owner |
| TRAC-0007 | TRAC-0001 | TRAC-0006 | contributor |
| TRAC-0008 | TRAC-0007 | TRAC-0003 | owner |

Cardinality names the scale at which a governed artifact may grow or the fineness with which it may be partitioned, and it is rarely a single scalar printed on a dashboard. Operational limits such as max_entries values of 1048576 for devmap and 16384 for queue express hard capacity envelopes, but cardinality in the profiling layer abstracts that notion into comparable keys—CARD-0001 through CARD-0004—each carrying a human-facing label and a category that situates the measure inside a controlled taxonomy. Category (for example, Cardinality Category 02) tells reviewers which control family applies—whether the number governs kernel map pressure, RPC fan-out, or storage shard width—while the label preserves operator-readable semantics without overloading the identifier. When cardinality_key references in a fact profile point at CARD-0005 alongside CARD-0001 and CARD-0003, the intent is cross-domain normalization: unlike raw max_entries integers scattered across map types, cardinality keys become joinable evidence suitable for threshold policies and aggregate risk scoring.

Confidence and uncertainty are paired epistemic dimensions that prevent governance systems from treating inferred metadata as ground truth. Confidence scores such as 0.994 on one profile row and 0.226 on another express graded belief in the correctness or stability of an associated cardinality assignment, while uncertainty magnitudes in the hundreds (284.36 versus 622.09) quantify residual doubt in the underlying measurement or classification process. High confidence does not eliminate the need to record uncertainty; a profile may be believed strongly yet still carry wide error bars when the observation window was short or the source was heterogeneous. Conversely, low confidence with moderate uncertainty may trigger human review rather than automatic enforcement. Miscellaneous attributes—here captured as value fields alongside labels—hold quantities or descriptors that are material to operations but not themselves first-class relational types: a value of 728.94 may represent a sampled statistic, a derived index, or a compliance-relevant threshold margin depending on category context. Treating such fields as misc prevents them from being mistaken for identifiers or cardinalities while still allowing them to appear in evidence packets.

**fact_profile**

| id | cardinality_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| CARD-0001 | CARD-0001 | 0.299 | 284.36 | 728.94 |
| CARD-0002 | CARD-0003 | 0.994 | 557.92 | 380.57 |
| CARD-0003 | CARD-0005 | 0.773 | 622.09 | 607.36 |
| CARD-0004 | CARD-0002 | 0.226 | 488.10 | 448.09 |

**dim_cardinality**

| id | cardinality_label | cardinality_category |
| --- | --- | --- |
| CARD-0001 | Cardinality Label 01 | Cardinality Category 01 |
| CARD-0002 | Cardinality Label 02 | Cardinality Category 02 |
| CARD-0003 | Cardinality Label 03 | Cardinality Category 03 |
| CARD-0004 | Cardinality Label 04 | Cardinality Category 04 |
| CARD-0005 | Cardinality Label 05 | Cardinality Category 05 |
| CARD-0006 | Cardinality Label 06 | Cardinality Category 06 |

In practice, these elements compose into reviewable chains that connect kernel resources, trace structure, and statistical profiles without collapsing their semantics. An eBPF governance chain might run from ENTR-0001 (devmap) through a reviewer role binding to a max_entries target, while a trace governance chain runs from span http-get-users through part_of auth-flow with contributor or observer roles depending on whether the span emits or merely witnesses traffic. Cardinality profiles then overlay both chains, supplying categorized scale context and explicit confidence/uncertainty so that an auditor can answer not only what is linked to what, but how strongly the organization believes the link and the limits that constrain it. Mature operational guides require that any automated decision—quota approval, map resize, sampling rate change—cite the identifier chain, the role-qualified edge, the cardinality category implicated, and the confidence/uncertainty band that justified action or deferral. That discipline turns scattered telemetry facts into durable, defensible governance evidence.