---
chapter_id: ch_live_plausibility_function_for_884631
topic_id: 92
family: 07_long_tail
cited_terms: ['plausibility_function_for', 'baseline_for_metric', 'equiv_union_basic']
model: engine-refine
---

Plausibility functions constitute the foundational assessment constructs within the governance framework, each uniquely identified by an identifier such as `FUNC-0001` through `FUNC-0004`, and characterized by a plausibility classification—`firmware_version_mismatch`, `disputed_rating`, `weak_indication`, `model_convergence_failure`—alongside a corresponding plausibility-for-claim designation including `temperature_threshold_exceeded`, `disk_io_saturation`, and `packet_loss_rate_high`. These functions serve as the evaluative lens through which operational anomalies are categorized and their evidentiary weight assigned, forming the primary axis of the assessment architecture. The identifier column functions as the immutable key that anchors every subsequent relationship, ensuring referential integrity across the attribute-value mappings that follow.

**t_plausibility_function_for**

| id | plausibility | plausibility_for_claim |
| --- | --- | --- |
| FUNC-0001 | firmware_version_mismatch | temperature_threshold_exceeded |
| FUNC-0002 | disputed_rating | weak_indication |
| FUNC-0003 | weak_indication | disk_io_saturation |
| FUNC-0004 | model_convergence_failure | packet_loss_rate_high |
| FUNC-0005 | network_latency_spike | divergent_metric |
| FUNC-0006 | authentication_token_expired | high_confidence |
| FUNC-0007 | packet_loss_rate_high | model_convergence_failure |

**t_plausibility_function_for_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| FUNC-0001 | confidence | xsd:decimal |
| FUNC-0002 | dimension_kind | xsd:string |
| FUNC-0003 | method | xsd:string |
| FUNC-0004 | recorded_at | xsd:dateTime |
| FUNC-0005 | uncertainty | xsd:decimal |
| FUNC-0006 | unit | xsd:string |
| FUNC-0007 | value | xsd:decimal |
| FUNC-0008 | encoding | xsd:string |

Attributes define the measurable dimensions of each plausibility function, with `attr_name` values such as `confidence`, `dimension_kind`, `method`, and `recorded_at` paired with their respective `attr_type` declarations—`xsd:decimal`, `xsd:string`, `xsd:string`, `xsd:dateTime`—establishing the schema-level constraints on permissible values. The attr type designation is not merely typographical; it governs validation, storage routing, and query semantics, directing each attribute's values into the appropriate typed value table. An attribute identified as `xsd:decimal` will have its values stored in the decimal value table, while `xsd:dateTime` attributes route to the datetime value table, and `xsd:string` attributes to the varchar value table, creating a type-dispatched storage pattern that preserves data integrity at the schema level.

The entity column in the value tables represents the concrete instantiation of a plausibility function to which attribute values are assigned, establishing a many-to-one relationship where a single entity may accumulate multiple attribute measurements across different value types. For instance, entity `FUNC-0001` carries a decimal value of `0.286` against attribute `FUNC-0001`, a decimal value of `84.30` against attribute `FUNC-0005`, and a decimal value of `878.30` against attribute `FUNC-0007`, while simultaneously holding varchar values including `Dimension Kind 01` and `Encoding 02` against attributes `FUNC-0002` and `FUNC-0008` respectively, and a datetime value of `2023-05-06T07:18:55` against attribute `FUNC-0004`. This multi-typed attribute accumulation per entity reflects the heterogeneous nature of operational telemetry, where a single assessment point may carry numeric confidence scores, categorical classifications, and temporal stamps simultaneously.

**t_plausibility_function_for_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FUNC-0001 | FUNC-0001 | FUNC-0004 | 2023-05-06T07:18:55 |
| FUNC-0002 | FUNC-0002 | FUNC-0004 | 2023-03-14T16:18:20 |
| FUNC-0003 | FUNC-0003 | FUNC-0004 | 2024-05-13T15:52:44 |
| FUNC-0004 | FUNC-0004 | FUNC-0004 | 2025-06-06T01:40:51 |
| FUNC-0005 | FUNC-0005 | FUNC-0004 | 2023-05-21T17:57:56 |
| FUNC-0006 | FUNC-0006 | FUNC-0004 | 2024-10-18T22:54:00 |
| FUNC-0007 | FUNC-0007 | FUNC-0004 | 2023-11-29T06:24:08 |

