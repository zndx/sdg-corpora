---
chapter_id: ch_live_attestation_basic_ca5418
topic_id: 123
family: 03_directive_governance
cited_terms: ['attestation_basic', 'observation_governed_by_policy', 'campus_event_participation']
model: engine-refine
---

Attestation and policy-governed observation records sit at the center of a compliance-oriented information model in which every governed fact must be addressable, typed, and traceable across heterogeneous operational domains. An identifier furnishes that addressability: values such as ATTE-0001 and POLI-0003 denote distinct attestations and observations without embedding semantic content in the key itself, so that Vendor risk assessment, HIPAA compliance review, ML model fairness audit, and north vent temperature spike can each accumulate evidence, undergo revision, and be cited in audit findings under stable references even when descriptive labels repeat or evolve. The identifier therefore functions less as a label than as a durable coordinate in a governance graph, permitting crosswalks between human-readable narratives and machine-verifiable stores.

**t_attestation_basic**

| id | attestation |
| --- | --- |
| ATTE-0001 | Vendor risk assessment |
| ATTE-0002 | HIPAA compliance review |
| ATTE-0003 | ML model fairness audit |
| ATTE-0004 | HIPAA compliance review |
| ATTE-0005 | SOC 2 Type II audit |
| ATTE-0006 | Vendor risk assessment |

**t_observation_governed_by_policy**

| id | observation |
| --- | --- |
| POLI-0001 | north vent temperature spike |
| POLI-0002 | ingestion pipeline backpressure |
| POLI-0003 | core switch packet loss |
| POLI-0004 | edge gateway heartbeat timeout |
| POLI-0005 | core switch packet loss |
| POLI-0006 | backup restore checksum failure |

The entity is the bearer of attributable state: the compliance artifact, monitored condition, or participation record to which measured or declared facts properly belong. When duration_seconds resolves to 7132.97 for ATTE-0001 and to 3894.03 for ATTE-0003, or when end_time records 2024-11-18T12:26:52 against one attestation and 2023-09-08T13:00:56 against another, the entity anchor—not the value row alone—establishes which subject of governance is being characterized. That separation matters in practice because a single entity may carry many concurrent attribute bindings, as when ATTE-0001 simultaneously holds decimal duration, datetime boundaries, integer exit codes, and varchar host or status tokens including ingest-21 and superseded; auditors reconstruct provenance by joining through the entity, not by treating isolated misc entries as self-explanatory.

**t_attestation_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTE-0001 | ATTE-0001 | ATTE-0002 | 2024-11-18T12:26:52 |
| ATTE-0002 | ATTE-0001 | ATTE-0008 | 2023-12-15T15:31:35 |
| ATTE-0003 | ATTE-0001 | ATTE-0009 | 2023-03-05T20:41:52 |
| ATTE-0004 | ATTE-0002 | ATTE-0002 | 2023-09-08T13:00:56 |
| ATTE-0005 | ATTE-0002 | ATTE-0008 | 2024-07-29T18:29:50 |
| ATTE-0006 | ATTE-0002 | ATTE-0009 | 2024-08-01T11:14:05 |
| ATTE-0007 | ATTE-0003 | ATTE-0002 | 2023-01-08T06:41:42 |
| ATTE-0008 | ATTE-0003 | ATTE-0008 | 2025-06-10T02:28:19 |

**t_attestation_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTE-0001 | ATTE-0001 | ATTE-0001 | 7132.97 |
| ATTE-0002 | ATTE-0002 | ATTE-0001 | 6429.54 |
| ATTE-0003 | ATTE-0003 | ATTE-0001 | 3894.03 |
| ATTE-0004 | ATTE-0004 | ATTE-0001 | 6507.32 |
| ATTE-0005 | ATTE-0005 | ATTE-0001 | 5722.64 |
| ATTE-0006 | ATTE-0006 | ATTE-0001 | 4627.41 |

**t_attestation_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTE-0001 | ATTE-0001 | ATTE-0004 | ingest-21 |
| ATTE-0002 | ATTE-0001 | ATTE-0005 | Log Level 02 |
| ATTE-0003 | ATTE-0001 | ATTE-0006 | initiation |
| ATTE-0004 | ATTE-0001 | ATTE-0010 | superseded |
| ATTE-0005 | ATTE-0001 | ATTE-0011 | Triggered By 05 |
| ATTE-0006 | ATTE-0002 | ATTE-0004 | gw-12 |
| ATTE-0007 | ATTE-0002 | ATTE-0005 | Log Level 07 |
| ATTE-0008 | ATTE-0002 | ATTE-0006 | execution |

Attributes name the dimensions along which entities may be described, while attr_type constrains the legal domain of each dimension before any value is accepted. duration_seconds, end_time, exit_code, and host_name recur across both attestation and policy-observation contexts with parallel typing as xsd:decimal, xsd:dateTime, xsd:integer, and xsd:string, signaling that the governance framework enforces schema discipline at ingestion rather than at query time. Typed partitioning of stored misc values—6429.54 beside 2023-12-15T15:31:35, exit_code 487 beside host_name gw-12—prevents category errors that would otherwise corrupt aggregates, timelines, or automated policy triggers; an integer exit_code and a datetime end_time cannot be coerced into a single undifferentiated column without sacrificing validation, indexing strategy, and evidentiary admissibility.

The misc designation marks the payload proper: the instantiated fact once entity and attr have fixed its interpretive frame. Whether the misc holds Log Level 02, initiation, execution, complete, or superseded, its meaning is always derivative—readable only in combination with the bound attribute and the XSD type that authorized its storage. Operational teams therefore treat misc not as miscellaneous residue but as typed evidence slots whose semantics are externalized in attr metadata; a heartbeat timeout observation and an ingestion pipeline backpressure observation become comparable on duration_seconds only because both entities bind the same attr under xsd:decimal, even though their narrative descriptions diverge sharply.

