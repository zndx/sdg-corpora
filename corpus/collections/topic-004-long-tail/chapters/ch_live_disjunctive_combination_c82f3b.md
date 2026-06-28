---
chapter_id: ch_live_disjunctive_combination_c82f3b
topic_id: 4
family: 07_long_tail
cited_terms: ['disjunctive_combination', 'material_density_specification', 'policy_basic']
model: engine-refine
---

In material specification and policy governance systems, the foundational challenge is representing heterogeneous, extensible metadata about physical materials and compliance rules without hard-coding a rigid schema. The solution employs an entity-attribute-value architecture where each entity—whether a material density specification, a disjunctive combination rule, or a policy baseline—is identified by a stable surrogate key and described through a dynamic set of attributes whose types are declared separately from their values. Material density specifications such as Monocrystalline Silicon, 316 Stainless Steel, High-Density Polyethylene, and Aerogel Composite each carry a unique identifier like SPEC-0001 or SPEC-0002, while disjunctive combinations—used to express union or filter logic across policy rules—are identified by keys such as COMB-0001 and COMB-0002 and classified by patterns like Schema_validation_union or OR_filter_rule. Policies themselves, including Privacy Compliance Policy, Access Control Policy, Acceptable Use Policy, and Security Baseline Policy, are similarly keyed (POLI-0001 through POLI-0004) and serve as the semantic anchors to which attributes and values are attached.

**t_disjunctive_combination**

| id | disjunctive | disjunctively_combines |
| --- | --- | --- |
| COMB-0001 | Schema_validation_union | POLI-0006 |
| COMB-0002 | OR_filter_rule | POLI-0002 |
| COMB-0003 | OR_filter_rule | POLI-0007 |
| COMB-0004 | Schema_validation_union | POLI-0005 |
| COMB-0005 | Metric_aggregation_branch | POLI-0006 |
| COMB-0006 | Compliance_check_union | POLI-0001 |

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

**t_material_density_specification**

| id | material_density_specification |
| --- | --- |
| SPEC-0001 | Monocrystalline Silicon |
| SPEC-0002 | 316 Stainless Steel |
| SPEC-0003 | High-Density Polyethylene |
| SPEC-0004 | Aerogel Composite |
| SPEC-0005 | Titanium Grade 5 |
| SPEC-0006 | Polyethylene Terephthalate |
| SPEC-0007 | CFRP |
| SPEC-0008 | Aerospace Grade Aluminum |

**t_material_density_specification_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SPEC-0001 | confidence | xsd:decimal |
| SPEC-0002 | dimension_kind | xsd:string |
| SPEC-0003 | method | xsd:string |
| SPEC-0004 | recorded_at | xsd:dateTime |
| SPEC-0005 | uncertainty | xsd:decimal |
| SPEC-0006 | unit | xsd:string |
| SPEC-0007 | value | xsd:decimal |
| SPEC-0008 | encoding | xsd:string |

**t_material_density_specification_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SPEC-0001 | SPEC-0001 | SPEC-0004 | 2023-09-01T16:18:03 |
| SPEC-0002 | SPEC-0002 | SPEC-0004 | 2024-08-02T02:03:27 |
| SPEC-0003 | SPEC-0003 | SPEC-0004 | 2024-12-26T11:45:06 |
| SPEC-0004 | SPEC-0004 | SPEC-0004 | 2025-05-04T17:35:25 |
| SPEC-0005 | SPEC-0005 | SPEC-0004 | 2024-11-11T19:06:53 |
| SPEC-0006 | SPEC-0006 | SPEC-0004 | 2024-02-29T08:13:20 |
| SPEC-0007 | SPEC-0007 | SPEC-0004 | 2023-02-28T18:42:10 |
| SPEC-0008 | SPEC-0008 | SPEC-0004 | 2023-07-14T09:35:28 |

**t_material_density_specification_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SPEC-0001 | SPEC-0001 | SPEC-0001 | 0.346 |
| SPEC-0002 | SPEC-0001 | SPEC-0005 | 525.66 |
| SPEC-0003 | SPEC-0001 | SPEC-0007 | 299.45 |
| SPEC-0004 | SPEC-0002 | SPEC-0001 | 0.826 |
| SPEC-0005 | SPEC-0002 | SPEC-0005 | 839.98 |
| SPEC-0006 | SPEC-0002 | SPEC-0007 | 704.76 |
| SPEC-0007 | SPEC-0003 | SPEC-0001 | 0.814 |
| SPEC-0008 | SPEC-0003 | SPEC-0005 | 216.55 |

**t_material_density_specification_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SPEC-0001 | SPEC-0001 | SPEC-0002 | Dimension Kind 01 |
| SPEC-0002 | SPEC-0001 | SPEC-0008 | Encoding 02 |
| SPEC-0003 | SPEC-0001 | SPEC-0009 | change rationale |
| SPEC-0004 | SPEC-0001 | SPEC-0010 | ja |
| SPEC-0005 | SPEC-0001 | SPEC-0003 | automated |
| SPEC-0006 | SPEC-0001 | SPEC-0006 | m/s |
| SPEC-0007 | SPEC-0002 | SPEC-0002 | Dimension Kind 07 |
| SPEC-0008 | SPEC-0002 | SPEC-0008 | Encoding 08 |

**t_policy_basic**

