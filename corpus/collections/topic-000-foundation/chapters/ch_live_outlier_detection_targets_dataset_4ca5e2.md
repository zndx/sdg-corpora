---
chapter_id: ch_live_outlier_detection_targets_dataset_4ca5e2
topic_id: 0
family: 02_observation_measurement
cited_terms: ['outlier_detection_targets_dataset', 'profile_of_column', 'schemaorg_label_alignment']
model: engine-refine
---

An identifier serves as the immutable anchor for every record in a metadata registry, ensuring that each entity can be referenced unambiguously across fact and dimension tables. Identifiers such as DATA-0001, COLU-0002, and ALIG-0003 carry a consistent prefix-suffix convention that encodes the entity class—DATA for outlier records, COLU for profile observations, and ALIG for schema alignment entries—while the numeric suffix provides sequential uniqueness. This convention enables reliable join operations between related tables: a fact_outlier row whose outlier_key column holds the value DATA-0003 can be resolved to its corresponding dimension record in dim_outlier, and a fact_profile row with about_key set to COLU-0002 traces back to the semantic description stored in dim_about. The identifier is not merely a surrogate key; it is the primary mechanism by which distributed metadata assets are correlated across the registry.

The concept of about captures the subject matter or thematic focus of a profile observation, while category provides the classification bucket into which that subject matter falls. In the dim_about table, each identifier maps to an about_label such as About Label 01 and an about_category such as About Category 01, establishing a controlled vocabulary for semantic grouping. The fact_profile table operationalizes this relationship through its about_key column, which references the identifier of the dim_about record that describes what the profile measurement concerns. A profile observation identified as COLU-0001 carries an about_key of COLU-0002, indicating that the measurement pertains to the subject described by that dimension entry, while COLU-0004 references COLU-0006, a dimension record outside the immediate four-row sample. This two-table design separates the semantic description of what is being measured from the quantitative observation itself, enabling independent evolution of the classification taxonomy and the measurement data.

Confidence quantifies the degree of certainty associated with a profile observation, expressed as a decimal value between zero and one. The fact_profile table records confidence values ranging from 0.226 for observation COLU-0004 to 0.994 for COLU-0002, with intermediate readings of 0.299 and 0.773 for COLU-0001 and COLU-0003 respectively. These confidence scores are paired with an uncertainty measure—284.36, 557.92, 622.09, and 488.10 for the four observations—and a numeric value such as 728.94 or 380.57 that represents the actual measurement. The inverse relationship between confidence and uncertainty is evident: the observation with the highest confidence (0.994) carries an uncertainty of 557.92, while the lowest-confidence observation (0.226) has an uncertainty of 488.10, suggesting that confidence and uncertainty capture distinct dimensions of measurement quality rather than being simple complements.

Outlier records document anomalous events and their operational characteristics, with duration_seconds capturing the elapsed time of the anomaly and retry_count recording how many recovery attempts were made. The fact_outlier table contains four entries whose duration_seconds values span from 1182.39 seconds for DATA-0004 to 6466.78 seconds for DATA-0002, with intermediate durations of 3360.34 and 5282.09 seconds. The retry_count column shows substantial variation, ranging from 101 retries for DATA-0003 to 308 retries for DATA-0004, while the exit_code column records termination conditions including values 760, 4, 490, and 124. The outlier_key column introduces a self-referential relationship: DATA-0003 references itself, DATA-0001 references DATA-0003, and DATA-0002 references DATA-0001, suggesting a chain of related anomaly events or a parent-child dependency structure among outlier occurrences. The dim_outlier table provides the categorical context for these events, assigning each outlier an outlier_label such as Outlier Label 01 and an outlier_category such as Outlier Category 01.

Attributes and their types form the backbone of the schema alignment registry, where attr defines a named property and attr_type specifies its XSD datatype. The t_schemaorg_label_alignment_attr table records attribute names including confidence, dimension_kind, method, and recorded_at, each mapped to a type such as xsd:decimal, xsd:string, or xsd:dateTime. This type information governs how attribute values are stored across three value tables: t_schemaorg_label_alignment_val_decimal holds numeric values like 0.916 and 747.18, t_schemaorg_label_alignment_val_varchar stores string values such as Dimension Kind 01, Encoding 02, nightly summary, and fr, and t_schemaorg_label_alignment_val_datetime records timestamps including 2024-11-29T12:22:57 and 2024-04-08T02:25:07. The entity column in each value table references the identifier of the alignment record to which the attribute value belongs, enabling a single alignment entry like ALIG-0001 to carry multiple typed attributes—decimal values 0.916 and 963.37, string values Dimension Kind 01 and Encoding 02, and a datetime value 2024-11-29T12:22:57—all linked through the same entity_id.

**t_schemaorg_label_alignment**

| id | schemaorg | aligned_to_schema_org_label |
| --- | --- | --- |
| ALIG-0001 | sku_code | sku_code |
| ALIG-0002 | org_id | sku_code |
| ALIG-0003 | data_asset_name | course_title |
| ALIG-0004 | data_asset_name | Product |
| ALIG-0005 | sku_code | sku_code |
| ALIG-0006 | work_title | Dataset |
| ALIG-0007 | subject_person | Dataset |
| ALIG-0008 | course_title | subject_person |

