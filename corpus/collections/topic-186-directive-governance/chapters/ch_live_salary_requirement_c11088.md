---
chapter_id: ch_live_salary_requirement_c11088
topic_id: 186
family: 08_derived
cited_terms: ['salary_requirement', 'functional_dependency_lhs', 'bpf_helper_subclass']
model: engine-refine
---

An identifier serves as the immutable key that anchors every record in the data model, ensuring that each entity can be referenced unambiguously across fact and dimension tables. In the salary domain, identifiers such as REQU-0001 through REQU-0004 uniquely distinguish individual measurement records, while LHS-0001 through LHS-0004 perform the same role for functional left-hand-side observations. Similarly, the BPF helper subclass records carry identifiers like HELP-0001 through HELP-0004, which appear both as primary keys and as foreign keys linking attribute values back to their parent entities. This consistent use of identifiers across tables enables reliable joins and traceability: a value row in any of the attribute value tables references its entity through an entity_id column that points directly to the identifier in the parent subclass table, and a fact table row references its dimension counterpart through a foreign key such as salary_key or f_d_left_hand_side_key that resolves to the dimension table's identifier.

**dim_salary**

| id | salary_label | salary_category |
| --- | --- | --- |
| REQU-0001 | Salary Label 01 | Salary Category 01 |
| REQU-0002 | Salary Label 02 | Salary Category 02 |
| REQU-0003 | Salary Label 03 | Salary Category 03 |
| REQU-0004 | Salary Label 04 | Salary Category 04 |
| REQU-0005 | Salary Label 05 | Salary Category 05 |
| REQU-0006 | Salary Label 06 | Salary Category 06 |
| REQU-0007 | Salary Label 07 | Salary Category 07 |

**dim_f_d_left_hand_side**

| id | f_d_left_hand_side_label | f_d_left_hand_side_category |
| --- | --- | --- |
| LHS-0001 | F D Left Hand Side Label 01 | F D Left Hand Side Category 01 |
| LHS-0002 | F D Left Hand Side Label 02 | F D Left Hand Side Category 02 |
| LHS-0003 | F D Left Hand Side Label 03 | F D Left Hand Side Category 03 |
| LHS-0004 | F D Left Hand Side Label 04 | F D Left Hand Side Category 04 |
| LHS-0005 | F D Left Hand Side Label 05 | F D Left Hand Side Category 05 |
| LHS-0006 | F D Left Hand Side Label 06 | F D Left Hand Side Category 06 |

**t_bpf_helper_subclass**

| id | bpf | b_p_f_helper_function |
| --- | --- | --- |
| HELP-0001 | xdp_router_v4 | perf_cpu_idle |
| HELP-0002 | perf_cpu_idle | bpf_get_current_pid_tgid |
| HELP-0003 | bpf_skb_change_head | bpf_perf_event_output |
| HELP-0004 | bpf_redirect | tc_ingress_filter |
| HELP-0005 | bpf_map_lookup_elem | bpf_probe_read |
| HELP-0006 | bpf_skb_change_head | bpf_redirect |
| HELP-0007 | bpf_perf_event_output | bpf_probe_read |

Attributes and their types define the shape of the metadata that can be attached to each entity. The attribute definition table maps an attr_name—such as checksum, created_date, identifier, or license—to an attr_type that specifies the expected data format, including xsd:string for free-form text, xsd:date for calendar dates, and cco:DesignativeICE for structured designative values. Because attributes are typed, their values are stored in separate value tables keyed by data type: date values like 2024-01-27, 2025-05-03, 2023-03-14, and 2025-02-18 reside in the date value table; integer values such as 475, 7, 134, and 6 in the integer value table; and string values including 9d2b7a16, urn:uuid:9f2a, Apache-2.0, and on-prem-dc1 in the varchar value table. Each value row carries an attr_id that resolves to the attribute definition, an entity_id that resolves to the BPF helper subclass record, and a value column that holds the misc data—the actual content. This normalization allows a single entity like HELP-0001 to carry multiple heterogeneous attributes without requiring a fixed schema.

**t_bpf_helper_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| HELP-0001 | checksum | xsd:string |
| HELP-0002 | created_date | xsd:date |
| HELP-0003 | identifier | cco:DesignativeICE |
| HELP-0004 | license | xsd:string |
| HELP-0005 | mime_type | xsd:string |
| HELP-0006 | size_bytes | xsd:long |
| HELP-0007 | uri | xsd:string |
| HELP-0008 | version | xsd:integer |

