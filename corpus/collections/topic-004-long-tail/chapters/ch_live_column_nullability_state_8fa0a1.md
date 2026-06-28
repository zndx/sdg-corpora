---
chapter_id: ch_live_column_nullability_state_8fa0a1
topic_id: 4
family: 07_long_tail
cited_terms: ['column_nullability_state', 'qualifications_framework', 'column_type_changed_from']
model: engine-refine
---

The nullability of database columns is governed by a structured metadata framework that classifies each column according to its tolerance for missing data. Columns such as `timestamp_utc` and `checksum_sha256` are marked as `REQUIRED`, meaning their presence is non-negotiable for data integrity, while `latency_ms` carries a `NOT_NULL` constraint, and other columns may be designated `OPTIONAL`. This classification is not merely descriptive; it drives downstream data quality checks, ETL validation rules, and compliance auditing. Each nullability state is identified by a stable key—`STAT-0001` through `STAT-0004`—that serves as the anchor for all associated attribute records, ensuring that nullability definitions remain traceable across the metadata catalog.

**t_column_nullability_state**

| id | column | nullability_state |
| --- | --- | --- |
| STAT-0001 | timestamp_utc | REQUIRED |
| STAT-0002 | checksum_sha256 | REQUIRED |
| STAT-0003 | latency_ms | NOT_NULL |
| STAT-0004 | timestamp_utc | OPTIONAL |
| STAT-0005 | timestamp_utc | PROVISIONAL |
| STAT-0006 | checksum_sha256 | NULLABLE |

**t_column_nullability_state_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| STAT-0001 | confidence | xsd:decimal |
| STAT-0002 | dimension_kind | xsd:string |
| STAT-0003 | method | xsd:string |
| STAT-0004 | recorded_at | xsd:dateTime |
| STAT-0005 | uncertainty | xsd:decimal |
| STAT-0006 | unit | xsd:string |
| STAT-0007 | value | xsd:decimal |
| STAT-0008 | encoding | xsd:string |

**t_column_nullability_state_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0002 | Dimension Kind 01 |
| STAT-0002 | STAT-0001 | STAT-0008 | Encoding 02 |
| STAT-0003 | STAT-0001 | STAT-0009 | intake form |
| STAT-0004 | STAT-0001 | STAT-0010 | fr |
| STAT-0005 | STAT-0001 | STAT-0003 | automated |
| STAT-0006 | STAT-0001 | STAT-0006 | ratio |
| STAT-0007 | STAT-0002 | STAT-0002 | Dimension Kind 07 |
| STAT-0008 | STAT-0002 | STAT-0008 | Encoding 08 |

Attributes attached to nullability states are typed and versioned through a dedicated attribute registry. The attribute `confidence`, typed as `xsd:decimal`, captures the degree of certainty in a nullability assessment—values such as `0.294` and `0.734` reflect low-to-moderate confidence, while `568.73` and `519.24` may represent derived quality scores or aggregated metrics. The attribute `dimension_kind`, typed as `xsd:string`, encodes categorical descriptors like `Dimension Kind 01` or `Encoding 02`, and `method` stores procedural metadata such as `intake form`. Temporal provenance is captured by `recorded_at`, typed as `xsd:dateTime`, with recorded timestamps including `2024-12-29T19:38:29` and `2023-05-04T12:31:25`. These attributes are stored in type-specialized value tables—decimal values in one table, datetime values in another, and string values in a third—each linked back to the attribute definition via `attr_id` and to the entity (the nullability state record) via `entity_id`. This EAV-style decomposition allows the schema to accommodate new attribute types without schema migrations, at the cost of query complexity.

**t_column_nullability_state_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0004 | 2024-12-29T19:38:29 |
| STAT-0002 | STAT-0002 | STAT-0004 | 2023-05-04T12:31:25 |
| STAT-0003 | STAT-0003 | STAT-0004 | 2023-11-12T04:10:53 |
| STAT-0004 | STAT-0004 | STAT-0004 | 2024-08-13T21:58:19 |
| STAT-0005 | STAT-0005 | STAT-0004 | 2023-08-07T04:27:45 |
| STAT-0006 | STAT-0006 | STAT-0004 | 2025-03-15T00:17:24 |

**t_column_nullability_state_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0001 | 0.294 |
| STAT-0002 | STAT-0001 | STAT-0005 | 568.73 |
| STAT-0003 | STAT-0001 | STAT-0007 | 519.24 |
| STAT-0004 | STAT-0002 | STAT-0001 | 0.734 |
| STAT-0005 | STAT-0002 | STAT-0005 | 854.57 |
| STAT-0006 | STAT-0002 | STAT-0007 | 958.56 |
| STAT-0007 | STAT-0003 | STAT-0001 | 0.295 |
| STAT-0008 | STAT-0003 | STAT-0005 | 90.08 |

The qualifications framework operates as a parallel governance construct, mapping professional credentials to learning outcomes and proficiency levels. Framework entries such as `Master of Science Data`, `National Vocational Qualification`, and `European Qualifications Framework` are identified by keys like `FRAM-0001` through `FRAM-0004`. Each framework articulates specific learning outcomes—`Cloud Infrastructure Deployment`, `Agile Project Management`, and `Natural Language Processing`—through a many-to-many relationship mediated by a junction table that assigns a `role` to each pairing. Roles such as `observer`, `reviewer`, and `owner` indicate the nature of the relationship: an `owner` has direct accountability for the learning outcome, while a `reviewer` or `observer` participates in validation or monitoring. This role-based linkage ensures that governance responsibilities are explicit and auditable.

**t_qualifications_framework**

