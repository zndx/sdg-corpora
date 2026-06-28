---
chapter_id: ch_live_regional_quality_benchmark_6264b0
topic_id: 186
family: 08_derived
cited_terms: ['regional_quality_benchmark', 'requirement_refines', 'process_with_participant']
model: engine-refine
---

Governance and compliance systems depend on a shared vocabulary of stable references, typed observations, and graded assertions that can be traced from policy to operational evidence. An identifier is the durable handle that makes that traceability possible: values such as BENC-0001, REFI-0002, and PART-0001 are not decorative labels but contractually meaningful keys that survive renames, migrations, and cross-system joins. Once identifiers are fixed, an entity becomes the thing those keys denote in context—typically a participant in a controlled process, a regional benchmark, or a refinement link between a requirement and the process that implements it. The entity is what auditors interrogate; the identifier is how they find it again tomorrow.

Attributes give entities measurable shape. Each attr declares what may be said about an entity—duration_seconds, end_time, exit_code, host_name—and each attr type constrains how that statement must be represented so comparisons and controls remain valid. Typed bindings such as xsd:decimal for elapsed time, xsd:dateTime for completion instants, xsd:integer for status codes, and xsd:string for host identity prevent category errors at the boundary between telemetry and compliance records. In practice, the same entity may carry many attrs across separate value stores partitioned by type; PART-0001, for example, can simultaneously own a decimal duration of 565.34, datetime stamps on distinct attrs, integer exit-related readings, and varchar observations including gw-12 and review. Misc captures the residual payload that does not warrant its own semantic dimension: the literal measured or recorded value attached to an attr, a regional label such as Regional Label 01, or any other auxiliary string or number that completes an assertion without redefining the entity’s identity.

**dim_regional**

| id | regional_label | regional_category |
| --- | --- | --- |
| BENC-0001 | Regional Label 01 | Regional Category 01 |
| BENC-0002 | Regional Label 02 | Regional Category 02 |
| BENC-0003 | Regional Label 03 | Regional Category 03 |
| BENC-0004 | Regional Label 04 | Regional Category 04 |
| BENC-0005 | Regional Label 05 | Regional Category 05 |
| BENC-0006 | Regional Label 06 | Regional Category 06 |

Regional governance adds a spatial or jurisdictional lens on top of entity-centric facts. A regional key ties an observed fact to the geography or operating unit it belongs to, while companion classification through category—Regional Category 01 through Regional Category 04—supports rollups, exception routing, and policy matrices that speak in business terms rather than opaque codes. Confidence and uncertainty quantify how firmly a regional assertion should be trusted and how wide the evidentiary band around it remains. A regional fact keyed to BENC-0001 may carry confidence as low as 0.036 with uncertainty near 509.32, signaling a weak or noisy measurement, whereas another assertion on the same regional identifier at 0.818 confidence and roughly 510.50 uncertainty invites a different control response: accept for monitoring, escalate for validation, or withhold from automated enforcement. Treating confidence and uncertainty as first-class fields—not post hoc footnotes—allows risk engines and human reviewers to apply proportionate scrutiny instead of binary pass/fail logic.

Requirements refine this picture by binding normative statements to the processes that operationalize them. A requirement such as Data Retention Policy may refine multiple participants—PART-0001 and PART-0007 among them—while Access Control Matrix narrows to a single implementation path. Scope declares the jurisdictional reach of that binding: team-scoped controls govern collaboration boundaries, regional scope aligns with federated operations, local scope addresses site-specific constraints, and global scope asserts enterprise-wide minima. Language ensures the same obligation is intelligible to the audience that must execute it; a retention rule rendered in en for one refinement and fr for another is not duplication for its own sake but localization of enforceable text. Process participation closes the loop: access review, network synchronization, and compliance audit become the observable activities whose attrs supply evidentiary misc values back to oversight functions.

Operationally, these elements interlock as a chain of accountability rather than a flat inventory. Identifiers link requirements to participants; entities carry typed attrs whose misc values become audit artifacts; regional facts attach confidence-weighted measurements to classified geographies; scope and language determine which refinement applies where and in what form. A compliance audit tied to REFI-0002 and REFI-0003 therefore inherits not only process identity but also the attr-level telemetry—exit_code 759 on one path, end_time 2023-09-13T23:16:55 on another—that reviewers use to substantiate control effectiveness. When confidence is thin or uncertainty wide, governance frameworks should default to human review, supplementary evidence collection, or scoped non-reliance rather than silent automation. When attrs, types, and identifiers align across regional and requirement layers, organizations gain a defensible record: policies stated with appropriate scope and language, processes that implement them under stable keys, and measurements whose quality is explicit rather than assumed.

**fact_regional**

