---
chapter_id: ch_live_identifier_subclass_c4c355
topic_id: 146
family: 01_foundation
cited_terms: ['identifier_subclass', 'labrun_observed_at_site', 'agent_with_role']
model: engine-refine
---

Identifier resolution in operational systems depends on a layered architecture that separates the canonical identifier from its mutable attributes, enabling schema flexibility without structural migration. The core identifier table anchors each entity with a unique key such as `IDEN-0001` through `IDEN-0004`, a human-readable identifier value like `HANDLE-1234/5678`, `SEQ-NF2024`, or `SN-8842XJ`, and a target reference indicating what the identifier resolves to—`telemetry-stream` for the first three entries and `calibration-run` for the fourth. This tripartite structure ensures that every identifier carries both its own identity and its semantic destination, a design choice that supports traceability across distributed systems where the same logical entity may be referenced through multiple naming conventions.

**t_identifier_subclass**

| id | identifier | identifies |
| --- | --- | --- |
| IDEN-0001 | HANDLE-1234/5678 | telemetry-stream |
| IDEN-0002 | SEQ-NF2024 | telemetry-stream |
| IDEN-0003 | SN-8842XJ | telemetry-stream |
| IDEN-0004 | ACCN-GSM7829104 | calibration-run |
| IDEN-0005 | RUN-20231105 | wet-lab-sample |
| IDEN-0006 | GUID-f47ac10b | quality-control-report |
| IDEN-0007 | DOI-10.1234/abc | clinical-trial-arm |

**t_labrun_observed_at_site**

| id | labrun | occurs_in |
| --- | --- | --- |
| SITE-0001 | PCR-ALPHA | FIELD-STATION-9 |
| SITE-0002 | RUN-2023-A4 | CLEAN-ROOM-A |
| SITE-0003 | WET-LAB-44 | SECURE-VAULT-3 |
| SITE-0004 | PLATE-A12 | BUILDING-C |
| SITE-0005 | BATCH-8812 | LAB-WING-D |
| SITE-0006 | NEXTRA-GEN-03 | BENCH-12 |
| SITE-0007 | BATCH-8812 | CORE-FACILITY |

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

Attributes are defined independently of their values, establishing a schema registry that decouples type information from data storage. The attribute definition table records metadata such as `checksum_algo` and `code` typed as `xsd:string`, `format` also as `xsd:string`, and `issued_date` as `xsd:date`, each assigned its own surrogate key. Values for these attributes are then materialized in type-specific value tables: string-valued attributes like `Checksum Algo 01`, `B-12`, `Encoding 03`, and `JSON` reside in the varchar value table, while date attributes such as `2023-11-13`, `2024-05-25`, `2024-09-11`, and `2025-05-27` occupy the dedicated date value table. The entity_id column in each value table references the identifier's surrogate key, and the attr_id column points back to the attribute definition, forming a cross-referenced graph that allows any identifier to carry an arbitrary set of typed properties without requiring schema changes.

**t_identifier_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| IDEN-0001 | checksum_algo | xsd:string |
| IDEN-0002 | code | xsd:string |
| IDEN-0003 | format | xsd:string |
| IDEN-0004 | issued_date | xsd:date |
| IDEN-0005 | namespace | xsd:string |
| IDEN-0006 | encoding | xsd:string |
| IDEN-0007 | label_text | xsd:string |
| IDEN-0008 | language | xsd:string |

**t_identifier_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| IDEN-0001 | IDEN-0001 | IDEN-0004 | 2023-11-13 |
| IDEN-0002 | IDEN-0002 | IDEN-0004 | 2024-05-25 |
| IDEN-0003 | IDEN-0003 | IDEN-0004 | 2024-09-11 |
| IDEN-0004 | IDEN-0004 | IDEN-0004 | 2025-05-27 |
| IDEN-0005 | IDEN-0005 | IDEN-0004 | 2023-08-09 |
| IDEN-0006 | IDEN-0006 | IDEN-0004 | 2023-03-27 |
| IDEN-0007 | IDEN-0007 | IDEN-0004 | 2023-01-25 |

