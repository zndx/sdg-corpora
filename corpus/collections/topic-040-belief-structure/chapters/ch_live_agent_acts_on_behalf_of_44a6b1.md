---
chapter_id: ch_live_agent_acts_on_behalf_of_44a6b1
topic_id: 40
family: 05_provo_lineage
cited_terms: ['agent_acts_on_behalf_of', 'schemaorg_review_rating', 'conjunctive_combination']
model: engine-refine
---

Identifiers serve as the immutable anchors of any relational data fabric, providing stable handles that survive schema evolution, entity merging, and cross-system reconciliation. The prefix conventions embedded in these handles—BEHA-0001 through BEHA-0004 for delegation records, RATI-0001 through RATI-0004 for rating associations, COMB-0001 through COMB-0004 for conjunctive combinations—encode provenance at the lexical level, enabling auditors to trace a record back to its originating subsystem without consulting external registries. An identifier such as BEHA-0001 does not merely label a row; it denotes a persistent entity that may be referenced simultaneously as a subject in one relationship and as a target in another, thereby supporting the graph-like navigation patterns that modern governance frameworks require.

Subject and target columns formalize the directional semantics of every relationship, distinguishing the actor from the recipient in a manner that preserves auditability. In the delegation lattice, the junction table t_agent_acts_on_behalf_of__acted_on_behalf_of pairs a subject column (agent_id) with a target column (acted_on_behalf_of_id) to express that the ProvenanceTracker (BEHA-0003) operates on behalf of the DataGovernanceBoard (BEHA-0001), while the ETLBatchScheduler (BEHA-0006) serves the SecurityOperations unit (BEHA-0005). The same pattern recurs in the rating domain, where t_schemaorg_review_rating__review_rating links the schemaorg entity iPhone 15 Pro (RATI-0004) to a review_rating instance (RATI-0001) through a subject-target axis, ensuring that the direction of attribution remains unambiguous across joins.

**t_agent_acts_on_behalf_of**

| id | agent |
| --- | --- |
| BEHA-0001 | AuditLogger |
| BEHA-0002 | LogAggregator |
| BEHA-0003 | ProvenanceTracker |
| BEHA-0004 | ETLBatchScheduler |
| BEHA-0005 | ReconciliationBot |
| BEHA-0006 | ETLBatchScheduler |

**t_agent_acts_on_behalf_of_acted_on_behalf_of**

| id | acted_on_behalf_of |
| --- | --- |
| BEHA-0001 | DataGovernanceBoard |
| BEHA-0002 | DataGovernanceBoard |
| BEHA-0003 | AnalyticsDivision |
| BEHA-0004 | SecurityOperations |
| BEHA-0005 | ComplianceAudit |
| BEHA-0006 | SecurityOperations |

**t_agent_acts_on_behalf_of__acted_on_behalf_of**

| id | agent_id | acted_on_behalf_of_id | role |
| --- | --- | --- | --- |
| BEHA-0001 | BEHA-0005 | BEHA-0003 | observer |
| BEHA-0002 | BEHA-0001 | BEHA-0006 | contributor |
| BEHA-0003 | BEHA-0003 | BEHA-0001 | owner |
| BEHA-0004 | BEHA-0006 | BEHA-0005 | reviewer |
| BEHA-0005 | BEHA-0003 | BEHA-0002 | observer |
| BEHA-0006 | BEHA-0006 | BEHA-0001 | reviewer |
| BEHA-0007 | BEHA-0005 | BEHA-0001 | contributor |
| BEHA-0008 | BEHA-0006 | BEHA-0006 | owner |

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