Campus event participation extends the same governance primitives into relational territory where events, groups, and obligations must be distinguished without collapsing them into flat attribute bags. A campusevent such as Winter Poetry Slam or Astronomy Night names the occasion under policy; a participantgroup—Alumni Network Chapter, Undergraduate STEM Majors, Graduate Student Association—names the collective actor implicated in that occasion. The subject–target pairing, instantiated when campus_id PART-0003 links to has_participant_id PART-0004, expresses directed association rather than symmetric membership: the subject anchors the participation record, the target identifies the participant grouping implicated, and neither identifier substitutes for the event or group label they connect. Role then qualifies the edge—contributor, observer, owner—so that identical subject–target geometry can imply different duties, visibility, and accountability; an Undergraduate STEM Majors cohort may appear as observer in one binding and owner in another, preserving fine-grained authorization and reporting without proliferating duplicate group definitions.

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

Taken together, identifier, entity, attr, attr_type, and misc constitute the evidentiary spine for attestations and policy-bound observations, while campusevent, participantgroup, subject, target, and role supply the relational vocabulary for staged, multi-actor engagements. Practitioners rely on this separation because compliance and campus operations alike require facts that survive re-labeling, support type-safe analytics, and expose who acted in what capacity toward which governed object; the recurring attribute vocabulary across ATTE and POLI families shows deliberate pattern reuse, and the participation graph shows how the same identifier discipline scales from scalar measurements to governed social structure without abandoning audit-grade precision.

**t_attestation_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ATTE-0001 | duration_seconds | xsd:decimal |
| ATTE-0002 | end_time | xsd:dateTime |
| ATTE-0003 | exit_code | xsd:integer |
| ATTE-0004 | host_name | xsd:string |
| ATTE-0005 | log_level | xsd:string |
| ATTE-0006 | phase | xsd:string |
| ATTE-0007 | retry_count | xsd:integer |
| ATTE-0008 | scheduled_at | xsd:dateTime |

**t_attestation_basic_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTE-0001 | ATTE-0001 | ATTE-0003 | 898 |
| ATTE-0002 | ATTE-0001 | ATTE-0007 | 487 |
| ATTE-0003 | ATTE-0002 | ATTE-0003 | 71 |
| ATTE-0004 | ATTE-0002 | ATTE-0007 | 180 |
| ATTE-0005 | ATTE-0003 | ATTE-0003 | 107 |
| ATTE-0006 | ATTE-0003 | ATTE-0007 | 326 |
| ATTE-0007 | ATTE-0004 | ATTE-0003 | 620 |
| ATTE-0008 | ATTE-0004 | ATTE-0007 | 392 |

**t_observation_governed_by_policy_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| POLI-0001 | duration_seconds | xsd:decimal |
| POLI-0002 | end_time | xsd:dateTime |
| POLI-0003 | exit_code | xsd:integer |
| POLI-0004 | host_name | xsd:string |
| POLI-0005 | log_level | xsd:string |
| POLI-0006 | phase | xsd:string |
| POLI-0007 | retry_count | xsd:integer |
| POLI-0008 | scheduled_at | xsd:dateTime |

**t_observation_governed_by_policy_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0002 | 2023-03-21T06:17:05 |
| POLI-0002 | POLI-0001 | POLI-0008 | 2024-08-23T18:14:17 |
| POLI-0003 | POLI-0001 | POLI-0009 | 2024-06-11T06:45:45 |
| POLI-0004 | POLI-0002 | POLI-0002 | 2023-08-16T19:41:47 |
| POLI-0005 | POLI-0002 | POLI-0008 | 2023-07-01T10:02:32 |
| POLI-0006 | POLI-0002 | POLI-0009 | 2023-11-28T22:50:00 |
| POLI-0007 | POLI-0003 | POLI-0002 | 2025-02-28T14:09:39 |
| POLI-0008 | POLI-0003 | POLI-0008 | 2024-08-01T00:25:22 |

**t_observation_governed_by_policy_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0001 | 2405.99 |
| POLI-0002 | POLI-0002 | POLI-0001 | 5333.00 |
| POLI-0003 | POLI-0003 | POLI-0001 | 2745.86 |
| POLI-0004 | POLI-0004 | POLI-0001 | 5236.87 |
| POLI-0005 | POLI-0005 | POLI-0001 | 6390.38 |
| POLI-0006 | POLI-0006 | POLI-0001 | 4927.03 |

**t_observation_governed_by_policy_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0003 | 46 |
| POLI-0002 | POLI-0001 | POLI-0007 | 468 |
| POLI-0003 | POLI-0002 | POLI-0003 | 386 |
| POLI-0004 | POLI-0002 | POLI-0007 | 493 |
| POLI-0005 | POLI-0003 | POLI-0003 | 146 |
| POLI-0006 | POLI-0003 | POLI-0007 | 163 |
| POLI-0007 | POLI-0004 | POLI-0003 | 133 |
| POLI-0008 | POLI-0004 | POLI-0007 | 341 |

**t_observation_governed_by_policy_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0004 | gw-12 |
| POLI-0002 | POLI-0001 | POLI-0005 | Log Level 02 |
| POLI-0003 | POLI-0001 | POLI-0006 | execution |
| POLI-0004 | POLI-0001 | POLI-0010 | complete |
| POLI-0005 | POLI-0001 | POLI-0011 | Triggered By 05 |
| POLI-0006 | POLI-0002 | POLI-0004 | worker-07 |
| POLI-0007 | POLI-0002 | POLI-0005 | Log Level 07 |
| POLI-0008 | POLI-0002 | POLI-0006 | execution |