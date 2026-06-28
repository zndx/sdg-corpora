---
chapter_id: ch_live_attestation_subclass_cbee30
topic_id: 11
family: 03_directive_governance
cited_terms: ['attestation_subclass', 'requirement_has_priority', 'measurement_subclass']
model: engine-refine
---

In governed operational environments, compliance evidence and control metadata are rarely captured as a fixed rectangular dataset. Instead, they are modeled as identifiable entities—discrete attestations, prioritized requirements, or instrumented measurements—each carrying a variable portfolio of typed properties whose shape depends on the entity’s subclass and operational context. The identifier supplies the durable handle that binds definition, observation, and lineage across ingestion, audit, and reconciliation workflows; a value such as ATTE-0001 or PRIO-0003 is not merely a surrogate key but the anchor that lets reviewers correlate a SOC2-TypeII attestation, a Critical throughput minimum, or a soil-moisture reading with every subsequent assertion about that object. Without stable identifiers, cross-table joins degenerate into ambiguous textual matching, and the evidentiary chain required for attestation review or priority enforcement cannot be reconstructed under scrutiny.

**t_attestation_subclass**

| id | attestation |
| --- | --- |
| ATTE-0001 | SOC2-TypeII |
| ATTE-0002 | VulnerabilityScan-Q3 |
| ATTE-0003 | SecureBoot-Enabled |
| ATTE-0004 | TPM-Attestation |
| ATTE-0005 | GitOps-Deployment |
| ATTE-0006 | AccessControlReview |
| ATTE-0007 | ThirdPartyVendorRisk |

**t_attestation_subclass_attr**

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

**t_requirement_has_priority**

| id | requirement | priority |
| --- | --- | --- |
| PRIO-0001 | Latency threshold | Trivial |
| PRIO-0002 | Backup interval | Medium |
| PRIO-0003 | Throughput minimum | Critical |
| PRIO-0004 | Audit log frequency | Critical |
| PRIO-0005 | Throughput minimum | Minor |
| PRIO-0006 | Encryption standard | Trivial |
| PRIO-0007 | Throughput minimum | Major |
| PRIO-0008 | Fault tolerance level | Essential |

**t_measurement_subclass**

| id | measurement |
| --- | --- |
| MEAS-0001 | Heart rate |
| MEAS-0002 | Seismic magnitude |
| MEAS-0003 | Soil moisture |
| MEAS-0004 | Soil moisture |
| MEAS-0005 | Bandwidth throughput |
| MEAS-0006 | Seismic magnitude |

**t_measurement_subclass_dimension**

| id | dimension |
| --- | --- |
| MEAS-0001 | Electric current |
| MEAS-0002 | Power |
| MEAS-0003 | Energy |
| MEAS-0004 | Mass |
| MEAS-0005 | Mass |
| MEAS-0006 | Luminous intensity |

The attr and attr_type pair constitutes the semantic contract under which misc—miscellaneous observed or asserted values—may legally inhabit the model. An attr names what is being said about an entity (duration_seconds, mandatory, host_name), while attr_type declares the interpretive and validation regime, typically expressed through XML Schema datatypes such as xsd:decimal, xsd:dateTime, xsd:boolean, or xsd:string. This separation matters because governance logic depends on comparability and constraint: a duration of 1293.13 is meaningful only when bound to xsd:decimal and the attr duration_seconds; an end_time stamped 2025-01-08T20:38:13 acquires temporal ordering properties only under xsd:dateTime. Storing attr definitions once per subclass—exit_code as xsd:integer alongside enforcement as xsd:string—prevents type confusion at write time and allows validators, report generators, and policy engines to reject incoherent pairings before they pollute downstream analytics.

**t_attestation_subclass_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTE-0001 | ATTE-0001 | ATTE-0002 | 2025-01-08T20:38:13 |
| ATTE-0002 | ATTE-0001 | ATTE-0008 | 2024-01-27T20:47:31 |
| ATTE-0003 | ATTE-0001 | ATTE-0009 | 2024-07-24T11:57:07 |
| ATTE-0004 | ATTE-0002 | ATTE-0002 | 2024-04-06T01:35:21 |
| ATTE-0005 | ATTE-0002 | ATTE-0008 | 2024-02-15T00:38:24 |
| ATTE-0006 | ATTE-0002 | ATTE-0009 | 2023-06-05T10:05:45 |
| ATTE-0007 | ATTE-0003 | ATTE-0002 | 2024-06-10T20:49:48 |
| ATTE-0008 | ATTE-0003 | ATTE-0008 | 2023-08-11T12:49:10 |

