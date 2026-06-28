---
chapter_id: ch_live_provenance_agent_signs_audit_7a2450
topic_id: 5
family: 07_long_tail
cited_terms: ['provenance_agent_signs_audit', 'frozen_artifact_governed_by', 'lift_with_baseline_rate']
model: engine-refine
---

Provenance tracking operates through a dual-table architecture that separates execution telemetry from descriptive metadata. The fact table records each provenance event by a unique identifier—AUDI-0001 through AUDI-0004—and attaches a self-referencing provenance_key that links child events to their parent lineage, as when AUDI-0003 and AUDI-0004 both reference AUDI-0007. Execution characteristics are captured as duration_seconds, which range from 2216.74 seconds for AUDI-0003 to 6949.35 seconds for AUDI-0004, and exit_code, a non-standard exit indicator taking values such as 256, 728, 452, and 985. Retry_count quantifies the number of recovery attempts, spanning from a modest 23 retries for AUDI-0004 to 410 for AUDI-0003, providing a direct measure of operational instability. The companion dimension table enriches these events with a provenance_label—Provenance Label 01 through Provenance Label 04—and a provenance_category, classified as Provenance Category 01 through Provenance Category 04, enabling downstream filtering and aggregation by organizational or logical groupings.

**fact_provenance**

| id | provenance_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| AUDI-0001 | AUDI-0003 | 2601.59 | 256 | 196 |
| AUDI-0002 | AUDI-0007 | 4921.58 | 728 | 304 |
| AUDI-0003 | AUDI-0008 | 2216.74 | 452 | 410 |
| AUDI-0004 | AUDI-0007 | 6949.35 | 985 | 23 |

**dim_provenance**

| id | provenance_label | provenance_category |
| --- | --- | --- |
| AUDI-0001 | Provenance Label 01 | Provenance Category 01 |
| AUDI-0002 | Provenance Label 02 | Provenance Category 02 |
| AUDI-0003 | Provenance Label 03 | Provenance Category 03 |
| AUDI-0004 | Provenance Label 04 | Provenance Category 04 |
| AUDI-0005 | Provenance Label 05 | Provenance Category 05 |
| AUDI-0006 | Provenance Label 06 | Provenance Category 06 |
| AUDI-0007 | Provenance Label 07 | Provenance Category 07 |
| AUDI-0008 | Provenance Label 08 | Provenance Category 08 |

Governance attributes for frozen artifacts follow a star-schema pattern in which the attribute schema is defined once and its values are materialized across type-specific fact tables. The attribute definition table assigns each attribute a human-readable name—effective_date, enforcement, mandatory, priority—and an XML Schema data type such as xsd:date, xsd:string, xsd:boolean, or xsd:integer. These definitions are then populated by entity instances through foreign-key joins on entity_id and attr_id, with the actual values stored in separate typed tables. Boolean attributes yield values of true or false across entities GOVE-0001 through GOVE-0004; date attributes resolve to calendar dates like 2025-04-28 and 2024-01-16; integer attributes carry magnitudes ranging from 1 to 718; and string attributes hold free-form content such as Encoding 01, calibration record, and es. This type-disaggregated design ensures that each value table enforces its own schema constraints at the storage layer while preserving a unified logical view through the shared entity and attribute identifiers.

**t_frozen_artifact_governed_by**

| id | frozen |
| --- | --- |
| GOVE-0001 | Log-Archive-23Q4 |
| GOVE-0002 | Model-Prod-v4 |
| GOVE-0003 | Q3-2023-Snapshot |
| GOVE-0004 | Compliance-09 |
| GOVE-0005 | Audit-Baseline-2024 |
| GOVE-0006 | Log-Archive-23Q4 |

**t_frozen_artifact_governed_by_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| GOVE-0001 | effective_date | xsd:date |
| GOVE-0002 | enforcement | xsd:string |
| GOVE-0003 | mandatory | xsd:boolean |
| GOVE-0004 | priority | xsd:integer |
| GOVE-0005 | review_cycle_days | xsd:integer |
| GOVE-0006 | scope | xsd:string |
| GOVE-0007 | encoding | xsd:string |
| GOVE-0008 | label_text | xsd:string |

