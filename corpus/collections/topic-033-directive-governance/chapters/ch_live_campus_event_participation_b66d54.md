---
chapter_id: ch_live_campus_event_participation_b66d54
topic_id: 33
family: 08_derived
cited_terms: ['campus_event_participation', 'carbon_credit_transaction', 'cardinality_exactly_one_generic']
model: engine-refine
---

Identifiers serve as the immutable anchors across all operational domains, providing stable references that persist regardless of how entities are grouped or related. A campus participation record carries the identifier PART-0001, while a carbon credit transaction is identified by TRAN-0001, and a cardinality constraint by GENE-0001. These identifiers are not merely labels; they are the primary keys that enable cross-referencing between tables and ensure that every relationship can be traced back to its source entities. In practice, the identifier PART-0001 links the Winter Poetry Slam to the Alumni Network Chapter, while TRAN-0001 connects the carbon credit CAR-2023-6677 to the Iceland-Geothermal project and ultimately to the purchasing entity Norway-Wealth. The consistency of this identification scheme across domains—campus events, carbon credits, and governance constraints—means that auditors and operators can follow a single reference through multiple layers of association without ambiguity.

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

**t_carbon_credit_transaction**

| id | carbon_credit_transaction |
| --- | --- |
| TRAN-0001 | CAR-2023-6677 |
| TRAN-0002 | VCS-TRX-8812 |
| TRAN-0003 | GS-TRX-8814 |
| TRAN-0004 | ACR-CC-7721 |
| TRAN-0005 | CARB-2024-3305 |
| TRAN-0006 | CARB-2024-3305 |

**t_carbon_credit_transaction_transferred_to**

| id | transferred_to |
| --- | --- |
| TRAN-0001 | Norway-Wealth |
| TRAN-0002 | AFK-Environmental |
| TRAN-0003 | Orsted-NetZero |
| TRAN-0004 | Maersk-Offsetting |
| TRAN-0005 | Orsted-NetZero |
| TRAN-0006 | AFK-Environmental |

**t_cardinality_exactly_one_generic**

| id | cardinality | related |
| --- | --- | --- |
| GENE-0001 | ExclusiveOwner | CoreService |
| GENE-0002 | ExclusiveOwner | SingleSource |
| GENE-0003 | StrictParent | DesignatedOwner |
| GENE-0004 | StrictParent | SourceSystem |
| GENE-0005 | ExclusiveOwner | TargetNode |

Campus event participation is modeled as a many-to-many relationship between events and participant groups, mediated through a participation record that captures both the association and the nature of involvement. The Winter Poetry Slam, for instance, appears in participation records PART-0001 and PART-0004, linking it to both the Alumni Network Chapter and Undergraduate STEM Majors. The Fall Welcome Week connects to the Graduate Student Association through PART-0003, while Astronomy Night is associated with Undergraduate STEM Majors via PART-0002. The relationship between a participation record and a participant group is further qualified by a role—contributor, observer, or owner—which specifies the nature of the group's engagement. In the cross-reference table, PART-0003 (Astronomy Night) assigns the Graduate Student Association the role of observer, whereas PART-0001 (Winter Poetry Slam) designates the Alumni Network Chapter as a contributor. This role-based qualification ensures that the same participant group can hold different levels of involvement across events, and that the system can distinguish between a group that actively organizes an event and one that merely attends.

Carbon credit transactions follow a parallel but more complex relational structure, where each transaction derives from a certified project and is subsequently transferred to a purchasing entity. The transaction CAR-2023-6677 (TRAN-0001) originates from the Iceland-Geothermal project and is transferred to Norway-Wealth, while VCS-TRX-8812 (TRAN-0002) traces back to Nepal-Afforestation and moves to AFK-Environmental. The GS-TRX-8814 transaction (TRAN-0003) is sourced from Brazil-Biochar and transferred to Orsted-NetZero, and ACR-CC-7721 (TRAN-0004) also derives from Nepal-Afforestation, ending up with Maersk-Offsetting. The derivation relationship between a transaction and its source project is itself role-qualified: TRAN-0002 carries the role of owner in its derivation from project TRAN-0005, while TRAN-0003 and TRAN-0001 both carry the role of contributor. This role distinction is critical for carbon accounting, as it determines which entity holds primary responsibility for the verified emission reductions and which entities are secondary stakeholders in the project's lifecycle.

