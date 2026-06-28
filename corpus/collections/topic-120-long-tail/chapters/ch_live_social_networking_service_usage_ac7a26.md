---
chapter_id: ch_live_social_networking_service_usage_ac7a26
topic_id: 120
family: 08_derived
cited_terms: ['social_networking_service_usage', 'lineage_observed_by_event', 'control_with_owner']
model: engine-refine
---

Attributes and their types constitute the fundamental mechanism by which entities are described and measured across the data model. Each attribute carries a formally declared type—`xsd:decimal` for numeric precision, `xsd:string` for textual labels, `xsd:dateTime` for temporal stamps, `xsd:boolean` for binary conditions, and `xsd:integer` for whole-number quantities—that governs how values are stored, validated, and queried. In the lineage observation domain, attributes such as `confidence` (typed as `xsd:decimal`) capture continuous measurements like 0.142 or 0.607, while `dimension_kind` and `method` (both `xsd:string`) encode categorical descriptors such as "Dimension Kind 01" or "Encoding 02." The `recorded_at` attribute, typed as `xsd:dateTime`, anchors observations to precise moments—2024-07-15T19:59:01, for instance—enabling temporal reasoning over event histories. Similarly, control attributes include `effective_date` (`xsd:date`) with values like 2024-04-04, `enforcement` (`xsd:string`), `mandatory` (`xsd:boolean`) with truth values true or false, and `priority` (`xsd:integer`) with magnitudes ranging from 4 to 806. This type discipline ensures that heterogeneous data—whether sensor-fusion-pipeline outputs, financial-risk-model results, or quality-control-assay records—can be uniformly addressed through a shared attribute vocabulary.

**t_control_with_owner_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| OWNE-0001 | effective_date | xsd:date |
| OWNE-0002 | enforcement | xsd:string |
| OWNE-0003 | mandatory | xsd:boolean |
| OWNE-0004 | priority | xsd:integer |
| OWNE-0005 | review_cycle_days | xsd:integer |
| OWNE-0006 | scope | xsd:string |
| OWNE-0007 | encoding | xsd:string |
| OWNE-0008 | label_text | xsd:string |

Categories provide the classificatory scaffolding that organizes participants and services into coherent groups. The `involves_participant_category` dimension assigns each participant to a classification such as "Involves Participant Category 01" through "Involves Participant Category 04," while the `utilizes_service_category` dimension performs an analogous function for services, with values like "Utilizes Service Category 01" through "Utilizes Service Category 04." These categorical labels, paired with their corresponding free-form labels—Involves Participant Label 01, Utilizes Service Label 03, and so forth—enable both machine-readable grouping and human-readable identification. The separation of category from label reflects a deliberate design choice: categories support aggregation and filtering at scale, while labels preserve the semantic nuance required for audit trails and stakeholder communication.

**dim_involves_participant**

| id | involves_participant_label | involves_participant_category |
| --- | --- | --- |
| USAG-0001 | Involves Participant Label 01 | Involves Participant Category 01 |
| USAG-0002 | Involves Participant Label 02 | Involves Participant Category 02 |
| USAG-0003 | Involves Participant Label 03 | Involves Participant Category 03 |
| USAG-0004 | Involves Participant Label 04 | Involves Participant Category 04 |
| USAG-0005 | Involves Participant Label 05 | Involves Participant Category 05 |
| USAG-0006 | Involves Participant Label 06 | Involves Participant Category 06 |

**dim_utilizes_service**

| id | utilizes_service_label | utilizes_service_category |
| --- | --- | --- |
| USAG-0001 | Utilizes Service Label 01 | Utilizes Service Category 01 |
| USAG-0002 | Utilizes Service Label 02 | Utilizes Service Category 02 |
| USAG-0003 | Utilizes Service Label 03 | Utilizes Service Category 03 |
| USAG-0004 | Utilizes Service Label 04 | Utilizes Service Category 04 |
| USAG-0005 | Utilizes Service Label 05 | Utilizes Service Category 05 |
| USAG-0006 | Utilizes Service Label 06 | Utilizes Service Category 06 |

Entities serve as the primary referents to which attributes bind, and identifiers provide the stable keys that link entities across tables. Event entities, designated by identifiers such as EVEN-0001 through EVEN-0004, carry lineage metadata and are associated with attribute values through foreign-key relationships: an entity_id in a value table points back to the entity it describes, while an attr_id resolves to the attribute definition. Control entities, identified as OWNE-0001 through OWNE-0004, similarly anchor attribute values—whether boolean flags, date ranges, integer priorities, or string encodings—to specific governance artifacts like "Vendor Risk Assessment" or "Data Retention Policy." The identifier USAG-0001, for example, appears both as a primary key in the social fact table and as a foreign key in the participant and service dimensions, establishing a navigable graph between observed behaviors and their contextual metadata.

**t_lineage_observed_by_event**

