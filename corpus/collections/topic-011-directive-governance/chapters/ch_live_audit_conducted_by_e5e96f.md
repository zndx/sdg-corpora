---
chapter_id: ch_live_audit_conducted_by_e5e96f
topic_id: 11
family: 03_directive_governance
cited_terms: ['audit_conducted_by', 'schemaorg_person_birthplace', 'labrun_subclass']
model: engine-refine
---

Attributes and their associated types constitute the fundamental mechanism by which heterogeneous operational data is organized within the registry. An attribute represents a named property of an entity—such as duration_seconds, end_time, exit_code, or host_name—while the attribute type specifies the semantic and structural constraints governing its value, expressed in XSD datatypes including xsd:decimal, xsd:dateTime, xsd:integer, and xsd:string. This separation of attribute definition from value storage enables the system to accommodate diverse data kinds without rigid schema constraints. For instance, the duration of a Cloud Infrastructure Review is captured as a decimal value of 1980.42, whereas the same audit's completion timestamp is recorded as 2023-06-07T00:47:02, and its exit status as the integer 395. The same attribute vocabulary recurs across distinct operational domains: laboratory runs such as CellCulture-Exp12 and FlowCyt-Panel9 employ the identical set of attribute names and types, ensuring cross-domain comparability while preserving contextual independence.

Entities serve as the primary anchors of all attribute-value relationships, each assigned a unique identifier that functions as the join key across the entire value storage layer. An entity might represent a specific audit engagement—identified as COND-0001 for a SOC2 Compliance Review—or a laboratory experiment such as LABR-0001 corresponding to CellCulture-Exp12. The entity identifier appears in every value row, establishing the provenance of each measurement, timestamp, or status code. This design permits a single entity to accumulate an arbitrary number of attributes across multiple typed value tables: the entity COND-0001, for example, carries a decimal duration of 1980.42, a datetime of 2023-06-07T00:47:02, an integer exit code of 395, and a varchar hostname of node-a01, each stored in its respective typed table and unified through the shared entity identifier.

**t_audit_conducted_by**

| id | audit |
| --- | --- |
| COND-0001 | Cloud Infrastructure Review |
| COND-0002 | SOC2 Compliance Review |
| COND-0003 | Lab Safety Inspection |
| COND-0004 | Data Retention Policy |
| COND-0005 | Legacy Migration Check |
| COND-0006 | SOC2 Compliance Review |

**t_audit_conducted_by_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| COND-0001 | duration_seconds | xsd:decimal |
| COND-0002 | end_time | xsd:dateTime |
| COND-0003 | exit_code | xsd:integer |
| COND-0004 | host_name | xsd:string |
| COND-0005 | log_level | xsd:string |
| COND-0006 | phase | xsd:string |
| COND-0007 | retry_count | xsd:integer |
| COND-0008 | scheduled_at | xsd:dateTime |

**t_audit_conducted_by_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COND-0001 | COND-0001 | COND-0002 | 2023-06-07T00:47:02 |
| COND-0002 | COND-0001 | COND-0008 | 2025-06-08T04:54:48 |
| COND-0003 | COND-0001 | COND-0009 | 2023-02-14T08:05:22 |
| COND-0004 | COND-0002 | COND-0002 | 2023-03-04T06:34:44 |
| COND-0005 | COND-0002 | COND-0008 | 2025-02-11T04:03:38 |
| COND-0006 | COND-0002 | COND-0009 | 2024-11-06T16:59:35 |
| COND-0007 | COND-0003 | COND-0002 | 2024-02-26T03:59:36 |
| COND-0008 | COND-0003 | COND-0008 | 2023-10-26T01:36:07 |

**t_audit_conducted_by_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COND-0001 | COND-0001 | COND-0001 | 1980.42 |
| COND-0002 | COND-0002 | COND-0001 | 6184.62 |
| COND-0003 | COND-0003 | COND-0001 | 3332.18 |
| COND-0004 | COND-0004 | COND-0001 | 5867.45 |
| COND-0005 | COND-0005 | COND-0001 | 1263.06 |
| COND-0006 | COND-0006 | COND-0001 | 5705.65 |

**t_audit_conducted_by_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COND-0001 | COND-0001 | COND-0003 | 395 |
| COND-0002 | COND-0001 | COND-0007 | 293 |
| COND-0003 | COND-0002 | COND-0003 | 558 |
| COND-0004 | COND-0002 | COND-0007 | 143 |
| COND-0005 | COND-0003 | COND-0003 | 950 |
| COND-0006 | COND-0003 | COND-0007 | 140 |
| COND-0007 | COND-0004 | COND-0003 | 458 |
| COND-0008 | COND-0004 | COND-0007 | 234 |

