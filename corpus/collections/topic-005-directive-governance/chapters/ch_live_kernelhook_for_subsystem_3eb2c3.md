---
chapter_id: ch_live_kernelhook_for_subsystem_3eb2c3
topic_id: 5
family: 04_ebpf_kernel
cited_terms: ['kernelhook_for_subsystem', 'lift_with_baseline_rate', 'column_pair_subject']
model: engine-refine
---

Kernel subsystems form the structural backbone of any operating system, and their lifecycle must be tracked with the same rigor applied to financial instruments or production metrics. The `fact_kernelhook` table captures each hook instance by a unique identifier—`SUBS-0001` through `SUBS-0004`—and anchors it to a parent subsystem via the `for_kernel_subsystem_key` column, which itself references entries in the `dim_for_kernel_subsystem` dimension. This dimension supplies human-readable labels such as *For Kernel Subsystem Label 01* and categorical classifications like *For Kernel Subsystem Category 01*, enabling analysts to slice hook inventory by functional grouping rather than by opaque identifier alone. The fact table further records the compiled footprint of each hook in bytes—values ranging from roughly 27 million (`SUBS-0004`, at 272,822,846 bytes) to nearly 561 million (`SUBS-0002`, at 560,962,979 bytes)—and a version number that distinguishes between releases, with observed values of 1, 3, and 10 across the four rows. A hook consuming 560 MB of kernel space and running version 10 is materially different from one occupying 27 MB at version 1; the dimension's category column is precisely what lets an operator determine whether the former belongs to a memory-intensive subsystem like page caching or a lightweight trace point.

**fact_kernelhook**

| id | for_kernel_subsystem_key | size_bytes | version |
| --- | --- | --- | --- |
| SUBS-0001 | SUBS-0005 | 36342735 | 3 |
| SUBS-0002 | SUBS-0007 | 560962979 | 1 |
| SUBS-0003 | SUBS-0001 | 456299832 | 10 |
| SUBS-0004 | SUBS-0005 | 272822846 | 1 |

**dim_for_kernel_subsystem**

| id | for_kernel_subsystem_label | for_kernel_subsystem_category |
| --- | --- | --- |
| SUBS-0001 | For Kernel Subsystem Label 01 | For Kernel Subsystem Category 01 |
| SUBS-0002 | For Kernel Subsystem Label 02 | For Kernel Subsystem Category 02 |
| SUBS-0003 | For Kernel Subsystem Label 03 | For Kernel Subsystem Category 03 |
| SUBS-0004 | For Kernel Subsystem Label 04 | For Kernel Subsystem Category 04 |
| SUBS-0005 | For Kernel Subsystem Label 05 | For Kernel Subsystem Category 05 |
| SUBS-0006 | For Kernel Subsystem Label 06 | For Kernel Subsystem Category 06 |
| SUBS-0007 | For Kernel Subsystem Label 07 | For Kernel Subsystem Category 07 |

Beyond static inventory, the system records performance deltas through the lift-with-baseline-rate schema, which quantifies how much a given intervention improved a measured outcome relative to its pre-intervention state. The `t_lift_with_baseline_rate` table enumerates lift events—`RATE-0001` through `RATE-0004`—each tagged with a descriptive label such as *Conversion Gain*, *Latency Peak Reduction*, *Click Through Uplift*, and *Model v2 Accuracy Lift*, and tied to a baseline rate via the `baseline_rate` column, which references subject identifiers like `SUBJ-0007` and `SUBJ-0002`. These baseline references are not arbitrary; they point into the `t_column_pair_subject` table, where each subject row maps a source column (for example, `log_level`, `batch_token`, `transaction_id`, or `timestamp_utc`) to a target rate column, establishing the causal lineage of the measurement. A *Latency Peak Reduction* lift (`RATE-0002`) whose baseline rate is `SUBJ-0002` traces back to the `batch_token` column, meaning the improvement was measured on a metric derived from batch token processing latency.

**t_lift_with_baseline_rate**

| id | lift | baseline_rate |
| --- | --- | --- |
| RATE-0001 | Conversion Gain | SUBJ-0007 |
| RATE-0002 | Latency Peak Reduction | SUBJ-0002 |
| RATE-0003 | Click Through Uplift | SUBJ-0004 |
| RATE-0004 | Model v2 Accuracy Lift | SUBJ-0002 |
| RATE-0005 | Latency Peak Reduction | SUBJ-0005 |
| RATE-0006 | Ad Improvement | SUBJ-0007 |

**t_column_pair_subject**

