---
chapter_id: ch_live_requirement_applies_to_system_d67cb6
topic_id: 183
family: 03_directive_governance
cited_terms: ['requirement_applies_to_system', 'aggregation_uses_function', 'policy_only_applies_to']
model: engine-refine
---

Governance frameworks rely on a structured attribute model to attach typed metadata to policy requirements and their target systems. Each requirement—such as latency under 50ms, audit logging enabled, encryption at rest, or backup frequency daily—is identified by a unique system identifier like SYST-0001 through SYST-0004 and can carry multiple attributes whose names include effective_date, enforcement, mandatory, and priority. These attributes are not free-form text; each is bound to a strict type from the XSD vocabulary, with effective_date typed as xsd:date, enforcement as xsd:string, mandatory as xsd:boolean, and priority as xsd:integer. This type discipline ensures that downstream consumers of the data can validate, compare, and aggregate values without ambiguity. For instance, the mandatory attribute resolves to a boolean value of true for some systems and false for others, while priority is stored as an integer such as 1, 5, 295, or 391, enabling numeric sorting and threshold-based filtering across the requirement set.

**t_requirement_applies_to_system**

| id | requirement |
| --- | --- |
| SYST-0001 | latency under 50ms |
| SYST-0002 | audit logging enabled |
| SYST-0003 | encryption at rest |
| SYST-0004 | backup frequency daily |
| SYST-0005 | network segmentation mandatory |
| SYST-0006 | network segmentation mandatory |

**t_requirement_applies_to_system_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SYST-0001 | effective_date | xsd:date |
| SYST-0002 | enforcement | xsd:string |
| SYST-0003 | mandatory | xsd:boolean |
| SYST-0004 | priority | xsd:integer |
| SYST-0005 | review_cycle_days | xsd:integer |
| SYST-0006 | scope | xsd:string |
| SYST-0007 | encoding | xsd:string |
| SYST-0008 | label_text | xsd:string |

**t_policy_only_applies_to**

| id | policy | applies_to | effective_date | priority |
| --- | --- | --- | --- | --- |
| APPL-0001 | Privacy Shield Compliance | SYST-0003 | 2023-08-29 | 5 |
| APPL-0002 | Encryption Baseline | SYST-0005 | 2023-11-05 | 5 |
| APPL-0003 | Data Classification Guideline | SYST-0006 | 2023-08-21 | 3 |
| APPL-0004 | Data Classification Guideline | SYST-0003 | 2023-12-18 | 3 |
| APPL-0005 | Data Retention Standard | SYST-0006 | 2024-11-09 | 4 |
| APPL-0006 | Data Classification Guideline | SYST-0003 | 2023-01-13 | 2 |
| APPL-0007 | Vendor Risk Assessment | SYST-0001 | 2025-03-17 | 2 |
| APPL-0008 | Network Segmentation Rule | SYST-0002 | 2024-05-19 | 2 |

The effective_date column anchors each policy application to a point in time, establishing when a requirement becomes enforceable. In the policy application records, effective dates such as 2023-08-29, 2023-11-05, 2023-08-21, and 2023-12-18 define the temporal scope of policies like Privacy Shield Compliance, Encryption Baseline, and Data Classification Guideline. These dates are not merely annotations; they govern the active set of requirements at any given moment and support time-range queries that determine which obligations apply to a system during a specific audit window. The priority column, stored as an integer, works in tandem with effective_date to resolve conflicts when multiple policies apply to the same entity. A priority of 5 indicates a higher-urgency obligation than a priority of 3, allowing automated compliance engines to surface the most critical requirements first.

Entities serve as the target of these requirements and policies, identified by the same system-level identifiers that appear in the requirement definitions. The entity_id column in the value tables links attribute values back to specific systems, creating a many-to-many relationship between requirements and the systems they govern. A single system such as SYST-0001 can carry multiple attribute values across different types: a boolean value of false for the mandatory attribute, a date value of 2025-05-21 for effective_date, and string values like Encoding 01 or Enforcement 02 stored in the miscellaneous varchar column. The misc column accommodates unstructured or semi-structured data that does not fit into the typed attribute model, including values such as audit excerpt and fr, which may represent free-text annotations, language codes, or other contextual metadata.

**t_requirement_applies_to_system_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SYST-0001 | SYST-0001 | SYST-0003 | false |
| SYST-0002 | SYST-0002 | SYST-0003 | true |
| SYST-0003 | SYST-0003 | SYST-0003 | true |
| SYST-0004 | SYST-0004 | SYST-0003 | false |
| SYST-0005 | SYST-0005 | SYST-0003 | true |
| SYST-0006 | SYST-0006 | SYST-0003 | false |

