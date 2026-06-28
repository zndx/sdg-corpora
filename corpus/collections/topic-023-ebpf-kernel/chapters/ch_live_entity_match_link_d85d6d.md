---
chapter_id: ch_live_entity_match_link_d85d6d
topic_id: 23
family: 07_long_tail
cited_terms: ['entity_match_link', 'frozen_artifact_governed_by', 'transformation_not_recoverable']
model: engine-refine
---

Entity matching and governance metadata are modelled through a bifurcated attribute architecture in which each relationship—whether an entity correspondence or a governance binding—carries its own set of typed properties. The entity match linkage table records pairwise associations between operational objects and their references: a laboratory instrument bearing serial number SN-4491 is linked to reference standard RS-004, a sample batch SB-2214 to validation suite VS-605, dataset version 4.2.1 to the same validation suite, and governance policy DOC-992 to standard template ST-099. Each linkage receives a stable identifier—LINK-0001 through LINK-0004—and the attribute schema for these links defines properties such as confidence, dimension_kind, method, and recorded_at, each annotated with an XML Schema type (xsd:decimal, xsd:string, xsd:dateTime) that governs validation and serialization. The governance counterpart follows an identical structural pattern: frozen artifacts including Log-Archive-23Q4, Model-Prod-v4, Q3-2023-Snapshot, and Compliance-09 are bound to governing policies through identifiers GOVE-0001 through GOVE-0004, with attributes such as effective_date, enforcement, mandatory, and priority typed as xsd:date, xsd:string, xsd:boolean, and xsd:integer respectively. This parallelism ensures that both match relationships and governance bindings are interrogable through a uniform attribute query interface, regardless of the semantic domain of the linked entities.

**t_entity_match_link**

| id | entity | matches_entity |
| --- | --- | --- |
| LINK-0001 | Lab instrument SN-4491 | Reference standard RS-004 |
| LINK-0002 | Sample batch SB-2214 | Validation suite VS-605 |
| LINK-0003 | Dataset v4.2.1 | Validation suite VS-605 |
| LINK-0004 | Governance policy DOC-992 | Standard template ST-099 |
| LINK-0005 | Governance policy DOC-992 | Matched registry MR-881 |
| LINK-0006 | Provenance log PR-7741 | Validation suite VS-605 |

**t_entity_match_link_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| LINK-0001 | confidence | xsd:decimal |
| LINK-0002 | dimension_kind | xsd:string |
| LINK-0003 | method | xsd:string |
| LINK-0004 | recorded_at | xsd:dateTime |
| LINK-0005 | uncertainty | xsd:decimal |
| LINK-0006 | unit | xsd:string |
| LINK-0007 | value | xsd:decimal |
| LINK-0008 | encoding | xsd:string |

**t_entity_match_link_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LINK-0001 | LINK-0001 | LINK-0004 | 2025-02-02T03:38:54 |
| LINK-0002 | LINK-0002 | LINK-0004 | 2024-07-01T04:17:43 |
| LINK-0003 | LINK-0003 | LINK-0004 | 2023-10-04T15:34:58 |
| LINK-0004 | LINK-0004 | LINK-0004 | 2025-05-20T07:58:08 |
| LINK-0005 | LINK-0005 | LINK-0004 | 2023-04-10T04:16:09 |
| LINK-0006 | LINK-0006 | LINK-0004 | 2023-09-16T03:40:04 |

**t_entity_match_link_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LINK-0001 | LINK-0001 | LINK-0001 | 0.249 |
| LINK-0002 | LINK-0001 | LINK-0005 | 448.20 |
| LINK-0003 | LINK-0001 | LINK-0007 | 699.43 |
| LINK-0004 | LINK-0002 | LINK-0001 | 0.772 |
| LINK-0005 | LINK-0002 | LINK-0005 | 156.67 |
| LINK-0006 | LINK-0002 | LINK-0007 | 439.51 |
| LINK-0007 | LINK-0003 | LINK-0001 | 0.389 |
| LINK-0008 | LINK-0003 | LINK-0005 | 388.52 |

