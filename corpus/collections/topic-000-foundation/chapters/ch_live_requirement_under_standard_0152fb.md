---
chapter_id: ch_live_requirement_under_standard_0152fb
topic_id: 0
family: 03_directive_governance
cited_terms: ['requirement_under_standard', 'schemaorg_place_latitude', 'verification_traces_requirement']
model: engine-refine
---

Within compliance and governance frameworks, the management of regulatory requirements demands a structured approach to attribute definition, value storage, and traceability. Requirements such as Minimum sampling rate, Quality threshold, Provenance tracking, and Access control policy are each assigned a unique identifier—STAN-0001 through STAN-0004—and mapped to the governing standard under which they fall, whether GDPR, NIST SP 800-53, IEEE 802.11, or HIPAA. This mapping establishes the foundational relationship between a control obligation and its regulatory source, enabling auditors to trace any requirement back to its origin. The attribute layer then extends this structure by defining the metadata properties that qualify each requirement: effective_date, enforcement, mandatory, and priority, each declared with a precise type such as xsd:date, xsd:string, xsd:boolean, or xsd:integer. This type discipline ensures that values stored against these attributes conform to their expected schema, preventing type mismatches that could compromise audit integrity.

**t_requirement_under_standard**

| id | requirement | under_standard |
| --- | --- | --- |
| STAN-0001 | Minimum sampling rate | GDPR |
| STAN-0002 | Quality threshold | NIST SP 800-53 |
| STAN-0003 | Provenance tracking | IEEE 802.11 |
| STAN-0004 | Access control policy | HIPAA |
| STAN-0005 | Provenance tracking | IEEE 802.11 |
| STAN-0006 | Access control policy | FAIR Principles |

**t_requirement_under_standard_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| STAN-0001 | effective_date | xsd:date |
| STAN-0002 | enforcement | xsd:string |
| STAN-0003 | mandatory | xsd:boolean |
| STAN-0004 | priority | xsd:integer |
| STAN-0005 | review_cycle_days | xsd:integer |
| STAN-0006 | scope | xsd:string |
| STAN-0007 | encoding | xsd:string |
| STAN-0008 | label_text | xsd:string |

**t_requirement_under_standard_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAN-0001 | STAN-0001 | STAN-0003 | true |
| STAN-0002 | STAN-0002 | STAN-0003 | true |
| STAN-0003 | STAN-0003 | STAN-0003 | true |
| STAN-0004 | STAN-0004 | STAN-0003 | false |
| STAN-0005 | STAN-0005 | STAN-0003 | false |
| STAN-0006 | STAN-0006 | STAN-0003 | true |

**t_requirement_under_standard_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAN-0001 | STAN-0001 | STAN-0001 | 2024-02-08 |
| STAN-0002 | STAN-0002 | STAN-0001 | 2024-03-15 |
| STAN-0003 | STAN-0003 | STAN-0001 | 2024-09-13 |
| STAN-0004 | STAN-0004 | STAN-0001 | 2023-09-30 |
| STAN-0005 | STAN-0005 | STAN-0001 | 2025-02-13 |
| STAN-0006 | STAN-0006 | STAN-0001 | 2025-01-10 |

**t_requirement_under_standard_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAN-0001 | STAN-0001 | STAN-0004 | 3 |
| STAN-0002 | STAN-0001 | STAN-0005 | 224 |
| STAN-0003 | STAN-0002 | STAN-0004 | 4 |
| STAN-0004 | STAN-0002 | STAN-0005 | 622 |
| STAN-0005 | STAN-0003 | STAN-0004 | 1 |
| STAN-0006 | STAN-0003 | STAN-0005 | 177 |
| STAN-0007 | STAN-0004 | STAN-0004 | 5 |
| STAN-0008 | STAN-0004 | STAN-0005 | 817 |

**t_requirement_under_standard_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAN-0001 | STAN-0001 | STAN-0007 | Encoding 01 |
| STAN-0002 | STAN-0001 | STAN-0002 | Enforcement 02 |
| STAN-0003 | STAN-0001 | STAN-0008 | audit excerpt |
| STAN-0004 | STAN-0001 | STAN-0009 | de |
| STAN-0005 | STAN-0001 | STAN-0006 | Scope 05 |
| STAN-0006 | STAN-0002 | STAN-0007 | Encoding 06 |
| STAN-0007 | STAN-0002 | STAN-0002 | Enforcement 07 |
| STAN-0008 | STAN-0002 | STAN-0008 | nightly summary |

The separation of attribute definitions from their concrete values is a deliberate architectural choice that supports extensibility and type safety. Boolean attributes like mandatory are stored in a dedicated value table where each row links an entity—identified by the same STAN-0001 through STAN-0004 identifiers—to a specific attribute and its boolean value, true or false. Date attributes such as effective_date follow the same pattern, with values like 2024-02-08, 2024-03-15, 2024-09-13, and 2023-09-30 recorded in a type-specific table. Integer attributes capture numeric properties with values ranging from 3 to 622, while string attributes hold textual data including Encoding 01, Enforcement 02, audit excerpt, and de. This type-dispatched storage model means that each attribute type has its own value table, and the attr_id column in each value table serves as a foreign key into the attribute definition table, ensuring referential integrity across the entire attribute-value chain.

