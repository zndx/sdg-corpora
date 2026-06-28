---
chapter_id: ch_live_control_with_classification_tier_da0831
topic_id: 47
family: 03_directive_governance
cited_terms: ['control_with_classification_tier', 'evidence_with_mass_function', 'table_topic_tag']
model: engine-refine
---

Within a governance framework that classifies and evaluates controls, identifiers serve as the immutable anchors of every record, each bearing a structured prefix that signals its domain—TIER-0001 through TIER-0004 for control definitions, FUNC-0001 through FUNC-0004 for evidence entries, and TAG-0001 through TAG-0005 for table topics. These identifiers do not merely label; they encode the referential intent of the system, enabling foreign-key joins that bind attributes to their parent controls, entities to their assigned values, and facts to their topical categories. A control such as "Input sanitization" (TIER-0001) is not a free-text description but a keyed entity whose properties—effective date, enforcement status, mandatory flag, priority level—are resolved through a normalized attribute schema. The attribute definitions themselves carry type information: dates conform to `xsd:date`, booleans to `xsd:boolean`, integers to `xsd:integer`, and strings to `xsd:string`, ensuring that value validation occurs at the schema layer rather than in application logic.

**t_control_with_classification_tier**

| id | control |
| --- | --- |
| TIER-0001 | Input sanitization |
| TIER-0002 | Role based access |
| TIER-0003 | Encryption at rest |
| TIER-0004 | Session expiration |
| TIER-0005 | Firewall rule set |
| TIER-0006 | Encryption at rest |

**t_control_with_classification_tier_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| TIER-0001 | effective_date | xsd:date |
| TIER-0002 | enforcement | xsd:string |
| TIER-0003 | mandatory | xsd:boolean |
| TIER-0004 | priority | xsd:integer |
| TIER-0005 | review_cycle_days | xsd:integer |
| TIER-0006 | scope | xsd:string |
| TIER-0007 | encoding | xsd:string |
| TIER-0008 | label_text | xsd:string |

**t_control_with_classification_tier_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0001 | TIER-0003 | false |
| TIER-0002 | TIER-0002 | TIER-0003 | true |
| TIER-0003 | TIER-0003 | TIER-0003 | true |
| TIER-0004 | TIER-0004 | TIER-0003 | true |
| TIER-0005 | TIER-0005 | TIER-0003 | true |
| TIER-0006 | TIER-0006 | TIER-0003 | false |

**t_control_with_classification_tier_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0001 | TIER-0001 | 2023-02-10 |
| TIER-0002 | TIER-0002 | TIER-0001 | 2023-09-02 |
| TIER-0003 | TIER-0003 | TIER-0001 | 2024-01-29 |
| TIER-0004 | TIER-0004 | TIER-0001 | 2024-02-25 |
| TIER-0005 | TIER-0005 | TIER-0001 | 2025-05-01 |
| TIER-0006 | TIER-0006 | TIER-0001 | 2023-03-16 |

**t_control_with_classification_tier_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0001 | TIER-0004 | 2 |
| TIER-0002 | TIER-0001 | TIER-0005 | 715 |
| TIER-0003 | TIER-0002 | TIER-0004 | 4 |
| TIER-0004 | TIER-0002 | TIER-0005 | 86 |
| TIER-0005 | TIER-0003 | TIER-0004 | 1 |
| TIER-0006 | TIER-0003 | TIER-0005 | 78 |
| TIER-0007 | TIER-0004 | TIER-0004 | 5 |
| TIER-0008 | TIER-0004 | TIER-0005 | 174 |

**t_control_with_classification_tier_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0001 | TIER-0007 | Encoding 01 |
| TIER-0002 | TIER-0001 | TIER-0002 | Enforcement 02 |
| TIER-0003 | TIER-0001 | TIER-0008 | audit excerpt |
| TIER-0004 | TIER-0001 | TIER-0009 | en |
| TIER-0005 | TIER-0001 | TIER-0006 | Scope 05 |
| TIER-0006 | TIER-0002 | TIER-0007 | Encoding 06 |
| TIER-0007 | TIER-0002 | TIER-0002 | Enforcement 07 |
| TIER-0008 | TIER-0002 | TIER-0008 | change rationale |

