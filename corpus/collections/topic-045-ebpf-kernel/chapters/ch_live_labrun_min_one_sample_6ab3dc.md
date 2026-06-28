---
chapter_id: ch_live_labrun_min_one_sample_6ab3dc
topic_id: 45
family: 02_observation_measurement
cited_terms: ['labrun_min_one_sample', 'kernelhook_only_kprobe', 'school_security_policy']
model: engine-refine
---

Governance and operational telemetry in regulated environments depend on a small set of compositional primitives that separate what a record *is* from what it *asserts*, *relates to*, and *must obey*. An **identifier** supplies the durable anchor: `SAMP-0001` through `SAMP-0004` name distinct laboratory sample executions, `POLI-0001` through `POLI-0004` name school security policies, and `KPRO-0001` through `KPRO-0004` name kernel instrumentation points. Once keyed, each **entity** becomes the locus of attributable fact. A sample entity may be bound to an experimental sequence (`SEQ-EXP-99`), a protocol revision (`PROTOCOL-V3`), or a cellular sequencing run (`CEL-SEQR-112`), while drawing its upstream material from kernel-probe inputs such as `KPRO-0003` and `KPRO-0006`. Policy entities, by contrast, name institutional programs—Cedar Ridge Preparatory, Westfield Middle School, Lincoln High School, Sunrise International School—whose evidentiary weight rests not on a single scalar reading but on how objectives, constraints, and typed metadata cohere over time.

**t_labrun_min_one_sample**

| id | labrun | input_sample |
| --- | --- | --- |
| SAMP-0001 | SEQ-EXP-99 | KPRO-0003 |
| SAMP-0002 | PROTOCOL-V3 | KPRO-0006 |
| SAMP-0003 | CEL-SEQR-112 | KPRO-0005 |
| SAMP-0004 | CEL-SEQR-112 | KPRO-0001 |
| SAMP-0005 | PCR-CYCLE-44 | KPRO-0003 |
| SAMP-0006 | METAB-ASSAY-Q2 | KPRO-0003 |

**t_labrun_min_one_sample_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SAMP-0001 | duration_seconds | xsd:decimal |
| SAMP-0002 | end_time | xsd:dateTime |
| SAMP-0003 | exit_code | xsd:integer |
| SAMP-0004 | host_name | xsd:string |
| SAMP-0005 | log_level | xsd:string |
| SAMP-0006 | phase | xsd:string |
| SAMP-0007 | retry_count | xsd:integer |
| SAMP-0008 | scheduled_at | xsd:dateTime |

**t_kernelhook_only_kprobe**

| id | kernelhook |
| --- | --- |
| KPRO-0001 | net_rx_action |
| KPRO-0002 | kfree |
| KPRO-0003 | vfs_read |
| KPRO-0004 | ext4_file_open |
| KPRO-0005 | kmalloc |
| KPRO-0006 | ip_rcv |

**t_school_security_policy_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| POLI-0001 | effective_date | xsd:date |
| POLI-0002 | enforcement | xsd:string |
| POLI-0003 | mandatory | xsd:boolean |
| POLI-0004 | priority | xsd:integer |
| POLI-0005 | review_cycle_days | xsd:integer |
| POLI-0006 | scope | xsd:string |
| POLI-0007 | encoding | xsd:string |
| POLI-0008 | label_text | xsd:string |

**Attr** and **attr_type** constitute the controlled vocabulary through which entities acquire inspectable properties without collapsing heterogeneous measurements into one undifferentiated store. Operational attributes on sample entities include `duration_seconds` (`xsd:decimal`), `end_time` (`xsd:dateTime`), `exit_code` (`xsd:integer`), and `host_name` (`xsd:string`); governance attributes on policy entities include `effective_date` (`xsd:date`), `enforcement` (`xsd:string`), `mandatory` (`xsd:boolean`), and `priority` (`xsd:integer`). The type declaration is not decorative: it routes each assertion to a validation surface and to a physical representation appropriate to its semantics. Durations such as `2021.10`, `4946.17`, `5150.87`, and `3275.26` tolerate fractional precision; completion stamps including `2024-08-01T16:02:07` and `2023-01-19T08:28:14` require temporal ordering logic; exit codes `230`, `435`, `670`, and `129` admit integer comparators; host labels `edge-03`, `Log Level 02`, `closeout`, and `complete` remain lexical. On the policy side, effective dates from `2023-05-09` to `2024-08-29` establish temporal jurisdiction, while the boolean `mandatory` differentiates Cedar Ridge’s binding posture (`true`) from Westfield, Lincoln, and Sunrise (`false`)—a distinction auditors treat as dispositive when assessing enforceability.

