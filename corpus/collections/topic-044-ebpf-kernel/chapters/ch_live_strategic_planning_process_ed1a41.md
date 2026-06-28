---
chapter_id: ch_live_strategic_planning_process_ed1a41
topic_id: 44
family: 08_derived
cited_terms: ['strategic_planning_process', 'gdpr_article_subclass', 'ebpfprogram_writes_to_map']
model: engine-refine
---

Strategic process governance and programmatic compliance both depend on a disciplined taxonomy of identifiers, categories, and event-level measurements that together form the backbone of operational accountability. Every process, regulation, and software artifact is anchored to a unique identifier—PROC-0001 through PROC-0004 for strategic processes, ARTI-0001 through ARTI-0004 for GDPR article subclasses, and MAP-0001 through MAP-0004 for eBPF programs—ensuring that each entity can be referenced unambiguously across analytical queries, audit trails, and cross-system integrations. These identifiers serve as the primary keys of fact tables and the foreign keys of dimension tables, creating a relational scaffold upon which all downstream reporting and compliance validation is constructed. The identifier space is partitioned by domain: process codes, article codes, and map codes never collide, preserving referential integrity while allowing each domain to maintain its own classification hierarchy.

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

Categories provide the analytical dimension that transforms isolated identifiers into structured, queryable knowledge. Business divisions are classified under categories such as Targets Business Division Category 01 and Targets Business Division Category 02, while planning artifacts carry their own categorical labels—Produces Planning Artifact Category 01 through Produces Planning Artifact Category 04—and eBPF map references are similarly classified under Writes To Map Category 01 through Writes To Map Category 04. This categorical layer enables aggregation and drill-down: a compliance officer can roll up event counts across all processes belonging to a given business division category, or a systems engineer can compare program sizes across map categories. The category column is not merely descriptive; it is the mechanism by which heterogeneous entities are grouped for statistical analysis, regulatory reporting, and resource allocation decisions.

**dim_targets_business_division**

| id | targets_business_division_label | targets_business_division_category |
| --- | --- | --- |
| PROC-0001 | Targets Business Division Label 01 | Targets Business Division Category 01 |
| PROC-0002 | Targets Business Division Label 02 | Targets Business Division Category 02 |
| PROC-0003 | Targets Business Division Label 03 | Targets Business Division Category 03 |
| PROC-0004 | Targets Business Division Label 04 | Targets Business Division Category 04 |
| PROC-0005 | Targets Business Division Label 05 | Targets Business Division Category 05 |
| PROC-0006 | Targets Business Division Label 06 | Targets Business Division Category 06 |
| PROC-0007 | Targets Business Division Label 07 | Targets Business Division Category 07 |
| PROC-0008 | Targets Business Division Label 08 | Targets Business Division Category 08 |

**dim_produces_planning_artifact**

| id | produces_planning_artifact_label | produces_planning_artifact_category |
| --- | --- | --- |
| PROC-0001 | Produces Planning Artifact Label 01 | Produces Planning Artifact Category 01 |
| PROC-0002 | Produces Planning Artifact Label 02 | Produces Planning Artifact Category 02 |
| PROC-0003 | Produces Planning Artifact Label 03 | Produces Planning Artifact Category 03 |
| PROC-0004 | Produces Planning Artifact Label 04 | Produces Planning Artifact Category 04 |
| PROC-0005 | Produces Planning Artifact Label 05 | Produces Planning Artifact Category 05 |
| PROC-0006 | Produces Planning Artifact Label 06 | Produces Planning Artifact Category 06 |

**fact_ebpfprogram**

| id | writes_to_map_key | size_bytes | version |
| --- | --- | --- | --- |
| MAP-0001 | MAP-0003 | 784335640 | 12 |
| MAP-0002 | MAP-0005 | 641704069 | 9 |
| MAP-0003 | MAP-0003 | 113209263 | 11 |
| MAP-0004 | MAP-0001 | 161013093 | 12 |
| MAP-0005 | MAP-0002 | 352203820 | 12 |
| MAP-0006 | MAP-0006 | 167519051 | 1 |

**dim_writes_to_map**

