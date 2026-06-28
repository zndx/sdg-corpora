---
chapter_id: ch_live_dbpedia_label_alignment_90c5c2
topic_id: 46
family: 07_long_tail
cited_terms: ['dbpedia_label_alignment', 'labrun_observed_at_site', 'social_enterprise_annual_income']
model: engine-refine
---

The data architecture implements an Entity-Attribute-Value (EAV) pattern for tracking provenance metadata across heterogeneous data sources, where each entity type carries its own schema of attributes and typed values stored in normalized, type-specific tables. At the core of this design, an identifier column serves as the primary key for every table, establishing a consistent reference mechanism across the alignment, observation, and income domains. The `t_dbpedia_label_alignment` table anchors the label-matching layer, mapping external DBpedia resource names such as "Mount Fuji," "Great Barrier Reef," and "International Space Station" to internal site identifiers like SITE-0001, SITE-0007, and SITE-0005. This alignment table functions as the central entity hub, with its identifier values (ALIG-0001 through ALIG-0004) referenced as foreign keys across all downstream attribute and value tables, ensuring referential integrity between the label-matching results and their associated metadata.

**t_dbpedia_label_alignment**

| id | dbpedia | aligned_to_d_bpedia_label |
| --- | --- | --- |
| ALIG-0001 | Mount Fuji | SITE-0001 |
| ALIG-0002 | Great Barrier Reef | SITE-0007 |
| ALIG-0003 | Great Barrier Reef | SITE-0006 |
| ALIG-0004 | International Space Station | SITE-0005 |
| ALIG-0005 | International Space Station | SITE-0002 |
| ALIG-0006 | Mount Fuji | SITE-0003 |

**t_dbpedia_label_alignment_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ALIG-0001 | confidence | xsd:decimal |
| ALIG-0002 | dimension_kind | xsd:string |
| ALIG-0003 | method | xsd:string |
| ALIG-0004 | recorded_at | xsd:dateTime |
| ALIG-0005 | uncertainty | xsd:decimal |
| ALIG-0006 | unit | xsd:string |
| ALIG-0007 | value | xsd:decimal |
| ALIG-0008 | encoding | xsd:string |

**t_dbpedia_label_alignment_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ALIG-0001 | ALIG-0001 | ALIG-0004 | 2024-11-30T18:47:51 |
| ALIG-0002 | ALIG-0002 | ALIG-0004 | 2023-03-19T14:45:09 |
| ALIG-0003 | ALIG-0003 | ALIG-0004 | 2023-04-29T16:40:54 |
| ALIG-0004 | ALIG-0004 | ALIG-0004 | 2025-02-04T06:16:43 |
| ALIG-0005 | ALIG-0005 | ALIG-0004 | 2025-03-19T01:28:11 |
| ALIG-0006 | ALIG-0006 | ALIG-0004 | 2024-10-31T13:56:29 |

**t_dbpedia_label_alignment_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ALIG-0001 | ALIG-0001 | ALIG-0001 | 0.452 |
| ALIG-0002 | ALIG-0001 | ALIG-0005 | 120.37 |
| ALIG-0003 | ALIG-0001 | ALIG-0007 | 479.08 |
| ALIG-0004 | ALIG-0002 | ALIG-0001 | 0.795 |
| ALIG-0005 | ALIG-0002 | ALIG-0005 | 400.65 |
| ALIG-0006 | ALIG-0002 | ALIG-0007 | 655.22 |
| ALIG-0007 | ALIG-0003 | ALIG-0001 | 0.045 |
| ALIG-0008 | ALIG-0003 | ALIG-0005 | 957.62 |

**t_dbpedia_label_alignment_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ALIG-0001 | ALIG-0001 | ALIG-0002 | Dimension Kind 01 |
| ALIG-0002 | ALIG-0001 | ALIG-0008 | Encoding 02 |
| ALIG-0003 | ALIG-0001 | ALIG-0009 | nightly summary |
| ALIG-0004 | ALIG-0001 | ALIG-0010 | fr |
| ALIG-0005 | ALIG-0001 | ALIG-0003 | hybrid |
| ALIG-0006 | ALIG-0001 | ALIG-0006 | deg_C |
| ALIG-0007 | ALIG-0002 | ALIG-0002 | Dimension Kind 07 |
| ALIG-0008 | ALIG-0002 | ALIG-0008 | Encoding 08 |

