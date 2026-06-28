---
chapter_id: ch_live_artifact_not_revoked_f7dc11
topic_id: 21
family: 07_long_tail
cited_terms: ['artifact_not_revoked', 'column_tag_subclass', 'schemaorg_person_birthplace']
model: engine-refine
---

Within any structured metadata registry, the identifier serves as the immutable anchor of an artifact's existence, a stable reference point against which all subsequent provenance claims are measured. An artifact bearing the identifier REVO-0001, for instance, may correspond to an audit-log-sept or, in another context, a schema-def-current, yet the identifier itself remains the sole invariant across the artifact's lifecycle. This separation of identity from mutable content is fundamental: the identifier does not describe what the artifact is, only that it is. When an artifact is not revoked, its continued presence in the registry signals that its provenance chain remains intact and auditable, a distinction that carries particular weight in regulated environments where the provenance of compliance-report-x or dataset-sanitized must be demonstrably unbroken.

**t_artifact_not_revoked**

| id | artifact | artifact_2 |
| --- | --- | --- |
| REVO-0001 | audit-log-sept | backup-manifest-9 |
| REVO-0002 | compliance-report-x | inference-pipeline-3 |
| REVO-0003 | schema-def-current | backup-manifest-9 |
| REVO-0004 | dataset-sanitized | runtime-env-prod |
| REVO-0005 | audit-log-sept | backup-manifest-9 |
| REVO-0006 | compliance-report-x | staging-logs-v2 |

**t_artifact_not_revoked_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| REVO-0001 | checksum | xsd:string |
| REVO-0002 | created_date | xsd:date |
| REVO-0003 | identifier | cco:DesignativeICE |
| REVO-0004 | license | xsd:string |
| REVO-0005 | mime_type | xsd:string |
| REVO-0006 | size_bytes | xsd:long |
| REVO-0007 | uri | xsd:string |
| REVO-0008 | version | xsd:integer |

**t_artifact_not_revoked_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REVO-0001 | REVO-0001 | REVO-0002 | 2024-01-18 |
| REVO-0002 | REVO-0002 | REVO-0002 | 2023-09-26 |
| REVO-0003 | REVO-0003 | REVO-0002 | 2023-01-26 |
| REVO-0004 | REVO-0004 | REVO-0002 | 2024-08-03 |
| REVO-0005 | REVO-0005 | REVO-0002 | 2024-04-14 |
| REVO-0006 | REVO-0006 | REVO-0002 | 2023-07-20 |

**t_artifact_not_revoked_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REVO-0001 | REVO-0001 | REVO-0006 | 140 |
| REVO-0002 | REVO-0001 | REVO-0008 | 2 |
| REVO-0003 | REVO-0002 | REVO-0006 | 115 |
| REVO-0004 | REVO-0002 | REVO-0008 | 2 |
| REVO-0005 | REVO-0003 | REVO-0006 | 293 |
| REVO-0006 | REVO-0003 | REVO-0008 | 12 |
| REVO-0007 | REVO-0004 | REVO-0006 | 361 |
| REVO-0008 | REVO-0004 | REVO-0008 | 1 |

**t_artifact_not_revoked_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REVO-0001 | REVO-0001 | REVO-0001 | c0ffee42 |
| REVO-0002 | REVO-0001 | REVO-0003 | ref-8842 |
| REVO-0003 | REVO-0001 | REVO-0004 | Apache-2.0 |
| REVO-0004 | REVO-0001 | REVO-0009 | rack-7 |
| REVO-0005 | REVO-0001 | REVO-0005 | text/plain |
| REVO-0006 | REVO-0001 | REVO-0010 | Name 06 |
| REVO-0007 | REVO-0001 | REVO-0011 | analytics |
| REVO-0008 | REVO-0001 | REVO-0012 | Tags 08 |

Attributes and their types constitute the descriptive layer that transforms an identifier from a bare key into a meaningful datum. Each attribute carries a name—checksum, created_date, license, confidence—that specifies the nature of the information it conveys, while its type, drawn from a schema vocabulary such as xsd:string, xsd:date, cco:DesignativeICE, or xsd:dateTime, enforces structural discipline on the values that populate it. The type system is not merely syntactic; it is semantic. A value of Apache-2.0 stored under an attribute typed as xsd:string is not interchangeable with a decimal value of 0.376 stored under an attribute typed as xsd:decimal, even though both reside in the same value repository. The type governs validation, comparison, and the very possibility of aggregation. In the column-tagging subsystem, attributes such as dimension_kind and recorded_at are similarly typed, with recorded_at carrying the xsd:dateTime type to capture temporal precision down to the second, as in 2023-08-03T19:45:29.

**t_column_tag_subclass**

| id | column | annotates_column |
| --- | --- | --- |
| TAG-0001 | user_id | instrument_measurement |
| TAG-0002 | log_level | clinical_subject |
| TAG-0003 | patient_id | clinical_subject |
| TAG-0004 | sensor_reading | geographic_zone |
| TAG-0005 | throughput_mb | geographic_zone |
| TAG-0006 | sensor_reading | bandwidth_utilization |
| TAG-0007 | region_code | coordinate_latitude |

