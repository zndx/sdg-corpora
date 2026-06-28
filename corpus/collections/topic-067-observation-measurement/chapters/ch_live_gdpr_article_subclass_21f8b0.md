---
chapter_id: ch_live_gdpr_article_subclass_21f8b0
topic_id: 67
family: 07_long_tail
cited_terms: ['gdpr_article_subclass', 'lineage_edge_with_confidence', 'labrun_min_one_sample']
model: engine-refine
---

Regulatory classification and laboratory data management both depend on a disciplined separation between identifiers, attributes, and their values. Every entity in the system carries a stable identifier—ARTI-0001 through ARTI-0004 for GDPR article subclasses, CONF-0001 through CONF-0004 for lineage edges, and SAMP-0001 through SAMP-0004 for lab run samples—ensuring that references remain consistent across tables and over time. These identifiers anchor the relational structure: a sample record such as SAMP-0001 belongs to lab run SEQ-EXP-99 and references input sample ARTI-0003, while a lineage edge with identifier CONF-0002 captures the relationship between ml_training_dataset_prep and data_lake_warehouse_sync with a confidence of statistical_overlap. The identifier column functions as the primary key in every table, and foreign-key columns—labeled subject, target, entity, and attr in the value tables—establish the cross-references that bind the model together.

**t_gdpr_article_subclass**

| id | gdpr |
| --- | --- |
| ARTI-0001 | Brazilian LGPD |
| ARTI-0002 | Canadian PIPEDA |
| ARTI-0003 | Brazilian LGPD |
| ARTI-0004 | Canadian PIPEDA |
| ARTI-0005 | Canadian PIPEDA |
| ARTI-0006 | General Data Protection Regulation |
| ARTI-0007 | Article 6 |
| ARTI-0008 | Swiss FADP |

**t_gdpr_article_subclass_gdpr_article**

| id | gdpr_article |
| --- | --- |
| ARTI-0001 | Australian Privacy Act |
| ARTI-0002 | Japanese APPI |
| ARTI-0003 | Brazilian LGPD |
| ARTI-0004 | Article 9 |
| ARTI-0005 | ePrivacy Directive |
| ARTI-0006 | Canadian PIPEDA |

**t_gdpr_article_subclass__gdpr_article**

| id | gdpr_id | gdpr_article_id | role |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0005 | ARTI-0005 | observer |
| ARTI-0002 | ARTI-0007 | ARTI-0005 | contributor |
| ARTI-0003 | ARTI-0007 | ARTI-0005 | observer |
| ARTI-0004 | ARTI-0004 | ARTI-0006 | owner |
| ARTI-0005 | ARTI-0001 | ARTI-0002 | owner |
| ARTI-0006 | ARTI-0004 | ARTI-0003 | reviewer |
| ARTI-0007 | ARTI-0006 | ARTI-0002 | observer |
| ARTI-0008 | ARTI-0005 | ARTI-0006 | contributor |

**t_lineage_edge_with_confidence**

| id | lineage | confidence | recorded_at | unit |
| --- | --- | --- | --- | --- |
| CONF-0001 | ml_training_dataset_prep | partial_match | 2024-07-21T21:36:51 | deg_C |
| CONF-0002 | data_lake_warehouse_sync | statistical_overlap | 2025-03-12T13:46:59 | mg/L |
| CONF-0003 | data_lake_warehouse_sync | 95_percent | 2023-02-17T19:37:00 | ratio |
| CONF-0004 | data_lake_warehouse_sync | 95_percent | 2024-01-06T01:59:57 | nm |
| CONF-0005 | api_log_aggregation | partial_match | 2025-01-27T14:57:11 | deg_C |
| CONF-0006 | geospatial_raster_processing | high | 2023-11-04T09:37:36 | nm |

**t_labrun_min_one_sample**

| id | labrun | input_sample |
| --- | --- | --- |
| SAMP-0001 | SEQ-EXP-99 | ARTI-0003 |
| SAMP-0002 | PROTOCOL-V3 | ARTI-0008 |
| SAMP-0003 | CEL-SEQR-112 | ARTI-0003 |
| SAMP-0004 | CEL-SEQR-112 | ARTI-0007 |
| SAMP-0005 | PCR-CYCLE-44 | ARTI-0001 |
| SAMP-0006 | METAB-ASSAY-Q2 | ARTI-0007 |

**t_labrun_min_one_sample_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SAMP-0001 | duration_seconds | xsd:decimal |
| SAMP-0002 | end_time | xsd:dateTime |
| SAMP-0003 | exit_code | xsd:integer |
| SAMP-0004 | host_name | xsd:string |
| SAMP-0005 | log_level | xsd:string |
| SAMP-0006 | phase | xsd:string |
| SAMP-0007 | retry_count | xsd:integer |
| SAMP-0008 | scheduled_at | xsd:dateTime |

**t_labrun_min_one_sample_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SAMP-0001 | SAMP-0001 | SAMP-0003 | 230 |
| SAMP-0002 | SAMP-0001 | SAMP-0007 | 435 |
| SAMP-0003 | SAMP-0002 | SAMP-0003 | 670 |
| SAMP-0004 | SAMP-0002 | SAMP-0007 | 129 |
| SAMP-0005 | SAMP-0003 | SAMP-0003 | 152 |
| SAMP-0006 | SAMP-0003 | SAMP-0007 | 382 |
| SAMP-0007 | SAMP-0004 | SAMP-0003 | 442 |
| SAMP-0008 | SAMP-0004 | SAMP-0007 | 477 |

