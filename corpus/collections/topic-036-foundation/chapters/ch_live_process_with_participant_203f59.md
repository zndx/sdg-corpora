---
chapter_id: ch_live_process_with_participant_203f59
topic_id: 36
family: 01_foundation
cited_terms: ['process_with_participant', 'schemaorg_place_longitude', 'table_provenance_source']
model: engine-refine
---

The governance of process execution data rests upon a disciplined separation between declarative metadata and measured observations. Each process instance—such as an access review or compliance audit—is anchored by a unique identifier, for example PART-0001 through PART-0004, and is associated with a related component like a validation suite, scheduler service, or ingestion pipeline. The attributes that describe these process-participant relationships are themselves catalogued with precise type annotations: duration_seconds carries the xsd:decimal type, end_time is typed as xsd:dateTime, exit_code as xsd:integer, and host_name as xsd:string. This type discipline ensures that downstream consumers of the data can interpret each value within its correct semantic and computational context, preventing the kind of type confusion that routinely undermines audit trails and compliance reporting.

**t_process_with_participant**

| id | process | related |
| --- | --- | --- |
| PART-0001 | access review | validation suite |
| PART-0002 | network synchronization | scheduler service |
| PART-0003 | compliance audit | training cluster |
| PART-0004 | compliance audit | ingestion pipeline |
| PART-0005 | network synchronization | ingestion pipeline |
| PART-0006 | schema migration | scheduler service |
| PART-0007 | schema migration | compliance dataset |
| PART-0008 | quality assurance | validation suite |

**t_process_with_participant_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| PART-0001 | duration_seconds | xsd:decimal |
| PART-0002 | end_time | xsd:dateTime |
| PART-0003 | exit_code | xsd:integer |
| PART-0004 | host_name | xsd:string |
| PART-0005 | log_level | xsd:string |
| PART-0006 | phase | xsd:string |
| PART-0007 | retry_count | xsd:integer |
| PART-0008 | scheduled_at | xsd:dateTime |

**t_process_with_participant_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PART-0001 | PART-0001 | PART-0002 | 2024-06-12T21:46:50 |
| PART-0002 | PART-0001 | PART-0008 | 2024-08-24T17:43:03 |
| PART-0003 | PART-0001 | PART-0009 | 2024-02-26T12:31:34 |
| PART-0004 | PART-0002 | PART-0002 | 2023-09-13T23:16:55 |
| PART-0005 | PART-0002 | PART-0008 | 2023-09-18T01:53:27 |
| PART-0006 | PART-0002 | PART-0009 | 2023-12-19T06:07:05 |
| PART-0007 | PART-0003 | PART-0002 | 2025-02-28T12:35:26 |
| PART-0008 | PART-0003 | PART-0008 | 2023-01-21T19:46:12 |

**t_process_with_participant_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PART-0001 | PART-0001 | PART-0001 | 565.34 |
| PART-0002 | PART-0002 | PART-0001 | 6522.24 |
| PART-0003 | PART-0003 | PART-0001 | 236.49 |
| PART-0004 | PART-0004 | PART-0001 | 5070.41 |
| PART-0005 | PART-0005 | PART-0001 | 5946.70 |
| PART-0006 | PART-0006 | PART-0001 | 6238.25 |
| PART-0007 | PART-0007 | PART-0001 | 1191.07 |
| PART-0008 | PART-0008 | PART-0001 | 3672.98 |

**t_process_with_participant_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PART-0001 | PART-0001 | PART-0003 | 231 |
| PART-0002 | PART-0001 | PART-0007 | 324 |
| PART-0003 | PART-0002 | PART-0003 | 759 |
| PART-0004 | PART-0002 | PART-0007 | 24 |
| PART-0005 | PART-0003 | PART-0003 | 283 |
| PART-0006 | PART-0003 | PART-0007 | 408 |
| PART-0007 | PART-0004 | PART-0003 | 247 |
| PART-0008 | PART-0004 | PART-0007 | 74 |

**t_process_with_participant_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PART-0001 | PART-0001 | PART-0004 | gw-12 |
| PART-0002 | PART-0001 | PART-0005 | Log Level 02 |
| PART-0003 | PART-0001 | PART-0006 | review |
| PART-0004 | PART-0001 | PART-0010 | failed |
| PART-0005 | PART-0001 | PART-0011 | Triggered By 05 |
| PART-0006 | PART-0002 | PART-0004 | node-b14 |
| PART-0007 | PART-0002 | PART-0005 | Log Level 07 |
| PART-0008 | PART-0002 | PART-0006 | execution |