Verification traces employ an identical structural pattern, demonstrating that the attribute-value architecture is a reusable design rather than a one-off implementation. Verification activities such as Functional Safety Assessment, Type Certification Review, ISO 9001 Compliance Audit, and FAT Factory Acceptance are each assigned identifiers REQU-0001 through REQU-0004 and enriched with attributes including duration_seconds, end_time, exit_code, and host_name, typed as xsd:decimal, xsd:dateTime, xsd:integer, and xsd:string respectively. The value tables for these traces store decimal measurements like 5386.82, 3098.08, 4624.20, and 6273.82; datetime stamps such as 2025-01-18T10:03:30, 2023-06-09T08:44:28, 2025-02-02T23:23:29, and 2024-03-08T07:44:16; integer exit codes including 954, 329, 641, and 69; and string values like gw-12, Log Level 02, execution, and complete. The entity_id column in each verification value table references the verification trace identifier, creating the same entity-to-attribute-to-value linkage found in the requirements domain.

**t_verification_traces_requirement**

| id | verification |
| --- | --- |
| REQU-0001 | Functional Safety Assessment |
| REQU-0002 | Type Certification Review |
| REQU-0003 | ISO 9001 Compliance Audit |
| REQU-0004 | FAT Factory Acceptance |
| REQU-0005 | Type Certification Review |
| REQU-0006 | Type Certification Review |

**t_verification_traces_requirement_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| REQU-0001 | duration_seconds | xsd:decimal |
| REQU-0002 | end_time | xsd:dateTime |
| REQU-0003 | exit_code | xsd:integer |
| REQU-0004 | host_name | xsd:string |
| REQU-0005 | log_level | xsd:string |
| REQU-0006 | phase | xsd:string |
| REQU-0007 | retry_count | xsd:integer |
| REQU-0008 | scheduled_at | xsd:dateTime |

**t_verification_traces_requirement_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0002 | 2025-01-18T10:03:30 |
| REQU-0002 | REQU-0001 | REQU-0008 | 2023-06-09T08:44:28 |
| REQU-0003 | REQU-0001 | REQU-0009 | 2025-02-02T23:23:29 |
| REQU-0004 | REQU-0002 | REQU-0002 | 2024-03-08T07:44:16 |
| REQU-0005 | REQU-0002 | REQU-0008 | 2024-10-17T04:41:38 |
| REQU-0006 | REQU-0002 | REQU-0009 | 2024-09-18T04:36:09 |
| REQU-0007 | REQU-0003 | REQU-0002 | 2025-05-20T16:00:41 |
| REQU-0008 | REQU-0003 | REQU-0008 | 2025-05-09T00:47:08 |

**t_verification_traces_requirement_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0001 | 5386.82 |
| REQU-0002 | REQU-0002 | REQU-0001 | 3098.08 |
| REQU-0003 | REQU-0003 | REQU-0001 | 4624.20 |
| REQU-0004 | REQU-0004 | REQU-0001 | 6273.82 |
| REQU-0005 | REQU-0005 | REQU-0001 | 833.29 |
| REQU-0006 | REQU-0006 | REQU-0001 | 3490.28 |

**t_verification_traces_requirement_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0003 | 954 |
| REQU-0002 | REQU-0001 | REQU-0007 | 329 |
| REQU-0003 | REQU-0002 | REQU-0003 | 641 |
| REQU-0004 | REQU-0002 | REQU-0007 | 69 |
| REQU-0005 | REQU-0003 | REQU-0003 | 829 |
| REQU-0006 | REQU-0003 | REQU-0007 | 87 |
| REQU-0007 | REQU-0004 | REQU-0003 | 46 |
| REQU-0008 | REQU-0004 | REQU-0007 | 237 |

**t_verification_traces_requirement_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0004 | gw-12 |
| REQU-0002 | REQU-0001 | REQU-0005 | Log Level 02 |
| REQU-0003 | REQU-0001 | REQU-0006 | execution |
| REQU-0004 | REQU-0001 | REQU-0010 | complete |
| REQU-0005 | REQU-0001 | REQU-0011 | Triggered By 05 |
| REQU-0006 | REQU-0002 | REQU-0004 | ingest-21 |
| REQU-0007 | REQU-0002 | REQU-0005 | Log Level 07 |
| REQU-0008 | REQU-0002 | REQU-0006 | execution |

The latitude dimension introduces a categorical grouping mechanism that operates independently of the requirement and verification domains. Each latitude entry carries an identifier such as LATI-0001 through LATI-0004, a human-readable label like Latitude Label 01 through Latitude Label 04, and a category designation such as Latitude Category 01 through Latitude Category 04. The fact_schemaorg table references this dimension through its latitude_key column, which points to the dim_latitude table's identifier, thereby associating each fact record with a specific latitude category. This fact table also records size_bytes values—895265030, 114301972, 338701831, and 998785819—and version numbers—3, 5, 4, and 8—providing metadata about the scale and revision state of the underlying schema objects. The version column enables change tracking across iterations, while size_bytes quantifies the storage footprint of each fact, information that is essential for capacity planning and performance optimization in large-scale compliance systems.

**fact_schemaorg**

| id | latitude_key | size_bytes | version |
| --- | --- | --- | --- |
| LATI-0001 | LATI-0002 | 895265030 | 3 |
| LATI-0002 | LATI-0003 | 114301972 | 5 |
| LATI-0003 | LATI-0002 | 338701831 | 4 |
| LATI-0004 | LATI-0005 | 998785819 | 8 |

**dim_latitude**

| id | latitude_label | latitude_category |
| --- | --- | --- |
| LATI-0001 | Latitude Label 01 | Latitude Category 01 |
| LATI-0002 | Latitude Label 02 | Latitude Category 02 |
| LATI-0003 | Latitude Label 03 | Latitude Category 03 |
| LATI-0004 | Latitude Label 04 | Latitude Category 04 |
| LATI-0005 | Latitude Label 05 | Latitude Category 05 |
| LATI-0006 | Latitude Label 06 | Latitude Category 06 |
| LATI-0007 | Latitude Label 07 | Latitude Category 07 |
| LATI-0008 | Latitude Label 08 | Latitude Category 08 |