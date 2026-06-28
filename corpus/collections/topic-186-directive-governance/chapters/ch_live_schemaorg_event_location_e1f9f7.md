---
chapter_id: ch_live_schemaorg_event_location_e1f9f7
topic_id: 186
family: 07_long_tail
cited_terms: ['schemaorg_event_location', 'schemaorg_event_organizer', 'schemaorg_event_starttime']
model: engine-refine
---

In a governed data environment, every operational entity is anchored by a unique identifier that serves as the primary key for relational integrity. For instance, infrastructure components and organizational units are distinguished by specific identifiers such as `LOCA-0001` for a location entity or `ORGA-0001` for an organizer entity. These identifiers link to descriptive metadata, such as the `schemaorg` classification `metadata-registry-sync` or the physical location `AWS us-east-1`. To maintain a flexible and extensible schema, attributes are decoupled from the core entity definition. An attribute is defined by its name—such as `checksum` or `created_date`—and its strict data type, which might be an `xsd:string`, an `xsd:date`, or a specialized type like `cco:DesignativeICE`. This separation ensures that the structural definition of an entity remains stable while its descriptive properties can evolve independently.

**t_schemaorg_event_location**

| id | schemaorg | event_location |
| --- | --- | --- |
| LOCA-0001 | metadata-registry-sync | AWS us-east-1 |
| LOCA-0002 | Cloud Observability Meetup | Basement Server Room |
| LOCA-0003 | telemetry-ingestion-pipeline | Room 4B Server Hall |
| LOCA-0004 | telemetry-ingestion-pipeline | Network Zone Secure |
| LOCA-0005 | regulatory-compliance-file | Network Zone Secure |
| LOCA-0006 | Governance Workshop | Basement Server Room |
| LOCA-0007 | AI Model Summit | AWS us-east-1 |
| LOCA-0008 | lab-sample-tracker | Facility 7 Calibration Lab |

**t_schemaorg_event_location_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| LOCA-0001 | checksum | xsd:string |
| LOCA-0002 | created_date | xsd:date |
| LOCA-0003 | identifier | cco:DesignativeICE |
| LOCA-0004 | license | xsd:string |
| LOCA-0005 | mime_type | xsd:string |
| LOCA-0006 | size_bytes | xsd:long |
| LOCA-0007 | uri | xsd:string |
| LOCA-0008 | version | xsd:integer |

**t_schemaorg_event_location_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LOCA-0001 | LOCA-0001 | LOCA-0002 | 2024-05-14 |
| LOCA-0002 | LOCA-0002 | LOCA-0002 | 2024-02-21 |
| LOCA-0003 | LOCA-0003 | LOCA-0002 | 2023-06-13 |
| LOCA-0004 | LOCA-0004 | LOCA-0002 | 2023-08-21 |
| LOCA-0005 | LOCA-0005 | LOCA-0002 | 2025-03-20 |
| LOCA-0006 | LOCA-0006 | LOCA-0002 | 2025-01-04 |
| LOCA-0007 | LOCA-0007 | LOCA-0002 | 2023-08-21 |
| LOCA-0008 | LOCA-0008 | LOCA-0002 | 2025-03-26 |

**t_schemaorg_event_location_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LOCA-0001 | LOCA-0001 | LOCA-0006 | 400 |
| LOCA-0002 | LOCA-0001 | LOCA-0008 | 6 |
| LOCA-0003 | LOCA-0002 | LOCA-0006 | 223 |
| LOCA-0004 | LOCA-0002 | LOCA-0008 | 6 |
| LOCA-0005 | LOCA-0003 | LOCA-0006 | 283 |
| LOCA-0006 | LOCA-0003 | LOCA-0008 | 2 |
| LOCA-0007 | LOCA-0004 | LOCA-0006 | 450 |
| LOCA-0008 | LOCA-0004 | LOCA-0008 | 8 |

**t_schemaorg_event_location_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LOCA-0001 | LOCA-0001 | LOCA-0001 | c0ffee42 |
| LOCA-0002 | LOCA-0001 | LOCA-0003 | ref-8842 |
| LOCA-0003 | LOCA-0001 | LOCA-0004 | Apache-2.0 |
| LOCA-0004 | LOCA-0001 | LOCA-0009 | ap-south-2 |
| LOCA-0005 | LOCA-0001 | LOCA-0005 | application/json |
| LOCA-0006 | LOCA-0001 | LOCA-0010 | Name 06 |
| LOCA-0007 | LOCA-0001 | LOCA-0011 | analytics |
| LOCA-0008 | LOCA-0001 | LOCA-0012 | Tags 08 |

**t_schemaorg_event_organizer**

| id | schemaorg | organizer |
| --- | --- | --- |
| ORGA-0001 | sensor-calibration-batch | MongoDB Events |
| ORGA-0002 | data-lake-ingestion-job | Linux Foundation |
| ORGA-0003 | Telemetry Conference | Open Source Alliance |
| ORGA-0004 | telemetry-ingestion-pipeline | MongoDB Events |
| ORGA-0005 | regulatory-compliance-file | IEEE Computer Society |
| ORGA-0006 | sensor-calibration-batch | IEEE Computer Society |
| ORGA-0007 | lab-sample-tracker | DataBricks Inc |

