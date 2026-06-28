---
chapter_id: ch_live_log_with_resource_attribute_8606bf
topic_id: 163
family: 07_long_tail
cited_terms: ['log_with_resource_attribute', 'schemaorg_review_rating', 'clinical_performance_evaluation']
model: engine-refine
---

The foundational architecture of the data model rests upon a disciplined use of identifiers to anchor every entity and relationship across fact and dimension tables. Each record carries a unique identifier—ATTR-0001 through ATTR-0004 for resource attributes, EVAL-0001 through EVAL-0006 for clinical utilization and evaluation records, and RATI-0001 through RATI-0006 for schema.org review and rating entities—providing a stable, machine-readable key that survives label changes and category reassignments. These identifiers serve as the primary linkage mechanism between normalized dimension tables and their corresponding fact tables, ensuring referential integrity without introducing redundancy. The dimension tables themselves, such as `dim_resource_attribute`, `dim_utilizes`, and `dim_evaluates`, store human-readable metadata under the columns misc and category, where misc holds descriptive labels like Resource Attribute Label 01 or Utilizes Label 02, and category provides grouping classifications such as Resource Attribute Category 01 or Evaluates Category 03. This separation of stable identifiers from mutable descriptive attributes is a deliberate governance choice that prevents cascade updates and preserves historical accuracy when labels or categories are revised.

**dim_resource_attribute**

| id | resource_attribute_label | resource_attribute_category |
| --- | --- | --- |
| ATTR-0001 | Resource Attribute Label 01 | Resource Attribute Category 01 |
| ATTR-0002 | Resource Attribute Label 02 | Resource Attribute Category 02 |
| ATTR-0003 | Resource Attribute Label 03 | Resource Attribute Category 03 |
| ATTR-0004 | Resource Attribute Label 04 | Resource Attribute Category 04 |
| ATTR-0005 | Resource Attribute Label 05 | Resource Attribute Category 05 |
| ATTR-0006 | Resource Attribute Label 06 | Resource Attribute Category 06 |

**fact_clinical**

| id | utilizes_key | evaluates_key | event_count |
| --- | --- | --- | --- |
| EVAL-0001 | EVAL-0002 | EVAL-0002 | 306 |
| EVAL-0002 | EVAL-0002 | EVAL-0006 | 371 |
| EVAL-0003 | EVAL-0004 | EVAL-0001 | 304 |
| EVAL-0004 | EVAL-0006 | EVAL-0001 | 206 |
| EVAL-0005 | EVAL-0006 | EVAL-0003 | 268 |
| EVAL-0006 | EVAL-0008 | EVAL-0003 | 303 |

**dim_utilizes**

| id | utilizes_label | utilizes_category |
| --- | --- | --- |
| EVAL-0001 | Utilizes Label 01 | Utilizes Category 01 |
| EVAL-0002 | Utilizes Label 02 | Utilizes Category 02 |
| EVAL-0003 | Utilizes Label 03 | Utilizes Category 03 |
| EVAL-0004 | Utilizes Label 04 | Utilizes Category 04 |
| EVAL-0005 | Utilizes Label 05 | Utilizes Category 05 |
| EVAL-0006 | Utilizes Label 06 | Utilizes Category 06 |
| EVAL-0007 | Utilizes Label 07 | Utilizes Category 07 |
| EVAL-0008 | Utilizes Label 08 | Utilizes Category 08 |

**dim_evaluates**

| id | evaluates_label | evaluates_category |
| --- | --- | --- |
| EVAL-0001 | Evaluates Label 01 | Evaluates Category 01 |
| EVAL-0002 | Evaluates Label 02 | Evaluates Category 02 |
| EVAL-0003 | Evaluates Label 03 | Evaluates Category 03 |
| EVAL-0004 | Evaluates Label 04 | Evaluates Category 04 |
| EVAL-0005 | Evaluates Label 05 | Evaluates Category 05 |
| EVAL-0006 | Evaluates Label 06 | Evaluates Category 06 |

