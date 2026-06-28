---
chapter_id: ch_live_breaking_change_subclass_341572
topic_id: 14
family: 07_long_tail
cited_terms: ['breaking_change_subclass', 'labrun_subclass', 'trace_supports_claim']
model: engine-refine
---

The data model is organized around a uniform entity-attribute-value architecture, in which every domain object—whether a breaking change, a laboratory run, or a compliance trace—is decomposed into an identifier, a set of typed attributes, and a collection of attribute values stored in type-specialized tables. Each entity type is anchored by a core table that carries a unique identifier and a human-readable label: breaking changes are keyed by identifiers such as CHAN-0001 and CHAN-0002 and described as Telemetry schema evolution or Provenance graph migration; laboratory runs carry identifiers like LABR-0001 through LABR-0004 and are named CellCulture-Exp12, FlowCyt-Panel9, ELISA-Plate88, and PCR-Run-Alpha7; compliance traces are identified by CLAI-0001 through CLAI-0004 and labeled compliance-audit-cycle, sensor-calibration-seq, incident-response-workflow, and telemetry-ingestion-stream. This tripartite structure—entity, attribute, value—ensures that the schema remains extensible without requiring DDL changes as new properties are introduced.

**t_breaking_change_subclass**

| id | breaking | breaking_change_for |
| --- | --- | --- |
| CHAN-0001 | Telemetry schema evolution | LABR-0006 |
| CHAN-0002 | Telemetry schema evolution | LABR-0005 |
| CHAN-0003 | Provenance graph migration | LABR-0007 |
| CHAN-0004 | OAuth2 token rotation | LABR-0006 |
| CHAN-0005 | Schema field removal | LABR-0006 |
| CHAN-0006 | Sensor sampling rate drop | LABR-0007 |
| CHAN-0007 | Provenance graph migration | LABR-0007 |
| CHAN-0008 | TLS 1.3 enforcement | LABR-0007 |

**t_breaking_change_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CHAN-0001 | confidence | xsd:decimal |
| CHAN-0002 | dimension_kind | xsd:string |
| CHAN-0003 | method | xsd:string |
| CHAN-0004 | recorded_at | xsd:dateTime |
| CHAN-0005 | uncertainty | xsd:decimal |
| CHAN-0006 | unit | xsd:string |
| CHAN-0007 | value | xsd:decimal |
| CHAN-0008 | encoding | xsd:string |

**t_breaking_change_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CHAN-0001 | CHAN-0001 | CHAN-0002 | Dimension Kind 01 |
| CHAN-0002 | CHAN-0001 | CHAN-0008 | Encoding 02 |
| CHAN-0003 | CHAN-0001 | CHAN-0009 | calibration record |
| CHAN-0004 | CHAN-0001 | CHAN-0010 | en |
| CHAN-0005 | CHAN-0001 | CHAN-0003 | hybrid |
| CHAN-0006 | CHAN-0001 | CHAN-0006 | deg_C |
| CHAN-0007 | CHAN-0002 | CHAN-0002 | Dimension Kind 07 |
| CHAN-0008 | CHAN-0002 | CHAN-0008 | Encoding 08 |

**t_labrun_subclass**

| id | labrun | input_sample |
| --- | --- | --- |
| LABR-0001 | CellCulture-Exp12 | CHAN-0006 |
| LABR-0002 | FlowCyt-Panel9 | CHAN-0001 |
| LABR-0003 | ELISA-Plate88 | CHAN-0007 |
| LABR-0004 | PCR-Run-Alpha7 | CHAN-0003 |
| LABR-0005 | MassSpec-MS19 | CHAN-0002 |
| LABR-0006 | NMR-Stand-04A | CHAN-0008 |
| LABR-0007 | FlowCyt-Panel9 | CHAN-0006 |
| LABR-0008 | RNASeq-Lib15 | CHAN-0004 |

**t_labrun_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| LABR-0001 | duration_seconds | xsd:decimal |
| LABR-0002 | end_time | xsd:dateTime |
| LABR-0003 | exit_code | xsd:integer |
| LABR-0004 | host_name | xsd:string |
| LABR-0005 | log_level | xsd:string |
| LABR-0006 | phase | xsd:string |
| LABR-0007 | retry_count | xsd:integer |
| LABR-0008 | scheduled_at | xsd:dateTime |

**t_labrun_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LABR-0001 | LABR-0001 | LABR-0003 | 241 |
| LABR-0002 | LABR-0001 | LABR-0007 | 320 |
| LABR-0003 | LABR-0002 | LABR-0003 | 688 |
| LABR-0004 | LABR-0002 | LABR-0007 | 479 |
| LABR-0005 | LABR-0003 | LABR-0003 | 481 |
| LABR-0006 | LABR-0003 | LABR-0007 | 200 |
| LABR-0007 | LABR-0004 | LABR-0003 | 208 |
| LABR-0008 | LABR-0004 | LABR-0007 | 121 |

