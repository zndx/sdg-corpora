---
chapter_id: ch_live_syscall_equiv_in_subsystem_4ffd8c
topic_id: 20
family: 04_ebpf_kernel
cited_terms: ['syscall_equiv_in_subsystem', 'profile_over_time_window', 'disjunctive_combination']
model: engine-refine
---

The attribute system anchors every measurable property to a precise type, ensuring that values are interpreted unambiguously across the governance framework. An attribute—identified by a unique identifier such as `COMB-0001` through `COMB-0010`—carries a name like `confidence`, `dimension_kind`, `method`, or `recorded_at`, and is bound to an XSD type that dictates its storage and validation semantics. The attribute type `xsd:decimal` governs numeric quantities such as `0.084` and `689.68`, `xsd:string` accommodates categorical labels like `Dimension Kind 01` and `calibration record`, and `xsd:dateTime` constrains temporal stamps to the ISO 8601 format, as seen in `2023-12-19T10:56:22` and `2025-06-13T05:31:45`. This type discipline is not merely structural; it enforces that every value—whether stored in the decimal, varchar, or datetime value tables—conforms to the schema contract before it enters the analytical pipeline.

Entities serve as the primary referents to which attributes bind, each entity identified by a stable identifier such as `COMB-0001` or `COMB-0002`. A single entity can carry multiple attributes across different value tables: `COMB-0001`, for instance, holds a decimal confidence of `0.084`, a dimension kind of `Dimension Kind 01`, a method label of `Encoding 02`, a recorded-at timestamp of `2023-12-19T10:56:22`, and a miscellaneous string value of `calibration record`. The `misc` column functions as the generic value carrier for non-numeric, non-temporal data, absorbing free-form strings like `ja` or `backup_readout` without imposing type constraints beyond the varchar length. This separation of value types into dedicated tables—decimal, varchar, and datetime—preserves type safety while allowing entities to accumulate heterogeneous attributes without schema migration.

**t_disjunctive_combination_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COMB-0001 | COMB-0001 | COMB-0004 | 2023-12-19T10:56:22 |
| COMB-0002 | COMB-0002 | COMB-0004 | 2025-06-13T05:31:45 |
| COMB-0003 | COMB-0003 | COMB-0004 | 2023-09-21T03:35:03 |
| COMB-0004 | COMB-0004 | COMB-0004 | 2025-01-18T01:14:05 |
| COMB-0005 | COMB-0005 | COMB-0004 | 2023-04-13T14:48:56 |
| COMB-0006 | COMB-0006 | COMB-0004 | 2023-06-17T09:04:58 |

**t_disjunctive_combination_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COMB-0001 | COMB-0001 | COMB-0001 | 0.084 |
| COMB-0002 | COMB-0001 | COMB-0005 | 689.68 |
| COMB-0003 | COMB-0001 | COMB-0007 | 250.05 |
| COMB-0004 | COMB-0002 | COMB-0001 | 0.409 |
| COMB-0005 | COMB-0002 | COMB-0005 | 133.59 |
| COMB-0006 | COMB-0002 | COMB-0007 | 440.04 |
| COMB-0007 | COMB-0003 | COMB-0001 | 0.271 |
| COMB-0008 | COMB-0003 | COMB-0005 | 418.58 |

**t_disjunctive_combination_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COMB-0001 | COMB-0001 | COMB-0002 | Dimension Kind 01 |
| COMB-0002 | COMB-0001 | COMB-0008 | Encoding 02 |
| COMB-0003 | COMB-0001 | COMB-0009 | calibration record |
| COMB-0004 | COMB-0001 | COMB-0010 | ja |
| COMB-0005 | COMB-0001 | COMB-0003 | hybrid |
| COMB-0006 | COMB-0001 | COMB-0006 | count |
| COMB-0007 | COMB-0002 | COMB-0002 | Dimension Kind 07 |
| COMB-0008 | COMB-0002 | COMB-0008 | Encoding 08 |

Confidence and uncertainty form the dual metrics by which the framework quantifies the reliability of observations over a defined time window. The `fact_profile` table records a confidence score ranging from `0.226` to `0.994` alongside an uncertainty magnitude spanning `284.36` to `622.09`, with each profile tied to a specific time window via `over_time_window_key` and carrying a measured `value`—for example, `728.94` or `380.57`. Confidence and uncertainty are inversely related in practice: a profile with confidence `0.994` exhibits uncertainty `557.92`, while a profile with confidence `0.226` shows uncertainty `488.10`, suggesting that the framework does not enforce a rigid arithmetic complement but rather captures domain-specific error bounds. The time window itself is classified by a category—`Category Name 01` through `Category Name 04`—and labeled with a human-readable identifier such as `Over Time Window Label 01`, enabling analysts to filter and aggregate profiles by temporal granularity and semantic grouping.

**fact_profile**

| id | over_time_window_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| WIND-0001 | WIND-0005 | 0.299 | 284.36 | 728.94 |
| WIND-0002 | WIND-0007 | 0.994 | 557.92 | 380.57 |
| WIND-0003 | WIND-0004 | 0.773 | 622.09 | 607.36 |
| WIND-0004 | WIND-0007 | 0.226 | 488.10 | 448.09 |

**dim_over_time_window_category**

| id | category_name |
| --- | --- |
| WIND-0001 | Category Name 01 |
| WIND-0002 | Category Name 02 |
| WIND-0003 | Category Name 03 |
| WIND-0004 | Category Name 04 |
| WIND-0005 | Category Name 05 |
| WIND-0006 | Category Name 06 |
| WIND-0007 | Category Name 07 |
| WIND-0008 | Category Name 08 |