| id | column | subject_column |
| --- | --- | --- |
| SUBJ-0001 | log_level | RATE-0004 |
| SUBJ-0002 | batch_token | RATE-0005 |
| SUBJ-0003 | transaction_id | RATE-0005 |
| SUBJ-0004 | timestamp_utc | RATE-0004 |
| SUBJ-0005 | patient_id | RATE-0001 |
| SUBJ-0006 | transaction_id | RATE-0001 |
| SUBJ-0007 | batch_token | RATE-0003 |

The attribute layer—spanning `t_lift_with_baseline_rate_attr` and `t_column_pair_subject_attr`—provides the schema for the values that populate the fact tables. Each attribute is identified by a name and a type: `confidence` carries an `xsd:decimal` type, `dimension_kind` and `method` are `xsd:string`, and `recorded_at` is `xsd:dateTime`. This type discipline is enforced at the storage layer through three separate value tables per entity set, one for each XSD type. For lift entities, decimal values such as 0.799 and 559.38 are stored in `t_lift_with_baseline_rate_val_decimal`, string values like *Dimension Kind 01*, *Encoding 02*, and *pre-release note* reside in `t_lift_with_baseline_rate_val_varchar`, and timestamps including `2024-01-14T18:32:00` and `2023-02-02T03:32:58` are held in `t_lift_with_baseline_rate_val_datetime`. The same tripartite decomposition applies to column-pair subjects, where decimal values such as 0.167 and 866.89, string values including *audit excerpt* and *ja*, and datetime values like `2023-03-08T01:00:53` and `2025-01-28T08:00:28` are segregated by type. This normalization by XSD type ensures that type coercion errors cannot corrupt the data and that query planners can route predicates to the appropriate storage engine without runtime casting.

**t_lift_with_baseline_rate_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| RATE-0001 | confidence | xsd:decimal |
| RATE-0002 | dimension_kind | xsd:string |
| RATE-0003 | method | xsd:string |
| RATE-0004 | recorded_at | xsd:dateTime |
| RATE-0005 | uncertainty | xsd:decimal |
| RATE-0006 | unit | xsd:string |
| RATE-0007 | value | xsd:decimal |
| RATE-0008 | encoding | xsd:string |

**t_lift_with_baseline_rate_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RATE-0001 | RATE-0001 | RATE-0004 | 2024-01-14T18:32:00 |
| RATE-0002 | RATE-0002 | RATE-0004 | 2023-02-02T03:32:58 |
| RATE-0003 | RATE-0003 | RATE-0004 | 2024-08-11T22:28:18 |
| RATE-0004 | RATE-0004 | RATE-0004 | 2024-10-19T09:19:40 |
| RATE-0005 | RATE-0005 | RATE-0004 | 2023-07-24T08:45:17 |
| RATE-0006 | RATE-0006 | RATE-0004 | 2025-03-24T11:20:59 |

**t_lift_with_baseline_rate_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RATE-0001 | RATE-0001 | RATE-0001 | 0.799 |
| RATE-0002 | RATE-0001 | RATE-0005 | 559.38 |
| RATE-0003 | RATE-0001 | RATE-0007 | 634.64 |
| RATE-0004 | RATE-0002 | RATE-0001 | 0.522 |
| RATE-0005 | RATE-0002 | RATE-0005 | 254.23 |
| RATE-0006 | RATE-0002 | RATE-0007 | 594.57 |
| RATE-0007 | RATE-0003 | RATE-0001 | 0.290 |
| RATE-0008 | RATE-0003 | RATE-0005 | 361.02 |

**t_lift_with_baseline_rate_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RATE-0001 | RATE-0001 | RATE-0002 | Dimension Kind 01 |
| RATE-0002 | RATE-0001 | RATE-0008 | Encoding 02 |
| RATE-0003 | RATE-0001 | RATE-0009 | pre-release note |
| RATE-0004 | RATE-0001 | RATE-0010 | de |
| RATE-0005 | RATE-0001 | RATE-0003 | automated |
| RATE-0006 | RATE-0001 | RATE-0006 | ratio |
| RATE-0007 | RATE-0002 | RATE-0002 | Dimension Kind 07 |
| RATE-0008 | RATE-0002 | RATE-0008 | Encoding 08 |

