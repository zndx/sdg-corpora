---
chapter_id: ch_live_aggregation_basic_11ca53
topic_id: 44
family: 02_observation_measurement
cited_terms: ['aggregation_basic', 'ebpfprogram_governed_by_security_policy', 'kernelhook_with_attached_program']
model: engine-refine
---

Governed observability over kernel-resident instrumentation rests on a disciplined separation between stable identity, typed descriptive metadata, and measurable runtime facts. An identifier—whether AGGR-0001 denoting a Daily telemetry summary aggregation, POLI-0003 referencing an eBPF program artifact, or PROG-0001 naming an attached program subject to hook accounting—functions as the immutable join key across descriptive, factual, and valuation layers. Entity linkage extends that principle: each valuation row binds a concrete entity (for example AGGR-0001 or AGGR-0002) to a specific attribute occurrence, so that confidence scores, dimension classifications, and temporal stamps remain attributable to exactly one governed object rather than floating as anonymous literals. Without such anchoring, cross-domain reconciliation—comparing a quarterly revenue consolidation against the program versions and byte footprints that produced it—degenerates into heuristic matching and forfeits audit defensibility.

**t_aggregation_basic**

| id | aggregation |
| --- | --- |
| AGGR-0001 | Daily telemetry summary |
| AGGR-0002 | Annual inventory rollup |
| AGGR-0003 | Quarterly revenue consolidation |
| AGGR-0004 | Weekly sensor fusion |
| AGGR-0005 | Quarterly revenue consolidation |
| AGGR-0006 | Quarterly revenue consolidation |

**t_aggregation_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| AGGR-0001 | confidence | xsd:decimal |
| AGGR-0002 | dimension_kind | xsd:string |
| AGGR-0003 | method | xsd:string |
| AGGR-0004 | recorded_at | xsd:dateTime |
| AGGR-0005 | uncertainty | xsd:decimal |
| AGGR-0006 | unit | xsd:string |
| AGGR-0007 | value | xsd:decimal |
| AGGR-0008 | encoding | xsd:string |

Attributes and attribute types constitute the semantic contract that permits heterogeneous measurements to coexist under a single governance schema. An attr such as confidence, dimension_kind, method, or recorded_at is not merely a column label; it declares what is being asserted about an entity and, through attr_type, which XSD-constrained interpretation applies at ingestion and query time. Typed value partitioning enforces that contract in operation: decimal assertions (0.712 and 0.690 confidence on AGGR-0001, 778.10 and 155.63 on related entities) land only where xsd:decimal is declared, while recorded_at instances—2023-06-08T14:00:36 through 2024-12-13T14:33:07 across the four aggregation entities—are stored under xsd:dateTime discipline, and lexical miscellany such as Dimension Kind 01, Encoding 02, intake form, and es occupy varchar-backed slots. The attr_type therefore governs validation, index strategy, and comparability; mis-typing a temporal stamp as a string or a confidence ratio as unconstrained text silently corrupts downstream policy evaluation.

**t_aggregation_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AGGR-0001 | AGGR-0001 | AGGR-0004 | 2023-06-08T14:00:36 |
| AGGR-0002 | AGGR-0002 | AGGR-0004 | 2024-12-13T14:33:07 |
| AGGR-0003 | AGGR-0003 | AGGR-0004 | 2023-10-30T03:55:23 |
| AGGR-0004 | AGGR-0004 | AGGR-0004 | 2023-08-23T20:37:20 |
| AGGR-0005 | AGGR-0005 | AGGR-0004 | 2023-04-27T16:41:49 |
| AGGR-0006 | AGGR-0006 | AGGR-0004 | 2024-07-14T23:19:51 |

**t_aggregation_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AGGR-0001 | AGGR-0001 | AGGR-0001 | 0.712 |
| AGGR-0002 | AGGR-0001 | AGGR-0005 | 778.10 |
| AGGR-0003 | AGGR-0001 | AGGR-0007 | 155.63 |
| AGGR-0004 | AGGR-0002 | AGGR-0001 | 0.690 |
| AGGR-0005 | AGGR-0002 | AGGR-0005 | 670.79 |
| AGGR-0006 | AGGR-0002 | AGGR-0007 | 377.50 |
| AGGR-0007 | AGGR-0003 | AGGR-0001 | 0.383 |
| AGGR-0008 | AGGR-0003 | AGGR-0005 | 911.00 |

**t_aggregation_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AGGR-0001 | AGGR-0001 | AGGR-0002 | Dimension Kind 01 |
| AGGR-0002 | AGGR-0001 | AGGR-0008 | Encoding 02 |
| AGGR-0003 | AGGR-0001 | AGGR-0009 | intake form |
| AGGR-0004 | AGGR-0001 | AGGR-0010 | es |
| AGGR-0005 | AGGR-0001 | AGGR-0003 | hybrid |
| AGGR-0006 | AGGR-0001 | AGGR-0006 | ratio |
| AGGR-0007 | AGGR-0002 | AGGR-0002 | Dimension Kind 07 |
| AGGR-0008 | AGGR-0002 | AGGR-0008 | Encoding 08 |

