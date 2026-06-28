---
chapter_id: ch_live_provenance_agent_subclass_9c8020
topic_id: 26
family: 05_provo_lineage
cited_terms: ['provenance_agent_subclass', 'qualification_process', 'qualifications_framework']
model: engine-refine
---

In governance and compliance architectures, the provenance of data and the accountability of its handlers form the bedrock of trust. Agent subclasses are identified by codes such as AGEN-0001 through AGEN-0004, each anchored to a provenance source—audit-trail-archive, clinical-trial-raw, feature-store-export, or telemetry-stream-alpha—that records where the data originated. These agents are not abstract entities; they carry concrete responsibilities like system-auditor, data-steward, lab-coordinator, and etl-scheduler, which define what they are authorized to do within the system. The linkage between agents and their responsibilities is mediated through a junction table that captures not only which agent assumes which responsibility but also the role they play in that relationship—contributor, reviewer, or observer—alongside cardinality notes that constrain how many responsibilities an agent may hold or how many agents may share a single responsibility. For instance, agent AGEN-0004, sourced from telemetry-stream-alpha, assumes the system-auditor responsibility in a reviewer capacity, while AGEN-0002, originating from clinical-trial-raw, serves as a data-steward in a reviewer role. This layered association model ensures that accountability is traceable, auditable, and explicitly bounded.

**t_provenance_agent_subclass**

| id | provenance |
| --- | --- |
| AGEN-0001 | audit-trail-archive |
| AGEN-0002 | clinical-trial-raw |
| AGEN-0003 | feature-store-export |
| AGEN-0004 | telemetry-stream-alpha |
| AGEN-0005 | pipeline-logs-v2 |
| AGEN-0006 | telemetry-stream-alpha |

**t_provenance_agent_subclass_responsibility**

| id | responsibility |
| --- | --- |
| AGEN-0001 | system-auditor |
| AGEN-0002 | data-steward |
| AGEN-0003 | lab-coordinator |
| AGEN-0004 | etl-scheduler |
| AGEN-0005 | lab-coordinator |
| AGEN-0006 | data-steward |
| AGEN-0007 | data-steward |

**t_provenance_agent_subclass__responsibility**

| id | provenance_id | responsibility_id | role |
| --- | --- | --- | --- |
| AGEN-0001 | AGEN-0004 | AGEN-0005 | contributor |
| AGEN-0002 | AGEN-0004 | AGEN-0002 | observer |
| AGEN-0003 | AGEN-0002 | AGEN-0001 | reviewer |
| AGEN-0004 | AGEN-0004 | AGEN-0007 | reviewer |
| AGEN-0005 | AGEN-0001 | AGEN-0002 | owner |
| AGEN-0006 | AGEN-0005 | AGEN-0007 | observer |
| AGEN-0007 | AGEN-0003 | AGEN-0003 | reviewer |
| AGEN-0008 | AGEN-0001 | AGEN-0001 | owner |

Beyond provenance and responsibility, the framework extends into qualification management, where structured processes govern how individuals or entities earn standing in competitive or regulatory environments. Qualification processes such as the Regional Wildcard Series, Continental Draft Combine, and North American Open Bracket each require a specific membership registration—FIDE Master Rating, FIFA Member Federation, or USATF Athletic License—and yield a defined championship entry, whether that be a Finals Roster Position, a Final Four Invitation, or a Playoff Wildcard Spot. The USATF Athletic License, for example, is required by two distinct processes—the Regional Wildcard Series and the North American Open Bracket—each producing a Playoff Wildcard Spot as its outcome. This one-to-many relationship between membership and qualification process illustrates how a single credential can serve as a gateway to multiple competitive pathways, while the championship entry it produces determines the participant's standing in the broader ecosystem.

**t_qualification_process**

| id | qualification_process | requires_membership | yields_championship_entry |
| --- | --- | --- | --- |
| PROC-0001 | Regional Wildcard Series | FIDE Master Rating | Finals Roster Position |
| PROC-0002 | Continental Draft Combine | FIFA Member Federation | Final Four Invitation |
| PROC-0003 | Regional Wildcard Series | USATF Athletic License | Playoff Wildcard Spot |
| PROC-0004 | North American Open Bracket | USATF Athletic License | Playoff Wildcard Spot |

The qualifications framework operates on a parallel but distinct axis, organizing formal credentials and their associated learning outcomes. Framework entries such as Master of Science Data, National Vocational Qualification, European Qualifications Framework, and Certified Public Accountant each articulate specific learning outcomes—Cloud Infrastructure Deployment, Agile Project Management, Natural Language Processing—that define the competencies a holder must demonstrate. The articulation relationship is itself governed by a junction table that assigns a role—owner, reviewer, or contributor—to each pairing, establishing who is accountable for the integrity of the learning outcome within the qualification. Certified Public Accountant, for instance, is linked to Cloud Infrastructure Deployment with a reviewer role, while National Vocational Qualification connects to Agile Project Management as an observer. This role-based mediation ensures that learning outcomes are not merely listed but are actively maintained by designated stakeholders.

