---
chapter_id: ch_live_schemaorg_event_starttime_d9356f
topic_id: 186
family: 07_long_tail
cited_terms: ['schemaorg_event_starttime', 'process_min_one_input', 'control_under_framework']
model: engine-refine
---

In a governed data architecture, every observable object is anchored by an identifier—a unique key that distinguishes one record from all others and serves as the primary linkage point across the system. Identifiers follow a structured naming convention that encodes their domain: identifiers beginning with STAR-0001 through STAR-0004 denote schema-level records, those prefixed INPU-0001 through INPU-0004 represent process input entities, and FRAM-0001 through FRAM-0004 identify control objects within a framework. This convention enables deterministic joins between tables without ambiguity, ensuring that a reference from a fact record to a dimension, or from a control to a process input, resolves to exactly one entity. The identifier is the immutable backbone of referential integrity; it does not change across versions or migrations, and all downstream relationships—foreign keys, attribute associations, value mappings—derive their correctness from it.

**t_process_min_one_input**

| id | process | input |
| --- | --- | --- |
| INPU-0001 | Real-time stream processing | FRAM-0005 |
| INPU-0002 | Batch data ingestion | FRAM-0002 |
| INPU-0003 | ETL transformation step | FRAM-0006 |
| INPU-0004 | Feature engineering workflow | FRAM-0001 |
| INPU-0005 | Real-time stream processing | FRAM-0005 |
| INPU-0006 | Audit trail generation | FRAM-0002 |

**t_process_min_one_input_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| INPU-0001 | duration_seconds | xsd:decimal |
| INPU-0002 | end_time | xsd:dateTime |
| INPU-0003 | exit_code | xsd:integer |
| INPU-0004 | host_name | xsd:string |
| INPU-0005 | log_level | xsd:string |
| INPU-0006 | phase | xsd:string |
| INPU-0007 | retry_count | xsd:integer |
| INPU-0008 | scheduled_at | xsd:dateTime |

**t_process_min_one_input_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INPU-0001 | INPU-0001 | INPU-0002 | 2023-04-22T11:20:36 |
| INPU-0002 | INPU-0001 | INPU-0008 | 2024-10-27T08:51:57 |
| INPU-0003 | INPU-0001 | INPU-0009 | 2024-06-22T04:25:17 |
| INPU-0004 | INPU-0002 | INPU-0002 | 2023-12-06T11:11:06 |
| INPU-0005 | INPU-0002 | INPU-0008 | 2025-02-03T11:35:55 |
| INPU-0006 | INPU-0002 | INPU-0009 | 2024-12-06T22:47:35 |
| INPU-0007 | INPU-0003 | INPU-0002 | 2023-08-23T16:52:39 |
| INPU-0008 | INPU-0003 | INPU-0008 | 2024-05-09T10:22:43 |

**t_process_min_one_input_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INPU-0001 | INPU-0001 | INPU-0001 | 2164.83 |
| INPU-0002 | INPU-0002 | INPU-0001 | 4485.78 |
| INPU-0003 | INPU-0003 | INPU-0001 | 2430.62 |
| INPU-0004 | INPU-0004 | INPU-0001 | 7108.77 |
| INPU-0005 | INPU-0005 | INPU-0001 | 1824.80 |
| INPU-0006 | INPU-0006 | INPU-0001 | 4795.57 |

**t_process_min_one_input_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INPU-0001 | INPU-0001 | INPU-0003 | 682 |
| INPU-0002 | INPU-0001 | INPU-0007 | 200 |
| INPU-0003 | INPU-0002 | INPU-0003 | 365 |
| INPU-0004 | INPU-0002 | INPU-0007 | 357 |
| INPU-0005 | INPU-0003 | INPU-0003 | 339 |
| INPU-0006 | INPU-0003 | INPU-0007 | 252 |
| INPU-0007 | INPU-0004 | INPU-0003 | 834 |
| INPU-0008 | INPU-0004 | INPU-0007 | 166 |