**t_labrun_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LABR-0001 | LABR-0001 | LABR-0004 | node-b14 |
| LABR-0002 | LABR-0001 | LABR-0005 | Log Level 02 |
| LABR-0003 | LABR-0001 | LABR-0006 | closeout |
| LABR-0004 | LABR-0001 | LABR-0010 | pending |
| LABR-0005 | LABR-0001 | LABR-0011 | Triggered By 05 |
| LABR-0006 | LABR-0002 | LABR-0004 | ingest-21 |
| LABR-0007 | LABR-0002 | LABR-0005 | Log Level 07 |
| LABR-0008 | LABR-0002 | LABR-0006 | closeout |

**t_trace_supports_claim_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CLAI-0001 | confidence | xsd:decimal |
| CLAI-0002 | dimension_kind | xsd:string |
| CLAI-0003 | method | xsd:string |
| CLAI-0004 | recorded_at | xsd:dateTime |
| CLAI-0005 | uncertainty | xsd:decimal |
| CLAI-0006 | unit | xsd:string |
| CLAI-0007 | value | xsd:decimal |
| CLAI-0008 | encoding | xsd:string |

Attributes are defined in a dedicated metadata table for each entity type, where each attribute is assigned a name and an XML Schema datatype. For breaking changes, attributes include confidence (xsd:decimal), dimension_kind (xsd:string), method (xsd:string), and recorded_at (xsd:dateTime). Laboratory runs define duration_seconds (xsd:decimal), end_time (xsd:dateTime), exit_code (xsd:integer), and host_name (xsd:string). Compliance traces mirror the breaking-change attribute set with confidence, dimension_kind, method, and recorded_at. The attr_type column enforces type discipline at the schema level, guaranteeing that all values stored in the corresponding value tables conform to their declared datatype. This separation of attribute definition from value storage means that the schema can evolve—new attributes can be registered without altering the value tables—while preserving backward compatibility for existing queries.

Attribute values are materialized in type-specific value tables, each of which carries a composite key formed by the value record identifier, the entity to which the value belongs, and the attribute to which it pertains. Decimal values for breaking changes include 0.203, 700.59, and 64.61; laboratory run durations are recorded as 7187.70, 5360.85, 3249.87, and 649.77 seconds; and compliance trace confidence scores appear as 0.088, 473.29, and 607.77. String values capture categorical metadata such as Dimension Kind 01, Encoding 02, calibration record, and en for breaking changes; node-b14, Log Level 02, closeout, and pending for laboratory runs; and Dimension Kind 01, Encoding 02, intake form, and es for compliance traces. Datetime values record temporal events—2023-07-26T14:07:49, 2025-01-03T20:08:42, 2024-04-10T03:15:13, and 2023-07-21T06:41:40 for breaking changes; 2023-06-03T03:48:13, 2024-12-03T15:21:58, 2024-08-31T23:33:13, and 2023-08-16T05:52:21 for laboratory runs; and 2024-06-12T18:13:41, 2024-04-03T22:44:05, 2024-09-25T21:45:51, and 2024-07-08T19:08:05 for compliance traces. Integer values for laboratory runs include exit codes and counts such as 241, 320, 688, and 479. The entity_id column in each value table establishes the referential link back to the entity's core record, while attr_id resolves to the attribute definition, forming a complete path from value to type to entity.

**t_breaking_change_subclass_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CHAN-0001 | CHAN-0001 | CHAN-0004 | 2023-07-26T14:07:49 |
| CHAN-0002 | CHAN-0002 | CHAN-0004 | 2025-01-03T20:08:42 |
| CHAN-0003 | CHAN-0003 | CHAN-0004 | 2024-04-10T03:15:13 |
| CHAN-0004 | CHAN-0004 | CHAN-0004 | 2023-07-21T06:41:40 |
| CHAN-0005 | CHAN-0005 | CHAN-0004 | 2023-07-01T02:58:50 |
| CHAN-0006 | CHAN-0006 | CHAN-0004 | 2024-07-07T11:26:39 |
| CHAN-0007 | CHAN-0007 | CHAN-0004 | 2024-07-12T18:30:29 |
| CHAN-0008 | CHAN-0008 | CHAN-0004 | 2024-11-14T05:00:21 |

**t_breaking_change_subclass_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CHAN-0001 | CHAN-0001 | CHAN-0001 | 0.203 |
| CHAN-0002 | CHAN-0001 | CHAN-0005 | 700.59 |
| CHAN-0003 | CHAN-0001 | CHAN-0007 | 64.61 |
| CHAN-0004 | CHAN-0002 | CHAN-0001 | 0.645 |
| CHAN-0005 | CHAN-0002 | CHAN-0005 | 584.78 |
| CHAN-0006 | CHAN-0002 | CHAN-0007 | 672.81 |
| CHAN-0007 | CHAN-0003 | CHAN-0001 | 0.769 |
| CHAN-0008 | CHAN-0003 | CHAN-0005 | 136.48 |

