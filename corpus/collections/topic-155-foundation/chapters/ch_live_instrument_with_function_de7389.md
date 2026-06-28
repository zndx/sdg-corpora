---
chapter_id: ch_live_instrument_with_function_de7389
topic_id: 155
family: 01_foundation
cited_terms: ['instrument_with_function', 'evidence_independent_or_correlated', 'histogram_metric_subclass']
model: engine-refine
---

The foundational unit of traceability in any governed data architecture is the identifier, a stable, machine-readable token that anchors an entity across its lifecycle. Within the instrument-function registry, each mapping between a physical instrument and its realized analytical function receives a distinct identifier such as FUNC-0001 or FUNC-0002, ensuring that the association between a Keysight DSOX3024T oscilloscope and the correlation function CORR-0002 can be referenced unambiguously in downstream queries, audit trails, and provenance chains. Similarly, evidence records governing independent or correlated measurement relationships are assigned identifiers like CORR-0001 through CORR-0004, each encoding a structured relationship among evidence types—Provenance-Chain-Hash, Metrics-Cache-Ref, Telemetry-Stream-Alpha, and Governance-Verification-File—that collectively substantiate the integrity of the measurement pipeline. The entity, in this context, denotes the concrete instantiation of a relationship or measurement artifact, and its identifier serves as the primary key through which all attribute assignments and value bindings are resolved.

**t_instrument_with_function**

| id | instrument | realizes_function |
| --- | --- | --- |
| FUNC-0001 | Keysight DSOX3024T | CORR-0002 |
| FUNC-0002 | Thermo Q Exactive | CORR-0003 |
| FUNC-0003 | Zygo NewView | CORR-0005 |
| FUNC-0004 | Agilent 5975C | CORR-0005 |
| FUNC-0005 | Agilent 5975C | CORR-0002 |
| FUNC-0006 | Agilent 5975C | CORR-0003 |

**t_instrument_with_function_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| FUNC-0001 | checksum | xsd:string |
| FUNC-0002 | created_date | xsd:date |
| FUNC-0003 | identifier | cco:DesignativeICE |
| FUNC-0004 | license | xsd:string |
| FUNC-0005 | mime_type | xsd:string |
| FUNC-0006 | size_bytes | xsd:long |
| FUNC-0007 | uri | xsd:string |
| FUNC-0008 | version | xsd:integer |

**t_instrument_with_function_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FUNC-0001 | FUNC-0001 | FUNC-0006 | 359 |
| FUNC-0002 | FUNC-0001 | FUNC-0008 | 4 |
| FUNC-0003 | FUNC-0002 | FUNC-0006 | 439 |
| FUNC-0004 | FUNC-0002 | FUNC-0008 | 6 |
| FUNC-0005 | FUNC-0003 | FUNC-0006 | 255 |
| FUNC-0006 | FUNC-0003 | FUNC-0008 | 10 |
| FUNC-0007 | FUNC-0004 | FUNC-0006 | 467 |
| FUNC-0008 | FUNC-0004 | FUNC-0008 | 3 |

**t_instrument_with_function_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FUNC-0001 | FUNC-0001 | FUNC-0001 | a3f9c21e |
| FUNC-0002 | FUNC-0001 | FUNC-0003 | ref-8842 |
| FUNC-0003 | FUNC-0001 | FUNC-0004 | MPL-2.0 |
| FUNC-0004 | FUNC-0001 | FUNC-0009 | us-east-1 |
| FUNC-0005 | FUNC-0001 | FUNC-0005 | text/plain |
| FUNC-0006 | FUNC-0001 | FUNC-0010 | Name 06 |
| FUNC-0007 | FUNC-0001 | FUNC-0011 | sre |
| FUNC-0008 | FUNC-0001 | FUNC-0012 | Tags 08 |

**t_evidence_independent_or_correlated**

| id | evidence | evidence_2 | evidence_3 |
| --- | --- | --- | --- |
| CORR-0001 | Provenance-Chain-Hash | Metrics-Pool-Index | Provenance-Node-Hash |
| CORR-0002 | Metrics-Cache-Ref | Provenance-Chain-Hash | Telemetry-Stream-Alpha |
| CORR-0003 | Provenance-Leaf-Node | Telemetry-Stream-Alpha | Telemetry-Stream-Alpha |
| CORR-0004 | Independent-Array-Trace | Quarterly-Audit-Trail | Governance-Verification-File |
| CORR-0005 | Independent-Sensor-Trace | Observation-Grid-Fourteen | Governance-Compliance-Report |
| CORR-0006 | Quarterly-Audit-Trail | Metrics-Bucket-Index | Correlation-Stream-Gamma |

**t_evidence_independent_or_correlated_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CORR-0001 | confidence | xsd:decimal |
| CORR-0002 | dimension_kind | xsd:string |
| CORR-0003 | method | xsd:string |
| CORR-0004 | recorded_at | xsd:dateTime |
| CORR-0005 | uncertainty | xsd:decimal |
| CORR-0006 | unit | xsd:string |
| CORR-0007 | value | xsd:decimal |
| CORR-0008 | encoding | xsd:string |

