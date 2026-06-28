---
chapter_id: ch_live_two_disjoint_artifacts_bed674
topic_id: 12
family: 01_foundation
cited_terms: ['two_disjoint_artifacts', 'labrun_produces_measurement', 'belief_interval_only_unit_range']
model: engine-refine
---

Operational traceability begins with a rigorous identification framework, where each `identifier` serves as the immutable anchor for artifacts, measurement sessions, and belief intervals alike. Rather than embedding descriptive properties directly into entity records, the architecture isolates attribute definitions—`attr` and `attr_type`—into a dedicated metadata layer that enforces type discipline across the system. An attribute such as `checksum` or `license` is formally declared with a schema-compliant `attr_type` like `xsd:string` or `cco:DesignativeICE`, ensuring that downstream consumers can validate payloads before ingestion. This decoupled design permits a single entity, identified by `ARTI-0001`, to accumulate a heterogeneous set of properties without schema drift, while the type registry guarantees that every value adheres to its declared semantic contract.

**t_two_disjoint_artifacts**

| id | two | two_2 |
| --- | --- | --- |
| ARTI-0001 | etl-job | data-lake |
| ARTI-0002 | config-bundle | traffic-router |
| ARTI-0003 | config-bundle | access-policy |
| ARTI-0004 | data-pipeline-v4 | service-discovery |
| ARTI-0005 | audit-log | traffic-router |
| ARTI-0006 | ingestion-service | traffic-router |

**t_two_disjoint_artifacts_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ARTI-0001 | checksum | xsd:string |
| ARTI-0002 | created_date | xsd:date |
| ARTI-0003 | identifier | cco:DesignativeICE |
| ARTI-0004 | license | xsd:string |
| ARTI-0005 | mime_type | xsd:string |
| ARTI-0006 | size_bytes | xsd:long |
| ARTI-0007 | uri | xsd:string |
| ARTI-0008 | version | xsd:integer |

**t_two_disjoint_artifacts_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0002 | 2023-05-13 |
| ARTI-0002 | ARTI-0002 | ARTI-0002 | 2024-02-28 |
| ARTI-0003 | ARTI-0003 | ARTI-0002 | 2024-03-29 |
| ARTI-0004 | ARTI-0004 | ARTI-0002 | 2023-09-19 |
| ARTI-0005 | ARTI-0005 | ARTI-0002 | 2025-06-16 |
| ARTI-0006 | ARTI-0006 | ARTI-0002 | 2023-10-09 |

**t_two_disjoint_artifacts_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0006 | 36 |
| ARTI-0002 | ARTI-0001 | ARTI-0008 | 5 |
| ARTI-0003 | ARTI-0002 | ARTI-0006 | 462 |
| ARTI-0004 | ARTI-0002 | ARTI-0008 | 3 |
| ARTI-0005 | ARTI-0003 | ARTI-0006 | 31 |
| ARTI-0006 | ARTI-0003 | ARTI-0008 | 5 |
| ARTI-0007 | ARTI-0004 | ARTI-0006 | 427 |
| ARTI-0008 | ARTI-0004 | ARTI-0008 | 10 |

**t_two_disjoint_artifacts_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0001 | 9d2b7a16 |
| ARTI-0002 | ARTI-0001 | ARTI-0003 | urn:uuid:9f2a |
| ARTI-0003 | ARTI-0001 | ARTI-0004 | MPL-2.0 |
| ARTI-0004 | ARTI-0001 | ARTI-0009 | ap-south-2 |
| ARTI-0005 | ARTI-0001 | ARTI-0005 | application/xml |
| ARTI-0006 | ARTI-0001 | ARTI-0010 | Name 06 |
| ARTI-0007 | ARTI-0001 | ARTI-0011 | governance |
| ARTI-0008 | ARTI-0001 | ARTI-0012 | Tags 08 |

**t_belief_interval_only_unit_range**

| id | belief | belief_lower_bound |
| --- | --- | --- |
| RANG-0001 | throughput projection | ARTI-0003 |
| RANG-0002 | throughput projection | ARTI-0004 |
| RANG-0003 | packet loss guarantee | ARTI-0001 |
| RANG-0004 | noise floor estimate | ARTI-0005 |
| RANG-0005 | thermal drift assertion | ARTI-0004 |
| RANG-0006 | packet loss guarantee | ARTI-0004 |

**t_belief_interval_only_unit_range_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| RANG-0001 | confidence | xsd:decimal |
| RANG-0002 | dimension_kind | xsd:string |
| RANG-0003 | method | xsd:string |
| RANG-0004 | recorded_at | xsd:dateTime |
| RANG-0005 | uncertainty | xsd:decimal |
| RANG-0006 | unit | xsd:string |
| RANG-0007 | value | xsd:decimal |
| RANG-0008 | encoding | xsd:string |

