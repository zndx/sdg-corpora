---
chapter_id: ch_live_lru_hash_map_subclass_07a19c
topic_id: 180
family: 07_long_tail
cited_terms: ['lru_hash_map_subclass', 'campus_event_participation', 'provenance_agent_subclass']
model: engine-refine
---

Campus events constitute the governed activity surface through which institutional programs are declared, staffed, and audited: a Winter Poetry Slam may recur across participation cycles, a Fall Welcome Week may anchor orientation obligations, and an Astronomy Night may stand as a discrete outreach commitment whose enrollment and accountability must be traceable independent of the calendar label alone. In operational governance, the event is never merely a title on a schedule; it is the semantic anchor that binds participation records, participant cohorts, and the directional assignments that determine who may act on whose behalf. Where PART-0001 and PART-0004 both reference Winter Poetry Slam, the repetition signals a durable event identity that can accumulate multiple participation envelopes without collapsing distinct governance episodes into a single undifferentiated record.

Identifiers supply the stable referential spine on which every other assertion depends. MAP-0001 through MAP-0004, PART-0001 through PART-0004, and AGEN-0001 through AGEN-0004 are not decorative labels; they are durable keys that allow configuration, participation, and provenance subgraphs to be joined, versioned, and reviewed without ambiguity. The identifier pattern extends across heterogeneous domains—primary-db-cache and stream-event-cache on the LRU side, audit-trail-archive and telemetry-stream-alpha on the provenance side—so that the same governance machinery can address caching policy, campus programming, and data-lineage stewardship with uniform audit semantics. When a junction row carries campus_id PART-0003 and has_participant_id PART-0004, those identifiers do not describe the event or the cohort in prose; they locate the exact participation and participant entities whose relationship is under review.

**t_lru_hash_map_subclass_l_r_u_hash_config**

| id | l_r_u_hash_config |
| --- | --- |
| MAP-0001 | siphash-2-4 |
| MAP-0002 | xxhash64 |
| MAP-0003 | robin-hood |
| MAP-0004 | sparse-block-map |
| MAP-0005 | murmur3-128 |
| MAP-0006 | murmur3-128 |

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

Participant groups name the collective actors whose membership defines scope of authority, notification, and compliance obligation. Alumni Network Chapter, Undergraduate STEM Majors, and Graduate Student Association are not interchangeable populations: each cohort carries distinct policy implications for access, reporting, and escalation. A single campus event may therefore attract multiple participant groups across separate participation records, and the same cohort—Undergraduate STEM Majors appearing under both PART-0002 and PART-0004—may engage different events under different governance postures. Participant group identity is thus orthogonal to event identity; conflating the two would erase the institutional requirement to know not only what happened, but which constituency was bound to it.

Subject and target formalize directionality in relational governance. The subject is the entity from which an assignment originates; the target is the entity upon which that assignment lands. In campus participation, campus_id PART-0005 paired with has_participant_id PART-0003 expresses a directed link between a participation envelope and a participant-group record, not a symmetric association. The same structural discipline appears outside the campus domain: provenance_id AGEN-0004 linked to responsibility_id AGEN-0005, or lru_id MAP-0007 bound to l_r_u_hash_config_id MAP-0004, each instance preserving a subject-to-target vector that auditors can traverse without inferring orientation from naming alone. Subject-target pairing is what converts parallel registries of events, groups, hash configurations, and responsibilities into an explicit graph of accountable relationships.

Role qualifies each subject-target edge with the operative capacity assigned along that edge. Contributor, observer, reviewer, and owner are not synonymous standing; they encode differentiated permissions and evidentiary weight. An observer on Fall Welcome Week participation does not carry the same operational mandate as an owner on a Winter Poetry Slam assignment, even when both rows share the junction pattern. Cross-domain recurrence of reviewer—on MAP-0001’s LRU-to-config binding and on AGEN-0004’s provenance-to-responsibility binding—demonstrates that role is a portable governance primitive: the same vocabulary of capacity applies whether the underlying subject is a cache subclass, a campus participation record, or a provenance agent. Where provenance_id AGEN-0002 assumes observer while AGEN-0003 assumes contributor against distinct responsibility targets, the role field supplies the fine-grained distinction that subject and target alone cannot.

**t_lru_hash_map_subclass__l_r_u_hash_config**

| id | lru_id | l_r_u_hash_config_id | role |
| --- | --- | --- | --- |
| MAP-0001 | MAP-0007 | MAP-0004 | reviewer |
| MAP-0002 | MAP-0004 | MAP-0002 | contributor |
| MAP-0003 | MAP-0003 | MAP-0002 | observer |
| MAP-0004 | MAP-0005 | MAP-0004 | reviewer |
| MAP-0005 | MAP-0004 | MAP-0005 | owner |
| MAP-0006 | MAP-0001 | MAP-0003 | contributor |
| MAP-0007 | MAP-0005 | MAP-0005 | reviewer |
| MAP-0008 | MAP-0007 | MAP-0002 | observer |

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

Taken together, campus event, identifier, participant group, subject, target, and role constitute a reusable compliance grammar for declaring what occurred, who was implicated, and under what authority assertions were made. Campus events supply the programmatic fact; identifiers stabilize every node; participant groups bound human and organizational scope; subject and target orient each governed link; and role states the permissible action along that link. Whether the evidentiary thread runs from Winter Poetry Slam through Undergraduate STEM Majors with owner standing, or from stream-event-cache through xxhash64 with reviewer standing, the same compositional logic yields auditable, directionally explicit records suitable for handbook enforcement, operational review, and downstream reconciliation without reinterpretation of the underlying relationships.

**t_lru_hash_map_subclass**

| id | lru |
| --- | --- |
| MAP-0001 | primary-db-cache |
| MAP-0002 | stream-event-cache |
| MAP-0003 | global-rate-limiter |
| MAP-0004 | prod-session-cache |
| MAP-0005 | primary-db-cache |
| MAP-0006 | stream-event-cache |
| MAP-0007 | prod-session-cache |

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