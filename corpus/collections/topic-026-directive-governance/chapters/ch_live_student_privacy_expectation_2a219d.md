---
chapter_id: ch_live_student_privacy_expectation_2a219d
topic_id: 26
family: 08_derived
cited_terms: ['student_privacy_expectation', 'qualification_process', 'schemaorg_review_target']
model: engine-refine
---

Across the governance framework, every entity is anchored by a stable identifier—coded as `EXPE-0001`, `PROC-0001`, or `TARG-0001`—that serves as the immutable key for cross-referencing records through the system. These identifiers underpin three distinct but interrelated domains: student privacy expectations, qualification and championship pathways, and schema.org review targets. Each domain captures a different facet of institutional governance, yet all rely on the same pattern of keyed records, typed attributes, and relational joins to maintain traceability and enforce policy.

**t_student_privacy_expectation**

| id | student_privacy_expectation | applies_to | confidence | dimension_kind |
| --- | --- | --- | --- | --- |
| EXPE-0001 | Casey Nguyen | Disciplinary Archive | 0.655 | mass |
| EXPE-0002 | Sam Rivera | Counseling Records | 0.908 | time |
| EXPE-0003 | Emma Wilson | Biometric Scanner | 0.047 | length |
| EXPE-0004 | David Kim | Biometric Scanner | 0.667 | pressure |
| EXPE-0005 | Emma Wilson | Athletics Roster | 0.940 | temperature |
| EXPE-0006 | Maria Gonzalez | Research Lab Server | 0.441 | temperature |
| EXPE-0007 | Alex Chen | Student Health Portal | 0.209 | time |
| EXPE-0008 | Priya Patel | Cafeteria POS | 0.835 | temperature |

**t_qualification_process**

| id | qualification_process | requires_membership | yields_championship_entry |
| --- | --- | --- | --- |
| PROC-0001 | Regional Wildcard Series | FIDE Master Rating | Finals Roster Position |
| PROC-0002 | Continental Draft Combine | FIFA Member Federation | Final Four Invitation |
| PROC-0003 | Regional Wildcard Series | USATF Athletic License | Playoff Wildcard Spot |
| PROC-0004 | North American Open Bracket | USATF Athletic License | Playoff Wildcard Spot |

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

Student privacy expectations are modeled as named policies—such as those attributed to Casey Nguyen, Sam Rivera, Emma Wilson, and David Kim—that apply to specific protected locations like the Disciplinary Archive, Counseling Records, and the Biometric Scanner. Each expectation carries a confidence score reflecting the system's certainty about its applicability or enforceability, ranging from a low of 0.047 for Emma Wilson's expectation on Biometric Scanner to a high of 0.908 for Sam Rivera's expectation on Counseling Records. The dimension kind attribute further classifies each expectation along a physical or operational axis—mass, time, length, or pressure—allowing the system to reason about the nature of the data being protected and the constraints that apply. For instance, the Biometric Scanner appears under two different expectations (Emma Wilson with a confidence of 0.047 and David Kim with 0.667), each tied to a different dimension kind (length and pressure, respectively), illustrating how the same protected location can be governed by multiple, potentially overlapping privacy expectations.

Qualification processes define the pathways through which participants earn championship entries, linking a membership registration requirement to a specific competitive outcome. The Regional Wildcard Series, for example, requires a USATF Athletic License and yields a Playoff Wildcard Spot, while the Continental Draft Combine demands a FIFA Member Federation membership and produces a Final Four Invitation. The North American Open Bracket also requires a USATF Athletic License and similarly yields a Playoff Wildcard Spot, demonstrating that different qualification processes can converge on the same championship entry type. Membership registrations themselves—FIDE Master Rating, FIFA Member Federation, and USATF Athletic License—serve as the gatekeeping credentials that must be satisfied before a participant can advance through the qualification pipeline toward a Finals Roster Position, a Final Four Invitation, or a Playoff Wildcard Spot.

The schema.org review target model captures relationships between reviewable entities and the items they reference, using a junction table to express the role each item plays in relation to a subject. A schema.org type such as `Service` or `SoftwareApplication` acts as the subject, while review items like `GraphQLEndpoint`, `AzureBlobStorage`, and `PostgreSQLTable` serve as the target of the review. The association between them is mediated by a role attribute that designates whether the target item is an owner or a contributor to the subject. For example, a `PostgreSQLTable` can hold the owner role in relation to a `Service`, while an `AzureBlobStorage` item may serve as a contributor, enabling the system to distinguish between primary and secondary dependencies when auditing or reviewing schema.org resources.

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