**t_schemaorg_event_organizer_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ORGA-0001 | checksum | xsd:string |
| ORGA-0002 | created_date | xsd:date |
| ORGA-0003 | identifier | cco:DesignativeICE |
| ORGA-0004 | license | xsd:string |
| ORGA-0005 | mime_type | xsd:string |
| ORGA-0006 | size_bytes | xsd:long |
| ORGA-0007 | uri | xsd:string |
| ORGA-0008 | version | xsd:integer |

**t_schemaorg_event_organizer_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ORGA-0001 | ORGA-0001 | ORGA-0002 | 2024-07-16 |
| ORGA-0002 | ORGA-0002 | ORGA-0002 | 2023-04-02 |
| ORGA-0003 | ORGA-0003 | ORGA-0002 | 2023-04-02 |
| ORGA-0004 | ORGA-0004 | ORGA-0002 | 2023-04-08 |
| ORGA-0005 | ORGA-0005 | ORGA-0002 | 2023-03-07 |
| ORGA-0006 | ORGA-0006 | ORGA-0002 | 2023-12-15 |
| ORGA-0007 | ORGA-0007 | ORGA-0002 | 2023-05-20 |

**t_schemaorg_event_organizer_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ORGA-0001 | ORGA-0001 | ORGA-0006 | 440 |
| ORGA-0002 | ORGA-0001 | ORGA-0008 | 7 |
| ORGA-0003 | ORGA-0002 | ORGA-0006 | 450 |
| ORGA-0004 | ORGA-0002 | ORGA-0008 | 6 |
| ORGA-0005 | ORGA-0003 | ORGA-0006 | 147 |
| ORGA-0006 | ORGA-0003 | ORGA-0008 | 6 |
| ORGA-0007 | ORGA-0004 | ORGA-0006 | 298 |
| ORGA-0008 | ORGA-0004 | ORGA-0008 | 7 |

**t_schemaorg_event_organizer_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ORGA-0001 | ORGA-0001 | ORGA-0001 | 7b14de08 |
| ORGA-0002 | ORGA-0001 | ORGA-0003 | gid://svc/77 |
| ORGA-0003 | ORGA-0001 | ORGA-0004 | CC-BY-4.0 |
| ORGA-0004 | ORGA-0001 | ORGA-0009 | ap-south-2 |
| ORGA-0005 | ORGA-0001 | ORGA-0005 | application/xml |
| ORGA-0006 | ORGA-0001 | ORGA-0010 | Name 06 |
| ORGA-0007 | ORGA-0001 | ORGA-0011 | platform-team |
| ORGA-0008 | ORGA-0001 | ORGA-0012 | Tags 08 |

The actual values assigned to these attributes are segregated into type-specific storage tables to enforce data integrity and optimize query performance. String-based attributes, categorized under miscellaneous or variable character data, store values like the checksum `c0ffee42` or the identifier reference `ref-8842`. Numerical attributes are captured in integer tables, recording metrics such as a size of `400` or a count of `6`. Temporal attributes are isolated in dedicated date tables, preserving precise timestamps like `2024-05-14` or `2024-07-16`. By routing attribute values through these specialized channels, the system guarantees that a date field cannot be corrupted by alphanumeric input, and that numerical aggregations can be executed without implicit casting overhead.

Temporal tracking is managed through a dedicated dimension for event start times, which provides both granular labels and broader categorical classifications. Each temporal dimension entry is assigned a unique identifier, such as `STAR-0001`, which maps to a human-readable label like `Event Start Time Label 01` and a high-level grouping such as `Event Start Time Category 01`. This hierarchical approach allows the system to track exactly when an event initiates while simultaneously enabling high-level reporting based on temporal categories. The relationship between the core event and its temporal context is established through a foreign key, ensuring that every recorded event is anchored to a specific point in time and its associated classification.

**dim_event_start_time**

| id | event_start_time_label | event_start_time_category |
| --- | --- | --- |
| STAR-0001 | Event Start Time Label 01 | Event Start Time Category 01 |
| STAR-0002 | Event Start Time Label 02 | Event Start Time Category 02 |
| STAR-0003 | Event Start Time Label 03 | Event Start Time Category 03 |
| STAR-0004 | Event Start Time Label 04 | Event Start Time Category 04 |
| STAR-0005 | Event Start Time Label 05 | Event Start Time Category 05 |
| STAR-0006 | Event Start Time Label 06 | Event Start Time Category 06 |

The culmination of these relational elements is captured in the central fact table, which records the measurable outcomes and state of an event. Key performance indicators, such as the `size_bytes` of a data transfer, are logged with high precision; for example, a single event might account for `895265030` bytes of data. Furthermore, versioning is strictly enforced to track the evolution of the event's state or the schema it adheres to, with records explicitly tagged with versions like `3`, `5`, or `8`. This combination of temporal anchoring, precise byte-level measurement, and explicit version control provides a comprehensive audit trail, ensuring that every aspect of the event—from its initial categorization to its final data footprint—is fully documented and traceable.

**fact_schemaorg**

| id | event_start_time_key | size_bytes | version |
| --- | --- | --- | --- |
| STAR-0001 | STAR-0005 | 895265030 | 3 |
| STAR-0002 | STAR-0003 | 114301972 | 5 |
| STAR-0003 | STAR-0001 | 338701831 | 4 |
| STAR-0004 | STAR-0001 | 998785819 | 8 |