**t_process_min_one_input_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INPU-0001 | INPU-0001 | INPU-0004 | ingest-21 |
| INPU-0002 | INPU-0001 | INPU-0005 | Log Level 02 |
| INPU-0003 | INPU-0001 | INPU-0006 | review |
| INPU-0004 | INPU-0001 | INPU-0010 | complete |
| INPU-0005 | INPU-0001 | INPU-0011 | Triggered By 05 |
| INPU-0006 | INPU-0002 | INPU-0004 | node-b14 |
| INPU-0007 | INPU-0002 | INPU-0005 | Log Level 07 |
| INPU-0008 | INPU-0002 | INPU-0006 | review |

**t_control_under_framework**

| id | control | under_framework |
| --- | --- | --- |
| FRAM-0001 | Network firewall | INPU-0005 |
| FRAM-0002 | Threat detection | INPU-0005 |
| FRAM-0003 | Session timeout | INPU-0002 |
| FRAM-0004 | Configuration baseline | INPU-0005 |
| FRAM-0005 | Vulnerability scan | INPU-0003 |
| FRAM-0006 | Access review | INPU-0004 |

**t_control_under_framework_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| FRAM-0001 | effective_date | xsd:date |
| FRAM-0002 | enforcement | xsd:string |
| FRAM-0003 | mandatory | xsd:boolean |
| FRAM-0004 | priority | xsd:integer |
| FRAM-0005 | review_cycle_days | xsd:integer |
| FRAM-0006 | scope | xsd:string |
| FRAM-0007 | encoding | xsd:string |
| FRAM-0008 | label_text | xsd:string |

**t_control_under_framework_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FRAM-0001 | FRAM-0001 | FRAM-0003 | true |
| FRAM-0002 | FRAM-0002 | FRAM-0003 | true |
| FRAM-0003 | FRAM-0003 | FRAM-0003 | true |
| FRAM-0004 | FRAM-0004 | FRAM-0003 | false |
| FRAM-0005 | FRAM-0005 | FRAM-0003 | false |
| FRAM-0006 | FRAM-0006 | FRAM-0003 | false |

**t_control_under_framework_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FRAM-0001 | FRAM-0001 | FRAM-0001 | 2024-07-12 |
| FRAM-0002 | FRAM-0002 | FRAM-0001 | 2023-06-25 |
| FRAM-0003 | FRAM-0003 | FRAM-0001 | 2024-04-08 |
| FRAM-0004 | FRAM-0004 | FRAM-0001 | 2023-08-28 |
| FRAM-0005 | FRAM-0005 | FRAM-0001 | 2025-04-10 |
| FRAM-0006 | FRAM-0006 | FRAM-0001 | 2024-04-05 |

**t_control_under_framework_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FRAM-0001 | FRAM-0001 | FRAM-0004 | 3 |
| FRAM-0002 | FRAM-0001 | FRAM-0005 | 104 |
| FRAM-0003 | FRAM-0002 | FRAM-0004 | 1 |
| FRAM-0004 | FRAM-0002 | FRAM-0005 | 994 |
| FRAM-0005 | FRAM-0003 | FRAM-0004 | 5 |
| FRAM-0006 | FRAM-0003 | FRAM-0005 | 358 |
| FRAM-0007 | FRAM-0004 | FRAM-0004 | 3 |
| FRAM-0008 | FRAM-0004 | FRAM-0005 | 95 |

**t_control_under_framework_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FRAM-0001 | FRAM-0001 | FRAM-0007 | Encoding 01 |
| FRAM-0002 | FRAM-0001 | FRAM-0002 | Enforcement 02 |
| FRAM-0003 | FRAM-0001 | FRAM-0008 | pre-release note |
| FRAM-0004 | FRAM-0001 | FRAM-0009 | ja |
| FRAM-0005 | FRAM-0001 | FRAM-0006 | Scope 05 |
| FRAM-0006 | FRAM-0002 | FRAM-0007 | Encoding 06 |
| FRAM-0007 | FRAM-0002 | FRAM-0002 | Enforcement 07 |
| FRAM-0008 | FRAM-0002 | FRAM-0008 | calibration record |