**t_identifier_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| IDEN-0001 | IDEN-0001 | IDEN-0001 | Checksum Algo 01 |
| IDEN-0002 | IDEN-0001 | IDEN-0002 | B-12 |
| IDEN-0003 | IDEN-0001 | IDEN-0006 | Encoding 03 |
| IDEN-0004 | IDEN-0001 | IDEN-0003 | JSON |
| IDEN-0005 | IDEN-0001 | IDEN-0007 | pre-release note |
| IDEN-0006 | IDEN-0001 | IDEN-0008 | es |
| IDEN-0007 | IDEN-0001 | IDEN-0005 | Namespace 07 |
| IDEN-0008 | IDEN-0002 | IDEN-0001 | Checksum Algo 08 |

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

The same attribute-value pattern extends to the lab-run-at-site domain, where the relationship between a laboratory run and its execution location is enriched with operational metadata. The association table links runs such as `PCR-ALPHA`, `RUN-2023-A4`, `WET-LAB-44`, and `PLATE-A12` to physical locations including `FIELD-STATION-9`, `CLEAN-ROOM-A`, `SECURE-VAULT-3`, and `BUILDING-C`. Attribute definitions for this relationship include `duration_seconds` as `xsd:decimal`, `end_time` as `xsd:dateTime`, `exit_code` as `xsd:integer`, and `host_name` as `xsd:string`. Values are partitioned by type: decimal durations of `3858.44`, `2622.63`, `5434.21`, and `3308.67` seconds; integer exit codes of `263`, `199`, `302`, and `29`; datetime stamps such as `2024-11-18T14:57:47` and `2025-06-11T00:43:59`; and string values including `ingest-21`, `Log Level 02`, `closeout`, and `failed`. This separation of attribute definitions from their concrete values ensures that the schema can evolve—adding a new attribute requires only a row in the definition table, not a table alteration.

Agent role management follows a star-schema pattern distinct from the attribute-value model, reflecting the more static and query-optimized nature of role metadata. The fact table records each agent instance with a surrogate identifier, a foreign key referencing the role dimension, a size in bytes ranging from `20883723` to `548859900`, and a version number spanning `1` through `12`. The dimension table provides the human-readable label and category for each role, with entries such as `Agent Role Label 01` through `Agent Role Label 04` mapped to categories `Agent Role Category 01` through `Agent Role Category 04`. The foreign key relationship between the fact and dimension tables—where `ROLE-0005` and `ROLE-0006` appear as role keys across multiple fact rows—enables aggregation and filtering by role category without denormalizing the fact table, a design that supports both analytical queries and operational lookups within a single consistent model.

**fact_agent**

| id | agent_role_key | size_bytes | version |
| --- | --- | --- | --- |
| ROLE-0001 | ROLE-0005 | 211345771 | 7 |
| ROLE-0002 | ROLE-0006 | 458577289 | 1 |
| ROLE-0003 | ROLE-0006 | 548859900 | 1 |
| ROLE-0004 | ROLE-0005 | 20883723 | 12 |
| ROLE-0005 | ROLE-0003 | 490849751 | 11 |

**dim_agent_role**

| id | agent_role_label | agent_role_category |
| --- | --- | --- |
| ROLE-0001 | Agent Role Label 01 | Agent Role Category 01 |
| ROLE-0002 | Agent Role Label 02 | Agent Role Category 02 |
| ROLE-0003 | Agent Role Label 03 | Agent Role Category 03 |
| ROLE-0004 | Agent Role Label 04 | Agent Role Category 04 |
| ROLE-0005 | Agent Role Label 05 | Agent Role Category 05 |
| ROLE-0006 | Agent Role Label 06 | Agent Role Category 06 |
| ROLE-0007 | Agent Role Label 07 | Agent Role Category 07 |