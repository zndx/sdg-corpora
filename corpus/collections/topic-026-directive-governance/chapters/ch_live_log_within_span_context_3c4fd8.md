---
chapter_id: ch_live_log_within_span_context_3c4fd8
topic_id: 26
family: 07_long_tail
cited_terms: ['log_within_span_context', 'outlier_claim_supported_by', 'ebpfprogram_observes_syscall']
model: engine-refine
---

When tracking system behavior across distributed environments, every observation must be anchored to a unique identifier that persists across logging, analysis, and reporting layers. Identifiers such as CONT-0001 or SYSC-0001 serve as the immutable keys that allow disparate data sources—cache-eviction.out, audit_syscall, user-session-4492—to be correlated without ambiguity. These identifiers are not merely labels; they are the connective tissue that enables a log file to be traced through its span context, an eBPF program to be linked to the syscalls it observes, and an outlier measurement to be tied to its supporting evidence. Without such disciplined identification, the audit trail fractures and causal reasoning becomes impossible.

**t_log_within_span_context**

| id | log |
| --- | --- |
| CONT-0001 | cache-eviction.out |
| CONT-0002 | batch-scheduler.log |
| CONT-0003 | disk-io.trace |
| CONT-0004 | disk-io.trace |
| CONT-0005 | disk-io.trace |
| CONT-0006 | auth-service.warn |

**t_log_within_span_context_within_span_context**

| id | within_span_context |
| --- | --- |
| CONT-0001 | user-session-4492 |
| CONT-0002 | us-east-1-cluster |
| CONT-0003 | ml-inference-run |
| CONT-0004 | warehouse-replication |
| CONT-0005 | warehouse-replication |
| CONT-0006 | us-east-1-cluster |
| CONT-0007 | warehouse-replication |

**t_ebpfprogram_observes_syscall**

| id | ebpfprogram |
| --- | --- |
| SYSC-0001 | audit_syscall |
| SYSC-0002 | track_memory |
| SYSC-0003 | log_dns_query |
| SYSC-0004 | trace_execve |
| SYSC-0005 | profile_latency |
| SYSC-0006 | netsec_probe |

**t_ebpfprogram_observes_syscall_observes_syscall**

| id | observes_syscall |
| --- | --- |
| SYSC-0001 | openat |
| SYSC-0002 | connect |
| SYSC-0003 | statx |
| SYSC-0004 | socket |
| SYSC-0005 | clone |
| SYSC-0006 | sendmsg |
| SYSC-0007 | execve |

The relationships between entities are expressed through subject-target pairs, where the subject denotes the originating entity and the target denotes the entity being acted upon or observed. A log file like batch-scheduler.log may have a contributor role in the warehouse-replication context, while the same log might also be reviewed by a different party within a user-session-4492 span. Similarly, the eBPF program track_memory functions as an observer of the socket syscall, whereas audit_syscall assumes the role of owner over openat. The role field captures the nature of this relationship—whether the subject is contributing data, observing behavior, or exercising ownership—and this distinction is critical for governance, because it determines who is accountable for the accuracy and timeliness of each observation.

**t_log_within_span_context__within_span_context**

| id | log_id | within_span_context_id | role |
| --- | --- | --- | --- |
| CONT-0001 | CONT-0006 | CONT-0003 | reviewer |
| CONT-0002 | CONT-0005 | CONT-0004 | observer |
| CONT-0003 | CONT-0004 | CONT-0004 | contributor |
| CONT-0004 | CONT-0004 | CONT-0004 | contributor |
| CONT-0005 | CONT-0005 | CONT-0003 | observer |
| CONT-0006 | CONT-0004 | CONT-0006 | contributor |
| CONT-0007 | CONT-0004 | CONT-0005 | observer |
| CONT-0008 | CONT-0002 | CONT-0005 | reviewer |

**t_ebpfprogram_observes_syscall__observes_syscall**

| id | ebpfprogram_id | observes_syscall_id | role |
| --- | --- | --- | --- |
| SYSC-0001 | SYSC-0001 | SYSC-0004 | contributor |
| SYSC-0002 | SYSC-0003 | SYSC-0001 | owner |
| SYSC-0003 | SYSC-0002 | SYSC-0005 | observer |
| SYSC-0004 | SYSC-0002 | SYSC-0006 | contributor |
| SYSC-0005 | SYSC-0002 | SYSC-0006 | observer |
| SYSC-0006 | SYSC-0002 | SYSC-0004 | observer |
| SYSC-0007 | SYSC-0002 | SYSC-0004 | reviewer |
| SYSC-0008 | SYSC-0001 | SYSC-0001 | contributor |

Every analytical claim rests on a support structure that can be independently verified. The supported_by column in the outlier fact table points to a reference record in the dimension table, creating a chain of evidence that can be audited. For instance, the outlier measurement with value 453.93 is supported by SUPP-0006, which itself carries the label Supported By Label 01 and belongs to category Supported By Category 01. This indirection allows support relationships to be classified and filtered by category, enabling analysts to isolate evidence from a particular domain or trust tier. The misc column captures supplementary attributes—human-readable labels, numeric measurements, or trace identifiers—that do not fit neatly into the structural schema but are essential for interpretation.

**fact_outlier**

| id | supported_by_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| SUPP-0001 | SUPP-0006 | 0.877 | 516.58 | 453.93 |
| SUPP-0002 | SUPP-0002 | 0.147 | 368.22 | 510.05 |
| SUPP-0003 | SUPP-0001 | 0.792 | 10.24 | 369.89 |
| SUPP-0004 | SUPP-0003 | 0.479 | 719.33 | 757.32 |
| SUPP-0005 | SUPP-0003 | 0.986 | 245.64 | 972.07 |
| SUPP-0006 | SUPP-0004 | 0.386 | 5.02 | 16.62 |
| SUPP-0007 | SUPP-0003 | 0.047 | 979.09 | 828.93 |

**dim_supported_by**

| id | supported_by_label | supported_by_category |
| --- | --- | --- |
| SUPP-0001 | Supported By Label 01 | Supported By Category 01 |
| SUPP-0002 | Supported By Label 02 | Supported By Category 02 |
| SUPP-0003 | Supported By Label 03 | Supported By Category 03 |
| SUPP-0004 | Supported By Label 04 | Supported By Category 04 |
| SUPP-0005 | Supported By Label 05 | Supported By Category 05 |
| SUPP-0006 | Supported By Label 06 | Supported By Category 06 |

Confidence and uncertainty quantify the reliability of each observation, forming a dual lens through which analysts assess risk. Confidence values range from 0.147 to 0.877, reflecting the degree of certainty that a given measurement or classification is correct. The corresponding uncertainty values—516.58, 368.22, 10.24, 719.33—express the magnitude of potential deviation in absolute terms. A record with confidence 0.877 and uncertainty 516.58 suggests a high-probability assessment with substantial absolute variance, while a record with confidence 0.147 and uncertainty 368.22 indicates both low certainty and significant potential error. Together, these metrics allow operators to triage alerts, prioritize investigations, and calibrate automated responses based on the actual reliability of the underlying data rather than treating all observations as equally trustworthy.