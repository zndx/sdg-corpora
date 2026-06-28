---
chapter_id: ch_live_soc2_availability_subclass_92ba14
topic_id: 183
family: 07_long_tail
cited_terms: ['soc2_availability_subclass', 'client_data_record', 'lift_with_support_count']
model: engine-refine
---

In compliance and governance frameworks, structured attribute management enables organizations to capture, validate, and query the properties of audit entities with precision. The SOC 2 availability subclass table serves as the primary entity registry, where each record carries a unique identifier—such as AVAI-0001 for a SOC 3 Public Report or AVAI-0002 for a SOC 2 Privacy Assessment—and references a governing domain through a foreign key like COUN-0008 or COUN-0006. This separation of entity identity from domain classification ensures that availability assessments can be grouped, filtered, and reported by their applicable compliance scope without duplicating domain metadata across every record. The attribute schema itself is defined in a companion table that pairs human-readable names like effective_date, enforcement, mandatory, and priority with their corresponding data types—xsd:date, xsd:string, xsd:boolean, and xsd:integer—establishing a contract for what properties each entity can possess and in what format those values must be stored.

**t_soc2_availability_subclass**

| id | soc | for_s_o_c2_domain |
| --- | --- | --- |
| AVAI-0001 | SOC 3 Public Report | COUN-0008 |
| AVAI-0002 | SOC 2 Privacy Assessment | COUN-0006 |
| AVAI-0003 | SOC 2 Type I Assessment | COUN-0002 |
| AVAI-0004 | SOC 1 Financial Audit | COUN-0003 |
| AVAI-0005 | SOC 2 Type I Assessment | COUN-0007 |
| AVAI-0006 | SOC 1 Type I Report | COUN-0001 |
| AVAI-0007 | SOC 2 Privacy Assessment | COUN-0003 |

**t_soc2_availability_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| AVAI-0001 | effective_date | xsd:date |
| AVAI-0002 | enforcement | xsd:string |
| AVAI-0003 | mandatory | xsd:boolean |
| AVAI-0004 | priority | xsd:integer |
| AVAI-0005 | review_cycle_days | xsd:integer |
| AVAI-0006 | scope | xsd:string |
| AVAI-0007 | encoding | xsd:string |
| AVAI-0008 | label_text | xsd:string |

**t_soc2_availability_subclass_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AVAI-0001 | AVAI-0001 | AVAI-0003 | true |
| AVAI-0002 | AVAI-0002 | AVAI-0003 | true |
| AVAI-0003 | AVAI-0003 | AVAI-0003 | false |
| AVAI-0004 | AVAI-0004 | AVAI-0003 | false |
| AVAI-0005 | AVAI-0005 | AVAI-0003 | false |
| AVAI-0006 | AVAI-0006 | AVAI-0003 | true |
| AVAI-0007 | AVAI-0007 | AVAI-0003 | false |

**t_soc2_availability_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AVAI-0001 | AVAI-0001 | AVAI-0001 | 2024-07-01 |
| AVAI-0002 | AVAI-0002 | AVAI-0001 | 2024-03-01 |
| AVAI-0003 | AVAI-0003 | AVAI-0001 | 2023-09-25 |
| AVAI-0004 | AVAI-0004 | AVAI-0001 | 2024-01-04 |
| AVAI-0005 | AVAI-0005 | AVAI-0001 | 2023-04-30 |
| AVAI-0006 | AVAI-0006 | AVAI-0001 | 2024-05-11 |
| AVAI-0007 | AVAI-0007 | AVAI-0001 | 2023-07-31 |

**t_soc2_availability_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AVAI-0001 | AVAI-0001 | AVAI-0004 | 5 |
| AVAI-0002 | AVAI-0001 | AVAI-0005 | 378 |
| AVAI-0003 | AVAI-0002 | AVAI-0004 | 4 |
| AVAI-0004 | AVAI-0002 | AVAI-0005 | 753 |
| AVAI-0005 | AVAI-0003 | AVAI-0004 | 1 |
| AVAI-0006 | AVAI-0003 | AVAI-0005 | 952 |
| AVAI-0007 | AVAI-0004 | AVAI-0004 | 1 |
| AVAI-0008 | AVAI-0004 | AVAI-0005 | 575 |

