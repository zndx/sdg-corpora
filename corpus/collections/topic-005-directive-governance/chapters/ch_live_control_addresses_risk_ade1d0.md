---
chapter_id: ch_live_control_addresses_risk_ade1d0
topic_id: 5
family: 03_directive_governance
cited_terms: ['control_addresses_risk', 'information_dissemination_event', 'dataset_snapshot_subclass']
model: engine-refine
---

Governance and operational assurance depend on stable identifiers that survive renaming, reorganization, and successive audit cycles without breaking referential integrity across the corpus. Controls such as Segregation of Duties (RISK-0002) and MFA Enforcement (RISK-0004) are not merely policy statements; they are addressable entities keyed as RISK-0001 through RISK-0004, each bound to the risks they mitigate—Insider Threat, Configuration Drift, Third-Party Failure—through explicit subject–target associations in which the control occupies the subject position and the risk the target. The same identifier discipline extends to information dissemination: EVEN-0001 through EVEN-0004 denote concrete dissemination events—Data Retention Policy v3, Security Bulletin 2024-05, Firmware Rollout v4.2—whose lifecycle, audience, channel usage, and participant accountability can be reconstructed from the graph of relationships rather than from narrative description alone.

**t_control_addresses_risk**

| id | control |
| --- | --- |
| RISK-0001 | Log Retention Policy |
| RISK-0002 | Segregation of Duties |
| RISK-0003 | Vendor Assessment |
| RISK-0004 | MFA Enforcement |
| RISK-0005 | Access Review Cycle |
| RISK-0006 | Threat Modeling |

**t_control_addresses_risk_addresses_risk**

| id | addresses_risk |
| --- | --- |
| RISK-0001 | Insider Threat |
| RISK-0002 | Configuration Drift |
| RISK-0003 | Third-Party Failure |
| RISK-0004 | Insider Threat |
| RISK-0005 | Regulatory Penalty |
| RISK-0006 | Configuration Drift |
| RISK-0007 | Regulatory Penalty |

**t_information_dissemination_event**

| id | information_dissemination_event |
| --- | --- |
| EVEN-0001 | Data Retention Policy v3 |
| EVEN-0002 | Security Bulletin 2024-05 |
| EVEN-0003 | Data Retention Policy v3 |
| EVEN-0004 | Firmware Rollout v4.2 |
| EVEN-0005 | Data Retention Policy v3 |
| EVEN-0006 | TLS 1.3 Migration Notice |
| EVEN-0007 | GDPR Compliance Update |

**t_information_dissemination_event_utilizes_channel**

| id | utilizes_channel |
| --- | --- |
| EVEN-0001 | SMS Gateway |
| EVEN-0002 | Mailing List |
| EVEN-0003 | CDN Distribution |
| EVEN-0004 | Intranet Portal |
| EVEN-0005 | RSS Feed |
| EVEN-0006 | Slack Workspace |

**t_information_dissemination_event_reaches_audience**

| id | reaches_audience |
| --- | --- |
| EVEN-0001 | Partner Integrators |
| EVEN-0002 | Emergency Responders |
| EVEN-0003 | Public Sector |
| EVEN-0004 | External Developers |
| EVEN-0005 | Field Technicians |
| EVEN-0006 | Internal Auditors |
| EVEN-0007 | Compliance Officers |

**t_information_dissemination_event_has_participant**

| id | has_participant |
| --- | --- |
| EVEN-0001 | Product Manager |
| EVEN-0002 | Legal Counsel |
| EVEN-0003 | Operations Manager |
| EVEN-0004 | Technical Writer |
| EVEN-0005 | Legal Counsel |
| EVEN-0006 | Legal Counsel |
| EVEN-0007 | Security Officer |

