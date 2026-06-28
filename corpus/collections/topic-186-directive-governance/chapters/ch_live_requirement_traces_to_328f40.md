---
chapter_id: ch_live_requirement_traces_to_328f40
topic_id: 186
family: 03_directive_governance
cited_terms: ['requirement_traces_to', 'policy_effective_period', 'allocation_with_input_facets']
model: engine-refine
---

Identifiers provide the foundational mechanism for unambiguous reference across governance artifacts. Every entity in the compliance ecosystem receives a stable, machine-parseable identifier that persists regardless of how its human-readable label changes. Requirement records carry identifiers such as TRAC-0001 through TRAC-0004, each corresponding to a distinct obligation like the Network Segmentation Rule or the Access Control Mandate. Policy periods use a parallel convention—PERI-0001 through PERI-0004—anchoring documents such as the HIPAA Privacy Rule, GDPR Compliance, PCI DSS v4.0, and NIST SP 800-53 to precise temporal windows. Allocation records follow the same pattern with identifiers like FACE-0001 for the Quota Project Alpha and FACE-0003 for the Model Training Run. This consistent identification scheme ensures that cross-references remain valid even when organizational terminology evolves.

**t_requirement_traces_to**

| id | requirement |
| --- | --- |
| TRAC-0001 | Network Segmentation Rule |
| TRAC-0002 | Access Control Mandate |
| TRAC-0003 | Privacy Compliance Requirement |
| TRAC-0004 | Privacy Compliance Requirement |
| TRAC-0005 | Access Control Mandate |
| TRAC-0006 | Encryption Standard |
| TRAC-0007 | System Availability Target |

**t_requirement_traces_to_traces_to**

| id | traces_to |
| --- | --- |
| TRAC-0001 | HIPAA Security Rule |
| TRAC-0002 | Risk Assessment Matrix |
| TRAC-0003 | Compliance Audit Checklist |
| TRAC-0004 | ISO 27001 Control |
| TRAC-0005 | Penetration Test Suite |
| TRAC-0006 | NIST SP 800-53 |
| TRAC-0007 | Vulnerability Scan Config |

**t_allocation_with_input_facets**

| id | allocation |
| --- | --- |
| FACE-0001 | Quota Project Alpha |
| FACE-0002 | Cluster Alpha Node |
| FACE-0003 | Model Training Run |
| FACE-0004 | Quota Project Alpha |
| FACE-0005 | Quota Project Alpha |
| FACE-0006 | Quota Project Alpha |
| FACE-0007 | Cluster Alpha Node |
| FACE-0008 | Quota Project Alpha |

**t_allocation_with_input_facets_input_facet**

| id | input_facet |
| --- | --- |
| FACE-0001 | PostgreSQL Snapshot |
| FACE-0002 | GraphQL Query Results |
| FACE-0003 | PostgreSQL Snapshot |
| FACE-0004 | Raw JSON Logs |
| FACE-0005 | GraphQL Query Results |
| FACE-0006 | User Event Stream |
| FACE-0007 | User Event Stream |

Scope and language define the jurisdictional and linguistic boundaries within which each policy or requirement applies. Scope determines the organizational reach of a given artifact, ranging from local deployments that affect a single environment to global mandates spanning the entire enterprise, and team-level directives that constrain a specific group. The HIPAA Privacy Rule and GDPR Compliance both operate at the local scope, while PCI DSS v4.0 extends globally and NIST SP 800-53 targets a team. Language specifies the operational or documentation language associated with the effective period—Spanish (es) appears for the HIPAA Privacy Rule, GDPR Compliance, and NIST SP 800-53, while French (fr) is assigned to PCI DSS v4.0. These dimensions ensure that stakeholders can quickly determine whether a given requirement governs their context and whether they can engage with it in their working language.

**t_policy_effective_period**

