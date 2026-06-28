---
chapter_id: ch_live_trace_subclass_d45721
topic_id: 109
family: 02_observation_measurement
cited_terms: ['trace_subclass', 'mass_function_with_normalization', 'provenance_agent_subclass']
model: engine-refine
---

Provenance tracking in distributed systems rests on a layered architecture of identifiers, spans, and attributes that together reconstruct the full lifecycle of every computational artifact. Each execution trace receives a unique identifier—TRAC-0001 through TRAC-0004 in the observed corpus—and is assigned to a named span that delineates its operational boundary. The span dimension table further classifies these boundaries through categorical labels such as Spans Category 01 and Spans Category 02, while a separate category dimension provides human-readable names like Category Name 01 through Category Name 04. This two-level categorization enables both machine-readable joins and analyst-facing summaries. Within each trace, the duration_seconds column records wall-clock execution time, ranging from 1874.27 seconds for TRAC-0001 to 3940.66 seconds for TRAC-0003, while exit_code captures the termination condition—values of 491, 900, 420, and 60 across the four traces—and retry_count quantifies resilience, with TRAC-0004 exhibiting 459 retries compared to TRAC-0002's 179.

**fact_trace**

| id | spans_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| TRAC-0001 | TRAC-0005 | 1874.27 | 491 | 399 |
| TRAC-0002 | TRAC-0002 | 2092.44 | 900 | 179 |
| TRAC-0003 | TRAC-0004 | 3940.66 | 420 | 396 |
| TRAC-0004 | TRAC-0006 | 3336.66 | 60 | 459 |

**dim_spans_category**

| id | category_name |
| --- | --- |
| TRAC-0001 | Category Name 01 |
| TRAC-0002 | Category Name 02 |
| TRAC-0003 | Category Name 03 |
| TRAC-0004 | Category Name 04 |
| TRAC-0005 | Category Name 05 |
| TRAC-0006 | Category Name 06 |

**dim_spans**

| id | spans_label | spans_category | category_id |
| --- | --- | --- | --- |
| TRAC-0001 | Spans Label 01 | Spans Category 01 | TRAC-0001 |
| TRAC-0002 | Spans Label 02 | Spans Category 02 | TRAC-0006 |
| TRAC-0003 | Spans Label 03 | Spans Category 03 | TRAC-0006 |
| TRAC-0004 | Spans Label 04 | Spans Category 04 | TRAC-0003 |
| TRAC-0005 | Spans Label 05 | Spans Category 05 | TRAC-0003 |
| TRAC-0006 | Spans Label 06 | Spans Category 06 | TRAC-0006 |

The mass-function normalization subsystem extends this tracking from execution traces to the data artifacts themselves. Each normalized mass function carries an identifier such as NORM-0001 and is associated with a concrete entity—Rotor-Assembly-M, Batch-7721, Core-Segment-12, Dust-Collection-1—alongside a normalization constant like Offset-0.02 or 0.982-scaling that governs how belief masses are scaled. The attribute schema for these entities is declared in a dedicated type table where attr_name values including confidence, dimension_kind, method, and recorded_at are paired with their corresponding attr_type annotations drawn from the XSD namespace: xsd:decimal, xsd:string, and xsd:dateTime. This separation of attribute metadata from attribute values permits type-safe storage and query optimization across heterogeneous data domains.

**t_mass_function_with_normalization**

| id | mass | normalization_constant |
| --- | --- | --- |
| NORM-0001 | Rotor-Assembly-M | Offset-0.02 |
| NORM-0002 | Batch-7721 | 0.982-scaling |
| NORM-0003 | Core-Segment-12 | 0.982-scaling |
| NORM-0004 | Dust-Collection-1 | Offset-0.02 |
| NORM-0005 | Powder-Grade-B | Baseline-0.75 |
| NORM-0006 | Rotor-Assembly-M | 0.982-scaling |

**t_mass_function_with_normalization_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| NORM-0001 | confidence | xsd:decimal |
| NORM-0002 | dimension_kind | xsd:string |
| NORM-0003 | method | xsd:string |
| NORM-0004 | recorded_at | xsd:dateTime |
| NORM-0005 | uncertainty | xsd:decimal |
| NORM-0006 | unit | xsd:string |
| NORM-0007 | value | xsd:decimal |
| NORM-0008 | encoding | xsd:string |

**t_mass_function_with_normalization_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| NORM-0001 | NORM-0001 | NORM-0004 | 2024-12-04T17:58:43 |
| NORM-0002 | NORM-0002 | NORM-0004 | 2023-02-03T12:29:30 |
| NORM-0003 | NORM-0003 | NORM-0004 | 2024-03-08T15:41:30 |
| NORM-0004 | NORM-0004 | NORM-0004 | 2023-01-16T04:53:31 |
| NORM-0005 | NORM-0005 | NORM-0004 | 2023-05-04T19:41:54 |
| NORM-0006 | NORM-0006 | NORM-0004 | 2025-01-09T01:34:48 |

