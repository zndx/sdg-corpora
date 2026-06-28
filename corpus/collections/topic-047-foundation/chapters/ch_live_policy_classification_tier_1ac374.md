---
chapter_id: ch_live_policy_classification_tier_1ac374
topic_id: 47
family: 03_directive_governance
cited_terms: ['policy_classification_tier', 'annotation_only_about_artifact', 'table_topic_tag']
model: engine-refine
---

Classification and governance of institutional data rest upon a hierarchy of identifiers that anchor every record to a stable, machine-readable key. Policy tiers such as TIER-0001 through TIER-0004 serve as the primary identifiers for regulatory instruments—Medical Privacy Directive, Financial SEC Reporting Rule, Environmental EPA Emissions Standard—each assigned to a classification level like Tier 3 Critical, Restricted Access, or Level 2 Sensitive. The identifier functions as the immutable reference point across all fact and dimension tables, ensuring that a single policy can be traced through its classification, its associated annotations, and the roles assigned to stakeholders without ambiguity. In the annotation domain, identifiers such as ARTI-0001 and ARTI-0005 operate analogously, linking factual measurements to their dimensional metadata; similarly, table topic identifiers like TAG-0001 and TAG-0005 provide the stable keys that bind quantitative observations to their categorical context.

**t_policy_classification_tier**

| id | policy |
| --- | --- |
| TIER-0001 | Medical Privacy Directive |
| TIER-0002 | Financial SEC Reporting Rule |
| TIER-0003 | Environmental EPA Emissions Standard |
| TIER-0004 | Medical Privacy Directive |
| TIER-0005 | Open Source License Policy |
| TIER-0006 | National Cybersecurity Strategy |

**t_policy_classification_tier_at_classification_tier**

| id | at_classification_tier |
| --- | --- |
| TIER-0001 | Tier 3 Critical |
| TIER-0002 | Restricted Access |
| TIER-0003 | Level 2 Sensitive |
| TIER-0004 | Restricted Access |
| TIER-0005 | Restricted Access |
| TIER-0006 | Restricted Access |
| TIER-0007 | Level 4 Sensitive |

Categories impose the semantic structure that transforms raw identifiers into meaningful groupings. An annotation labeled Annotation Label 01 belongs to Annotation Category 01, while Annotation Label 04 resides within Annotation Category 04; the same categorical discipline applies to table topics, where Table Topic Label 01 maps to Table Topic Category 01 and Table Topic Label 05 to Table Topic Category 05. This two-level organization—label for human readability, category for aggregation and filtering—enables both granular inspection and broad statistical summarization. A policy classified as Restricted Access, for instance, can be queried across all categories of annotation and table topic to determine the full scope of its governance footprint, while a contributor role assigned to the junction between policy TIER-0002 and classification TIER-0003 signals a specific access relationship that can be audited independently of the policy's categorical placement.

**dim_annotation**

| id | annotation_label | annotation_category |
| --- | --- | --- |
| ARTI-0001 | Annotation Label 01 | Annotation Category 01 |
| ARTI-0002 | Annotation Label 02 | Annotation Category 02 |
| ARTI-0003 | Annotation Label 03 | Annotation Category 03 |
| ARTI-0004 | Annotation Label 04 | Annotation Category 04 |
| ARTI-0005 | Annotation Label 05 | Annotation Category 05 |
| ARTI-0006 | Annotation Label 06 | Annotation Category 06 |

**dim_table_topic**

| id | table_topic_label | table_topic_category |
| --- | --- | --- |
| TAG-0001 | Table Topic Label 01 | Table Topic Category 01 |
| TAG-0002 | Table Topic Label 02 | Table Topic Category 02 |
| TAG-0003 | Table Topic Label 03 | Table Topic Category 03 |
| TAG-0004 | Table Topic Label 04 | Table Topic Category 04 |
| TAG-0005 | Table Topic Label 05 | Table Topic Category 05 |
| TAG-0006 | Table Topic Label 06 | Table Topic Category 06 |