Aggregation programs sit at the intersection of business cadence and technical provenance, translating raw signals into governed summaries whose evidentiary character depends on the attribute fabric described above. Daily telemetry summary, Annual inventory rollup, Quarterly revenue consolidation, and Weekly sensor fusion are not interchangeable rollups; each implies distinct freshness requirements, dimensional semantics, and method declarations that must be recoverable from the entity–attribute graph at audit time. When recorded_at uniformly references attr AGGR-0004 across AGGR-0001 through AGGR-0004, the model exposes a deliberate design choice: temporal provenance is normalized to a single attribute definition while entity scope differentiates which rollup instance the timestamp certifies. Likewise, repeated confidence measurements tied to AGGR-0001 illustrate how a single entity may accumulate multiple quantitative attestations as ingestion cycles complete, each row preserving entity_id and attr_id so that lineage remains reconstructible even when misc-valued fields (the literal measurements) vary.

eBPF program governance treats bytecode artifacts as versioned, size-bounded assets whose operational risk scales with footprint and revision churn. The ebpfprogram key POLI-0001, POLI-0003, and POLI-0005 in the factual layer map to dimensional records carrying human-oriented misc labels—Ebpfprogram Label 01 through Ebpfprogram Label 04—and category assignments that partition the fleet into Ebpfprogram Category 01 through Ebpfprogram Category 04 for policy routing and exception handling. Size_bytes entries ranging from 113,209,263 to 784,335,640 bytes and version numbers 9, 11, and 12 materialize concrete compliance triggers: capacity planning thresholds, binary diff scope during upgrades, and compatibility gates between loader expectations and deployed object code. Category, in this register, is not decorative taxonomy; it determines which control baselines, attestation requirements, and retirement schedules apply before a program may attach to a production hook point.

**fact_ebpfprogram**

| id | ebpfprogram_key | size_bytes | version |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | 784335640 | 12 |
| POLI-0002 | POLI-0003 | 641704069 | 9 |
| POLI-0003 | POLI-0003 | 113209263 | 11 |
| POLI-0004 | POLI-0005 | 161013093 | 12 |
| POLI-0005 | POLI-0004 | 352203820 | 12 |
| POLI-0006 | POLI-0003 | 167519051 | 1 |

**dim_ebpfprogram**

| id | ebpfprogram_label | ebpfprogram_category |
| --- | --- | --- |
| POLI-0001 | Ebpfprogram Label 01 | Ebpfprogram Category 01 |
| POLI-0002 | Ebpfprogram Label 02 | Ebpfprogram Category 02 |
| POLI-0003 | Ebpfprogram Label 03 | Ebpfprogram Category 03 |
| POLI-0004 | Ebpfprogram Label 04 | Ebpfprogram Category 04 |
| POLI-0005 | Ebpfprogram Label 05 | Ebpfprogram Category 05 |
| POLI-0006 | Ebpfprogram Label 06 | Ebpfprogram Category 06 |
| POLI-0007 | Ebpfprogram Label 07 | Ebpfprogram Category 07 |
| POLI-0008 | Ebpfprogram Label 08 | Ebpfprogram Category 08 |

Attached programs represent the execution surface where eBPF artifacts—or allied kernel modules—become live instrumentation, and their governance parallels the eBPF dimension while emphasizing attachment topology and hook cardinality. fact_kernelhook rows associate attached_program_key values such as PROG-0006, PROG-0004, and PROG-0001 with measurable size_bytes (from 36,342,735 to 560,962,979) and version tuples (1, 3, 10) that must be reconciled against the ebpfprogram inventory to detect drift, unauthorized substitution, or stale deployments. Dimensional misc labels—Attached Program Label 01 through Attached Program Label 04—paired with Attached Program Category 01 through Attached Program Category 04 supply the operational vocabulary auditors and on-call engineers share when correlating hook failures with policy class. The recurrence of PROG-0001 across multiple hook facts signals many-to-one attachment patterns that compliance reviews must explicitly authorize, since duplicate attachment without documented justification increases attack surface and complicates rollback.

**fact_kernelhook**

| id | attached_program_key | size_bytes | version |
| --- | --- | --- | --- |
| PROG-0001 | PROG-0006 | 36342735 | 3 |
| PROG-0002 | PROG-0004 | 560962979 | 1 |
| PROG-0003 | PROG-0001 | 456299832 | 10 |
| PROG-0004 | PROG-0001 | 272822846 | 1 |

Identifier integrity, typed attributes, categorical partitioning, byte accounting, and version discipline converge into a single evidentiary posture: every aggregation outcome, every deployed eBPF object, and every attached program instance must be traceable from misc-valued observations back through entity and attr bindings to a stable key that survives organizational turnover and toolchain migration. Version and size_bytes function as dual sentinels—version captures intentional change events, size_bytes captures accidental or malicious binary expansion—while category and attr_type bound the interpretive frame within which those sentinels alarm or clear. Programs that cannot demonstrate consistent identifier joins across valuation, fact, and dimension layers fail operational readiness review regardless of nominal functional correctness, because governance frameworks of this class are devised for technology assessment and continuous attestation without regard to transient product branding or undocumented deployment shortcuts.

**dim_attached_program**

| id | attached_program_label | attached_program_category |
| --- | --- | --- |
| PROG-0001 | Attached Program Label 01 | Attached Program Category 01 |
| PROG-0002 | Attached Program Label 02 | Attached Program Category 02 |
| PROG-0003 | Attached Program Label 03 | Attached Program Category 03 |
| PROG-0004 | Attached Program Label 04 | Attached Program Category 04 |
| PROG-0005 | Attached Program Label 05 | Attached Program Category 05 |
| PROG-0006 | Attached Program Label 06 | Attached Program Category 06 |