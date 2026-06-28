---
chapter_id: ch_live_account_authorization_record_722891
topic_id: 24
family: 08_derived
cited_terms: ['account_authorization_record', 'agent_acts_on_behalf_of', 'agent_at_organization']
model: engine-refine
---

Account authorization records constitute the foundational ledger of delegated access within the platform, each entry binding a specific application to the administrator responsible for its governance. A record such as REC-ACC-5591 anchors the authorization of the SnapchatV2 application under the stewardship of security_lee, while PERM-ACC-6609 and AUTH-LOG-3381 capture distinct authorization events—permanent and audit-logged respectively—for BlueskyClient and LinkedInPro, administered by platform_mgr_wu and sysadmin_klee. The identifier space, ranging from RECO-0001 through RECO-0004, provides a stable reference for downstream queries and cross-references, ensuring that every delegation event can be traced to its originating application and its assigned operator. This triad—record identifier, application, and administrator—forms the irreducible core of the authorization model, enabling both operational accountability and forensic auditability.

**t_account_authorization_record**

| id | account_authorization_record | registers_application | assigns_administrator |
| --- | --- | --- | --- |
| RECO-0001 | REC-ACC-5591 | SnapchatV2 | security_lee |
| RECO-0002 | PERM-ACC-6609 | SnapchatV2 | admin_jchen |
| RECO-0003 | REC-ACC-5591 | BlueskyClient | platform_mgr_wu |
| RECO-0004 | AUTH-LOG-3381 | LinkedInPro | sysadmin_klee |
| RECO-0005 | AUTH-LOG-1192 | DiscordMain | platform_mgr_wu |
| RECO-0006 | AUTH-REC-2215 | LinkedInPro | sysadmin_klee |

**t_account_authorization_record_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| RECO-0001 | encoding | xsd:string |
| RECO-0002 | label_text | xsd:string |
| RECO-0003 | language | xsd:string |

**t_account_authorization_record_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RECO-0001 | RECO-0001 | RECO-0001 | Encoding 01 |
| RECO-0002 | RECO-0001 | RECO-0002 | nightly summary |
| RECO-0003 | RECO-0001 | RECO-0003 | es |
| RECO-0004 | RECO-0002 | RECO-0001 | Encoding 04 |
| RECO-0005 | RECO-0002 | RECO-0002 | audit excerpt |
| RECO-0006 | RECO-0002 | RECO-0003 | fr |
| RECO-0007 | RECO-0003 | RECO-0001 | Encoding 07 |
| RECO-0008 | RECO-0003 | RECO-0002 | audit excerpt |

The attribute layer enriches each authorization record with structured metadata, decoupling descriptive properties from the core delegation relationship to preserve normalization and support extensibility. Attributes such as encoding, label_text, and language are declared with their schema types—xsd:string across the board—allowing the system to validate incoming values without hardcoding domain constraints into the authorization logic itself. The value store then materializes these declarations: record RECO-0001 carries encoding values of "Encoding 01" and "Encoding 04" alongside a label_text of "nightly summary" and a language attribute set to "es", while RECO-0002 inherits an encoding of "Encoding 04" through its own attribute binding. This entity-attribute-value pattern permits arbitrary metadata to be attached to any authorization record without schema migration, a design choice that proves essential in environments where compliance requirements evolve independently of the core authorization engine.

Beyond the record-application-administrator axis, the system models organizational agency through a two-tier delegation structure that distinguishes between the agent performing an action and the body on whose behalf it acts. The telemetry-ingestor, schema-validator, ReconciliationBot, and ETLBatchScheduler each operate under the authority of governing entities such as the DataGovernanceBoard, AnalyticsDivision, and SecurityOperations. The intermediate relationship table resolves the many-to-many cardinality between agents and their sponsoring bodies, assigning each pairing a precise role—observer, contributor, owner, or reviewer—that determines the scope of permissible actions. Agent BEHA-0005, for instance, assumes the role of observer against BEHA-0003, while BEHA-0001 functions as contributor to BEHA-0006, establishing a role-based matrix that governs not merely who acts but in what capacity.

**t_agent_acts_on_behalf_of**

| id | agent |
| --- | --- |
| BEHA-0001 | telemetry-ingestor |
| BEHA-0002 | schema-validator |
| BEHA-0003 | ReconciliationBot |
| BEHA-0004 | ETLBatchScheduler |
| BEHA-0005 | BackupDaemon |
| BEHA-0006 | risk-assessor |

**t_agent_acts_on_behalf_of_acted_on_behalf_of**

| id | acted_on_behalf_of |
| --- | --- |
| BEHA-0001 | DataGovernanceBoard |
| BEHA-0002 | DataGovernanceBoard |
| BEHA-0003 | AnalyticsDivision |
| BEHA-0004 | SecurityOperations |
| BEHA-0005 | ComplianceAudit |
| BEHA-0006 | SecurityOperations |

**t_agent_acts_on_behalf_of__acted_on_behalf_of**

| id | agent_id | acted_on_behalf_of_id | role |
| --- | --- | --- | --- |
| BEHA-0001 | BEHA-0005 | BEHA-0003 | observer |
| BEHA-0002 | BEHA-0001 | BEHA-0006 | contributor |
| BEHA-0003 | BEHA-0003 | BEHA-0001 | owner |
| BEHA-0004 | BEHA-0006 | BEHA-0005 | reviewer |
| BEHA-0005 | BEHA-0003 | BEHA-0002 | observer |
| BEHA-0006 | BEHA-0006 | BEHA-0001 | reviewer |
| BEHA-0007 | BEHA-0005 | BEHA-0001 | contributor |
| BEHA-0008 | BEHA-0006 | BEHA-0006 | owner |

**t_agent_at_organization**

| id | agent | at_organization | created_date | owner |
| --- | --- | --- | --- | --- |
| ORGA-0001 | ml-trainer | data-governance | 2025-01-04 | ml-infra |
| ORGA-0002 | pipeline-runner | security-ops | 2023-09-23 | analytics |
| ORGA-0003 | AuditLogger | cloud-infrastructure | 2024-03-21 | ml-infra |
| ORGA-0004 | AuditLogger | quality-assurance | 2025-01-23 | sre |
| ORGA-0005 | AuditLogger | network-operations | 2024-08-08 | analytics |
| ORGA-0006 | backup-scheduler | infrastructure-security | 2024-08-22 | platform-team |

The organizational membership dimension further grounds these abstract delegations in concrete operational units, recording when an agent joined a specific organizational context and which infrastructure team owns that membership. The ml-trainer agent was enrolled in the data-governance organization on 2025-01-04 under the ownership of ml-infra, whereas the pipeline-runner joined security-ops on 2023-09-23, reflecting a longer-standing operational relationship. The AuditLogger appears twice in the membership registry—first in cloud-infrastructure on 2024-03-21 owned by ml-infra, and subsequently in quality-assurance on 2025-01-23 under sre ownership—demonstrating that agents may hold concurrent or successive memberships across organizational boundaries, each with distinct ownership and temporal provenance. This temporal dimension, captured through the created_date field, enables time-bounded access reviews and supports compliance frameworks that require evidence of when authorizations were established.