Confidence and uncertainty constitute the dual metrics that quantify the reliability of every factual observation. In the annotation fact table, a record identified as ARTI-0001 carries a confidence of 0.845 against an uncertainty of 690.59, whereas ARTI-0002 presents a markedly lower confidence of 0.236 with uncertainty of 593.98; the inverse relationship between these measures is not strictly monotonic, reflecting the multidimensional nature of measurement error. The table topic fact table exhibits a similar pattern: TAG-0004 achieves a confidence of 0.874 with uncertainty of 289.58, while TAG-0002 registers confidence at 0.140 and uncertainty at 899.39. These paired values are not derived from a single formula but represent independent assessments—one measuring the degree of agreement or model certainty, the other capturing the magnitude of potential deviation—allowing downstream consumers to weight observations appropriately in aggregation, reporting, and decision-making.

The misc column captures supplementary quantitative values that do not fit the primary confidence-uncertainty framework but remain essential for contextual interpretation. Annotation values such as 979.94, 370.63, 360.27, and 284.47 coexist with their confidence and uncertainty scores, providing a third dimension of information that may represent raw measurements, derived indices, or auxiliary metadata. Table topic facts follow the same pattern, with values ranging from 470.53 to 720.41 recorded alongside confidence and uncertainty for the same identifiers. These misc values are not noise; they are the substantive content that confidence and uncertainty qualify, and their presence ensures that the factual layer retains the granularity necessary for audit trails and reproducibility.

**fact_annotation**

| id | annotation_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| ARTI-0001 | ARTI-0005 | 0.845 | 690.59 | 979.94 |
| ARTI-0002 | ARTI-0003 | 0.236 | 593.98 | 370.63 |
| ARTI-0003 | ARTI-0004 | 0.271 | 104.01 | 360.27 |
| ARTI-0004 | ARTI-0001 | 0.303 | 22.02 | 284.47 |
| ARTI-0005 | ARTI-0003 | 0.002 | 328.54 | 25.47 |

**fact_table**

| id | table_topic_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| TAG-0001 | TAG-0001 | 0.274 | 648.78 | 608.50 |
| TAG-0002 | TAG-0001 | 0.140 | 899.39 | 639.23 |
| TAG-0003 | TAG-0001 | 0.609 | 885.54 | 470.53 |
| TAG-0004 | TAG-0005 | 0.874 | 289.58 | 720.41 |

Subject, target, and role define the relational architecture that connects policies to their classifications and the actors who manage them. In the junction table linking policy tiers to classification tiers, the policy_id column functions as the subject—the entity being classified—while at_classification_tier_id serves as the target—the classification level to which the subject is assigned. The role column, taking values such as owner, observer, contributor, and reviewer, specifies the nature of the relationship between subject and target. A record with policy_id TIER-0002, at_classification_tier_id TIER-0002, and role owner indicates that the Financial SEC Reporting Rule is owned at the Restricted Access classification level, whereas the same policy with role observer at classification TIER-0003 denotes a monitoring relationship at Level 2 Sensitive. This triad—subject, target, role—forms a star schema that supports fine-grained access control, auditability, and the ability to query governance relationships by any dimension without collapsing the underlying relational structure.

**t_policy_classification_tier__at_classification_tier**

| id | policy_id | at_classification_tier_id | role |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0002 | TIER-0002 | owner |
| TIER-0002 | TIER-0002 | TIER-0003 | observer |
| TIER-0003 | TIER-0006 | TIER-0004 | contributor |
| TIER-0004 | TIER-0004 | TIER-0005 | reviewer |
| TIER-0005 | TIER-0001 | TIER-0003 | observer |
| TIER-0006 | TIER-0006 | TIER-0003 | owner |
| TIER-0007 | TIER-0004 | TIER-0002 | owner |
| TIER-0008 | TIER-0005 | TIER-0001 | owner |