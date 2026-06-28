---
chapter_id: ch_live_ganglion_cyst_tissue_origin_27e0df
topic_id: 81
family: 08_derived
cited_terms: ['ganglion_cyst_tissue_origin', 'gauge_metric_subclass', 'gdpr_article_subclass']
model: engine-refine
---

At the foundation of any robust data governance framework lies a disciplined approach to entity resolution and relationship mapping, anchored by a unique identifier that persists across systems and lifecycles. These identifiers function as immutable handles, ensuring that clinical observations, regulatory references, and operational metrics can be tracked without ambiguity. For instance, anatomical entities such as a ganglioncysttissueorigin—ranging from the sacroiliac joint to the first dorsal compartment—are assigned stable codes that survive schema migrations and cross-referencing across clinical, regulatory, and infrastructure domains. By decoupling human-readable labels from machine-resolvable keys, organizations maintain referential integrity while enabling flexible, domain-agnostic querying.

**t_ganglion_cyst_tissue_origin**

| id | ganglion_cyst_tissue_origin |
| --- | --- |
| ORIG-0001 | sacroiliac joint |
| ORIG-0002 | metacarpophalangeal joint |
| ORIG-0003 | subacromial bursa |
| ORIG-0004 | first dorsal compartment |
| ORIG-0005 | sacroiliac joint |
| ORIG-0006 | distal radioulnar joint |
| ORIG-0007 | popliteal fossa |
| ORIG-0008 | distal radioulnar joint |

**t_ganglion_cyst_tissue_origin_part_of**

| id | part_of |
| --- | --- |
| ORIG-0001 | periosteal layer |
| ORIG-0002 | joint capsule |
| ORIG-0003 | deep fascia |
| ORIG-0004 | fibrous adventitia |
| ORIG-0005 | periosteal layer |
| ORIG-0006 | periosteal layer |

**t_ganglion_cyst_tissue_origin__part_of**

| id | ganglion_id | part_of_id | role |
| --- | --- | --- | --- |
| ORIG-0001 | ORIG-0007 | ORIG-0001 | reviewer |
| ORIG-0002 | ORIG-0008 | ORIG-0001 | contributor |
| ORIG-0003 | ORIG-0007 | ORIG-0005 | owner |
| ORIG-0004 | ORIG-0002 | ORIG-0006 | owner |
| ORIG-0005 | ORIG-0003 | ORIG-0005 | reviewer |
| ORIG-0006 | ORIG-0008 | ORIG-0006 | observer |
| ORIG-0007 | ORIG-0003 | ORIG-0005 | contributor |
| ORIG-0008 | ORIG-0005 | ORIG-0005 | observer |

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

The true power of this architecture emerges through its relationship model, which explicitly separates the endpoints of a connection from the nature of the connection itself. Every linkage is defined by a subject and a target, bridging two distinct entities, while a role attribute dictates the semantic or functional context of that bridge. In anatomical ontologies, a tissue origin might link to a connectivetissuestructure like a joint capsule or deep fascia, with the role specifying whether the originating entity acts as an owner, contributor, or reviewer within a broader structural hierarchy. This tripartite pattern transforms flat records into a navigable knowledge graph, allowing auditors and analysts to trace lineage, assign accountability, and enforce domain-specific access controls without altering the underlying data.

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

Classification and taxonomic organization are handled through parallel metadata layers that standardize how entities are grouped and labeled. Categories and misc classifications provide high-level segmentation, ensuring that disparate records can be filtered, aggregated, or routed according to organizational policy. Within measurement tracking, this classification extends to the metric kind, which carries both human-readable labels and categorical groupings to unify how performance, storage, or clinical indicators are reported. By enforcing consistent labeling conventions across measurement types, teams eliminate semantic drift and ensure that dashboards, compliance reports, and automated alerts reference the same underlying definitions.

**dim_metric_kind**

| id | metric_kind_label | metric_kind_category |
| --- | --- | --- |
| METR-0001 | Metric Kind Label 01 | Metric Kind Category 01 |
| METR-0002 | Metric Kind Label 02 | Metric Kind Category 02 |
| METR-0003 | Metric Kind Label 03 | Metric Kind Category 03 |
| METR-0004 | Metric Kind Label 04 | Metric Kind Category 04 |
| METR-0005 | Metric Kind Label 05 | Metric Kind Category 05 |
| METR-0006 | Metric Kind Label 06 | Metric Kind Category 06 |
| METR-0007 | Metric Kind Label 07 | Metric Kind Category 07 |

Operational governance is maintained through quantitative and temporal attributes that track the lifecycle and footprint of each record. Size bytes quantifies the storage or payload footprint of a dataset or artifact, enabling capacity planning and cost allocation across environments. Version numbers manage iteration, ensuring that historical states remain accessible while current workflows operate against the latest baseline. Together, these attributes create an auditable trail: a metric snapshot might occupy roughly 944 megabytes at version 10, while a companion artifact remains compact at 15 megabytes under version 4, each versioned independently to reflect distinct update cycles and deployment pipelines.

**fact_gauge**

| id | metric_kind_key | size_bytes | version |
| --- | --- | --- | --- |
| METR-0001 | METR-0004 | 944581501 | 10 |
| METR-0002 | METR-0002 | 721525656 | 10 |
| METR-0003 | METR-0006 | 182468524 | 11 |
| METR-0004 | METR-0005 | 15628556 | 4 |
| METR-0005 | METR-0001 | 256894862 | 9 |
| METR-0006 | METR-0007 | 696827242 | 7 |
| METR-0007 | METR-0003 | 732080346 | 4 |
| METR-0008 | METR-0005 | 330247350 | 8 |

When combined, these constructs form a cohesive metadata fabric that supports cross-domain compliance, reproducible analytics, and precise data lineage. The explicit separation of identity, relationship semantics, classification, and operational tracking allows organizations to model complex realities—whether mapping clinical tissue origins to structural anatomy, aligning regulatory articles with jurisdictional frameworks, or versioning high-volume metric datasets. By treating relationships as first-class citizens and enforcing strict version and size controls, the architecture ensures that every query, report, or automated decision can be traced back to a known state, a defined role, and a verifiable source.