Role assignment is the mechanism by which a single relationship type acquires operational meaning. A control may address a risk as contributor or observer; an information event may utilize a dissemination channel as owner, contributor, or observer; and audience reach may be governed as owner, contributor, or reviewer. These distinctions are not interchangeable labels. When EVEN-0004 (Firmware Rollout v4.2) utilizes EVEN-0001 (SMS Gateway) in a contributor capacity while EVEN-0001 (Data Retention Policy v3) reaches EVEN-0005 via CDN Distribution under an owner role, the registry records who may authorize, who may execute, and who may attest—separating accountability from mere visibility. Reviewer roles on audience-facing edges (as with EVEN-0003 reaching Public Sector) further impose a gate before external publication, preserving traceability from policy artifact to approved recipient set.

Dissemination channel selection encodes the technical and trust boundary through which an information dissemination event is delivered. SMS Gateway, Mailing List, CDN Distribution, and Intranet Portal are not interchangeable transport layers; each implies distinct latency, reach, authentication posture, and evidentiary capture. An event that routes through CDN Distribution (EVEN-0005) for broad external developer consumption differs materially from one confined to an Intranet Portal (EVEN-0003), and the junction records preserve that channel binding even when multiple events share superficially similar titles—as when Data Retention Policy v3 appears under both EVEN-0001 and EVEN-0003, distinguished by channel, audience, and participant graph rather than by display name alone.

Cardinality notes document where one-to-many or many-to-many semantics would otherwise collapse under naive modeling. Cardinality Note 01 through Cardinality Note 04 attach to audience-reach and participant edges, signaling that a single information event may legitimately fan out to multiple audiences or sustain multiple participants without violating uniqueness constraints on the parent event key. They function as governance annotations: they tell auditors and integrators which relationship cardinalities are intentional, which duplicates are permitted, and which joins must not be deduplicated during reconciliation. Paired with the since attribute on participant bindings—2025-05-08 for one reviewer lineage, 2023-02-27 for a Technical Writer contributor dating to an earlier revision cycle—the model supports temporal provenance: who participated, in what capacity, and from which effective date, independent of when the snapshot was taken.

Snapshot lineage and physical extent complete the evidentiary chain. The fact layer records dataset instances keyed SNAP-0001 through SNAP-0004 with size_bytes ranging from 31,504,133 to 676,110,880 and version numbers that may diverge across the chain (version 10 on one node, version 5 on another), while snapshot_of_key links form a directed lineage—SNAP-0004 pointing to SNAP-0003, SNAP-0003 to SNAP-0002—so that any published extract can be walked backward to its antecedent state. The dimension layer supplies categorical and miscellaneous labeling: snapshot_of_category (Snapshot Of Category 01 through 04) classifies extracts for retention scheduling and access control, while snapshot_of_label (misc) carries human-readable designation without overloading the category axis. Together, identifier, subject, target, role, cardinality_note, since, dissemination channel, information dissemination event, category, size_bytes, and snapshot_of constitute the minimum vocabulary for a compliance handbook to describe not what tables contain, but how controls bind to risk, how information moves through governed channels to qualified audiences, and how point-in-time evidence remains measurable, classifiable, and auditable across successive operational snapshots.

**t_control_addresses_risk__addresses_risk**

| id | control_id | addresses_risk_id | role |
| --- | --- | --- | --- |
| RISK-0001 | RISK-0002 | RISK-0005 | contributor |
| RISK-0002 | RISK-0005 | RISK-0002 | observer |
| RISK-0003 | RISK-0001 | RISK-0002 | contributor |
| RISK-0004 | RISK-0005 | RISK-0006 | observer |
| RISK-0005 | RISK-0003 | RISK-0004 | contributor |
| RISK-0006 | RISK-0001 | RISK-0004 | reviewer |
| RISK-0007 | RISK-0005 | RISK-0003 | contributor |
| RISK-0008 | RISK-0006 | RISK-0002 | reviewer |

**t_information_dissemination_event__utilizes_channel**

| id | information_id | utilizes_channel_id | role |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0004 | EVEN-0001 | contributor |
| EVEN-0002 | EVEN-0004 | EVEN-0005 | contributor |
| EVEN-0003 | EVEN-0001 | EVEN-0005 | owner |
| EVEN-0004 | EVEN-0004 | EVEN-0003 | observer |
| EVEN-0005 | EVEN-0001 | EVEN-0006 | contributor |
| EVEN-0006 | EVEN-0004 | EVEN-0002 | observer |
| EVEN-0007 | EVEN-0001 | EVEN-0005 | owner |
| EVEN-0008 | EVEN-0005 | EVEN-0006 | reviewer |

