---
chapter_id: ch_live_iso27001_annexa_subclass_4b45ea
topic_id: 8
family: 07_long_tail
cited_terms: ['iso27001_annexa_subclass', 'legal_advocate_role', 'transformation_associated_with_agent']
model: engine-refine
---

In governance and compliance information systems, directed associations are rarely expressed as bare links between records; they are instead qualified triples in which a subject entity bears a defined relationship toward a target entity, and a role attribute states how that subject participates in the association. The role is not merely descriptive metadata appended for reporting convenience—it governs accountability, authorization scope, and audit interpretation. Where an ISO annex subclass such as ANNE-0003 is linked to control A.5.22 Cloud security through a subject–target pairing, the role value observer signals read-oriented engagement rather than custodial responsibility, whereas owner on a separate pairing denotes accountable stewardship. The same semantic machinery appears outside standards mapping: a transformation run may be associated with a GitHub CI Pipeline as contributor while a Model Retraining Cycle attaches to a Senior Data Engineer as observer, preserving a uniform interpretive grammar across qualitatively different domains.

**t_transformation_associated_with_agent**

| id | transformation |
| --- | --- |
| AGEN-0001 | Archive Export Run |
| AGEN-0002 | Feature Engineering Job |
| AGEN-0003 | Model Retraining Cycle |
| AGEN-0004 | Sensor Calibration Pass |
| AGEN-0005 | Schema Migration Run |
| AGEN-0006 | Partition Pruning Step |
| AGEN-0007 | Daily ETL Pipeline |

**t_transformation_associated_with_agent_was_associated_with**

| id | was_associated_with |
| --- | --- |
| AGEN-0001 | GitHub CI Pipeline |
| AGEN-0002 | Docker Container |
| AGEN-0003 | Senior Data Engineer |
| AGEN-0004 | Senior Data Engineer |
| AGEN-0005 | Docker Container |
| AGEN-0006 | Docker Container |

**t_transformation_associated_with_agent__was_associated_with**

| id | transformation_id | was_associated_with_id | role |
| --- | --- | --- | --- |
| AGEN-0001 | AGEN-0006 | AGEN-0001 | contributor |
| AGEN-0002 | AGEN-0007 | AGEN-0001 | reviewer |
| AGEN-0003 | AGEN-0003 | AGEN-0002 | observer |
| AGEN-0004 | AGEN-0004 | AGEN-0005 | contributor |
| AGEN-0005 | AGEN-0001 | AGEN-0002 | reviewer |
| AGEN-0006 | AGEN-0007 | AGEN-0006 | contributor |
| AGEN-0007 | AGEN-0001 | AGEN-0004 | observer |
| AGEN-0008 | AGEN-0003 | AGEN-0002 | observer |

Identifiers supply the stable referential spine on which that grammar depends. Each entity—whether a legal advocate role designation, a person, a domestic violence survivor record, or an annex subclass—receives a durable key such as ROLE-0003 or ANNE-0001 that persists across revisions to descriptive attributes. Legal advocate role types including SurvivorAdvoc-118 and CourtAdvoc-15B therefore remain distinguishable even when bearer assignments or assisted caseloads change; survivor references such as DV-Record-338 and Case-Client-004 remain traceable even when advocate pairings are renegotiated. Without such keys, subject and target columns in association records would collapse into ambiguous natural-language labels, undermining cross-table joins, longitudinal audit trails, and the enforcement of referential integrity in operational workflows.

**t_iso27001_annexa_subclass**

| id | iso |
| --- | --- |
| ANNE-0001 | ISO/IEC 27001 |
| ANNE-0002 | ISO/IEC 27001 |
| ANNE-0003 | ISO/IEC 27701 |
| ANNE-0004 | ISO 20000-1 |
| ANNE-0005 | ISO/IEC 27701 |
| ANNE-0006 | ISO 20000-1 |

**t_iso27001_annexa_subclass_iso27001_annex_a**

| id | iso27001_annex_a |
| --- | --- |
| ANNE-0001 | A.5.22 Cloud security |
| ANNE-0002 | A.5.7 Threat intelligence |
| ANNE-0003 | A.6.3 Remote working |
| ANNE-0004 | A.8.12 Data masking |
| ANNE-0005 | A.7.4 Physical security monitoring |
| ANNE-0006 | A.5.30 Incident response |
| ANNE-0007 | A.8.22 Data leakage prevention |

**t_iso27001_annexa_subclass__iso27001_annex_a**

| id | iso_id | iso27001_annex_a_id | role |
| --- | --- | --- | --- |
| ANNE-0001 | ANNE-0003 | ANNE-0001 | observer |
| ANNE-0002 | ANNE-0001 | ANNE-0004 | reviewer |
| ANNE-0003 | ANNE-0002 | ANNE-0007 | owner |
| ANNE-0004 | ANNE-0001 | ANNE-0003 | observer |
| ANNE-0005 | ANNE-0003 | ANNE-0007 | observer |
| ANNE-0006 | ANNE-0004 | ANNE-0005 | contributor |
| ANNE-0007 | ANNE-0003 | ANNE-0001 | reviewer |
| ANNE-0008 | ANNE-0006 | ANNE-0006 | reviewer |

**t_legal_advocate_role_role_bearer**

| id | role_bearer |
| --- | --- |
| ROLE-0001 | Priya Nair |
| ROLE-0002 | Robert Kim |
| ROLE-0003 | Aisha B. Williams |
| ROLE-0004 | Marcus Chen |
| ROLE-0005 | James T. Vance |
| ROLE-0006 | Maria G. Delgado |
| ROLE-0007 | David Okafor |

**t_legal_advocate_role__role_bearer**

