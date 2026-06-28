---
chapter_id: ch_live_evidence_independent_or_correlated_810d93
topic_id: 42
family: 06_belief_structure
cited_terms: ['evidence_independent_or_correlated', 'belief_interval_basic', 'transformation_min_one_output']
model: engine-refine
---

The attribute model separates property definitions from their concrete values, a design that enforces type discipline across heterogeneous data domains. Each attribute carries a name—such as `confidence`, `dimension_kind`, `method`, or `recorded_at`—and an associated type drawn from the XML Schema namespace: `xsd:decimal`, `xsd:string`, or `xsd:dateTime`. This separation means that a single evidence record, identified by a code like `CORR-0001` or `INTE-0001`, does not store its properties inline; instead, it references attribute definitions and resolves them against typed value tables. The type annotation is not decorative—it dictates which value table holds the data, whether that is a decimal store containing `0.175` or `667.59`, a string repository holding `Dimension Kind 01` or `intake form`, or a datetime column recording timestamps such as `2024-06-09T05:47:42` or `2023-11-11T17:14:05`.

Entities are the concrete instances to which attributes apply, and they are themselves identified by the same identifier space that anchors the parent records. An entity row in a value table carries an `entity_id` that points back to the evidence or belief record it describes, and an `attr_id` that resolves to the attribute definition. This two-level indirection—entity to attribute, attribute to value—allows a single entity to accumulate multiple typed properties without schema modification. The entity `CORR-0001`, for instance, may hold a decimal confidence of `0.175` alongside a string dimension kind of `Dimension Kind 01` and a recorded-at timestamp of `2024-06-09T05:47:42`, each drawn from its respective typed value table and each linked through the entity's identifier.

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

**t_belief_interval_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| INTE-0001 | confidence | xsd:decimal |
| INTE-0002 | dimension_kind | xsd:string |
| INTE-0003 | method | xsd:string |
| INTE-0004 | recorded_at | xsd:dateTime |
| INTE-0005 | uncertainty | xsd:decimal |
| INTE-0006 | unit | xsd:string |
| INTE-0007 | value | xsd:decimal |
| INTE-0008 | encoding | xsd:string |

The identifier convention itself encodes provenance and domain. Evidence records carry the `CORR-` prefix, belief interval records carry `INTE-`, and transformation records carry `OUTP-`, each followed by a zero-padded sequence number. These identifiers serve as primary keys within their respective tables and as foreign keys across the value tables and junction tables, forming a web of referential integrity that can be traced from a high-level record down to its constituent attribute values. The identifier `CORR-0001` appears as a primary key in the evidence table, as an entity reference in the decimal, varchar, and datetime value tables, and as an attribute reference in the attribute definition table—a single code that anchors the entire property graph for that evidence item.

**t_evidence_independent_or_correlated_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CORR-0001 | CORR-0001 | CORR-0004 | 2024-06-09T05:47:42 |
| CORR-0002 | CORR-0002 | CORR-0004 | 2023-11-11T17:14:05 |
| CORR-0003 | CORR-0003 | CORR-0004 | 2023-01-17T16:04:18 |
| CORR-0004 | CORR-0004 | CORR-0004 | 2024-01-18T01:21:21 |
| CORR-0005 | CORR-0005 | CORR-0004 | 2025-02-19T18:21:28 |
| CORR-0006 | CORR-0006 | CORR-0004 | 2023-04-21T22:33:15 |

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

**t_belief_interval_basic**

| id | belief |
| --- | --- |
| INTE-0001 | Model confidence elevated |
| INTE-0002 | Data integrity compromised |
| INTE-0003 | Sensor drift confirmed |
| INTE-0004 | Risk threshold exceeded |
| INTE-0005 | Model confidence elevated |
| INTE-0006 | Inference reliability moderate |

**t_belief_interval_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INTE-0001 | INTE-0001 | INTE-0004 | 2024-02-01T15:25:49 |
| INTE-0002 | INTE-0002 | INTE-0004 | 2023-01-18T17:21:37 |
| INTE-0003 | INTE-0003 | INTE-0004 | 2023-02-06T04:43:18 |
| INTE-0004 | INTE-0004 | INTE-0004 | 2024-05-21T20:07:12 |
| INTE-0005 | INTE-0005 | INTE-0004 | 2023-06-22T00:22:40 |
| INTE-0006 | INTE-0006 | INTE-0004 | 2023-05-13T22:41:07 |