The fact tables `fact_log` and `fact_clinical` capture the measurable, transactional core of the model, each row representing a discrete observation enriched by foreign keys that point to the appropriate dimension records. In `fact_log`, the column size_bytes records the byte-level footprint of a resource attribute version—for instance, the resource attribute identified as ATTR-0001 appears with a size of 913,386,183 bytes at version 6 and again at version 2 with a size of 442,933,768 bytes, illustrating how the same logical attribute can accumulate different storage characteristics across version iterations. The version column itself functions as a temporal marker, distinguishing between successive revisions of a resource attribute and enabling audit trails that track how metadata evolves. In `fact_clinical`, the analogous measure is event_count, which quantifies the number of clinical events associated with a given combination of utilization and evaluation dimensions; values such as 371 events for the pair UTIL-0002/EVAL-0006 and 206 events for UTIL-0006/EVAL-0001 provide a granular view of clinical activity intensity across different evaluation contexts.

**fact_log**

| id | resource_attribute_key | size_bytes | version |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0005 | 913386183 | 6 |
| ATTR-0002 | ATTR-0006 | 303816232 | 7 |
| ATTR-0003 | ATTR-0001 | 758542341 | 7 |
| ATTR-0004 | ATTR-0001 | 442933768 | 2 |

The columns utilizes and evaluates in `fact_clinical` operate as composite foreign keys that establish a many-to-many relationship between clinical facts and their dimensional descriptors. Each fact row references a utilizes_key pointing to a record in `dim_utilizes` and an evaluates_key pointing to a record in `dim_evaluates`, thereby encoding the dual perspective through which a clinical event is both consumed and assessed. The dimension tables `dim_utilizes` and `dim_evaluates` mirror each other structurally, each providing an identifier, a misc label, and a category classification—Utilizes Category 01 through 04 and Evaluates Category 01 through 04 respectively—suggesting a symmetric taxonomy where utilization and evaluation are treated as parallel analytical lenses. This symmetry is not merely aesthetic; it enables cross-tabulation of clinical events by both what is utilized and what is evaluated, supporting queries that answer questions such as which evaluation categories are most frequently associated with a particular utilization category.

The associative table `t_schemaorg_review_rating__review_rating` introduces the concepts of subject, target, and role, which together model a ternary relationship between schema.org entities and their associated review ratings. The subject column holds the identifier of the schema.org entity—RATI-0004, RATI-0006, RATI-0001, or RATI-0005—while the target column holds the identifier of the review rating—RATI-0001, RATI-0007, RATI-0004, or RATI-0003—creating a directed link from entity to rating. The role column disambiguates the nature of this link, taking values such as reviewer or contributor to indicate whether the subject is providing the rating or is the subject of the rating. This design allows a single schema.org entity like iPhone 15 Pro to participate in multiple rating relationships with different roles, and a single rating value like 4.0 average or 9.1 rating to be associated with multiple entities. The underlying dimension tables `t_schemaorg_review_rating` and `t_schemaorg_review_rating_review_rating` store the entity names—Adobe Photoshop, The Great Gatsby, iPhone 15 Pro—and their corresponding rating values, while the associative table provides the relational glue that connects them with semantic precision.

**t_schemaorg_review_rating**

| id | schemaorg |
| --- | --- |
| RATI-0001 | Adobe Photoshop |
| RATI-0002 | The Great Gatsby |
| RATI-0003 | iPhone 15 Pro |
| RATI-0004 | iPhone 15 Pro |
| RATI-0005 | Marriott International |
| RATI-0006 | Marriott International |

**t_schemaorg_review_rating_review_rating**

| id | review_rating |
| --- | --- |
| RATI-0001 | 3.2 points |
| RATI-0002 | 100 percentile |
| RATI-0003 | 9.1 rating |
| RATI-0004 | 4.0 average |
| RATI-0005 | 47 score |
| RATI-0006 | 5.0 scale |
| RATI-0007 | 8.7 out of 10 |
| RATI-0008 | 88 out of 100 |

**t_schemaorg_review_rating__review_rating**

| id | schemaorg_id | review_rating_id | role |
| --- | --- | --- | --- |
| RATI-0001 | RATI-0004 | RATI-0001 | reviewer |
| RATI-0002 | RATI-0006 | RATI-0007 | reviewer |
| RATI-0003 | RATI-0001 | RATI-0004 | contributor |
| RATI-0004 | RATI-0005 | RATI-0003 | reviewer |
| RATI-0005 | RATI-0006 | RATI-0001 | owner |
| RATI-0006 | RATI-0006 | RATI-0007 | owner |
| RATI-0007 | RATI-0001 | RATI-0008 | owner |
| RATI-0008 | RATI-0006 | RATI-0008 | observer |