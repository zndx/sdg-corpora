---
chapter_id: ch_live_existential_with_part_of_ff7b7d
topic_id: 67
family: 01_foundation
cited_terms: ['existential_with_part_of', 'labrun_uses_instrument', 'dempster_combines_audit_evidences']
model: engine-refine
---

An identifier serves as the immutable anchor of any tracked entity, a stable reference that persists across the full lifecycle of the data it represents. In practice, identifiers such as PART-0001 through PART-0004 designate existential components whose structural relationships are captured by part-of associations—regional_telemetry_gateway and alpha_query_engine both resolve to geo_redundant_backup, while alpha_compute_cluster and primary_stream_processor map to audit_logging_system and realtime_analytics_platform respectively. Similarly, instrument relationships receive their own identifier namespace, INST-0001 through INST-0004, each encoding a distinct lab-run-to-instrument binding: RUN-2024-A7 against the ThermoFisher Q-Exactive, PROT-XRAY-03 against the Hitachi S-4800, CYTO-20241022 against the Bruker Avance III, and GENOME-READ-04 against the Olympus BX63. The entity itself is the concrete instantiation of a relationship or object within the domain, and it is always addressable through its identifier, whether that entity is a telemetry gateway, a laboratory run, or a Dempster-Shafer evidence record such as EVID-0001 through EVID-0004.

**t_existential_with_part_of**

| id | existential | part_of |
| --- | --- | --- |
| PART-0001 | regional_telemetry_gateway | geo_redundant_backup |
| PART-0002 | alpha_compute_cluster | audit_logging_system |
| PART-0003 | alpha_query_engine | geo_redundant_backup |
| PART-0004 | primary_stream_processor | realtime_analytics_platform |

**t_labrun_uses_instrument**

| id | labrun | uses |
| --- | --- | --- |
| INST-0001 | RUN-2024-A7 | ThermoFisher Q-Exactive |
| INST-0002 | PROT-XRAY-03 | Hitachi S-4800 |
| INST-0003 | CYTO-20241022 | Bruker Avance III |
| INST-0004 | GENOME-READ-04 | Olympus BX63 |
| INST-0005 | FIELD-MAP-09 | Shimadzu GCMS-TQ8050 |
| INST-0006 | ASSAY-Q3-24 | Waters Xevo TQ-S |

**t_labrun_uses_instrument_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INST-0001 | INST-0001 | INST-0002 | 2023-07-28T22:24:46 |
| INST-0002 | INST-0001 | INST-0008 | 2024-09-04T14:41:30 |
| INST-0003 | INST-0001 | INST-0009 | 2025-06-09T20:56:36 |
| INST-0004 | INST-0002 | INST-0002 | 2024-06-06T14:47:39 |
| INST-0005 | INST-0002 | INST-0008 | 2025-04-06T19:57:44 |
| INST-0006 | INST-0002 | INST-0009 | 2023-06-18T12:50:38 |
| INST-0007 | INST-0003 | INST-0002 | 2023-05-25T22:41:33 |
| INST-0008 | INST-0003 | INST-0008 | 2023-09-07T05:37:31 |

**t_labrun_uses_instrument_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INST-0001 | INST-0001 | INST-0001 | 397.40 |
| INST-0002 | INST-0002 | INST-0001 | 2693.73 |
| INST-0003 | INST-0003 | INST-0001 | 4636.55 |
| INST-0004 | INST-0004 | INST-0001 | 1173.52 |
| INST-0005 | INST-0005 | INST-0001 | 1814.21 |
| INST-0006 | INST-0006 | INST-0001 | 5265.62 |

**t_labrun_uses_instrument_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INST-0001 | INST-0001 | INST-0003 | 889 |
| INST-0002 | INST-0001 | INST-0007 | 321 |
| INST-0003 | INST-0002 | INST-0003 | 608 |
| INST-0004 | INST-0002 | INST-0007 | 248 |
| INST-0005 | INST-0003 | INST-0003 | 589 |
| INST-0006 | INST-0003 | INST-0007 | 121 |
| INST-0007 | INST-0004 | INST-0003 | 16 |
| INST-0008 | INST-0004 | INST-0007 | 442 |

