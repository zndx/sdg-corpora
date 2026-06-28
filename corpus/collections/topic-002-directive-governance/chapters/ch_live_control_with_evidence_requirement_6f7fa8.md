---
chapter_id: ch_live_control_with_evidence_requirement_6f7fa8
topic_id: 2
family: 03_directive_governance
cited_terms: ['control_with_evidence_requirement', 'transformation_equiv_io_intersection', 'entity_match_link']
model: engine-refine
---

Compliance frameworks require that every control obligation be traceable to verifiable evidence, and that traceability is established through a structured linkage between control identifiers and their supporting artifacts. A control such as `DataEncryptionAtRest` may carry multiple evidence requirements—`LINK-0001`, `LINK-0003`, and `LINK-0004` all reference the same control yet serve distinct enforcement postures. The enforcement classification determines the operational weight of the requirement: `mandatory` obligations demand strict adherence, `advisory` items guide best practice without penalty, and `deprecated` entries signal controls that have been retired from active enforcement. This tripartite enforcement model ensures that compliance programs can evolve without discarding historical audit trails, while the `language` attribute—spanning `en`, `es`, and `ja`—allows the same control to be communicated across multilingual organizational boundaries without semantic drift.

**t_control_with_evidence_requirement**

| id | control | requires_evidence | enforcement | language |
| --- | --- | --- | --- | --- |
| REQU-0001 | DataEncryptionAtRest | LINK-0001 | deprecated | en |
| REQU-0002 | BaselineConfigurationCheck | LINK-0006 | advisory | es |
| REQU-0003 | DataEncryptionAtRest | LINK-0003 | deprecated | en |
| REQU-0004 | DataEncryptionAtRest | LINK-0001 | mandatory | ja |
| REQU-0005 | MultiFactorAuth | LINK-0004 | advisory | ja |
| REQU-0006 | DataEncryptionAtRest | LINK-0003 | blocking | en |

Entity-to-requirement matching provides the mechanism by which physical or logical assets are mapped to their governing controls. An asset such as `Lab instrument SN-4491` may be linked to requirement `REQU-0001`, while `Sample batch SB-2214` connects to `REQU-0006`, and `Dataset v4.2.1` to `REQU-0004`. Each match carries typed attributes that quantify the relationship: the `confidence` attribute, defined with type `xsd:decimal`, holds values ranging from `0.249` to `0.772`, reflecting the degree of certainty in the linkage; the `dimension_kind` attribute, typed as `xsd:string`, takes values such as `Dimension Kind 01`; and the `recorded_at` attribute, typed as `xsd:dateTime`, anchors each match to a precise timestamp—`2025-02-02T03:38:54` for one match, `2024-07-01T04:17:43` for another—enabling temporal auditability. Additional string-valued attributes such as `method` capture procedural context, while `misc` columns store free-form annotations like `audit excerpt` or `Encoding 02`, preserving granular evidence that does not fit structured schemas.

**t_entity_match_link_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LINK-0001 | LINK-0001 | LINK-0004 | 2025-02-02T03:38:54 |
| LINK-0002 | LINK-0002 | LINK-0004 | 2024-07-01T04:17:43 |
| LINK-0003 | LINK-0003 | LINK-0004 | 2023-10-04T15:34:58 |
| LINK-0004 | LINK-0004 | LINK-0004 | 2025-05-20T07:58:08 |
| LINK-0005 | LINK-0005 | LINK-0004 | 2023-04-10T04:16:09 |
| LINK-0006 | LINK-0006 | LINK-0004 | 2023-09-16T03:40:04 |

**t_entity_match_link_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LINK-0001 | LINK-0001 | LINK-0001 | 0.249 |
| LINK-0002 | LINK-0001 | LINK-0005 | 448.20 |
| LINK-0003 | LINK-0001 | LINK-0007 | 699.43 |
| LINK-0004 | LINK-0002 | LINK-0001 | 0.772 |
| LINK-0005 | LINK-0002 | LINK-0005 | 156.67 |
| LINK-0006 | LINK-0002 | LINK-0007 | 439.51 |
| LINK-0007 | LINK-0003 | LINK-0001 | 0.389 |
| LINK-0008 | LINK-0003 | LINK-0005 | 388.52 |

