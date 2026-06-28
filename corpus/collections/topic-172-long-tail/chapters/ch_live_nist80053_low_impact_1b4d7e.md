---
chapter_id: ch_live_nist80053_low_impact_1b4d7e
topic_id: 172
family: 07_long_tail
cited_terms: ['nist80053_low_impact', 'constraint_min_one_check', 'attribute_set_supports_outlier_claim']
model: engine-refine
---

In any structured governance framework, the identifier serves as the immutable anchor for every entity, constraint, and relationship. Whether referencing a NIST control family such as IMPA-0001 or a validation rule like CHEC-0001, the identifier provides a stable handle that survives across system boundaries and time. These identifiers appear not only as primary keys on their own records but also as foreign references that bind disparate concepts together. A constraint such as "Latency Limit" (CHEC-0002) points to IMPA-0002 as the check it enforces, while a NIST standard like SP 800-171 Rev 2 (IMPA-0001) may simultaneously serve as the subject of a relationship and the target of another. The identifier is the thread that holds the entire reference model together.

**t_constraint_min_one_check**

| id | constraint | checks | effective_date | scope |
| --- | --- | --- | --- | --- |
| CHEC-0001 | Unique Index | IMPA-0006 | 2023-05-21 | team |
| CHEC-0002 | Latency Limit | IMPA-0002 | 2023-05-17 | team |
| CHEC-0003 | Primary Key Rule | IMPA-0001 | 2025-03-18 | local |
| CHEC-0004 | Range Validation | IMPA-0005 | 2023-05-11 | regional |

The effective_date and scope columns establish the temporal and organizational boundaries within which a constraint or policy applies. An effective_date such as 2025-03-18 signals that the "Primary Key Rule" (CHEC-0003) was not merely a retrospective designation but a forward-looking governance action, whereas 2023-05-11 for "Range Validation" (CHEC-0004) indicates an earlier activation. Scope narrows the applicability further: a constraint may govern an entire team, a single local system, or a broader regional deployment. The combination of effective_date and scope answers two critical operational questions—when does this rule take effect, and where does it apply? Without both, a constraint remains ambiguous and unenforceable.

Subject and target define the endpoints of every relationship in the model. In the NIST impact-level mapping, IMPA-0001 functions as the subject (the NIST control being classified) while IMPA-0006 serves as the target (the impact level to which it is assigned). In the attribute-support relationship, CLAI-0001 is the subject (an outlier claim about source system ID) and CLAI-0001 is also the target (the supporting infrastructure, an API gateway, that backs it). The same identifier can appear in both roles depending on the relationship context, reflecting the bidirectional nature of governance mappings. A single NIST control may be the subject in one relationship and the target in another, creating a graph rather than a simple hierarchy.

**t_nist80053_low_impact**

| id | nist |
| --- | --- |
| IMPA-0001 | SP 800-171 Rev 2 |
| IMPA-0002 | SP 800-37 Rev 2 |
| IMPA-0003 | CSF 1.1 |
| IMPA-0004 | RMF Guide |
| IMPA-0005 | CSF 1.1 |
| IMPA-0006 | SP 800-218 |
| IMPA-0007 | SP 800-37 Rev 2 |
| IMPA-0008 | CSF 1.1 |

**t_nist80053_low_impact_at_n_i_s_t_impact_level**

| id | at_n_i_s_t_impact_level |
| --- | --- |
| IMPA-0001 | baseline |
| IMPA-0002 | category 1 |
| IMPA-0003 | minimal |
| IMPA-0004 | category 1 |
| IMPA-0005 | minimal |
| IMPA-0006 | minimal |
| IMPA-0007 | baseline |
| IMPA-0008 | low impact |

**t_nist80053_low_impact__at_n_i_s_t_impact_level**

| id | nist_id | at_n_i_s_t_impact_level_id | role |
| --- | --- | --- | --- |
| IMPA-0001 | IMPA-0001 | IMPA-0004 | reviewer |
| IMPA-0002 | IMPA-0003 | IMPA-0008 | observer |
| IMPA-0003 | IMPA-0002 | IMPA-0006 | observer |
| IMPA-0004 | IMPA-0001 | IMPA-0006 | contributor |
| IMPA-0005 | IMPA-0007 | IMPA-0003 | owner |
| IMPA-0006 | IMPA-0001 | IMPA-0002 | reviewer |
| IMPA-0007 | IMPA-0007 | IMPA-0001 | contributor |
| IMPA-0008 | IMPA-0008 | IMPA-0008 | reviewer |

**t_attribute_set_supports_outlier_claim**

| id | attribute |
| --- | --- |
| CLAI-0001 | source system ID |
| CLAI-0002 | validation rule |
| CLAI-0003 | geolocation accuracy |
| CLAI-0004 | sensor calibration |
| CLAI-0005 | source system ID |
| CLAI-0006 | validation rule |

**t_attribute_set_supports_outlier_claim_supports**

| id | supports |
| --- | --- |
| CLAI-0001 | API gateway |
| CLAI-0002 | PostgreSQL instance |
| CLAI-0003 | Ontology registry |
| CLAI-0004 | Ontology registry |
| CLAI-0005 | Storage volume |
| CLAI-0006 | Storage volume |

**t_attribute_set_supports_outlier_claim__supports**

| id | attribute_id | supports_id | role |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0001 | contributor |
| CLAI-0002 | CLAI-0005 | CLAI-0002 | contributor |
| CLAI-0003 | CLAI-0003 | CLAI-0005 | owner |
| CLAI-0004 | CLAI-0005 | CLAI-0005 | contributor |
| CLAI-0005 | CLAI-0006 | CLAI-0001 | owner |
| CLAI-0006 | CLAI-0004 | CLAI-0002 | contributor |
| CLAI-0007 | CLAI-0001 | CLAI-0004 | reviewer |
| CLAI-0008 | CLAI-0001 | CLAI-0002 | contributor |

Role assigns accountability to each relationship between subject and target. In the NIST impact-level mapping, IMPA-0001 is linked to IMPA-0006 with the role of contributor, indicating that the control actively participates in defining that impact level. The same control, IMPA-0001, appears again with IMPA-0004 under the role of reviewer, reflecting a different governance function. In the attribute-support graph, CLAI-0001 holds the role of contributor to its own supporting infrastructure, while CLAI-0003 assumes the role of owner over CLAI-0005. These role designations—contributor, reviewer, observer, owner—distinguish between those who create, validate, monitor, and ultimately own each relationship, ensuring that every link in the governance chain has a clearly assigned steward.