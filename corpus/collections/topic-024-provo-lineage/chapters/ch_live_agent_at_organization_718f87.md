---
chapter_id: ch_live_agent_at_organization_718f87
topic_id: 24
family: 05_provo_lineage
cited_terms: ['agent_at_organization', 'verification_with_method', 'requirement_verified_by']
model: engine-refine
---

The temporal provenance of every governance record begins with the moment of its creation, a timestamp that anchors the provenance of organizational assignments and compliance mappings alike. An agent such as the backup-scheduler was registered within the data-governance organization on 2025-01-04, while the cert-manager entered the security-ops domain nearly two years earlier, on 2023-09-23. These dates are not decorative; they establish the chronological order of access entitlements and compliance obligations, enabling auditors to reconstruct when a risk-assessor gained entry to cloud-infrastructure on 2024-03-21 versus when a second risk-assessor was provisioned into quality-assurance on 2025-01-23. The createddate column thus serves as the immutable first coordinate in any audit trail, without which the sequence of policy enforcement and personnel changes would be irrecoverable.

Every record in the system is distinguished by a stable identifier—ORGA-0001 through ORGA-0004 for organizational assignments, METH-0001 through METH-0004 for verification methods, and VERI-0001 through VERI-0004 for requirement-to-verifier linkages. These identifiers are the primary keys that permit cross-referencing across the relational fabric of the database. A Certificate chain verification (METH-0001) can be traced to its underlying verification method, SHA-256 hashing, through a junction record that carries its own identifier (METH-0001) and a role designation. Similarly, a Data retention policy requirement (VERI-0001) is connected to its verifier, the Automated scanner, through a separate junction record (VERI-0001) with its own role. The identifier is the invariant handle that survives schema evolution and enables referential integrity across tables that model entirely different domains of governance.

**t_verification_with_method**

| id | verification |
| --- | --- |
| METH-0001 | Certificate chain verification |
| METH-0002 | Model accuracy assessment |
| METH-0003 | Test suite execution |
| METH-0004 | Static code analysis |
| METH-0005 | Data quality audit |
| METH-0006 | Certificate chain verification |

**t_verification_with_method_via_verification_method**

| id | via_verification_method |
| --- | --- |
| METH-0001 | SHA-256 hashing |
| METH-0002 | ISO 27001 audit |
| METH-0003 | PCI DSS compliance scan |
| METH-0004 | Kubernetes liveness probe |
| METH-0005 | SHA-256 hashing |
| METH-0006 | JSON Schema validation |

**t_requirement_verified_by**

| id | requirement |
| --- | --- |
| VERI-0001 | Data retention policy |
| VERI-0002 | Compliance baseline |
| VERI-0003 | Data retention policy |
| VERI-0004 | Data retention policy |
| VERI-0005 | Audit logging mandate |
| VERI-0006 | Provenance tracking spec |

**t_requirement_verified_by_verified_by**

| id | verified_by |
| --- | --- |
| VERI-0001 | Automated scanner |
| VERI-0002 | Lab director |
| VERI-0003 | Internal audit team |
| VERI-0004 | System validator |
| VERI-0005 | Automated scanner |
| VERI-0006 | Automated scanner |

Ownership assigns accountability for each record to a specific operational domain. The agent assignments for backup-scheduler and risk-assessor are both owned by ml-infra, indicating that this team retains stewardship over both the scheduling infrastructure and the risk evaluation function. The cert-manager, by contrast, falls under analytics, while the second risk-assessor assignment is owned by sre. This owner column is not a user name but a team or system designation, and it is the mechanism by which responsibility is distributed across the organization's operational units. When an auditor queries which team is accountable for a given agent-organization pairing, the owner field provides the answer without requiring a join to a separate personnel directory.

The junction tables introduce the concepts of subject, target, and role, which together model the relational semantics of compliance and verification. In the verification method mapping, the subject column (verification_id) identifies the source entity in the relationship—METH-0005, METH-0004, METH-0003, METH-0006—while the target column (via_verification_method_id) identifies the destination—METH-0004, METH-0006, METH-0002, METH-0006. The role column then specifies the capacity in which the subject engages the target: reviewer, contributor, owner, or observer. The same pattern appears in the requirement verification junction, where VERI-0006 appears as both subject and target across different records, and roles of owner, observer, reviewer, and observer are assigned accordingly. This triad of subject, target, and role transforms a simple many-to-many relationship into a typed, semantically rich association that can be queried, filtered, and audited with precision.

**t_verification_with_method__via_verification_method**

| id | verification_id | via_verification_method_id | role |
| --- | --- | --- | --- |
| METH-0001 | METH-0005 | METH-0004 | reviewer |
| METH-0002 | METH-0004 | METH-0006 | contributor |
| METH-0003 | METH-0003 | METH-0002 | owner |
| METH-0004 | METH-0006 | METH-0006 | observer |
| METH-0005 | METH-0004 | METH-0004 | contributor |
| METH-0006 | METH-0002 | METH-0002 | owner |
| METH-0007 | METH-0001 | METH-0003 | contributor |
| METH-0008 | METH-0003 | METH-0005 | observer |

In practice, these six concepts—createddate, identifier, owner, role, subject, and target—form the structural backbone of any relational governance system. They appear not as isolated columns but as recurring patterns across tables that model organizational assignments, verification methods, and compliance requirements. The createddate establishes when a record came into being; the identifier ensures it can be referenced unambiguously; the owner assigns accountability; and the subject-target-role triad encodes the nature of the relationship between entities. Together, they enable an organization to answer questions such as which team owns the risk-assessor in quality-assurance (sre), what verification method underpins a Certificate chain verification (SHA-256 hashing), and what role a given verifier plays in a compliance assessment (reviewer, observer, owner, or contributor). The data values—ORGA-0001, METH-0003, VERI-0002, ml-infra, Kubernetes liveness probe, Internal audit team—are the concrete instances of these abstract concepts, and it is their systematic arrangement that makes the database a reliable instrument of governance.

**t_agent_at_organization**

| id | agent | at_organization | created_date | owner |
| --- | --- | --- | --- | --- |
| ORGA-0001 | backup-scheduler | data-governance | 2025-01-04 | ml-infra |
| ORGA-0002 | cert-manager | security-ops | 2023-09-23 | analytics |
| ORGA-0003 | risk-assessor | cloud-infrastructure | 2024-03-21 | ml-infra |
| ORGA-0004 | risk-assessor | quality-assurance | 2025-01-23 | sre |
| ORGA-0005 | risk-assessor | network-operations | 2024-08-08 | analytics |
| ORGA-0006 | pipeline-runner | infrastructure-security | 2024-08-22 | platform-team |

**t_requirement_verified_by__verified_by**

| id | requirement_id | verified_by_id | role |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0006 | VERI-0006 | owner |
| VERI-0002 | VERI-0002 | VERI-0003 | observer |
| VERI-0003 | VERI-0004 | VERI-0006 | reviewer |
| VERI-0004 | VERI-0003 | VERI-0005 | observer |
| VERI-0005 | VERI-0004 | VERI-0001 | owner |
| VERI-0006 | VERI-0004 | VERI-0002 | owner |
| VERI-0007 | VERI-0001 | VERI-0002 | reviewer |
| VERI-0008 | VERI-0004 | VERI-0001 | observer |