---
chapter_id: ch_live_nist80053_low_impact_ae0436
topic_id: 41
family: 07_long_tail
cited_terms: ['nist80053_low_impact', 'nist80053_moderate_impact', 'nonbreaking_change_subclass']
model: engine-refine
---

In governance architectures that track compliance obligations and change management across distributed systems, the identifier serves as the immutable anchor of every entity, ensuring that references remain stable across joins, audits, and temporal evolution. An identifier is not merely a label but a persistent key that survives schema migrations and system integrations, allowing disparate datasets to be reconciled without ambiguity. Within the NIST control taxonomy, identifiers such as IMPA-0001 through IMPA-0004 distinguish individual control mappings across low-impact and moderate-impact baselines, while in the change-management domain, identifiers like CHAN-0001 through CHAN-0004 uniquely tag non-breaking change subclasses ranging from Metric Name Addition to Field Nullability Change. The structural discipline of these identifiers—uniform prefixes, sequential numbering, and cross-table consistency—enables referential integrity to be enforced programmatically, so that a control cited as SP 800-171 Rev 2 under IMPA-0001 in one context can be unambiguously traced to its associated impact classification and stakeholder assignments in another.

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
| IMPA-0001 | Moderate |
| IMPA-0002 | Integrity Moderate |
| IMPA-0003 | category 1 |
| IMPA-0004 | Integrity Moderate |
| IMPA-0005 | minimal |
| IMPA-0006 | category 1 |
| IMPA-0007 | low |
| IMPA-0008 | low impact |

**t_nist80053_moderate_impact**

| id | nist |
| --- | --- |
| IMPA-0001 | SP 800-53 |
| IMPA-0002 | SP 800-53 |
| IMPA-0003 | SP 800-171 |
| IMPA-0004 | SP 800-218 |
| IMPA-0005 | NIST AI RMF |
| IMPA-0006 | SP 800-171 |
| IMPA-0007 | SP 800-37 |

**t_nist80053_moderate_impact_at_n_i_s_t_impact_level**

| id | at_n_i_s_t_impact_level |
| --- | --- |
| IMPA-0001 | minor |
| IMPA-0002 | Moderate Baseline |
| IMPA-0003 | Impact Level Moderate |
| IMPA-0004 | Moderate Threshold |
| IMPA-0005 | level 1 |
| IMPA-0006 | category 1 |
| IMPA-0007 | low impact |

**t_nonbreaking_change_subclass**

| id | nonbreaking |
| --- | --- |
| CHAN-0001 | Metric Name Addition |
| CHAN-0002 | Dependency Version Bump |
| CHAN-0003 | License Header Update |
| CHAN-0004 | Field Nullability Change |
| CHAN-0005 | Field Nullability Change |
| CHAN-0006 | Log Format Extension |

**t_nonbreaking_change_subclass_non_breaking_change_for**

| id | non_breaking_change_for |
| --- | --- |
| CHAN-0001 | ML Feature Store |
| CHAN-0002 | Cloud Storage Bucket |
| CHAN-0003 | GraphQL Endpoint |
| CHAN-0004 | Event Ingestion Pipeline |
| CHAN-0005 | REST API Gateway |
| CHAN-0006 | Data Lake Warehouse |

The subject and target constitute the directional pair that defines a relationship between two independently identified entities. In a relational model, the subject is the entity initiating or owning the relationship, while the target is the entity receiving or being affected by it. This distinction is critical when mapping compliance controls to impact levels: a control identified as IMPA-0001 may appear as the subject in a relationship whose target is IMPA-0004, indicating that the control designated SP 800-171 Rev 2 is associated with the impact level IMPA-0004, which carries the classification Integrity Moderate. The same control, IMPA-0001, may simultaneously serve as the subject in a different relationship targeting IMPA-0006, reflecting a second association under a different impact regime. The subject-target pairing is not symmetric; reversing the direction would invert the semantic meaning of the relationship, assigning accountability or classification to the wrong entity. In the change-management domain, the pattern repeats: CHAN-0004, representing a Field Nullability Change, appears as the subject targeting CHAN-0006, which denotes an Event Ingestion Pipeline, establishing that the change subclass applies to that specific pipeline.