**t_entity_match_link_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LINK-0001 | LINK-0001 | LINK-0002 | Dimension Kind 01 |
| LINK-0002 | LINK-0001 | LINK-0008 | Encoding 02 |
| LINK-0003 | LINK-0001 | LINK-0009 | audit excerpt |
| LINK-0004 | LINK-0001 | LINK-0010 | es |
| LINK-0005 | LINK-0001 | LINK-0003 | manual |
| LINK-0006 | LINK-0001 | LINK-0006 | count |
| LINK-0007 | LINK-0002 | LINK-0002 | Dimension Kind 07 |
| LINK-0008 | LINK-0002 | LINK-0008 | Encoding 08 |

**t_frozen_artifact_governed_by**

| id | frozen |
| --- | --- |
| GOVE-0001 | Log-Archive-23Q4 |
| GOVE-0002 | Model-Prod-v4 |
| GOVE-0003 | Q3-2023-Snapshot |
| GOVE-0004 | Compliance-09 |
| GOVE-0005 | Audit-Baseline-2024 |
| GOVE-0006 | Log-Archive-23Q4 |

**t_frozen_artifact_governed_by_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| GOVE-0001 | effective_date | xsd:date |
| GOVE-0002 | enforcement | xsd:string |
| GOVE-0003 | mandatory | xsd:boolean |
| GOVE-0004 | priority | xsd:integer |
| GOVE-0005 | review_cycle_days | xsd:integer |
| GOVE-0006 | scope | xsd:string |
| GOVE-0007 | encoding | xsd:string |
| GOVE-0008 | label_text | xsd:string |

**t_frozen_artifact_governed_by_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| GOVE-0001 | GOVE-0001 | GOVE-0003 | false |
| GOVE-0002 | GOVE-0002 | GOVE-0003 | true |
| GOVE-0003 | GOVE-0003 | GOVE-0003 | false |
| GOVE-0004 | GOVE-0004 | GOVE-0003 | true |
| GOVE-0005 | GOVE-0005 | GOVE-0003 | false |
| GOVE-0006 | GOVE-0006 | GOVE-0003 | false |

**t_frozen_artifact_governed_by_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| GOVE-0001 | GOVE-0001 | GOVE-0001 | 2025-04-28 |
| GOVE-0002 | GOVE-0002 | GOVE-0001 | 2024-02-08 |
| GOVE-0003 | GOVE-0003 | GOVE-0001 | 2024-10-20 |
| GOVE-0004 | GOVE-0004 | GOVE-0001 | 2024-01-16 |
| GOVE-0005 | GOVE-0005 | GOVE-0001 | 2024-06-17 |
| GOVE-0006 | GOVE-0006 | GOVE-0001 | 2024-04-05 |

**t_frozen_artifact_governed_by_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| GOVE-0001 | GOVE-0001 | GOVE-0004 | 1 |
| GOVE-0002 | GOVE-0001 | GOVE-0005 | 718 |
| GOVE-0003 | GOVE-0002 | GOVE-0004 | 5 |
| GOVE-0004 | GOVE-0002 | GOVE-0005 | 330 |
| GOVE-0005 | GOVE-0003 | GOVE-0004 | 4 |
| GOVE-0006 | GOVE-0003 | GOVE-0005 | 316 |
| GOVE-0007 | GOVE-0004 | GOVE-0004 | 5 |
| GOVE-0008 | GOVE-0004 | GOVE-0005 | 796 |

**t_frozen_artifact_governed_by_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| GOVE-0001 | GOVE-0001 | GOVE-0007 | Encoding 01 |
| GOVE-0002 | GOVE-0001 | GOVE-0002 | Enforcement 02 |
| GOVE-0003 | GOVE-0001 | GOVE-0008 | calibration record |
| GOVE-0004 | GOVE-0001 | GOVE-0009 | es |
| GOVE-0005 | GOVE-0001 | GOVE-0006 | Scope 05 |
| GOVE-0006 | GOVE-0002 | GOVE-0007 | Encoding 06 |
| GOVE-0007 | GOVE-0002 | GOVE-0002 | Enforcement 07 |
| GOVE-0008 | GOVE-0002 | GOVE-0008 | nightly summary |

