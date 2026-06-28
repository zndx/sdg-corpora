---
chapter_id: ch_live_gdpr_article_subclass_0bfc76
topic_id: 186
family: 07_long_tail
cited_terms: ['gdpr_article_subclass', 'quantum_computer', 'program_with_entry_exactly_one']
model: engine-refine
---

Identifiers serve as the immutable backbone of any relational data model, providing the stable reference points that enable cross-table joins, audit trails, and referential integrity. In practice, identifiers follow predictable naming conventions that encode both type and sequence: regulatory subclass records carry identifiers such as ARTI-0001 through ARTI-0004, component records use the COMP-0001 through COMP-0004 prefix, and program entries are distinguished by the ONE-0001 through ONE-0004 scheme. Beyond these synthetic keys, business identifiers also appear in operational contexts — the ARN:res/41 resource identifier is shared across multiple program entries (inventory_sync and nightly_etl), while ref-8842 serves as a distinct reference for a health_check program. The presence of both synthetic and business identifiers within the same ecosystem reflects a common pattern: surrogate keys guarantee uniqueness and stability for internal joins, while business identifiers preserve traceability to external systems and human-readable references.

Classification and descriptive metadata are captured through category and misc attributes, which sit alongside identifiers in dimension tables to provide the contextual scaffolding that turns raw keys into meaningful entities. The part_of dimension, for instance, assigns each component a part_of_category — Part Of Category 01 through Part Of Category 04 — and a corresponding part_of_label such as Part Of Label 01 or Part Of Label 04. These labels function as human-readable descriptors that complement the machine-stable category codes, enabling both programmatic filtering and manual review. In regulatory contexts, similar classification logic appears in the gdpr column of the subclass table, where entries are tagged as Brazilian LGPD or Canadian PIPEDA, and in the gdpr_article column, which further refines classification to Australian Privacy Act, Japanese APPI, Brazilian LGPD, or Article 9. The separation of category from label mirrors a broader design principle: structured codes drive automated logic, while free-form labels support human consumption.

**t_gdpr_article_subclass**

| id | gdpr |
| --- | --- |
| ARTI-0001 | Brazilian LGPD |
| ARTI-0002 | Canadian PIPEDA |
| ARTI-0003 | Brazilian LGPD |
| ARTI-0004 | Canadian PIPEDA |
| ARTI-0005 | Canadian PIPEDA |
| ARTI-0006 | General Data Protection Regulation |
| ARTI-0007 | Article 6 |
| ARTI-0008 | Swiss FADP |

**t_gdpr_article_subclass_gdpr_article**

| id | gdpr_article |
| --- | --- |
| ARTI-0001 | Australian Privacy Act |
| ARTI-0002 | Japanese APPI |
| ARTI-0003 | Brazilian LGPD |
| ARTI-0004 | Article 9 |
| ARTI-0005 | ePrivacy Directive |
| ARTI-0006 | Canadian PIPEDA |

**dim_part_of**

| id | part_of_label | part_of_category |
| --- | --- | --- |
| COMP-0001 | Part Of Label 01 | Part Of Category 01 |
| COMP-0002 | Part Of Label 02 | Part Of Category 02 |
| COMP-0003 | Part Of Label 03 | Part Of Category 03 |
| COMP-0004 | Part Of Label 04 | Part Of Category 04 |
| COMP-0005 | Part Of Label 05 | Part Of Category 05 |
| COMP-0006 | Part Of Label 06 | Part Of Category 06 |

Event count introduces the quantitative dimension that transforms descriptive data into measurable facts. The fact table records event counts such as 446, 75, 224, and 467, each associated with a specific component identifier and linked to a parent through the part_of relationship. These counts represent the operational pulse of the system — the number of events processed, failures encountered, or transactions completed within a given scope. The magnitude of variation across records (from 75 to 467) underscores that event counts are not uniform or synthetic; they reflect real operational activity and are suitable for aggregation, trend analysis, and threshold-based alerting. When joined with the dimension tables, event counts become attributable to specific categories, labels, and parent components, enabling drill-down analysis from aggregate totals to individual component behavior.