**t_labrun_uses_instrument_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INST-0001 | INST-0001 | INST-0004 | ingest-21 |
| INST-0002 | INST-0001 | INST-0005 | Log Level 02 |
| INST-0003 | INST-0001 | INST-0006 | execution |
| INST-0004 | INST-0001 | INST-0010 | superseded |
| INST-0005 | INST-0001 | INST-0011 | Triggered By 05 |
| INST-0006 | INST-0002 | INST-0004 | worker-07 |
| INST-0007 | INST-0002 | INST-0005 | Log Level 07 |
| INST-0008 | INST-0002 | INST-0006 | review |

Attributes attach descriptive properties to entities, and their types enforce the semantic discipline of the data model. The attribute schema distinguishes between duration_seconds, end_time, exit_code, and host_name, each bound to a precise type annotation—xsd:decimal, xsd:dateTime, xsd:integer, and xsd:string respectively—ensuring that value storage and validation remain consistent across heterogeneous data sources. This type discipline manifests in the value tables, where decimal measurements such as 397.40, 2693.73, 4636.55, and 1173.55 are stored separately from temporal stamps like 2023-07-28T22:24:46, 2024-09-04T14:41:30, and 2025-06-09T20:56:36, from integer codes including 889, 321, 608, and 248, and from free-form strings such as ingest-21, Log Level 02, execution, and superseded. The separation of value types by domain is not merely a storage optimization; it is a structural guarantee that downstream consumers can reason about data without runtime coercion.

Categories provide the organizational scaffolding that allows attributes, entities, and evidence records to be grouped, filtered, and reported upon at scale. In the Dempster-Shafer dimension, each evidence record carries a category designation—Dempster Category 01 through Dempster Category 04—paired with a human-readable label such as Dempster Label 01 through Dempster Label 04. These categorical assignments enable aggregation across heterogeneous evidence sources while preserving the provenance of each classification. The misc column, which appears across multiple tables, serves as a catch-all for values that do not fit the primary typed schema, capturing supplementary metadata that supports auditing, debugging, or downstream analytics without polluting the core attribute model.

**dim_dempster**

| id | dempster_label | dempster_category |
| --- | --- | --- |
| EVID-0001 | Dempster Label 01 | Dempster Category 01 |
| EVID-0002 | Dempster Label 02 | Dempster Category 02 |
| EVID-0003 | Dempster Label 03 | Dempster Category 03 |
| EVID-0004 | Dempster Label 04 | Dempster Category 04 |
| EVID-0005 | Dempster Label 05 | Dempster Category 05 |
| EVID-0006 | Dempster Label 06 | Dempster Category 06 |
| EVID-0007 | Dempster Label 07 | Dempster Category 07 |
| EVID-0008 | Dempster Label 08 | Dempster Category 08 |

Confidence and uncertainty form the quantitative backbone of the Dempster-Shafer evidence framework, where each fact record carries a confidence score and an associated uncertainty measure that together characterize the reliability of the underlying observation. The fact table records confidence values ranging from 0.014 for EVID-0002 to 0.728 for EVID-0004, while uncertainty values span from 9.49 for EVID-0001 to 687.80 for EVID-0003, with corresponding evidence values of 520.46, 137.18, 197.61, and 846.10. These metrics are not independent; they are coupled through the dempster_key linkage, which connects each evidence fact to its dimensional context, ensuring that confidence and uncertainty are always interpreted within the correct categorical and labeling framework. The existential-part-of relationships, while structurally distinct from the Dempster-Shafer evidence model, share the same foundational pattern: a stable identifier, typed attributes, categorical classification, and value storage that together enable traceable, auditable, and queryable data governance across the entire system.

**t_labrun_uses_instrument_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| INST-0001 | duration_seconds | xsd:decimal |
| INST-0002 | end_time | xsd:dateTime |
| INST-0003 | exit_code | xsd:integer |
| INST-0004 | host_name | xsd:string |
| INST-0005 | log_level | xsd:string |
| INST-0006 | phase | xsd:string |
| INST-0007 | retry_count | xsd:integer |
| INST-0008 | scheduled_at | xsd:dateTime |

**fact_dempster**

| id | dempster_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| EVID-0001 | EVID-0007 | 0.153 | 9.49 | 520.46 |
| EVID-0002 | EVID-0003 | 0.014 | 392.06 | 137.18 |
| EVID-0003 | EVID-0004 | 0.025 | 687.80 | 197.61 |
| EVID-0004 | EVID-0007 | 0.728 | 479.57 | 846.10 |
| EVID-0005 | EVID-0005 | 0.918 | 172.36 | 296.96 |
| EVID-0006 | EVID-0006 | 0.755 | 608.06 | 341.51 |