**t_requirement_applies_to_system_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SYST-0001 | SYST-0001 | SYST-0001 | 2025-05-21 |
| SYST-0002 | SYST-0002 | SYST-0001 | 2024-02-21 |
| SYST-0003 | SYST-0003 | SYST-0001 | 2023-05-13 |
| SYST-0004 | SYST-0004 | SYST-0001 | 2023-08-26 |
| SYST-0005 | SYST-0005 | SYST-0001 | 2025-01-01 |
| SYST-0006 | SYST-0006 | SYST-0001 | 2023-04-22 |

**t_requirement_applies_to_system_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SYST-0001 | SYST-0001 | SYST-0004 | 1 |
| SYST-0002 | SYST-0001 | SYST-0005 | 391 |
| SYST-0003 | SYST-0002 | SYST-0004 | 5 |
| SYST-0004 | SYST-0002 | SYST-0005 | 295 |
| SYST-0005 | SYST-0003 | SYST-0004 | 2 |
| SYST-0006 | SYST-0003 | SYST-0005 | 418 |
| SYST-0007 | SYST-0004 | SYST-0004 | 4 |
| SYST-0008 | SYST-0004 | SYST-0005 | 590 |

**t_requirement_applies_to_system_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SYST-0001 | SYST-0001 | SYST-0007 | Encoding 01 |
| SYST-0002 | SYST-0001 | SYST-0002 | Enforcement 02 |
| SYST-0003 | SYST-0001 | SYST-0008 | audit excerpt |
| SYST-0004 | SYST-0001 | SYST-0009 | fr |
| SYST-0005 | SYST-0001 | SYST-0006 | Scope 05 |
| SYST-0006 | SYST-0002 | SYST-0007 | Encoding 06 |
| SYST-0007 | SYST-0002 | SYST-0002 | Enforcement 07 |
| SYST-0008 | SYST-0002 | SYST-0008 | intake form |

The aggregation dimension introduces a parallel structure for evaluating the quality and classification of aggregation functions used in compliance reporting. Each aggregation function is identified by a key such as FUNC-0001 through FUNC-0005 and is associated with a category through a foreign key relationship. Categories are defined in a separate dimension table with names like Category Name 01 through Category Name 04, and the aggregation function dimension itself carries both a human-readable label and a category reference. This two-level categorization allows reports to group aggregation functions by type while preserving their individual identities. The fact table for aggregation ties each function to a numeric value, a confidence score, and an uncertainty measure, forming a quality triad that quantifies the reliability of the underlying data.

**fact_aggregation**

| id | uses_aggregation_function_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| FUNC-0001 | FUNC-0001 | 0.857 | 811.48 | 835.01 |
| FUNC-0002 | FUNC-0004 | 0.688 | 850.83 | 952.80 |
| FUNC-0003 | FUNC-0004 | 0.639 | 844.56 | 52.67 |
| FUNC-0004 | FUNC-0005 | 0.024 | 527.80 | 996.14 |
| FUNC-0005 | FUNC-0002 | 0.062 | 315.40 | 941.21 |

**dim_uses_aggregation_function_category**

| id | category_name |
| --- | --- |
| FUNC-0001 | Category Name 01 |
| FUNC-0002 | Category Name 02 |
| FUNC-0003 | Category Name 03 |
| FUNC-0004 | Category Name 04 |
| FUNC-0005 | Category Name 05 |
| FUNC-0006 | Category Name 06 |

**dim_uses_aggregation_function**

| id | uses_aggregation_function_label | uses_aggregation_function_category | category_id |
| --- | --- | --- | --- |
| FUNC-0001 | Uses Aggregation Function Label 01 | Uses Aggregation Function Category 01 | FUNC-0003 |
| FUNC-0002 | Uses Aggregation Function Label 02 | Uses Aggregation Function Category 02 | FUNC-0003 |
| FUNC-0003 | Uses Aggregation Function Label 03 | Uses Aggregation Function Category 03 | FUNC-0002 |
| FUNC-0004 | Uses Aggregation Function Label 04 | Uses Aggregation Function Category 04 | FUNC-0005 |
| FUNC-0005 | Uses Aggregation Function Label 05 | Uses Aggregation Function Category 05 | FUNC-0006 |
| FUNC-0006 | Uses Aggregation Function Label 06 | Uses Aggregation Function Category 06 | FUNC-0002 |

Confidence and uncertainty are inverse quality indicators that together characterize the trustworthiness of an aggregation result. Confidence values range from 0.024 to 0.857, with higher values indicating greater certainty in the computed result. Uncertainty, measured on a scale from 527.80 to 850.83, represents the absolute margin of error or variance associated with the aggregation. For example, an aggregation function with a confidence of 0.857 and an uncertainty of 811.48 produces a value of 835.01, while another with a confidence of only 0.024 and uncertainty of 527.80 yields a value of 996.14. The low confidence in the latter case signals that the result should be treated with caution, even though the uncertainty value is numerically smaller. These metrics enable compliance officers to weight aggregation results appropriately when generating regulatory reports, flagging low-confidence outputs for manual review.