| id | qualifications |
| --- | --- |
| FRAM-0001 | Master of Science Data |
| FRAM-0002 | National Vocational Qualification |
| FRAM-0003 | European Qualifications Framework |
| FRAM-0004 | Certified Public Accountant |
| FRAM-0005 | Professional Engineer License |
| FRAM-0006 | Graduate Certificate Cyber |

**t_qualifications_framework_articulates**

| id | articulates |
| --- | --- |
| FRAM-0001 | Cloud Infrastructure Deployment |
| FRAM-0002 | Agile Project Management |
| FRAM-0003 | Natural Language Processing |
| FRAM-0004 | Natural Language Processing |
| FRAM-0005 | Machine Learning Model Training |
| FRAM-0006 | Cybersecurity Threat Modeling |

**t_qualifications_framework__articulates**

| id | qualifications_id | articulates_id | role |
| --- | --- | --- | --- |
| FRAM-0001 | FRAM-0004 | FRAM-0001 | observer |
| FRAM-0002 | FRAM-0004 | FRAM-0001 | reviewer |
| FRAM-0003 | FRAM-0001 | FRAM-0003 | owner |
| FRAM-0004 | FRAM-0002 | FRAM-0005 | observer |
| FRAM-0005 | FRAM-0006 | FRAM-0004 | reviewer |
| FRAM-0006 | FRAM-0003 | FRAM-0004 | owner |
| FRAM-0007 | FRAM-0004 | FRAM-0005 | reviewer |
| FRAM-0008 | FRAM-0004 | FRAM-0005 | reviewer |

**t_qualifications_framework_specifies**

| id | specifies |
| --- | --- |
| FRAM-0001 | Advanced Practitioner |
| FRAM-0002 | EQF Level Three |
| FRAM-0003 | Advanced Practitioner |
| FRAM-0004 | NFQ Level Six |
| FRAM-0005 | Associate Degree |
| FRAM-0006 | Postgraduate Master |
| FRAM-0007 | Entry Level Technician |

Proficiency within the qualifications framework is expressed through qualification levels. A framework such as `FRAM-0001` may specify `Advanced Practitioner` or `EQF Level Three`, while `FRAM-0004` maps to `NFQ Level Six`. The relationship between frameworks and levels is itself governed by a junction table that records not only the linkage but also a `cardinality_note`—`Cardinality Note 01` through `Cardinality Note 04`—and a `role` such as `contributor` or `owner`. These cardinality notes provide additional context about the nature of the qualification-level relationship, whether it is mandatory, optional, or conditional. The separation of the qualification-level specification into its own table allows levels to be reused across multiple frameworks, supporting cross-framework comparisons and equivalency mappings.

**t_qualifications_framework__specifies**

| id | qualifications_id | specifies_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| FRAM-0001 | FRAM-0006 | FRAM-0006 | contributor | Cardinality Note 01 |
| FRAM-0002 | FRAM-0006 | FRAM-0007 | owner | Cardinality Note 02 |
| FRAM-0003 | FRAM-0002 | FRAM-0001 | owner | Cardinality Note 03 |
| FRAM-0004 | FRAM-0004 | FRAM-0005 | reviewer | Cardinality Note 04 |
| FRAM-0005 | FRAM-0003 | FRAM-0007 | contributor | Cardinality Note 05 |
| FRAM-0006 | FRAM-0002 | FRAM-0001 | reviewer | Cardinality Note 06 |
| FRAM-0007 | FRAM-0005 | FRAM-0007 | reviewer | Cardinality Note 07 |
| FRAM-0008 | FRAM-0002 | FRAM-0007 | contributor | Cardinality Note 08 |

At the intersection of nullability governance and qualifications is a fact table that tracks type changes and their associated quality metrics. Each fact record—identified by keys such as `FROM-0001` through `FROM-0004`—captures a `type_changed_from` event, linking to a dimension that provides a human-readable label (`Type Changed From Label 01`) and a category (`Type Changed From Category 01`). The fact itself carries a `confidence` value (ranging from `0.068` to `0.354`) and an `uncertainty` measure (from `404.01` to `984.09`), alongside a numeric `value` that may represent the magnitude of the change or a derived quality score. These metrics enable continuous monitoring of schema evolution, allowing data stewards to assess whether type changes are introducing risk and whether the nullability rules governing affected columns remain appropriate.

**fact_column**

| id | type_changed_from_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| FROM-0001 | FROM-0006 | 0.164 | 560.21 | 257.80 |
| FROM-0002 | FROM-0003 | 0.068 | 744.10 | 571.55 |
| FROM-0003 | FROM-0006 | 0.107 | 984.09 | 140.18 |
| FROM-0004 | FROM-0006 | 0.354 | 404.01 | 131.27 |
| FROM-0005 | FROM-0001 | 0.790 | 109.97 | 235.19 |
| FROM-0006 | FROM-0002 | 0.934 | 653.09 | 813.74 |
| FROM-0007 | FROM-0004 | 0.938 | 827.04 | 409.13 |
| FROM-0008 | FROM-0003 | 0.734 | 419.22 | 492.32 |

**dim_type_changed_from**

| id | type_changed_from_label | type_changed_from_category |
| --- | --- | --- |
| FROM-0001 | Type Changed From Label 01 | Type Changed From Category 01 |
| FROM-0002 | Type Changed From Label 02 | Type Changed From Category 02 |
| FROM-0003 | Type Changed From Label 03 | Type Changed From Category 03 |
| FROM-0004 | Type Changed From Label 04 | Type Changed From Category 04 |
| FROM-0005 | Type Changed From Label 05 | Type Changed From Category 05 |
| FROM-0006 | Type Changed From Label 06 | Type Changed From Category 06 |