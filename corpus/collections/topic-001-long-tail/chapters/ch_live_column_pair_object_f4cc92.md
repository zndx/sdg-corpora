---
chapter_id: ch_live_column_pair_object_f4cc92
topic_id: 1
family: 07_long_tail
cited_terms: ['column_pair_object', 'ebpfmap_used_by_program', 'hipaa_safeguard_technical']
model: engine-refine
---

The analytical architecture rests upon a dimensional model that separates descriptive metadata from quantitative measurements, a separation that preserves query performance while enabling flexible aggregation across heterogeneous data domains. Object columns are catalogued in a dimension table that assigns each a stable identifier, a human-readable label, and a categorical classification—values such as `Object Column Label 01` paired with `Object Column Category 01` establish the taxonomy against which all downstream fact records are measured. Similarly, the programs that consume or reference these columns are themselves described through a parallel dimension table, where identifiers like `PROG-0001` resolve to labels such as `Used By Program Label 01` and categories including `Used By Program Category 01`. This dual-dimension structure ensures that every fact record can be traced back to both the structural element it describes and the operational context in which that element is exercised.

**dim_object_column**

| id | object_column_label | object_column_category |
| --- | --- | --- |
| OBJE-0001 | Object Column Label 01 | Object Column Category 01 |
| OBJE-0002 | Object Column Label 02 | Object Column Category 02 |
| OBJE-0003 | Object Column Label 03 | Object Column Category 03 |
| OBJE-0004 | Object Column Label 04 | Object Column Category 04 |
| OBJE-0005 | Object Column Label 05 | Object Column Category 05 |
| OBJE-0006 | Object Column Label 06 | Object Column Category 06 |

**dim_used_by_program**

| id | used_by_program_label | used_by_program_category |
| --- | --- | --- |
| PROG-0001 | Used By Program Label 01 | Used By Program Category 01 |
| PROG-0002 | Used By Program Label 02 | Used By Program Category 02 |
| PROG-0003 | Used By Program Label 03 | Used By Program Category 03 |
| PROG-0004 | Used By Program Label 04 | Used By Program Category 04 |
| PROG-0005 | Used By Program Label 05 | Used By Program Category 05 |
| PROG-0006 | Used By Program Label 06 | Used By Program Category 06 |

Fact tables materialize the quantitative layer, anchoring each measurement to its corresponding dimension through foreign keys. The `fact_column` table records confidence scores and uncertainty bounds for individual object columns, with identifiers such as `OBJE-0001` carrying a confidence of `0.164` and an uncertainty of `560.21`, while `OBJE-0004` exhibits a comparatively higher confidence of `0.354` alongside a tighter uncertainty of `404.01`. Each row also carries a `value`—`257.80` for `OBJE-0001`, `571.55` for `OBJE-0002`—that represents the measured magnitude of the attribute in question. The `fact_ebpfmap` table follows the same pattern but pertains to eBPF map records, where identifiers like `PROG-0001` link to a `used_by_program` foreign key of `PROG-0005`, a `size_bytes` of `208979093`, and a `version` of `3`. The `size_bytes` column captures storage footprint in raw integer form, with values ranging from `31105012` for `PROG-0003` to `354373995` for `PROG-0004`, while the `version` column tracks schema revisions across discrete integers from `3` through `12`.

**fact_column**

| id | object_column_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| OBJE-0001 | OBJE-0006 | 0.164 | 560.21 | 257.80 |
| OBJE-0002 | OBJE-0001 | 0.068 | 744.10 | 571.55 |
| OBJE-0003 | OBJE-0004 | 0.107 | 984.09 | 140.18 |
| OBJE-0004 | OBJE-0002 | 0.354 | 404.01 | 131.27 |
| OBJE-0005 | OBJE-0006 | 0.790 | 109.97 | 235.19 |
| OBJE-0006 | OBJE-0003 | 0.934 | 653.09 | 813.74 |
| OBJE-0007 | OBJE-0004 | 0.938 | 827.04 | 409.13 |
| OBJE-0008 | OBJE-0006 | 0.734 | 419.22 | 492.32 |

**fact_ebpfmap**

| id | used_by_program_key | size_bytes | version |
| --- | --- | --- | --- |
| PROG-0001 | PROG-0005 | 208979093 | 3 |
| PROG-0002 | PROG-0004 | 156714508 | 6 |
| PROG-0003 | PROG-0005 | 31105012 | 12 |
| PROG-0004 | PROG-0002 | 354373995 | 5 |
| PROG-0005 | PROG-0004 | 866267293 | 2 |