| id | lineage |
| --- | --- |
| EVEN-0001 | sensor-fusion-pipeline |
| EVEN-0002 | financial-risk-model |
| EVEN-0003 | data-lake-ingestion |
| EVEN-0004 | quality-control-assay |
| EVEN-0005 | iot-telemetry-ingest |
| EVEN-0006 | financial-risk-model |

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

**t_control_with_owner**

| id | control |
| --- | --- |
| OWNE-0001 | Vendor Risk Assessment |
| OWNE-0002 | Data Retention Policy |
| OWNE-0003 | Vendor Risk Assessment |
| OWNE-0004 | Data Retention Policy |
| OWNE-0005 | Password Complexity Policy |
| OWNE-0006 | MFA Enforcement |
| OWNE-0007 | Data Retention Policy |

**t_control_with_owner_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0003 | true |
| OWNE-0002 | OWNE-0002 | OWNE-0003 | true |
| OWNE-0003 | OWNE-0003 | OWNE-0003 | false |
| OWNE-0004 | OWNE-0004 | OWNE-0003 | true |
| OWNE-0005 | OWNE-0005 | OWNE-0003 | true |
| OWNE-0006 | OWNE-0006 | OWNE-0003 | true |
| OWNE-0007 | OWNE-0007 | OWNE-0003 | true |

**t_control_with_owner_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0001 | 2024-04-04 |
| OWNE-0002 | OWNE-0002 | OWNE-0001 | 2025-04-01 |
| OWNE-0003 | OWNE-0003 | OWNE-0001 | 2025-05-22 |
| OWNE-0004 | OWNE-0004 | OWNE-0001 | 2024-09-08 |
| OWNE-0005 | OWNE-0005 | OWNE-0001 | 2023-05-30 |
| OWNE-0006 | OWNE-0006 | OWNE-0001 | 2023-06-07 |
| OWNE-0007 | OWNE-0007 | OWNE-0001 | 2025-03-19 |

**t_control_with_owner_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0004 | 4 |
| OWNE-0002 | OWNE-0001 | OWNE-0005 | 806 |
| OWNE-0003 | OWNE-0002 | OWNE-0004 | 5 |
| OWNE-0004 | OWNE-0002 | OWNE-0005 | 150 |
| OWNE-0005 | OWNE-0003 | OWNE-0004 | 1 |
| OWNE-0006 | OWNE-0003 | OWNE-0005 | 596 |
| OWNE-0007 | OWNE-0004 | OWNE-0004 | 2 |
| OWNE-0008 | OWNE-0004 | OWNE-0005 | 663 |

**t_control_with_owner_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0007 | Encoding 01 |
| OWNE-0002 | OWNE-0001 | OWNE-0002 | Enforcement 02 |
| OWNE-0003 | OWNE-0001 | OWNE-0008 | change rationale |
| OWNE-0004 | OWNE-0001 | OWNE-0009 | es |
| OWNE-0005 | OWNE-0001 | OWNE-0006 | Scope 05 |
| OWNE-0006 | OWNE-0002 | OWNE-0007 | Encoding 06 |
| OWNE-0007 | OWNE-0002 | OWNE-0002 | Enforcement 07 |
| OWNE-0008 | OWNE-0002 | OWNE-0008 | intake form |

Event counts quantify the volume of activity associated with each social fact record, ranging from 199 to 339 occurrences across identifiers USAG-0001 through USAG-0004. These counts function as measures in analytical queries, enabling comparisons of engagement intensity or system load across different participant-service pairings. The fact table structure—where each row links an identifier to a specific participant via involves_participant_key and to a specific service via utilizes_service_key—creates a many-to-many relationship that can be aggregated by any dimension. A participant labeled "Involves Participant Label 03" may appear in multiple fact rows with different service associations, and the event_count column captures the transactional weight of each such association independently.

**fact_social**

| id | involves_participant_key | utilizes_service_key | event_count |
| --- | --- | --- | --- |
| USAG-0001 | USAG-0003 | USAG-0005 | 333 |
| USAG-0002 | USAG-0004 | USAG-0002 | 199 |
| USAG-0003 | USAG-0003 | USAG-0006 | 339 |
| USAG-0004 | USAG-0001 | USAG-0002 | 283 |
| USAG-0005 | USAG-0005 | USAG-0001 | 488 |
| USAG-0006 | USAG-0004 | USAG-0003 | 193 |
| USAG-0007 | USAG-0001 | USAG-0006 | 419 |
| USAG-0008 | USAG-0006 | USAG-0002 | 202 |

The misc column accommodates heterogeneous value storage across type-specific value tables, each dedicated to a single attribute type. Decimal values (0.142, 754.57, 852.05) reside in one table, datetime stamps (2023-01-03T08:23:46, 2024-06-13T23:29:26) in another, string values ("pre-release note", "en", "es") in a third, and so forth. This normalization by type avoids the pitfalls of generic value columns—null proliferation, type coercion errors, and index inefficiency—while preserving the ability to reconstruct a complete entity profile by joining across all value tables on the shared entity_id and attr_id keys. The result is a schema that scales to hundreds of attribute types without sacrificing query performance or data integrity.