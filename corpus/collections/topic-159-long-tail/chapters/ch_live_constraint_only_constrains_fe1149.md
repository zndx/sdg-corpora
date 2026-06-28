---
chapter_id: ch_live_constraint_only_constrains_fe1149
topic_id: 159
family: 01_foundation
cited_terms: ['constraint_only_constrains', 'profile_has_null_rate', 'measurement_with_method']
model: engine-refine
---

Constraint governance in data quality frameworks begins by binding policy rules to specific system components. A constraint such as `log_level_filter` governs the `query_engine`, while `checksum_algorithm` applies to the `network_interface`, and `data_retention_policy` is enforced across `telemetry_streams`. Each constraint carries typed attributes that define its operational parameters: an `effective_date` of type `xsd:date` anchors when the rule takes effect, an `enforcement` attribute of type `xsd:string` specifies the enforcement mode, a `mandatory` flag of type `xsd:boolean` indicates whether compliance is required, and a `priority` of type `xsd:integer` orders competing constraints. Concrete values ground these attributes — effective dates such as `2023-09-12`, `2025-06-06`, `2023-06-09`, and `2024-12-03` establish temporal scope; boolean values of `true` and `false` toggle mandatory enforcement; integer priorities like `4`, `996`, `1`, and `40` rank constraint precedence; and string-valued attributes capture identifiers such as `Encoding 01`, `Enforcement 02`, `intake form`, and `ja`.

**t_constraint_only_constrains**

| id | constraint | constrains |
| --- | --- | --- |
| CONS-0001 | log_level_filter | query_engine |
| CONS-0002 | checksum_algorithm | network_interface |
| CONS-0003 | data_retention_policy | telemetry_streams |
| CONS-0004 | data_retention_policy | telemetry_streams |
| CONS-0005 | data_retention_policy | sensor_reading |
| CONS-0006 | access_control_matrix | api_gateway |

**t_constraint_only_constrains_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CONS-0001 | effective_date | xsd:date |
| CONS-0002 | enforcement | xsd:string |
| CONS-0003 | mandatory | xsd:boolean |
| CONS-0004 | priority | xsd:integer |
| CONS-0005 | review_cycle_days | xsd:integer |
| CONS-0006 | scope | xsd:string |
| CONS-0007 | encoding | xsd:string |
| CONS-0008 | label_text | xsd:string |

**t_constraint_only_constrains_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONS-0001 | CONS-0001 | CONS-0003 | true |
| CONS-0002 | CONS-0002 | CONS-0003 | false |
| CONS-0003 | CONS-0003 | CONS-0003 | true |
| CONS-0004 | CONS-0004 | CONS-0003 | true |
| CONS-0005 | CONS-0005 | CONS-0003 | false |
| CONS-0006 | CONS-0006 | CONS-0003 | false |

**t_constraint_only_constrains_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONS-0001 | CONS-0001 | CONS-0001 | 2023-09-12 |
| CONS-0002 | CONS-0002 | CONS-0001 | 2025-06-06 |
| CONS-0003 | CONS-0003 | CONS-0001 | 2023-06-09 |
| CONS-0004 | CONS-0004 | CONS-0001 | 2024-12-03 |
| CONS-0005 | CONS-0005 | CONS-0001 | 2024-06-17 |
| CONS-0006 | CONS-0006 | CONS-0001 | 2025-05-30 |

**t_constraint_only_constrains_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONS-0001 | CONS-0001 | CONS-0004 | 4 |
| CONS-0002 | CONS-0001 | CONS-0005 | 996 |
| CONS-0003 | CONS-0002 | CONS-0004 | 1 |
| CONS-0004 | CONS-0002 | CONS-0005 | 40 |
| CONS-0005 | CONS-0003 | CONS-0004 | 3 |
| CONS-0006 | CONS-0003 | CONS-0005 | 497 |
| CONS-0007 | CONS-0004 | CONS-0004 | 2 |
| CONS-0008 | CONS-0004 | CONS-0005 | 719 |

**t_constraint_only_constrains_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONS-0001 | CONS-0001 | CONS-0007 | Encoding 01 |
| CONS-0002 | CONS-0001 | CONS-0002 | Enforcement 02 |
| CONS-0003 | CONS-0001 | CONS-0008 | intake form |
| CONS-0004 | CONS-0001 | CONS-0009 | ja |
| CONS-0005 | CONS-0001 | CONS-0006 | Scope 05 |
| CONS-0006 | CONS-0002 | CONS-0007 | Encoding 06 |
| CONS-0007 | CONS-0002 | CONS-0002 | Enforcement 07 |
| CONS-0008 | CONS-0002 | CONS-0008 | pre-release note |

