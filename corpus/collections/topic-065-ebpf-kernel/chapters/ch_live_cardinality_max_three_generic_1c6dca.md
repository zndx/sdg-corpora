---
chapter_id: ch_live_cardinality_max_three_generic_1c6dca
topic_id: 65
family: 01_foundation
cited_terms: ['cardinality_max_three_generic', 'evidence_basic', 'ebpfevent_observes_syscall_xref']
model: engine-refine
---

Event observability in operational telemetry rests upon a disciplined partitioning of identifiers, categorical metadata, and quantitative measurements into discrete relational artefacts. The primary event grain is captured in the fact table for ebpfevent records, where each row is anchored by a surrogate identifier such as XREF-0001 or XREF-0004 and carries a foreign-key reference—ebpfevent_key—pointing into a dimension catalogue of event labels and categories. The dimension table itself stores human-readable ebpfevent_label values like Ebpfevent Label 01 through Ebpfevent Label 04 alongside their corresponding ebpfevent_category assignments, enabling downstream reporting to group events by semantic class without duplicating descriptive text within the fact rows. This separation of concerns mirrors standard dimensional modelling practice: the fact table preserves numeric precision and referential integrity, while the dimension table absorbs textual variability and supports slow-changing attribute updates independently of event ingestion.

**dim_ebpfevent**

| id | ebpfevent_label | ebpfevent_category |
| --- | --- | --- |
| XREF-0001 | Ebpfevent Label 01 | Ebpfevent Category 01 |
| XREF-0002 | Ebpfevent Label 02 | Ebpfevent Category 02 |
| XREF-0003 | Ebpfevent Label 03 | Ebpfevent Category 03 |
| XREF-0004 | Ebpfevent Label 04 | Ebpfevent Category 04 |
| XREF-0005 | Ebpfevent Label 05 | Ebpfevent Category 05 |
| XREF-0006 | Ebpfevent Label 06 | Ebpfevent Category 06 |

The quantitative columns within the ebpfevent fact table encode three distinct operational signals. Duration seconds records the elapsed wall-clock time of each event, ranging from 889.87 seconds for XREF-0001 up to 5696.76 seconds for XREF-0004, providing a continuous measure of process latency that can be aggregated across categories or time windows. Exit code captures the terminal status of the event, with observed values such as 988, 313, 278, and 158; these non-zero integers typically indicate abnormal termination paths and serve as the primary discriminator between successful and failed executions in compliance audit trails. Retry count quantifies the number of re-attempt cycles before the event reached its final state, with values spanning from 38 retries for XREF-0004 to 427 retries for XREF-0002, offering a direct proxy for transient failure frequency and system resilience under load. Together, these three numeric columns form the core analytical triad for post-incident review, capacity planning, and service-level agreement verification.

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

Evidence artefacts that substantiate compliance posture are themselves modelled as a separate entity, each row identified by an evidence key such as EVID-0001 or EVID-0003 and annotated with a dimension_kind attribute that classifies the measurement domain—temperature, count, or pressure in the observed dataset. The evidence column carries descriptive content like Compliance checklist, Latency benchmark result, or Incident postmortem, while the encoding column specifies the character encoding scheme (ascii, latin1, or utf8) applied to the stored text, a detail that matters for cross-system interoperability and regulatory document retention. This encoding metadata, though seemingly peripheral, becomes critical when evidence records must be exchanged between heterogeneous platforms or archived in formats that mandate specific byte-level representations.

The cardinality table introduces a mapping layer that constrains how evidence identifiers relate to one another within bounded relationship groups. Each row carries a generic identifier—GENE-0001 through GENE-0004—and a cardinality descriptor such as capped-pair, bounded-triplet, single-bound, or max-three, which semantically communicates the maximum number of related evidence records permitted in that association. The related column holds the foreign-key reference to an evidence_basic identifier, with observed values including EVID-0006, EVID-0001, and EVID-0004, thereby enforcing referential integrity between the cardinality constraints and the evidence catalogue. This design pattern enables the system to express one-to-many and many-to-many relationships in a controlled fashion, where the cardinality label itself becomes queryable metadata that governs validation rules during evidence ingestion and audit.

**t_cardinality_max_three_generic**

| id | cardinality | related |
| --- | --- | --- |
| GENE-0001 | capped-pair | EVID-0006 |
| GENE-0002 | bounded-triplet | EVID-0001 |
| GENE-0003 | single-bound | EVID-0006 |
| GENE-0004 | max-three | EVID-0004 |
| GENE-0005 | limited-association | EVID-0004 |
| GENE-0006 | triple-cap | EVID-0001 |
| GENE-0007 | fixed-triple | EVID-0006 |
| GENE-0008 | capped-pair | EVID-0003 |

**t_evidence_basic**

| id | evidence | dimension_kind | encoding |
| --- | --- | --- | --- |
| EVID-0001 | Compliance checklist | temperature | ascii |
| EVID-0002 | Latency benchmark result | count | latin1 |
| EVID-0003 | Incident postmortem | temperature | utf8 |
| EVID-0004 | Compliance checklist | pressure | utf8 |
| EVID-0005 | Temperature spike alert | length | utf8 |
| EVID-0006 | Metric threshold breach | temperature | ascii |

From a governance perspective, the interplay between these tables establishes a traceable chain from raw event telemetry through categorical classification to evidentiary support. An ebpfevent fact row can be joined to its dimension record to determine the event category and label, while the cardinality mapping provides a mechanism to associate compliance evidence with specific event patterns or failure modes. The combination of duration, exit code, and retry count data enables the construction of risk scores that weight events by their operational impact and recovery complexity, and the dimension_kind and encoding attributes on evidence records ensure that supporting documentation can be classified, retrieved, and validated against regulatory requirements with byte-level fidelity.