The **misc** slot, in practice, is the typed value carrier: the concrete datum recorded once an **entity** has been paired with an **attr** under a declared **attr_type**. Reuse of attribute identifiers across entities is deliberate and economical—`SAMP-0001` as an attribute key for `duration_seconds` appears on all four sample entities, and `POLI-0003` as the key for `mandatory` attaches uniformly across policies—so compliance queries can aggregate “all mandatory flags” or “all durations” without re-deriving schema. Multiplicity is equally important: `SAMP-0001` carries both an `end_time` and additional temporal readings keyed separately (`SAMP-0008`, `SAMP-0009`), and multiple exit-code observations (`SAMP-0003`, `SAMP-0007`) attach to one or two entities, modeling repeated instrumentation or staged termination. Policy **misc** values further encode operational nuance: priorities `2` and `982` on Cedar Ridge and Westfield, `312` on Sunrise, paired enforcement strings `Encoding 01`, `Enforcement 02`, `intake form`, and `ja` that do not reduce to the safety objective itself but specify *how* conformance is expressed, logged, or localized.

**t_labrun_min_one_sample_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SAMP-0001 | SAMP-0001 | SAMP-0002 | 2024-08-01T16:02:07 |
| SAMP-0002 | SAMP-0001 | SAMP-0008 | 2024-02-12T19:03:44 |
| SAMP-0003 | SAMP-0001 | SAMP-0009 | 2023-01-19T08:28:14 |
| SAMP-0004 | SAMP-0002 | SAMP-0002 | 2024-05-12T21:48:01 |
| SAMP-0005 | SAMP-0002 | SAMP-0008 | 2023-12-29T06:52:07 |
| SAMP-0006 | SAMP-0002 | SAMP-0009 | 2023-05-30T11:26:58 |
| SAMP-0007 | SAMP-0003 | SAMP-0002 | 2023-02-24T06:29:16 |
| SAMP-0008 | SAMP-0003 | SAMP-0008 | 2025-01-26T00:06:38 |

**t_labrun_min_one_sample_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SAMP-0001 | SAMP-0001 | SAMP-0001 | 2021.10 |
| SAMP-0002 | SAMP-0002 | SAMP-0001 | 4946.17 |
| SAMP-0003 | SAMP-0003 | SAMP-0001 | 5150.87 |
| SAMP-0004 | SAMP-0004 | SAMP-0001 | 3275.26 |
| SAMP-0005 | SAMP-0005 | SAMP-0001 | 3679.38 |
| SAMP-0006 | SAMP-0006 | SAMP-0001 | 2520.77 |

**t_labrun_min_one_sample_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SAMP-0001 | SAMP-0001 | SAMP-0003 | 230 |
| SAMP-0002 | SAMP-0001 | SAMP-0007 | 435 |
| SAMP-0003 | SAMP-0002 | SAMP-0003 | 670 |
| SAMP-0004 | SAMP-0002 | SAMP-0007 | 129 |
| SAMP-0005 | SAMP-0003 | SAMP-0003 | 152 |
| SAMP-0006 | SAMP-0003 | SAMP-0007 | 382 |
| SAMP-0007 | SAMP-0004 | SAMP-0003 | 442 |
| SAMP-0008 | SAMP-0004 | SAMP-0007 | 477 |