Attributes and their types form the descriptive layer that gives meaning to each entity. The attribute definition table maps attribute identifiers to human-readable names and XML Schema types: duration_seconds is typed as xsd:decimal, end_time as xsd:dateTime, exit_code as xsd:integer, and host_name as xsd:string. This type information is not merely documentation; it governs how values are stored and validated across four separate value tables, each dedicated to a single data type. The datetime values table holds entries such as 2024-08-01T16:02:07 for entity SAMP-0001, the decimal values table stores 4946.17 for entity SAMP-0002, the integer values table records 670 for entity SAMP-0002, and the varchar values table captures host_name edge-03 and status values like closeout and complete. This type-disaggregated design ensures that each value column is homogeneous, simplifying query execution and enforcing schema-level correctness without requiring runtime type coercion.

The entity-attribute-value pattern used across the four value tables decouples attribute definitions from their concrete values, allowing each sample to carry an arbitrary set of properties without schema modification. Entity_id references the sample record, attr_id references the attribute definition, and value—labeled misc in the schema—holds the actual datum. A single sample such as SAMP-0001 can thus accumulate a decimal value of 2021.10, a datetime of 2024-08-01T16:02:07, an integer of 230, and a varchar string edge-03, each stored in its appropriate type-specific table and unified through the shared entity_id and attr_id pairings. This approach is particularly suited to laboratory environments where different experiments require different measurement sets, and to regulatory frameworks where article subclasses may carry varying sets of obligations.

**t_labrun_min_one_sample_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SAMP-0001 | SAMP-0001 | SAMP-0002 | 2024-08-01T16:02:07 |
| SAMP-0002 | SAMP-0001 | SAMP-0008 | 2024-02-12T19:03:44 |
| SAMP-0003 | SAMP-0001 | SAMP-0009 | 2023-01-19T08:28:14 |
| SAMP-0004 | SAMP-0002 | SAMP-0002 | 2024-05-12T21:48:01 |
| SAMP-0005 | SAMP-0002 | SAMP-0008 | 2023-12-29T06:52:07 |
| SAMP-0006 | SAMP-0002 | SAMP-0009 | 2023-05-30T11:26:58 |
| SAMP-0007 | SAMP-0003 | SAMP-0002 | 2023-02-24T06:29:16 |
| SAMP-0008 | SAMP-0003 | SAMP-0008 | 2025-01-26T00:06:38 |

**t_labrun_min_one_sample_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SAMP-0001 | SAMP-0001 | SAMP-0001 | 2021.10 |
| SAMP-0002 | SAMP-0002 | SAMP-0001 | 4946.17 |
| SAMP-0003 | SAMP-0003 | SAMP-0001 | 5150.87 |
| SAMP-0004 | SAMP-0004 | SAMP-0001 | 3275.26 |
| SAMP-0005 | SAMP-0005 | SAMP-0001 | 3679.38 |
| SAMP-0006 | SAMP-0006 | SAMP-0001 | 2520.77 |

**t_labrun_min_one_sample_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SAMP-0001 | SAMP-0001 | SAMP-0004 | edge-03 |
| SAMP-0002 | SAMP-0001 | SAMP-0005 | Log Level 02 |
| SAMP-0003 | SAMP-0001 | SAMP-0006 | closeout |
| SAMP-0004 | SAMP-0001 | SAMP-0010 | complete |
| SAMP-0005 | SAMP-0001 | SAMP-0011 | Triggered By 05 |
| SAMP-0006 | SAMP-0002 | SAMP-0004 | gw-12 |
| SAMP-0007 | SAMP-0002 | SAMP-0005 | Log Level 07 |
| SAMP-0008 | SAMP-0002 | SAMP-0006 | execution |

Temporal provenance and measurement units provide the contextual metadata necessary for auditability. The lineage edge table records when each relationship was captured through the recorded_at column, with timestamps such as 2023-02-17T19:37:00 for the lineage edge CONF-0003 and 2025-03-12T13:46:59 for CONF-0002, establishing a chronological trail of data lineage assertions. The unit column specifies the physical or abstract measurement scale for each lineage edge: deg_C and mg/L for temperature and concentration measurements, ratio for dimensionless proportions, and nm for wavelength. These units are essential for downstream validation, ensuring that confidence scores such as 95_percent and partial_match are interpreted in the correct measurement context.

Role-based relationships govern how entities interact within the regulatory classification model. The junction table linking GDPR article subclasses to their parent articles assigns each pairing a role—observer, contributor, or owner—that describes the nature of the relationship. For instance, the subclass ARTI-0007 is linked to article ARTI-0005 with the role observer, while ARTI-0004 carries the role owner in its relationship to ARTI-0006. This role column, combined with the subject and target foreign keys, creates a directed, typed graph of regulatory dependencies that can be traversed to determine which articles derive from which sources and with what degree of authority. The subject column identifies the originating article subclass, the target column identifies the referenced article, and the role column qualifies the relationship, enabling fine-grained provenance tracking across regulatory frameworks such as Brazilian LGPD, Canadian PIPEDA, Australian Privacy Act, and Japanese APPI.