**t_soc2_availability_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AVAI-0001 | AVAI-0001 | AVAI-0007 | Encoding 01 |
| AVAI-0002 | AVAI-0001 | AVAI-0002 | Enforcement 02 |
| AVAI-0003 | AVAI-0001 | AVAI-0008 | nightly summary |
| AVAI-0004 | AVAI-0001 | AVAI-0009 | fr |
| AVAI-0005 | AVAI-0001 | AVAI-0006 | Scope 05 |
| AVAI-0006 | AVAI-0002 | AVAI-0007 | Encoding 06 |
| AVAI-0007 | AVAI-0002 | AVAI-0002 | Enforcement 07 |
| AVAI-0008 | AVAI-0002 | AVAI-0008 | pre-release note |

Value storage follows a type-disaggregated pattern that preserves data integrity while supporting flexible querying. Boolean attributes such as mandatory are persisted in a dedicated value table where each row links an entity identifier like AVAI-0001 to an attribute definition like AVAI-0003, yielding concrete values such as true or false that indicate whether a given requirement is compulsory. Date attributes, exemplified by effective_date, store temporal values like 2024-07-01 or 2023-09-25 in a separate table, ensuring that date comparisons and range queries operate on properly typed data. Integer attributes capture numeric measures—priority scores of 5 and 4, or counts such as 378 and 753—while variable-length string attributes encompass a diverse range of content: encoding identifiers like Encoding 01, enforcement labels such as Enforcement 02, operational notes like nightly summary, and language codes including fr and es. This type-specific partitioning prevents type coercion errors and enables the database engine to enforce schema constraints at insert time.

The fact_client table introduces a dimensional analytics layer where each client record—identified by codes such as RECO-0001 or RECO-0003—carries an event_count that quantifies the volume of auditable activities, with observed values ranging from 42 to 282. A contains_key column in this fact table references the dim_contains dimension, establishing a foreign-key relationship that classifies what each client record encompasses. The dimension table itself provides two descriptive columns: contains_label, which holds human-readable descriptors like Contains Label 01 through Contains Label 04, and contains_category, which assigns categorical groupings such as Contains Category 01 through Contains Category 04. This star-schema arrangement allows analysts to slice event counts by containment category, enabling compliance teams to understand which types of data holdings correlate with higher or lower audit activity volumes.

**fact_client**

| id | contains_key | event_count |
| --- | --- | --- |
| RECO-0001 | RECO-0006 | 225 |
| RECO-0002 | RECO-0005 | 129 |
| RECO-0003 | RECO-0002 | 282 |
| RECO-0004 | RECO-0002 | 42 |
| RECO-0005 | RECO-0003 | 486 |
| RECO-0006 | RECO-0004 | 89 |

**dim_contains**

| id | contains_label | contains_category |
| --- | --- | --- |
| RECO-0001 | Contains Label 01 | Contains Category 01 |
| RECO-0002 | Contains Label 02 | Contains Category 02 |
| RECO-0003 | Contains Label 03 | Contains Category 03 |
| RECO-0004 | Contains Label 04 | Contains Category 04 |
| RECO-0005 | Contains Label 05 | Contains Category 05 |
| RECO-0006 | Contains Label 06 | Contains Category 06 |