**t_carbon_credit_transaction_derives_from_project**

| id | derives_from_project |
| --- | --- |
| TRAN-0001 | Iceland-Geothermal |
| TRAN-0002 | Nepal-Afforestation |
| TRAN-0003 | Brazil-Biochar |
| TRAN-0004 | Nepal-Afforestation |
| TRAN-0005 | Amazonia-REDD |
| TRAN-0006 | Kerala-Mangrove |

**t_carbon_credit_transaction__derives_from_project**

| id | carbon_id | derives_from_project_id | role |
| --- | --- | --- | --- |
| TRAN-0001 | TRAN-0002 | TRAN-0005 | owner |
| TRAN-0002 | TRAN-0006 | TRAN-0003 | contributor |
| TRAN-0003 | TRAN-0003 | TRAN-0005 | contributor |
| TRAN-0004 | TRAN-0001 | TRAN-0005 | contributor |
| TRAN-0005 | TRAN-0002 | TRAN-0002 | contributor |
| TRAN-0006 | TRAN-0004 | TRAN-0003 | contributor |
| TRAN-0007 | TRAN-0003 | TRAN-0003 | owner |
| TRAN-0008 | TRAN-0006 | TRAN-0006 | reviewer |

The transfer of carbon credits to purchasing entities is governed by cardinality constraints that enforce business rules about how many entities can be involved in a given relationship. Each transfer record carries a cardinality note—Cardinality Note 01 through Cardinality Note 04—that specifies the multiplicity and exclusivity requirements of the association. For example, the generic cardinality table defines constraints such as ExclusiveOwner, which mandates that a single entity holds sole ownership of a relationship, and StrictParent, which enforces a one-to-many hierarchy. In the transfer context, TRAN-0002 assigns the role of contributor to the purchasing entity relationship, while TRAN-0005 and TRAN-0001 both carry the role of owner, indicating that certain purchasing entities may hold primary rights to the credits they acquire. The cardinality notes ensure that these relationships comply with regulatory requirements, such as preventing double-counting of offset credits or ensuring that a single project's output is not transferred to multiple buyers without proper allocation.

Subject and target columns formalize the directionality of relationships, making the data model explicit about which entity initiates a relationship and which receives it. In the campus participation cross-reference, the subject column (campus_id) points to the participation record while the target column (has_participant_id) points to the participant group, establishing a clear flow from event to group. Similarly, in the carbon credit transfer table, the subject (carbon_id) references the transaction and the target (transferred_to_id) references the purchasing entity, making it unambiguous that credits flow from transactions to buyers. This subject-target pattern, combined with the role column, creates a triple that fully describes any relationship: who is involved, what their role is, and which direction the association flows. The generic cardinality table extends this pattern by applying constraints to abstract entity pairs, with the related column specifying the target entity type and the cardinality column defining the nature of the constraint—whether it is ExclusiveOwner, StrictParent, or another governance rule.

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

**t_carbon_credit_transaction__transferred_to**

| id | carbon_id | transferred_to_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| TRAN-0001 | TRAN-0002 | TRAN-0001 | contributor | Cardinality Note 01 |
| TRAN-0002 | TRAN-0005 | TRAN-0003 | owner | Cardinality Note 02 |
| TRAN-0003 | TRAN-0001 | TRAN-0002 | owner | Cardinality Note 03 |
| TRAN-0004 | TRAN-0006 | TRAN-0003 | observer | Cardinality Note 04 |
| TRAN-0005 | TRAN-0004 | TRAN-0001 | reviewer | Cardinality Note 05 |
| TRAN-0006 | TRAN-0001 | TRAN-0004 | observer | Cardinality Note 06 |
| TRAN-0007 | TRAN-0002 | TRAN-0005 | owner | Cardinality Note 07 |
| TRAN-0008 | TRAN-0002 | TRAN-0006 | observer | Cardinality Note 08 |