An entity is a discrete business object that carries properties, and those properties are expressed as attributes. Each attribute has a name and a type. The attribute name—duration_seconds, end_time, exit_code, host_name for process inputs, or effective_date, enforcement, mandatory, priority for framework controls—describes what is being measured or recorded. The attribute type constrains the kind of value that attribute can hold, expressed in XML Schema Datatypes: xsd:decimal for numeric measurements like 2164.83 or 4485.78, xsd:dateTime for temporal values such as 2023-04-22T11:20:36, xsd:integer for whole numbers like 682 or 365, xsd:string for free-form text like "ingest-21" or "Log Level 02", xsd:boolean for binary flags such as true or false, and xsd:date for calendar dates like 2024-07-12. This typed attribute model ensures that every value stored in the system is semantically valid and that queries can rely on consistent data semantics across all entities.

The actual value of an attribute is stored in a dedicated value table keyed by entity and attribute. This design separates the schema definition—the attribute name and type—from the data itself, allowing entities to carry a variable set of properties without schema migrations. For example, the process input entity INPU-0001 carries a duration_seconds value of 2164.83 in the decimal value table, an end_time of 2023-04-22T11:20:36 in the datetime value table, an exit_code of 682 in the integer value table, and a host_name of "ingest-21" in the varchar value table. Similarly, the framework control FRAM-0001 has an effective_date of 2024-07-12, a mandatory flag of true, and a priority of 3. This value-per-type partitioning is a deliberate governance choice: it enforces type discipline at the storage layer, simplifies auditing of individual attribute values, and supports compliance reporting that targets specific data types without scanning heterogeneous columns.

Categories provide a classification layer that groups entities or temporal markers into meaningful buckets. In the event start time dimension, each identifier such as STAR-0001 is associated with a category label like "Event Start Time Category 01" and a descriptive label like "Event Start Time Label 01." These categorical assignments are not merely organizational; they enable roll-up queries, compliance filtering, and policy application at the group level. A control such as "Network firewall" (FRAM-0001) can be evaluated against all controls sharing its category, and process inputs can be aggregated by the category of their associated event start time. The category column thus transforms a flat list of identifiers into a structured taxonomy that supports governance workflows.

**dim_event_start_time**

| id | event_start_time_label | event_start_time_category |
| --- | --- | --- |
| STAR-0001 | Event Start Time Label 01 | Event Start Time Category 01 |
| STAR-0002 | Event Start Time Label 02 | Event Start Time Category 02 |
| STAR-0003 | Event Start Time Label 03 | Event Start Time Category 03 |
| STAR-0004 | Event Start Time Label 04 | Event Start Time Category 04 |
| STAR-0005 | Event Start Time Label 05 | Event Start Time Category 05 |
| STAR-0006 | Event Start Time Label 06 | Event Start Time Category 06 |

Event start time serves as the temporal anchor for schema-level records, linking a fact to its dimensional context. The fact table fact_schemaorg stores an event_start_time_key that references the dimension table dim_event_start_time, creating a star-schema relationship that supports time-based analysis. The fact record STAR-0001, for instance, is associated with event start time key STAR-0001, while STAR-0002 maps to STAR-0005 and STAR-0003 and STAR-0004 both reference STAR-0001. This many-to-one mapping allows multiple schema records to share a common temporal context, which is essential for compliance reporting that requires grouping by event period. The event start time dimension itself carries both a label and a category, providing human-readable context and machine-actionable classification for each temporal marker.

**fact_schemaorg**

| id | event_start_time_key | size_bytes | version |
| --- | --- | --- | --- |
| STAR-0001 | STAR-0005 | 895265030 | 3 |
| STAR-0002 | STAR-0003 | 114301972 | 5 |
| STAR-0003 | STAR-0001 | 338701831 | 4 |
| STAR-0004 | STAR-0001 | 998785819 | 8 |

Size bytes and version complete the metadata profile of a schema record. Size bytes captures the storage footprint of a record—values such as 895265030, 114301972, 338701831, and 998785819 bytes represent the actual data volume associated with each schema entity. This metric is critical for capacity planning, cost allocation, and data retention policy enforcement. Version, an integer field with values ranging from 3 to 8 across the sample records, tracks the revision state of each record. Together, size bytes and version provide operational observability: they allow auditors to verify that a record has not been unexpectedly expanded or contracted, and they enable change detection by comparing version numbers across time. In a compliance context, these fields form the audit trail that proves data integrity and supports regulatory reporting on data lineage and storage governance.