| id | policy |
| --- | --- |
| POLI-0001 | Privacy Compliance Policy |
| POLI-0002 | Access Control Policy |
| POLI-0003 | Acceptable Use Policy |
| POLI-0004 | Security Baseline Policy |
| POLI-0005 | Data Sharing Policy |
| POLI-0006 | Data Retention Policy |
| POLI-0007 | Security Baseline Policy |

**t_policy_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| POLI-0001 | effective_date | xsd:date |
| POLI-0002 | enforcement | xsd:string |
| POLI-0003 | mandatory | xsd:boolean |
| POLI-0004 | priority | xsd:integer |
| POLI-0005 | review_cycle_days | xsd:integer |
| POLI-0006 | scope | xsd:string |
| POLI-0007 | encoding | xsd:string |
| POLI-0008 | label_text | xsd:string |

**t_policy_basic_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0003 | false |
| POLI-0002 | POLI-0002 | POLI-0003 | true |
| POLI-0003 | POLI-0003 | POLI-0003 | false |
| POLI-0004 | POLI-0004 | POLI-0003 | false |
| POLI-0005 | POLI-0005 | POLI-0003 | true |
| POLI-0006 | POLI-0006 | POLI-0003 | true |
| POLI-0007 | POLI-0007 | POLI-0003 | false |

**t_policy_basic_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0001 | 2025-05-22 |
| POLI-0002 | POLI-0002 | POLI-0001 | 2023-08-24 |
| POLI-0003 | POLI-0003 | POLI-0001 | 2025-01-30 |
| POLI-0004 | POLI-0004 | POLI-0001 | 2025-06-16 |
| POLI-0005 | POLI-0005 | POLI-0001 | 2023-11-15 |
| POLI-0006 | POLI-0006 | POLI-0001 | 2023-07-13 |
| POLI-0007 | POLI-0007 | POLI-0001 | 2023-02-02 |

**t_policy_basic_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0004 | 2 |
| POLI-0002 | POLI-0001 | POLI-0005 | 409 |
| POLI-0003 | POLI-0002 | POLI-0004 | 3 |
| POLI-0004 | POLI-0002 | POLI-0005 | 74 |
| POLI-0005 | POLI-0003 | POLI-0004 | 3 |
| POLI-0006 | POLI-0003 | POLI-0005 | 787 |
| POLI-0007 | POLI-0004 | POLI-0004 | 3 |
| POLI-0008 | POLI-0004 | POLI-0005 | 65 |

**t_policy_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0007 | Encoding 01 |
| POLI-0002 | POLI-0001 | POLI-0002 | Enforcement 02 |
| POLI-0003 | POLI-0001 | POLI-0008 | calibration record |
| POLI-0004 | POLI-0001 | POLI-0009 | en |
| POLI-0005 | POLI-0001 | POLI-0006 | Scope 05 |
| POLI-0006 | POLI-0002 | POLI-0007 | Encoding 06 |
| POLI-0007 | POLI-0002 | POLI-0002 | Enforcement 07 |
| POLI-0008 | POLI-0002 | POLI-0008 | intake form |

Attribute definitions are captured in a dedicated registry that pairs a human-readable attribute name with an XML Schema datatype, ensuring type safety across the value store. For material density specifications, the attribute registry declares properties such as confidence (xsd:decimal), dimension_kind (xsd:string), method (xsd:string), and recorded_at (xsd:dateTime). Disjunctive combinations share the same attribute vocabulary—confidence, dimension_kind, method, recorded_at—indicating a shared metadata layer across entity types. Policies, by contrast, define a different attribute set: effective_date (xsd:date), enforcement (xsd:string), mandatory (xsd:boolean), and priority (xsd:integer). This separation of attribute schema from value storage allows the system to evolve its metadata model without schema migrations on the value tables themselves.

Values are materialized in type-specific tables that link an entity to an attribute through foreign keys and store the actual data in a single value column. The entity_id column in each value table references the primary key of the corresponding entity table, while attr_id points to the attribute definition in the attribute registry. For decimal-valued attributes, a table such as t_disjunctive_combination_val_decimal stores entries like entity COMB-0001 with attribute COMB-0001 holding the value 0.084, or entity COMB-0001 with attribute COMB-0005 holding 689.68. String-valued attributes reside in a varchar value table, where entity COMB-0001 might carry attribute COMB-0002 with the value Dimension Kind 01, or attribute COMB-0009 with calibration record. Datetime attributes are stored in their own value table, with entity COMB-0001 recording attribute COMB-0004 as 2023-12-19T10:56:22, and entity COMB-0002 recording the same attribute as 2025-06-13T05:31:45.

The same EAV pattern applies uniformly to material density specifications and policies. A material density specification entity SPEC-0001 might have a decimal attribute value of 0.346, a string attribute of Dimension Kind 01, and a recorded_at timestamp of 2023-09-01T16:18:03, all linked through their respective entity_id and attr_id foreign keys. Policy entities follow the same structure but with type-appropriate values: the Privacy Compliance Policy (POLI-0001) has an effective_date of 2025-05-22, a mandatory flag of false, and a priority of 2, while the Access Control Policy (POLI-0002) carries a mandatory flag of true and a priority of 74. This uniformity across entity types means that query patterns, indexing strategies, and access controls can be applied consistently regardless of whether the underlying entity is a physical material, a logical rule combination, or a governance policy.