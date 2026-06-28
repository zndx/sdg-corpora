---
chapter_id: ch_live_ebpf_event_writes_to_map_5d3f99
topic_id: 5
family: 02_observation_measurement
cited_terms: ['ebpf_event_writes_to_map', 'census_reporting_event', 'lift_with_baseline_rate']
model: engine-refine
---

The architecture distinguishes between measured phenomena and their metadata descriptors, a separation that becomes essential when handling heterogeneous attribute types across disparate event classes. Each observable unit carries an identifier—MAP-0001, EVEN-0001, RATE-0001—that anchors it within its respective fact or dimension table, while the entity column in value tables resolves back to that identifier, establishing the foreign-key linkage between an attribute definition and its concrete instantiation. The attribute itself is declared in a dedicated schema table where attr_name records the semantic label (encoding, label_text, language, confidence, dimension_kind, method, recorded_at) and attr_type constrains the permissible value domain to an XSD type such as xsd:string, xsd:decimal, or xsd:dateTime. This two-tier declaration—schema first, value second—permits the same attribute name to carry different type constraints across event families, and it forces value tables to be partitioned by type: varchar values reside in t_census_reporting_event_val_varchar and t_lift_with_baseline_rate_val_varchar, decimal values in t_lift_with_baseline_rate_val_decimal, and datetime values in t_lift_with_baseline_rate_val_datetime, each table carrying entity_id and attr_id as composite foreign keys.

**t_census_reporting_event**

| id | census_reporting_event | occurs_during_period | tracks_sector | published_on_date |
| --- | --- | --- | --- | --- |
| EVEN-0001 | Eurostat Population Census | Fiscal Year 2022-2023 | Youth Employment | 2024-01-22 |
| EVEN-0002 | French INSEE Census | Summer 2020 Collection | Microfinance Services | 2019-08-05 |
| EVEN-0003 | Eurostat Population Census | Fiscal Year 2022-2023 | Sustainable Ag | 2021-12-18 |
| EVEN-0004 | UK National Statistics Census | Q3 2021 Fieldwork Window | Elder Care | 2021-04-15 |
| EVEN-0005 | 2020 US Decennial Census | Q1 2023 Validation Period | Public Transit | 2023-10-01 |
| EVEN-0006 | Brazil IBGE Census | April 2020 Counting Period | Digital Literacy | 2023-06-28 |
| EVEN-0007 | Australian Bureau Census | Autumn 2021 Household Survey | Healthcare Access | 2024-01-22 |
| EVEN-0008 | Japan Statistics Census | Biennial 2018-2020 Cycle | Healthcare Access | 2023-10-01 |

**t_census_reporting_event_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| EVEN-0001 | encoding | xsd:string |
| EVEN-0002 | label_text | xsd:string |
| EVEN-0003 | language | xsd:string |

**t_census_reporting_event_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0001 | Encoding 01 |
| EVEN-0002 | EVEN-0001 | EVEN-0002 | pre-release note |
| EVEN-0003 | EVEN-0001 | EVEN-0003 | fr |
| EVEN-0004 | EVEN-0002 | EVEN-0001 | Encoding 04 |
| EVEN-0005 | EVEN-0002 | EVEN-0002 | audit excerpt |
| EVEN-0006 | EVEN-0002 | EVEN-0003 | de |
| EVEN-0007 | EVEN-0003 | EVEN-0001 | Encoding 07 |
| EVEN-0008 | EVEN-0003 | EVEN-0002 | nightly summary |

**t_lift_with_baseline_rate**

| id | lift | baseline_rate |
| --- | --- | --- |
| RATE-0001 | Conversion Gain | Control Group Mean |
| RATE-0002 | Latency Peak Reduction | Previous Release Metric |
| RATE-0003 | Click Through Uplift | Historical Median |
| RATE-0004 | Model v2 Accuracy Lift | Historical Median |
| RATE-0005 | Latency Peak Reduction | 72 Hour Average |
| RATE-0006 | Ad Improvement | Previous Release Metric |

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

