---
chapter_id: ch_live_profiling_basic_37b6ad
topic_id: 69
family: 02_observation_measurement
cited_terms: ['profiling_basic', 'verification_concludes_with', 'schemaorg_event_location']
model: engine-refine
---

Profiling constitutes the foundational mechanism by which operational executions are instrumented, measured, and subsequently audited across the data platform. Each profiling instance is assigned a unique identifier—PROF-0001 through PROF-0004 in the current corpus—and is associated with a profiling key that groups related executions, as evidenced by the recurrence of PROF-0006 across three distinct records. The duration of each profiling run, captured in seconds, exhibits substantial variance: one execution consumed 6716.87 seconds while another completed in 1113.38 seconds, reflecting the heterogeneous nature of the workloads under observation. Exit codes further characterize the termination state of each profiling session, with values such as 725, 809, 348, and 827 indicating divergent outcomes that range from successful completion to various failure modalities. The retry count, recorded as an integer for each profiling event, reveals the resilience mechanisms in place; values of 209, 186, 303, and 264 retries demonstrate that the system routinely encounters transient conditions requiring repeated attempts before reaching a terminal state.

**fact_profiling**

| id | profiling_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| PROF-0001 | PROF-0003 | 6716.87 | 725 | 209 |
| PROF-0002 | PROF-0006 | 1113.38 | 809 | 186 |
| PROF-0003 | PROF-0006 | 2546.61 | 348 | 303 |
| PROF-0004 | PROF-0006 | 2074.93 | 827 | 264 |

The attribute taxonomy provides a structured schema for describing the properties that accompany each verification and event location entity. Attributes are defined by a name and a corresponding type, where the type conforms to an XML Schema Definition namespace—xsd:decimal for numeric measures such as duration_seconds, xsd:dateTime for temporal markers like end_time, xsd:integer for whole-number quantities including exit_code, and xsd:string for textual descriptors such as host_name. This type discipline ensures that attribute values are stored in appropriately typed value tables, each dedicated to a single XSD type. The decimal value table holds measurements like 5022.45 and 4498.56, the integer table stores counts such as 299 and 242, the datetime table records timestamps including 2023-03-17T15:14:20 and 2023-10-18T10:06:06, and the varchar table accommodates free-form strings like ingest-21, review, and complete. This separation by type enforces data integrity at the storage layer while enabling efficient query patterns for each value domain.

Categories serve as the organizational axis through which profiling entities are classified and aggregated. The dimension table for profiling categories assigns a human-readable category name—Category Name 01 through Category Name 04—to each category identifier, while the profiling dimension itself carries a profiling label such as Profiling Label 01 and a profiling_category designation like Profiling Category 01. The category_id column in the profiling dimension establishes a foreign-key relationship to the category dimension, enabling hierarchical rollups and filtered analyses. In the event location domain, a parallel categorization exists: schemaorg types such as audit-log-archive, data-lake-ingestion-job, and provenance-trace-record are mapped to event locations, with attributes like checksum (c0ffee42), created_date (2024-05-14), identifier (ref-8842), and license (Apache-2.0) providing additional contextual metadata. The entity column in the value tables acts as the join key that binds typed attribute values back to their parent entities, whether those entities are verification records or event locations.

**dim_profiling_category**

| id | category_name |
| --- | --- |
| PROF-0001 | Category Name 01 |
| PROF-0002 | Category Name 02 |
| PROF-0003 | Category Name 03 |
| PROF-0004 | Category Name 04 |
| PROF-0005 | Category Name 05 |
| PROF-0006 | Category Name 06 |
| PROF-0007 | Category Name 07 |
| PROF-0008 | Category Name 08 |

**dim_profiling**

| id | profiling_label | profiling_category | category_id |
| --- | --- | --- | --- |
| PROF-0001 | Profiling Label 01 | Profiling Category 01 | PROF-0008 |
| PROF-0002 | Profiling Label 02 | Profiling Category 02 | PROF-0001 |
| PROF-0003 | Profiling Label 03 | Profiling Category 03 | PROF-0007 |
| PROF-0004 | Profiling Label 04 | Profiling Category 04 | PROF-0005 |
| PROF-0005 | Profiling Label 05 | Profiling Category 05 | PROF-0001 |
| PROF-0006 | Profiling Label 06 | Profiling Category 06 | PROF-0003 |

**t_verification_concludes_with**

| id | verification | concludes_with |
| --- | --- | --- |
| WITH-0001 | Compliance Gateway Scan | LOCA-0004 |
| WITH-0002 | Telemetry Sync Verify | LOCA-0007 |
| WITH-0003 | Data Lineage Trace | LOCA-0002 |
| WITH-0004 | Artifact Hash Check | LOCA-0007 |
| WITH-0005 | Model Drift Assessment | LOCA-0002 |
| WITH-0006 | Artifact Hash Check | LOCA-0004 |

