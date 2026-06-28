---
chapter_id: ch_live_column_renamed_from_201679
topic_id: 120
family: 07_long_tail
cited_terms: ['column_renamed_from', 'evidence_basic', 'lineage_observed_by_event']
model: engine-refine
---

The evidence registry anchors every datum to a verifiable provenance record, each identified by a stable code such as EVID-0001 through EVID-0004 and described by a human-readable label—Compliance checklist, Latency benchmark result, Incident postmortem—alongside a dimension kind that classifies the measurement domain (temperature, count, pressure) and an encoding that specifies the character representation (ascii, latin1, utf8). This triad of identifier, dimension kind, and encoding establishes the foundational metadata required for downstream lineage tracing and quality assessment. Column renamings are themselves evidence-backed: a column named node_cpu_load traces to EVID-0003, measurement_timestamp to EVID-0004, config_version to EVID-0006, and batch_run_id to EVID-0001, ensuring that every schema evolution event is attributable to a source record.

**t_evidence_basic**

| id | evidence | dimension_kind | encoding |
| --- | --- | --- | --- |
| EVID-0001 | Compliance checklist | temperature | ascii |
| EVID-0002 | Latency benchmark result | count | latin1 |
| EVID-0003 | Incident postmortem | temperature | utf8 |
| EVID-0004 | Compliance checklist | pressure | utf8 |
| EVID-0005 | Temperature spike alert | length | utf8 |
| EVID-0006 | Metric threshold breach | temperature | ascii |

**t_lineage_observed_by_event**

| id | lineage |
| --- | --- |
| EVEN-0001 | patient-cohort-extraction |
| EVEN-0002 | lab-sample-tracking |
| EVEN-0003 | regulatory-compliance-audit |
| EVEN-0004 | rssi_dbm |
| EVEN-0005 | financial-risk-model |
| EVEN-0006 | lab-sample-tracking |

Attributes attach semantic properties to entities, and each attribute carries a type declaration drawn from the XML Schema Definition namespace—xsd:decimal for numeric precision, xsd:string for categorical labels, xsd:dateTime for temporal stamps. The attribute registry enumerates properties such as confidence, dimension_kind, method, and recorded_at, each bound to its corresponding type. An entity, identified by a code like FROM-0001 or EVEN-0001, serves as the subject to which attribute values are assigned; the same entity may accumulate values across multiple attributes, and the same attribute may be observed across multiple entities, forming a sparse matrix of entity–attribute pairs.

Value storage is partitioned by type to enforce schema discipline at query time. Decimal values—0.429, 695.20, 442.17, 0.690 for the evidence lineage and 0.142, 754.57, 852.05, 0.607 for the event lineage—reside in a dedicated table keyed by entity and attribute identifiers. String values occupy a separate store, holding categorical descriptors such as Dimension Kind 01, Encoding 02, audit excerpt, fr for evidence entities and Dimension Kind 01, Encoding 02, pre-release note, en for event entities. Temporal values—2025-03-21T00:09:12, 2023-10-22T03:45:48, 2023-09-09T06:02:35, 2024-12-05T07:04:23 in the evidence branch and 2024-07-15T19:59:01, 2023-01-03T08:23:46, 2024-06-13T23:29:26, 2023-03-31T12:19:15 in the event branch—are stored in a third partition, each row linking an entity to the recorded_at attribute with its xsd:dateTime type.

**t_lineage_observed_by_event_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| EVEN-0001 | confidence | xsd:decimal |
| EVEN-0002 | dimension_kind | xsd:string |
| EVEN-0003 | method | xsd:string |
| EVEN-0004 | recorded_at | xsd:dateTime |
| EVEN-0005 | uncertainty | xsd:decimal |
| EVEN-0006 | unit | xsd:string |
| EVEN-0007 | value | xsd:decimal |
| EVEN-0008 | encoding | xsd:string |

**t_lineage_observed_by_event_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0004 | 2024-07-15T19:59:01 |
| EVEN-0002 | EVEN-0002 | EVEN-0004 | 2023-01-03T08:23:46 |
| EVEN-0003 | EVEN-0003 | EVEN-0004 | 2024-06-13T23:29:26 |
| EVEN-0004 | EVEN-0004 | EVEN-0004 | 2023-03-31T12:19:15 |
| EVEN-0005 | EVEN-0005 | EVEN-0004 | 2023-03-05T06:53:09 |
| EVEN-0006 | EVEN-0006 | EVEN-0004 | 2023-03-19T16:32:15 |

**t_lineage_observed_by_event_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0001 | 0.142 |
| EVEN-0002 | EVEN-0001 | EVEN-0005 | 754.57 |
| EVEN-0003 | EVEN-0001 | EVEN-0007 | 852.05 |
| EVEN-0004 | EVEN-0002 | EVEN-0001 | 0.607 |
| EVEN-0005 | EVEN-0002 | EVEN-0005 | 551.25 |
| EVEN-0006 | EVEN-0002 | EVEN-0007 | 531.16 |
| EVEN-0007 | EVEN-0003 | EVEN-0001 | 0.333 |
| EVEN-0008 | EVEN-0003 | EVEN-0005 | 159.50 |

