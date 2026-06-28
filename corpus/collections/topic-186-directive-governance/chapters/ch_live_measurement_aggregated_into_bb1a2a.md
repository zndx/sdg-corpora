---
chapter_id: ch_live_measurement_aggregated_into_bb1a2a
topic_id: 186
family: 02_observation_measurement
cited_terms: ['measurement_aggregated_into', 'universal_generic', 'aggregation_over_time_window']
model: engine-refine
---

Aggregation hierarchies in governed data systems are anchored by a fact table that records individual measurements alongside their placement within broader aggregation structures. Each measurement carries a unique identifier—such as INTO-0001 through INTO-0004—that serves as its immutable reference point across the system. These identifiers link to a dimension table describing the aggregation target, where each entry is assigned a human-readable label like "Aggregated Into Label 01" and classified under a category such as "Aggregated Into Category 02." The foreign key relationship between the measurement fact and this dimension ensures that every recorded value can be traced back to its intended aggregation bucket, enabling roll-ups and drill-downs without ambiguity. In practice, multiple measurements may share the same aggregation key—for instance, both INTO-0001 and INTO-0002 reference aggregation target INTO-0005—allowing the system to accumulate evidence across granular observations before surfacing higher-level summaries.

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

**t_aggregation_over_time_window**

| id | aggregation | over_time_window |
| --- | --- | --- |
| WIND-0001 | RealTimeClusterLoad | MonthlySettlement |
| WIND-0002 | MonthlyThroughputMetric | MonthlySettlement |
| WIND-0003 | AnnualCapacityForecast | TrailingSevenDays |
| WIND-0004 | AnnualCapacityForecast | BusinessHours |
| WIND-0005 | RealTimeClusterLoad | BusinessHours |
| WIND-0006 | AnnualCapacityForecast | Sliding24Hour |

Confidence and uncertainty form the twin pillars of measurement quality, quantifying how much trust a consumer should place in any given observation. Confidence scores range from 0 to 1, with values like 0.945 indicating strong assurance and 0.307 signaling considerable doubt; these figures are not decorative metadata but operational signals that downstream consumers use to weight results, trigger alerts, or defer decisions. Paired with each confidence score is an uncertainty value expressed in the measurement's native units—306.26, 279.24, 120.70, and 364.07 in the observed data—which conveys the absolute spread or error band around the recorded value. Together, confidence and uncertainty allow analysts to distinguish between a measurement that is both precise and accurate (high confidence, low uncertainty) and one that is noisy or poorly calibrated (low confidence, high uncertainty), supporting risk-aware decision-making in compliance and governance workflows.

Attribute definitions and their typed values extend the model beyond simple numeric measurements into a flexible entity-attribute-value paradigm. A time-window aggregation entity—identified by codes like WIND-0001 and WIND-0002—represents a conceptual aggregation such as "RealTimeClusterLoad" or "MonthlyThroughputMetric" scoped to a specific window like "MonthlySettlement" or "TrailingSevenDays." The attributes that describe these entities are catalogued in a separate definition table, where each attribute has a name (for example, "confidence," "dimension_kind," "method," or "recorded_at") and a declared type drawn from the XML Schema namespace: xsd:decimal, xsd:string, or xsd:dateTime. This separation of attribute metadata from attribute values enables schema evolution and type safety without requiring changes to the value storage layer.

**t_aggregation_over_time_window_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| WIND-0001 | confidence | xsd:decimal |
| WIND-0002 | dimension_kind | xsd:string |
| WIND-0003 | method | xsd:string |
| WIND-0004 | recorded_at | xsd:dateTime |
| WIND-0005 | uncertainty | xsd:decimal |
| WIND-0006 | unit | xsd:string |
| WIND-0007 | value | xsd:decimal |
| WIND-0008 | encoding | xsd:string |

**t_aggregation_over_time_window_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| WIND-0001 | WIND-0001 | WIND-0004 | 2023-08-23T11:54:15 |
| WIND-0002 | WIND-0002 | WIND-0004 | 2023-06-25T19:59:38 |
| WIND-0003 | WIND-0003 | WIND-0004 | 2025-01-03T19:33:06 |
| WIND-0004 | WIND-0004 | WIND-0004 | 2023-03-02T05:31:47 |
| WIND-0005 | WIND-0005 | WIND-0004 | 2023-12-24T17:32:49 |
| WIND-0006 | WIND-0006 | WIND-0004 | 2023-09-12T03:58:46 |

**t_aggregation_over_time_window_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| WIND-0001 | WIND-0001 | WIND-0001 | 0.781 |
| WIND-0002 | WIND-0001 | WIND-0005 | 86.18 |
| WIND-0003 | WIND-0001 | WIND-0007 | 786.35 |
| WIND-0004 | WIND-0002 | WIND-0001 | 0.307 |
| WIND-0005 | WIND-0002 | WIND-0005 | 190.14 |
| WIND-0006 | WIND-0002 | WIND-0007 | 820.39 |
| WIND-0007 | WIND-0003 | WIND-0001 | 0.604 |
| WIND-0008 | WIND-0003 | WIND-0005 | 847.59 |

**t_aggregation_over_time_window_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| WIND-0001 | WIND-0001 | WIND-0002 | Dimension Kind 01 |
| WIND-0002 | WIND-0001 | WIND-0008 | Encoding 02 |
| WIND-0003 | WIND-0001 | WIND-0009 | pre-release note |
| WIND-0004 | WIND-0001 | WIND-0010 | en |
| WIND-0005 | WIND-0001 | WIND-0003 | manual |
| WIND-0006 | WIND-0001 | WIND-0006 | kg |
| WIND-0007 | WIND-0002 | WIND-0002 | Dimension Kind 07 |
| WIND-0008 | WIND-0002 | WIND-0008 | Encoding 08 |

The typed value tables materialize the entity-attribute pairs by storing actual data in columns matched to the declared attribute type. Decimal attributes such as confidence or measurement values are persisted in the decimal value table with entries like 0.781, 86.18, and 786.35, each linked to a specific entity and attribute through foreign keys. String attributes—encoding kinds, dimension labels, or free-text notes like "pre-release note"—reside in the varchar table, while timestamp attributes such as recorded_at are stored in the datetime table with values like 2023-08-23T11:54:15 and 2025-01-03T19:33:06. This type-disaggregated design ensures that each value is stored in the most appropriate physical format, simplifies validation at ingestion time, and allows the system to enforce type constraints without runtime coercion.

The entity identifier in each value table points back to the aggregation entity definition, while the attribute identifier resolves to the attribute catalog, creating a fully normalized graph that connects abstract definitions to concrete observations. This structure supports a universal taxonomy layer where governance frameworks, taxonomy nodes, event categories, and validation patterns can be mapped to underlying data streams—whether CSV, Parquet, binary, or YAML—providing a consistent semantic overlay across heterogeneous sources. In governance contexts, this means that a single measurement can be simultaneously understood as a numeric fact with quality metadata, a member of an aggregation hierarchy, an instance of a typed entity-attribute pair, and a node in a broader governance taxonomy, all without duplicating information across siloed tables.

**t_universal_generic**

| id | universal | related |
| --- | --- | --- |
| GENE-0001 | Governance Framework | CSV Stream |
| GENE-0002 | Taxonomy Node | Parquet Format |
| GENE-0003 | Event Category | Binary Blob |
| GENE-0004 | Validation Pattern | YAML Config |
| GENE-0005 | Compliance Rule | MessagePack |
| GENE-0006 | Taxonomy Node | XML Document |
| GENE-0007 | Compliance Rule | Parquet Format |
| GENE-0008 | Data Standard | JSON Schema |