**t_audit_conducted_by_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COND-0001 | COND-0001 | COND-0004 | node-a01 |
| COND-0002 | COND-0001 | COND-0005 | Log Level 02 |
| COND-0003 | COND-0001 | COND-0006 | review |
| COND-0004 | COND-0001 | COND-0010 | superseded |
| COND-0005 | COND-0001 | COND-0011 | Triggered By 05 |
| COND-0006 | COND-0002 | COND-0004 | worker-07 |
| COND-0007 | COND-0002 | COND-0005 | Log Level 07 |
| COND-0008 | COND-0002 | COND-0006 | review |

**t_labrun_subclass**

| id | labrun | input_sample |
| --- | --- | --- |
| LABR-0001 | CellCulture-Exp12 | PlasmaCitrate-Lot4 |
| LABR-0002 | FlowCyt-Panel9 | HumanSerum-A7 |
| LABR-0003 | ELISA-Plate88 | RNAExtract-Brain |
| LABR-0004 | PCR-Run-Alpha7 | PlantRoot-Extract |
| LABR-0005 | MassSpec-MS19 | DNAFragment-450bp |
| LABR-0006 | NMR-Stand-04A | RNAExtract-Brain |
| LABR-0007 | FlowCyt-Panel9 | DNAFragment-450bp |
| LABR-0008 | RNASeq-Lib15 | HumanSerum-A7 |

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

The identifier space extends beyond entity-level references to encompass attribute-level identifiers as well, creating a two-tier addressing scheme. Each attribute definition—whether duration_seconds or host_name—receives its own identifier (such as COND-0001 for the duration attribute within the audit domain, or LABR-0001 for the same attribute within the laboratory domain), and these attribute identifiers appear in the attr_id column of every value row. This dual-identifier architecture ensures that attribute values can be resolved unambiguously even when the same attribute name recurs across different entity types, and it supports the independent evolution of attribute definitions without disrupting existing value records.

In the dimensional model governing schemaorg artifacts, the identifier concept manifests through a fact-dimension relationship that anchors categorical metadata to measurable quantities. The fact table carries identifiers such as BIRT-0001 through BIRT-0004, each linked to a birthplace dimension through the birthplace_key foreign key, and enriched with size_bytes values ranging from 114301972 to 998785819 and version numbers spanning from 3 to 8. The birthplace dimension itself is identified by its own key space and provides two descriptive columns: a birthplace_label, such as Birthplace Label 01, and a birthplace_category, such as Birthplace Category 01. This categorical layer enables aggregation and filtering of fact records by classification, while the size_bytes and version columns supply the quantitative and temporal dimensions necessary for change tracking and capacity planning.

**fact_schemaorg**

| id | birthplace_key | size_bytes | version |
| --- | --- | --- | --- |
| BIRT-0001 | BIRT-0006 | 895265030 | 3 |
| BIRT-0002 | BIRT-0002 | 114301972 | 5 |
| BIRT-0003 | BIRT-0001 | 338701831 | 4 |
| BIRT-0004 | BIRT-0005 | 998785819 | 8 |

**dim_birthplace**

| id | birthplace_label | birthplace_category |
| --- | --- | --- |
| BIRT-0001 | Birthplace Label 01 | Birthplace Category 01 |
| BIRT-0002 | Birthplace Label 02 | Birthplace Category 02 |
| BIRT-0003 | Birthplace Label 03 | Birthplace Category 03 |
| BIRT-0004 | Birthplace Label 04 | Birthplace Category 04 |
| BIRT-0005 | Birthplace Label 05 | Birthplace Category 05 |
| BIRT-0006 | Birthplace Label 06 | Birthplace Category 06 |

The misc column, appearing across all typed value tables, holds the actual data payloads—whether a datetime like 2025-06-08T04:54:48, a decimal such as 6184.62, an integer like 143, or a varchar string including node-b14, Log Level 02, review, or pending. The categorical discipline of storing values by type rather than in a single generic column preserves data integrity at the storage layer: the system enforces that a decimal attribute receives only decimal values, a datetime attribute receives only ISO 8601 timestamps, and so forth. This typed partitioning, combined with the entity-attribute-addressing scheme described above, yields a data model that is simultaneously flexible enough to accommodate evolving attribute inventories and rigorous enough to support automated validation, cross-domain querying, and audit-grade traceability.