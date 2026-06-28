---
chapter_id: ch_live_functional_dependency_rhs_faea63
topic_id: 42
family: 07_long_tail
cited_terms: ['functional_dependency_rhs', 'transformation_equiv_io_intersection', 'claim_observed_by_event']
model: engine-refine
---

In governed data environments, every assertion about structure, behavior, or provenance must be anchored to a stable identifier so that lineage, accountability, and audit replay remain possible across revisions and organizational boundaries. Identifiers such as RHS-0003, INTE-0005, and EVEN-0002 function not merely as surrogate keys but as durable handles on entities whose human-readable labels may change: a telemetry aggregation service, an aggregate_daily_metrics transformation, or a recurring compliance claim. Without such handles, cross-referencing a functional dependency to its right-hand-side artifact, or tracing which transformation consumed iot_device_streams versus sensor_aggregates_daily, would collapse into ambiguous natural-language matching. The identifier therefore precedes interpretation; it is the minimum unit of referential integrity upon which subject–target graphs, fact tables, and dimension tables are built.

**t_functional_dependency_rhs**

| id | functional |
| --- | --- |
| RHS-0001 | data ingestion pipeline |
| RHS-0002 | encryption transformation |
| RHS-0003 | telemetry aggregation service |
| RHS-0004 | access control evaluator |
| RHS-0005 | telemetry aggregation service |
| RHS-0006 | schema validation routine |

**t_functional_dependency_rhs_f_d_right_hand_side**

| id | f_d_right_hand_side |
| --- | --- |
| RHS-0001 | aggregated event count |
| RHS-0002 | sanitized email address |
| RHS-0003 | partition key value |
| RHS-0004 | enriched sensor reading |
| RHS-0005 | derived priority level |
| RHS-0006 | computed latency metric |
| RHS-0007 | computed latency metric |

**t_functional_dependency_rhs__f_d_right_hand_side**

| id | functional_id | f_d_right_hand_side_id | role |
| --- | --- | --- | --- |
| RHS-0001 | RHS-0003 | RHS-0007 | contributor |
| RHS-0002 | RHS-0004 | RHS-0001 | owner |
| RHS-0003 | RHS-0002 | RHS-0005 | owner |
| RHS-0004 | RHS-0003 | RHS-0006 | owner |
| RHS-0005 | RHS-0003 | RHS-0001 | owner |
| RHS-0006 | RHS-0001 | RHS-0005 | owner |
| RHS-0007 | RHS-0001 | RHS-0006 | contributor |
| RHS-0008 | RHS-0002 | RHS-0001 | contributor |

Subject and target articulate directed relationships between governed entities. A subject is the entity that asserts, performs, or holds responsibility; a target is the entity acted upon or produced. When RHS-0003 is recorded as subject with RHS-0006 as target, the linkage states that a particular functional component bears a defined relationship to a specific right-hand-side output—in this instance, an enriched sensor reading—rather than merely co-occurring in documentation. The same pattern governs transformation input and output wiring: INTE-0005 as subject paired with INTE-0007 as target denotes that one transformation instance reads from a particular input dataset, while a separate edge from INTE-0003 to INTE-0001 records a distinct output obligation. Subjects and targets together form the directed edges of a lineage graph; roles and cardinality annotations supply the semantics those edges require for operational enforcement.

Role qualifies how a subject relates to its target within a shared governance vocabulary. Owner, contributor, reviewer, and observer are not interchangeable labels; they encode differentiated authority over definition, execution, attestation, and read-only oversight. An access control evaluator marked owner of a partition key value (RHS-0004 → RHS-0005) carries a different compliance burden than a data ingestion pipeline recorded merely as contributor to a sanitized email address (RHS-0001 → RHS-0001). On the transformation plane, aggregate_daily_metrics may assign owner on an input edge while relegating the corresponding output edge to observer—signaling that ingestion accountability does not automatically extend to downstream publication of financial_transactions. Roles make delegation explicit: they tell auditors who must answer when a dependency misfires, when an output dataset drifts from its declared contract, or when an intersection of equivalent I/O must be revalidated.

**t_transformation_equiv_io_intersection**

| id | transformation |
| --- | --- |
| INTE-0001 | aggregate_daily_metrics |
| INTE-0002 | aggregate_daily_metrics |
| INTE-0003 | merge_sensor_readings |
| INTE-0004 | merge_sensor_readings |
| INTE-0005 | resample_telemetry_stream |
| INTE-0006 | transform_csv_to_parquet |

**t_transformation_equiv_io_intersection_input_dataset**

| id | input_dataset |
| --- | --- |
| INTE-0001 | iot_device_streams |
| INTE-0002 | weather_station_data |
| INTE-0003 | user_activity_events |
| INTE-0004 | sensor_aggregates_daily |
| INTE-0005 | financial_transactions |
| INTE-0006 | lab_sample_analyzed |
| INTE-0007 | financial_transactions |

**t_transformation_equiv_io_intersection__input_dataset**

| id | transformation_id | input_dataset_id | role |
| --- | --- | --- | --- |
| INTE-0001 | INTE-0005 | INTE-0007 | owner |
| INTE-0002 | INTE-0005 | INTE-0004 | reviewer |
| INTE-0003 | INTE-0003 | INTE-0002 | contributor |
| INTE-0004 | INTE-0002 | INTE-0006 | contributor |
| INTE-0005 | INTE-0004 | INTE-0004 | owner |
| INTE-0006 | INTE-0003 | INTE-0001 | contributor |
| INTE-0007 | INTE-0004 | INTE-0002 | observer |
| INTE-0008 | INTE-0004 | INTE-0007 | reviewer |