Role columns annotate these subject-target pairs with functional semantics, transforming a bare edge into a governed relationship. The delegation junction assigns the values observer, contributor, owner, and reviewer to the links between agents and the bodies they serve, thereby encoding not merely that a ProvenanceTracker acts on behalf of a DataGovernanceBoard but that its capacity is that of a contributor rather than an owner. In the rating domain, the role column uniformly carries the value reviewer, signaling that the association between a schemaorg entity and its rating is mediated by a reviewing function rather than an editorial or curatorial one. These role annotations are the mechanism by which access-control policies, approval workflows, and compliance checks are grounded in the data model itself.

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

Category and misc columns provide the classification and free-text scaffolding that allow analytical queries and human readers to group, filter, and contextualize records without hard-coding business logic into the schema. The dimension table dim_conjunctively_combines carries a conjunctively_combines_category column whose values—Conjunctively Combines Category 01 through 04—partition the combination records into mutually exclusive analytical buckets, while the conjunctively_combines_label column supplies human-readable descriptors such as Conjunctively Combines Label 01. The misc column, appearing in both the fact table and the dimension table, accommodates unstructured or semi-structured values that resist normalization, such as the numeric value 793.45 stored alongside confidence and uncertainty measures, or the product name Adobe Photoshop recorded as a schemaorg entity.

**fact_conjunctive**

| id | conjunctively_combines_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| COMB-0001 | COMB-0004 | 0.738 | 736.08 | 793.45 |
| COMB-0002 | COMB-0004 | 0.045 | 898.42 | 791.51 |
| COMB-0003 | COMB-0006 | 0.764 | 666.33 | 598.69 |
| COMB-0004 | COMB-0003 | 0.799 | 785.73 | 980.44 |
| COMB-0005 | COMB-0006 | 0.312 | 470.05 | 427.17 |
| COMB-0006 | COMB-0003 | 0.643 | 227.57 | 137.91 |
| COMB-0007 | COMB-0004 | 0.630 | 30.12 | 467.22 |

Confidence and uncertainty form the quantitative backbone of any system that must reason about the reliability of combined evidence. The fact_conjunctive table stores confidence as a probability-like scalar—0.738, 0.045, 0.764, 0.799—paired with an uncertainty measure expressed in absolute units (736.08, 898.42, 666.33, 785.73) and a derived value (793.45, 791.51, 598.69, 980.45). The conjunctively_combines_key column references other rows in the same table, creating a recursive structure in which combinations are built from other combinations, and each level of composition carries its own confidence and uncertainty estimates. A record with confidence 0.045 and uncertainty 898.42 signals a weakly supported inference, whereas confidence 0.799 with uncertainty 785.73 indicates a substantially more reliable aggregation; the misc value 980.45 attached to the latter represents the synthesized output of that conjunctive operation.

The interplay of these ten concepts—identifier, category, conjunctively combines, confidence, misc, role, subject, target, uncertainty—constitutes a minimal but complete vocabulary for modeling governed relationships in enterprise data architectures. Identifiers provide persistence; subject and target encode directionality; role annotates function; category and misc supply classification and free-text flexibility; confidence and uncertainty quantify epistemic strength; and conjunctively combines enables recursive composition of evidence. Together they form a self-describing fabric in which every relationship is addressable, every annotation is typed, and every quantitative assessment is traceable to its source, thereby satisfying the auditability and reproducibility requirements that modern regulatory frameworks impose on data-intensive organizations.

**dim_conjunctively_combines**

| id | conjunctively_combines_label | conjunctively_combines_category |
| --- | --- | --- |
| COMB-0001 | Conjunctively Combines Label 01 | Conjunctively Combines Category 01 |
| COMB-0002 | Conjunctively Combines Label 02 | Conjunctively Combines Category 02 |
| COMB-0003 | Conjunctively Combines Label 03 | Conjunctively Combines Category 03 |
| COMB-0004 | Conjunctively Combines Label 04 | Conjunctively Combines Category 04 |
| COMB-0005 | Conjunctively Combines Label 05 | Conjunctively Combines Category 05 |
| COMB-0006 | Conjunctively Combines Label 06 | Conjunctively Combines Category 06 |