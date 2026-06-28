---
chapter_id: ch_live_policy_enforced_by_cbc959
topic_id: 60
family: 03_directive_governance
cited_terms: ['policy_enforced_by', 'pignistic_transformation', 'schemaorg_review_rating']
model: engine-refine
---

In formal governance frameworks, the integrity of an entity relies on its unique identifier, which serves as the immutable anchor for all subsequent relational mappings. Consider the policy enforcement domain, where distinct regulatory mandates are codified under specific identifiers such as `ENFO-0001` for ISO27001 Encryption or `ENFO-0002` for CCPA Data Deletion. These identifiers are not merely administrative labels; they represent the *subject* of enforcement actions, establishing a clear lineage of accountability. Just as a diagnostic confidence matrix (`TRAN-0001`) or a consumer product like the iPhone 15 Pro (`RATI-0003`) requires a precise reference point to exist within a structured dataset, the subject entity must be distinctly cataloged before it can participate in any operational relationship. The subject acts as the origin point of the relationship, carrying the intrinsic properties—such as the specific requirements of FINRA Record Retention (`ENFO-0004`)—that necessitate downstream interaction.

**t_policy_enforced_by**

| id | policy |
| --- | --- |
| ENFO-0001 | ISO27001 Encryption |
| ENFO-0002 | CCPA Data Deletion |
| ENFO-0003 | PCI-DSS Tokenization |
| ENFO-0004 | FINRA Record Retention |
| ENFO-0005 | FINRA Record Retention |
| ENFO-0006 | HIPAA Audit Trail |

**t_policy_enforced_by_enforced_by**

| id | enforced_by |
| --- | --- |
| ENFO-0001 | Splunk SIEM |
| ENFO-0002 | ISO Audit Board |
| ENFO-0003 | AWS Config Rules |
| ENFO-0004 | AWS Config Rules |
| ENFO-0005 | ISO Audit Board |
| ENFO-0006 | AWS Config Rules |

The *target* represents the destination or the instrument through which the subject's properties are realized, evaluated, or transformed. In the context of pignistic transformations, a telemetry belief assignment (`TRAN-0002`) may target a specific operational output, such as a pignistic probability distribution or a transformed belief state, effectively bridging theoretical models with actionable metrics. Similarly, in consumer evaluation schemas, the subject (e.g., Adobe Photoshop, `RATI-0001`) targets a quantifiable assessment, such as a 3.2 points score or a 100 percentile ranking (`RATI-0002`). The target is the tangible or measurable entity that receives the subject's influence, whether it is an AWS Config Rule (`ENFO-0003`) enforcing PCI-DSS Tokenization or a betting probability set refining diagnostic data. Without a clearly defined target, the subject remains an isolated concept, unable to exert its intended function within the broader system.

**t_pignistic_transformation**

| id | pignistic |
| --- | --- |
| TRAN-0001 | diagnostic confidence matrix |
| TRAN-0002 | telemetry belief assignment |
| TRAN-0003 | anomaly likelihood set |
| TRAN-0004 | diagnostic confidence matrix |
| TRAN-0005 | predictive uncertainty record |
| TRAN-0006 | anomaly likelihood set |
| TRAN-0007 | anomaly likelihood set |
| TRAN-0008 | telemetry belief assignment |

**t_pignistic_transformation_pignistic_transform**

| id | pignistic_transform |
| --- | --- |
| TRAN-0001 | pignistic probability distribution |
| TRAN-0002 | transformed belief state |
| TRAN-0003 | transformed belief state |
| TRAN-0004 | betting probability set |
| TRAN-0005 | risk probability assignment |
| TRAN-0006 | decision support distribution |
| TRAN-0007 | betting probability set |
| TRAN-0008 | transformed belief state |

**t_pignistic_transformation__pignistic_transform**

| id | pignistic_id | pignistic_transform_id | role |
| --- | --- | --- | --- |
| TRAN-0001 | TRAN-0008 | TRAN-0005 | reviewer |
| TRAN-0002 | TRAN-0006 | TRAN-0003 | reviewer |
| TRAN-0003 | TRAN-0005 | TRAN-0006 | contributor |
| TRAN-0004 | TRAN-0005 | TRAN-0002 | reviewer |
| TRAN-0005 | TRAN-0006 | TRAN-0002 | owner |
| TRAN-0006 | TRAN-0003 | TRAN-0008 | reviewer |
| TRAN-0007 | TRAN-0007 | TRAN-0005 | observer |
| TRAN-0008 | TRAN-0008 | TRAN-0008 | reviewer |

The *role* serves as the critical semantic bridge, defining the nature of the interaction and the distribution of authority or responsibility between the subject and the target. The role is not a static attribute but a relational context; for instance, an AWS Config Rule may act as an `owner` for FINRA Record Retention (`ENFO-0004`), while simultaneously serving as a `reviewer` for ISO27001 Encryption (`ENFO-0001`). This duality highlights how a single target entity can assume multiple roles across different subjects. In technical domains, a transformed belief state might be linked to a diagnostic confidence matrix via a `contributor` role (`TRAN-0005`), indicating active participation in the data generation process. Conversely, in review systems, a 9.1 rating might be associated with a product through a `reviewer` role, denoting an evaluative stance rather than an operational one. The role thus provides the necessary granularity to distinguish between passive observation, active contribution, and authoritative ownership.

The interplay of identifier, subject, target, and role creates a robust topology for managing complex dependencies across disparate domains. Whether mapping the enforcement of CCPA Data Deletion (`ENFO-0002`) by the ISO Audit Board acting as an `observer`, or linking a diagnostic confidence matrix to a betting probability set through a `reviewer` role, the underlying relational logic remains consistent. This structure allows systems to dynamically resolve relationships without hardcoding dependencies; for example, an `ENFO-0006` identifier might link a policy to an enforcer in one context, while a `RATI-0006` identifier links a product to a rating in another. By explicitly defining the role, the system captures the *why* and *how* of the connection, ensuring that the transition from a subject like The Great Gatsby (`RATI-0002`) to its 100 percentile rating is governed by the same rigorous relational standards as the transition from Splunk SIEM enforcing ISO27001 to the policy itself. Ultimately, this architecture ensures that the identifier remains the single source of truth, anchoring every subject-target interaction within a traceable and semantically precise framework.

**t_policy_enforced_by__enforced_by**

| id | policy_id | enforced_by_id | role |
| --- | --- | --- | --- |
| ENFO-0001 | ENFO-0001 | ENFO-0003 | observer |
| ENFO-0002 | ENFO-0002 | ENFO-0006 | observer |
| ENFO-0003 | ENFO-0003 | ENFO-0001 | reviewer |
| ENFO-0004 | ENFO-0006 | ENFO-0001 | owner |
| ENFO-0005 | ENFO-0002 | ENFO-0005 | reviewer |
| ENFO-0006 | ENFO-0001 | ENFO-0003 | observer |
| ENFO-0007 | ENFO-0003 | ENFO-0001 | contributor |
| ENFO-0008 | ENFO-0004 | ENFO-0006 | reviewer |

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