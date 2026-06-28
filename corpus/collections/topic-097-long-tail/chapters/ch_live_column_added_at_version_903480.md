---
chapter_id: ch_live_column_added_at_version_903480
topic_id: 97
family: 07_long_tail
cited_terms: ['column_added_at_version', 'column_distinctness', 'column_dropped_at_version']
model: engine-refine
---

In governed telemetry and release pipelines, every measurable assertion is carried by a stable identifier that survives joins across fact tables, attribute registries, and typed value stores without collapsing into positional or display-name ambiguity. Identifiers such as VERS-0001 and DIST-0004 function as durable handles: they bind a column’s introduction at telemetry_v4.0 or release_2023q4 to the decimal, varchar, and datetime observations that annotate that same record, so that lineage queries, audit replay, and cross-environment reconciliation can resolve “which object” independently of “what was said about it.” Entity linkage extends that discipline one step further, because entity_id partitions the attribute graph so that confidence on throughput_mbps (0.705 for VERS-0001) and a separate confidence on geo_lat_dd (0.546 under VERS-0002) are not conflated merely because they share a parent registry row; each entity carries its own slice of typed misc values, whether those misc fields hold Dimension Kind 01, Encoding 02, or an ISO-8601 recorded_at stamp such as 2025-04-06T14:28:17.

**t_column_added_at_version_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| VERS-0001 | confidence | xsd:decimal |
| VERS-0002 | dimension_kind | xsd:string |
| VERS-0003 | method | xsd:string |
| VERS-0004 | recorded_at | xsd:dateTime |
| VERS-0005 | uncertainty | xsd:decimal |
| VERS-0006 | unit | xsd:string |
| VERS-0007 | value | xsd:decimal |
| VERS-0008 | encoding | xsd:string |

**t_column_added_at_version_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERS-0001 | VERS-0001 | VERS-0004 | 2025-04-06T14:28:17 |
| VERS-0002 | VERS-0002 | VERS-0004 | 2024-08-02T01:36:48 |
| VERS-0003 | VERS-0003 | VERS-0004 | 2025-02-20T12:13:34 |
| VERS-0004 | VERS-0004 | VERS-0004 | 2024-08-09T17:04:50 |
| VERS-0005 | VERS-0005 | VERS-0004 | 2025-03-12T11:57:30 |
| VERS-0006 | VERS-0006 | VERS-0004 | 2023-01-03T00:21:42 |

**t_column_added_at_version_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERS-0001 | VERS-0001 | VERS-0001 | 0.705 |
| VERS-0002 | VERS-0001 | VERS-0005 | 536.45 |
| VERS-0003 | VERS-0001 | VERS-0007 | 797.42 |
| VERS-0004 | VERS-0002 | VERS-0001 | 0.546 |
| VERS-0005 | VERS-0002 | VERS-0005 | 698.14 |
| VERS-0006 | VERS-0002 | VERS-0007 | 151.31 |
| VERS-0007 | VERS-0003 | VERS-0001 | 0.806 |
| VERS-0008 | VERS-0003 | VERS-0005 | 213.36 |

**t_column_added_at_version_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERS-0001 | VERS-0001 | VERS-0002 | Dimension Kind 01 |
| VERS-0002 | VERS-0001 | VERS-0008 | Encoding 02 |
| VERS-0003 | VERS-0001 | VERS-0009 | change rationale |
| VERS-0004 | VERS-0001 | VERS-0010 | de |
| VERS-0005 | VERS-0001 | VERS-0003 | manual |
| VERS-0006 | VERS-0001 | VERS-0006 | kg |
| VERS-0007 | VERS-0002 | VERS-0002 | Dimension Kind 07 |
| VERS-0008 | VERS-0002 | VERS-0008 | Encoding 08 |

**t_column_distinctness_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIST-0001 | DIST-0001 | DIST-0004 | 2024-02-16T07:35:25 |
| DIST-0002 | DIST-0002 | DIST-0004 | 2024-11-18T03:00:42 |
| DIST-0003 | DIST-0003 | DIST-0004 | 2024-09-01T19:05:24 |
| DIST-0004 | DIST-0004 | DIST-0004 | 2023-12-18T13:12:41 |
| DIST-0005 | DIST-0005 | DIST-0004 | 2023-08-26T16:30:42 |
| DIST-0006 | DIST-0006 | DIST-0004 | 2024-12-26T12:24:58 |
| DIST-0007 | DIST-0007 | DIST-0004 | 2024-03-15T16:54:27 |
| DIST-0008 | DIST-0008 | DIST-0004 | 2024-09-07T18:06:58 |

