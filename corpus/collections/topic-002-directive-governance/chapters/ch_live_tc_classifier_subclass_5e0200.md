---
chapter_id: ch_live_tc_classifier_subclass_5e0200
topic_id: 2
family: 07_long_tail
cited_terms: ['tc_classifier_subclass', 'profiling_targets_dataset', 'lift_basic']
model: engine-refine
---

The governance of observability data rests upon a disciplined separation of measured quantities from their descriptive metadata, a pattern instantiated across the classifier and profiling domains. In the classifier domain, the fact table anchors each record to a directional classification through the foreign key `t_c_direction_key`, which references the primary key of the dimension table where directional labels and categories are enumerated—`CLAS-0001` maps to the label `T C Direction Label 01` and category `T C Direction Category 01`, while `CLAS-0004` resolves to `T C Direction Label 04` and `T C Direction Category 04`. The classifier facts themselves carry a `size_bytes` measure, ranging from 623,892,633 bytes for record `CLAS-0004` to 883,422,563 bytes for `CLAS-0002`, alongside a `version` attribute that distinguishes between revision states such as version 2 for `CLAS-0001` and version 9 for `CLAS-0003`. This structure ensures that every volumetric measurement is traceable to a canonical directional taxonomy without duplicating categorical descriptors within the fact rows.

**fact_classifier**

| id | t_c_direction_key | size_bytes | version |
| --- | --- | --- | --- |
| CLAS-0001 | CLAS-0001 | 643947353 | 2 |
| CLAS-0002 | CLAS-0004 | 883422563 | 1 |
| CLAS-0003 | CLAS-0001 | 772730446 | 1 |
| CLAS-0004 | CLAS-0006 | 623892633 | 9 |
| CLAS-0005 | CLAS-0002 | 61512113 | 4 |
| CLAS-0006 | CLAS-0007 | 798328963 | 5 |
| CLAS-0007 | CLAS-0002 | 968248258 | 9 |

**dim_t_c_direction**

| id | t_c_direction_label | t_c_direction_category |
| --- | --- | --- |
| CLAS-0001 | T C Direction Label 01 | T C Direction Category 01 |
| CLAS-0002 | T C Direction Label 02 | T C Direction Category 02 |
| CLAS-0003 | T C Direction Label 03 | T C Direction Category 03 |
| CLAS-0004 | T C Direction Label 04 | T C Direction Category 04 |
| CLAS-0005 | T C Direction Label 05 | T C Direction Category 05 |
| CLAS-0006 | T C Direction Label 06 | T C Direction Category 06 |
| CLAS-0007 | T C Direction Label 07 | T C Direction Category 07 |

**dim_profiling**

| id | profiling_label | profiling_category |
| --- | --- | --- |
| DATA-0001 | Profiling Label 01 | Profiling Category 01 |
| DATA-0002 | Profiling Label 02 | Profiling Category 02 |
| DATA-0003 | Profiling Label 03 | Profiling Category 03 |
| DATA-0004 | Profiling Label 04 | Profiling Category 04 |
| DATA-0005 | Profiling Label 05 | Profiling Category 05 |
| DATA-0006 | Profiling Label 06 | Profiling Category 06 |

The profiling domain mirrors this dimensional architecture with its own fact and dimension pair. The profiling fact table records execution outcomes through `duration_seconds`, `exit_code`, and `retry_count`, each row keyed by `profiling_key` to the profiling dimension where `profiling_label` and `profiling_category` provide the human-readable and categorical context. A profiling record identified as `DATA-0001` consumed 6,716.87 seconds, terminated with exit code 725, and required 209 retries; another record, `DATA-0003`, ran for 2,546.61 seconds with exit code 348 and 303 retries. The dimension table assigns `Profiling Label 01` and `Profiling Category 01` to the dimension entry `DATA-0001`, establishing the same label-to-category linkage that the classifier domain applies to its directional taxonomy. The foreign key relationship between `profiling_key` in the fact table and `id` in the dimension table guarantees that every duration, exit code, and retry count is semantically anchored to a stable profiling classification.

Beyond these two fact-dimension pairs, the lift entity model employs an entity-attribute-value pattern that generalizes attribute storage across multiple value types. The base lift table defines entities such as `LIFT-0001`, labeled `Observatory Lift`, and `LIFT-0002`, labeled `Freight Service Lift`. Attribute definitions reside in a separate table where `attr_name` identifies the property—`confidence`, `dimension_kind`, `method`, `recorded_at`—and `attr_type` declares its semantic type using XSD vocabulary: `xsd:decimal` for `confidence`, `xsd:string` for `dimension_kind` and `method`, and `xsd:dateTime` for `recorded_at`. This type declaration governs which value table holds the actual data, enforcing type discipline at the schema level.

