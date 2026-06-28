---
chapter_id: ch_live_campus_event_participation_9801c0
topic_id: 83
family: 08_derived
cited_terms: ['campus_event_participation', 'radicalization_process', 'dempster_conflict_mass']
model: engine-refine
---

Affiliated organizations, campus events, and participant groups form the foundational entities through which institutional engagement and social affiliation are catalogued and analyzed. Campus events such as the Winter Poetry Slam, Fall Welcome Week, and Astronomy Night serve as observable nodes of community activity, each associated with distinct participant groups ranging from the Alumni Network Chapter to Undergraduate STEM Majors and the Graduate Student Association. The participation records—identified by codes such as PART-0001 through PART-0006—establish not merely which groups attended which events, but the nature of their involvement: a group may appear as a contributor, an observer, or an owner, roles that carry different implications for accountability, influence, and institutional alignment. This tripartite structure of event, participant, and role enables granular reconstruction of social dynamics, distinguishing passive attendance from active sponsorship and enabling downstream analysis of network centrality and affiliation patterns.

**t_campus_event_participation**

| id | campus_event |
| --- | --- |
| PART-0001 | Winter Poetry Slam |
| PART-0002 | Fall Welcome Week |
| PART-0003 | Astronomy Night |
| PART-0004 | Winter Poetry Slam |
| PART-0005 | Student Government Election |
| PART-0006 | Summer Internship Fair |

**t_campus_event_participation_has_participant**

| id | has_participant |
| --- | --- |
| PART-0001 | Alumni Network Chapter |
| PART-0002 | Undergraduate STEM Majors |
| PART-0003 | Graduate Student Association |
| PART-0004 | Undergraduate STEM Majors |
| PART-0005 | Campus Sustainability Volunteers |
| PART-0006 | Campus Sustainability Volunteers |
| PART-0007 | First-Year Resident Advisors |

**t_campus_event_participation__has_participant**

| id | campus_id | has_participant_id | role |
| --- | --- | --- | --- |
| PART-0001 | PART-0003 | PART-0004 | contributor |
| PART-0002 | PART-0005 | PART-0003 | observer |
| PART-0003 | PART-0002 | PART-0006 | observer |
| PART-0004 | PART-0006 | PART-0001 | owner |
| PART-0005 | PART-0003 | PART-0004 | observer |
| PART-0006 | PART-0004 | PART-0005 | reviewer |
| PART-0007 | PART-0002 | PART-0003 | owner |
| PART-0008 | PART-0004 | PART-0002 | observer |

The radicalization process dimension extends this analytical framework into the domain of security-relevant organizational behavior, tracking the progression of groups through identifiable phases of radicalization. Records such as the Militia Formation Phase, Network Recruit Wave, and Radicalization Vector Delta represent discrete stages in the evolution of extremist or hostile organizational structures, each linked to specific affiliated organizations including the Sympathizer Network Alpha, the Al-Shabaab Recruitment Cell, and the Regional Coordination Cell. The presence of an affiliated organization within a radicalization process record signals its operational involvement at that stage, enabling analysts to map organizational participation across the radicalization continuum and identify which entities appear repeatedly across multiple phases—a pattern that may indicate entrenchment, institutionalization, or escalation. The repetition of Sympathizer Network Alpha across multiple process records, for instance, suggests sustained organizational engagement rather than episodic involvement.

**t_radicalization_process**

| id | radicalization_process | has_participant |
| --- | --- | --- |
| PROC-0001 | Militia Formation Phase | Sympathizer Network Alpha |
| PROC-0002 | Network Recruit Wave | Al-Shabaab Recruitment Cell |
| PROC-0003 | Radicalization Vector Delta | Regional Coordination Cell |
| PROC-0004 | Network Recruit Wave | Sympathizer Network Alpha |
| PROC-0005 | Ideological Shift Cycle | Militia Training Outpost |
| PROC-0006 | Radicalization Vector Delta | Ideological Mentorship Program |

The Dempster-Shafer evidence framework provides the quantitative backbone for assessing the reliability and weight of observations drawn from these relational structures. Within this framework, conflict mass values—such as 520.46, 137.18, 197.61, and 846.10—represent the degree of belief assigned to specific propositions about conflict states, while confidence values ranging from 0.014 to 0.728 quantify the analyst's certainty in those assignments. The inverse relationship between confidence and uncertainty is evident in the data: a record with confidence of 0.728 exhibits an uncertainty of 479.57, whereas a record with confidence of only 0.014 carries an uncertainty of 392.06, reflecting the complex, non-linear interplay between belief assignment and evidential support in Dempster-Shafer theory. These mass values are not arbitrary; they are anchored to conflict mass identifiers such as MASS-0001 through MASS-0005, which in turn map to labeled categories—Conflict Mass Label 01 through Conflict Mass Label 04, each belonging to a defined category from Conflict Mass Category 01 through Conflict Mass Category 04—providing the semantic grounding necessary for operational interpretation.

**fact_dempster**

| id | conflict_mass_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| MASS-0001 | MASS-0003 | 0.153 | 9.49 | 520.46 |
| MASS-0002 | MASS-0002 | 0.014 | 392.06 | 137.18 |
| MASS-0003 | MASS-0005 | 0.025 | 687.80 | 197.61 |
| MASS-0004 | MASS-0001 | 0.728 | 479.57 | 846.10 |
| MASS-0005 | MASS-0006 | 0.918 | 172.36 | 296.96 |
| MASS-0006 | MASS-0001 | 0.755 | 608.06 | 341.51 |

**dim_conflict_mass**

| id | conflict_mass_label | conflict_mass_category |
| --- | --- | --- |
| MASS-0001 | Conflict Mass Label 01 | Conflict Mass Category 01 |
| MASS-0002 | Conflict Mass Label 02 | Conflict Mass Category 02 |
| MASS-0003 | Conflict Mass Label 03 | Conflict Mass Category 03 |
| MASS-0004 | Conflict Mass Label 04 | Conflict Mass Category 04 |
| MASS-0005 | Conflict Mass Label 05 | Conflict Mass Category 05 |
| MASS-0006 | Conflict Mass Label 06 | Conflict Mass Category 06 |

The integration of these dimensions—relational affiliation data, radicalization process tracking, and Dempster-Shafer evidential quantification—creates a multi-layered analytical architecture capable of supporting both descriptive and inferential governance functions. Campus event participation records establish baseline social topology; radicalization process records overlay security-relevant behavioral progression; and conflict mass evidence records provide the probabilistic scaffolding for reasoning under uncertainty. When a participant group such as Undergraduate STEM Majors appears across multiple event records with different roles, or when an affiliated organization like the Regional Coordination Cell is linked to a specific radicalization phase, the conflict mass framework allows analysts to assign confidence-weighted assessments to these associations, distinguishing well-supported inferences from speculative ones. The uncertainty values—spanning from 9.49 to 687.80—serve as a critical calibration mechanism, ensuring that conclusions drawn from the relational data are proportionate to the strength of the underlying evidence.