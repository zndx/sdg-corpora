---
chapter_id: ch_live_span_with_parent_06665e
topic_id: 109
family: 07_long_tail
cited_terms: ['span_with_parent', 'belief_interval_with_upper_bound', 'radicalization_process']
model: engine-refine
---

The governance of radicalization processes rests on a structured taxonomy of phases and the organizations that participate within them. Each process—such as the Militia Formation Phase, the Network Recruit Wave, or the Radicalization Vector Delta—is recorded alongside its affiliated participants, including entities like Sympathizer Network Alpha, Al-Shabaab Recruitment Cell, and Regional Coordination Cell. This pairing of process and participant establishes the foundational audit trail: it is not merely that a process exists, but that specific organizations are documented as having taken part, enabling downstream attribution and accountability. The identifier space for these records, ranging from PROC-0001 through PROC-0004, provides a stable reference point across all subsequent relational artifacts.

**t_radicalization_process**

| id | radicalization_process | has_participant |
| --- | --- | --- |
| PROC-0001 | Militia Formation Phase | Sympathizer Network Alpha |
| PROC-0002 | Network Recruit Wave | Al-Shabaab Recruitment Cell |
| PROC-0003 | Radicalization Vector Delta | Regional Coordination Cell |
| PROC-0004 | Network Recruit Wave | Sympathizer Network Alpha |
| PROC-0005 | Ideological Shift Cycle | Militia Training Outpost |
| PROC-0006 | Radicalization Vector Delta | Ideological Mentorship Program |

Uncertainty surrounding these processes is captured through belief intervals with plausibility upper bounds, a mechanism that quantifies the degree of confidence in each observation. Belief values such as Model feature shift, Batch ingestion failure, Sensor calibration drift, and Storage quota warning are each associated with a plausibility ceiling—PARE-0002, PARE-0008, PARE-0005, PARE-0003—forming a bounded interval that constrains how far inference may extend from the recorded belief. This interval structure is not monolithic; it is decomposed into typed attributes that carry semantic meaning. The attribute dimension_kind, of type xsd:string, captures categorical descriptors like Dimension Kind 01 and Encoding 02. The attribute confidence, typed as xsd:decimal, holds numeric assessments such as 0.680 and 0.590. Additional attributes record method (xsd:string), recorded_at (xsd:dateTime), and other metadata, with values including change rationale and de. Decimal-valued attributes further extend the measurement surface, with entries like 473.67 and 703.38 attached to entity identifiers such as BOUN-0001 and BOUN-0002, while datetime attributes anchor observations to precise moments—2024-12-10T20:43:33, 2024-02-10T17:59:05, 2024-06-16T13:27:28, 2025-04-06T06:40:08—ensuring temporal traceability across the belief lifecycle.

**t_belief_interval_with_upper_bound**

| id | belief | plausibility_upper_bound |
| --- | --- | --- |
| BOUN-0001 | Model feature shift | PARE-0002 |
| BOUN-0002 | Batch ingestion failure | PARE-0008 |
| BOUN-0003 | Sensor calibration drift | PARE-0005 |
| BOUN-0004 | Storage quota warning | PARE-0003 |
| BOUN-0005 | Latency SLA breach | PARE-0001 |
| BOUN-0006 | Model feature shift | PARE-0004 |

**t_belief_interval_with_upper_bound_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| BOUN-0001 | confidence | xsd:decimal |
| BOUN-0002 | dimension_kind | xsd:string |
| BOUN-0003 | method | xsd:string |
| BOUN-0004 | recorded_at | xsd:dateTime |
| BOUN-0005 | uncertainty | xsd:decimal |
| BOUN-0006 | unit | xsd:string |
| BOUN-0007 | value | xsd:decimal |
| BOUN-0008 | encoding | xsd:string |

**t_belief_interval_with_upper_bound_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BOUN-0001 | BOUN-0001 | BOUN-0004 | 2024-12-10T20:43:33 |
| BOUN-0002 | BOUN-0002 | BOUN-0004 | 2024-02-10T17:59:05 |
| BOUN-0003 | BOUN-0003 | BOUN-0004 | 2024-06-16T13:27:28 |
| BOUN-0004 | BOUN-0004 | BOUN-0004 | 2025-04-06T06:40:08 |
| BOUN-0005 | BOUN-0005 | BOUN-0004 | 2025-03-13T22:14:49 |
| BOUN-0006 | BOUN-0006 | BOUN-0004 | 2024-01-19T21:51:57 |