**t_evidence_independent_or_correlated_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CORR-0001 | CORR-0001 | CORR-0004 | 2024-06-09T05:47:42 |
| CORR-0002 | CORR-0002 | CORR-0004 | 2023-11-11T17:14:05 |
| CORR-0003 | CORR-0003 | CORR-0004 | 2023-01-17T16:04:18 |
| CORR-0004 | CORR-0004 | CORR-0004 | 2024-01-18T01:21:21 |
| CORR-0005 | CORR-0005 | CORR-0004 | 2025-02-19T18:21:28 |
| CORR-0006 | CORR-0006 | CORR-0004 | 2023-04-21T22:33:15 |

**t_evidence_independent_or_correlated_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CORR-0001 | CORR-0001 | CORR-0001 | 0.175 |
| CORR-0002 | CORR-0001 | CORR-0005 | 667.59 |
| CORR-0003 | CORR-0001 | CORR-0007 | 420.06 |
| CORR-0004 | CORR-0002 | CORR-0001 | 0.415 |
| CORR-0005 | CORR-0002 | CORR-0005 | 386.38 |
| CORR-0006 | CORR-0002 | CORR-0007 | 519.11 |
| CORR-0007 | CORR-0003 | CORR-0001 | 0.685 |
| CORR-0008 | CORR-0003 | CORR-0005 | 275.29 |

**t_evidence_independent_or_correlated_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CORR-0001 | CORR-0001 | CORR-0002 | Dimension Kind 01 |
| CORR-0002 | CORR-0001 | CORR-0008 | Encoding 02 |
| CORR-0003 | CORR-0001 | CORR-0009 | intake form |
| CORR-0004 | CORR-0001 | CORR-0010 | en |
| CORR-0005 | CORR-0001 | CORR-0003 | hybrid |
| CORR-0006 | CORR-0001 | CORR-0006 | kg |
| CORR-0007 | CORR-0002 | CORR-0002 | Dimension Kind 07 |
| CORR-0008 | CORR-0002 | CORR-0008 | Encoding 08 |

Attributes and their associated types constitute the schema of observability applied to each entity, defining what properties are tracked and in what formal representation. The attribute registry for instrument-function mappings enumerates descriptors such as checksum, created_date, identifier, and license, each bound to a precise type constraint—xsd:string for the checksum value a3f9c21e, xsd:date for temporal markers like 2023-09-07, cco:DesignativeICE for designative references, and xsd:string for licensing terms such as MPL-2.0. The evidence domain employs a parallel but distinct attribute vocabulary, recording confidence as xsd:decimal, dimension_kind and method as xsd:string, and recorded_at as xsd:dateTime, thereby enforcing type discipline at the point of attribute declaration rather than deferring validation to runtime. This separation of attribute definition from value assignment enables schema evolution: new attributes can be introduced without restructuring the value tables, and type constraints declared in the attribute registry propagate automatically to all values bound through the entity–attribute linkage.

**t_instrument_with_function_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FUNC-0001 | FUNC-0001 | FUNC-0002 | 2024-09-19 |
| FUNC-0002 | FUNC-0002 | FUNC-0002 | 2023-09-07 |
| FUNC-0003 | FUNC-0003 | FUNC-0002 | 2024-09-12 |
| FUNC-0004 | FUNC-0004 | FUNC-0002 | 2024-08-15 |
| FUNC-0005 | FUNC-0005 | FUNC-0002 | 2025-05-20 |
| FUNC-0006 | FUNC-0006 | FUNC-0002 | 2023-09-16 |

Value storage is partitioned by type into dedicated tables, each optimized for the semantics of its content domain. Temporal attributes resolve to values such as 2024-09-19 or the ISO-8601 timestamp 2024-06-09T05:47:42, stored in date and datetime value tables respectively. Numeric attributes carrying quantitative measurements—confidence scores of 0.175 and 0.415, or aggregate metrics of 667.59 and 420.06—reside in decimal value tables, while integer-valued attributes such as 359, 4, 439, and 6 occupy their own storage tier. Free-form and coded string values, including the region specifier us-east-1, the encoding designation Encoding 02, the intake form label, and the language code en, are housed in the varchar value table. This type-partitioned value architecture ensures that each datum is stored in a format that matches its declared attr_type, eliminating type coercion overhead and preserving precision for decimal and temporal fields.

The metric dimension introduces a hierarchical classification scheme through the metric kind and its associated category. Each metric record, identified by tokens such as METR-0001 through METR-0004, is classified under a metric_kind_key—METR-0005 or METR-0003—that references a label and category from the metric kind dimension table, where categories such as Metric Kind Category 01 through Metric Kind Category 04 provide a coarse-grained taxonomy for organizing measurement types. The fact histogram table captures the quantitative footprint of each metric instance through size_bytes, recording storage extents ranging from 194,252,236 bytes for METR-0004 to 823,666,310 bytes for METR-0003, and through version, which tracks revision states across values of 3, 5, and 9. Together, the metric kind classification and the size–version pairing enable capacity planning, version-aware retrieval, and category-level aggregation across the measurement corpus.

**fact_histogram**

| id | metric_kind_key | size_bytes | version |
| --- | --- | --- | --- |
| METR-0001 | METR-0005 | 239999637 | 3 |
| METR-0002 | METR-0005 | 652318299 | 9 |
| METR-0003 | METR-0005 | 823666310 | 5 |
| METR-0004 | METR-0003 | 194252236 | 3 |
| METR-0005 | METR-0002 | 858858459 | 12 |
| METR-0006 | METR-0006 | 40060793 | 9 |
| METR-0007 | METR-0007 | 831460623 | 10 |
| METR-0008 | METR-0001 | 408712850 | 1 |

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