---
chapter_id: ch_live_log_with_resource_attribute_57cbee
topic_id: 181
family: 07_long_tail
cited_terms: ['log_with_resource_attribute', 'aggregation_grouped_by', 'labrun_has_operator']
model: engine-refine
---

Within the data model, every record is anchored by an identifier—a unique key that serves as the primary reference point across fact and dimension tables. In the resource attribute domain, identifiers such as ATTR-0001 through ATTR-0004 appear in both the fact table and its corresponding dimension table, enabling a star-schema join between operational measurements and descriptive metadata. The fact table records each resource attribute's size in bytes, with values ranging from 442,933,768 to 913,386,183, alongside a version number that tracks changes over time—versions 2, 6, and 7 appearing across the dataset. The dimension table enriches these identifiers with a human-readable label, such as Resource Attribute Label 01, and assigns a category like Resource Attribute Category 01, providing the organizational taxonomy needed for filtering and reporting.

**fact_log**

| id | resource_attribute_key | size_bytes | version |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0005 | 913386183 | 6 |
| ATTR-0002 | ATTR-0006 | 303816232 | 7 |
| ATTR-0003 | ATTR-0001 | 758542341 | 7 |
| ATTR-0004 | ATTR-0001 | 442933768 | 2 |

**dim_resource_attribute**

| id | resource_attribute_label | resource_attribute_category |
| --- | --- | --- |
| ATTR-0001 | Resource Attribute Label 01 | Resource Attribute Category 01 |
| ATTR-0002 | Resource Attribute Label 02 | Resource Attribute Category 02 |
| ATTR-0003 | Resource Attribute Label 03 | Resource Attribute Category 03 |
| ATTR-0004 | Resource Attribute Label 04 | Resource Attribute Category 04 |
| ATTR-0005 | Resource Attribute Label 05 | Resource Attribute Category 05 |
| ATTR-0006 | Resource Attribute Label 06 | Resource Attribute Category 06 |

**dim_operator**

| id | operator_label | operator_category |
| --- | --- | --- |
| OPER-0001 | Operator Label 01 | Operator Category 01 |
| OPER-0002 | Operator Label 02 | Operator Category 02 |
| OPER-0003 | Operator Label 03 | Operator Category 03 |
| OPER-0004 | Operator Label 04 | Operator Category 04 |
| OPER-0005 | Operator Label 05 | Operator Category 05 |
| OPER-0006 | Operator Label 06 | Operator Category 06 |
| OPER-0007 | Operator Label 07 | Operator Category 07 |

Aggregation groups introduce a parallel structure for defining how data is summarized and grouped. Each group carries an identifier—GROU-0001 through GROU-0004—and a descriptive aggregation name, including cross_department_access_log, monthly_billing_snapshot, and daily_traffic_rollup. The attributes that define these groups are catalogued separately, with each attribute assigned a name and an XSD type. For instance, the attribute named confidence carries the type xsd:decimal, while dimension_kind and method are typed as xsd:string, and recorded_at is typed as xsd:dateTime. This type discipline ensures that values stored for each attribute conform to the expected schema.

**t_aggregation_grouped_by**

| id | aggregation |
| --- | --- |
| GROU-0001 | cross_department_access_log |
| GROU-0002 | monthly_billing_snapshot |
| GROU-0003 | daily_traffic_rollup |
| GROU-0004 | monthly_billing_snapshot |
| GROU-0005 | monthly_billing_snapshot |
| GROU-0006 | regional_temperature_average |

**t_aggregation_grouped_by_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| GROU-0001 | confidence | xsd:decimal |
| GROU-0002 | dimension_kind | xsd:string |
| GROU-0003 | method | xsd:string |
| GROU-0004 | recorded_at | xsd:dateTime |
| GROU-0005 | uncertainty | xsd:decimal |
| GROU-0006 | unit | xsd:string |
| GROU-0007 | value | xsd:decimal |
| GROU-0008 | encoding | xsd:string |