**t_labrun_min_one_sample_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SAMP-0001 | SAMP-0001 | SAMP-0004 | edge-03 |
| SAMP-0002 | SAMP-0001 | SAMP-0005 | Log Level 02 |
| SAMP-0003 | SAMP-0001 | SAMP-0006 | closeout |
| SAMP-0004 | SAMP-0001 | SAMP-0010 | complete |
| SAMP-0005 | SAMP-0001 | SAMP-0011 | Triggered By 05 |
| SAMP-0006 | SAMP-0002 | SAMP-0004 | gw-12 |
| SAMP-0007 | SAMP-0002 | SAMP-0005 | Log Level 07 |
| SAMP-0008 | SAMP-0002 | SAMP-0006 | execution |

School security governance introduces **schoolsecuritypolicy**, **safetyobjective**, and **constitutionalconstraint** as a tripartite accountability chain. Each policy entity declares a **safetyobjective** it is designed to advance—network intrusion detection for Cedar Ridge, unauthorized access prevention for Westfield, cyber threat intelligence for Lincoln and Sunrise—and simultaneously a **constitutionalconstraint** it **must_satisfy**, external normative bounds that cap permissible means regardless of technical efficacy. Cedar Ridge’s intrusion-detection program remains subordinate to OSHA workplace safety; Westfield’s access controls must respect a no-lethal-force rule; Lincoln’s intelligence posture cannot override ADA accessibility standards; Sunrise’s parallel intelligence objective must align with state education statutes. The pairing prevents a common failure mode in which operational targets are pursued in isolation: a detector that performs on the wire but violates workplace-safety duties, or an access regime that secures perimeter systems while excluding protected populations, fails constitutional review even when the **safetyobjective** metric improves. Effective dating and enforcement metadata then supply the audit trail that connects abstract obligation to institutional practice.

Relational semantics extend the model beyond unary entity–attribute assertions through **subject**, **target**, and **role**, which typed associations use to express directed participation without overloading scalar fields. Kernel-hook instrumentation illustrates the pattern: probe subjects such as `kfree`, `vfs_read`, and `ext4_file_open` link to hook-kind targets including `kprobe_perf`, `entry_kprobe`, and `kprobe_trace`, while **role** records whether a participant acts as `owner`, `contributor`, or `reviewer`. A single hook kind may therefore appear in multiple governed relationships—`kprobe_trace` associated as target with reviewer responsibility on one edge and contributor responsibility on another—mirroring how policy workflows separate authorship, implementation, and independent review. Laboratory lineage exhibits the same logic at the operational layer: sample entities reference kernel-probe inputs (`KPRO-0003`, `KPRO-0006`, `KPRO-0005`, `KPRO-0001`) as provenance **targets**, so downstream duration and exit-code readings remain traceable to the instrumentation context that produced them.

**t_kernelhook_only_kprobe_hook_kind**

| id | hook_kind |
| --- | --- |
| KPRO-0001 | kprobe_perf |
| KPRO-0002 | entry_kprobe |
| KPRO-0003 | kprobe_trace |
| KPRO-0004 | kprobe_trace |
| KPRO-0005 | bpf_kprobe |
| KPRO-0006 | multi_kprobe |
| KPRO-0007 | kprobe_fs |

**t_kernelhook_only_kprobe__hook_kind**

| id | kernelhook_id | hook_kind_id | role |
| --- | --- | --- | --- |
| KPRO-0001 | KPRO-0002 | KPRO-0005 | owner |
| KPRO-0002 | KPRO-0005 | KPRO-0005 | contributor |
| KPRO-0003 | KPRO-0004 | KPRO-0002 | reviewer |
| KPRO-0004 | KPRO-0006 | KPRO-0006 | contributor |
| KPRO-0005 | KPRO-0003 | KPRO-0006 | owner |
| KPRO-0006 | KPRO-0002 | KPRO-0004 | observer |
| KPRO-0007 | KPRO-0006 | KPRO-0003 | reviewer |
| KPRO-0008 | KPRO-0001 | KPRO-0006 | contributor |