**t_belief_interval_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INTE-0001 | INTE-0001 | INTE-0001 | 0.436 |
| INTE-0002 | INTE-0001 | INTE-0005 | 621.02 |
| INTE-0003 | INTE-0001 | INTE-0007 | 821.31 |
| INTE-0004 | INTE-0002 | INTE-0001 | 0.913 |
| INTE-0005 | INTE-0002 | INTE-0005 | 437.48 |
| INTE-0006 | INTE-0002 | INTE-0007 | 190.62 |
| INTE-0007 | INTE-0003 | INTE-0001 | 0.640 |
| INTE-0008 | INTE-0003 | INTE-0005 | 909.96 |

**t_belief_interval_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INTE-0001 | INTE-0001 | INTE-0002 | Dimension Kind 01 |
| INTE-0002 | INTE-0001 | INTE-0008 | Encoding 02 |
| INTE-0003 | INTE-0001 | INTE-0009 | intake form |
| INTE-0004 | INTE-0001 | INTE-0010 | es |
| INTE-0005 | INTE-0001 | INTE-0003 | hybrid |
| INTE-0006 | INTE-0001 | INTE-0006 | mg/L |
| INTE-0007 | INTE-0002 | INTE-0002 | Dimension Kind 07 |
| INTE-0008 | INTE-0002 | INTE-0008 | Encoding 08 |

The transformation domain introduces a distinct relational pattern centered on subject, target, and role. A transformation record—identified by `OUTP-0001` and described as `data normalization` or `format conversion`—produces output datasets such as `parsed access logs`, `curated events table`, or `standardized inventory index`. The relationship between a transformation and its output datasets is not stored inline but resolved through a junction table that carries three columns: `transformation_id` as the subject, `output_dataset_id` as the target, and `role` as a descriptor of the dataset's function in the transformation pipeline. The role values—`reviewer`, `contributor`, `observer`—are free-text labels that capture the semantic relationship between subject and target without constraining it to a fixed vocabulary. A single transformation such as `OUTP-0006` may produce three output datasets, each with a different role: one dataset serves as a `contributor`, another as a `reviewer`, and a third as an `observer`, all linked through the same subject identifier.

**t_transformation_min_one_output**

| id | transformation |
| --- | --- |
| OUTP-0001 | data normalization |
| OUTP-0002 | data normalization |
| OUTP-0003 | format conversion |
| OUTP-0004 | format conversion |
| OUTP-0005 | record deduplication |
| OUTP-0006 | feature engineering |

**t_transformation_min_one_output_output_dataset**

| id | output_dataset |
| --- | --- |
| OUTP-0001 | parsed access logs |
| OUTP-0002 | curated events table |
| OUTP-0003 | curated events table |
| OUTP-0004 | standardized inventory index |
| OUTP-0005 | curated events table |
| OUTP-0006 | normalized feature set |

**t_transformation_min_one_output__output_dataset**

| id | transformation_id | output_dataset_id | role |
| --- | --- | --- | --- |
| OUTP-0001 | OUTP-0006 | OUTP-0003 | reviewer |
| OUTP-0002 | OUTP-0006 | OUTP-0005 | contributor |
| OUTP-0003 | OUTP-0006 | OUTP-0001 | contributor |
| OUTP-0004 | OUTP-0003 | OUTP-0003 | observer |
| OUTP-0005 | OUTP-0001 | OUTP-0004 | contributor |
| OUTP-0006 | OUTP-0002 | OUTP-0006 | observer |
| OUTP-0007 | OUTP-0004 | OUTP-0001 | owner |
| OUTP-0008 | OUTP-0005 | OUTP-0002 | contributor |

The misc column, appearing in the value tables and the junction table, functions as a catch-all for metadata that does not fit the typed attribute model. In the value tables, it holds the actual data values—`0.436`, `es`, `2024-02-01T15:25:49`—while in the junction table it provides an additional identifier for the relationship row itself. This dual use reflects a pragmatic design choice: the misc column is the container for the data that matters, while the structured columns (entity_id, attr_id, transformation_id, output_dataset_id, role) provide the scaffolding that makes the data queryable and traceable. The system thus distinguishes between the data itself and the relationships that give it context, a separation that becomes essential when the same attribute—say, `confidence`—appears across dozens of evidence records, each with its own entity identifier and its own decimal value.

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