**t_bpf_helper_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| HELP-0001 | HELP-0001 | HELP-0002 | 2024-01-27 |
| HELP-0002 | HELP-0002 | HELP-0002 | 2025-05-03 |
| HELP-0003 | HELP-0003 | HELP-0002 | 2023-03-14 |
| HELP-0004 | HELP-0004 | HELP-0002 | 2025-02-18 |
| HELP-0005 | HELP-0005 | HELP-0002 | 2024-07-06 |
| HELP-0006 | HELP-0006 | HELP-0002 | 2023-07-25 |
| HELP-0007 | HELP-0007 | HELP-0002 | 2024-02-22 |

**t_bpf_helper_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| HELP-0001 | HELP-0001 | HELP-0006 | 475 |
| HELP-0002 | HELP-0001 | HELP-0008 | 7 |
| HELP-0003 | HELP-0002 | HELP-0006 | 134 |
| HELP-0004 | HELP-0002 | HELP-0008 | 6 |
| HELP-0005 | HELP-0003 | HELP-0006 | 422 |
| HELP-0006 | HELP-0003 | HELP-0008 | 7 |
| HELP-0007 | HELP-0004 | HELP-0006 | 484 |
| HELP-0008 | HELP-0004 | HELP-0008 | 3 |

**t_bpf_helper_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| HELP-0001 | HELP-0001 | HELP-0001 | 9d2b7a16 |
| HELP-0002 | HELP-0001 | HELP-0003 | urn:uuid:9f2a |
| HELP-0003 | HELP-0001 | HELP-0004 | Apache-2.0 |
| HELP-0004 | HELP-0001 | HELP-0009 | on-prem-dc1 |
| HELP-0005 | HELP-0001 | HELP-0005 | application/parquet |
| HELP-0006 | HELP-0001 | HELP-0010 | Name 06 |
| HELP-0007 | HELP-0001 | HELP-0011 | governance |
| HELP-0008 | HELP-0001 | HELP-0012 | Tags 08 |

The salary and functional left-hand-side domains illustrate how measured quantities are tracked alongside quality indicators. Each fact_salary record carries a salary_key that links to a dimension record providing a human-readable salary_label and a salary_category, while also recording a numeric value, a confidence score, and an uncertainty figure. Confidence values range from 0.077 for REQU-0001 to 0.982 for REQU-0004, reflecting the model's or analyst's degree of certainty in the measurement; uncertainty values, expressed in absolute units, span from 60.14 for REQU-0001 to 883.10 for REQU-0003. The corresponding fact_functional table follows the same pattern for the f_d_left_hand_side domain, with keys such as LHS-0006 and LHS-0002 linking to dimension records that supply labels and categories, and with confidence values like 0.516 and 0.950 paired against uncertainty figures ranging from 187.13 to 994.01. The value column in both fact tables holds the primary measurement—3.89, 226.77, 851.90, and 876.17 in the salary domain; 163.64, 234.79, 139.46, and 896.76 in the functional domain.

**fact_salary**

| id | salary_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| REQU-0001 | REQU-0004 | 0.077 | 60.14 | 3.89 |
| REQU-0002 | REQU-0007 | 0.644 | 75.00 | 226.77 |
| REQU-0003 | REQU-0004 | 0.791 | 883.10 | 851.90 |
| REQU-0004 | REQU-0005 | 0.982 | 701.98 | 876.17 |

**fact_functional**

| id | f_d_left_hand_side_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| LHS-0001 | LHS-0006 | 0.516 | 249.67 | 163.64 |
| LHS-0002 | LHS-0002 | 0.130 | 197.20 | 234.79 |
| LHS-0003 | LHS-0006 | 0.117 | 994.01 | 139.46 |
| LHS-0004 | LHS-0001 | 0.950 | 187.13 | 896.76 |
| LHS-0005 | LHS-0003 | 0.902 | 938.45 | 27.14 |
| LHS-0006 | LHS-0002 | 0.388 | 256.27 | 476.93 |
| LHS-0007 | LHS-0001 | 0.665 | 479.74 | 169.53 |

Categories provide the classification layer that groups entities and measurements into meaningful buckets for reporting and analysis. In the salary dimension, salary_category values such as Salary Category 01 through Salary Category 04 partition the salary records into distinct groups, while the functional left-hand-side dimension uses f_d_left_hand_side_category values like F D Left Hand Side Category 01 through F D Left Hand Side Category 04 for the same purpose. These categorical labels sit alongside the descriptive labels—Salary Label 01, F D Left Hand Side Label 01, and so on—to give analysts both a machine-readable grouping and a human-readable description. Together with the confidence and uncertainty metrics in the fact tables, categories enable filtered analysis: one can isolate all salary records in Salary Category 02, examine their confidence distribution, and weigh the associated uncertainty to determine whether the measurements are reliable enough for downstream decisions.