Lineage events extend the same attribute–value architecture to capture the provenance chain itself. Events are identified by codes such as EVEN-0001 through EVEN-0004 and associated with a lineage descriptor—patient-cohort-extraction, lab-sample-tracking, regulatory-compliance-audit, rssi_dbm—that describes the transformation or observation step. These events carry the identical attribute schema as evidence entities (confidence as xsd:decimal, dimension_kind as xsd:string, method as xsd:string, recorded_at as xsd:dateTime), enabling uniform querying across both raw evidence and derived lineage records. The parallel structure ensures that confidence scores, dimensional classifications, procedural methods, and timestamps are available at every tier of the data supply chain without schema divergence.

The encoding field on evidence records—utf8 for Latency benchmark result and Incident postmortem, ascii for Compliance checklist, latin1 for the second Compliance checklist—governs how string values are interpreted when they flow through the varchar value store. This matters because the same attribute (method, dimension_kind) may carry values in different encodings depending on the source evidence, and the value tables store the decoded content without re-encoding. Dimension kinds such as temperature, count, and pressure on evidence records inform the type discipline applied to downstream attributes: a dimension_kind attribute on an event may carry the value Dimension Kind 01, which references back to the original evidence classification. The identifier system—EVID- prefixed codes for evidence, FROM- prefixed codes for column-level entities, EVEN- prefixed codes for lineage events—provides a namespace that prevents collisions across these distinct entity classes while remaining machine-parseable for automated lineage resolution.

**t_column_renamed_from**

| id | column | renamed_from |
| --- | --- | --- |
| FROM-0001 | node_cpu_load | EVID-0003 |
| FROM-0002 | measurement_timestamp | EVID-0004 |
| FROM-0003 | config_version | EVID-0006 |
| FROM-0004 | batch_run_id | EVID-0001 |
| FROM-0005 | event_type | EVID-0001 |
| FROM-0006 | patient_bmi | EVID-0002 |

**t_column_renamed_from_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| FROM-0001 | confidence | xsd:decimal |
| FROM-0002 | dimension_kind | xsd:string |
| FROM-0003 | method | xsd:string |
| FROM-0004 | recorded_at | xsd:dateTime |
| FROM-0005 | uncertainty | xsd:decimal |
| FROM-0006 | unit | xsd:string |
| FROM-0007 | value | xsd:decimal |
| FROM-0008 | encoding | xsd:string |

**t_column_renamed_from_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FROM-0001 | FROM-0001 | FROM-0004 | 2025-03-21T00:09:12 |
| FROM-0002 | FROM-0002 | FROM-0004 | 2023-10-22T03:45:48 |
| FROM-0003 | FROM-0003 | FROM-0004 | 2023-09-09T06:02:35 |
| FROM-0004 | FROM-0004 | FROM-0004 | 2024-12-05T07:04:23 |
| FROM-0005 | FROM-0005 | FROM-0004 | 2023-10-09T20:16:15 |
| FROM-0006 | FROM-0006 | FROM-0004 | 2024-04-24T12:53:41 |

**t_column_renamed_from_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FROM-0001 | FROM-0001 | FROM-0001 | 0.429 |
| FROM-0002 | FROM-0001 | FROM-0005 | 695.20 |
| FROM-0003 | FROM-0001 | FROM-0007 | 442.17 |
| FROM-0004 | FROM-0002 | FROM-0001 | 0.690 |
| FROM-0005 | FROM-0002 | FROM-0005 | 345.70 |
| FROM-0006 | FROM-0002 | FROM-0007 | 542.71 |
| FROM-0007 | FROM-0003 | FROM-0001 | 0.828 |
| FROM-0008 | FROM-0003 | FROM-0005 | 957.60 |

**t_column_renamed_from_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FROM-0001 | FROM-0001 | FROM-0002 | Dimension Kind 01 |
| FROM-0002 | FROM-0001 | FROM-0008 | Encoding 02 |
| FROM-0003 | FROM-0001 | FROM-0009 | audit excerpt |
| FROM-0004 | FROM-0001 | FROM-0010 | fr |
| FROM-0005 | FROM-0001 | FROM-0003 | manual |
| FROM-0006 | FROM-0001 | FROM-0006 | deg_C |
| FROM-0007 | FROM-0002 | FROM-0002 | Dimension Kind 07 |
| FROM-0008 | FROM-0002 | FROM-0008 | Encoding 08 |

**t_lineage_observed_by_event_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0002 | Dimension Kind 01 |
| EVEN-0002 | EVEN-0001 | EVEN-0008 | Encoding 02 |
| EVEN-0003 | EVEN-0001 | EVEN-0009 | pre-release note |
| EVEN-0004 | EVEN-0001 | EVEN-0010 | en |
| EVEN-0005 | EVEN-0001 | EVEN-0003 | manual |
| EVEN-0006 | EVEN-0001 | EVEN-0006 | ratio |
| EVEN-0007 | EVEN-0002 | EVEN-0002 | Dimension Kind 07 |
| EVEN-0008 | EVEN-0002 | EVEN-0008 | Encoding 08 |