**t_verification_concludes_with_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| WITH-0001 | duration_seconds | xsd:decimal |
| WITH-0002 | end_time | xsd:dateTime |
| WITH-0003 | exit_code | xsd:integer |
| WITH-0004 | host_name | xsd:string |
| WITH-0005 | log_level | xsd:string |
| WITH-0006 | phase | xsd:string |
| WITH-0007 | retry_count | xsd:integer |
| WITH-0008 | scheduled_at | xsd:dateTime |

**t_verification_concludes_with_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| WITH-0001 | WITH-0001 | WITH-0002 | 2023-03-17T15:14:20 |
| WITH-0002 | WITH-0001 | WITH-0008 | 2023-03-29T16:58:23 |
| WITH-0003 | WITH-0001 | WITH-0009 | 2023-05-17T22:59:07 |
| WITH-0004 | WITH-0002 | WITH-0002 | 2023-10-18T10:06:06 |
| WITH-0005 | WITH-0002 | WITH-0008 | 2023-06-18T21:36:06 |
| WITH-0006 | WITH-0002 | WITH-0009 | 2025-01-08T20:27:31 |
| WITH-0007 | WITH-0003 | WITH-0002 | 2025-05-26T17:08:43 |
| WITH-0008 | WITH-0003 | WITH-0008 | 2023-08-15T17:46:49 |

**t_verification_concludes_with_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| WITH-0001 | WITH-0001 | WITH-0001 | 5022.45 |
| WITH-0002 | WITH-0002 | WITH-0001 | 4498.56 |
| WITH-0003 | WITH-0003 | WITH-0001 | 4177.56 |
| WITH-0004 | WITH-0004 | WITH-0001 | 216.79 |
| WITH-0005 | WITH-0005 | WITH-0001 | 4466.82 |
| WITH-0006 | WITH-0006 | WITH-0001 | 6044.91 |

**t_verification_concludes_with_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| WITH-0001 | WITH-0001 | WITH-0003 | 299 |
| WITH-0002 | WITH-0001 | WITH-0007 | 242 |
| WITH-0003 | WITH-0002 | WITH-0003 | 130 |
| WITH-0004 | WITH-0002 | WITH-0007 | 120 |
| WITH-0005 | WITH-0003 | WITH-0003 | 587 |
| WITH-0006 | WITH-0003 | WITH-0007 | 195 |
| WITH-0007 | WITH-0004 | WITH-0003 | 700 |
| WITH-0008 | WITH-0004 | WITH-0007 | 420 |

**t_verification_concludes_with_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| WITH-0001 | WITH-0001 | WITH-0004 | ingest-21 |
| WITH-0002 | WITH-0001 | WITH-0005 | Log Level 02 |
| WITH-0003 | WITH-0001 | WITH-0006 | review |
| WITH-0004 | WITH-0001 | WITH-0010 | complete |
| WITH-0005 | WITH-0001 | WITH-0011 | Triggered By 05 |
| WITH-0006 | WITH-0002 | WITH-0004 | gw-12 |
| WITH-0007 | WITH-0002 | WITH-0005 | Log Level 07 |
| WITH-0008 | WITH-0002 | WITH-0006 | execution |

**t_schemaorg_event_location**

| id | schemaorg | event_location |
| --- | --- | --- |
| LOCA-0001 | audit-log-archive | WITH-0001 |
| LOCA-0002 | data-lake-ingestion-job | WITH-0001 |
| LOCA-0003 | provenance-trace-record | WITH-0006 |
| LOCA-0004 | provenance-trace-record | WITH-0003 |
| LOCA-0005 | field-observation-dataset | WITH-0006 |
| LOCA-0006 | governance-policy-update | WITH-0006 |
| LOCA-0007 | lab-sample-tracker | WITH-0003 |
| LOCA-0008 | field-observation-dataset | WITH-0006 |

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

The verification-to-location linkage forms a critical bridge between operational checks and their geographic or logical placement within the infrastructure. Verification procedures—Compliance Gateway Scan, Telemetry Sync Verify, Data Lineage Trace, and Artifact Hash Check—are each associated with one or more event locations, identified by codes such as LOCA-0004, LOCA-0007, and LOCA-0002. The event location dimension further enriches these associations with schemaorg context and a suite of typed attributes: checksums for integrity verification, created dates for temporal provenance, designative identifiers for disambiguation, and license terms for compliance tracking. Integer attributes on event locations include values like 400 and 223, while additional varchar attributes capture strings such as ap-south-2, indicating regional deployment targets. Together, these tables construct a comprehensive audit trail that connects profiling measurements, attribute definitions, categorical classifications, and verification outcomes into a unified governance framework.