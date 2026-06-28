---
chapter_id: ch_live_lift_with_baseline_rate_d0002e
topic_id: 5
family: 02_observation_measurement
cited_terms: ['lift_with_baseline_rate', 'nist80053_control_subclass', 'column_lineage_for_compliance_claim']
model: engine-refine
---

The relational model organizes observational data through a disciplined separation of identifiers, attributes, and typed values, each serving a distinct governance function. An identifier—such as `RATE-0001` or `CONT-0003`—uniquely anchors a row across the schema, enabling cross-table joins without ambiguity. Attributes, declared in metadata tables like `t_lift_with_baseline_rate_attr` and `t_nist80053_control_subclass_attr`, define the semantic properties of an entity: `confidence`, `dimension_kind`, `method`, and `recorded_at` for lift measurements; `effective_date`, `enforcement`, `mandatory`, and `priority` for NIST control subclasses. Each attribute carries an `attr_type`—`xsd:decimal`, `xsd:string`, `xsd:dateTime`, `xsd:boolean`, `xsd:date`, or `xsd:integer`—that constrains the permissible value domain and enforces type safety at ingestion time. This separation of attribute schema from attribute values permits the same entity to accumulate heterogeneous properties without schema migration.

**t_lift_with_baseline_rate**

| id | lift | baseline_rate |
| --- | --- | --- |
| RATE-0001 | Conversion Gain | CONT-0005 |
| RATE-0002 | Latency Peak Reduction | CONT-0006 |
| RATE-0003 | Click Through Uplift | CONT-0004 |
| RATE-0004 | Model v2 Accuracy Lift | CONT-0003 |
| RATE-0005 | Latency Peak Reduction | CONT-0001 |
| RATE-0006 | Ad Improvement | CONT-0006 |

**t_lift_with_baseline_rate_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| RATE-0001 | confidence | xsd:decimal |
| RATE-0002 | dimension_kind | xsd:string |
| RATE-0003 | method | xsd:string |
| RATE-0004 | recorded_at | xsd:dateTime |
| RATE-0005 | uncertainty | xsd:decimal |
| RATE-0006 | unit | xsd:string |
| RATE-0007 | value | xsd:decimal |
| RATE-0008 | encoding | xsd:string |

**t_lift_with_baseline_rate_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RATE-0001 | RATE-0001 | RATE-0004 | 2024-01-14T18:32:00 |
| RATE-0002 | RATE-0002 | RATE-0004 | 2023-02-02T03:32:58 |
| RATE-0003 | RATE-0003 | RATE-0004 | 2024-08-11T22:28:18 |
| RATE-0004 | RATE-0004 | RATE-0004 | 2024-10-19T09:19:40 |
| RATE-0005 | RATE-0005 | RATE-0004 | 2023-07-24T08:45:17 |
| RATE-0006 | RATE-0006 | RATE-0004 | 2025-03-24T11:20:59 |

**t_lift_with_baseline_rate_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RATE-0001 | RATE-0001 | RATE-0001 | 0.799 |
| RATE-0002 | RATE-0001 | RATE-0005 | 559.38 |
| RATE-0003 | RATE-0001 | RATE-0007 | 634.64 |
| RATE-0004 | RATE-0002 | RATE-0001 | 0.522 |
| RATE-0005 | RATE-0002 | RATE-0005 | 254.23 |
| RATE-0006 | RATE-0002 | RATE-0007 | 594.57 |
| RATE-0007 | RATE-0003 | RATE-0001 | 0.290 |
| RATE-0008 | RATE-0003 | RATE-0005 | 361.02 |

**t_lift_with_baseline_rate_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RATE-0001 | RATE-0001 | RATE-0002 | Dimension Kind 01 |
| RATE-0002 | RATE-0001 | RATE-0008 | Encoding 02 |
| RATE-0003 | RATE-0001 | RATE-0009 | pre-release note |
| RATE-0004 | RATE-0001 | RATE-0010 | de |
| RATE-0005 | RATE-0001 | RATE-0003 | automated |
| RATE-0006 | RATE-0001 | RATE-0006 | ratio |
| RATE-0007 | RATE-0002 | RATE-0002 | Dimension Kind 07 |
| RATE-0008 | RATE-0002 | RATE-0008 | Encoding 08 |

