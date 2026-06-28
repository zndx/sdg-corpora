---
chapter_id: ch_live_schemaorg_event_endtime_f79446
topic_id: 21
family: 07_long_tail
cited_terms: ['schemaorg_event_endtime', 'policy_with_review_cycle', 'column_tag_subclass']
model: engine-refine
---

The governance of data assets within this framework rests on a layered metadata architecture that binds policy, schema, and attribute semantics into a single coherent model. At the policy layer, the `t_policy_with_review_cycle` table anchors compliance obligations to concrete regulatory regimes—FedRAMP, NIST SP 800-53, CCPA, and SOC 2 Type II—each assigned a review cycle identifier such as TAG-0006 or TAG-0001, scoped to operational boundaries ranging from local and team to regional, and localized to languages including Japanese (ja) and French (fr). These policies are not abstract declarations; they are concretely mapped to data elements through the `t_column_tag_subclass` table, which associates column identifiers like user_id, log_level, patient_id, and sensor_reading with policy review cycles via the annotates_column foreign key, thereby establishing a traceable lineage from regulatory requirement to the specific data fields subject to governance.

**t_policy_with_review_cycle**

| id | policy | review_cycle | scope | language |
| --- | --- | --- | --- | --- |
| CYCL-0001 | FedRAMP | TAG-0006 | local | ja |
| CYCL-0002 | NIST SP 800-53 | TAG-0001 | team | ja |
| CYCL-0003 | CCPA | TAG-0004 | regional | fr |
| CYCL-0004 | SOC 2 Type II | TAG-0002 | regional | ja |
| CYCL-0005 | GDPR | TAG-0002 | global | ja |
| CYCL-0006 | FedRAMP | TAG-0007 | global | fr |
| CYCL-0007 | SOC 2 Type II | TAG-0001 | global | ja |
| CYCL-0008 | CCPA | TAG-0006 | local | ja |

**t_column_tag_subclass**

| id | column | annotates_column |
| --- | --- | --- |
| TAG-0001 | user_id | CYCL-0007 |
| TAG-0002 | log_level | CYCL-0005 |
| TAG-0003 | patient_id | CYCL-0004 |
| TAG-0004 | sensor_reading | CYCL-0004 |
| TAG-0005 | throughput_mb | CYCL-0005 |
| TAG-0006 | sensor_reading | CYCL-0004 |
| TAG-0007 | region_code | CYCL-0001 |

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

Attributes constitute the semantic bridge between policy and data, defined in `t_column_tag_subclass_attr` as pairs of attr_name and attr_type that specify both the property being measured and its datatype. The attr_name field carries human-readable identifiers such as confidence, dimension_kind, method, and recorded_at, while attr_type enforces schema discipline through XSD type annotations—xsd:decimal for numeric precision, xsd:string for categorical labels, and xsd:dateTime for temporal stamps. This separation of attribute definition from attribute value enables a flexible, extensible metadata model: new attributes can be declared without altering the underlying data schema, and existing attributes can be instantiated across multiple entities without duplication.

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

Attribute values are materialized across three specialized tables—`t_column_tag_subclass_val_decimal`, `t_column_tag_subclass_val_varchar`, and `t_column_tag_subclass_val_datetime`—each typed to its corresponding attr_type and linked to an entity through the entity_id foreign key. Decimal attributes such as confidence carry values like 0.376 and 922.76, varchar attributes encode categorical metadata including Dimension Kind 01, Encoding 02, intake form, and en, and datetime attributes record precise timestamps such as 2023-08-03T19:45:29 and 2025-05-22T05:44:38. The entity_id column in each value table references the primary key of `t_column_tag_subclass_attr`, ensuring that every value is semantically bound to its declared attribute and, by extension, to the column and policy that the attribute annotates.

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

Event end times and schema versions are tracked in the `fact_schemaorg` fact table, which records the lifecycle state of schema artifacts through size_bytes (ranging from 114,301,972 to 998,785,819 bytes), version numbers (3 through 8), and event_end_time_key references that point to the `dim_event_end_time` dimension table. This dimension table provides the human-readable event_end_time_label values—Event End Time Label 01 through Event End Time Label 04—alongside event_end_time_category designations such as Event End Time Category 01 through Event End Time Category 04, enabling temporal and categorical classification of schema events. The identifier column (id) serves as the primary key across all tables, with values like ENDT-0001 and CYCL-0001 providing a consistent naming convention that distinguishes event-time entities from policy and tag entities.

**fact_schemaorg**

| id | event_end_time_key | size_bytes | version |
| --- | --- | --- | --- |
| ENDT-0001 | ENDT-0004 | 895265030 | 3 |
| ENDT-0002 | ENDT-0002 | 114301972 | 5 |
| ENDT-0003 | ENDT-0007 | 338701831 | 4 |
| ENDT-0004 | ENDT-0007 | 998785819 | 8 |

**dim_event_end_time**

| id | event_end_time_label | event_end_time_category |
| --- | --- | --- |
| ENDT-0001 | Event End Time Label 01 | Event End Time Category 01 |
| ENDT-0002 | Event End Time Label 02 | Event End Time Category 02 |
| ENDT-0003 | Event End Time Label 03 | Event End Time Category 03 |
| ENDT-0004 | Event End Time Label 04 | Event End Time Category 04 |
| ENDT-0005 | Event End Time Label 05 | Event End Time Category 05 |
| ENDT-0006 | Event End Time Label 06 | Event End Time Category 06 |
| ENDT-0007 | Event End Time Label 07 | Event End Time Category 07 |

The foreign-key relationships between these tables form a directed graph of governance traceability: policies in `t_policy_with_review_cycle` are annotated to columns via `t_column_tag_subclass`, which in turn hosts attributes defined in `t_column_tag_subclass_attr` and instantiated with typed values across the three value tables. Schema facts in `fact_schemaorg` reference event end times through `dim_event_end_time`, creating a parallel lineage that tracks the temporal evolution of schema artifacts. Together, these relationships ensure that every data element can be traced to its governing policy, its attribute semantics, its version history, and its event timeline—a structural requirement for compliance auditing, impact analysis, and data quality assurance in regulated environments.