| id | writes_to_map_label | writes_to_map_category |
| --- | --- | --- |
| MAP-0001 | Writes To Map Label 01 | Writes To Map Category 01 |
| MAP-0002 | Writes To Map Label 02 | Writes To Map Category 02 |
| MAP-0003 | Writes To Map Label 03 | Writes To Map Category 03 |
| MAP-0004 | Writes To Map Label 04 | Writes To Map Category 04 |
| MAP-0005 | Writes To Map Label 05 | Writes To Map Category 05 |
| MAP-0006 | Writes To Map Label 06 | Writes To Map Category 06 |
| MAP-0007 | Writes To Map Label 07 | Writes To Map Category 07 |

Event counts and byte sizes constitute the quantitative measures that quantify operational activity and resource consumption. Strategic processes generate measurable event volumes—PROC-0001 records 388 events, PROC-0002 records 352, PROC-0003 records 320, and PROC-0004 records 123—providing a direct indicator of process intensity and throughput. In the eBPF domain, program sizes range from 113,209,263 bytes for MAP-0003 to 784,335,640 bytes for MAP-0001, establishing a resource footprint that informs capacity planning and deployment constraints. These measures are stored in fact tables—fact_strategic and fact_ebpfprogram—where they are joined to their respective dimension tables through foreign key relationships. The fact table design ensures that each measurement is traceable to a specific process or program while remaining independent of the descriptive attributes stored in dimensions.

The foreign key relationships between fact and dimension tables implement a star schema that separates measurable events from descriptive context. The fact_strategic table references dim_targets_business_division through the targets_business_division_key column and dim_produces_planning_artifact through the produces_planning_artifact_key column, linking each process record to its business division and planning artifact classifications. Similarly, fact_ebpfprogram references dim_writes_to_map through the writes_to_map_key column, associating each program with its map destination. These foreign keys are the connective tissue of the model: they allow a single query to retrieve a process identifier, its event count, the label and category of its target business division, and the label and category of its produced planning artifact, all in one result set. The dimension tables themselves contain the human-readable labels—Targets Business Division Label 01, Produces Planning Artifact Label 02, Writes To Map Label 03—alongside their categorical classifications, ensuring that reports are both machine-queryable and human-interpretable.

**fact_strategic**

| id | targets_business_division_key | produces_planning_artifact_key | event_count |
| --- | --- | --- | --- |
| PROC-0001 | PROC-0005 | PROC-0005 | 388 |
| PROC-0002 | PROC-0001 | PROC-0002 | 352 |
| PROC-0003 | PROC-0005 | PROC-0002 | 320 |
| PROC-0004 | PROC-0001 | PROC-0001 | 123 |
| PROC-0005 | PROC-0003 | PROC-0003 | 268 |
| PROC-0006 | PROC-0005 | PROC-0004 | 27 |
| PROC-0007 | PROC-0001 | PROC-0004 | 70 |

Version numbers and role assignments add temporal and relational precision to the governance model. eBPF programs carry version identifiers—versions 9, 11, and 12 appear across the dataset—enabling change tracking and rollback procedures. The GDPR article subclass junction table introduces a role column that specifies the nature of the relationship between a GDPR article and its subclass: observer, contributor, or owner. This role attribute transforms a simple many-to-many mapping into a semantically rich relationship, where ARTI-0005 and ARTI-0007 are linked to various articles with distinct responsibilities. The subject and target columns in this junction table define the directionality of the relationship, with gdpr_id representing the subject and gdpr_article_id representing the target, establishing a clear lineage from regulation to implementation.

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

Miscellaneous label columns in the dimension tables—targets_business_division_label, produces_planning_artifact_label, and writes_to_map_label—serve as the human-facing interface to the otherwise machine-oriented identifier space. These labels, such as Targets Business Division Label 01 or Writes To Map Label 04, are the values that appear in dashboards, audit reports, and compliance documentation. They are distinct from categories in that they provide specific instance identification rather than classification, and they are distinct from identifiers in that they are designed for human consumption rather than relational joins. The separation of labels from categories and identifiers follows a well-established dimensional modeling convention: identifiers for joins, categories for aggregation, and labels for presentation. This three-tier labeling strategy ensures that the same underlying data can be rendered appropriately for technical analysts, compliance officers, and executive stakeholders without requiring schema changes or data duplication.