The lift-with-baseline-rate domain mirrors this same attribute-value separation, applying it to performance measurement records. Each lift event—Conversion Gain, Latency Peak Reduction, Click Through Uplift, Model v2 Accuracy Lift—is identified by RATE-0001 through RATE-0004 and associated with a baseline_rate entity, which itself references governance entities such as GOVE-0003 through GOVE-0006. Attribute definitions include confidence typed as xsd:decimal, dimension_kind and method as xsd:string, and recorded_at as xsd:dateTime. Decimal values for confidence span 0.522 to 0.799, while recorded_at timestamps anchor events to specific moments, from 2023-02-02T03:32:58 through 2024-10-19T09:19:40. String attributes carry labels like Dimension Kind 01, Encoding 02, and pre-release note, with locale indicators such as de appearing alongside them.

**t_lift_with_baseline_rate**

| id | lift | baseline_rate |
| --- | --- | --- |
| RATE-0001 | Conversion Gain | GOVE-0005 |
| RATE-0002 | Latency Peak Reduction | GOVE-0006 |
| RATE-0003 | Click Through Uplift | GOVE-0004 |
| RATE-0004 | Model v2 Accuracy Lift | GOVE-0003 |
| RATE-0005 | Latency Peak Reduction | GOVE-0001 |
| RATE-0006 | Ad Improvement | GOVE-0006 |

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

Across all three domains, the identifier column serves as the universal join key, enabling cross-table correlation without requiring a single monolithic table. The entity column functions as the business-level foreign key that ties attribute values back to their governing records, while the attr column points to the attribute definition. The misc column, used uniformly as the value field across all typed value tables, holds heterogeneous data—booleans, dates, integers, decimals, and strings—without type coercion, delegating type safety to the table-level schema. This architecture supports a governance model in which frozen artifacts carry rich, typed metadata; provenance events carry execution telemetry; and lift metrics carry performance measurements, all linked through a consistent identifier and entity vocabulary.

**t_frozen_artifact_governed_by_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| GOVE-0001 | GOVE-0001 | GOVE-0003 | false |
| GOVE-0002 | GOVE-0002 | GOVE-0003 | true |
| GOVE-0003 | GOVE-0003 | GOVE-0003 | false |
| GOVE-0004 | GOVE-0004 | GOVE-0003 | true |
| GOVE-0005 | GOVE-0005 | GOVE-0003 | false |
| GOVE-0006 | GOVE-0006 | GOVE-0003 | false |

**t_frozen_artifact_governed_by_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| GOVE-0001 | GOVE-0001 | GOVE-0001 | 2025-04-28 |
| GOVE-0002 | GOVE-0002 | GOVE-0001 | 2024-02-08 |
| GOVE-0003 | GOVE-0003 | GOVE-0001 | 2024-10-20 |
| GOVE-0004 | GOVE-0004 | GOVE-0001 | 2024-01-16 |
| GOVE-0005 | GOVE-0005 | GOVE-0001 | 2024-06-17 |
| GOVE-0006 | GOVE-0006 | GOVE-0001 | 2024-04-05 |

**t_frozen_artifact_governed_by_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| GOVE-0001 | GOVE-0001 | GOVE-0004 | 1 |
| GOVE-0002 | GOVE-0001 | GOVE-0005 | 718 |
| GOVE-0003 | GOVE-0002 | GOVE-0004 | 5 |
| GOVE-0004 | GOVE-0002 | GOVE-0005 | 330 |
| GOVE-0005 | GOVE-0003 | GOVE-0004 | 4 |
| GOVE-0006 | GOVE-0003 | GOVE-0005 | 316 |
| GOVE-0007 | GOVE-0004 | GOVE-0004 | 5 |
| GOVE-0008 | GOVE-0004 | GOVE-0005 | 796 |

**t_frozen_artifact_governed_by_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| GOVE-0001 | GOVE-0001 | GOVE-0007 | Encoding 01 |
| GOVE-0002 | GOVE-0001 | GOVE-0002 | Enforcement 02 |
| GOVE-0003 | GOVE-0001 | GOVE-0008 | calibration record |
| GOVE-0004 | GOVE-0001 | GOVE-0009 | es |
| GOVE-0005 | GOVE-0001 | GOVE-0006 | Scope 05 |
| GOVE-0006 | GOVE-0002 | GOVE-0007 | Encoding 06 |
| GOVE-0007 | GOVE-0002 | GOVE-0002 | Enforcement 07 |
| GOVE-0008 | GOVE-0002 | GOVE-0008 | nightly summary |