**dim_over_time_window**

| id | over_time_window_label | over_time_window_category | category_id |
| --- | --- | --- | --- |
| WIND-0001 | Over Time Window Label 01 | Over Time Window Category 01 | WIND-0008 |
| WIND-0002 | Over Time Window Label 02 | Over Time Window Category 02 | WIND-0004 |
| WIND-0003 | Over Time Window Label 03 | Over Time Window Category 03 | WIND-0008 |
| WIND-0004 | Over Time Window Label 04 | Over Time Window Category 04 | WIND-0004 |
| WIND-0005 | Over Time Window Label 05 | Over Time Window Category 05 | WIND-0005 |
| WIND-0006 | Over Time Window Label 06 | Over Time Window Category 06 | WIND-0002 |
| WIND-0007 | Over Time Window Label 07 | Over Time Window Category 07 | WIND-0006 |

The relational structure extends beyond attribute-value pairs into role-based associations between subjects and targets. The junction table `t_syscall_equiv_in_subsystem__in_syscall_subsystem` maps a subject—identified as `SUBS-0003` or `SUBS-0005`—to a target—`SUBS-0007` or `SUBS-0006`—through a role such as `reviewer`, `owner`, or `observer`. This triad (subject, target, role) encodes governance relationships: a syscall designated as `SUBS-0003` assumes the `reviewer` role with respect to the subsystem `SUBS-0007`, while `SUBS-0004` acts as `owner` of the same target. The subject and target identifiers reference the canonical syscall and subsystem dimension tables (`t_syscall_equiv_in_subsystem` and `t_syscall_equiv_in_subsystem_in_syscall_subsystem`), where `SUBS-0001` resolves to `Syscall 01` and `SUBS-0001` in the subsystem table resolves to `In Syscall Subsystem 01`. This indirection through identifier tables ensures referential integrity while allowing the same syscall or subsystem to participate in multiple role relationships.

**t_syscall_equiv_in_subsystem**

| id | syscall |
| --- | --- |
| SUBS-0001 | Syscall 01 |
| SUBS-0002 | Syscall 02 |
| SUBS-0003 | Syscall 03 |
| SUBS-0004 | Syscall 04 |
| SUBS-0005 | Syscall 05 |
| SUBS-0006 | Syscall 06 |
| SUBS-0007 | Syscall 07 |

**t_syscall_equiv_in_subsystem_in_syscall_subsystem**

| id | in_syscall_subsystem |
| --- | --- |
| SUBS-0001 | In Syscall Subsystem 01 |
| SUBS-0002 | In Syscall Subsystem 02 |
| SUBS-0003 | In Syscall Subsystem 03 |
| SUBS-0004 | In Syscall Subsystem 04 |
| SUBS-0005 | In Syscall Subsystem 05 |
| SUBS-0006 | In Syscall Subsystem 06 |
| SUBS-0007 | In Syscall Subsystem 07 |

**t_syscall_equiv_in_subsystem__in_syscall_subsystem**

| id | syscall_id | in_syscall_subsystem_id | role |
| --- | --- | --- | --- |
| SUBS-0001 | SUBS-0003 | SUBS-0007 | reviewer |
| SUBS-0002 | SUBS-0005 | SUBS-0006 | reviewer |
| SUBS-0003 | SUBS-0004 | SUBS-0007 | owner |
| SUBS-0004 | SUBS-0002 | SUBS-0006 | observer |
| SUBS-0005 | SUBS-0007 | SUBS-0004 | owner |
| SUBS-0006 | SUBS-0007 | SUBS-0002 | contributor |
| SUBS-0007 | SUBS-0004 | SUBS-0001 | reviewer |
| SUBS-0008 | SUBS-0003 | SUBS-0004 | owner |

Disjunctive combinations introduce a layer of logical composition, where operations such as `Schema_validation_union` or `OR_filter_rule` combine distinct data sources—`sensor_primary_signal`, `archived_log`, `mirror_table`, `backup_readout`—into a unified entity. Each combination carries its own set of attributes, and the `t_disjunctive_combination_attr` table declares which attributes apply to which combination, with types constraining the permissible values. The combination `COMB-0001`, for example, applies the `Schema_validation_union` operation to `sensor_primary_signal` and carries attributes including `confidence` (typed as `xsd:decimal`) and `recorded_at` (typed as `xsd:dateTime`). This architecture supports flexible data fusion: disparate sources can be merged under a single combination entity, and the resulting entity inherits the full attribute-value machinery, including confidence scoring, uncertainty tracking, and temporal classification, thereby propagating governance metadata through every layer of the data lineage.

**t_disjunctive_combination**

| id | disjunctive | disjunctively_combines |
| --- | --- | --- |
| COMB-0001 | Schema_validation_union | sensor_primary_signal |
| COMB-0002 | OR_filter_rule | archived_log |
| COMB-0003 | OR_filter_rule | mirror_table |
| COMB-0004 | Schema_validation_union | backup_readout |
| COMB-0005 | Metric_aggregation_branch | primary_readout |
| COMB-0006 | Compliance_check_union | backup_readout |

**t_disjunctive_combination_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| COMB-0001 | confidence | xsd:decimal |
| COMB-0002 | dimension_kind | xsd:string |
| COMB-0003 | method | xsd:string |
| COMB-0004 | recorded_at | xsd:dateTime |
| COMB-0005 | uncertainty | xsd:decimal |
| COMB-0006 | unit | xsd:string |
| COMB-0007 | value | xsd:decimal |
| COMB-0008 | encoding | xsd:string |