---
chapter_id: ch_live_outlier_detection_produces_claim_4757e6
topic_id: 86
family: 02_observation_measurement
cited_terms: ['outlier_detection_produces_claim', 'gauge_metric_subclass', 'constraint_with_violation_consequence']
model: engine-refine
---

Operational observability in distributed systems rests upon a disciplined separation between measured phenomena and the metadata that contextualizes them. Outlier events are captured as discrete records, each bearing a unique identifier such as CLAI-0001 through CLAI-0004, and are characterized by their production lineage, execution duration, termination state, and the number of recovery attempts. A single outlier may persist for 6466.78 seconds before exiting with code 4, having exhausted 225 retries, while another terminates after merely 1182.39 seconds with exit code 124 and 308 retries—a spread that underscores the necessity of duration_seconds and retry_count as independent diagnostic dimensions rather than correlated proxies. The produces_key column anchors each outlier to its originating entity, enabling downstream joins to the produces dimension where each entity carries a human-readable label, a categorical classification, and a foreign reference to the produces_category table. That category table, in turn, holds the canonical category_name values—Category Name 01 through Category Name 04—providing a stable, denormalized vocabulary for grouping and aggregating production events across the system.

**fact_outlier**

| id | produces_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| CLAI-0001 | CLAI-0004 | 3360.34 | 760 | 293 |
| CLAI-0002 | CLAI-0006 | 6466.78 | 4 | 225 |
| CLAI-0003 | CLAI-0001 | 5282.09 | 490 | 101 |
| CLAI-0004 | CLAI-0001 | 1182.39 | 124 | 308 |
| CLAI-0005 | CLAI-0002 | 3041.72 | 808 | 59 |
| CLAI-0006 | CLAI-0001 | 3852.38 | 619 | 489 |
| CLAI-0007 | CLAI-0004 | 1453.07 | 682 | 1 |

**dim_produces_category**

| id | category_name |
| --- | --- |
| CLAI-0001 | Category Name 01 |
| CLAI-0002 | Category Name 02 |
| CLAI-0003 | Category Name 03 |
| CLAI-0004 | Category Name 04 |
| CLAI-0005 | Category Name 05 |
| CLAI-0006 | Category Name 06 |

Metric observations follow an analogous but distinct pattern. Gauge measurements are identified by METR-prefixed keys and linked to a metric_kind dimension through the metric_kind_key foreign key. The metric_kind table supplies both a descriptive label and a categorical grouping—Metric Kind Label 01 through Metric Kind Label 04, mapped to Metric Kind Category 01 through Metric Kind Category 04—allowing operators to filter, roll up, or alert on measurements by their semantic class rather than by opaque identifiers. Each gauge record carries a size_bytes value ranging from 15628556 to 944581501, and a version number, enabling temporal comparison of measurement footprints and ensuring that schema evolution does not invalidate historical queries. The metric_kind_category column within the dimension table serves the same organizational purpose as the produces_category column does for production events: it is the single point of categorization that both tables reference, guaranteeing consistency across metric and production taxonomies.

**fact_gauge**

| id | metric_kind_key | size_bytes | version |
| --- | --- | --- | --- |
| METR-0001 | METR-0004 | 944581501 | 10 |
| METR-0002 | METR-0002 | 721525656 | 10 |
| METR-0003 | METR-0006 | 182468524 | 11 |
| METR-0004 | METR-0005 | 15628556 | 4 |
| METR-0005 | METR-0001 | 256894862 | 9 |
| METR-0006 | METR-0007 | 696827242 | 7 |
| METR-0007 | METR-0003 | 732080346 | 4 |
| METR-0008 | METR-0005 | 330247350 | 8 |

Governance constraints introduce a third structural layer, one that decouples constraint definitions from their attribute values through a normalized attribute-value model. The constraint table enumerates rules such as "Schema validation rule" and "Lab safety protocol," specifies what they constrain—ranging from "Database schemas" to "Cloud regions"—and declares the consequence of violation, from "Experiment halt" to "Pipeline termination." Each constraint is further parameterized by attributes whose names and types are declared in the attribute dimension: effective_date (xsd:date), enforcement (xsd:string), mandatory (xsd:boolean), and priority (xsd:integer). The type declarations are not merely documentation; they govern the schema of the value tables themselves. Boolean attributes are stored in a dedicated value table where entity_id references the constraint and attr_id references the attribute definition, with values such as true and false. Date attributes use a parallel table with values like 2024-01-12 and 2023-06-10. Integer and string attributes follow the same pattern, with integer values ranging from 3 to 404 and string values including "Encoding 01," "Enforcement 02," and "calibration record." This multi-table value decomposition ensures type safety at query time while allowing arbitrary attributes to be added without schema migration.