**t_labrun_subclass_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LABR-0001 | LABR-0001 | LABR-0002 | 2023-06-03T03:48:13 |
| LABR-0002 | LABR-0001 | LABR-0008 | 2024-12-03T15:21:58 |
| LABR-0003 | LABR-0001 | LABR-0009 | 2023-08-16T05:52:21 |
| LABR-0004 | LABR-0002 | LABR-0002 | 2024-08-31T23:33:13 |
| LABR-0005 | LABR-0002 | LABR-0008 | 2025-02-13T01:21:55 |
| LABR-0006 | LABR-0002 | LABR-0009 | 2023-04-09T20:59:10 |
| LABR-0007 | LABR-0003 | LABR-0002 | 2024-04-14T13:26:56 |
| LABR-0008 | LABR-0003 | LABR-0008 | 2024-07-04T01:41:44 |

**t_labrun_subclass_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LABR-0001 | LABR-0001 | LABR-0001 | 7187.70 |
| LABR-0002 | LABR-0002 | LABR-0001 | 5360.85 |
| LABR-0003 | LABR-0003 | LABR-0001 | 3249.87 |
| LABR-0004 | LABR-0004 | LABR-0001 | 649.77 |
| LABR-0005 | LABR-0005 | LABR-0001 | 3590.34 |
| LABR-0006 | LABR-0006 | LABR-0001 | 456.45 |
| LABR-0007 | LABR-0007 | LABR-0001 | 5720.89 |
| LABR-0008 | LABR-0008 | LABR-0001 | 7012.99 |

**t_trace_supports_claim_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0004 | 2024-06-12T18:13:41 |
| CLAI-0002 | CLAI-0002 | CLAI-0004 | 2024-04-03T22:44:05 |
| CLAI-0003 | CLAI-0003 | CLAI-0004 | 2024-09-25T21:45:51 |
| CLAI-0004 | CLAI-0004 | CLAI-0004 | 2024-07-08T19:08:05 |
| CLAI-0005 | CLAI-0005 | CLAI-0004 | 2023-05-02T18:38:21 |
| CLAI-0006 | CLAI-0006 | CLAI-0004 | 2023-03-27T11:44:46 |

**t_trace_supports_claim_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0001 | 0.088 |
| CLAI-0002 | CLAI-0001 | CLAI-0005 | 473.29 |
| CLAI-0003 | CLAI-0001 | CLAI-0007 | 607.77 |
| CLAI-0004 | CLAI-0002 | CLAI-0001 | 0.802 |
| CLAI-0005 | CLAI-0002 | CLAI-0005 | 968.55 |
| CLAI-0006 | CLAI-0002 | CLAI-0007 | 413.59 |
| CLAI-0007 | CLAI-0003 | CLAI-0001 | 0.176 |
| CLAI-0008 | CLAI-0003 | CLAI-0005 | 496.89 |

Cross-entity relationships are expressed through foreign keys that bind laboratory runs to the channel entities they consume and breaking changes to the laboratory runs they affect. The input_sample column in the laboratory run table references channel identifiers—CHAN-0006, CHAN-0001, CHAN-0007, and CHAN-0003—thereby linking each experimental run to its upstream data source. The breaking_change_for column in the breaking change table references laboratory run identifiers such as LABR-0005, LABR-0006, and LABR-0007, establishing that a breaking change in Telemetry schema evolution or OAuth2 token rotation directly impacts specific downstream runs. These relationships create a traceability chain: a compliance trace such as compliance-audit-cycle supports a claim about a laboratory run, which in turn depends on a channel entity, and a breaking change may alter the schema of that channel or the execution of that run. The identifier prefixes—CHAN, LABR, CLAI—serve as an implicit namespace convention, making it possible to validate referential integrity at a glance and to partition queries by entity class without examining the full key space.

**t_trace_supports_claim**

| id | trace |
| --- | --- |
| CLAI-0001 | compliance-audit-cycle |
| CLAI-0002 | sensor-calibration-seq |
| CLAI-0003 | incident-response-workflow |
| CLAI-0004 | telemetry-ingestion-stream |
| CLAI-0005 | incident-response-workflow |
| CLAI-0006 | log-aggregation-cycle |

**t_trace_supports_claim_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0002 | Dimension Kind 01 |
| CLAI-0002 | CLAI-0001 | CLAI-0008 | Encoding 02 |
| CLAI-0003 | CLAI-0001 | CLAI-0009 | intake form |
| CLAI-0004 | CLAI-0001 | CLAI-0010 | es |
| CLAI-0005 | CLAI-0001 | CLAI-0003 | hybrid |
| CLAI-0006 | CLAI-0001 | CLAI-0006 | count |
| CLAI-0007 | CLAI-0002 | CLAI-0002 | Dimension Kind 07 |
| CLAI-0008 | CLAI-0002 | CLAI-0008 | Encoding 08 |