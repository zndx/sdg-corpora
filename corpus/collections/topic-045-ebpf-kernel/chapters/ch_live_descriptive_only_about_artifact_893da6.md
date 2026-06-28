---
chapter_id: ch_live_descriptive_only_about_artifact_893da6
topic_id: 45
family: 07_long_tail
cited_terms: ['descriptive_only_about_artifact', 'ebpfmap_only_one_value_type', 'column_tag_at_confidence']
model: engine-refine
---

In systems where observational data must be both classified and qualified, the provenance of every measurement demands explicit tracking through a layered architecture of identifiers, categories, and confidence metrics. Each recorded observation is anchored by a unique identifier—ARTI-0001 through ARTI-0004 in the descriptive fact store—and linked to a subject entity via an about_key that resolves against a dimension table of labeled categories. The descriptive facts themselves carry dual quality signals: a confidence score ranging from 0.209 to 0.854, and an uncertainty value spanning 452.69 to 846.52, both of which govern downstream trust in the associated measurement. A value of 0.854 in the confidence column, paired with an uncertainty of 452.69, signals a relatively reliable observation, whereas a confidence of 0.209 alongside an uncertainty of 846.52 marks a measurement of questionable standing. These paired metrics enable automated filtering and weighted aggregation without requiring manual curation of every record.

**fact_descriptive**

| id | about_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| ARTI-0001 | ARTI-0005 | 0.854 | 452.69 | 646.43 |
| ARTI-0002 | ARTI-0002 | 0.209 | 846.52 | 408.39 |
| ARTI-0003 | ARTI-0002 | 0.761 | 532.60 | 850.50 |
| ARTI-0004 | ARTI-0004 | 0.480 | 663.65 | 110.19 |
| ARTI-0005 | ARTI-0006 | 0.697 | 535.73 | 322.53 |
| ARTI-0006 | ARTI-0003 | 0.238 | 734.71 | 457.41 |

**t_column_tag_at_confidence**

| id | column | tag_confidence |
| --- | --- | --- |
| CONF-0001 | instrument_serial | 0.99 |
| CONF-0002 | audit_log_id | 0.99 |
| CONF-0003 | calibration_date | 0.72 |
| CONF-0004 | instrument_serial | 0.81 |
| CONF-0005 | geospatial_ref | verified |
| CONF-0006 | sample_volume_ml | 0.99 |

**t_column_tag_at_confidence_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CONF-0001 | confidence | xsd:decimal |
| CONF-0002 | dimension_kind | xsd:string |
| CONF-0003 | method | xsd:string |
| CONF-0004 | recorded_at | xsd:dateTime |
| CONF-0005 | uncertainty | xsd:decimal |
| CONF-0006 | unit | xsd:string |
| CONF-0007 | value | xsd:decimal |
| CONF-0008 | encoding | xsd:string |

**t_column_tag_at_confidence_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONF-0001 | CONF-0001 | CONF-0004 | 2024-04-09T22:04:24 |
| CONF-0002 | CONF-0002 | CONF-0004 | 2025-04-05T07:15:37 |
| CONF-0003 | CONF-0003 | CONF-0004 | 2023-12-17T15:47:25 |
| CONF-0004 | CONF-0004 | CONF-0004 | 2024-06-11T23:21:15 |
| CONF-0005 | CONF-0005 | CONF-0004 | 2023-11-28T13:45:04 |
| CONF-0006 | CONF-0006 | CONF-0004 | 2023-05-23T02:47:56 |

**t_column_tag_at_confidence_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONF-0001 | CONF-0001 | CONF-0001 | 0.375 |
| CONF-0002 | CONF-0001 | CONF-0005 | 699.80 |
| CONF-0003 | CONF-0001 | CONF-0007 | 906.58 |
| CONF-0004 | CONF-0002 | CONF-0001 | 0.359 |
| CONF-0005 | CONF-0002 | CONF-0005 | 525.15 |
| CONF-0006 | CONF-0002 | CONF-0007 | 158.80 |
| CONF-0007 | CONF-0003 | CONF-0001 | 0.944 |
| CONF-0008 | CONF-0003 | CONF-0005 | 15.61 |

