---
chapter_id: ch_live_allocation_succeeded_or_failed_642e1e
topic_id: 94
family: 05_provo_lineage
cited_terms: ['allocation_succeeded_or_failed', 'belief_interval_at_confidence_level', 'evidence_with_mass_function']
model: engine-refine
---

Within any evidence-driven measurement framework, the integrity of inference rests on a disciplined separation between the entity under observation, the attributes that describe it, and the identifiers that bind them across operational lifecycles. Each entity—distinguished by a stable identifier such as `LEVE-0001` or `FUNC-0001`—serves as the anchor for a belief interval evaluated at a specific confidence level, whether that level is expressed as an Alpha 0.05 threshold, a confidence band of 0.95, a high reliability tier, or a P value threshold. The attributes attached to these entities—`confidence`, `dimension_kind`, `method`, `recorded_at`—are not arbitrary; they carry explicit type declarations drawn from the XML Schema definition space, where `confidence` and related numeric measures are typed as `xsd:decimal`, categorical descriptors like `dimension_kind` and `method` as `xsd:string`, and temporal stamps such as `recorded_at` as `xsd:dateTime`. This type discipline ensures that a decimal value of 0.649 or 174.38 is never conflated with a string value like `Dimension Kind 01` or `audit excerpt`, and that datetime values such as `2023-02-13T08:09:52` or `2025-01-26T05:24:46` are parsed and compared against a consistent temporal model.

**t_belief_interval_at_confidence_level**

| id | belief | at_confidence_level |
| --- | --- | --- |
| LEVE-0001 | Calibration drift reading | Alpha 0.05 threshold |
| LEVE-0002 | Query result set | Confidence band 0.95 |
| LEVE-0003 | Schema migration status | High reliability tier |
| LEVE-0004 | Sensor telemetry snapshot | P value threshold |
| LEVE-0005 | Data lineage trace | Alpha 0.05 threshold |
| LEVE-0006 | Pipeline throughput metric | 99 percent reliable |
| LEVE-0007 | Schema migration status | Ninety-five percent bound |
| LEVE-0008 | Lab assay concentration | 95 percent confidence |

**t_belief_interval_at_confidence_level_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| LEVE-0001 | confidence | xsd:decimal |
| LEVE-0002 | dimension_kind | xsd:string |
| LEVE-0003 | method | xsd:string |
| LEVE-0004 | recorded_at | xsd:dateTime |
| LEVE-0005 | uncertainty | xsd:decimal |
| LEVE-0006 | unit | xsd:string |
| LEVE-0007 | value | xsd:decimal |
| LEVE-0008 | encoding | xsd:string |

**t_belief_interval_at_confidence_level_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LEVE-0001 | LEVE-0001 | LEVE-0004 | 2023-02-13T08:09:52 |
| LEVE-0002 | LEVE-0002 | LEVE-0004 | 2025-01-26T05:24:46 |
| LEVE-0003 | LEVE-0003 | LEVE-0004 | 2023-02-11T13:24:10 |
| LEVE-0004 | LEVE-0004 | LEVE-0004 | 2025-05-13T04:15:37 |
| LEVE-0005 | LEVE-0005 | LEVE-0004 | 2025-01-29T02:47:20 |
| LEVE-0006 | LEVE-0006 | LEVE-0004 | 2023-06-10T12:00:26 |
| LEVE-0007 | LEVE-0007 | LEVE-0004 | 2023-12-02T09:08:00 |
| LEVE-0008 | LEVE-0008 | LEVE-0004 | 2023-02-02T13:44:49 |

**t_belief_interval_at_confidence_level_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LEVE-0001 | LEVE-0001 | LEVE-0001 | 0.649 |
| LEVE-0002 | LEVE-0001 | LEVE-0005 | 174.38 |
| LEVE-0003 | LEVE-0001 | LEVE-0007 | 717.12 |
| LEVE-0004 | LEVE-0002 | LEVE-0001 | 0.339 |
| LEVE-0005 | LEVE-0002 | LEVE-0005 | 870.57 |
| LEVE-0006 | LEVE-0002 | LEVE-0007 | 357.58 |
| LEVE-0007 | LEVE-0003 | LEVE-0001 | 0.361 |
| LEVE-0008 | LEVE-0003 | LEVE-0005 | 687.09 |

