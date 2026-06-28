---
chapter_id: ch_live_schemaorg_org_taxid_802bdd
topic_id: 40
family: 07_long_tail
cited_terms: ['schemaorg_org_taxid', 'radicalization_process', 'agent_acts_on_behalf_of']
model: engine-refine
---

Organizational identity management within the governance framework rests upon the dual registration of institutional identifiers and their cross-referencing through standardized taxonomic keys. The `t_schemaorg_org_taxid` table anchors each entity to a schema.org designation—CERN Geneva, NSF Arlington, NASA Goddard—while the companion table `t_schemaorg_org_taxid_tax_i_d` maps the same entities to their Internal Revenue Service tax identification numbers, such as 27-0699690 for the entity bearing TAXI-0001 or 95-6033790 for TAXI-0002. These parallel registries ensure that every participating organization carries both a machine-readable semantic identifier and a legally recognized tax designation, a duality that supports auditability across regulatory and technical boundaries. The join table `t_schemaorg_org_taxid__tax_i_d` formalizes the relationships between schema.org entities and tax identifiers, assigning each linkage a governance role—reviewer, owner, or observer—that determines the authority and scope of the association. For instance, the linkage identified as TAXI-0001 carries the role of reviewer, indicating that the schema.org entity TAXI-0005 is subject to review by the tax-registered entity TAXI-0004, whereas the linkage TAXI-0006 designates an observer role, conferring a more limited, informational relationship between TAXI-0004 and TAXI-0006.

**t_schemaorg_org_taxid**

| id | schemaorg |
| --- | --- |
| TAXI-0001 | CERN Geneva |
| TAXI-0002 | NSF Arlington |
| TAXI-0003 | NASA Goddard |
| TAXI-0004 | NSF Arlington |
| TAXI-0005 | NSF Arlington |
| TAXI-0006 | MIT CSAIL |

**t_schemaorg_org_taxid_tax_i_d**

| id | tax_i_d |
| --- | --- |
| TAXI-0001 | 27-0699690 |
| TAXI-0002 | 95-6033790 |
| TAXI-0003 | 06-0600089 |
| TAXI-0004 | 52-1693400 |
| TAXI-0005 | 95-6033790 |
| TAXI-0006 | 20-0000116 |

**t_schemaorg_org_taxid__tax_i_d**

| id | schemaorg_id | tax_i_d_id | role |
| --- | --- | --- | --- |
| TAXI-0001 | TAXI-0005 | TAXI-0004 | reviewer |
| TAXI-0002 | TAXI-0004 | TAXI-0002 | reviewer |
| TAXI-0003 | TAXI-0004 | TAXI-0005 | owner |
| TAXI-0004 | TAXI-0006 | TAXI-0006 | observer |
| TAXI-0005 | TAXI-0004 | TAXI-0004 | owner |
| TAXI-0006 | TAXI-0005 | TAXI-0002 | observer |
| TAXI-0007 | TAXI-0003 | TAXI-0006 | observer |
| TAXI-0008 | TAXI-0006 | TAXI-0002 | owner |

The radicalization process registry captures the temporal and organizational dimensions of extremist network development through structured phase tracking. Each entry in `t_radicalization_process` is assigned a unique process identifier—PROC-0001 through PROC-0004—and classified by its radicalization phase, such as Militia Formation Phase, Network Recruit Wave, or Radicalization Vector Delta. The `has_participant` column binds each process to an affiliated organization, establishing a direct lineage between organizational actors and their operational involvement in specific radicalization stages. Sympathizer Network Alpha appears as a participant in both PROC-0001 and PROC-0004, suggesting sustained engagement across distinct phases, while Al-Shabaab Recruitment Cell is linked exclusively to PROC-0002, and Regional Coordination Cell to PROC-0003. This structure enables analysts to trace organizational participation patterns across the radicalization lifecycle and to identify entities that recur across multiple process vectors.

**t_radicalization_process**

| id | radicalization_process | has_participant |
| --- | --- | --- |
| PROC-0001 | Militia Formation Phase | Sympathizer Network Alpha |
| PROC-0002 | Network Recruit Wave | Al-Shabaab Recruitment Cell |
| PROC-0003 | Radicalization Vector Delta | Regional Coordination Cell |
| PROC-0004 | Network Recruit Wave | Sympathizer Network Alpha |
| PROC-0005 | Ideological Shift Cycle | Militia Training Outpost |
| PROC-0006 | Radicalization Vector Delta | Ideological Mentorship Program |

Agent delegation relationships are captured through a tripartite schema that distinguishes the acting agent, the entity on whose behalf action is taken, and the governance role that legitimizes the delegation. The `t_agent_acts_on_behalf_of` table registers individual agents—AuditLogger, LogAggregator, ProvenanceTracker, ETLBatchScheduler—while the join table `t_agent_acts_on_behalf_of_acted_on_behalf_of` records the target entities, including DataGovernanceBoard, AnalyticsDivision, and SecurityOperations. The composite join table `t_agent_acts_on_behalf_of__acted_on_behalf_of` reconciles these relationships by assigning each delegation a role: observer, contributor, owner, or reviewer. The agent BEHA-0001 acts on behalf of BEHA-0006 in a contributor capacity, while BEHA-0003 holds an owner role over BEHA-0001, establishing a hierarchical chain of delegated authority. BEHA-0005 and BEHA-0006 appear as both agents and targets within the same relationship graph, reflecting the bidirectional nature of delegation in complex organizational structures.

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

Together, these registries form an interlocking identity and authority framework that supports compliance verification, provenance tracking, and organizational accountability. The schema.org and tax identifier tables ensure that every participating entity is unambiguously identified across semantic and legal domains, with role annotations governing the nature of cross-entity relationships. The radicalization process table provides a structured mechanism for documenting and analyzing the participation of affiliated organizations in extremist network development, enabling temporal and organizational pattern analysis. The agent delegation tables establish a formal record of who acts on whose behalf and under what authority, with role designations that determine the scope and legitimacy of each delegated action. This integrated approach to identity management, process tracking, and delegation governance ensures that all organizational interactions are recorded, attributable, and subject to audit.

**t_agent_acts_on_behalf_of**

| id | agent |
| --- | --- |
| BEHA-0001 | AuditLogger |
| BEHA-0002 | LogAggregator |
| BEHA-0003 | ProvenanceTracker |
| BEHA-0004 | ETLBatchScheduler |
| BEHA-0005 | ReconciliationBot |
| BEHA-0006 | ETLBatchScheduler |