| id | legal_id | role_bearer_id | role |
| --- | --- | --- | --- |
| ROLE-0001 | ROLE-0006 | ROLE-0007 | reviewer |
| ROLE-0002 | ROLE-0008 | ROLE-0007 | reviewer |
| ROLE-0003 | ROLE-0005 | ROLE-0007 | reviewer |
| ROLE-0004 | ROLE-0007 | ROLE-0005 | contributor |
| ROLE-0005 | ROLE-0007 | ROLE-0007 | reviewer |
| ROLE-0006 | ROLE-0005 | ROLE-0001 | owner |
| ROLE-0007 | ROLE-0001 | ROLE-0006 | reviewer |
| ROLE-0008 | ROLE-0002 | ROLE-0007 | reviewer |

The person dimension enters the model as role bearer rather than as an undifferentiated contact record. Priya Nair, Robert Kim, Aisha B. Williams, and Marcus Chen are not merely names stored for correspondence; they are the human agents through whom legal advocate roles become executable in practice. Junction records bind a legal subject identifier to a role_bearer target identifier and again attach a role qualifier—reviewer or contributor—so that the same individual may participate in multiple advocacy structures under different functional capacities. When ROLE-0007 appears repeatedly as a role_bearer target across distinct legal_id subjects, the model captures a concentration of review responsibility without conflating the person's identity with any single advocacy assignment. This separation is operationally consequential: personnel changes, conflict-of-interest reviews, and supervision hierarchies all depend on distinguishing who bears a role from what role type is instantiated.

Legaladvocaterole entities name the institutional or programmatic advocacy capacity itself—LegalAid-Case33, CourtAdvoc-15B, SurvivorAdvoc-118—distinct from both the bearer and the population served. The assists relationship extends that capacity toward domesticviolencesurvivor records, which in the present corpus appear as casework and referral handles such as Case-Client-004 and Ref-Survivor-091 rather than as direct personal identifiers, a design choice that supports privacy-preserving governance while still permitting service linkage. On those assists edges, role again differentiates posture: contributor implies active casework participation, observer implies monitoring without primary carriage, and owner implies accountable case responsibility. Thus a single advocate role type may simultaneously assist multiple survivor records under different role values, and a single survivor record may receive assistance mediated through more than one advocate subject, with each edge independently auditable.

**t_legal_advocate_role**

| id | legal_advocate_role |
| --- | --- |
| ROLE-0001 | LegalAid-Case33 |
| ROLE-0002 | CourtAdvoc-15B |
| ROLE-0003 | SurvivorAdvoc-118 |
| ROLE-0004 | CourtAdvoc-15B |
| ROLE-0005 | LegalShield-Intake |
| ROLE-0006 | LegalAid-Case33 |
| ROLE-0007 | LegalShield-Intake |
| ROLE-0008 | LegalAid-Case33 |

**t_legal_advocate_role_assists**

| id | assists |
| --- | --- |
| ROLE-0001 | Case-Client-004 |
| ROLE-0002 | DV-Record-338 |
| ROLE-0003 | Case-Client-004 |
| ROLE-0004 | Ref-Survivor-091 |
| ROLE-0005 | Survivor-Ref-115 |
| ROLE-0006 | Client-Code-773 |
| ROLE-0007 | DV-Client-8842 |

Cardinality note is the explicit documentary layer that states multiplicity constraints and interpretive cautions where naive one-to-one or one-to-many assumptions would misrepresent practice. Cardinality Note 01 through Cardinality Note 04 are not redundant labels; they annotate specific legal_id–assists_id pairings so that implementers, reviewers, and compliance officers understand whether duplicate edges are permitted, expected, or prohibited, and whether apparent many-to-many patterns reflect genuine operational reality or data-ingest artifacts. In advocacy contexts—where caseload overlap, co-advocacy, and transitional handoffs are common—such notes prevent automated validators from rejecting legitimate configurations and prevent analysts from inferring exclusive representation where the framework allows shared or sequential assistance. Their attachment to assists relationships rather than to person or role-type records is deliberate: multiplicity is a property of the service relationship, not of the actor's identity.

Taken together, identifier, subject, target, role, person, legaladvocaterole, domesticviolencesurvivor, and cardinality note constitute an interlocking compliance vocabulary for modeling accountable human service delivery and, by parallel structure, for mapping control frameworks to standard clauses. Subject and target orient each assertion; role qualifies participation; identifiers anchor persistence; persons instantiate roles; legaladvocaterole and domesticviolencesurvivor name the institutional and protected-party endpoints of assistance; and cardinality note records where relational multiplicity demands explicit human judgment. Systems that treat these elements as interchangeable columns—or that omit cardinality annotation on high-variance edges—will produce reports that appear complete yet misstate authority, misallocate accountability, and fail under scrutiny precisely where governance frameworks require the finest granularity.

**t_legal_advocate_role__assists**

| id | legal_id | assists_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| ROLE-0001 | ROLE-0007 | ROLE-0004 | observer | Cardinality Note 01 |
| ROLE-0002 | ROLE-0002 | ROLE-0003 | contributor | Cardinality Note 02 |
| ROLE-0003 | ROLE-0003 | ROLE-0004 | observer | Cardinality Note 03 |
| ROLE-0004 | ROLE-0006 | ROLE-0005 | owner | Cardinality Note 04 |
| ROLE-0005 | ROLE-0004 | ROLE-0007 | observer | Cardinality Note 05 |
| ROLE-0006 | ROLE-0007 | ROLE-0002 | observer | Cardinality Note 06 |
| ROLE-0007 | ROLE-0002 | ROLE-0004 | contributor | Cardinality Note 07 |
| ROLE-0008 | ROLE-0003 | ROLE-0001 | reviewer | Cardinality Note 08 |