**t_nist80053_control_subclass**

| id | nist | nist80053_control |
| --- | --- | --- |
| CONT-0001 | NIST SP 800-53 Rev 5 | RATE-0002 |
| CONT-0002 | NIST SP 800-171 | RATE-0006 |
| CONT-0003 | NIST CSF 2.0 | RATE-0005 |
| CONT-0004 | NIST SP 800-207 | RATE-0004 |
| CONT-0005 | FIPS 140-3 | RATE-0006 |
| CONT-0006 | NIST SP 800-171 | RATE-0006 |

**t_nist80053_control_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CONT-0001 | effective_date | xsd:date |
| CONT-0002 | enforcement | xsd:string |
| CONT-0003 | mandatory | xsd:boolean |
| CONT-0004 | priority | xsd:integer |
| CONT-0005 | review_cycle_days | xsd:integer |
| CONT-0006 | scope | xsd:string |
| CONT-0007 | encoding | xsd:string |
| CONT-0008 | label_text | xsd:string |

**t_nist80053_control_subclass_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONT-0001 | CONT-0001 | CONT-0003 | true |
| CONT-0002 | CONT-0002 | CONT-0003 | true |
| CONT-0003 | CONT-0003 | CONT-0003 | true |
| CONT-0004 | CONT-0004 | CONT-0003 | false |
| CONT-0005 | CONT-0005 | CONT-0003 | true |
| CONT-0006 | CONT-0006 | CONT-0003 | true |

**t_nist80053_control_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONT-0001 | CONT-0001 | CONT-0001 | 2023-01-02 |
| CONT-0002 | CONT-0002 | CONT-0001 | 2024-11-29 |
| CONT-0003 | CONT-0003 | CONT-0001 | 2024-03-23 |
| CONT-0004 | CONT-0004 | CONT-0001 | 2025-03-12 |
| CONT-0005 | CONT-0005 | CONT-0001 | 2024-03-19 |
| CONT-0006 | CONT-0006 | CONT-0001 | 2023-10-15 |

**t_nist80053_control_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONT-0001 | CONT-0001 | CONT-0004 | 3 |
| CONT-0002 | CONT-0001 | CONT-0005 | 776 |
| CONT-0003 | CONT-0002 | CONT-0004 | 4 |
| CONT-0004 | CONT-0002 | CONT-0005 | 46 |
| CONT-0005 | CONT-0003 | CONT-0004 | 1 |
| CONT-0006 | CONT-0003 | CONT-0005 | 151 |
| CONT-0007 | CONT-0004 | CONT-0004 | 4 |
| CONT-0008 | CONT-0004 | CONT-0005 | 507 |

Entity rows materialize through value tables that partition data by type, a design that aligns with the XSD type system and avoids nullable columns. Decimal attributes such as `confidence` and `baseline_rate` reside in `t_lift_with_baseline_rate_val_decimal`, where values like `0.799`, `559.38`, and `634.64` are stored alongside their `entity_id` and `attr_id` foreign keys. String-valued attributes—`dimension_kind` yielding `Dimension Kind 01`, `encoding` yielding `Encoding 02`, and free-text fields like `pre-release note` and `de`—are housed in `t_lift_with_baseline_rate_val_varchar`. Temporal attributes, including `recorded_at`, are persisted in `t_lift_with_baseline_rate_val_datetime` with ISO 8601 timestamps such as `2024-01-14T18:32:00` and `2023-02-02T03:32:58`. Boolean and integer attributes for NIST controls follow the same pattern: `t_nist80053_control_subclass_val_boolean` carries `true` and `false` for the `mandatory` flag, while `t_nist80053_control_subclass_val_int` stores priority scores like `3`, `776`, `4`, and `46`. This type-partitioned value architecture ensures that each column's storage format matches its declared type, eliminating runtime coercion and simplifying query optimization.