**t_qualifications_framework**

| id | qualifications |
| --- | --- |
| FRAM-0001 | Master of Science Data |
| FRAM-0002 | National Vocational Qualification |
| FRAM-0003 | European Qualifications Framework |
| FRAM-0004 | Certified Public Accountant |
| FRAM-0005 | Professional Engineer License |
| FRAM-0006 | Graduate Certificate Cyber |

Qualification levels further refine the framework by mapping each credential to a standardized proficiency tier. Advanced Practitioner, EQF Level Three, and NFQ Level Six represent the hierarchical positions that qualifications occupy within broader educational or professional standards. The specification relationship between qualifications and levels is captured in a dedicated junction table that again employs role and cardinality_note columns to document the nature of the mapping. Qualification FRAM-0006, for example, specifies two different qualification levels—FRAM-0006 and FRAM-0007—with roles of contributor and owner respectively, each accompanied by a cardinality note (Cardinality Note 01 and Cardinality Note 02) that constrains the multiplicity of the relationship. Similarly, FRAM-0002 specifies FRAM-0001 as an owner with Cardinality Note 03, while FRAM-0004 specifies FRAM-0005 as a reviewer with Cardinality Note 04. These cardinality notes serve as explicit governance markers, documenting whether a qualification maps to one or many levels and whether the relationship is mandatory or optional.

**t_qualifications_framework_specifies**

| id | specifies |
| --- | --- |
| FRAM-0001 | Advanced Practitioner |
| FRAM-0002 | EQF Level Three |
| FRAM-0003 | Advanced Practitioner |
| FRAM-0004 | NFQ Level Six |
| FRAM-0005 | Associate Degree |
| FRAM-0006 | Postgraduate Master |
| FRAM-0007 | Entry Level Technician |

**t_qualifications_framework__specifies**

| id | qualifications_id | specifies_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| FRAM-0001 | FRAM-0006 | FRAM-0006 | contributor | Cardinality Note 01 |
| FRAM-0002 | FRAM-0006 | FRAM-0007 | owner | Cardinality Note 02 |
| FRAM-0003 | FRAM-0002 | FRAM-0001 | owner | Cardinality Note 03 |
| FRAM-0004 | FRAM-0004 | FRAM-0005 | reviewer | Cardinality Note 04 |
| FRAM-0005 | FRAM-0003 | FRAM-0007 | contributor | Cardinality Note 05 |
| FRAM-0006 | FRAM-0002 | FRAM-0001 | reviewer | Cardinality Note 06 |
| FRAM-0007 | FRAM-0005 | FRAM-0007 | reviewer | Cardinality Note 07 |
| FRAM-0008 | FRAM-0002 | FRAM-0007 | contributor | Cardinality Note 08 |

Together, these tables form a cohesive relational model that separates identity, responsibility, qualification, and proficiency into distinct but interconnected domains. The provenance subsystem ensures that every data asset can be traced to its source and that every agent handling it does so under a clearly defined responsibility and role. The qualification subsystem ensures that credentials are not static labels but dynamic constructs tied to learning outcomes, proficiency levels, and competitive processes. The junction tables—t_provenance_agent_subclass__responsibility, t_qualifications_framework__articulates, and t_qualifications_framework__specifies—serve as the connective tissue, encoding not just which entities relate to which but how they relate: through what role, under what cardinality constraints, and with what level of accountability. This design enables granular governance, where compliance can be verified at the level of individual relationships rather than at the coarse level of entire datasets.

**t_qualifications_framework_articulates**

| id | articulates |
| --- | --- |
| FRAM-0001 | Cloud Infrastructure Deployment |
| FRAM-0002 | Agile Project Management |
| FRAM-0003 | Natural Language Processing |
| FRAM-0004 | Natural Language Processing |
| FRAM-0005 | Machine Learning Model Training |
| FRAM-0006 | Cybersecurity Threat Modeling |

**t_qualifications_framework__articulates**

| id | qualifications_id | articulates_id | role |
| --- | --- | --- | --- |
| FRAM-0001 | FRAM-0004 | FRAM-0001 | observer |
| FRAM-0002 | FRAM-0004 | FRAM-0001 | reviewer |
| FRAM-0003 | FRAM-0001 | FRAM-0003 | owner |
| FRAM-0004 | FRAM-0002 | FRAM-0005 | observer |
| FRAM-0005 | FRAM-0006 | FRAM-0004 | reviewer |
| FRAM-0006 | FRAM-0003 | FRAM-0004 | owner |
| FRAM-0007 | FRAM-0004 | FRAM-0005 | reviewer |
| FRAM-0008 | FRAM-0004 | FRAM-0005 | reviewer |