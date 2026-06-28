---
chapter_id: ch_live_ebpfprogram_governed_by_security_policy_76e315
topic_id: 44
family: 04_ebpf_kernel
cited_terms: ['ebpfprogram_governed_by_security_policy', 'training_partnership_development', 'trace_with_root_span']
model: engine-refine
---

In distributed observability and systems telemetry, the tracking of execution artifacts demands a disciplined separation between dimensional metadata and quantitative measurements. eBPF programs and distributed traces represent two such artifact classes, each captured through a star-schema pairing of fact and dimension tables. The eBPF program fact table records the measurable properties of individual programs—specifically their size in bytes and version number—while the corresponding dimension table supplies categorical classification and human-readable labels. An eBPF program identified as POLI-0001 carries a label of Ebpfprogram Label 01 and falls under Ebpfprogram Category 01, yet its fact record reveals a compiled footprint of 784,335,640 bytes at version 12. The same program key POLI-0003 appears across two distinct fact rows, suggesting either repeated instrumentation events or versioned snapshots, with sizes of 113,209,263 bytes at version 11 and a separate measurement of 641,704,069 bytes at version 9. This multiplicity of fact records per program key is a structural pattern that also obtains in the trace domain, where root span SPAN-0005 is referenced by two separate fact entries bearing versions 12 and 4 respectively, and sizes of 70,626,790 and 953,122,943 bytes.

The dimension tables for both eBPF programs and root spans serve as the categorical anchor for their respective fact tables. Each dimension record carries an identifier that functions as the join key, a misc column containing a descriptive label, and a category column that assigns the artifact to a classification bucket. For root spans, the dimension table maps identifiers such as SPAN-0001 through SPAN-0004 to labels like Root Span Label 01 and categories such as Root Span Category 01. The fact table then references these identifiers through a root_span_key column, establishing a foreign-key relationship that allows quantitative trace data—size in bytes and version—to be enriched with categorical context at query time. This same relational pattern governs the eBPF program domain, where the fact table's ebpfprogram_key column points to the dimension table's id, enabling analysts to aggregate program sizes by category or track version distributions across labeled groups.

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

**fact_trace**

| id | root_span_key | size_bytes | version |
| --- | --- | --- | --- |
| SPAN-0001 | SPAN-0002 | 475324433 | 12 |
| SPAN-0002 | SPAN-0004 | 941223628 | 8 |
| SPAN-0003 | SPAN-0005 | 70626790 | 12 |
| SPAN-0004 | SPAN-0005 | 953122943 | 4 |

**dim_root_span**

| id | root_span_label | root_span_category |
| --- | --- | --- |
| SPAN-0001 | Root Span Label 01 | Root Span Category 01 |
| SPAN-0002 | Root Span Label 02 | Root Span Category 02 |
| SPAN-0003 | Root Span Label 03 | Root Span Category 03 |
| SPAN-0004 | Root Span Label 04 | Root Span Category 04 |
| SPAN-0005 | Root Span Label 05 | Root Span Category 05 |
| SPAN-0006 | Root Span Label 06 | Root Span Category 06 |

Beyond systems-level telemetry, the dataset also encompasses a training and partnership development dimension that operates on a different relational model. The training partnership development table records collaborative initiatives such as the Advanced Analytics Cohort, the Machine Learning Track, the Biostatistics Collaboration, and the Engineering Mentorship Program. Each initiative is associated with a participant drawn from an educational institution or organizational unit—entities identified as Clinical Preceptor Team, Elena Rostova, Research Associate Kim, and Industry Liaison Office. This table does not follow the fact-dimension star schema; instead, it presents a flat relational structure where the identifier column (DEVE-0001 through DEVE-0004) serves as the primary key and the has_participant column directly encodes the institutional relationship. The educationalinstitution concept here bridges academic and clinical training ecosystems, suggesting that the partnership development data is intended to support governance reporting on institutional collaboration rather than performance measurement.

**t_training_partnership_development**

| id | training_partnership_development | has_participant |
| --- | --- | --- |
| DEVE-0001 | Advanced Analytics Cohort | Clinical Preceptor Team |
| DEVE-0002 | Machine Learning Track | Elena Rostova |
| DEVE-0003 | Biostatistics Collaboration | Research Associate Kim |
| DEVE-0004 | Engineering Mentorship Program | Industry Liaison Office |
| DEVE-0005 | Engineering Mentorship Program | Industry Liaison Office |
| DEVE-0006 | Data Governance Workshop | Research Associate Kim |
| DEVE-0007 | Research Methods Alliance | Elena Rostova |
| DEVE-0008 | Machine Learning Track | Elena Rostova |

The consistent use of size_bytes as a quantitative measure across both the eBPF program and trace fact tables underscores a common operational concern: the monitoring of artifact footprint as a proxy for resource consumption, deployment complexity, or performance impact. In the eBPF domain, sizes range from approximately 113 million bytes for program POLI-0003 to nearly 785 million bytes for POLI-0001, while trace root spans exhibit an even wider spread, from 70 million bytes for SPAN-0003 to over 953 million bytes for SPAN-0005. The version column, present in both fact tables, provides a temporal or release-tracking dimension that, when joined to the respective dimension tables, allows analysts to correlate artifact size with categorical classification and version state. This relational architecture—where identifiers serve as the universal join currency, categories enable aggregation, misc labels provide human interpretability, and size_bytes and version carry the quantitative signal—forms the backbone of a governance framework capable of supporting both operational monitoring and strategic partnership oversight.