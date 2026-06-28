---
chapter_id: ch_live_profile_of_dataset_fd7f76
topic_id: 183
family: 02_observation_measurement
cited_terms: ['profile_of_dataset', 'trace_min_one_span', 'lift_with_support_count']
model: engine-refine
---

The foundation of the measurement model rests on a disciplined separation between identifiers, attributes, and their typed values. Every record carries a unique identifier—whether formatted as DATA-0001 for profile facts, SPAN-0001 for trace records, or COUN-0001 for lift measurements—ensuring that each entity can be referenced unambiguously across the schema. Attributes define the dimensions along which measurements are recorded: the attribute catalog includes names such as confidence, dimension_kind, method, and recorded_at, each bound to a specific type. The type system distinguishes between xsd:decimal for numeric quantities, xsd:string for categorical labels, and xsd:dateTime for temporal stamps, and this type information drives the physical storage of attribute values into separate typed value tables. An entity—identified by entity_id—serves as the anchor point that ties together all its attribute values, regardless of type. A single entity such as COUN-0001, for instance, carries a decimal value of 0.849, a string value of Dimension Kind 01, and a recorded_at timestamp of 2024-12-28T07:07:56, each stored in its respective value table and linked back through the entity_id and attr_id foreign keys.

**fact_profile**

| id | profile_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| DATA-0001 | DATA-0005 | 0.299 | 284.36 | 728.94 |
| DATA-0002 | DATA-0005 | 0.994 | 557.92 | 380.57 |
| DATA-0003 | DATA-0003 | 0.773 | 622.09 | 607.36 |
| DATA-0004 | DATA-0006 | 0.226 | 488.10 | 448.09 |

**dim_profile_category**

| id | category_name |
| --- | --- |
| DATA-0001 | Category Name 01 |
| DATA-0002 | Category Name 02 |
| DATA-0003 | Category Name 03 |
| DATA-0004 | Category Name 04 |
| DATA-0005 | Category Name 05 |
| DATA-0006 | Category Name 06 |

**dim_profile**

| id | profile_label | profile_category | category_id |
| --- | --- | --- | --- |
| DATA-0001 | Profile Label 01 | Profile Category 01 | DATA-0004 |
| DATA-0002 | Profile Label 02 | Profile Category 02 | DATA-0006 |
| DATA-0003 | Profile Label 03 | Profile Category 03 | DATA-0005 |
| DATA-0004 | Profile Label 04 | Profile Category 04 | DATA-0001 |
| DATA-0005 | Profile Label 05 | Profile Category 05 | DATA-0002 |
| DATA-0006 | Profile Label 06 | Profile Category 06 | DATA-0004 |
| DATA-0007 | Profile Label 07 | Profile Category 07 | DATA-0002 |

Profile measurements are organized around a hierarchical category structure that classifies each profile into a meaningful group. The dimension_profile table assigns every profile a label—Profile Label 01 through Profile Label 04—and a profile_category such as Profile Category 01, which in turn references a category_id pointing into the dim_profile_category lookup table where the canonical category_name (Category Name 01 through Category Name 04) is defined. This two-level category indirection allows profiles to be grouped and filtered at the category level without duplicating category metadata. The fact_profile table then records the actual measurements for each profile, capturing a confidence score alongside an uncertainty bound and a numeric value. Confidence values span a wide range—from 0.226 for one profile to 0.994 for another—reflecting the varying degrees of certainty in the underlying data. Uncertainty values such as 284.36 and 622.09 quantify the margin of error around the measured value, which itself might be 728.94 or 380.57. Together, confidence, uncertainty, and value provide a complete picture of measurement quality for each profile entry.

Trace records capture the operational characteristics of execution spans, with each fact_trace row linked to a span through the spans_key foreign key. The dim_spans dimension table provides the descriptive metadata for each span, including a spans_label like Spans Label 01 and a spans_category such as Spans Category 01, enabling traces to be analyzed by their functional classification. The trace facts themselves record three critical operational metrics: duration_seconds, exit_code, and retry_count. Durations vary substantially across spans, with one record showing 3940.66 seconds and another only 1874.27 seconds, indicating the wide range of execution times encountered in practice. Exit codes—491, 900, 420, and 60 in the sample data—encode the termination status of each trace, while retry counts ranging from 179 to 459 reveal the frequency with which operations required re-execution. These three columns together form a diagnostic triad that supports root-cause analysis and performance trending.

**fact_trace**

| id | spans_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| SPAN-0001 | SPAN-0005 | 1874.27 | 491 | 399 |
| SPAN-0002 | SPAN-0002 | 2092.44 | 900 | 179 |
| SPAN-0003 | SPAN-0004 | 3940.66 | 420 | 396 |
| SPAN-0004 | SPAN-0006 | 3336.66 | 60 | 459 |

**dim_spans**

| id | spans_label | spans_category |
| --- | --- | --- |
| SPAN-0001 | Spans Label 01 | Spans Category 01 |
| SPAN-0002 | Spans Label 02 | Spans Category 02 |
| SPAN-0003 | Spans Label 03 | Spans Category 03 |
| SPAN-0004 | Spans Label 04 | Spans Category 04 |
| SPAN-0005 | Spans Label 05 | Spans Category 05 |
| SPAN-0006 | Spans Label 06 | Spans Category 06 |

The lift measurement tables extend the entity-attribute-value pattern to support flexible, schema-on-read analytics. The t_lift_with_support_count table establishes the base entities with their lift descriptions—signal amplification lift, data pipeline lift, sensor drift lift—and their corresponding support counts, which range from 2048 to 32768 and indicate the volume of data underlying each lift estimate. Attribute definitions in t_lift_with_support_count_attr enumerate the measurable properties of these entities, while the three typed value tables—t_lift_with_support_count_val_datetime, t_lift_with_support_count_val_decimal, and t_lift_with_support_count_val_varchar—store the actual measurements. This separation by type avoids the storage inefficiency and query complexity of a single monolithic value column, while preserving the flexibility to add new attributes without schema migrations. The entity_id and attr_id foreign keys in each value table create a clean join path back to the entity and attribute definitions, ensuring that every measurement can be traced to its source and its semantic meaning.

**t_lift_with_support_count**

| id | lift | support_count |
| --- | --- | --- |
| COUN-0001 | signal amplification lift | 32768 |
| COUN-0002 | data pipeline lift | 2048 |
| COUN-0003 | sensor drift lift | 16384 |
| COUN-0004 | sensor drift lift | 2048 |
| COUN-0005 | fuel economy lift | 65536 |
| COUN-0006 | aerodynamic lift | 1024 |
| COUN-0007 | signal amplification lift | 32768 |
| COUN-0008 | latency reduction lift | 2048 |

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