**fact_quantum**

| id | part_of_key | event_count |
| --- | --- | --- |
| COMP-0001 | COMP-0001 | 446 |
| COMP-0002 | COMP-0004 | 75 |
| COMP-0003 | COMP-0005 | 224 |
| COMP-0004 | COMP-0001 | 467 |
| COMP-0005 | COMP-0002 | 463 |
| COMP-0006 | COMP-0001 | 52 |
| COMP-0007 | COMP-0001 | 434 |
| COMP-0008 | COMP-0002 | 284 |

The part_of relationship establishes hierarchical structure, allowing individual records to be grouped under parent entities for roll-up reporting and scoped analysis. In the fact table, the part_of_key column references parent identifiers — COMP-0001, COMP-0004, and COMP-0005 — creating a tree where leaf-level events can be aggregated upward. For example, COMP-0001 appears both as a standalone component identifier and as a parent key, indicating that it may contain child records while also carrying its own event count of 446. This dual role is common in hierarchical models: a node can simultaneously be a container for sub-elements and a subject of measurement in its own right. The dimension table provides the human-readable labels and category codes for each level of the hierarchy, ensuring that aggregated views remain interpretable.

Role, subject, and target form a triad that captures the semantics of relationships between entities, particularly in contexts where the nature of the connection matters as much as the connection itself. The junction table linking GDPR article subclasses to articles uses subject (gdpr_id) and target (gdpr_article_id) to define the directionality of the relationship, while role specifies the nature of the association — observer, contributor, or owner. For instance, ARTI-0007 appears as a subject in two separate rows, both targeting ARTI-0005, but with different roles (observer in both cases), while ARTI-0004 serves as a subject targeting ARTI-0006 with the role of owner. This three-column pattern — subject, target, role — is a standard approach for modeling n-ary relationships where the same pair of entities can participate in multiple distinct relationships. It enables queries that ask not just "which articles are linked to which subclasses" but "in what capacity" those links exist.

**t_gdpr_article_subclass__gdpr_article**

| id | gdpr_id | gdpr_article_id | role |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0005 | ARTI-0005 | observer |
| ARTI-0002 | ARTI-0007 | ARTI-0005 | contributor |
| ARTI-0003 | ARTI-0007 | ARTI-0005 | observer |
| ARTI-0004 | ARTI-0004 | ARTI-0006 | owner |
| ARTI-0005 | ARTI-0001 | ARTI-0002 | owner |
| ARTI-0006 | ARTI-0004 | ARTI-0003 | reviewer |
| ARTI-0007 | ARTI-0006 | ARTI-0002 | observer |
| ARTI-0008 | ARTI-0005 | ARTI-0006 | contributor |

Version provides lifecycle management for programs and configurations, tracking iterations over time and enabling reproducibility. The program table records versions such as 12, 3, 8, and 11, each associated with a specific program name (inventory_sync, nightly_etl, health_check), an entry point (api_gateway, main.py, cron_trigger), and a business identifier. The fact that inventory_sync appears with two different versions (12 and 3) and two different entry points (api_gateway and main.py) illustrates that versioning is not merely a numeric counter but a composite attribute that, together with program name and entry point, uniquely identifies a deployment state. This structure supports rollback, audit, and compliance requirements by preserving the exact configuration that was in effect at any given point, while the version number itself provides a quick mechanism for comparing states and determining which iteration is current.

**t_program_with_entry_exactly_one**

| id | program | entry_point | identifier | version |
| --- | --- | --- | --- | --- |
| ONE-0001 | inventory_sync | api_gateway | ARN:res/41 | 12 |
| ONE-0002 | inventory_sync | main.py | ARN:res/41 | 3 |
| ONE-0003 | nightly_etl | api_gateway | ARN:res/41 | 8 |
| ONE-0004 | health_check | cron_trigger | ref-8842 | 11 |
| ONE-0005 | health_check | api_gateway | doi:10.1109/x | 9 |
| ONE-0006 | nightly_etl | command_line | urn:uuid:9f2a | 7 |
| ONE-0007 | health_check | start_service | urn:uuid:9f2a | 1 |