Census reporting events exemplify this pattern. The table t_census_reporting_event records the event itself—Eurostat Population Census, French INSEE Census, UK National Statistics Census—alongside the temporal window during which data collection occurred (Fiscal Year 2022-2023, Summer 2020 Collection, Q3 2021 Fieldwork Window), the sector under observation (Youth Employment, Microfinance Services, Sustainable Ag, Elder Care), and the date the report was published (2024-01-22, 2019-08-05, 2021-12-18, 2021-04-15). Attribute metadata for these events lives in t_census_reporting_event_attr, where the attributes encoding, label_text, and language are each typed as xsd:string. The actual values—Encoding 01, pre-release note, fr—appear in the varchar value table, linked by entity_id to EVEN-0001 or EVEN-0002 and by attr_id to the corresponding attribute row. The category column in dim_writes_to_map (Writes To Map Category 01 through 04) and the misc column (Writes To Map Label 01 through 04) serve a parallel purpose: they attach human-readable labels and classification buckets to map keys without polluting the fact table with denormalized text.

**dim_writes_to_map**

| id | writes_to_map_label | writes_to_map_category |
| --- | --- | --- |
| MAP-0001 | Writes To Map Label 01 | Writes To Map Category 01 |
| MAP-0002 | Writes To Map Label 02 | Writes To Map Category 02 |
| MAP-0003 | Writes To Map Label 03 | Writes To Map Category 03 |
| MAP-0004 | Writes To Map Label 04 | Writes To Map Category 04 |
| MAP-0005 | Writes To Map Label 05 | Writes To Map Category 05 |
| MAP-0006 | Writes To Map Label 06 | Writes To Map Category 06 |
| MAP-0007 | Writes To Map Label 07 | Writes To Map Category 07 |

Performance telemetry follows an analogous structure but with a different fact table. The fact_ebpf table captures execution-level metrics for map-write operations identified as MAP-0001 through MAP-0004. Each row records the duration_seconds of the operation—5223.15, 6511.30, 6092.75, 4285.04—the exit_code signaling the termination condition (224, 266, 948, 381), and the retry_count indicating how many times the operation was retried before completion (439, 25, 201, 33). The writes_to_map_key column references the target map, which is resolved through dim_writes_to_map to a human-readable label and a category classification. This separation allows the fact table to remain numeric and compact while the dimension table carries the descriptive metadata that analysts need for grouping and filtering.

**fact_ebpf**

| id | writes_to_map_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| MAP-0001 | MAP-0002 | 5223.15 | 224 | 439 |
| MAP-0002 | MAP-0004 | 6511.30 | 266 | 25 |
| MAP-0003 | MAP-0001 | 6092.75 | 948 | 201 |
| MAP-0004 | MAP-0006 | 4285.04 | 381 | 33 |
| MAP-0005 | MAP-0001 | 4316.18 | 956 | 335 |

Lift-with-baseline-rate events demonstrate the same attribute-value decomposition applied to statistical metrics. The core table t_lift_with_baseline_rate identifies each measurement (RATE-0001 through RATE-0004) and records the lift descriptor—Conversion Gain, Latency Peak Reduction, Click Through Uplift, Model v2 Accuracy Lift—alongside the baseline_rate against which the lift was computed (Control Group Mean, Previous Release Metric, Historical Median). The attribute schema table t_lift_with_baseline_rate_attr declares four attributes: confidence (xsd:decimal), dimension_kind (xsd:string), method (xsd:string), and recorded_at (xsd:dateTime). Values materialize in three separate value tables. The decimal value table holds numeric measurements such as 0.799 and 0.522 for the confidence attribute, alongside values like 559.38 and 634.64 that correspond to other decimal-typed attributes. The varchar value table carries strings including Dimension Kind 01, Encoding 02, pre-release note, and de. The datetime value table stores timestamps—2024-01-14T18:32:00, 2023-02-02T03:32:58, 2024-08-11T22:28:18, 2024-10-19T09:19:40—all linked to the recorded_at attribute across different entity rows.

The design decisions embedded in this schema carry operational consequences. Partitioning values by type eliminates the need for runtime type coercion and enables each value table to carry an index optimized for its specific data type, which matters when querying attribute-value pairs at scale. The entity column in every value table is a foreign key to the identifier of the parent event or fact row, and the attr_id column is a foreign key to the attribute definition table; together they form a composite key that guarantees each attribute is instantiated at most once per entity. The attr_type column in the attribute schema table enforces type discipline at the metadata level, ensuring that a value table cannot accept a string where a decimal is expected. Meanwhile, the category and misc columns in dimension tables provide a stable classification layer that can be updated independently of the fact data, supporting governance requirements where labels and categories must change without altering historical measurements.