Taken together, identifiers stabilize identity, entities bear typed assertions, attrs and attr_types govern what may be said and how it is stored, misc holds the evidentiary payload, and subject–target–role edges encode collaborative and lineage structure; schoolsecuritypolicy entities bind safetyobjectives to constitutionalconstraints that external law and institutional ethics impose. The architecture rewards queries that traverse layers: compare mandatory policies by priority, correlate abnormal exit codes with host_name dispersion, or verify that every cyber-threat-intelligence program names a constraint that state or federal law actually authorizes. Density of evidence—fractional runtimes beside ISO timestamps, asymmetric mandatory flags, duplicated intelligence objectives under divergent statutes—reflects production conditions rather than pedagogical tidiness, and it is precisely that heterogeneity the framework is built to absorb while preserving defensible, type-checked, and constitutionally bounded records suitable for operational review and regulatory attestation.

**t_school_security_policy**

| id | school_security_policy | targets | must_satisfy |
| --- | --- | --- | --- |
| POLI-0001 | Cedar Ridge Preparatory | Network intrusion detection | OSHA workplace safety |
| POLI-0002 | Westfield Middle School | Unauthorized access prevention | No lethal force rule |
| POLI-0003 | Lincoln High School | Cyber threat intelligence | ADA accessibility standards |
| POLI-0004 | Sunrise International School | Cyber threat intelligence | State education statutes |
| POLI-0005 | Northview Technical Institute | Emergency evacuation protocols | State education statutes |
| POLI-0006 | Cedar Ridge Preparatory | Visitor management compliance | ISO 27001 framework |
| POLI-0007 | Sunrise International School | Structural integrity monitoring | ADA accessibility standards |
| POLI-0008 | Jefferson STEM Academy | Network intrusion detection | No lethal force rule |

**t_school_security_policy_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0003 | true |
| POLI-0002 | POLI-0002 | POLI-0003 | false |
| POLI-0003 | POLI-0003 | POLI-0003 | false |
| POLI-0004 | POLI-0004 | POLI-0003 | false |
| POLI-0005 | POLI-0005 | POLI-0003 | true |
| POLI-0006 | POLI-0006 | POLI-0003 | true |
| POLI-0007 | POLI-0007 | POLI-0003 | true |
| POLI-0008 | POLI-0008 | POLI-0003 | false |

**t_school_security_policy_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0001 | 2023-05-09 |
| POLI-0002 | POLI-0002 | POLI-0001 | 2024-07-27 |
| POLI-0003 | POLI-0003 | POLI-0001 | 2023-12-11 |
| POLI-0004 | POLI-0004 | POLI-0001 | 2024-08-29 |
| POLI-0005 | POLI-0005 | POLI-0001 | 2024-05-03 |
| POLI-0006 | POLI-0006 | POLI-0001 | 2024-09-29 |
| POLI-0007 | POLI-0007 | POLI-0001 | 2024-11-04 |
| POLI-0008 | POLI-0008 | POLI-0001 | 2024-06-30 |

**t_school_security_policy_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0004 | 2 |
| POLI-0002 | POLI-0001 | POLI-0005 | 982 |
| POLI-0003 | POLI-0002 | POLI-0004 | 2 |
| POLI-0004 | POLI-0002 | POLI-0005 | 312 |
| POLI-0005 | POLI-0003 | POLI-0004 | 2 |
| POLI-0006 | POLI-0003 | POLI-0005 | 809 |
| POLI-0007 | POLI-0004 | POLI-0004 | 4 |
| POLI-0008 | POLI-0004 | POLI-0005 | 270 |

**t_school_security_policy_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0007 | Encoding 01 |
| POLI-0002 | POLI-0001 | POLI-0002 | Enforcement 02 |
| POLI-0003 | POLI-0001 | POLI-0008 | intake form |
| POLI-0004 | POLI-0001 | POLI-0009 | ja |
| POLI-0005 | POLI-0001 | POLI-0006 | Scope 05 |
| POLI-0006 | POLI-0002 | POLI-0007 | Encoding 06 |
| POLI-0007 | POLI-0002 | POLI-0002 | Enforcement 07 |
| POLI-0008 | POLI-0002 | POLI-0008 | pre-release note |