**t_plausibility_function_for_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FUNC-0001 | FUNC-0001 | FUNC-0001 | 0.286 |
| FUNC-0002 | FUNC-0001 | FUNC-0005 | 84.30 |
| FUNC-0003 | FUNC-0001 | FUNC-0007 | 878.30 |
| FUNC-0004 | FUNC-0002 | FUNC-0001 | 0.033 |
| FUNC-0005 | FUNC-0002 | FUNC-0005 | 492.02 |
| FUNC-0006 | FUNC-0002 | FUNC-0007 | 356.58 |
| FUNC-0007 | FUNC-0003 | FUNC-0001 | 0.482 |
| FUNC-0008 | FUNC-0003 | FUNC-0005 | 926.97 |

**t_plausibility_function_for_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FUNC-0001 | FUNC-0001 | FUNC-0002 | Dimension Kind 01 |
| FUNC-0002 | FUNC-0001 | FUNC-0008 | Encoding 02 |
| FUNC-0003 | FUNC-0001 | FUNC-0009 | pre-release note |
| FUNC-0004 | FUNC-0001 | FUNC-0010 | en |
| FUNC-0005 | FUNC-0001 | FUNC-0003 | manual |
| FUNC-0006 | FUNC-0001 | FUNC-0006 | kg |
| FUNC-0007 | FUNC-0002 | FUNC-0002 | Dimension Kind 07 |
| FUNC-0008 | FUNC-0002 | FUNC-0008 | Encoding 08 |

The baseline architecture introduces a relational topology between metrics through the subject-target-role triad, where `baseline_id` functions as the subject, `baseline_for_id` as the target, and `role` as the relationship classifier. Baseline `METR-0007` assumes the role of `owner` with respect to target `METR-0004`, while baseline `METR-0002` assumes the role of `contributor` toward target `METR-0005`, and baseline `METR-0001` assumes the role of `observer` toward target `METR-0005`. The baseline definitions themselves—`Standard_Daylight_Cycle`, `Power_Consumption`, `Structural_Stress`, `Steady_State_Vibration`—are mapped to their respective metrics through the baseline-for relationship, with `Data_Ingestion_Rate` appearing as a baseline-for target for both `METR-0001` and `METR-0002`, indicating that multiple baselines may converge on a single metric under evaluation.

**t_baseline_for_metric__baseline_for**

| id | baseline_id | baseline_for_id | role |
| --- | --- | --- | --- |
| METR-0001 | METR-0007 | METR-0004 | owner |
| METR-0002 | METR-0002 | METR-0005 | contributor |
| METR-0003 | METR-0001 | METR-0005 | observer |
| METR-0004 | METR-0007 | METR-0003 | contributor |
| METR-0005 | METR-0007 | METR-0004 | contributor |
| METR-0006 | METR-0001 | METR-0002 | reviewer |
| METR-0007 | METR-0004 | METR-0006 | reviewer |
| METR-0008 | METR-0007 | METR-0002 | reviewer |

Equivalence unions provide a parallel classification layer, where identifiers such as `UNIO-0001` through `UNIO-0004` anchor triples of equivalent designations—`telemetry_hub_alpha`, `schema_v3_prod`, `governance_log_f` for the first union; `metric_bundle_plus`, `warehouse_db_staging`, `metric_aggregate_g` for the second—enabling cross-system nomenclature resolution. These equivalence groups operate orthogonally to the plausibility and baseline structures, serving as a metadata reconciliation mechanism that maps disparate naming conventions to canonical identifiers, thereby supporting interoperability across heterogeneous data sources without altering the underlying assessment or baseline relationships.

**t_baseline_for_metric**

| id | baseline |
| --- | --- |
| METR-0001 | Standard_Daylight_Cycle |
| METR-0002 | Power_Consumption |
| METR-0003 | Structural_Stress |
| METR-0004 | Steady_State_Vibration |
| METR-0005 | Factory_A_NightShift |
| METR-0006 | Battery_Capacity |
| METR-0007 | Standard_Daylight_Cycle |

**t_baseline_for_metric_baseline_for**

| id | baseline_for |
| --- | --- |
| METR-0001 | Data_Ingestion_Rate |
| METR-0002 | Data_Ingestion_Rate |
| METR-0003 | Steady_State_Vibration |
| METR-0004 | Power_Consumption |
| METR-0005 | Battery_Capacity |
| METR-0006 | Steady_State_Vibration |

**t_equiv_union_basic**

| id | equiv | equiv_2 | equiv_3 |
| --- | --- | --- | --- |
| UNIO-0001 | telemetry_hub_alpha | schema_v3_prod | governance_log_f |
| UNIO-0002 | metric_bundle_plus | warehouse_db_staging | metric_aggregate_g |
| UNIO-0003 | ingest_pipeline_main | probe_array_thirteen | repository_db_j |
| UNIO-0004 | sensor_array_beta | compliance_log_sixteen | edge_node_h |
| UNIO-0005 | batch_run_four | staging_run_twelve | governance_log_f |