The separation of attribute definitions from their concrete values is enforced through a value-per-type decomposition that eliminates nullable columns and enforces schema-level type discipline. Decimal-valued attributes such as confidence are persisted in a dedicated value table, where a match link identified as LINK-0001 carries a confidence of 0.249, while the same link also stores a secondary decimal measure of 448.20 and another of 699.43 under distinct attribute references LINK-0005 and LINK-0007; a second match link, LINK-0002, records a confidence of 0.772. String-valued attributes occupy their own value table, yielding values such as Dimension Kind 01, Encoding 02, an audit excerpt, and the language code es, each associated with the same match link LINK-0001 through attribute identifiers LINK-0002, LINK-0008, LINK-0009, and LINK-0010. Boolean governance attributes—mandatory, for instance—store explicit true or false values: GOVE-0002 and GOVE-0004 are marked mandatory, whereas GOVE-0001 and GOVE-0003 are not. Integer governance attributes such as priority and an unnamed secondary measure hold values ranging from 1 to 718, with GOVE-0001 carrying priority 1 and secondary value 718, and GOVE-0002 carrying priority 5 and secondary value 330. This normalization by type permits each value table to apply column-level constraints appropriate to its data domain, while the entity_id and attr_id foreign keys maintain referential integrity back to the linkage and attribute definition tables.

Temporal attributes follow the same value-per-type discipline but warrant separate treatment because of their role in auditability and lifecycle management. The recorded_at attribute on entity match links stores ISO 8601 timestamps—2025-02-02T03:38:54, 2024-07-01T04:17:43, 2023-10-04T15:34:58, and 2025-05-20T07:58:08—each bound to attribute reference LINK-0004 across all four match links, establishing a uniform mechanism for capturing the moment at which a match was recorded or last validated. Governance artifacts carry their own temporal dimension through the effective_date attribute, with dates such as 2025-04-28, 2024-02-08, 2024-10-20, and 2024-01-16 anchoring the enforceability window of each policy binding. The separation of datetime values into their own table, distinct from date-only values, reflects the operational distinction between point-in-time event logging and calendar-date policy生效, a distinction that matters when querying for artifacts whose governance became effective within a given fiscal quarter versus those whose match was recorded during a specific audit window.

The transformation tracking table introduces two additional conceptual dimensions—scheduled_at and triggered_by—that extend the attribute model into the operational domain of system maintenance and data lifecycle management. Non-recoverable transformations such as partition compaction, log rotation, batch compaction, and format conversion are each paired with a secondary operation—checksum verification, index defragmentation, record purging, or index rebuild—and stamped with a scheduled_at timestamp (2023-05-27T08:30:46, 2024-07-23T05:41:48, 2025-03-09T11:37:12, 2023-08-05T01:48:14) that records when the transformation was planned or executed. The triggered_by column classifies the origin of the transformation as event, manual, schedule, or api, providing an auditable provenance chain that distinguishes automated cron-driven compaction from operator-initiated log rotation and API-triggered format conversions. This classification is critical for compliance reporting, as it enables auditors to reconstruct not only what transformations occurred and when, but also whether they were initiated by system events, human operators, scheduled jobs, or external API calls—a distinction that carries different liability and control implications under data governance frameworks.

**t_transformation_not_recoverable**

| id | transformation | transformation_2 | scheduled_at | triggered_by |
| --- | --- | --- | --- | --- |
| RECO-0001 | partition compaction | checksum verification | 2023-05-27T08:30:46 | event |
| RECO-0002 | log rotation | index defragmentation | 2024-07-23T05:41:48 | manual |
| RECO-0003 | batch compaction | record purging | 2025-03-09T11:37:12 | schedule |
| RECO-0004 | format conversion | index rebuild | 2023-08-05T01:48:14 | api |
| RECO-0005 | format conversion | feature scaling | 2023-09-25T17:59:19 | manual |
| RECO-0006 | batch compaction | telemetry filtering | 2024-03-31T12:21:12 | event |
| RECO-0007 | snapshot commit | batch compaction | 2023-07-05T00:36:15 | schedule |
| RECO-0008 | index defragmentation | index defragmentation | 2025-04-13T18:22:12 | schedule |