**t_schemaorg_label_alignment_attr**

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

**t_schemaorg_label_alignment_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ALIG-0001 | ALIG-0001 | ALIG-0004 | 2024-11-29T12:22:57 |
| ALIG-0002 | ALIG-0002 | ALIG-0004 | 2024-10-21T02:32:32 |
| ALIG-0003 | ALIG-0003 | ALIG-0004 | 2024-04-16T22:29:51 |
| ALIG-0004 | ALIG-0004 | ALIG-0004 | 2024-04-08T02:25:07 |
| ALIG-0005 | ALIG-0005 | ALIG-0004 | 2024-04-01T00:20:16 |
| ALIG-0006 | ALIG-0006 | ALIG-0004 | 2024-06-23T20:04:43 |
| ALIG-0007 | ALIG-0007 | ALIG-0004 | 2025-03-29T09:58:30 |
| ALIG-0008 | ALIG-0008 | ALIG-0004 | 2024-10-23T02:04:00 |

**t_schemaorg_label_alignment_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ALIG-0001 | ALIG-0001 | ALIG-0001 | 0.916 |
| ALIG-0002 | ALIG-0001 | ALIG-0005 | 747.18 |
| ALIG-0003 | ALIG-0001 | ALIG-0007 | 963.37 |
| ALIG-0004 | ALIG-0002 | ALIG-0001 | 0.264 |
| ALIG-0005 | ALIG-0002 | ALIG-0005 | 721.79 |
| ALIG-0006 | ALIG-0002 | ALIG-0007 | 736.70 |
| ALIG-0007 | ALIG-0003 | ALIG-0001 | 0.758 |
| ALIG-0008 | ALIG-0003 | ALIG-0005 | 440.87 |

**t_schemaorg_label_alignment_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ALIG-0001 | ALIG-0001 | ALIG-0002 | Dimension Kind 01 |
| ALIG-0002 | ALIG-0001 | ALIG-0008 | Encoding 02 |
| ALIG-0003 | ALIG-0001 | ALIG-0009 | nightly summary |
| ALIG-0004 | ALIG-0001 | ALIG-0010 | fr |
| ALIG-0005 | ALIG-0001 | ALIG-0003 | automated |
| ALIG-0006 | ALIG-0001 | ALIG-0006 | count |
| ALIG-0007 | ALIG-0002 | ALIG-0002 | Dimension Kind 07 |
| ALIG-0008 | ALIG-0002 | ALIG-0008 | Encoding 08 |

The misc column serves as a generic value container across multiple tables, accommodating heterogeneous data that does not fit into the primary structured columns. In fact_profile, misc holds the measured value of a profile observation; in dim_outlier and dim_about, it stores label strings such as Outlier Label 03 and About Label 02; and in the schema alignment value tables, it captures the actual attribute values regardless of type. The exit column in fact_outlier records the exit code of an anomalous process, with values like 760 and 124 indicating specific termination conditions. Together, these columns—about, attr, attr_type, category, confidence, duration_seconds, entity, exit, identifier, misc, outlier, and retry_count—constitute a comprehensive metadata vocabulary that supports the tracking, classification, and quality assessment of data assets across their lifecycle.

**fact_outlier**

| id | outlier_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| DATA-0001 | DATA-0003 | 3360.34 | 760 | 293 |
| DATA-0002 | DATA-0001 | 6466.78 | 4 | 225 |
| DATA-0003 | DATA-0002 | 5282.09 | 490 | 101 |
| DATA-0004 | DATA-0003 | 1182.39 | 124 | 308 |
| DATA-0005 | DATA-0002 | 3041.72 | 808 | 59 |
| DATA-0006 | DATA-0005 | 3852.38 | 619 | 489 |
| DATA-0007 | DATA-0003 | 1453.07 | 682 | 1 |

**dim_outlier**

| id | outlier_label | outlier_category |
| --- | --- | --- |
| DATA-0001 | Outlier Label 01 | Outlier Category 01 |
| DATA-0002 | Outlier Label 02 | Outlier Category 02 |
| DATA-0003 | Outlier Label 03 | Outlier Category 03 |
| DATA-0004 | Outlier Label 04 | Outlier Category 04 |
| DATA-0005 | Outlier Label 05 | Outlier Category 05 |
| DATA-0006 | Outlier Label 06 | Outlier Category 06 |

**fact_profile**

| id | about_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| COLU-0001 | COLU-0002 | 0.299 | 284.36 | 728.94 |
| COLU-0002 | COLU-0002 | 0.994 | 557.92 | 380.57 |
| COLU-0003 | COLU-0001 | 0.773 | 622.09 | 607.36 |
| COLU-0004 | COLU-0006 | 0.226 | 488.10 | 448.09 |

**dim_about**

| id | about_label | about_category |
| --- | --- | --- |
| COLU-0001 | About Label 01 | About Category 01 |
| COLU-0002 | About Label 02 | About Category 02 |
| COLU-0003 | About Label 03 | About Category 03 |
| COLU-0004 | About Label 04 | About Category 04 |
| COLU-0005 | About Label 05 | About Category 05 |
| COLU-0006 | About Label 06 | About Category 06 |