**t_belief_interval_at_confidence_level_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LEVE-0001 | LEVE-0001 | LEVE-0002 | Dimension Kind 01 |
| LEVE-0002 | LEVE-0001 | LEVE-0008 | Encoding 02 |
| LEVE-0003 | LEVE-0001 | LEVE-0009 | audit excerpt |
| LEVE-0004 | LEVE-0001 | LEVE-0010 | en |
| LEVE-0005 | LEVE-0001 | LEVE-0003 | manual |
| LEVE-0006 | LEVE-0001 | LEVE-0006 | ms |
| LEVE-0007 | LEVE-0002 | LEVE-0002 | Dimension Kind 07 |
| LEVE-0008 | LEVE-0002 | LEVE-0008 | Encoding 08 |

The dimension kind column establishes the physical or conceptual axis along which evidence is classified—`pressure`, `temperature`, and `mass` appearing as canonical examples—and this classification directly constrains which mass functions are admissible for reasoning. Evidence items such as a `provenance trace log`, a `calibration certificate`, a `telemetry dump`, or a `signal capture data` record are each associated with a mass function that quantifies uncertainty: a `Gaussian distribution`, a `calibration curve`, or a `normalized weight vector`. The method by which this association is established—`automated`, `inferred`, or `hybrid`—is itself an attribute of the evidence record, and its value carries operational significance. An `automated` method implies direct instrumentation or pipeline ingestion, `inferred` suggests derivation through statistical or heuristic processes, and `hybrid` denotes a combination of both, each with distinct implications for auditability and confidence assignment.

**t_evidence_with_mass_function**

| id | evidence | mass_function | dimension_kind | method |
| --- | --- | --- | --- | --- |
| FUNC-0001 | provenance trace log | Gaussian distribution | pressure | automated |
| FUNC-0002 | calibration certificate | calibration curve | temperature | automated |
| FUNC-0003 | telemetry dump | normalized weight vector | mass | inferred |
| FUNC-0004 | signal capture data | Gaussian distribution | mass | hybrid |
| FUNC-0005 | system event record | posterior distribution | length | automated |

Operational tracking of allocation events introduces a parallel dimension of observability, where the `status` column records the current state of an allocation as `failed`, `running`, or `complete`, and the `triggered_by` column captures the initiation mechanism as `manual`, `schedule`, or `api`. Allocations such as `event-trace-log`, `replication-stream`, `burst-window-epsilon`, `tenant-quota-gold`, and `audit-retention-vault` represent distinct resource or data flows, each subject to its own lifecycle and failure mode. The identifier for each allocation—`FAIL-0001` through `FAIL-0004` in the observed sample—provides a stable reference point for correlating status transitions with triggering events, enabling root-cause analysis when a `manual` trigger leads to a `failed` state or when an `api`-initiated allocation transitions through `running` to `complete`.

**t_allocation_succeeded_or_failed**

| id | allocation | allocation_2 | allocation_3 | status | triggered_by |
| --- | --- | --- | --- | --- | --- |
| FAIL-0001 | event-trace-log | governance-tag-set | processing-shard-kappa | failed | manual |
| FAIL-0002 | replication-stream | burst-window-epsilon | telemetry-buffer | running | schedule |
| FAIL-0003 | burst-window-epsilon | tenant-quota-gold | burst-window-epsilon | complete | manual |
| FAIL-0004 | event-trace-log | audit-retention-vault | quality-rule-std | failed | api |
| FAIL-0005 | compute-pool-alpha | metric-rollup-daily | event-trace-log | running | api |

The belief interval framework further decomposes attribute values into type-specific storage tables, where decimal values, string values, and datetime values are materialized separately but linked back to their parent entity and attribute through foreign-key relationships. A single entity such as `LEVE-0001` may carry a decimal value of 0.649 for its confidence attribute, a string value of `Dimension Kind 01` for its dimension kind, and a datetime value of `2023-02-13T08:09:52` for its recorded_at timestamp, each stored in its respective value table and retrievable through a unified query pattern. This normalization strategy preserves type safety while supporting the flexible attachment of arbitrary attributes to any entity, a design choice that proves essential when dealing with heterogeneous evidence sources that report measurements on different scales, in different formats, and with different confidence guarantees.