Attribute definitions are captured in dedicated schema tables—`t_dbpedia_label_alignment_attr`, `t_labrun_observed_at_site_attr`, and `t_social_enterprise_annual_income_attr`—which declare the name and data type of each property associated with an entity. These attribute tables define a consistent set of provenance columns across domains: `confidence` typed as `xsd:decimal`, `dimension_kind` as `xsd:string`, `method` as `xsd:string`, and `recorded_at` as `xsd:dateTime`. For lab run observations, the attribute schema expands to include operational metadata such as `duration_seconds` (`xsd:decimal`), `end_time` (`xsd:dateTime`), `exit_code` (`xsd:integer`), and `host_name` (`xsd:string`). The separation of attribute definitions from their values enables schema evolution without restructuring value tables, and the type declarations ensure that value insertion is validated against the expected data format.

**t_labrun_observed_at_site_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SITE-0001 | SITE-0001 | SITE-0002 | 2024-11-18T14:57:47 |
| SITE-0002 | SITE-0001 | SITE-0008 | 2025-06-11T00:43:59 |
| SITE-0003 | SITE-0001 | SITE-0009 | 2024-11-24T23:41:09 |
| SITE-0004 | SITE-0002 | SITE-0002 | 2024-09-03T12:28:15 |
| SITE-0005 | SITE-0002 | SITE-0008 | 2024-01-21T14:36:33 |
| SITE-0006 | SITE-0002 | SITE-0009 | 2024-08-02T20:19:39 |
| SITE-0007 | SITE-0003 | SITE-0002 | 2023-08-18T18:21:00 |
| SITE-0008 | SITE-0003 | SITE-0008 | 2023-03-15T08:25:39 |

**t_labrun_observed_at_site_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SITE-0001 | SITE-0001 | SITE-0001 | 3858.44 |
| SITE-0002 | SITE-0002 | SITE-0001 | 2622.63 |
| SITE-0003 | SITE-0003 | SITE-0001 | 5434.21 |
| SITE-0004 | SITE-0004 | SITE-0001 | 3308.67 |
| SITE-0005 | SITE-0005 | SITE-0001 | 138.03 |
| SITE-0006 | SITE-0006 | SITE-0001 | 5237.38 |
| SITE-0007 | SITE-0007 | SITE-0001 | 3257.93 |

**t_social_enterprise_annual_income_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INCO-0001 | INCO-0001 | INCO-0004 | 2024-11-16T11:00:06 |
| INCO-0002 | INCO-0002 | INCO-0004 | 2025-02-04T05:23:06 |
| INCO-0003 | INCO-0003 | INCO-0004 | 2023-12-18T07:36:57 |
| INCO-0004 | INCO-0004 | INCO-0004 | 2024-08-27T04:35:14 |
| INCO-0005 | INCO-0005 | INCO-0004 | 2023-06-07T02:54:49 |
| INCO-0006 | INCO-0006 | INCO-0004 | 2024-06-20T22:31:31 |

**t_social_enterprise_annual_income_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INCO-0001 | INCO-0001 | INCO-0001 | 0.063 |
| INCO-0002 | INCO-0001 | INCO-0005 | 21.38 |
| INCO-0003 | INCO-0001 | INCO-0007 | 997.65 |
| INCO-0004 | INCO-0002 | INCO-0001 | 0.705 |
| INCO-0005 | INCO-0002 | INCO-0005 | 716.05 |
| INCO-0006 | INCO-0002 | INCO-0007 | 442.00 |
| INCO-0007 | INCO-0003 | INCO-0001 | 0.150 |
| INCO-0008 | INCO-0003 | INCO-0005 | 767.65 |

Value storage is partitioned by data type into specialized tables—`_val_datetime`, `_val_decimal`, `_val_varchar`, and `_val_int`—each containing an `entity_id` foreign key that references the parent entity's identifier, an `attr_id` foreign key pointing to the attribute definition, and a `value` column holding the actual data. This type-partitioned design means that a single entity like ALIG-0001 can simultaneously carry a confidence score of 0.452 in the decimal value table, a dimension kind of "Dimension Kind 01" in the varchar table, and a recorded-at timestamp of 2024-11-30T18:47:51 in the datetime table, all linked through the same entity identifier. The same pattern applies to social enterprise income records, where INCO-0001 carries a confidence of 0.063, a dimension kind of "Dimension Kind 01," and a recorded-at timestamp of 2024-11-16T11:00:06, while the parent income table associates INCO-0001 with the enterprise name "BrightFuture Learning."