A parallel entity structure, t_lift_with_support_count, tracks signal amplification lift, data pipeline lift, and sensor drift lift metrics, each tied to an availability entity through a support_count foreign key that references identifiers like AVAI-0004, AVAI-0006, AVAI-0001, and AVAI-0002. This linkage creates a cross-domain relationship: lift measurements are contextualized by the availability assessments they support, enabling auditors to trace how performance indicators map to specific SOC 2 or SOC 1 compliance domains. The attribute definitions for this table include confidence (xsd:decimal), dimension_kind (xsd:string), method (xsd:string), and recorded_at (xsd:dateTime), and their values are stored in the same type-disaggregated pattern. Decimal confidence values such as 0.849 and 0.258 quantify measurement reliability, while recorded_at timestamps like 2024-12-28T07:07:56 and 2023-08-28T07:06:53 provide an audit trail of when each lift measurement was captured. String attributes capture dimension kinds, encoding schemes, and operational summaries, completing the metadata picture needed to reproduce and validate each measurement.

**t_lift_with_support_count**

| id | lift | support_count |
| --- | --- | --- |
| COUN-0001 | signal amplification lift | AVAI-0004 |
| COUN-0002 | data pipeline lift | AVAI-0006 |
| COUN-0003 | sensor drift lift | AVAI-0001 |
| COUN-0004 | sensor drift lift | AVAI-0002 |
| COUN-0005 | fuel economy lift | AVAI-0001 |
| COUN-0006 | aerodynamic lift | AVAI-0002 |
| COUN-0007 | signal amplification lift | AVAI-0006 |
| COUN-0008 | latency reduction lift | AVAI-0002 |

**t_lift_with_support_count_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| COUN-0001 | confidence | xsd:decimal |
| COUN-0002 | dimension_kind | xsd:string |
| COUN-0003 | method | xsd:string |
| COUN-0004 | recorded_at | xsd:dateTime |
| COUN-0005 | uncertainty | xsd:decimal |
| COUN-0006 | unit | xsd:string |
| COUN-0007 | value | xsd:decimal |
| COUN-0008 | encoding | xsd:string |

**t_lift_with_support_count_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COUN-0001 | COUN-0001 | COUN-0004 | 2024-12-28T07:07:56 |
| COUN-0002 | COUN-0002 | COUN-0004 | 2023-08-28T07:06:53 |
| COUN-0003 | COUN-0003 | COUN-0004 | 2023-06-25T23:08:52 |
| COUN-0004 | COUN-0004 | COUN-0004 | 2024-05-16T16:03:55 |
| COUN-0005 | COUN-0005 | COUN-0004 | 2024-10-22T12:30:05 |
| COUN-0006 | COUN-0006 | COUN-0004 | 2023-09-08T00:35:07 |
| COUN-0007 | COUN-0007 | COUN-0004 | 2025-05-03T04:02:17 |
| COUN-0008 | COUN-0008 | COUN-0004 | 2024-04-02T09:45:25 |

**t_lift_with_support_count_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COUN-0001 | COUN-0001 | COUN-0001 | 0.849 |
| COUN-0002 | COUN-0001 | COUN-0005 | 945.35 |
| COUN-0003 | COUN-0001 | COUN-0007 | 331.44 |
| COUN-0004 | COUN-0002 | COUN-0001 | 0.258 |
| COUN-0005 | COUN-0002 | COUN-0005 | 675.58 |
| COUN-0006 | COUN-0002 | COUN-0007 | 197.74 |
| COUN-0007 | COUN-0003 | COUN-0001 | 0.111 |
| COUN-0008 | COUN-0003 | COUN-0005 | 368.51 |

**t_lift_with_support_count_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COUN-0001 | COUN-0001 | COUN-0002 | Dimension Kind 01 |
| COUN-0002 | COUN-0001 | COUN-0008 | Encoding 02 |
| COUN-0003 | COUN-0001 | COUN-0009 | nightly summary |
| COUN-0004 | COUN-0001 | COUN-0010 | es |
| COUN-0005 | COUN-0001 | COUN-0003 | hybrid |
| COUN-0006 | COUN-0001 | COUN-0006 | ratio |
| COUN-0007 | COUN-0002 | COUN-0002 | Dimension Kind 07 |
| COUN-0008 | COUN-0002 | COUN-0008 | Encoding 08 |