**t_belief_interval_with_upper_bound_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BOUN-0001 | BOUN-0001 | BOUN-0001 | 0.680 |
| BOUN-0002 | BOUN-0001 | BOUN-0005 | 473.67 |
| BOUN-0003 | BOUN-0001 | BOUN-0007 | 703.38 |
| BOUN-0004 | BOUN-0002 | BOUN-0001 | 0.590 |
| BOUN-0005 | BOUN-0002 | BOUN-0005 | 382.46 |
| BOUN-0006 | BOUN-0002 | BOUN-0007 | 678.08 |
| BOUN-0007 | BOUN-0003 | BOUN-0001 | 0.348 |
| BOUN-0008 | BOUN-0003 | BOUN-0005 | 462.48 |

**t_belief_interval_with_upper_bound_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BOUN-0001 | BOUN-0001 | BOUN-0002 | Dimension Kind 01 |
| BOUN-0002 | BOUN-0001 | BOUN-0008 | Encoding 02 |
| BOUN-0003 | BOUN-0001 | BOUN-0009 | change rationale |
| BOUN-0004 | BOUN-0001 | BOUN-0010 | de |
| BOUN-0005 | BOUN-0001 | BOUN-0003 | automated |
| BOUN-0006 | BOUN-0001 | BOUN-0006 | m/s |
| BOUN-0007 | BOUN-0002 | BOUN-0002 | Dimension Kind 07 |
| BOUN-0008 | BOUN-0002 | BOUN-0008 | Encoding 08 |

The operational decomposition of these processes is expressed through a span hierarchy that maps parent-child relationships among execution units. Spans such as orchestrator job, api gateway route, request router, and gateway auth check are each linked to a parent span—cache lookup session, service mesh proxy, load balancer forward—forming a directed graph of operational dependency. The junction between span and parent span is itself a first-class entity, carrying an identifier (PARE-0001 through PARE-0005), a subject span, a target parent span, and a role that defines the nature of the relationship. Roles include owner, observer, and reviewer, which distinguish whether a span actively controls its parent, passively monitors it, or audits it. For instance, PARE-0004 acts as an owner of PARE-0002, while PARE-0005 assumes a reviewer role over PARE-0005, illustrating how the same identifier can participate in multiple relational contexts with distinct responsibilities.

**t_span_with_parent**

| id | span |
| --- | --- |
| PARE-0001 | orchestrator job |
| PARE-0002 | api gateway route |
| PARE-0003 | request router |
| PARE-0004 | gateway auth check |
| PARE-0005 | kafka consumer process |
| PARE-0006 | gateway auth check |
| PARE-0007 | orchestrator job |
| PARE-0008 | service mesh proxy |

**t_span_with_parent_parent_span**

| id | parent_span |
| --- | --- |
| PARE-0001 | cache lookup session |
| PARE-0002 | service mesh proxy |
| PARE-0003 | load balancer forward |
| PARE-0004 | service mesh proxy |
| PARE-0005 | kafka consumer process |
| PARE-0006 | kafka consumer process |

**t_span_with_parent__parent_span**

| id | span_id | parent_span_id | role |
| --- | --- | --- | --- |
| PARE-0001 | PARE-0004 | PARE-0002 | owner |
| PARE-0002 | PARE-0002 | PARE-0005 | observer |
| PARE-0003 | PARE-0003 | PARE-0001 | owner |
| PARE-0004 | PARE-0005 | PARE-0005 | reviewer |
| PARE-0005 | PARE-0005 | PARE-0003 | owner |
| PARE-0006 | PARE-0005 | PARE-0002 | observer |
| PARE-0007 | PARE-0004 | PARE-0002 | observer |
| PARE-0008 | PARE-0006 | PARE-0005 | contributor |

These relational layers—process-participant pairings, belief intervals with typed attributes, and span hierarchies with role-qualified edges—form an integrated evidence graph. The plausibility upper bounds reference span identifiers directly, binding uncertainty estimates to operational units; the belief interval attributes and their multi-typed values (decimal, varchar, dateTime) provide the granular metadata needed to reconstruct the state of each observation at any point in time; and the span parent-child graph, with its owner-observer-reviewer roles, supplies the structural skeleton along which accountability flows. In practice, this means that a single belief interval such as BOUN-0001, which records a belief of Model feature shift with a plausibility ceiling of PARE-0002, can be traced through its confidence value of 0.680, its dimension_kind of Dimension Kind 01, its recorded_at timestamp of 2024-12-10T20:43:33, and its associated span PARE-0002 (api gateway route, a child of service mesh proxy under an observer role), yielding a complete, auditable chain from abstract belief to concrete operational artifact.