**t_social_enterprise_annual_income_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INCO-0001 | INCO-0001 | INCO-0002 | Dimension Kind 01 |
| INCO-0002 | INCO-0001 | INCO-0008 | Encoding 02 |
| INCO-0003 | INCO-0001 | INCO-0009 | change rationale |
| INCO-0004 | INCO-0001 | INCO-0010 | fr |
| INCO-0005 | INCO-0001 | INCO-0003 | automated |
| INCO-0006 | INCO-0001 | INCO-0006 | deg_C |
| INCO-0007 | INCO-0002 | INCO-0002 | Dimension Kind 07 |
| INCO-0008 | INCO-0002 | INCO-0008 | Encoding 08 |

Cross-domain relationships connect the alignment layer to operational and financial data through the site and income identifiers. The `t_labrun_observed_at_site` table bridges lab run execution records to alignment entities, mapping lab runs such as PCR-ALPHA, RUN-2023-A4, WET-LAB-44, and PLATE-A12 to alignment identifiers like ALIG-0001 and ALIG-0004. Lab run observations carry their own rich attribute set: duration values like 3858.44 and 5434.21 seconds, exit codes such as 263 and 302, host names like "ingest-21," and status indicators including "failed" and "closeout." The `t_social_enterprise_annual_income` table operates as a parallel entity type, linking enterprise names—"BrightFuture Learning," "Sustainable Harvest Fund," and "Urban Harvest Co-op"—to income identifiers that follow the same EAV pattern for provenance tracking, with confidence scores ranging from 0.063 to 0.705 and recorded-at timestamps spanning from late 2023 through early 2025.

**t_labrun_observed_at_site**

| id | labrun | occurs_in |
| --- | --- | --- |
| SITE-0001 | PCR-ALPHA | ALIG-0001 |
| SITE-0002 | RUN-2023-A4 | ALIG-0004 |
| SITE-0003 | WET-LAB-44 | ALIG-0003 |
| SITE-0004 | PLATE-A12 | ALIG-0004 |
| SITE-0005 | BATCH-8812 | ALIG-0003 |
| SITE-0006 | NEXTRA-GEN-03 | ALIG-0006 |
| SITE-0007 | BATCH-8812 | ALIG-0005 |

**t_labrun_observed_at_site_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SITE-0001 | duration_seconds | xsd:decimal |
| SITE-0002 | end_time | xsd:dateTime |
| SITE-0003 | exit_code | xsd:integer |
| SITE-0004 | host_name | xsd:string |
| SITE-0005 | log_level | xsd:string |
| SITE-0006 | phase | xsd:string |
| SITE-0007 | retry_count | xsd:integer |
| SITE-0008 | scheduled_at | xsd:dateTime |

**t_labrun_observed_at_site_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SITE-0001 | SITE-0001 | SITE-0003 | 263 |
| SITE-0002 | SITE-0001 | SITE-0007 | 199 |
| SITE-0003 | SITE-0002 | SITE-0003 | 302 |
| SITE-0004 | SITE-0002 | SITE-0007 | 29 |
| SITE-0005 | SITE-0003 | SITE-0003 | 93 |
| SITE-0006 | SITE-0003 | SITE-0007 | 209 |
| SITE-0007 | SITE-0004 | SITE-0003 | 703 |
| SITE-0008 | SITE-0004 | SITE-0007 | 313 |

**t_labrun_observed_at_site_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SITE-0001 | SITE-0001 | SITE-0004 | ingest-21 |
| SITE-0002 | SITE-0001 | SITE-0005 | Log Level 02 |
| SITE-0003 | SITE-0001 | SITE-0006 | closeout |
| SITE-0004 | SITE-0001 | SITE-0010 | failed |
| SITE-0005 | SITE-0001 | SITE-0011 | Triggered By 05 |
| SITE-0006 | SITE-0002 | SITE-0004 | gw-12 |
| SITE-0007 | SITE-0002 | SITE-0005 | Log Level 07 |
| SITE-0008 | SITE-0002 | SITE-0006 | initiation |

**t_social_enterprise_annual_income**

| id | social_enterprise_annual_income |
| --- | --- |
| INCO-0001 | BrightFuture Learning |
| INCO-0002 | Sustainable Harvest Fund |
| INCO-0003 | Urban Harvest Co-op |
| INCO-0004 | Urban Harvest Co-op |
| INCO-0005 | CleanTech Ventures |
| INCO-0006 | FairTrade Roots |

**t_social_enterprise_annual_income_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| INCO-0001 | confidence | xsd:decimal |
| INCO-0002 | dimension_kind | xsd:string |
| INCO-0003 | method | xsd:string |
| INCO-0004 | recorded_at | xsd:dateTime |
| INCO-0005 | uncertainty | xsd:decimal |
| INCO-0006 | unit | xsd:string |
| INCO-0007 | value | xsd:decimal |
| INCO-0008 | encoding | xsd:string |