**t_lift_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LIFT-0001 | LIFT-0001 | LIFT-0004 | 2024-06-13T06:43:09 |
| LIFT-0002 | LIFT-0002 | LIFT-0004 | 2024-12-03T09:28:05 |
| LIFT-0003 | LIFT-0003 | LIFT-0004 | 2024-01-28T22:31:03 |
| LIFT-0004 | LIFT-0004 | LIFT-0004 | 2024-06-11T06:27:27 |
| LIFT-0005 | LIFT-0005 | LIFT-0004 | 2023-05-13T18:59:00 |
| LIFT-0006 | LIFT-0006 | LIFT-0004 | 2023-02-07T19:19:23 |
| LIFT-0007 | LIFT-0007 | LIFT-0004 | 2023-12-22T04:56:51 |

**t_lift_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LIFT-0001 | LIFT-0001 | LIFT-0001 | 0.624 |
| LIFT-0002 | LIFT-0001 | LIFT-0005 | 93.24 |
| LIFT-0003 | LIFT-0001 | LIFT-0007 | 541.29 |
| LIFT-0004 | LIFT-0002 | LIFT-0001 | 0.175 |
| LIFT-0005 | LIFT-0002 | LIFT-0005 | 180.41 |
| LIFT-0006 | LIFT-0002 | LIFT-0007 | 256.73 |
| LIFT-0007 | LIFT-0003 | LIFT-0001 | 0.866 |
| LIFT-0008 | LIFT-0003 | LIFT-0005 | 594.06 |

The value tables materialize the entity-attribute pairs into typed columns. The decimal value table stores numeric measurements such as 0.624 and 93.24 for entity `LIFT-0001` against attribute `LIFT-0001` and attribute `LIFT-0005` respectively, while the varchar value table captures textual data including `Dimension Kind 01` and `Encoding 02` for the same entity. The datetime value table records timestamps like `2024-06-13T06:43:09` and `2024-12-03T09:28:05`, all associated with entity `LIFT-0001` and attribute `LIFT-0004`. Each value row carries foreign keys to both the entity and the attribute definition, ensuring that every stored value can be resolved to its entity context and its declared type. This three-table value structure—decimal, varchar, and datetime—allows the model to accommodate heterogeneous attribute types without requiring nullable columns or type coercion within a single value store.

**t_lift_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LIFT-0001 | LIFT-0001 | LIFT-0002 | Dimension Kind 01 |
| LIFT-0002 | LIFT-0001 | LIFT-0008 | Encoding 02 |
| LIFT-0003 | LIFT-0001 | LIFT-0009 | change rationale |
| LIFT-0004 | LIFT-0001 | LIFT-0010 | de |
| LIFT-0005 | LIFT-0001 | LIFT-0003 | manual |
| LIFT-0006 | LIFT-0001 | LIFT-0006 | m/s |
| LIFT-0007 | LIFT-0002 | LIFT-0002 | Dimension Kind 07 |
| LIFT-0008 | LIFT-0002 | LIFT-0008 | Encoding 08 |

The design choices across all tables reflect a consistent governance philosophy: identifiers serve as the immutable anchor points, foreign keys enforce referential integrity between measured facts and their descriptive dimensions, and type-specific value tables prevent the ambiguity that arises from storing heterogeneous data in generic columns. The `size_bytes` and `duration_seconds` measures quantify resource consumption, the `exit_code` and `retry_count` fields capture operational outcomes, and the categorical and label columns in the dimension tables provide the human-interpretable taxonomy that makes these numbers actionable. Together, the classifier facts, profiling facts, and lift entity-attribute values form a coherent observability model where every metric, classification, and attribute value is traceable to its source definition and its semantic context.

**fact_profiling**

| id | profiling_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| DATA-0001 | DATA-0003 | 6716.87 | 725 | 209 |
| DATA-0002 | DATA-0006 | 1113.38 | 809 | 186 |
| DATA-0003 | DATA-0006 | 2546.61 | 348 | 303 |
| DATA-0004 | DATA-0006 | 2074.93 | 827 | 264 |

**t_lift_basic**

| id | lift |
| --- | --- |
| LIFT-0001 | Observatory Lift |
| LIFT-0002 | Freight Service Lift |
| LIFT-0003 | Freight Service Lift |
| LIFT-0004 | Observatory Lift |
| LIFT-0005 | Observatory Lift |
| LIFT-0006 | Cargo Bay Lift |
| LIFT-0007 | Cargo Bay Lift |

**t_lift_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| LIFT-0001 | confidence | xsd:decimal |
| LIFT-0002 | dimension_kind | xsd:string |
| LIFT-0003 | method | xsd:string |
| LIFT-0004 | recorded_at | xsd:dateTime |
| LIFT-0005 | uncertainty | xsd:decimal |
| LIFT-0006 | unit | xsd:string |
| LIFT-0007 | value | xsd:decimal |
| LIFT-0008 | encoding | xsd:string |