The identifier columns across all tables—whether CLAI-prefixed for production outliers, METR-prefixed for metric gauges, or CONS-prefixed for governance constraints—serve as the primary keys that bind the dimensional and fact tables into a coherent query graph. Foreign keys such as produces_key, metric_kind_key, category_id, entity_id, and attr_id form the edges of this graph, each pointing to a dimension table that enriches the fact data with human-readable labels, categorical groupings, and type metadata. The misc column, appearing in both the produces dimension and the various constraint value tables, functions as a catch-all for free-form or semi-structured data that does not fit the typed attribute model, storing values like "Produces Label 01" or "fr" where precision is secondary to completeness. Together, this architecture supports three distinct analytical workloads: operational debugging through outlier duration and retry analysis, capacity planning through metric size and version tracking, and compliance auditing through constraint evaluation and violation consequence mapping.

**dim_produces**

| id | produces_label | produces_category | category_id |
| --- | --- | --- | --- |
| CLAI-0001 | Produces Label 01 | Produces Category 01 | CLAI-0004 |
| CLAI-0002 | Produces Label 02 | Produces Category 02 | CLAI-0002 |
| CLAI-0003 | Produces Label 03 | Produces Category 03 | CLAI-0006 |
| CLAI-0004 | Produces Label 04 | Produces Category 04 | CLAI-0002 |
| CLAI-0005 | Produces Label 05 | Produces Category 05 | CLAI-0005 |
| CLAI-0006 | Produces Label 06 | Produces Category 06 | CLAI-0001 |

**dim_metric_kind**

| id | metric_kind_label | metric_kind_category |
| --- | --- | --- |
| METR-0001 | Metric Kind Label 01 | Metric Kind Category 01 |
| METR-0002 | Metric Kind Label 02 | Metric Kind Category 02 |
| METR-0003 | Metric Kind Label 03 | Metric Kind Category 03 |
| METR-0004 | Metric Kind Label 04 | Metric Kind Category 04 |
| METR-0005 | Metric Kind Label 05 | Metric Kind Category 05 |
| METR-0006 | Metric Kind Label 06 | Metric Kind Category 06 |
| METR-0007 | Metric Kind Label 07 | Metric Kind Category 07 |

**t_constraint_with_violation_consequence**

| id | constraint | constrains | on_violation |
| --- | --- | --- | --- |
| CONS-0001 | Schema validation rule | Database schemas | Experiment halt |
| CONS-0002 | Provenance audit requirement | User accounts | Access revocation |
| CONS-0003 | Lab safety protocol | Storage volumes | Rate throttling |
| CONS-0004 | Lab safety protocol | Cloud regions | Pipeline termination |
| CONS-0005 | Access control matrix | Telemetry agents | Network partitioning |
| CONS-0006 | Encryption standard | Telemetry agents | Compliance flagging |

**t_constraint_with_violation_consequence_attr**

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

**t_constraint_with_violation_consequence_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONS-0001 | CONS-0001 | CONS-0003 | true |
| CONS-0002 | CONS-0002 | CONS-0003 | false |
| CONS-0003 | CONS-0003 | CONS-0003 | false |
| CONS-0004 | CONS-0004 | CONS-0003 | false |
| CONS-0005 | CONS-0005 | CONS-0003 | false |
| CONS-0006 | CONS-0006 | CONS-0003 | false |

**t_constraint_with_violation_consequence_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONS-0001 | CONS-0001 | CONS-0001 | 2024-01-12 |
| CONS-0002 | CONS-0002 | CONS-0001 | 2023-06-10 |
| CONS-0003 | CONS-0003 | CONS-0001 | 2023-06-27 |
| CONS-0004 | CONS-0004 | CONS-0001 | 2023-12-08 |
| CONS-0005 | CONS-0005 | CONS-0001 | 2024-04-22 |
| CONS-0006 | CONS-0006 | CONS-0001 | 2025-05-17 |

**t_constraint_with_violation_consequence_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONS-0001 | CONS-0001 | CONS-0004 | 5 |
| CONS-0002 | CONS-0001 | CONS-0005 | 21 |
| CONS-0003 | CONS-0002 | CONS-0004 | 3 |
| CONS-0004 | CONS-0002 | CONS-0005 | 404 |
| CONS-0005 | CONS-0003 | CONS-0004 | 1 |
| CONS-0006 | CONS-0003 | CONS-0005 | 896 |
| CONS-0007 | CONS-0004 | CONS-0004 | 5 |
| CONS-0008 | CONS-0004 | CONS-0005 | 236 |

**t_constraint_with_violation_consequence_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONS-0001 | CONS-0001 | CONS-0007 | Encoding 01 |
| CONS-0002 | CONS-0001 | CONS-0002 | Enforcement 02 |
| CONS-0003 | CONS-0001 | CONS-0008 | calibration record |
| CONS-0004 | CONS-0001 | CONS-0009 | fr |
| CONS-0005 | CONS-0001 | CONS-0006 | Scope 05 |
| CONS-0006 | CONS-0002 | CONS-0007 | Encoding 06 |
| CONS-0007 | CONS-0002 | CONS-0002 | Enforcement 07 |
| CONS-0008 | CONS-0002 | CONS-0008 | change rationale |