**t_transformation_equiv_io_intersection_output_dataset**

| id | output_dataset |
| --- | --- |
| INTE-0001 | financial_transactions |
| INTE-0002 | weather_station_data |
| INTE-0003 | raw_telemetry_v3 |
| INTE-0004 | network_traffic_logs |
| INTE-0005 | raw_telemetry_v3 |
| INTE-0006 | network_traffic_parsed |

Cardinality note records structural constraints on subject–target pairings where naive one-to-one assumptions would misstate system behavior. Cardinality Note 01 through Cardinality Note 04 attach to output-dataset relationships precisely because outputs are the locus of fan-out, consolidation, and equivalence-class ambiguity: a single merge_sensor_readings transformation may legitimately relate to multiple output surfaces, and each edge may carry distinct cardinality semantics that govern whether duplicate suppression, idempotent writes, or partition-local aggregation is permitted. Where role answers “who,” cardinality note answers “how many, under what structural rule.” Omitting it invites silent misinterpretation during impact analysis—treating an observer edge as if it implied sole ownership of a dataset, or assuming a contributor input role precludes additional concurrent readers. In practice, cardinality notes are consulted during change-control review whenever transformation equivalence or functional-dependency rewiring is proposed.

**t_transformation_equiv_io_intersection__output_dataset**

| id | transformation_id | output_dataset_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| INTE-0001 | INTE-0005 | INTE-0006 | contributor | Cardinality Note 01 |
| INTE-0002 | INTE-0001 | INTE-0005 | observer | Cardinality Note 02 |
| INTE-0003 | INTE-0002 | INTE-0001 | observer | Cardinality Note 03 |
| INTE-0004 | INTE-0003 | INTE-0003 | reviewer | Cardinality Note 04 |
| INTE-0005 | INTE-0003 | INTE-0005 | reviewer | Cardinality Note 05 |
| INTE-0006 | INTE-0002 | INTE-0006 | contributor | Cardinality Note 06 |
| INTE-0007 | INTE-0003 | INTE-0005 | reviewer | Cardinality Note 07 |
| INTE-0008 | INTE-0006 | INTE-0006 | owner | Cardinality Note 08 |

Claim, category, confidence, and uncertainty constitute the evidentiary layer through which quantitative and qualitative assertions enter the governance record. A claim is a keyed proposition—here keyed repeatedly as EVEN-0002 across multiple fact rows, indicating distinct measurements or observations about the same underlying claim definition rather than unrelated statements. Category partitions claims into interpretive families (Claim Category 01 through Claim Category 04), enabling policy routing: retention rules, escalation thresholds, and evidentiary standards may differ by category even when surface labels appear similar. Confidence (0.621, 0.596, 0.338, 0.364) expresses graded belief in the claim’s truth or stability under current evidence; uncertainty (571.46 down to 43.01) quantifies residual dispersion or epistemic spread around that belief. High confidence paired with high uncertainty, as in one EVEN-0002 observation, signals a narrow point estimate still surrounded by wide operational variance—a pattern compliance officers treat differently from low confidence with moderate uncertainty (EVEN-0006 at 0.338 and 142.53). Together these fields prevent binary pass/fail postures that erase the graded nature of real telemetry, access evaluations, and transformation attestations.

Miscellaneous attributes—labels, numeric values, and other non-key descriptors—complete the record without collapsing into the typed core. Claim Label 01 through Claim Label 04 humanize dimension entries for reporting interfaces, while fact-level values (164.54, 173.58, 166.95, 152.06) carry the measured or computed quantities to which confidence and uncertainty apply. Functional names (encryption transformation, telemetry aggregation service) and dataset names (weather_station_data, raw_telemetry_v3) serve a parallel documentary function on entity tables. Misc fields are deliberately subordinate to identifier, subject, target, role, and cardinality: they inform presentation and computation but must not be used as join keys, lest label drift fracture lineage. Operational discipline therefore treats misc as display and payload, while typed metadata carries enforceable meaning—so that when an aggregation service is rewired from aggregated event count to a new right-hand-side artifact, auditors retarget edges by identifier, revalidate roles and cardinality notes, and recompute claim confidence rather than relying on renamed strings alone.

**fact_claim**

| id | claim_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| EVEN-0001 | EVEN-0002 | 0.621 | 571.46 | 164.54 |
| EVEN-0002 | EVEN-0002 | 0.596 | 43.01 | 173.58 |
| EVEN-0003 | EVEN-0006 | 0.338 | 142.53 | 166.95 |
| EVEN-0004 | EVEN-0002 | 0.364 | 296.86 | 152.06 |
| EVEN-0005 | EVEN-0001 | 0.316 | 715.93 | 997.16 |
| EVEN-0006 | EVEN-0006 | 0.410 | 701.36 | 614.41 |
| EVEN-0007 | EVEN-0003 | 0.162 | 133.33 | 142.05 |

**dim_claim**

| id | claim_label | claim_category |
| --- | --- | --- |
| EVEN-0001 | Claim Label 01 | Claim Category 01 |
| EVEN-0002 | Claim Label 02 | Claim Category 02 |
| EVEN-0003 | Claim Label 03 | Claim Category 03 |
| EVEN-0004 | Claim Label 04 | Claim Category 04 |
| EVEN-0005 | Claim Label 05 | Claim Category 05 |
| EVEN-0006 | Claim Label 06 | Claim Category 06 |