**t_attestation_subclass_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTE-0001 | ATTE-0001 | ATTE-0001 | 1293.13 |
| ATTE-0002 | ATTE-0002 | ATTE-0001 | 215.34 |
| ATTE-0003 | ATTE-0003 | ATTE-0001 | 4975.39 |
| ATTE-0004 | ATTE-0004 | ATTE-0001 | 778.44 |
| ATTE-0005 | ATTE-0005 | ATTE-0001 | 5119.03 |
| ATTE-0006 | ATTE-0006 | ATTE-0001 | 3990.60 |
| ATTE-0007 | ATTE-0007 | ATTE-0001 | 1452.26 |

Entity, in this framing, is the bearer of attributes: the object whose state or metadata the value tables record. Multiple misc rows may reference the same entity_id, as when ATTE-0001 simultaneously carries a decimal duration, several datetime boundaries, integer exit codes, and varchar host identifiers such as gw-12. The entity is thus the subject of assertion, not the assertion itself; each value row is a typed fact about that entity at a point in the evidence lifecycle. Requirement-priority entities illustrate why this distinction is operationally consequential: PRIO-0003 (Throughput minimum, Critical) may share the mandatory attr with sibling requirements yet remain distinguishable because entity_id scopes each boolean false, date effective_date, and integer priority score to the correct control obligation. Auditors query by entity to assemble a complete posture; they query by attr to compare homogeneous measurements across entities.

**t_attestation_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTE-0001 | ATTE-0001 | ATTE-0004 | gw-12 |
| ATTE-0002 | ATTE-0001 | ATTE-0005 | Log Level 02 |
| ATTE-0003 | ATTE-0001 | ATTE-0006 | review |
| ATTE-0004 | ATTE-0001 | ATTE-0010 | superseded |
| ATTE-0005 | ATTE-0001 | ATTE-0011 | Triggered By 05 |
| ATTE-0006 | ATTE-0002 | ATTE-0004 | edge-03 |
| ATTE-0007 | ATTE-0002 | ATTE-0005 | Log Level 07 |
| ATTE-0008 | ATTE-0002 | ATTE-0006 | closeout |

**t_requirement_has_priority_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| PRIO-0001 | effective_date | xsd:date |
| PRIO-0002 | enforcement | xsd:string |
| PRIO-0003 | mandatory | xsd:boolean |
| PRIO-0004 | priority | xsd:integer |
| PRIO-0005 | review_cycle_days | xsd:integer |
| PRIO-0006 | scope | xsd:string |
| PRIO-0007 | encoding | xsd:string |
| PRIO-0008 | label_text | xsd:string |

**t_requirement_has_priority_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PRIO-0001 | PRIO-0001 | PRIO-0003 | false |
| PRIO-0002 | PRIO-0002 | PRIO-0003 | false |
| PRIO-0003 | PRIO-0003 | PRIO-0003 | false |
| PRIO-0004 | PRIO-0004 | PRIO-0003 | false |
| PRIO-0005 | PRIO-0005 | PRIO-0003 | true |
| PRIO-0006 | PRIO-0006 | PRIO-0003 | false |
| PRIO-0007 | PRIO-0007 | PRIO-0003 | false |
| PRIO-0008 | PRIO-0008 | PRIO-0003 | true |

**t_requirement_has_priority_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PRIO-0001 | PRIO-0001 | PRIO-0001 | 2023-09-07 |
| PRIO-0002 | PRIO-0002 | PRIO-0001 | 2024-08-03 |
| PRIO-0003 | PRIO-0003 | PRIO-0001 | 2024-06-06 |
| PRIO-0004 | PRIO-0004 | PRIO-0001 | 2023-04-21 |
| PRIO-0005 | PRIO-0005 | PRIO-0001 | 2025-04-04 |
| PRIO-0006 | PRIO-0006 | PRIO-0001 | 2024-12-07 |
| PRIO-0007 | PRIO-0007 | PRIO-0001 | 2025-04-01 |
| PRIO-0008 | PRIO-0008 | PRIO-0001 | 2024-09-28 |

**t_requirement_has_priority_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PRIO-0001 | PRIO-0001 | PRIO-0004 | 3 |
| PRIO-0002 | PRIO-0001 | PRIO-0005 | 56 |
| PRIO-0003 | PRIO-0002 | PRIO-0004 | 2 |
| PRIO-0004 | PRIO-0002 | PRIO-0005 | 806 |
| PRIO-0005 | PRIO-0003 | PRIO-0004 | 5 |
| PRIO-0006 | PRIO-0003 | PRIO-0005 | 944 |
| PRIO-0007 | PRIO-0004 | PRIO-0004 | 4 |
| PRIO-0008 | PRIO-0004 | PRIO-0005 | 343 |