**t_belief_interval_only_unit_range_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RANG-0001 | RANG-0001 | RANG-0004 | 2025-06-14T16:53:04 |
| RANG-0002 | RANG-0002 | RANG-0004 | 2023-08-16T07:36:41 |
| RANG-0003 | RANG-0003 | RANG-0004 | 2023-03-26T19:32:25 |
| RANG-0004 | RANG-0004 | RANG-0004 | 2025-03-17T08:26:16 |
| RANG-0005 | RANG-0005 | RANG-0004 | 2025-04-30T01:20:27 |
| RANG-0006 | RANG-0006 | RANG-0004 | 2023-02-14T23:11:05 |

**t_belief_interval_only_unit_range_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RANG-0001 | RANG-0001 | RANG-0001 | 0.727 |
| RANG-0002 | RANG-0001 | RANG-0005 | 281.42 |
| RANG-0003 | RANG-0001 | RANG-0007 | 343.70 |
| RANG-0004 | RANG-0002 | RANG-0001 | 0.788 |
| RANG-0005 | RANG-0002 | RANG-0005 | 676.76 |
| RANG-0006 | RANG-0002 | RANG-0007 | 95.73 |
| RANG-0007 | RANG-0003 | RANG-0001 | 0.294 |
| RANG-0008 | RANG-0003 | RANG-0005 | 403.37 |

**t_belief_interval_only_unit_range_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RANG-0001 | RANG-0001 | RANG-0002 | Dimension Kind 01 |
| RANG-0002 | RANG-0001 | RANG-0008 | Encoding 02 |
| RANG-0003 | RANG-0001 | RANG-0009 | change rationale |
| RANG-0004 | RANG-0001 | RANG-0010 | fr |
| RANG-0005 | RANG-0001 | RANG-0003 | hybrid |
| RANG-0006 | RANG-0001 | RANG-0006 | ms |
| RANG-0007 | RANG-0002 | RANG-0002 | Dimension Kind 07 |
| RANG-0008 | RANG-0002 | RANG-0008 | Encoding 08 |

The actual property values reside in type-specialized storage tables, where the `entity` column functions as the foreign key binding metadata to its subject. Miscellaneous data—`misc`—is partitioned by format to preserve precision and indexing efficiency: string-valued properties such as `9d2b7a16` or `urn:uuid:9f2a` are routed to the varchar store, while numeric bounds like `0.727` and `281.42` populate the decimal registry. Temporal attributes follow the same pattern, with creation timestamps like `2023-05-13` and precise execution markers such as `2025-06-14T16:53:04` maintained in their respective date and datetime containers. By routing values through `attr_id` and `entity_id` joins, the system maintains a single source of truth for each property while allowing independent evolution of storage backends and query engines.

Within the execution layer, `labrun` identifiers track discrete measurement or processing sessions, each classified by a `category` that dictates routing, retention, and compliance posture. Performance telemetry is captured through `duration_seconds`, which records wall-clock execution times ranging from `4308.22` to `5155.73` seconds across sampled runs, providing the baseline for capacity planning and SLA enforcement. Failure modes are codified via `exit` codes—`122`, `691`, `566`, and `3`—which map directly to operating system or application-level termination states, enabling automated alerting and post-mortem classification. Resilience is quantified through `retry_count`, where values such as `265` and `244` signal persistent instability in downstream dependencies, while lower counts like `12` indicate stable execution paths and well-tuned backoff strategies.

**fact_labrun**

| id | labrun_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| MEAS-0001 | MEAS-0002 | 4856.18 | 122 | 265 |
| MEAS-0002 | MEAS-0006 | 4308.22 | 691 | 244 |
| MEAS-0003 | MEAS-0002 | 4764.89 | 566 | 106 |
| MEAS-0004 | MEAS-0005 | 5155.73 | 3 | 12 |
| MEAS-0005 | MEAS-0002 | 385.91 | 81 | 197 |

The convergence of these registries establishes an auditable chain of custody from artifact definition through attribute assignment to runtime execution. Because every `identifier` propagates consistently across metadata, value, and telemetry tables, compliance officers can reconstruct the complete lifecycle of a component without cross-referencing disparate logging systems. Type enforcement at the `attr_type` level prevents schema corruption, while the separation of `misc` values by domain ensures that regulatory requirements for data precision—whether cryptographic hashes, license identifiers, or decimal confidence bounds—are preserved exactly as declared. Operational dashboards consume this normalized structure to correlate `labrun` performance with artifact categories, allowing governance teams to isolate systemic failures, validate compliance boundaries, and enforce retention policies based on `category` and `exit` state rather than ad hoc log parsing.

**dim_labrun**

| id | labrun_label | labrun_category |
| --- | --- | --- |
| MEAS-0001 | Labrun Label 01 | Labrun Category 01 |
| MEAS-0002 | Labrun Label 02 | Labrun Category 02 |
| MEAS-0003 | Labrun Label 03 | Labrun Category 03 |
| MEAS-0004 | Labrun Label 04 | Labrun Category 04 |
| MEAS-0005 | Labrun Label 05 | Labrun Category 05 |
| MEAS-0006 | Labrun Label 06 | Labrun Category 06 |