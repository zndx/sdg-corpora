---
chapter_id: ch_live_lineage_edge_subclass_f92b3e
topic_id: 20
family: 05_provo_lineage
cited_terms: ['lineage_edge_subclass', 'syscall_equiv_in_subsystem', 'measurement_aggregated_into']
model: engine-refine
---

Aggregated measurements are anchored to categorical groupings through a dimension-fact architecture that separates classification from quantification. The dimension table `dim_aggregated_into` assigns each grouping an `aggregated_into_category`—values such as `Aggregated Into Category 01` through `Aggregated Into Category 04`—and a human-readable `aggregated_into_label` like `Aggregated Into Label 01`. These labels serve as the semantic bridge between machine-readable identifiers and operational understanding, while the category column provides the structural taxonomy for downstream aggregation. The fact table `fact_measurement` materializes the quantitative side of this relationship: each row carries an `aggregated_into_key` that references a dimension entry, and records a `value` alongside two uncertainty-bearing fields. A measurement with identifier `INTO-0001` aggregates into `INTO-0005` with a value of `353.34`, a confidence of `0.496`, and an uncertainty of `306.26`; by contrast, `INTO-0002` shares the same aggregation target but achieves a confidence of `0.945` with uncertainty reduced to `279.24`. The inverse relationship between confidence and uncertainty is not exact—`INTO-0003` presents a confidence of `0.506` against an uncertainty of only `120.70`—reflecting the multidimensional nature of measurement quality.

**fact_measurement**

| id | aggregated_into_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| INTO-0001 | INTO-0005 | 0.496 | 306.26 | 353.34 |
| INTO-0002 | INTO-0005 | 0.945 | 279.24 | 660.64 |
| INTO-0003 | INTO-0004 | 0.506 | 120.70 | 878.99 |
| INTO-0004 | INTO-0006 | 0.307 | 364.07 | 64.10 |
| INTO-0005 | INTO-0006 | 0.923 | 642.96 | 897.70 |

**dim_aggregated_into**

| id | aggregated_into_label | aggregated_into_category |
| --- | --- | --- |
| INTO-0001 | Aggregated Into Label 01 | Aggregated Into Category 01 |
| INTO-0002 | Aggregated Into Label 02 | Aggregated Into Category 02 |
| INTO-0003 | Aggregated Into Label 03 | Aggregated Into Category 03 |
| INTO-0004 | Aggregated Into Label 04 | Aggregated Into Category 04 |
| INTO-0005 | Aggregated Into Label 05 | Aggregated Into Category 05 |
| INTO-0006 | Aggregated Into Label 06 | Aggregated Into Category 06 |

Confidence operates as a normalized quality indicator across disparate data domains, though its interpretation shifts with context. In the lineage tracking table `t_lineage_edge_subclass`, confidence values range from `0.101` for a `NetworkTrafficDump` edge labeled `intake form` to `1.000` for a `FinancialLedgerSync` edge labeled `calibration record`. A confidence of `0.101` signals near-total epistemic fragility—perhaps a heuristic match or an unverified propagation—whereas `1.000` denotes a deterministic or fully audited linkage. The intermediate values of `0.584` and `0.280` occupy the gray zone where lineage edges are plausible but not yet corroborated. In the measurement fact table, confidence spans `0.307` to `0.945`, suggesting that even within a single aggregation bucket, individual observations carry markedly different reliability profiles. This variation demands that consumers of aggregated data weight contributions by confidence rather than treating all rows as equal.

**t_lineage_edge_subclass**

| id | lineage | from_source | confidence | label_text |
| --- | --- | --- | --- | --- |
| EDGE-0001 | NetworkTrafficDump | PostgreSQLRawDB | 0.584 | intake form |
| EDGE-0002 | ManufacturingBatchTrace | GCSRawZone | 0.101 | calibration record |
| EDGE-0003 | ManufacturingBatchTrace | RESTAPIGateway | 0.280 | intake form |
| EDGE-0004 | FinancialLedgerSync | S3ArchivalBucket | 1.000 | calibration record |
| EDGE-0005 | ManufacturingBatchTrace | RedisCacheStore | 0.544 | audit excerpt |
| EDGE-0006 | NetworkTrafficDump | OracleERPSystem | 0.796 | calibration record |
| EDGE-0007 | PatientAdmissionRecord | RedisCacheStore | 0.907 | change rationale |
| EDGE-0008 | InventoryReconciliation | KafkaEventsStream | 0.508 | audit excerpt |