| id | regional_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| BENC-0001 | BENC-0001 | 0.036 | 509.32 | 915.44 |
| BENC-0002 | BENC-0001 | 0.601 | 253.71 | 567.07 |
| BENC-0003 | BENC-0004 | 0.818 | 510.50 | 179.17 |
| BENC-0004 | BENC-0006 | 0.286 | 762.47 | 261.10 |
| BENC-0005 | BENC-0004 | 0.995 | 619.46 | 410.15 |
| BENC-0006 | BENC-0005 | 0.995 | 647.39 | 276.26 |

**t_requirement_refines**

| id | requirement | refines | scope | language |
| --- | --- | --- | --- | --- |
| REFI-0001 | Access Control Matrix | PART-0001 | team | es |
| REFI-0002 | Data Retention Policy | PART-0007 | regional | en |
| REFI-0003 | Data Retention Policy | PART-0001 | local | en |
| REFI-0004 | Data Retention Policy | PART-0002 | global | fr |
| REFI-0005 | Access Control Matrix | PART-0004 | global | es |
| REFI-0006 | Data Retention Policy | PART-0001 | local | ja |

**t_process_with_participant**

| id | process | related |
| --- | --- | --- |
| PART-0001 | access review | REFI-0006 |
| PART-0002 | network synchronization | REFI-0002 |
| PART-0003 | compliance audit | REFI-0003 |
| PART-0004 | compliance audit | REFI-0002 |
| PART-0005 | network synchronization | REFI-0006 |
| PART-0006 | schema migration | REFI-0004 |
| PART-0007 | schema migration | REFI-0003 |
| PART-0008 | quality assurance | REFI-0002 |

**t_process_with_participant_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| PART-0001 | duration_seconds | xsd:decimal |
| PART-0002 | end_time | xsd:dateTime |
| PART-0003 | exit_code | xsd:integer |
| PART-0004 | host_name | xsd:string |
| PART-0005 | log_level | xsd:string |
| PART-0006 | phase | xsd:string |
| PART-0007 | retry_count | xsd:integer |
| PART-0008 | scheduled_at | xsd:dateTime |

**t_process_with_participant_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PART-0001 | PART-0001 | PART-0002 | 2024-06-12T21:46:50 |
| PART-0002 | PART-0001 | PART-0008 | 2024-08-24T17:43:03 |
| PART-0003 | PART-0001 | PART-0009 | 2024-02-26T12:31:34 |
| PART-0004 | PART-0002 | PART-0002 | 2023-09-13T23:16:55 |
| PART-0005 | PART-0002 | PART-0008 | 2023-09-18T01:53:27 |
| PART-0006 | PART-0002 | PART-0009 | 2023-12-19T06:07:05 |
| PART-0007 | PART-0003 | PART-0002 | 2025-02-28T12:35:26 |
| PART-0008 | PART-0003 | PART-0008 | 2023-01-21T19:46:12 |

**t_process_with_participant_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PART-0001 | PART-0001 | PART-0001 | 565.34 |
| PART-0002 | PART-0002 | PART-0001 | 6522.24 |
| PART-0003 | PART-0003 | PART-0001 | 236.49 |
| PART-0004 | PART-0004 | PART-0001 | 5070.41 |
| PART-0005 | PART-0005 | PART-0001 | 5946.70 |
| PART-0006 | PART-0006 | PART-0001 | 6238.25 |
| PART-0007 | PART-0007 | PART-0001 | 1191.07 |
| PART-0008 | PART-0008 | PART-0001 | 3672.98 |

**t_process_with_participant_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PART-0001 | PART-0001 | PART-0003 | 231 |
| PART-0002 | PART-0001 | PART-0007 | 324 |
| PART-0003 | PART-0002 | PART-0003 | 759 |
| PART-0004 | PART-0002 | PART-0007 | 24 |
| PART-0005 | PART-0003 | PART-0003 | 283 |
| PART-0006 | PART-0003 | PART-0007 | 408 |
| PART-0007 | PART-0004 | PART-0003 | 247 |
| PART-0008 | PART-0004 | PART-0007 | 74 |

**t_process_with_participant_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PART-0001 | PART-0001 | PART-0004 | gw-12 |
| PART-0002 | PART-0001 | PART-0005 | Log Level 02 |
| PART-0003 | PART-0001 | PART-0006 | review |
| PART-0004 | PART-0001 | PART-0010 | failed |
| PART-0005 | PART-0001 | PART-0011 | Triggered By 05 |
| PART-0006 | PART-0002 | PART-0004 | node-b14 |
| PART-0007 | PART-0002 | PART-0005 | Log Level 07 |
| PART-0008 | PART-0002 | PART-0006 | execution |