**t_aggregation_grouped_by_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| GROU-0001 | GROU-0001 | GROU-0004 | 2025-01-14T14:41:10 |
| GROU-0002 | GROU-0002 | GROU-0004 | 2023-10-30T01:59:25 |
| GROU-0003 | GROU-0003 | GROU-0004 | 2023-04-12T02:41:30 |
| GROU-0004 | GROU-0004 | GROU-0004 | 2023-12-16T14:56:57 |
| GROU-0005 | GROU-0005 | GROU-0004 | 2023-04-07T15:52:42 |
| GROU-0006 | GROU-0006 | GROU-0004 | 2023-09-07T01:41:33 |

**t_aggregation_grouped_by_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| GROU-0001 | GROU-0001 | GROU-0001 | 0.676 |
| GROU-0002 | GROU-0001 | GROU-0005 | 770.46 |
| GROU-0003 | GROU-0001 | GROU-0007 | 107.12 |
| GROU-0004 | GROU-0002 | GROU-0001 | 0.437 |
| GROU-0005 | GROU-0002 | GROU-0005 | 595.38 |
| GROU-0006 | GROU-0002 | GROU-0007 | 23.10 |
| GROU-0007 | GROU-0003 | GROU-0001 | 0.551 |
| GROU-0008 | GROU-0003 | GROU-0005 | 567.02 |

Values for aggregation entities are distributed across three specialized value tables, each corresponding to a data type. Decimal values such as 0.676, 770.46, and 107.12 are stored in the decimal table, where the entity_id links back to the aggregation group and the attr_id references the attribute definition. String values like Dimension Kind 01, Encoding 02, calibration record, and en reside in the varchar table, again connected through entity and attribute identifiers. Datetime values—2025-01-14T14:41:10, 2023-10-30T01:59:25, 2023-04-12T02:41:30, and 2023-12-16T14:56:57—are stored in the datetime table, all referencing the same attribute GROU-0004 across different entities. This denormalized value storage pattern avoids wide tables while preserving type safety.

**t_aggregation_grouped_by_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| GROU-0001 | GROU-0001 | GROU-0002 | Dimension Kind 01 |
| GROU-0002 | GROU-0001 | GROU-0008 | Encoding 02 |
| GROU-0003 | GROU-0001 | GROU-0009 | calibration record |
| GROU-0004 | GROU-0001 | GROU-0010 | en |
| GROU-0005 | GROU-0001 | GROU-0003 | manual |
| GROU-0006 | GROU-0001 | GROU-0006 | ms |
| GROU-0007 | GROU-0002 | GROU-0002 | Dimension Kind 07 |
| GROU-0008 | GROU-0002 | GROU-0008 | Encoding 08 |

Operator execution tracking follows a similar two-table pattern, with a fact table recording run-level metrics and a dimension table providing operator metadata. Each run is identified by a key such as OPER-0001 through OPER-0004 and linked to an operator via the operator_key, which references the dimension table where operators are described by labels like Operator Label 01 and categorized as Operator Category 01. The fact table captures the duration of each run in seconds, with observed values of 4,856.18, 4,308.22, 4,764.89, and 5,155.73 seconds, alongside an exit code indicating the run's termination status—codes 122, 691, 566, and 3 appearing in the dataset. The retry count, ranging from 12 to 265, quantifies how many times each operator invocation was retried before reaching its final exit state.

**fact_labrun**

| id | operator_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| OPER-0001 | OPER-0007 | 4856.18 | 122 | 265 |
| OPER-0002 | OPER-0005 | 4308.22 | 691 | 244 |
| OPER-0003 | OPER-0002 | 4764.89 | 566 | 106 |
| OPER-0004 | OPER-0007 | 5155.73 | 3 | 12 |
| OPER-0005 | OPER-0001 | 385.91 | 81 | 197 |