The relationship between system components is modeled through a ternary association that binds a `subject`, a `target`, and a `role` into a single auditable triple. The junction table `t_syscall_equiv_in_subsystem__in_syscall_subsystem` records that `SUBS-0003` (a syscall) assumes the role of `reviewer` with respect to `SUBS-0007` (an in-subsystem entity), while `SUBS-0004` acts as `owner` of `SUBS-0007`. The same target `SUBS-0006` is simultaneously the subject of `SUBS-0005` in a `reviewer` capacity and the target of `SUBS-0002` in an `observer` capacity. The `role` column—taking values such as `reviewer`, `owner`, and `observer`—encodes the nature of the relationship rather than merely asserting its existence, enabling fine-grained access control, audit trails, and responsibility attribution. The `subject` and `target` columns are foreign keys into the subsystem dimension tables, ensuring referential integrity while allowing any subsystem to play either role depending on context.

**t_syscall_equiv_in_subsystem__in_syscall_subsystem**

| id | syscall_id | in_syscall_subsystem_id | role |
| --- | --- | --- | --- |
| SUBS-0001 | SUBS-0003 | SUBS-0007 | reviewer |
| SUBS-0002 | SUBS-0005 | SUBS-0006 | reviewer |
| SUBS-0003 | SUBS-0004 | SUBS-0007 | owner |
| SUBS-0004 | SUBS-0002 | SUBS-0006 | observer |
| SUBS-0005 | SUBS-0007 | SUBS-0004 | owner |
| SUBS-0006 | SUBS-0007 | SUBS-0002 | contributor |
| SUBS-0007 | SUBS-0004 | SUBS-0001 | reviewer |
| SUBS-0008 | SUBS-0003 | SUBS-0004 | owner |

Every entity in this schema is distinguished by an `identifier`, a structured primary key that provides both uniqueness and a hint of provenance. Edge identifiers such as `EDGE-0001` through `EDGE-0004` prefix the lineage subclass table; subsystem identifiers like `SUBS-0001` through `SUBS-0004` prefix the syscall equivalence tables; and aggregation identifiers such as `INTO-0001` through `INTO-0006` prefix both the dimension and fact tables. The prefix convention enables rapid visual triage—`EDGE-` denotes a lineage relationship, `SUBS-` a subsystem or syscall entity, and `INTO-` an aggregation construct—while the numeric suffix preserves insertion order and simplifies range queries. This naming discipline is not decorative; it is the operational mechanism by which analysts and automated systems disambiguate entities across tables without resorting to full-text searches or schema introspection.

**t_syscall_equiv_in_subsystem**

| id | syscall |
| --- | --- |
| SUBS-0001 | Syscall 01 |
| SUBS-0002 | Syscall 02 |
| SUBS-0003 | Syscall 03 |
| SUBS-0004 | Syscall 04 |
| SUBS-0005 | Syscall 05 |
| SUBS-0006 | Syscall 06 |
| SUBS-0007 | Syscall 07 |

**t_syscall_equiv_in_subsystem_in_syscall_subsystem**

| id | in_syscall_subsystem |
| --- | --- |
| SUBS-0001 | In Syscall Subsystem 01 |
| SUBS-0002 | In Syscall Subsystem 02 |
| SUBS-0003 | In Syscall Subsystem 03 |
| SUBS-0004 | In Syscall Subsystem 04 |
| SUBS-0005 | In Syscall Subsystem 05 |
| SUBS-0006 | In Syscall Subsystem 06 |
| SUBS-0007 | In Syscall Subsystem 07 |

Ancillary attributes—labeled `misc` in the schema—carry the descriptive or quantitative payloads that do not fit into the structural backbone. In `fact_measurement`, the `value` column holds the actual measurement datum (`353.34`, `660.64`, `878.99`, `64.10`), while in `dim_aggregated_into`, the `aggregated_into_label` column provides the human-readable name (`Aggregated Into Label 01` through `Aggregated Into Label 04`). Similarly, the `label_text` column in `t_lineage_edge_subclass` stores descriptive tags such as `intake form` and `calibration record` that classify the nature of each lineage edge without altering its structural position. These fields are the interface between the database and the analyst: they are the values that appear in reports, dashboards, and audit artifacts, even though they carry no foreign-key semantics and do not participate in join logic.