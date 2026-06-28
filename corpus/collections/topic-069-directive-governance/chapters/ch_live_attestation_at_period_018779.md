---
chapter_id: ch_live_attestation_at_period_018779
topic_id: 69
family: 03_directive_governance
cited_terms: ['attestation_at_period', 'schemaorg_review_target', 'requirement_refines']
model: engine-refine
---

In compliance architectures, every artifact must be anchored to a stable identifier that survives cross-referencing across attestation cycles, target registries, and requirement refinements. The identifier serves as the immutable key through which an entity—whether an attestation, a review target, or a refining requirement—enters the governance graph. Consider the attestation identifiers PERI-0001 through PERI-0004, which distinguish a HIPAA Compliance Review from a Vendor Risk Assessment, a Quarterly Internal Audit, and a Data Lineage Review; or the target identifiers TARG-0001 through TARG-0004, which enumerate a SoftwareApplication, a Person, and two distinct Service entries. These identifiers are not labels but structural nodes: they enable the system to resolve which attestation applies to which period, which target is refined by which requirement, and which entity assumes which role in a given relationship. Without such keys, the relational integrity of the compliance framework collapses into ambiguity.

**t_attestation_at_period**

| id | attestation |
| --- | --- |
| PERI-0001 | HIPAA Compliance Review |
| PERI-0002 | Vendor Risk Assessment |
| PERI-0003 | Quarterly Internal Audit |
| PERI-0004 | Data Lineage Review |
| PERI-0005 | SOC2 Type II Audit |
| PERI-0006 | Quarterly Internal Audit |

**t_attestation_at_period_at_attestation_period**

| id | at_attestation_period |
| --- | --- |
| PERI-0001 | Q1 2025 Cycle |
| PERI-0002 | Q1 2025 Cycle |
| PERI-0003 | Q4 2023 Review |
| PERI-0004 | Q2 2025 Window |
| PERI-0005 | Q3 2024 Period |
| PERI-0006 | Q2 2024 Window |

**t_attestation_at_period__at_attestation_period**

| id | attestation_id | at_attestation_period_id | role |
| --- | --- | --- | --- |
| PERI-0001 | PERI-0002 | PERI-0004 | reviewer |
| PERI-0002 | PERI-0001 | PERI-0002 | observer |
| PERI-0003 | PERI-0001 | PERI-0001 | observer |
| PERI-0004 | PERI-0003 | PERI-0002 | reviewer |
| PERI-0005 | PERI-0005 | PERI-0004 | contributor |
| PERI-0006 | PERI-0001 | PERI-0004 | observer |
| PERI-0007 | PERI-0003 | PERI-0002 | observer |
| PERI-0008 | PERI-0003 | PERI-0005 | owner |

**t_schemaorg_review_target**

| id | schemaorg |
| --- | --- |
| TARG-0001 | SoftwareApplication |
| TARG-0002 | Person |
| TARG-0003 | Service |
| TARG-0004 | Service |
| TARG-0005 | Service |
| TARG-0006 | Person |

**t_schemaorg_review_target_reviews_item**

| id | reviews_item |
| --- | --- |
| TARG-0001 | GraphQLEndpoint |
| TARG-0002 | AzureBlobStorage |
| TARG-0003 | AzureBlobStorage |
| TARG-0004 | PostgreSQLTable |
| TARG-0005 | AzureBlobStorage |
| TARG-0006 | GraphQLEndpoint |

**t_schemaorg_review_target__reviews_item**

| id | schemaorg_id | reviews_item_id | role |
| --- | --- | --- | --- |
| TARG-0001 | TARG-0003 | TARG-0003 | owner |
| TARG-0002 | TARG-0004 | TARG-0003 | contributor |
| TARG-0003 | TARG-0006 | TARG-0006 | contributor |
| TARG-0004 | TARG-0005 | TARG-0001 | owner |
| TARG-0005 | TARG-0005 | TARG-0005 | owner |
| TARG-0006 | TARG-0001 | TARG-0005 | observer |
| TARG-0007 | TARG-0005 | TARG-0004 | observer |
| TARG-0008 | TARG-0005 | TARG-0001 | contributor |

The concept of subject and target defines the directional topology of every relationship in the registry. A subject is the entity that initiates or owns a relationship; a target is the entity that receives, is refined by, or is evaluated through that relationship. In the attestation-to-period mapping, PERI-0002 (Vendor Risk Assessment) appears as the subject pointing to PERI-0004 as the target period, while PERI-0001 (HIPAA Compliance Review) serves as subject to PERI-0002 as target. The same directional logic governs review targets: TARG-0003 (Service) is the subject that refines TARG-0003 (AzureBlobStorage), and TARG-0004 (Service) is the subject that refines TARG-0003 (AzureBlobStorage) as well. The subject-target axis is not symmetric—it encodes intent, ownership, and the flow of compliance obligation from abstract policy to concrete artifact.

Role assigns agency within each subject-target relationship, distinguishing who acts, who observes, and who is accountable. In the attestation-period junction, the role column carries the values reviewer and observer: PERI-0002 assumes the reviewer role when linked to the Q2 2025 Window, while PERI-0001 assumes observer status against both the Q4 2023 Review and the Q1 2025 Cycle. In the review-target junction, role takes on owner and contributor—TARG-0003 and TARG-0001 are owners of their respective AzureBlobStorage and PostgreSQLTable targets, while TARG-0004 and TARG-0006 are contributors. Role is the mechanism by which organizational responsibility is materialized in the data model; it transforms a bare relationship into an accountable one.

Scope and language introduce the dimensional axes that determine where and in what linguistic register a requirement applies. Scope operates as a hierarchical qualifier—team, regional, local, global—attaching to the refinement of requirements against targets. The Access Control Matrix (REFI-0001) carries team scope when refining TARG-0003, while the Data Retention Policy appears under regional scope (REFI-0002), local scope (REFI-0003), and global scope (REFI-0004), each refining different targets (TARG-0001, TARG-0003, TARG-0006 respectively). Language operates in parallel: the same Data Retention Policy is expressed in English (REFI-0002, REFI-0003) and French (REFI-0004), while the Access Control Matrix is rendered in Spanish (REFI-0001). Scope and language together ensure that a single requirement can be localized and scoped without duplication, preserving semantic consistency across jurisdictions and organizational boundaries.

**t_requirement_refines**

| id | requirement | refines | scope | language |
| --- | --- | --- | --- | --- |
| REFI-0001 | Access Control Matrix | TARG-0003 | team | es |
| REFI-0002 | Data Retention Policy | TARG-0001 | regional | en |
| REFI-0003 | Data Retention Policy | TARG-0003 | local | en |
| REFI-0004 | Data Retention Policy | TARG-0006 | global | fr |

The period registry completes the temporal dimension of the framework. Attestations are not static documents but events bound to cycles: the Q1 2025 Cycle, the Q4 2023 Review, and the Q2 2025 Window. The period table maps each attestation identifier to its applicable cycle, and the junction table cross-references attestation identifiers with period identifiers, creating a many-to-many relationship that supports re-attestation, retrospective review, and forward-planning. An attestation such as PERI-0001 (HIPAA Compliance Review) may appear in multiple periods; a period such as Q1 2025 Cycle may host multiple attestations. This temporal layer ensures that compliance is not a point-in-time assertion but a continuous, traceable process.