**t_column_distinctness_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIST-0001 | DIST-0001 | DIST-0001 | 0.415 |
| DIST-0002 | DIST-0001 | DIST-0005 | 195.19 |
| DIST-0003 | DIST-0001 | DIST-0007 | 910.18 |
| DIST-0004 | DIST-0002 | DIST-0001 | 0.481 |
| DIST-0005 | DIST-0002 | DIST-0005 | 493.27 |
| DIST-0006 | DIST-0002 | DIST-0007 | 836.73 |
| DIST-0007 | DIST-0003 | DIST-0001 | 0.447 |
| DIST-0008 | DIST-0003 | DIST-0005 | 842.78 |

**t_column_distinctness_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIST-0001 | DIST-0001 | DIST-0002 | Dimension Kind 01 |
| DIST-0002 | DIST-0001 | DIST-0008 | Encoding 02 |
| DIST-0003 | DIST-0001 | DIST-0009 | intake form |
| DIST-0004 | DIST-0001 | DIST-0010 | ja |
| DIST-0005 | DIST-0001 | DIST-0003 | automated |
| DIST-0006 | DIST-0001 | DIST-0006 | deg_C |
| DIST-0007 | DIST-0002 | DIST-0002 | Dimension Kind 07 |
| DIST-0008 | DIST-0002 | DIST-0008 | Encoding 08 |

Attributes and attribute types constitute the semantic contract that makes those identifiers and entities interoperable across consumers that never see the underlying physical layout. An attr names the role a value plays—confidence, dimension_kind, method, recorded_at—while attr_type fixes its interpretive grammar through XSD-aligned typing (xsd:decimal for scored quantities, xsd:string for categorical or procedural labels, xsd:dateTime for temporal provenance). That separation matters in practice because the same attr_name can be materialized in parallel typed stores: confidence appears as 0.415 against sample_batch distinctness and as 0.164 on a retired fact_column row, and only the declared attr_type tells downstream validators whether to apply numeric tolerance bands, lexical normalization, or chronology checks. Method and dimension_kind further anchor operational meaning—intake form versus change rationale on varchar misc slots—so that governance reviews can distinguish how a measurement was produced from what category of schema event it belongs to.

**t_column_distinctness**

| id | column | distinctness_ratio |
| --- | --- | --- |
| DIST-0001 | sample_batch | 0.452 |
| DIST-0002 | device_serial | 0.912 |
| DIST-0003 | protocol_version | 0.999 |
| DIST-0004 | log_sequence | 0.999 |
| DIST-0005 | specimen_code | 0.550 |
| DIST-0006 | telemetry_node | 0.667 |
| DIST-0007 | run_identifier | 0.667 |
| DIST-0008 | sample_batch | 0.103 |

**t_column_distinctness_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| DIST-0001 | confidence | xsd:decimal |
| DIST-0002 | dimension_kind | xsd:string |
| DIST-0003 | method | xsd:string |
| DIST-0004 | recorded_at | xsd:dateTime |
| DIST-0005 | uncertainty | xsd:decimal |
| DIST-0006 | unit | xsd:string |
| DIST-0007 | value | xsd:decimal |
| DIST-0008 | encoding | xsd:string |

Category, in turn, supplies the coarse taxonomy that groups otherwise heterogeneous version events into auditable equivalence classes. Dropped At Schema Version Category 01 through Category 04 do not merely decorate human-readable labels; they classify retirement and migration decisions so that policy engines can treat whole cohorts consistently—permitting stricter retention on one category, accelerated deprecation on another, or differential revalidation when a column’s evidentiary role changes. That categorical layer pairs naturally with dropped at schema version as a first-class lifecycle coordinate: a column may enter at prod_v5.2 yet exit under a distinct version key such as VERS-0006, and the dim_dropped_at_schema_version pairing of label and category makes the “when” of schema retirement legible to operators who must prove that air_pressure_hpa or batch_number was not silently reinterpreted across cutover windows. In the fact layer, dropped_at_schema_version_key VERS-0004 on one row and VERS-0006 on another encodes precisely that discontinuity—schema time is not an afterthought but a foreign key into governed version history.

