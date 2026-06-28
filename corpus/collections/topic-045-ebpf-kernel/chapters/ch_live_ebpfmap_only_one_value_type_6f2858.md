---
chapter_id: ch_live_ebpfmap_only_one_value_type_6f2858
topic_id: 45
family: 04_ebpf_kernel
cited_terms: ['ebpfmap_only_one_value_type', 'taper_tolerance_constraint', 'transformation_ends_at']
model: engine-refine
---

In governed operational systems, every durable fact must be addressable, typed, and classifiable before it can support audit, reconciliation, or automated remediation. The identifier anchors that contract: a stable, opaque key such as TYPE-0002 or CONS-0003 names a record without encoding semantics in the key itself, so references survive relabeling, schema drift, and cross-table joins. Entities are the governed objects those keys denote—here, taper-tolerance constraints identified as CONS-0001 through CONS-0004, each carrying a canonical tapertoleranceconstraint value (ISO 7/24, R8 Taper, HSK 63A, Brown Sharpe) that expresses the physical or interchange rule under control. Separating entity identity from its display or constraint string prevents conflation of “what thing is regulated” with “what value it currently holds,” which is prerequisite for lineage, diffing, and policy enforcement.

**t_taper_tolerance_constraint**

| id | taper_tolerance_constraint |
| --- | --- |
| CONS-0001 | ISO 7/24 |
| CONS-0002 | R8 Taper |
| CONS-0003 | HSK 63A |
| CONS-0004 | Brown Sharpe |
| CONS-0005 | R8 Taper |
| CONS-0006 | HSK 63A |
| CONS-0007 | HSK 63A |

**t_taper_tolerance_constraint_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CONS-0001 | confidence | xsd:decimal |
| CONS-0002 | dimension_kind | xsd:string |
| CONS-0003 | method | xsd:string |
| CONS-0004 | recorded_at | xsd:dateTime |
| CONS-0005 | uncertainty | xsd:decimal |
| CONS-0006 | unit | xsd:string |
| CONS-0007 | value | xsd:decimal |
| CONS-0008 | encoding | xsd:string |

**t_taper_tolerance_constraint_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONS-0001 | CONS-0001 | CONS-0004 | 2023-04-13T01:14:03 |
| CONS-0002 | CONS-0002 | CONS-0004 | 2023-11-17T04:32:31 |
| CONS-0003 | CONS-0003 | CONS-0004 | 2024-02-24T21:07:21 |
| CONS-0004 | CONS-0004 | CONS-0004 | 2024-03-22T07:54:37 |
| CONS-0005 | CONS-0005 | CONS-0004 | 2024-06-16T09:28:12 |
| CONS-0006 | CONS-0006 | CONS-0004 | 2025-04-01T15:47:40 |
| CONS-0007 | CONS-0007 | CONS-0004 | 2023-11-02T02:01:06 |

**t_taper_tolerance_constraint_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONS-0001 | CONS-0001 | CONS-0001 | 0.573 |
| CONS-0002 | CONS-0001 | CONS-0005 | 111.04 |
| CONS-0003 | CONS-0001 | CONS-0007 | 682.01 |
| CONS-0004 | CONS-0002 | CONS-0001 | 0.728 |
| CONS-0005 | CONS-0002 | CONS-0005 | 404.41 |
| CONS-0006 | CONS-0002 | CONS-0007 | 774.28 |
| CONS-0007 | CONS-0003 | CONS-0001 | 0.546 |
| CONS-0008 | CONS-0003 | CONS-0005 | 913.78 |

**t_taper_tolerance_constraint_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONS-0001 | CONS-0001 | CONS-0002 | Dimension Kind 01 |
| CONS-0002 | CONS-0001 | CONS-0008 | Encoding 02 |
| CONS-0003 | CONS-0001 | CONS-0009 | nightly summary |
| CONS-0004 | CONS-0001 | CONS-0010 | en |
| CONS-0005 | CONS-0001 | CONS-0003 | hybrid |
| CONS-0006 | CONS-0001 | CONS-0006 | ratio |
| CONS-0007 | CONS-0002 | CONS-0002 | Dimension Kind 07 |
| CONS-0008 | CONS-0002 | CONS-0008 | Encoding 08 |

