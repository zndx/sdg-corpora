---
chapter_id: ch_live_control_at_severity_dfb0ef
topic_id: 65
family: 03_directive_governance
cited_terms: ['control_at_severity', 'ebpfevent_observes_syscall_xref', 'profiling_produces_profile']
model: engine-refine
---

Operational observability within the governed data fabric rests upon a dimensional architecture that separates transient execution metrics from stable descriptive attributes. Each record is anchored by a surrogate identifier—SEVE-0001 through SEVE-0004 in the control registry, XREF-0001 through XREF-0004 in the event fact, and PROF-0001 through PROF-0004 in the profiling fact—ensuring referential integrity across the star schema. The fact tables, fact_ebpfevent and fact_profiling, capture the quantitative essence of system behavior: duration_seconds records the elapsed wall-clock time of an operation, ranging from 889.87 seconds for event XREF-0001 to 6716.87 seconds for profiling entry PROF-0001, while exit_code documents the terminal status of the process, with values such as 988, 313, 278, and 158 in the event fact and 725, 809, 348, and 827 in the profiling fact. The retry_count column quantifies resilience pressure, measuring how many times a failed operation was retried before final disposition; values span from 38 retries for event XREF-0004 to 427 retries for event XREF-0002, and from 186 to 303 in the profiling dimension, each figure serving as a diagnostic signal for downstream capacity planning and fault-tolerance tuning.

**fact_ebpfevent**

| id | ebpfevent_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| XREF-0001 | XREF-0003 | 889.87 | 988 | 278 |
| XREF-0002 | XREF-0005 | 1832.41 | 313 | 427 |
| XREF-0003 | XREF-0001 | 3410.73 | 278 | 133 |
| XREF-0004 | XREF-0005 | 5696.76 | 158 | 38 |
| XREF-0005 | XREF-0005 | 4846.66 | 7 | 455 |
| XREF-0006 | XREF-0004 | 4215.38 | 52 | 460 |
| XREF-0007 | XREF-0006 | 653.90 | 100 | 108 |
| XREF-0008 | XREF-0005 | 2673.38 | 169 | 73 |

**fact_profiling**

| id | produces_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| PROF-0001 | PROF-0001 | 6716.87 | 725 | 209 |
| PROF-0002 | PROF-0004 | 1113.38 | 809 | 186 |
| PROF-0003 | PROF-0004 | 2546.61 | 348 | 303 |
| PROF-0004 | PROF-0006 | 2074.93 | 827 | 264 |

The dimension tables—dim_ebpfevent and dim_produces—supply the categorical and descriptive context that transforms raw numeric observations into actionable intelligence. Each dimension row carries an ebpfevent_label or produces_label, respectively, functioning as the misc attribute: human-readable descriptors such as Ebpfevent Label 01 or Produces Label 03 that appear in reports and dashboards. The ebpfevent_category and produces_category columns provide the classification layer, grouping events into Ebpfevent Category 01 through 04 and Produces Category 01 through 04, enabling aggregation by functional domain and supporting roll-up queries that summarize performance across logical groupings. The foreign-key linkage between fact and dimension tables—fact_ebpfevent.ebpfevent_key referencing dim_ebpfevent.id, and fact_profiling.produces_key referencing dim_produces.id—ensures that every duration measurement, exit code, and retry count can be traced back to its semantic category and label without ambiguity.

**dim_ebpfevent**

| id | ebpfevent_label | ebpfevent_category |
| --- | --- | --- |
| XREF-0001 | Ebpfevent Label 01 | Ebpfevent Category 01 |
| XREF-0002 | Ebpfevent Label 02 | Ebpfevent Category 02 |
| XREF-0003 | Ebpfevent Label 03 | Ebpfevent Category 03 |
| XREF-0004 | Ebpfevent Label 04 | Ebpfevent Category 04 |
| XREF-0005 | Ebpfevent Label 05 | Ebpfevent Category 05 |
| XREF-0006 | Ebpfevent Label 06 | Ebpfevent Category 06 |

**dim_produces**

| id | produces_label | produces_category |
| --- | --- | --- |
| PROF-0001 | Produces Label 01 | Produces Category 01 |
| PROF-0002 | Produces Label 02 | Produces Category 02 |
| PROF-0003 | Produces Label 03 | Produces Category 03 |
| PROF-0004 | Produces Label 04 | Produces Category 04 |
| PROF-0005 | Produces Label 05 | Produces Category 05 |
| PROF-0006 | Produces Label 06 | Produces Category 06 |

Governance controls are codified in the t_control_at_severity table, which maps each compliance requirement to a structured identifier and a set of operational parameters. The control column carries the policy description—Log retention 90 days, Rate limiting API, Access review quarterly, Network segmentation east-west—while at_severity assigns a risk posture of Low, Elevated, or Medium to each control. The encoding column specifies the character set in which the control documentation is stored, with values of latin1, unicode, and utf8 reflecting the heterogeneity of legacy and modern systems; language records the locale of the documentation, with de and ja appearing across the four control entries. These attributes do not participate in the event or profiling fact tables directly but serve as the reference layer against which operational metrics are audited, ensuring that every anomalous duration or elevated retry count can be evaluated against the severity posture of the governing control.

**t_control_at_severity**

| id | control | at_severity | encoding | language |
| --- | --- | --- | --- | --- |
| SEVE-0001 | Log retention 90 days | Low | latin1 | de |
| SEVE-0002 | Rate limiting API | Low | unicode | ja |
| SEVE-0003 | Access review quarterly | Elevated | unicode | de |
| SEVE-0004 | Network segmentation east-west | Medium | utf8 | de |
| SEVE-0005 | Network segmentation east-west | Negligible | latin1 | fr |
| SEVE-0006 | Backup verification daily | Elevated | latin1 | en |
| SEVE-0007 | PII masking pipeline | Critical Risk | unicode | ja |
| SEVE-0008 | Backup verification daily | Low | unicode | de |

The interplay between these tables forms a complete traceability chain. An event identified as XREF-0003 in fact_ebpfevent exhibits a duration of 3410.73 seconds, an exit code of 278, and 133 retries; its ebpfevent_key resolves to dim_ebpfevent row XREF-0003, which carries the label Ebpfevent Label 03 and category Ebpfevent Category 03. Similarly, profiling entry PROF-0004 records 2546.61 seconds of execution, exit code 348, and 303 retries, with produces_key pointing to dim_produces row PROF-0004 for the label Produces Label 04 and category Produces Category 04. The control table, meanwhile, provides the normative backdrop: a control such as SEVE-0003, classified at Elevated severity and documented in unicode under language de, would be the appropriate reference point when assessing whether the retry behavior of a given event falls within acceptable bounds. This separation of concerns—quantitative facts in the fact tables, qualitative descriptors in the dimension tables, and normative requirements in the control table—enables both granular root-cause analysis and high-level compliance reporting from a single, consistent data model.