**t_entity_match_link_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LINK-0001 | LINK-0001 | LINK-0002 | Dimension Kind 01 |
| LINK-0002 | LINK-0001 | LINK-0008 | Encoding 02 |
| LINK-0003 | LINK-0001 | LINK-0009 | audit excerpt |
| LINK-0004 | LINK-0001 | LINK-0010 | es |
| LINK-0005 | LINK-0001 | LINK-0003 | manual |
| LINK-0006 | LINK-0001 | LINK-0006 | count |
| LINK-0007 | LINK-0002 | LINK-0002 | Dimension Kind 07 |
| LINK-0008 | LINK-0002 | LINK-0008 | Encoding 08 |

Data transformation pipelines introduce a parallel governance layer in which input and output datasets are connected through transformation operations, each governed by role-based access and cardinality constraints. A transformation identified as `INTE-0001` may consume `iot_device_streams` and `weather_station_data` as inputs while producing `financial_transactions` as output. The relationship between a transformation and its datasets is mediated through subject-target associations that carry a `role` designation—`owner`, `contributor`, `reviewer`, or `observer`—determining who may modify, validate, or merely observe the data flow. For instance, a dataset may serve as `owner` of a transformation's input, while another dataset assumes a `reviewer` role on the output, creating a separation of duties that mirrors traditional compliance controls.

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

Cardinality notes attached to output dataset associations document the multiplicity constraints governing data flow. Each association—whether linking transformation `INTE-0005` to output `INTE-0006` or transformation `INTE-0003` to output `INTE-0003`—carries a cardinality note such as `Cardinality Note 01` through `Cardinality Note 04`, which specifies whether the relationship is one-to-one, one-to-many, or many-to-many. These constraints are essential for downstream data quality validation: a transformation that produces `raw_telemetry_v3` from `network_traffic_logs` must respect its cardinality bounds to prevent data duplication or loss during aggregation. The `aggregate_daily_metrics` and `merge_sensor_readings` transformations exemplify common patterns where multiple input streams converge into consolidated outputs, each governed by its own set of role assignments and cardinality rules.

The interplay between entity matching, control enforcement, and transformation governance creates a unified compliance fabric. When a governance policy such as `DOC-992` is linked to requirement `REQU-0006`, and that requirement in turn references evidence items tied to specific controls, the framework establishes end-to-end traceability from policy to implementation. Decimal-valued attributes like `448.20` and `699.43` provide quantitative measures of compliance posture, while datetime-stamped records ensure that every match and every transformation can be audited against a temporal baseline. This architecture—where identifiers serve as stable anchors, attributes carry typed semantics, roles enforce access boundaries, and cardinality notes constrain data relationships—enables organizations to demonstrate compliance with the same rigor that regulators expect.

**t_transformation_equiv_io_intersection**

| id | transformation |
| --- | --- |
| INTE-0001 | aggregate_daily_metrics |
| INTE-0002 | aggregate_daily_metrics |
| INTE-0003 | merge_sensor_readings |
| INTE-0004 | merge_sensor_readings |
| INTE-0005 | resample_telemetry_stream |
| INTE-0006 | transform_csv_to_parquet |

**t_entity_match_link**

| id | entity | matches_entity |
| --- | --- | --- |
| LINK-0001 | Lab instrument SN-4491 | REQU-0001 |
| LINK-0002 | Sample batch SB-2214 | REQU-0006 |
| LINK-0003 | Dataset v4.2.1 | REQU-0004 |
| LINK-0004 | Governance policy DOC-992 | REQU-0006 |
| LINK-0005 | Governance policy DOC-992 | REQU-0004 |
| LINK-0006 | Provenance log PR-7741 | REQU-0005 |

**t_entity_match_link_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| LINK-0001 | confidence | xsd:decimal |
| LINK-0002 | dimension_kind | xsd:string |
| LINK-0003 | method | xsd:string |
| LINK-0004 | recorded_at | xsd:dateTime |
| LINK-0005 | uncertainty | xsd:decimal |
| LINK-0006 | unit | xsd:string |
| LINK-0007 | value | xsd:decimal |
| LINK-0008 | encoding | xsd:string |