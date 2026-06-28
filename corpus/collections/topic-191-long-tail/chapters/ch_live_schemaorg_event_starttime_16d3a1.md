---
chapter_id: ch_live_schemaorg_event_starttime_16d3a1
topic_id: 191
family: 07_long_tail
cited_terms: ['schemaorg_event_starttime', 'requirement_min_one_verification', 'strategic_planning_process']
model: engine-refine
---

Operational records are anchored by a standardized identifier that functions as the immutable primary key across all fact and dimension layers. Within the schemaorg fact table, each identifier—designated STAR-0001 through STAR-0004—correlates to a discrete event start time key, which anchors the record to a temporal dimension. This temporal linkage is paired with precise size bytes measurements, ranging from 114,301,972 to 895,265,030, ensuring storage allocation and throughput monitoring remain auditable. Concurrently, a version field (values 3, 4, 5, and 8) tracks iterative schema or payload revisions, enabling downstream consumers to distinguish between legacy snapshots and current operational states without ambiguity.

**fact_schemaorg**

| id | event_start_time_key | size_bytes | version |
| --- | --- | --- | --- |
| STAR-0001 | STAR-0005 | 895265030 | 3 |
| STAR-0002 | STAR-0003 | 114301972 | 5 |
| STAR-0003 | STAR-0001 | 338701831 | 4 |
| STAR-0004 | STAR-0001 | 998785819 | 8 |

Dimensional classification relies on a dual-axis taxonomy of category and misc fields, which together enforce consistent business vocabulary across distributed datasets. The event start time dimension maps each temporal key to a descriptive label (e.g., Event Start Time Label 01) and a corresponding category (Event Start Time Category 01), establishing a controlled vocabulary for scheduling and compliance reporting. Similarly, strategic operations are routed through targets business division and produces planning artifact dimensions, where identifiers such as PROC-0001 and PROC-0002 resolve to standardized labels and categories. This hierarchical labeling prevents semantic drift and ensures that cross-functional reporting aligns with enterprise governance frameworks.

**dim_event_start_time**

| id | event_start_time_label | event_start_time_category |
| --- | --- | --- |
| STAR-0001 | Event Start Time Label 01 | Event Start Time Category 01 |
| STAR-0002 | Event Start Time Label 02 | Event Start Time Category 02 |
| STAR-0003 | Event Start Time Label 03 | Event Start Time Category 03 |
| STAR-0004 | Event Start Time Label 04 | Event Start Time Category 04 |
| STAR-0005 | Event Start Time Label 05 | Event Start Time Category 05 |
| STAR-0006 | Event Start Time Label 06 | Event Start Time Category 06 |

**fact_strategic**

| id | targets_business_division_key | produces_planning_artifact_key | event_count |
| --- | --- | --- | --- |
| PROC-0001 | PROC-0005 | PROC-0005 | 388 |
| PROC-0002 | PROC-0001 | PROC-0002 | 352 |
| PROC-0003 | PROC-0005 | PROC-0002 | 320 |
| PROC-0004 | PROC-0001 | PROC-0001 | 123 |
| PROC-0005 | PROC-0003 | PROC-0003 | 268 |
| PROC-0006 | PROC-0005 | PROC-0004 | 27 |
| PROC-0007 | PROC-0001 | PROC-0004 | 70 |

**dim_targets_business_division**

| id | targets_business_division_label | targets_business_division_category |
| --- | --- | --- |
| PROC-0001 | Targets Business Division Label 01 | Targets Business Division Category 01 |
| PROC-0002 | Targets Business Division Label 02 | Targets Business Division Category 02 |
| PROC-0003 | Targets Business Division Label 03 | Targets Business Division Category 03 |
| PROC-0004 | Targets Business Division Label 04 | Targets Business Division Category 04 |
| PROC-0005 | Targets Business Division Label 05 | Targets Business Division Category 05 |
| PROC-0006 | Targets Business Division Label 06 | Targets Business Division Category 06 |
| PROC-0007 | Targets Business Division Label 07 | Targets Business Division Category 07 |
| PROC-0008 | Targets Business Division Label 08 | Targets Business Division Category 08 |

**dim_produces_planning_artifact**

| id | produces_planning_artifact_label | produces_planning_artifact_category |
| --- | --- | --- |
| PROC-0001 | Produces Planning Artifact Label 01 | Produces Planning Artifact Category 01 |
| PROC-0002 | Produces Planning Artifact Label 02 | Produces Planning Artifact Category 02 |
| PROC-0003 | Produces Planning Artifact Label 03 | Produces Planning Artifact Category 03 |
| PROC-0004 | Produces Planning Artifact Label 04 | Produces Planning Artifact Category 04 |
| PROC-0005 | Produces Planning Artifact Label 05 | Produces Planning Artifact Category 05 |
| PROC-0006 | Produces Planning Artifact Label 06 | Produces Planning Artifact Category 06 |