The typed value tables separate attribute metadata from actual values, enabling schema evolution without altering constraint definitions. Boolean attributes resolve to `true` or `false` depending on whether a constraint is mandatory; date attributes encode effective dates in ISO 8601 format; integer attributes hold priority scores; and varchar attributes store free-form descriptors. This separation allows the same attribute definition — for example, `mandatory` — to be evaluated against different constraint instances without conflating the attribute's type with its runtime value.

Null rate profiles quantify how often expected data is absent within a given quality regime. Profiles such as `QualityGateConfig`, `ObservationProtocolAlpha`, and `SensorTelemetryV2` each declare one or more null rate types — `dropRate`, `absentMetric`, and `missingBaseline` — that describe the nature of the data gap. The relationship between a profile and a null rate is mediated by a role: a profile may act as the `owner` of a null rate, a `contributor` to its computation, or a `reviewer` responsible for assessment. For instance, `ObservationProtocolAlpha` owns a null rate while `SensorTelemetryV2` contributes to two distinct null rates, and `QualityGateConfig` appears both as an owner and a contributor across different null rate instances. This role-based linkage makes it possible to trace which profiles are accountable for which gaps and which are merely supplying input.

**t_profile_has_null_rate**

| id | profile |
| --- | --- |
| RATE-0001 | QualityGateConfig |
| RATE-0002 | QualityGateConfig |
| RATE-0003 | ObservationProtocolAlpha |
| RATE-0004 | SensorTelemetryV2 |
| RATE-0005 | TelemetryStreamSchema |
| RATE-0006 | TelemetryStreamSchema |
| RATE-0007 | QualityGateConfig |

**t_profile_has_null_rate_null_rate**

| id | null_rate |
| --- | --- |
| RATE-0001 | dropRate |
| RATE-0002 | absentMetric |
| RATE-0003 | missingBaseline |
| RATE-0004 | absentMetric |
| RATE-0005 | absentMetric |
| RATE-0006 | zeroPointTwo |

**t_profile_has_null_rate__null_rate**

| id | profile_id | null_rate_id | role |
| --- | --- | --- | --- |
| RATE-0001 | RATE-0003 | RATE-0005 | owner |
| RATE-0002 | RATE-0007 | RATE-0002 | contributor |
| RATE-0003 | RATE-0004 | RATE-0006 | reviewer |
| RATE-0004 | RATE-0004 | RATE-0001 | contributor |
| RATE-0005 | RATE-0007 | RATE-0003 | observer |
| RATE-0006 | RATE-0007 | RATE-0006 | owner |
| RATE-0007 | RATE-0001 | RATE-0001 | contributor |
| RATE-0008 | RATE-0004 | RATE-0001 | contributor |

Measurements capture the actual observed values alongside their quality metadata. Each measurement record carries a `value` — for example, `353.34`, `660.64`, `878.99`, or `64.10` — and is linked to a measurement method through a `via_method_key`. The quality of each measurement is expressed through two complementary dimensions: `confidence`, a probability-like score ranging from `0.307` to `0.945`, and `uncertainty`, an absolute deviation measured in the same units as the value, ranging from `120.70` to `364.07`. A measurement with confidence `0.945` and uncertainty `279.24` is substantially more reliable than one with confidence `0.307` and uncertainty `364.07`, even though both may report values in a similar range.

**fact_measurement**

| id | via_method_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| METH-0001 | METH-0003 | 0.496 | 306.26 | 353.34 |
| METH-0002 | METH-0002 | 0.945 | 279.24 | 660.64 |
| METH-0003 | METH-0005 | 0.506 | 120.70 | 878.99 |
| METH-0004 | METH-0005 | 0.307 | 364.07 | 64.10 |
| METH-0005 | METH-0001 | 0.923 | 642.96 | 897.70 |

The `dim_via_method` dimension classifies measurement methods by a human-readable label and a categorical group. Labels such as `Via Method Label 01` through `Via Method Label 04` identify individual methods, while categories like `Via Method Category 01` through `Via Method Category 04` group methods by their underlying technique or provenance. This classification enables aggregation of measurements by method type, supporting audits that compare confidence and uncertainty distributions across categories. Together, the constraint framework, null rate profiles, and measurement records form a closed loop: constraints define what quality means, null rate profiles quantify how often data falls short, and measurements with their confidence and uncertainty scores provide the evidence needed to evaluate compliance.

**dim_via_method**

| id | via_method_label | via_method_category |
| --- | --- | --- |
| METH-0001 | Via Method Label 01 | Via Method Category 01 |
| METH-0002 | Via Method Label 02 | Via Method Category 02 |
| METH-0003 | Via Method Label 03 | Via Method Category 03 |
| METH-0004 | Via Method Label 04 | Via Method Category 04 |
| METH-0005 | Via Method Label 05 | Via Method Category 05 |
| METH-0006 | Via Method Label 06 | Via Method Category 06 |