The attribute-value relationship is materialized through a family of typed value tables, each dedicated to a single data type and linked by a composite key of entity and attribute identifiers. Boolean attributes such as "mandatory" resolve to values of `true` or `false` across entities TIER-0001 through TIER-0004; date attributes such as "effective_date" carry concrete timestamps like 2023-02-10 and 2024-02-25; integer attributes such as "priority" hold magnitudes ranging from 2 to 86; and string attributes capture free-form content including "audit excerpt" and "Encoding 01". This type-disaggregated design eliminates null-handling ambiguity and enforces type safety at query time, at the cost of schema breadth. The entity identifier in each value table denotes the control to which the attribute applies, while the attribute identifier resolves to a definition in the attribute catalog, forming a classic entity-attribute-value pattern that is partitioned by type for performance and correctness.

Evidence records introduce a second classification axis, one that ties observational data to mass functions and dimensional contexts. Each evidence entry—whether a "provenance trace log," a "calibration certificate," a "telemetry dump," or "signal capture data"—is associated with a mass function reference (TIER-0001, TIER-0004, TIER-0006) and a dimension kind such as "pressure," "temperature," or "mass." The method of evidence acquisition is explicitly recorded as "automated," "inferred," or "hybrid," providing a provenance signal that downstream consumers can use to weight the evidence appropriately. This triad of mass function, dimension kind, and method constitutes the evidentiary metadata, and it is the bridge between raw observational data and the confidence scores that appear in the fact table.

**t_evidence_with_mass_function**

| id | evidence | mass_function | dimension_kind | method |
| --- | --- | --- | --- | --- |
| FUNC-0001 | provenance trace log | TIER-0001 | pressure | automated |
| FUNC-0002 | calibration certificate | TIER-0006 | temperature | automated |
| FUNC-0003 | telemetry dump | TIER-0004 | mass | inferred |
| FUNC-0004 | signal capture data | TIER-0006 | mass | hybrid |
| FUNC-0005 | system event record | TIER-0005 | length | automated |

The fact table is the analytical core, where classification decisions are materialized as numeric values accompanied by confidence and uncertainty measures. Each fact is keyed to a table topic through a topic key—TAG-0001 appearing in multiple rows indicates that a single topic can accumulate multiple observations, each with its own confidence and uncertainty profile. Confidence values range from 0.140 to 0.874, representing the system's assessed certainty in the classification, while uncertainty values span from 289.58 to 899.39, quantifying the dispersion or noise inherent in the measurement. The value column holds the classified result itself—608.50, 639.23, 470.53, 720.41—while the table topic dimension provides the categorical label and category for each topic key, enabling aggregation and drill-down by subject matter.

Table topics themselves are cataloged in a dimension table that assigns each topic key a human-readable label and a category classification. Labels such as "Table Topic Label 01" through "Table Topic Label 04" are paired with categories—"Table Topic Category 01" through "Table Topic Category 04"—forming a simple but effective taxonomy that supports hierarchical roll-up and cross-tabulation. The category field, in particular, is the grouping variable that determines how facts are aggregated in reports and dashboards, and it is the column most likely to be used in WHERE clauses and GROUP BY operations. Together, the identifier, attribute, entity, method, dimension kind, confidence, uncertainty, and category fields form a coherent classification architecture: identifiers provide referential integrity, attributes define the schema, entities are the subjects of classification, methods and dimension kinds describe the provenance of evidence, confidence and uncertainty quantify reliability, and categories organize the results into analyzable groups.

**fact_table**

| id | table_topic_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| TAG-0001 | TAG-0001 | 0.274 | 648.78 | 608.50 |
| TAG-0002 | TAG-0001 | 0.140 | 899.39 | 639.23 |
| TAG-0003 | TAG-0001 | 0.609 | 885.54 | 470.53 |
| TAG-0004 | TAG-0005 | 0.874 | 289.58 | 720.41 |

**dim_table_topic**

| id | table_topic_label | table_topic_category |
| --- | --- | --- |
| TAG-0001 | Table Topic Label 01 | Table Topic Category 01 |
| TAG-0002 | Table Topic Label 02 | Table Topic Category 02 |
| TAG-0003 | Table Topic Label 03 | Table Topic Category 03 |
| TAG-0004 | Table Topic Label 04 | Table Topic Category 04 |
| TAG-0005 | Table Topic Label 05 | Table Topic Category 05 |
| TAG-0006 | Table Topic Label 06 | Table Topic Category 06 |