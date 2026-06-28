---
chapter_id: ch_live_information_dissemination_event_cdd68b
topic_id: 168
family: 08_derived
cited_terms: ['information_dissemination_event', 'foreign_key_relation', 'provenance_agent_signs_audit']
model: engine-refine
---

Information dissemination events serve as the primary temporal anchors for organizational communication, each identified by a stable identifier such as EVEN-0001 through EVEN-0004 and classified by substantive content—Data Retention Policy v3, Security Bulletin 2024-05, Firmware Rollout v4.2. These events do not exist in isolation; they propagate through designated dissemination channels including SMS Gateway, Mailing List, CDN Distribution, and Intranet Portal, with the routing topology governed by a junction table that assigns a role to each event-channel pairing. A single event may traverse multiple channels under different roles, and the same channel may serve multiple events, producing a many-to-many relationship that the intermediate table resolves by recording the role as contributor, owner, or observer. The role field thus functions as a semantic qualifier on the edge of the bipartite graph, distinguishing whether an event originates from a channel, is merely routed through it, or passively monitors its output.

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

**t_foreign_key_relation**

| id | foreign |
| --- | --- |
| RELA-0001 | batch_workflows |
| RELA-0002 | config_snapshots |
| RELA-0003 | metric_snapshots |
| RELA-0004 | schema_versions |
| RELA-0005 | query_executions |
| RELA-0006 | batch_workflows |
| RELA-0007 | data_ingestion_jobs |
| RELA-0008 | metric_snapshots |

**t_foreign_key_relation_foreign_key_to**

| id | foreign_key_to |
| --- | --- |
| RELA-0001 | system_clocks |
| RELA-0002 | schema_definitions |
| RELA-0003 | data_lake_catalog |
| RELA-0004 | core_products |
| RELA-0005 | identity_provider |
| RELA-0006 | data_lake_catalog |

Audience reach extends this topology further, as each dissemination event targets distinct recipient groups—Partner Integrators, Emergency Responders, Public Sector, External Developers—again through a junction table that carries both a role and a cardinality_note. The cardinality_note, exemplified by Cardinality Note 01 through Cardinality Note 04, provides a human-readable constraint on the multiplicity of the relationship, clarifying whether a given event-audience pairing is one-to-one, one-to-many, or subject to conditional branching. Participant involvement follows an analogous pattern: Product Manager, Legal Counsel, Operations Manager, and Technical Writer are linked to events through a temporal interval dimension, and the junction table enriches each linkage with a role (reviewer, contributor) and a since timestamp—2025-05-08, 2024-10-02, 2024-02-16, 2023-02-27—that establishes the effective date from which the participant's assignment became active. This since field is critical for auditability, as it permits the reconstruction of historical event governance by filtering participant assignments to any point in time.

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

**t_foreign_key_relation__foreign_key_to**

| id | foreign_id | foreign_key_to_id | role |
| --- | --- | --- | --- |
| RELA-0001 | RELA-0003 | RELA-0005 | owner |
| RELA-0002 | RELA-0003 | RELA-0006 | owner |
| RELA-0003 | RELA-0007 | RELA-0006 | contributor |
| RELA-0004 | RELA-0006 | RELA-0002 | contributor |
| RELA-0005 | RELA-0008 | RELA-0004 | owner |
| RELA-0006 | RELA-0007 | RELA-0003 | owner |
| RELA-0007 | RELA-0004 | RELA-0002 | owner |
| RELA-0008 | RELA-0005 | RELA-0001 | owner |

The foreign key relationship layer operates at a different abstraction level, documenting structural dependencies between system components rather than event participants. Relations such as batch_workflows depending on system_clocks, config_snapshots on schema_definitions, metric_snapshots on data_lake_catalog, and schema_versions on core_products are themselves identified by keys like RELA-0001 through RELA-0004 and resolved through a junction table that assigns an owner or contributor role to each dependency edge. This separation of concerns—between event-level governance and schema-level dependency tracking—ensures that operational provenance and architectural provenance remain independently queryable while remaining structurally parallel in their use of role as a relationship qualifier.

Provenance tracking, captured in the fact_provenance and dim_provenance tables, records the execution characteristics of auditable operations with identifiers such as AUDI-0001 through AUDI-0004. Each provenance fact carries a provenance_key (AUDI-0003, AUDI-0007, AUDI-0008) that references a specific execution instance, a duration_seconds value ranging from 2216.74 to 6949.35 seconds, an exit_code (256, 728, 452, 985) indicating the termination status, and a retry_count (23, 196, 304, 410) quantifying how many times the operation was retried before final resolution. The dimension table enriches these facts with a misc label—Provenance Label 01 through Provenance Label 04—and a category—Provenance Category 01 through Provenance Category 04—that provides the classification context necessary for aggregating provenance metrics by operational domain. The high retry counts observed in certain records, such as 410 retries for AUDI-0003, signal systemic instability in the underlying execution pipeline and warrant investigation into the root causes reflected by the corresponding exit codes.

**fact_provenance**

| id | provenance_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| AUDI-0001 | AUDI-0003 | 2601.59 | 256 | 196 |
| AUDI-0002 | AUDI-0007 | 4921.58 | 728 | 304 |
| AUDI-0003 | AUDI-0008 | 2216.74 | 452 | 410 |
| AUDI-0004 | AUDI-0007 | 6949.35 | 985 | 23 |

**dim_provenance**

| id | provenance_label | provenance_category |
| --- | --- | --- |
| AUDI-0001 | Provenance Label 01 | Provenance Category 01 |
| AUDI-0002 | Provenance Label 02 | Provenance Category 02 |
| AUDI-0003 | Provenance Label 03 | Provenance Category 03 |
| AUDI-0004 | Provenance Label 04 | Provenance Category 04 |
| AUDI-0005 | Provenance Label 05 | Provenance Category 05 |
| AUDI-0006 | Provenance Label 06 | Provenance Category 06 |
| AUDI-0007 | Provenance Label 07 | Provenance Category 07 |
| AUDI-0008 | Provenance Label 08 | Provenance Category 08 |