**t_mass_function_with_normalization_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| NORM-0001 | NORM-0001 | NORM-0001 | 0.715 |
| NORM-0002 | NORM-0001 | NORM-0005 | 279.33 |
| NORM-0003 | NORM-0001 | NORM-0007 | 243.08 |
| NORM-0004 | NORM-0002 | NORM-0001 | 0.608 |
| NORM-0005 | NORM-0002 | NORM-0005 | 643.66 |
| NORM-0006 | NORM-0002 | NORM-0007 | 319.15 |
| NORM-0007 | NORM-0003 | NORM-0001 | 0.596 |
| NORM-0008 | NORM-0003 | NORM-0005 | 676.31 |

**t_mass_function_with_normalization_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| NORM-0001 | NORM-0001 | NORM-0002 | Dimension Kind 01 |
| NORM-0002 | NORM-0001 | NORM-0008 | Encoding 02 |
| NORM-0003 | NORM-0001 | NORM-0009 | nightly summary |
| NORM-0004 | NORM-0001 | NORM-0010 | ja |
| NORM-0005 | NORM-0001 | NORM-0003 | manual |
| NORM-0006 | NORM-0001 | NORM-0006 | count |
| NORM-0007 | NORM-0002 | NORM-0002 | Dimension Kind 07 |
| NORM-0008 | NORM-0002 | NORM-0008 | Encoding 08 |

Attribute values are materialized in three value tables distinguished by their target type, each linking an entity_id to an attr_id and storing the misc content in a value column. Decimal-valued attributes such as confidence appear as 0.715 and 0.608 in the decimal value table, while dimension_kind attributes hold numeric measurements like 279.33 and 243.08. String-valued attributes populate the varchar table with entries including Dimension Kind 01, Encoding 02, nightly summary, and the language tag ja. The datetime table records timestamps such as 2024-12-04T17:58:43 and 2023-02-03T12:29:30 for the recorded_at attribute, all referencing attr_id NORM-0004. This type-disaggregated design ensures that each value is stored in the most appropriate physical representation without requiring runtime type coercion.

Provenance governance introduces a second axis of classification through agent subclasses and their assigned responsibilities. Agent subclasses such as audit-trail-archive, clinical-trial-raw, feature-store-export, and telemetry-stream-alpha represent distinct provenance sources, each mapped to a responsibility like system-auditor, data-steward, lab-coordinator, or etl-scheduler. The join table between these dimensions carries a role column that specifies the nature of the relationship—contributor, observer, or reviewer—allowing a single agent subclass to assume multiple responsibilities simultaneously. For instance, the telemetry-stream-alpha subclass appears with the reviewer role in two separate responsibility assignments and with the contributor role in a third, demonstrating that roles are not one-to-one mappings but rather contextual designations that can coexist within the same provenance chain.

**t_provenance_agent_subclass**

| id | provenance |
| --- | --- |
| AGEN-0001 | audit-trail-archive |
| AGEN-0002 | clinical-trial-raw |
| AGEN-0003 | feature-store-export |
| AGEN-0004 | telemetry-stream-alpha |
| AGEN-0005 | pipeline-logs-v2 |
| AGEN-0006 | telemetry-stream-alpha |

**t_provenance_agent_subclass_responsibility**

| id | responsibility |
| --- | --- |
| AGEN-0001 | system-auditor |
| AGEN-0002 | data-steward |
| AGEN-0003 | lab-coordinator |
| AGEN-0004 | etl-scheduler |
| AGEN-0005 | lab-coordinator |
| AGEN-0006 | data-steward |
| AGEN-0007 | data-steward |

**t_provenance_agent_subclass__responsibility**

| id | provenance_id | responsibility_id | role |
| --- | --- | --- | --- |
| AGEN-0001 | AGEN-0004 | AGEN-0005 | contributor |
| AGEN-0002 | AGEN-0004 | AGEN-0002 | observer |
| AGEN-0003 | AGEN-0002 | AGEN-0001 | reviewer |
| AGEN-0004 | AGEN-0004 | AGEN-0007 | reviewer |
| AGEN-0005 | AGEN-0001 | AGEN-0002 | owner |
| AGEN-0006 | AGEN-0005 | AGEN-0007 | observer |
| AGEN-0007 | AGEN-0003 | AGEN-0003 | reviewer |
| AGEN-0008 | AGEN-0001 | AGEN-0001 | owner |