The HIPAA safeguard technical records introduce a more complex attribute-value model, where each safeguard is defined once in a core table and then extended through a set of type-specific value tables. The core table, `t_hipaa_safeguard_technical`, assigns each safeguard a unique identifier—`TECH-0001` through `TECH-0004`—and classifies it along two regulatory axes: the applicable HIPAA rule, such as `Transaction Rule` or `Breach Notification Rule`, and the specific safeguard mechanism, including `Intrusion Detection` and `Privacy Rule`. Attribute definitions are stored separately in `t_hipaa_safeguard_technical_attr`, where each attribute carries a name like `effective_date`, `enforcement`, `mandatory`, or `priority`, and a type from the XSD namespace—`xsd:date`, `xsd:string`, `xsd:boolean`, `xsd:integer`—that dictates how its values are stored and validated.

**t_hipaa_safeguard_technical**

| id | hipaa | hipaa_safeguard |
| --- | --- | --- |
| TECH-0001 | Transaction Rule | Intrusion Detection |
| TECH-0002 | Data Backup | Enforcement Rule |
| TECH-0003 | Enforcement Rule | Breach Notification Rule |
| TECH-0004 | Breach Notification Rule | Privacy Rule |
| TECH-0005 | Breach Notification Rule | Transmission Security |
| TECH-0006 | Access Control | Enforcement Rule |

**t_hipaa_safeguard_technical_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| TECH-0001 | effective_date | xsd:date |
| TECH-0002 | enforcement | xsd:string |
| TECH-0003 | mandatory | xsd:boolean |
| TECH-0004 | priority | xsd:integer |
| TECH-0005 | review_cycle_days | xsd:integer |
| TECH-0006 | scope | xsd:string |
| TECH-0007 | encoding | xsd:string |
| TECH-0008 | label_text | xsd:string |

**t_hipaa_safeguard_technical_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TECH-0001 | TECH-0001 | TECH-0003 | true |
| TECH-0002 | TECH-0002 | TECH-0003 | true |
| TECH-0003 | TECH-0003 | TECH-0003 | false |
| TECH-0004 | TECH-0004 | TECH-0003 | false |
| TECH-0005 | TECH-0005 | TECH-0003 | true |
| TECH-0006 | TECH-0006 | TECH-0003 | true |

**t_hipaa_safeguard_technical_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TECH-0001 | TECH-0001 | TECH-0001 | 2025-01-15 |
| TECH-0002 | TECH-0002 | TECH-0001 | 2025-02-09 |
| TECH-0003 | TECH-0003 | TECH-0001 | 2023-08-04 |
| TECH-0004 | TECH-0004 | TECH-0001 | 2024-09-26 |
| TECH-0005 | TECH-0005 | TECH-0001 | 2025-05-30 |
| TECH-0006 | TECH-0006 | TECH-0001 | 2024-11-22 |

**t_hipaa_safeguard_technical_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TECH-0001 | TECH-0001 | TECH-0004 | 2 |
| TECH-0002 | TECH-0001 | TECH-0005 | 620 |
| TECH-0003 | TECH-0002 | TECH-0004 | 3 |
| TECH-0004 | TECH-0002 | TECH-0005 | 784 |
| TECH-0005 | TECH-0003 | TECH-0004 | 3 |
| TECH-0006 | TECH-0003 | TECH-0005 | 568 |
| TECH-0007 | TECH-0004 | TECH-0004 | 1 |
| TECH-0008 | TECH-0004 | TECH-0005 | 831 |

**t_hipaa_safeguard_technical_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TECH-0001 | TECH-0001 | TECH-0007 | Encoding 01 |
| TECH-0002 | TECH-0001 | TECH-0002 | Enforcement 02 |
| TECH-0003 | TECH-0001 | TECH-0008 | change rationale |
| TECH-0004 | TECH-0001 | TECH-0009 | fr |
| TECH-0005 | TECH-0001 | TECH-0006 | Scope 05 |
| TECH-0006 | TECH-0002 | TECH-0007 | Encoding 06 |
| TECH-0007 | TECH-0002 | TECH-0002 | Enforcement 07 |
| TECH-0008 | TECH-0002 | TECH-0008 | intake form |

Value tables partition attribute data by type, each linking back to the core safeguard record through a composite of `entity_id` and `attr_id` foreign keys. The boolean value table stores truth assignments for attributes typed as `xsd:boolean`; for instance, `TECH-0001` and `TECH-0002` both resolve to `true` for attribute `TECH-0003`, while `TECH-0003` and `TECH-0004` resolve to `false`. The date value table holds temporal data for `xsd:date` attributes, with entries such as `2025-01-15` for `TECH-0001` and `2023-08-04` for `TECH-0003`, spanning a range from mid-2023 through early 2025. Integer values are stored in a dedicated table, where `TECH-0001` carries values of `2` and `620` for attributes `TECH-0004` and `TECH-0005` respectively, and `TECH-0002` holds `3` and `784` for the same attributes. The varchar value table captures free-text attributes, with entries ranging from `Encoding 01` and `Enforcement 02` to `change rationale` and `fr`, all associated with attribute identifiers `TECH-0007`, `TECH-0002`, `TECH-0008`, and `TECH-0009`. This type-disaggregated design ensures that each value is stored in its native format, eliminating the need for runtime type coercion and enabling precise indexing strategies per attribute type.