| id | policy | effective_during | scope | language |
| --- | --- | --- | --- | --- |
| PERI-0001 | HIPAA Privacy Rule | TRAC-0006 | local | es |
| PERI-0002 | GDPR Compliance | TRAC-0003 | local | es |
| PERI-0003 | PCI DSS v4.0 | TRAC-0007 | global | fr |
| PERI-0004 | NIST SP 800-53 | TRAC-0003 | team | es |
| PERI-0005 | CCPA Data Rights | TRAC-0002 | team | es |

Roles establish the governance structure by assigning responsibility and authority to the relationships between entities. In the requirement-to-traces-to linkage, the role field distinguishes between owner, reviewer, and contributor designations. The Privacy Compliance Requirement (TRAC-0004) demonstrates a multi-party relationship: it is owned by one trace target, reviewed by two others, and contributed to by a fourth, reflecting the distributed accountability typical of compliance obligations. Similarly, the allocation-to-input-facet relationship uses the same role taxonomy—the Quota Project Alpha (FACE-0001) has its Raw JSON Logs input facet managed by a reviewer, while the Model Training Run (FACE-0003) assigns a contributor role to its PostgreSQL Snapshot facet. This role-based model makes it possible to audit who is accountable for each connection in the governance graph.

**t_allocation_with_input_facets__input_facet**

| id | allocation_id | input_facet_id | role |
| --- | --- | --- | --- |
| FACE-0001 | FACE-0007 | FACE-0005 | owner |
| FACE-0002 | FACE-0005 | FACE-0003 | reviewer |
| FACE-0003 | FACE-0003 | FACE-0002 | contributor |
| FACE-0004 | FACE-0001 | FACE-0007 | reviewer |
| FACE-0005 | FACE-0002 | FACE-0003 | reviewer |
| FACE-0006 | FACE-0001 | FACE-0001 | observer |
| FACE-0007 | FACE-0002 | FACE-0006 | observer |
| FACE-0008 | FACE-0007 | FACE-0006 | observer |

Subject and target formalize the directional nature of relationships within the framework. Every linkage records a subject—the originating entity—and a target—the entity to which the subject points or relates. In the requirement traceability matrix, TRAC-0001 (Network Segmentation Rule) identifies TRAC-0004 (Privacy Compliance Requirement) as its target, indicating that the segmentation rule traces to or supports the broader privacy obligation. The same requirement, TRAC-0004, appears as a subject pointing to itself in multiple relationship rows, illustrating self-referential governance where a requirement may also validate against its own controls. In the allocation domain, FACE-0007 (Quota Project Alpha) targets FACE-0005 (PostgreSQL Snapshot), while FACE-0001 (Quota Project Alpha) targets FACE-0007, creating a chain of resource dependencies. The subject-target pattern makes the direction of influence explicit, enabling impact analysis when any entity changes.

Together, these six concepts—identifier, language, role, scope, subject, and target—form the structural vocabulary of a compliance framework. Identifiers anchor every entity to a stable reference. Scope and language constrain applicability to the right organizational and linguistic context. Roles distribute accountability across relationships. Subject and target encode the direction and nature of dependencies. The data demonstrates that a single requirement like the Privacy Compliance Requirement can simultaneously carry a local scope, operate in Spanish, be owned by one stakeholder and reviewed by others, and trace to multiple control frameworks. This multidimensional model ensures that governance artifacts are not merely catalogued but are fully contextualized, traceable, and auditable across the organization.

**t_requirement_traces_to__traces_to**

| id | requirement_id | traces_to_id | role |
| --- | --- | --- | --- |
| TRAC-0001 | TRAC-0001 | TRAC-0004 | owner |
| TRAC-0002 | TRAC-0004 | TRAC-0004 | reviewer |
| TRAC-0003 | TRAC-0004 | TRAC-0004 | reviewer |
| TRAC-0004 | TRAC-0001 | TRAC-0004 | contributor |
| TRAC-0005 | TRAC-0007 | TRAC-0005 | contributor |
| TRAC-0006 | TRAC-0002 | TRAC-0003 | observer |
| TRAC-0007 | TRAC-0007 | TRAC-0002 | owner |
| TRAC-0008 | TRAC-0001 | TRAC-0002 | observer |