Throughput and output volume are quantified through the event count metric, which aggregates discrete operational actions against divisional and artifact targets. In the strategic fact table, event counts such as 388, 352, 320, and 123 are directly associated with specific business division keys and planning artifact keys, allowing governance officers to measure execution velocity against mandated deliverables. When an event count deviates from baseline thresholds, the underlying identifier and associated category tags provide immediate traceability to the responsible division or artifact type, facilitating rapid root-cause analysis and resource reallocation.

Requirement verification and attribute resolution operate through a normalized entity-attr model that decouples metadata definitions from their runtime values. The attribute registry defines each attr by name and attr type, enforcing strict data typing via XML Schema definitions; for example, effective_date is constrained to xsd:date, enforcement to xsd:string, mandatory to xsd:boolean, and priority to xsd:integer. These typed attributes are then bound to entity records—identified by VERI-0001 through VERI-0004—through dedicated value tables that store heterogeneous data without schema collision. Boolean flags resolve to true or false, date fields capture issuance windows such as 2023-09-25 or 2025-02-12, integer fields track priority levels including 285 or 542, and varchar fields preserve free-text directives like change rationale or fr. This separation of type definition from value instantiation guarantees type safety while supporting flexible compliance auditing.

**t_requirement_min_one_verification**

| id | requirement | verified_by |
| --- | --- | --- |
| VERI-0001 | Latency threshold 50ms | Architecture Review Board |
| VERI-0002 | Audit log completeness | Architecture Review Board |
| VERI-0003 | Backup frequency daily | Internal Audit Team |
| VERI-0004 | Backup frequency daily | Certification Authority |
| VERI-0005 | Schema validation strict | NIST 800-53 |
| VERI-0006 | PII masking rule | Architecture Review Board |

**t_requirement_min_one_verification_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| VERI-0001 | effective_date | xsd:date |
| VERI-0002 | enforcement | xsd:string |
| VERI-0003 | mandatory | xsd:boolean |
| VERI-0004 | priority | xsd:integer |
| VERI-0005 | review_cycle_days | xsd:integer |
| VERI-0006 | scope | xsd:string |
| VERI-0007 | encoding | xsd:string |
| VERI-0008 | label_text | xsd:string |

**t_requirement_min_one_verification_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0003 | false |
| VERI-0002 | VERI-0002 | VERI-0003 | true |
| VERI-0003 | VERI-0003 | VERI-0003 | false |
| VERI-0004 | VERI-0004 | VERI-0003 | false |
| VERI-0005 | VERI-0005 | VERI-0003 | false |
| VERI-0006 | VERI-0006 | VERI-0003 | false |

**t_requirement_min_one_verification_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0001 | 2023-09-25 |
| VERI-0002 | VERI-0002 | VERI-0001 | 2024-02-07 |
| VERI-0003 | VERI-0003 | VERI-0001 | 2023-08-17 |
| VERI-0004 | VERI-0004 | VERI-0001 | 2025-02-12 |
| VERI-0005 | VERI-0005 | VERI-0001 | 2023-06-21 |
| VERI-0006 | VERI-0006 | VERI-0001 | 2024-04-16 |

**t_requirement_min_one_verification_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0007 | Encoding 01 |
| VERI-0002 | VERI-0001 | VERI-0002 | Enforcement 02 |
| VERI-0003 | VERI-0001 | VERI-0008 | change rationale |
| VERI-0004 | VERI-0001 | VERI-0009 | fr |
| VERI-0005 | VERI-0001 | VERI-0006 | Scope 05 |
| VERI-0006 | VERI-0002 | VERI-0007 | Encoding 06 |
| VERI-0007 | VERI-0002 | VERI-0002 | Enforcement 07 |
| VERI-0008 | VERI-0002 | VERI-0008 | intake form |

Collectively, these constructs form a deterministic data fabric where every identifier, category, and attribute type maps to a verifiable business outcome. The interplay between fact tables and their corresponding dimensions ensures that size bytes, event counts, and version stamps are never interpreted in isolation, but always contextualized within their assigned category and entity scope. By enforcing strict foreign-key relationships across temporal, divisional, and artifact taxonomies, the architecture eliminates orphaned records and enforces referential integrity at the governance layer. Consequently, audit trails remain unbroken from the initial event start time through to the final misc value resolution, satisfying regulatory requirements for traceability, reproducibility, and accountability.

**t_requirement_min_one_verification_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0004 | 1 |
| VERI-0002 | VERI-0001 | VERI-0005 | 285 |
| VERI-0003 | VERI-0002 | VERI-0004 | 1 |
| VERI-0004 | VERI-0002 | VERI-0005 | 542 |
| VERI-0005 | VERI-0003 | VERI-0004 | 5 |
| VERI-0006 | VERI-0003 | VERI-0005 | 517 |
| VERI-0007 | VERI-0004 | VERI-0004 | 2 |
| VERI-0008 | VERI-0004 | VERI-0005 | 72 |