**t_column_tag_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| TAG-0001 | confidence | xsd:decimal |
| TAG-0002 | dimension_kind | xsd:string |
| TAG-0003 | method | xsd:string |
| TAG-0004 | recorded_at | xsd:dateTime |
| TAG-0005 | uncertainty | xsd:decimal |
| TAG-0006 | unit | xsd:string |
| TAG-0007 | value | xsd:decimal |
| TAG-0008 | encoding | xsd:string |

**t_column_tag_subclass_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TAG-0001 | TAG-0001 | TAG-0004 | 2023-08-03T19:45:29 |
| TAG-0002 | TAG-0002 | TAG-0004 | 2025-03-24T11:46:10 |
| TAG-0003 | TAG-0003 | TAG-0004 | 2025-05-22T05:44:38 |
| TAG-0004 | TAG-0004 | TAG-0004 | 2025-01-14T19:12:47 |
| TAG-0005 | TAG-0005 | TAG-0004 | 2024-02-24T06:52:57 |
| TAG-0006 | TAG-0006 | TAG-0004 | 2024-10-16T08:04:03 |
| TAG-0007 | TAG-0007 | TAG-0004 | 2025-02-04T08:16:45 |

**t_column_tag_subclass_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TAG-0001 | TAG-0001 | TAG-0001 | 0.376 |
| TAG-0002 | TAG-0001 | TAG-0005 | 922.76 |
| TAG-0003 | TAG-0001 | TAG-0007 | 942.47 |
| TAG-0004 | TAG-0002 | TAG-0001 | 0.809 |
| TAG-0005 | TAG-0002 | TAG-0005 | 398.44 |
| TAG-0006 | TAG-0002 | TAG-0007 | 718.52 |
| TAG-0007 | TAG-0003 | TAG-0001 | 0.172 |
| TAG-0008 | TAG-0003 | TAG-0005 | 254.23 |

The value tables themselves are partitioned by type—varchar, date, integer, decimal, datetime—each serving as a typed store for the heterogeneous data that attributes describe. This partitioning is a practical response to the reality that metadata is not homogeneous: the checksum c0ffee42 and the license Apache-2.0 are both strings but serve fundamentally different purposes, while the integer 140 and the decimal 922.76 occupy different positions on the numeric spectrum. The entity_id column in each value table links a specific value back to the artifact or tag it describes, creating a many-to-many relationship between entities and their attributes. An artifact identified as REVO-0001 may carry a created_date of 2024-01-18 and simultaneously hold a checksum of c0ffee42, with each value residing in its appropriate typed store and both pointing back to the same entity. This design permits an unbounded number of attributes per entity without requiring schema changes, a critical property for systems that must evolve alongside the artifacts they describe.

**t_column_tag_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TAG-0001 | TAG-0001 | TAG-0002 | Dimension Kind 01 |
| TAG-0002 | TAG-0001 | TAG-0008 | Encoding 02 |
| TAG-0003 | TAG-0001 | TAG-0009 | intake form |
| TAG-0004 | TAG-0001 | TAG-0010 | en |
| TAG-0005 | TAG-0001 | TAG-0003 | automated |
| TAG-0006 | TAG-0001 | TAG-0006 | m/s |
| TAG-0007 | TAG-0002 | TAG-0002 | Dimension Kind 07 |
| TAG-0008 | TAG-0002 | TAG-0008 | Encoding 08 |

Birthplace and category introduce a dimensional layer that situates artifacts within a broader ontological framework. The fact table for schema.org artifacts carries a birthplace_key that references a dimension table of birthplaces, each of which is labeled and categorized. A birthplace identified as BIRT-0001 carries the label Birthplace Label 01 and the category Birthplace Category 01, and an artifact with version 3 and a size of 895,265,030 bytes may trace its origin to BIRT-0006. The size_bytes field, measured in raw byte counts, provides a quantitative measure of artifact magnitude that is independent of format or compression, while the version field—taking integer values such as 3, 4, 5, or 8—encodes the iteration state of the artifact. Together, birthplace, category, size, and version form a compact descriptor set that allows an artifact to be located, compared, and filtered without requiring access to its full attribute profile.

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

The column-tagging subsystem mirrors this architecture at a finer granularity, applying the same attribute-value pattern to individual columns rather than to whole artifacts. A column such as user_id or patient_id may be annotated with a tag that carries its own attributes—confidence measured as 0.376 or 0.809, method recorded as a string, dimension_kind encoded as Dimension Kind 01. The annotates_column column establishes the relationship between a tag and the column it describes, while the tag's own attributes are stored in the same typed value tables, creating a recursive structure in which tags are themselves artifacts with attributes. This uniformity of representation—artifacts, tags, and their values all governed by the same attr, attr_type, entity, and value schema—ensures that the system's metadata model is self-consistent and extensible, capable of accommodating new attribute types and new tagging taxonomies without structural modification.