Attributes extend entities into inspectable, machine-validated property sets. An attr names the facet—confidence, dimension_kind, method, recorded_at—while attr_type declares the governing lexical and validation regime (xsd:decimal, xsd:string, xsd:dateTime). That pairing is not decorative: it routes persisted values into type-appropriate stores and rejects structurally invalid assertions at ingest. A decimal confidence of 0.573 on CONS-0001 and 0.728 on CONS-0002 can therefore be compared and aggregated; recorded_at instants such as 2023-04-13T01:14:03 and 2024-03-22T07:54:37 establish evidentiary time bounds for when each constraint snapshot was captured. String-valued misc fields—Dimension Kind 01, Encoding 02, nightly summary, en—carry qualifiers that do not reduce cleanly to numbers or timestamps yet remain first-class facts bound to the same entity through attr_id, preserving interpretability without weakening type discipline.

Classification layers sit above raw entities and attributes so operators and compliance tooling can reason at cohort scale. Category partitions type maps into governed families (Value Type Map Category 01 through 04), while the type map itself binds operational payloads to semantic templates: fact rows reference value_type_map_key TYPE-0002 three times and TYPE-0003 once, indicating shared typing for distinct identifiers TYPE-0001, TYPE-0002, and TYPE-0003. Human-readable misc labels (Value Type Map Label 01–04) decorate those keys for dashboards and runbooks without becoming join keys. Version (3, 6, 12, 5 across TYPE-0001–TYPE-0004) and size_bytes (from 31,105,012 through 354,373,995) then operationalize lifecycle control: version signals which definition generation produced a map instance, and byte extent quantifies storage and transfer exposure for capacity planning, retention, and evidence-of-processing claims.

**fact_ebpfmap**

| id | value_type_map_key | size_bytes | version |
| --- | --- | --- | --- |
| TYPE-0001 | TYPE-0002 | 208979093 | 3 |
| TYPE-0002 | TYPE-0002 | 156714508 | 6 |
| TYPE-0003 | TYPE-0002 | 31105012 | 12 |
| TYPE-0004 | TYPE-0003 | 354373995 | 5 |
| TYPE-0005 | TYPE-0002 | 866267293 | 2 |

**dim_value_type_map**

| id | value_type_map_label | value_type_map_category |
| --- | --- | --- |
| TYPE-0001 | Value Type Map Label 01 | Value Type Map Category 01 |
| TYPE-0002 | Value Type Map Label 02 | Value Type Map Category 02 |
| TYPE-0003 | Value Type Map Label 03 | Value Type Map Category 03 |
| TYPE-0004 | Value Type Map Label 04 | Value Type Map Category 04 |
| TYPE-0005 | Value Type Map Label 05 | Value Type Map Category 05 |
| TYPE-0006 | Value Type Map Label 06 | Value Type Map Category 06 |

Pipeline and transformation governance closes the loop between static reference data and runtime behavior. Each transformation end event—whether an ETL pipeline run, feature engineering routine, telemetry normalization pass, or schema migration script—is recorded with ended_at_time, loglevel, and retrycount so severity and persistence of failure modes are auditable alongside outcome. A critical log_level on a feature-engineering routine that exhausted 216 retries contrasts with warning-level telemetry normalization at 307 retries and schema migration at 446 retries, surfacing operations that may require escalation even when jobs eventually complete. Info-level completion at 210 retries on an ETL run establishes a baseline of nominal termination. Together, identifier-backed entities, typed attrs, categorical type maps versioned and sized for operational impact, and transformation telemetry form a coherent control surface: definitions are stable and typed, instances are measurable and time-stamped, and the processes that materialize or mutate them leave a graded, countable audit trail suitable for compliance review and continuous improvement.

**t_transformation_ends_at**

| id | transformation | ended_at_time | log_level | retry_count |
| --- | --- | --- | --- | --- |
| ENDS-0001 | ETL pipeline run | 2024-02-28T16:45:12Z | info | 210 |
| ENDS-0002 | Feature engineering routine | 2024-05-17T07:30:00Z | critical | 216 |
| ENDS-0003 | Telemetry normalization pass | 2024-02-28T16:45:12Z | warning | 307 |
| ENDS-0004 | Schema migration script | 2024-04-09T11:15:30Z | warning | 446 |
| ENDS-0005 | Audit record sync | 2024-03-15T14:22:01Z | info | 371 |
| ENDS-0006 | Schema migration script | 2024-05-17T07:30:00Z | info | 187 |
| ENDS-0007 | Data reconciliation workflow | 2023-09-30T23:59:59Z | error | 426 |
| ENDS-0008 | ETL pipeline run | 2024-01-22T18:10:55Z | warning | 196 |