**t_information_dissemination_event__reaches_audience**

| id | information_id | reaches_audience_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| EVEN-0001 | EVEN-0002 | EVEN-0007 | owner | Cardinality Note 01 |
| EVEN-0002 | EVEN-0007 | EVEN-0001 | contributor | Cardinality Note 02 |
| EVEN-0003 | EVEN-0003 | EVEN-0005 | reviewer | Cardinality Note 03 |
| EVEN-0004 | EVEN-0003 | EVEN-0004 | reviewer | Cardinality Note 04 |
| EVEN-0005 | EVEN-0004 | EVEN-0003 | contributor | Cardinality Note 05 |
| EVEN-0006 | EVEN-0007 | EVEN-0003 | owner | Cardinality Note 06 |
| EVEN-0007 | EVEN-0004 | EVEN-0005 | reviewer | Cardinality Note 07 |
| EVEN-0008 | EVEN-0007 | EVEN-0006 | reviewer | Cardinality Note 08 |

**t_information_dissemination_event__has_participant**

| id | information_id | has_participant_id | role | cardinality_note | since |
| --- | --- | --- | --- | --- | --- |
| EVEN-0001 | EVEN-0002 | EVEN-0005 | reviewer | Cardinality Note 01 | 2025-05-08 |
| EVEN-0002 | EVEN-0007 | EVEN-0006 | contributor | Cardinality Note 02 | 2024-10-02 |
| EVEN-0003 | EVEN-0003 | EVEN-0002 | contributor | Cardinality Note 03 | 2024-02-16 |
| EVEN-0004 | EVEN-0007 | EVEN-0003 | contributor | Cardinality Note 04 | 2023-02-27 |
| EVEN-0005 | EVEN-0003 | EVEN-0005 | contributor | Cardinality Note 05 | 2024-08-08 |
| EVEN-0006 | EVEN-0003 | EVEN-0002 | reviewer | Cardinality Note 06 | 2024-01-28 |
| EVEN-0007 | EVEN-0003 | EVEN-0004 | owner | Cardinality Note 07 | 2025-02-17 |
| EVEN-0008 | EVEN-0007 | EVEN-0001 | contributor | Cardinality Note 08 | 2025-04-14 |

**fact_dataset**

| id | snapshot_of_key | size_bytes | version |
| --- | --- | --- | --- |
| SNAP-0001 | SNAP-0004 | 350697080 | 10 |
| SNAP-0002 | SNAP-0003 | 501391865 | 2 |
| SNAP-0003 | SNAP-0002 | 31504133 | 5 |
| SNAP-0004 | SNAP-0003 | 676110880 | 5 |
| SNAP-0005 | SNAP-0002 | 632357991 | 7 |
| SNAP-0006 | SNAP-0001 | 81640033 | 1 |
| SNAP-0007 | SNAP-0007 | 351254327 | 12 |
| SNAP-0008 | SNAP-0001 | 94866870 | 11 |

**dim_snapshot_of**

| id | snapshot_of_label | snapshot_of_category |
| --- | --- | --- |
| SNAP-0001 | Snapshot Of Label 01 | Snapshot Of Category 01 |
| SNAP-0002 | Snapshot Of Label 02 | Snapshot Of Category 02 |
| SNAP-0003 | Snapshot Of Label 03 | Snapshot Of Category 03 |
| SNAP-0004 | Snapshot Of Label 04 | Snapshot Of Category 04 |
| SNAP-0005 | Snapshot Of Label 05 | Snapshot Of Category 05 |
| SNAP-0006 | Snapshot Of Label 06 | Snapshot Of Category 06 |
| SNAP-0007 | Snapshot Of Label 07 | Snapshot Of Category 07 |