**t_column_pair_subject_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SUBJ-0001 | confidence | xsd:decimal |
| SUBJ-0002 | dimension_kind | xsd:string |
| SUBJ-0003 | method | xsd:string |
| SUBJ-0004 | recorded_at | xsd:dateTime |
| SUBJ-0005 | uncertainty | xsd:decimal |
| SUBJ-0006 | unit | xsd:string |
| SUBJ-0007 | value | xsd:decimal |
| SUBJ-0008 | encoding | xsd:string |

**t_column_pair_subject_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SUBJ-0001 | SUBJ-0001 | SUBJ-0004 | 2023-03-08T01:00:53 |
| SUBJ-0002 | SUBJ-0002 | SUBJ-0004 | 2023-09-25T09:20:34 |
| SUBJ-0003 | SUBJ-0003 | SUBJ-0004 | 2025-01-28T08:00:28 |
| SUBJ-0004 | SUBJ-0004 | SUBJ-0004 | 2023-08-23T03:35:02 |
| SUBJ-0005 | SUBJ-0005 | SUBJ-0004 | 2024-12-26T07:43:51 |
| SUBJ-0006 | SUBJ-0006 | SUBJ-0004 | 2025-02-08T03:11:44 |
| SUBJ-0007 | SUBJ-0007 | SUBJ-0004 | 2024-12-23T16:25:42 |

**t_column_pair_subject_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SUBJ-0001 | SUBJ-0001 | SUBJ-0001 | 0.167 |
| SUBJ-0002 | SUBJ-0001 | SUBJ-0005 | 866.89 |
| SUBJ-0003 | SUBJ-0001 | SUBJ-0007 | 939.39 |
| SUBJ-0004 | SUBJ-0002 | SUBJ-0001 | 0.312 |
| SUBJ-0005 | SUBJ-0002 | SUBJ-0005 | 788.04 |
| SUBJ-0006 | SUBJ-0002 | SUBJ-0007 | 1.19 |
| SUBJ-0007 | SUBJ-0003 | SUBJ-0001 | 0.974 |
| SUBJ-0008 | SUBJ-0003 | SUBJ-0005 | 706.00 |

**t_column_pair_subject_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SUBJ-0001 | SUBJ-0001 | SUBJ-0002 | Dimension Kind 01 |
| SUBJ-0002 | SUBJ-0001 | SUBJ-0008 | Encoding 02 |
| SUBJ-0003 | SUBJ-0001 | SUBJ-0009 | audit excerpt |
| SUBJ-0004 | SUBJ-0001 | SUBJ-0010 | ja |
| SUBJ-0005 | SUBJ-0001 | SUBJ-0003 | manual |
| SUBJ-0006 | SUBJ-0001 | SUBJ-0006 | ms |
| SUBJ-0007 | SUBJ-0002 | SUBJ-0002 | Dimension Kind 07 |
| SUBJ-0008 | SUBJ-0002 | SUBJ-0008 | Encoding 08 |

The foreign-key topology that binds these tables together is deliberately flat and denormalized at the dimension level but strictly normalized at the value level. The `fact_kernelhook.for_kernel_subsystem_key` references `dim_for_kernel_subsystem.id`, creating a many-to-one relationship that allows multiple hooks to share a category and label. The `t_lift_with_baseline_rate.baseline_rate` column references `t_column_pair_subject.id`, which in turn maps a column pair to a rate column, forming a bridge between the abstract lift event and the concrete data element it measures. The value tables—`*_val_decimal`, `*_val_varchar`, and `*_val_datetime`—each carry a composite foreign key consisting of `entity_id` (pointing back to the lift or subject row) and `attr_id` (pointing to the attribute definition), ensuring that every stored value can be traced to both its semantic definition and its parent entity. This design permits an analyst to ask, for instance, what decimal confidence score and recorded-at timestamp are associated with the *Conversion Gain* lift event, and receive an answer composed from three tables joined through well-defined keys.

In practice, this architecture supports two complementary modes of inquiry. The first is inventory and compliance: an operator queries `fact_kernelhook` joined to `dim_for_kernel_subsystem` to verify that all hooks in a given category are running an approved version and that their combined footprint stays within a memory budget. The second is performance attribution: an analyst joins `t_lift_with_baseline_rate` to its attribute and value tables to reconstruct the full measurement record—including the decimal lift magnitude, the string-valued method description, and the datetime of recording—and then traces the baseline rate back through `t_column_pair_subject` to identify which column pair and which source column drove the improvement. The separation of attribute metadata from attribute values, and of decimal, string, and datetime values into distinct tables, is not an artifact of schema design but a governance mechanism: it enforces type safety at write time, enables independent indexing of each value type, and provides a clear audit trail from raw kernel hook to executive summary.