**t_column_tag_at_confidence_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONF-0001 | CONF-0001 | CONF-0002 | Dimension Kind 01 |
| CONF-0002 | CONF-0001 | CONF-0008 | Encoding 02 |
| CONF-0003 | CONF-0001 | CONF-0009 | nightly summary |
| CONF-0004 | CONF-0001 | CONF-0010 | fr |
| CONF-0005 | CONF-0001 | CONF-0003 | automated |
| CONF-0006 | CONF-0001 | CONF-0006 | kg |
| CONF-0007 | CONF-0002 | CONF-0002 | Dimension Kind 07 |
| CONF-0008 | CONF-0002 | CONF-0008 | Encoding 08 |

The categorical taxonomy operates through a parallel dimension structure, where each identifier maps to a human-readable label and a category classification. Labels such as About Label 01 through About Label 04 are grouped under categories like About Category 01 through About Category 04, forming a two-level hierarchy that supports both granular querying and broad summarization. This same categorical pattern recurs in the value type map dimension, where identifiers TYPE-0001 through TYPE-0004 resolve to labels such as Value Type Map Label 02 and categories including Value Type Map Category 02. The type map dimension serves as the classification backbone for binary artifacts—eBPF maps—whose factual records store a size_bytes field ranging from 31,105,012 to 354,373,995 bytes and a version number from 1 to 12. A map of size 208,979,093 bytes at version 3 and a map of 354,373,995 bytes at version 5 illustrate the scale variance that the type map category must accommodate.

**dim_about**

| id | about_label | about_category |
| --- | --- | --- |
| ARTI-0001 | About Label 01 | About Category 01 |
| ARTI-0002 | About Label 02 | About Category 02 |
| ARTI-0003 | About Label 03 | About Category 03 |
| ARTI-0004 | About Label 04 | About Category 04 |
| ARTI-0005 | About Label 05 | About Category 05 |
| ARTI-0006 | About Label 06 | About Category 06 |

**fact_ebpfmap**

| id | value_type_map_key | size_bytes | version |
| --- | --- | --- | --- |
| TYPE-0001 | TYPE-0002 | 208979093 | 3 |
| TYPE-0002 | TYPE-0002 | 156714508 | 6 |
| TYPE-0003 | TYPE-0002 | 31105012 | 12 |
| TYPE-0004 | TYPE-0003 | 354373995 | 5 |
| TYPE-0005 | TYPE-0002 | 866267293 | 2 |

**dim_value_type_map**

| id | value_type_map_label | value_type_map_category |
| --- | --- | --- |
| TYPE-0001 | Value Type Map Label 01 | Value Type Map Category 01 |
| TYPE-0002 | Value Type Map Label 02 | Value Type Map Category 02 |
| TYPE-0003 | Value Type Map Label 03 | Value Type Map Category 03 |
| TYPE-0004 | Value Type Map Label 04 | Value Type Map Category 04 |
| TYPE-0005 | Value Type Map Label 05 | Value Type Map Category 05 |
| TYPE-0006 | Value Type Map Label 06 | Value Type Map Category 06 |

Attribute definitions form the third structural layer, specifying both the semantic name and the XSD type of each measurable property. The attribute table records names such as confidence, dimension_kind, method, and recorded_at, each bound to a type—xsd:decimal, xsd:string, or xsd:dateTime—that determines how values are stored, validated, and compared. This type discipline is enforced through a family of value tables partitioned by data type: decimal values like 0.375 and 699.80 reside in one table, datetime stamps such as 2024-04-09T22:04:24 and 2025-04-05T07:15:37 in another, and string values including Dimension Kind 01, Encoding 02, nightly summary, and fr in a third. Each value row carries an entity_id that identifies the subject of the measurement and an attr_id that resolves to the attribute definition, ensuring that every stored value is semantically typed and traceable to its schema.

Column-level confidence scores provide an additional quality layer, assigning a tag_confidence value to each column name. The instrument_serial column receives a confidence of 0.99, the audit_log_id column also scores 0.99, while calibration_date drops to 0.72 and instrument_serial appears again at 0.81, suggesting that the same column may carry different confidence ratings in different contexts or that multiple confidence assessments exist per column. These scores govern which columns are eligible for automated processing pipelines and which require human review before integration into analytical models. The entity-attribute-value triad, combined with the categorical dimensions and confidence metadata, creates a system where every datum carries its own quality certificate, its classification, and its lineage—enabling governance frameworks to enforce data quality policies programmatically rather than through ad hoc manual intervention.