The `fact_column` table introduces a measurement layer where each row records a column observation with an associated `confidence` score and `uncertainty` magnitude. Confidence values—`0.164`, `0.068`, `0.107`, and `0.354`—quantify the model's certainty that the observed `value` (e.g., `257.80`, `571.55`, `140.18`, `131.27`) correctly reflects the underlying data element. Uncertainty, expressed as continuous magnitudes like `560.21`, `744.10`, `984.09`, and `404.01`, provides the complementary dispersion metric, enabling downstream consumers to weight observations by reliability. The `column_key` foreign link ties each fact row to its dimensional counterpart in `dim_column`, where `column_label` values such as `Column Label 01` through `Column Label 04` and `column_category` values like `Column Category 01` through `Column Category 04` supply the human-readable classification and grouping context.

**fact_column**

| id | column_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| CLAI-0001 | CLAI-0005 | 0.164 | 560.21 | 257.80 |
| CLAI-0002 | CLAI-0006 | 0.068 | 744.10 | 571.55 |
| CLAI-0003 | CLAI-0004 | 0.107 | 984.09 | 140.18 |
| CLAI-0004 | CLAI-0001 | 0.354 | 404.01 | 131.27 |
| CLAI-0005 | CLAI-0006 | 0.790 | 109.97 | 235.19 |
| CLAI-0006 | CLAI-0003 | 0.934 | 653.09 | 813.74 |
| CLAI-0007 | CLAI-0005 | 0.938 | 827.04 | 409.13 |
| CLAI-0008 | CLAI-0002 | 0.734 | 419.22 | 492.32 |

Governance metadata bridges the lift measurements to regulatory frameworks through the `t_nist80053_control_subclass` table, which maps NIST control identifiers to specific lift rates. A row with `id` `CONT-0001` references `NIST SP 800-53 Rev 5` and points to `RATE-0002` (Latency Peak Reduction); `CONT-0002` maps `NIST SP 800-171` to `RATE-0006`; `CONT-0003` links `NIST CSF 2.0` to `RATE-0005`; and `CONT-0004` associates `NIST SP 800-207` to `RATE-0004`. The baseline rates in the lift table—`CONT-0005`, `CONT-0006`, `CONT-0004`, `CONT-0003`—serve as the referential glue that connects performance metrics to their controlling policies. This structure permits an auditor to trace a lift measurement like `Conversion Gain` back through its baseline control to the originating NIST framework, establishing an auditable chain from operational metric to compliance obligation.

The `misc` column, present across all value tables, functions as a catch-all for heterogeneous data that does not fit the primary typed attributes—free-text annotations, secondary encoding identifiers, and calibration records. In `t_nist80053_control_subclass_val_varchar`, for instance, `misc` values include `Encoding 01`, `Enforcement 02`, `calibration record`, and `es`, demonstrating how the schema accommodates unstructured or semi-structured metadata without polluting the typed attribute namespace. This design preserves the integrity of the strongly typed columns while providing a flexible extension point for operational notes, locale codes, and other ancillary information that accompanies the primary data.

**t_nist80053_control_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONT-0001 | CONT-0001 | CONT-0007 | Encoding 01 |
| CONT-0002 | CONT-0001 | CONT-0002 | Enforcement 02 |
| CONT-0003 | CONT-0001 | CONT-0008 | calibration record |
| CONT-0004 | CONT-0001 | CONT-0009 | es |
| CONT-0005 | CONT-0001 | CONT-0006 | Scope 05 |
| CONT-0006 | CONT-0002 | CONT-0007 | Encoding 06 |
| CONT-0007 | CONT-0002 | CONT-0002 | Enforcement 07 |
| CONT-0008 | CONT-0002 | CONT-0008 | audit excerpt |

**dim_column**

| id | column_label | column_category |
| --- | --- | --- |
| CLAI-0001 | Column Label 01 | Column Category 01 |
| CLAI-0002 | Column Label 02 | Column Category 02 |
| CLAI-0003 | Column Label 03 | Column Category 03 |
| CLAI-0004 | Column Label 04 | Column Category 04 |
| CLAI-0005 | Column Label 05 | Column Category 05 |
| CLAI-0006 | Column Label 06 | Column Category 06 |