The actual measurements for these attributes are stored in a value-oriented schema that partitions data by type, a design choice that reflects the practical reality that compliance systems must handle heterogeneous data without sacrificing query performance. Decimal-valued attributes such as duration_seconds yield figures like 565.34, 6522.24, 236.49, and 5070.41 across different process instances. Integer-valued attributes record exit codes or counts—231, 324, 759, 24—while datetime attributes capture temporal boundaries such as 2024-06-12T21:46:50 and 2023-09-13T23:16:55. String-valued attributes hold identifiers like gw-12, log levels such as Log Level 02, and status indicators including review and failed. Each value is linked back to its entity and attribute through foreign keys, forming a chain of traceability from raw observation to interpreted fact.

Beyond the process execution domain, the framework extends to geospatial and locational metadata through a subject–target relationship model that encodes provenance through roles. A schema.org place such as HooverDam, MaunaLoaObservatory, GoldenGateBridge, or ISSOrbitModule is associated with a longitude coordinate—values including −27.9692, 2.2945, and −3.3869—through a relationship record that specifies the role of the subject in relation to the target. Roles such as reviewer, contributor, and owner provide a lightweight but expressive mechanism for capturing the nature of the association, enabling downstream systems to distinguish between authoritative and advisory sources of geospatial data. This role-based relationship model is not limited to geospatial data; it generalizes to any domain where the provenance of a fact depends on who asserted it and in what capacity.

**t_schemaorg_place_longitude**

| id | schemaorg |
| --- | --- |
| LONG-0001 | HooverDam |
| LONG-0002 | MaunaLoaObservatory |
| LONG-0003 | GoldenGateBridge |
| LONG-0004 | ISSOrbitModule |
| LONG-0005 | CERNControlCenter |
| LONG-0006 | PaloAltoResearchCenter |
| LONG-0007 | BlackRockForest |

**t_schemaorg_place_longitude_longitude**

| id | longitude |
| --- | --- |
| LONG-0001 | -27.9692 |
| LONG-0002 | 2.2945 |
| LONG-0003 | -3.3869 |
| LONG-0004 | 2.2945 |
| LONG-0005 | -27.0366 |
| LONG-0006 | -27.0366 |

**t_schemaorg_place_longitude__longitude**

| id | schemaorg_id | longitude_id | role |
| --- | --- | --- | --- |
| LONG-0001 | LONG-0005 | LONG-0002 | reviewer |
| LONG-0002 | LONG-0007 | LONG-0004 | contributor |
| LONG-0003 | LONG-0003 | LONG-0001 | owner |
| LONG-0004 | LONG-0003 | LONG-0003 | owner |
| LONG-0005 | LONG-0002 | LONG-0003 | reviewer |
| LONG-0006 | LONG-0001 | LONG-0003 | contributor |
| LONG-0007 | LONG-0004 | LONG-0002 | reviewer |
| LONG-0008 | LONG-0007 | LONG-0006 | contributor |

The fact table serves as the central aggregation point for measured observations, each record carrying both a confidence score and an uncertainty measure that together quantify the reliability of the underlying data. Confidence values range from 0.140 to 0.874, reflecting a spectrum from highly uncertain to strongly supported observations, while uncertainty values—measured on a scale that includes 648.78, 899.39, 885.54, and 289.58—provide a complementary perspective on the same quality dimension. Each fact is traced to its origin through a sourced_from_table key, linking back to a dimension table that assigns a category and a human-readable label to the source. Categories such as Sourced From Table Category 01 through 04 enable bulk classification of data provenance, while the labels—Sourced From Table Label 01 through 04—support operational dashboards and compliance reports that require human-readable source attribution. This dual encoding of provenance, with both categorical and textual dimensions, ensures that data governance policies can be applied at the appropriate level of granularity, whether the requirement is to filter by source category or to display source names to auditors.

**fact_table**

| id | sourced_from_table_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| SOUR-0001 | SOUR-0008 | 0.274 | 648.78 | 608.50 |
| SOUR-0002 | SOUR-0006 | 0.140 | 899.39 | 639.23 |
| SOUR-0003 | SOUR-0006 | 0.609 | 885.54 | 470.53 |
| SOUR-0004 | SOUR-0006 | 0.874 | 289.58 | 720.41 |

**dim_sourced_from_table**

| id | sourced_from_table_label | sourced_from_table_category |
| --- | --- | --- |
| SOUR-0001 | Sourced From Table Label 01 | Sourced From Table Category 01 |
| SOUR-0002 | Sourced From Table Label 02 | Sourced From Table Category 02 |
| SOUR-0003 | Sourced From Table Label 03 | Sourced From Table Category 03 |
| SOUR-0004 | Sourced From Table Label 04 | Sourced From Table Category 04 |
| SOUR-0005 | Sourced From Table Label 05 | Sourced From Table Category 05 |
| SOUR-0006 | Sourced From Table Label 06 | Sourced From Table Category 06 |
| SOUR-0007 | Sourced From Table Label 07 | Sourced From Table Category 07 |
| SOUR-0008 | Sourced From Table Label 08 | Sourced From Table Category 08 |