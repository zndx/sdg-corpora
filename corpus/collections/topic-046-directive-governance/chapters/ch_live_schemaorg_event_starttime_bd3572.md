---
chapter_id: ch_live_schemaorg_event_starttime_bd3572
topic_id: 46
family: 07_long_tail
cited_terms: ['schemaorg_event_starttime', 'trace_with_root_span', 'constraint_basic']
model: engine-refine
---

In distributed tracing and schema management, every entity requires a stable identifier to serve as the primary key for joins, lookups, and audit trails. Records in the schemaorg fact table carry identifiers such as `STAR-0001` through `STAR-0004`, while trace records use a parallel scheme with values like `SPAN-0001` through `SPAN-0004`. Constraint definitions follow the same pattern with identifiers like `CONS-0001`. These identifiers are not merely labels; they anchor the relational structure by enabling foreign-key references that connect dimensional metadata to operational facts. For instance, a schemaorg record with identifier `STAR-0001` references event start time key `STAR-0005`, while a trace record `SPAN-0001` points to root span key `SPAN-0002`, establishing the navigable graph between events and their parent spans.

**fact_schemaorg**

| id | event_start_time_key | size_bytes | version |
| --- | --- | --- | --- |
| STAR-0001 | STAR-0005 | 895265030 | 3 |
| STAR-0002 | STAR-0003 | 114301972 | 5 |
| STAR-0003 | STAR-0001 | 338701831 | 4 |
| STAR-0004 | STAR-0001 | 998785819 | 8 |

**t_constraint_basic**

| id | constraint | enforcement | label_text |
| --- | --- | --- | --- |
| CONS-0001 | ENCRYPTION_AES256 | blocking | nightly summary |
| CONS-0002 | UNIQUE_EMAIL | blocking | intake form |
| CONS-0003 | PACKET_SIZE_MAX_1500 | mandatory | intake form |
| CONS-0004 | MAX_LENGTH_255 | blocking | pre-release note |
| CONS-0005 | MAX_LENGTH_255 | advisory | calibration record |
| CONS-0006 | CHECK_AGE_POSITIVE | advisory | change rationale |
| CONS-0007 | NOT_NULL | mandatory | change rationale |

Event start times and root spans function as dimensional hierarchies that classify operational activity through categorical and descriptive attributes. Each event start time carries both a category—such as `Event Start Time Category 01`—and a human-readable label like `Event Start Time Label 01`, allowing analysts to filter and aggregate by business context rather than raw timestamps. Similarly, root spans are classified under categories like `Root Span Category 01` with corresponding labels such as `Root Span Label 02`, providing a structured taxonomy for tracing the origin of distributed operations. The `misc` column in these dimension tables holds the human-readable labels that bridge technical identifiers to operational understanding, enabling dashboards and reports to display meaningful descriptions alongside machine-readable keys.

**dim_event_start_time**

| id | event_start_time_label | event_start_time_category |
| --- | --- | --- |
| STAR-0001 | Event Start Time Label 01 | Event Start Time Category 01 |
| STAR-0002 | Event Start Time Label 02 | Event Start Time Category 02 |
| STAR-0003 | Event Start Time Label 03 | Event Start Time Category 03 |
| STAR-0004 | Event Start Time Label 04 | Event Start Time Category 04 |
| STAR-0005 | Event Start Time Label 05 | Event Start Time Category 05 |
| STAR-0006 | Event Start Time Label 06 | Event Start Time Category 06 |

**dim_root_span**

| id | root_span_label | root_span_category |
| --- | --- | --- |
| SPAN-0001 | Root Span Label 01 | Root Span Category 01 |
| SPAN-0002 | Root Span Label 02 | Root Span Category 02 |
| SPAN-0003 | Root Span Label 03 | Root Span Category 03 |
| SPAN-0004 | Root Span Label 04 | Root Span Category 04 |
| SPAN-0005 | Root Span Label 05 | Root Span Category 05 |
| SPAN-0006 | Root Span Label 06 | Root Span Category 06 |

Data volume and versioning are tracked through `size_bytes` and `version` columns across the fact tables, forming the basis for capacity planning and change management. Schemaorg records range from approximately 114 MB (`STAR-0002` at 114,301,972 bytes) to nearly 999 MB (`STAR-0004` at 998,785,819 bytes), while trace records span from 70 MB (`SPAN-0003`) to 941 MB (`SPAN-0002`). These size measurements, paired with version numbers that range from 3 to 12 in the observed data, allow operators to monitor growth trends, detect anomalies, and ensure that downstream consumers are processing the correct iteration of each record. When a schemaorg record with identifier `STAR-0001` carries version 3 and a trace record `SPAN-0001` carries version 12, the version field becomes the authoritative indicator of which data lineage is active.

**fact_trace**

| id | root_span_key | size_bytes | version |
| --- | --- | --- | --- |
| SPAN-0001 | SPAN-0002 | 475324433 | 12 |
| SPAN-0002 | SPAN-0004 | 941223628 | 8 |
| SPAN-0003 | SPAN-0005 | 70626790 | 12 |
| SPAN-0004 | SPAN-0005 | 953122943 | 4 |

Governance and compliance are enforced through constraint definitions that specify both the rule and its enforcement mode. The constraint table captures policies such as `ENCRYPTION_AES256`, `UNIQUE_EMAIL`, `PACKET_SIZE_MAX_1500`, and `MAX_LENGTH_255`, each paired with an enforcement classification—either `blocking` or `mandatory`. A blocking enforcement means the constraint prevents non-compliant operations from proceeding, while mandatory enforcement requires compliance without necessarily halting the pipeline. These constraints are further annotated with `label_text` values like `nightly summary`, `intake form`, and `pre-release note`, which provide operational context for why a given rule exists and which workflow it protects. Together, enforcement mode and label text form a governance layer that makes policy decisions auditable and traceable to specific business processes.