Confidence and uncertainty articulate complementary faces of epistemic quality on the same governed objects, and their joint presence prevents a single scalar from masquerading as complete metadata. Confidence values in the sub-unit range—0.164, 0.068, 0.107, 0.354 on fact_column, or 0.705 and 0.546 on versioned column annotations—express graded belief that a stated misc value or distinctness ratio faithfully represents the underlying phenomenon, while uncertainty magnitudes such as 560.21, 744.10, 984.09, and 404.01 quantify residual dispersion or bounds that confidence alone would understate. Applied to column distinctness, a ratio of 0.452 on sample_batch signals materially duplicate-prone telemetry, whereas 0.912 on device_serial and 0.999 on protocol_version or log_sequence approach identifier-grade uniqueness; attaching confidence 0.415 and a recorded_at of 2024-02-16T07:35:25 to that assessment documents not only the statistic but the evidentiary moment and trust level at which it was accepted into the catalog. Operators therefore read confidence as admission weight and uncertainty as tolerance envelope—two numbers that must move together when schema versions advance or when a column is marked for drop.

**t_column_added_at_version**

| id | column | added_at_schema_version |
| --- | --- | --- |
| VERS-0001 | throughput_mbps | telemetry_v4.0 |
| VERS-0002 | geo_lat_dd | telemetry_v4.0 |
| VERS-0003 | batch_number | release_2023q4 |
| VERS-0004 | air_pressure_hpa | prod_v5.2 |
| VERS-0005 | sensor_id | staging_v1.1 |
| VERS-0006 | throughput_mbps | prod_v5.2 |

**fact_column**

| id | dropped_at_schema_version_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| VERS-0001 | VERS-0006 | 0.164 | 560.21 | 257.80 |
| VERS-0002 | VERS-0004 | 0.068 | 744.10 | 571.55 |
| VERS-0003 | VERS-0006 | 0.107 | 984.09 | 140.18 |
| VERS-0004 | VERS-0001 | 0.354 | 404.01 | 131.27 |
| VERS-0005 | VERS-0005 | 0.790 | 109.97 | 235.19 |
| VERS-0006 | VERS-0001 | 0.934 | 653.09 | 813.74 |
| VERS-0007 | VERS-0006 | 0.938 | 827.04 | 409.13 |
| VERS-0008 | VERS-0001 | 0.734 | 419.22 | 492.32 |

Misc fields complete the pattern as deliberately polymorphic carriers for values that resist premature normalization: ISO timestamps in datetime misc tables, lexical tokens such as de or ja, operational phrases like change rationale, and raw numeric payloads (257.80, 571.55) on fact rows all land in misc because their governance utility lies in faithful preservation plus typed attr context, not in premature conflation into a single universal column type. In daily practice, that architecture supports end-to-end workflows—onboarding throughput_mbps and geo_lat_dd at telemetry_v4.0, profiling distinctness before promoting device_serial as a near-key, recording method and dimension_kind for reproducibility, and retiring fields with an explicit dropped at schema version, category, and paired confidence–uncertainty—so that compliance reviewers can reconstruct what was known, how strongly it was believed, and under which schema generation it ceased to be authoritative.

**dim_dropped_at_schema_version**

| id | dropped_at_schema_version_label | dropped_at_schema_version_category |
| --- | --- | --- |
| VERS-0001 | Dropped At Schema Version Label 01 | Dropped At Schema Version Category 01 |
| VERS-0002 | Dropped At Schema Version Label 02 | Dropped At Schema Version Category 02 |
| VERS-0003 | Dropped At Schema Version Label 03 | Dropped At Schema Version Category 03 |
| VERS-0004 | Dropped At Schema Version Label 04 | Dropped At Schema Version Category 04 |
| VERS-0005 | Dropped At Schema Version Label 05 | Dropped At Schema Version Category 05 |
| VERS-0006 | Dropped At Schema Version Label 06 | Dropped At Schema Version Category 06 |