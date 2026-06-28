---
chapter_id: ch_live_campus_event_participation_2aef93
topic_id: 42
family: 08_derived
cited_terms: ['campus_event_participation', 'syscall_traceable', 'transformation_min_one_input']
model: engine-refine
---

Campus event participation is the operational anchor through which an institution records who engages with scheduled programming and under what capacity. Each participation record carries a stable identifier—PART-0001 through PART-0004 in the current corpus—and binds that identifier to a named campusevent such as Winter Poetry Slam, Fall Welcome Week, or Astronomy Night. The identifier does not merely label a row; it becomes the join key across every downstream assertion about groups, roles, and audit lineage, so that a single participation instance can be retrieved, reconciled, and defended without ambiguity when governance reviewers ask whether a given cohort was present, accountable, or merely observed. Where Winter Poetry Slam appears twice under distinct participation identifiers, the model treats those as separate participation facts rather than duplicate events, preserving the distinction between recurring programming and distinct enrollment or attendance episodes.

**t_campus_event_participation**

| id | campus_event |
| --- | --- |
| PART-0001 | Winter Poetry Slam |
| PART-0002 | Fall Welcome Week |
| PART-0003 | Astronomy Night |
| PART-0004 | Winter Poetry Slam |
| PART-0005 | Student Government Election |
| PART-0006 | Summer Internship Fair |

Participantgroup extends participation from an abstract event binding to the constituencies that materially constitute it. Alumni Network Chapter, Undergraduate STEM Majors, and Graduate Student Association are not decorative labels; they denote the governed units whose membership, eligibility, and reporting obligations the institution recognizes when it documents outreach, compliance, or resource allocation. A participation header may name one group—PART-0001 aligns with Alumni Network Chapter, PART-0002 with Undergraduate STEM Majors—while the operational truth of who acted in what capacity lives in the subject–target association layer. There, campus_id functions as subject and has_participant_id as target, and role discriminates among contributor, observer, and owner. PART-0004’s owner assignment to Undergraduate STEM Majors, contrasted with PART-0003’s observer posture under Graduate Student Association, illustrates why role is not synonymous with membership: the same group may appear across records, yet governance weight attaches to the role edge, not to the group name alone.

Traceable by supplies the audit and telemetry vocabulary through which system-level activity is classified, aggregated, and attributed. The dimension pairs each traceable identifier with a misc label—Traceable By Label 01 through Traceable By Label 04—and a category—Traceable By Category 01 through Traceable By Category 04—so that raw counters can be interpreted within a controlled taxonomy rather than as opaque integers. Fact records then materialize event_count as the measurable burden or frequency associated with a traceable key: 238, 52, 198, and 382 events respectively for TRAC-0001 through TRAC-0004. The traceable_by_key field encodes lineage and, where it references another traceable identifier—as when TRAC-0001 and TRAC-0002 both resolve through TRAC-0003—permits analysts to roll activity up to a parent traceable node or to disaggregate it when category and label demand finer resolution. Event_count therefore answers not only how much occurred but, when read against category and misc, what class of observable behavior the institution is prepared to defend in review.

**dim_traceable_by**

| id | traceable_by_label | traceable_by_category |
| --- | --- | --- |
| TRAC-0001 | Traceable By Label 01 | Traceable By Category 01 |
| TRAC-0002 | Traceable By Label 02 | Traceable By Category 02 |
| TRAC-0003 | Traceable By Label 03 | Traceable By Category 03 |
| TRAC-0004 | Traceable By Label 04 | Traceable By Category 04 |
| TRAC-0005 | Traceable By Label 05 | Traceable By Category 05 |
| TRAC-0006 | Traceable By Label 06 | Traceable By Category 06 |

Identifiers thread these subdomains into a single evidentiary fabric. Participation identifiers, traceable identifiers, and transformation identifiers—INPU-0001 through INPU-0004—share the same structural obligation: they must remain stable across extracts, reconciliations, and retention schedules so that crosswalks do not fracture under load or organizational change. Transformation governance mirrors the campus participation pattern at the data-pipeline boundary: DataMasking, TimestampAlign, and FieldEncryption name the controlled operations applied before sensitive material moves, while input_dataset bindings—NetworkTrafficLog, CustomerTransactions, PatientRecords—declare the governed sources those operations touch. The subject–target pairing reappears with transformation_id as subject and input_dataset_id as target; even where every edge in the sample carries observer, the tripartite shape—entity, related entity, role—signals that pipeline attestations are meant to be queried the same way participation attestations are, by walking subject to target and reading role as the non-optional qualifier of the relationship.

**t_transformation_min_one_input**

| id | transformation |
| --- | --- |
| INPU-0001 | DataMasking |
| INPU-0002 | TimestampAlign |
| INPU-0003 | FieldEncryption |
| INPU-0004 | FieldEncryption |
| INPU-0005 | RowFiltering |
| INPU-0006 | DuplicateRemoval |

**t_transformation_min_one_input_input_dataset**

| id | input_dataset |
| --- | --- |
| INPU-0001 | NetworkTrafficLog |
| INPU-0002 | CustomerTransactions |
| INPU-0003 | NetworkTrafficLog |
| INPU-0004 | PatientRecords |
| INPU-0005 | SupplyChainEvents |
| INPU-0006 | NetworkTrafficLog |

**t_transformation_min_one_input__input_dataset**

| id | transformation_id | input_dataset_id | role |
| --- | --- | --- | --- |
| INPU-0001 | INPU-0006 | INPU-0005 | observer |
| INPU-0002 | INPU-0004 | INPU-0001 | observer |
| INPU-0003 | INPU-0003 | INPU-0002 | observer |
| INPU-0004 | INPU-0001 | INPU-0004 | observer |
| INPU-0005 | INPU-0006 | INPU-0003 | reviewer |
| INPU-0006 | INPU-0003 | INPU-0001 | contributor |
| INPU-0007 | INPU-0005 | INPU-0005 | contributor |
| INPU-0008 | INPU-0003 | INPU-0005 | contributor |

In practice, reviewers and operators work from the intersection of campusevent narrative, participantgroup constituency, and traceable_by measurement. A compliance inquiry into Winter Poetry Slam begins at the participation identifier, follows into group and role edges to determine whether Undergraduate STEM Majors held owner authority or merely observed, and may extend outward to syscall facts if the same review window must explain correlated system activity. Category and misc on the traceable dimension prevent event_count from collapsing into a single undifferentiated total: 382 events under Traceable By Category 04 and Label 04 are not interchangeable with 52 events under Category 02 and Label 02, even when both figures appear in the same reporting period. Transformation records close the loop for datasets that feed or echo campus operations—FieldEncryption applied twice across distinct input paths shows that identical operation names do not imply identical data scope when subject and target pairs diverge. Taken together, campusevent, participantgroup, role, subject, target, identifier, traceable by, category, misc, and event_count form a coherent governance grammar: name the event, bind the governed actors, qualify every relationship, classify every observable, count what occurred, and preserve keys sufficient to reconstruct the chain under examination.

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

**fact_syscall**

| id | traceable_by_key | event_count |
| --- | --- | --- |
| TRAC-0001 | TRAC-0003 | 238 |
| TRAC-0002 | TRAC-0003 | 52 |
| TRAC-0003 | TRAC-0001 | 198 |
| TRAC-0004 | TRAC-0004 | 382 |
| TRAC-0005 | TRAC-0004 | 283 |
| TRAC-0006 | TRAC-0005 | 288 |