The role column resolves the ambiguity that arises when a single subject-target pair can support multiple relationship types. Without an explicit role, the relationship between two entities is underspecified—knowing that IMPA-0001 is linked to IMPA-0004 tells us nothing about the nature of that linkage. The role disambiguates by declaring the capacity in which the subject participates relative to the target. In the NIST low-impact mapping, the same subject IMPA-0001 assumes the role of reviewer when targeting IMPA-0004 and the role of contributor when targeting IMPA-0006, indicating that the entity responsible for SP 800-171 Rev 2 exercises different functions across distinct impact classifications. In the moderate-impact domain, the role spectrum expands to include observer and owner: CHAN-0003, a License Header Update, acts as a reviewer when linked to CHAN-0003 (GraphQL Endpoint), while CHAN-0001, a Metric Name Addition, serves as a contributor to CHAN-0003. The role thus functions as a predicate that qualifies the relationship, enabling fine-grained access control, audit trails, and accountability matrices to be derived from the same underlying graph.

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

**t_nist80053_moderate_impact__at_n_i_s_t_impact_level**

| id | nist_id | at_n_i_s_t_impact_level_id | role |
| --- | --- | --- | --- |
| IMPA-0001 | IMPA-0002 | IMPA-0007 | observer |
| IMPA-0002 | IMPA-0002 | IMPA-0004 | observer |
| IMPA-0003 | IMPA-0006 | IMPA-0001 | contributor |
| IMPA-0004 | IMPA-0007 | IMPA-0007 | owner |
| IMPA-0005 | IMPA-0003 | IMPA-0002 | owner |
| IMPA-0006 | IMPA-0004 | IMPA-0005 | observer |
| IMPA-0007 | IMPA-0001 | IMPA-0006 | contributor |
| IMPA-0008 | IMPA-0003 | IMPA-0007 | owner |

The practical significance of this triad—identifier, subject-target pair, and role—becomes apparent when auditing compliance posture or tracing the impact of a system change. Consider a scenario in which an Event Ingestion Pipeline requires a Field Nullability Change. The identifier CHAN-0004 immediately locates the relevant change subclass, the subject-target relationship CHAN-0004 → CHAN-0006 establishes applicability, and the role observer indicates that the change agent monitors rather than directs the modification. Similarly, when assessing whether a system classified under IMPA-0002 (SP 800-37 Rev 2) meets its moderate-impact obligations, one follows the subject IMPA-0002 through its relationships to targets IMPA-0006 and IMPA-0008, reading the roles observer and contributor to determine which stakeholders are accountable for each control-to-impact mapping. The same structural pattern governs both compliance tracking and change management, demonstrating that the identifier-subject-target-role model is not domain-specific but a general mechanism for encoding relational semantics in a queryable, auditable form.

**t_nonbreaking_change_subclass__non_breaking_change_for**

| id | nonbreaking_id | non_breaking_change_for_id | role |
| --- | --- | --- | --- |
| CHAN-0001 | CHAN-0004 | CHAN-0006 | observer |
| CHAN-0002 | CHAN-0006 | CHAN-0005 | contributor |
| CHAN-0003 | CHAN-0001 | CHAN-0003 | reviewer |
| CHAN-0004 | CHAN-0003 | CHAN-0002 | contributor |
| CHAN-0005 | CHAN-0002 | CHAN-0006 | observer |
| CHAN-0006 | CHAN-0005 | CHAN-0001 | reviewer |
| CHAN-0007 | CHAN-0001 | CHAN-0005 | reviewer |
| CHAN-0008 | CHAN-0002 | CHAN-0006 | owner |