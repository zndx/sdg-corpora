---
chapter_id: ch_live_soc2_processing_integrity_6a44b1
topic_id: 26
family: 07_long_tail
cited_terms: ['soc2_processing_integrity', 'constraint_subclass', 'frame_refinement']
model: engine-refine
---

In compliance and governance frameworks, every control, constraint, and refinement must be unambiguously identifiable and traceable across the organizational landscape. Unique identifiers serve as the backbone of this traceability, anchoring each entity to a stable reference point that survives structural changes and cross-referencing. Processing integrity controls, for instance, carry identifiers such as INTE-0001 through INTE-0004, each mapped to a specific organization—Quantum Retail Group, GlobalPay Systems, Pinnacle SaaS Platform, and Nexus Cloud Services—ensuring that auditors can pinpoint exactly which entity's operations a given control governs. Similarly, constraint records use identifiers like CONS-0001 through CONS-0004 to distinguish between a Geofence boundary, an Audit log retention rule, a Data retention policy, and an Encryption standard, while frame refinements are tagged REFI-0001 through REFI-0004 to differentiate a Regulatory Audit Trail from a Lab Sample Container Type or a Data Lake Partition Schema. Without such identifiers, the web of relationships that underpins any governance program would collapse into ambiguity.

**t_soc2_processing_integrity**

| id | soc |
| --- | --- |
| INTE-0001 | Quantum Retail Group |
| INTE-0002 | GlobalPay Systems |
| INTE-0003 | Pinnacle SaaS Platform |
| INTE-0004 | Nexus Cloud Services |
| INTE-0005 | Vertex Analytics Ltd |
| INTE-0006 | Quantum Retail Group |

**t_soc2_processing_integrity_for_s_o_c2_domain**

| id | for_s_o_c2_domain |
| --- | --- |
| INTE-0001 | user provisioning |
| INTE-0002 | customer onboarding |
| INTE-0003 | report generation |
| INTE-0004 | customer onboarding |
| INTE-0005 | inventory management |
| INTE-0006 | supply chain tracking |

**t_frame_refinement**

| id | frame |
| --- | --- |
| REFI-0001 | Regulatory Audit Trail |
| REFI-0002 | Lab Sample Container Type |
| REFI-0003 | Data Lake Partition Schema |
| REFI-0004 | Regulatory Audit Trail |
| REFI-0005 | Data Lake Partition Schema |
| REFI-0006 | ISO 9001 Quality Framework |

**t_frame_refinement_refines_frame**

| id | refines_frame |
| --- | --- |
| REFI-0001 | Ground Station Uplink |
| REFI-0002 | Sterile Container Variant |
| REFI-0003 | IPv4 Header Format |
| REFI-0004 | Ku Band Downlink |
| REFI-0005 | Sterile Container Variant |
| REFI-0006 | Ground Station Uplink |

Not all controls and constraints carry equal weight, which is why priority levels are assigned to reflect their relative importance within the framework. The constraint subclass table assigns priority values ranging from 2 to 4, with the Encryption standard receiving the highest priority of 2, the Geofence boundary and Audit log retention both at priority 3, and the Data retention policy at priority 4. These numeric designations enable governance teams to triage remediation efforts, allocate audit resources, and communicate risk posture to stakeholders in a standardized manner. A priority of 2 signals that the Encryption standard constrains a Sensor array and demands immediate attention, while a priority of 4 on the Data retention policy—constraining a Network interface—indicates a lower urgency that can be addressed within a broader remediation cycle.

**t_constraint_subclass**

| id | constraint | constrains | priority | review_cycle_days |
| --- | --- | --- | --- | --- |
| CONS-0001 | Geofence boundary | Database cluster | 3 | 311 |
| CONS-0002 | Audit log retention | Compute node | 3 | 467 |
| CONS-0003 | Data retention policy | Network interface | 4 | 185 |
| CONS-0004 | Encryption standard | Sensor array | 2 | 391 |

The cadence at which controls and constraints are reviewed is equally critical, and this is captured through review cycle days. The constraint subclass records show substantial variation: the Geofence boundary requires review every 311 days, the Audit log retention every 467 days, the Data retention policy every 185 days, and the Encryption standard every 391 days. These intervals are not arbitrary; they reflect regulatory requirements, risk exposure, and operational impact. A shorter cycle of 185 days for the Data retention policy suggests a higher frequency of change or a tighter regulatory window, whereas the 467-day cycle for Audit log retention may indicate a more stable control with infrequent modifications. Governance programs use these review cycles to schedule audits, trigger compliance checks, and ensure that no control lapses without oversight.

Relationships between entities are expressed through subject and target designations, which define the direction and nature of connections across the framework. In the relationship between processing integrity controls and SOC2 domains, the subject column (soc_id) identifies the control being applied—such as INTE-0006 or INTE-0003—while the target column (for_s_o_c2_domain_id) identifies the domain receiving that control, like INTE-0005 or INTE-0003. This subject-to-target pattern also appears in frame refinements, where frame_id (the subject) points to a refinement such as REFI-0005 or REFI-0006, and refines_frame_id (the target) indicates what is being refined, whether a Ground Station Uplink, a Sterile Container Variant, or a Ku Band Downlink. The subject is the source of the relationship; the target is its destination. Together, they form a directed graph that maps how controls flow into domains and how refinements cascade through frames.

**t_soc2_processing_integrity__for_s_o_c2_domain**

| id | soc_id | for_s_o_c2_domain_id | role |
| --- | --- | --- | --- |
| INTE-0001 | INTE-0006 | INTE-0005 | owner |
| INTE-0002 | INTE-0003 | INTE-0006 | reviewer |
| INTE-0003 | INTE-0004 | INTE-0005 | observer |
| INTE-0004 | INTE-0006 | INTE-0003 | reviewer |
| INTE-0005 | INTE-0002 | INTE-0003 | owner |
| INTE-0006 | INTE-0003 | INTE-0002 | reviewer |
| INTE-0007 | INTE-0005 | INTE-0004 | contributor |
| INTE-0008 | INTE-0004 | INTE-0003 | observer |

**t_frame_refinement__refines_frame**

| id | frame_id | refines_frame_id | role |
| --- | --- | --- | --- |
| REFI-0001 | REFI-0005 | REFI-0004 | observer |
| REFI-0002 | REFI-0006 | REFI-0005 | owner |
| REFI-0003 | REFI-0003 | REFI-0006 | contributor |
| REFI-0004 | REFI-0002 | REFI-0005 | reviewer |
| REFI-0005 | REFI-0003 | REFI-0006 | contributor |
| REFI-0006 | REFI-0004 | REFI-0004 | owner |
| REFI-0007 | REFI-0005 | REFI-0003 | owner |
| REFI-0008 | REFI-0002 | REFI-0006 | contributor |

Roles complete the picture by assigning accountability to each relationship. In the processing integrity-to-domain mapping, roles such as owner, reviewer, and observer distinguish who holds primary responsibility, who validates compliance, and who requires visibility. INTE-0001 applied to a domain carries an owner role, INTE-0003 carries a reviewer role, and INTE-0004 carries an observer role, ensuring that every control-domain pairing has a clear chain of responsibility. The same role taxonomy appears in frame refinements, where REFI-0005 refining REFI-0004 is assigned an observer role, REFI-0006 refining REFI-0005 is an owner, REFI-0003 refining REFI-0006 is a contributor, and REFI-0002 refining REFI-0005 is a reviewer. These role assignments transform abstract relationships into actionable governance: they answer not just which control applies to which domain, but who is accountable for it, who verifies it, and who must be informed.