**t_requirement_has_priority_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PRIO-0001 | PRIO-0001 | PRIO-0007 | Encoding 01 |
| PRIO-0002 | PRIO-0001 | PRIO-0002 | Enforcement 02 |
| PRIO-0003 | PRIO-0001 | PRIO-0008 | intake form |
| PRIO-0004 | PRIO-0001 | PRIO-0009 | ja |
| PRIO-0005 | PRIO-0001 | PRIO-0006 | Scope 05 |
| PRIO-0006 | PRIO-0002 | PRIO-0007 | Encoding 06 |
| PRIO-0007 | PRIO-0002 | PRIO-0002 | Enforcement 07 |
| PRIO-0008 | PRIO-0002 | PRIO-0008 | intake form |

Partitioning misc into type-aligned stores—decimal, datetime, integer, varchar, boolean, date—is a deliberate engineering choice that preserves attr_type fidelity at the storage layer rather than coercing all evidence into a lowest-common-denominator string column. The misc field holds the payload: 4975.39, 806, review, superseded, or ja, each instance keyed by the triple of identifier (for the value row itself), entity, and attr. This pattern scales to heterogeneous compliance domains without proliferating wide tables whose columns are null for most rows. It also mirrors how operational teams actually produce evidence: scan durations arrive as decimals, enforcement modes as strings, effective dates as calendar boundaries, and mandatory flags as booleans—each channel ingested under its declared attr_type rather than through ad hoc parsing at read time.

Where entities relate to one another rather than merely accumulate attributes, the model introduces subject, target, and role as first-class relational semantics. A subject is the originating or owning entity in an association—here, a measurement identified as MEAS-0004 or MEAS-0006—while target names the entity toward which the relationship is directed, such as a dimension MEAS-0003 (Electric current) or MEAS-0005 (Energy). Role qualifies the nature of the linkage: owner versus reviewer distinguishes custodial responsibility from independent verification when soil moisture or seismic magnitude measurements are tied to dimensional quantities. This triplet prevents undirected many-to-many edges that would be uninterpretable in accountability matrices; an auditor can determine not only that two identifiers are associated but whether the association implies ownership, review obligation, or another governed stance.

**t_measurement_subclass__dimension**

| id | measurement_id | dimension_id | role |
| --- | --- | --- | --- |
| MEAS-0001 | MEAS-0004 | MEAS-0003 | owner |
| MEAS-0002 | MEAS-0004 | MEAS-0005 | owner |
| MEAS-0003 | MEAS-0006 | MEAS-0005 | reviewer |
| MEAS-0004 | MEAS-0005 | MEAS-0001 | reviewer |
| MEAS-0005 | MEAS-0003 | MEAS-0002 | owner |
| MEAS-0006 | MEAS-0005 | MEAS-0006 | contributor |
| MEAS-0007 | MEAS-0003 | MEAS-0006 | contributor |
| MEAS-0008 | MEAS-0004 | MEAS-0001 | contributor |

Taken together, identifier, entity, attr, attr_type, misc, subject, target, and role form a layered vocabulary for expressing both intrinsic entity state and extrinsic relational context within a single compliance-oriented information architecture. Identifiers stabilize reference; entities delimit the scope of truth claims; attrs and attr_types encode meaning and enforceable structure; misc materializes the evidentiary record; and subject–target–role edges wire measurements, dimensions, and responsibilities into auditable graphs. Operational success depends on disciplined use of each construct—recording 215.34 only against the correct attr_id and entity_id, honoring xsd:integer for exit_code, and assigning reviewer rather than owner where independent attestation is required—so that automated enforcement (Critical priority on audit log frequency), human review (superseded attestations), and cross-domain reporting draw on a corpus that remains semantically legible long after the originating collection event.

**t_attestation_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTE-0001 | ATTE-0001 | ATTE-0003 | 806 |
| ATTE-0002 | ATTE-0001 | ATTE-0007 | 470 |
| ATTE-0003 | ATTE-0002 | ATTE-0003 | 695 |
| ATTE-0004 | ATTE-0002 | ATTE-0007 | 409 |
| ATTE-0005 | ATTE-0003 | ATTE-0003 | 704 |
| ATTE-0006 | ATTE-0003 | ATTE-0007 | 30 |
| ATTE-0007 | ATTE-0004 | ATTE-0003 | 773 |
| ATTE-0008 | ATTE-0004 | ATTE-0007 | 233 |