---
chapter_id: ch_live_control_basic_7b5663
topic_id: 26
family: 03_directive_governance
cited_terms: ['control_basic', 'control_equiv_implements_with_owner', 'control_implements']
model: engine-refine
---

Every control in a governance framework requires a stable, machine-readable identifier to ensure unambiguous reference across audits, reports, and automated tooling. Identifiers such as CONT-0001 through CONT-0004 anchor baseline control records, while OWNE-0001 through OWNE-0004 and IMPL-0001 through IMPL-0004 serve the same purpose for ownership mappings and implementation relationships respectively. These keys are not merely labels; they are the join points that connect a control's definition to its enforcement policy, its implementing technology, and its organizational owner. Without consistent identifiers, an auditor could not trace a requirement like "Anomaly detection limit" back to the specific OPA Policy Controller or AWS KMS resource responsible for its execution.

**t_control_basic**

| id | control | effective_date | mandatory |
| --- | --- | --- | --- |
| CONT-0001 | Anomaly detection limit | 2025-01-22 | false |
| CONT-0002 | Audit logging standard | 2025-04-27 | false |
| CONT-0003 | Data retention mandate | 2024-12-05 | true |
| CONT-0004 | Anomaly detection limit | 2025-05-27 | true |
| CONT-0005 | PII masking policy | 2025-02-05 | false |
| CONT-0006 | Rate limiting rule | 2023-06-05 | false |
| CONT-0007 | Checksum verification rule | 2024-10-11 | false |

**t_control_equiv_implements_with_owner**

| id | control | implements | enforcement | language |
| --- | --- | --- | --- | --- |
| OWNE-0001 | SOC2 Type II | Database Audit Trails | blocking | ja |
| OWNE-0002 | Data Retention Policy | Network Firewall Rules | mandatory | ja |
| OWNE-0003 | PII Masking Rule | Network Access Control | blocking | en |
| OWNE-0004 | NIST AC-2 | Database Audit Trails | mandatory | ja |

The effective date of a control establishes the point at which compliance becomes obligatory, enabling phased rollouts and regulatory alignment. A control such as the Data retention mandate, effective 2024-12-05, predates others like the Anomaly detection limit recorded under CONT-0004 with an effective date of 2025-05-27, reflecting a deliberate sequencing of governance requirements. This temporal dimension is critical for organizations undergoing regulatory transitions, as it allows compliance teams to distinguish between legacy obligations and newly activated mandates, and to demonstrate to regulators that controls were not retroactively applied to cover past non-compliance.

Whether a control is mandatory or optional determines the consequences of non-compliance and shapes the organization's risk posture. The Data retention mandate and the Anomaly detection limit associated with CONT-0004 are both marked as mandatory, meaning deviations carry formal risk exposure, whereas the Anomaly detection limit under CONT-0001 and the Audit logging standard under CONT-0002 are non-mandatory, permitting controlled exceptions. This distinction cascades into enforcement mechanisms: mandatory controls are typically enforced through blocking policies that prevent non-compliant actions outright, while optional controls may rely on advisory or monitoring-only enforcement. In the ownership layer, enforcement modes such as blocking and mandatory appear explicitly—for instance, the Database Audit Trails control under OWNE-0001 uses blocking enforcement, and the Network Access Control under OWNE-0003 similarly employs blocking, ensuring that critical security controls cannot be bypassed by user action.

Language settings govern the localization of control documentation, training materials, and enforcement notifications, ensuring that stakeholders receive guidance in their operational language. The ownership mappings for Database Audit Trails and Network Access Control both specify Japanese (ja) as the language, while the Network Access Control entry under OWNE-0003 uses English (en), reflecting a multi-regional deployment where enforcement communications must be delivered in the appropriate locale. This is not a cosmetic concern; in regulated industries, the language in which a control is communicated can affect legal defensibility, particularly in jurisdictions where labor or consumer protection laws require documentation in a specific language.

Priority and scope dimensions determine the order of remediation efforts and the breadth of a control's application across the organization. Priority values such as 1, 3, and 5 establish a clear hierarchy: the Access Review Cycle implemented via Identity Provider SSO carries priority 1, indicating it is the highest-urgency control to address, while the Change Advisory Board's OPA Policy Controller implementation sits at priority 5, suggesting it is lower in the remediation queue. Scope defines the organizational reach of each control—regional, global, or team-level. The Change Advisory Board's OPA Policy Controller applies at a regional scope, the Data Retention Schedule under IMPL-0002 spans globally, and both the Access Review Cycle and the Data Retention Schedule under IMPL-0004 are scoped to the team level. This combination of priority and scope enables compliance teams to triage efforts efficiently, addressing high-priority, globally scoped controls first while managing team-level or regional controls in parallel.

**t_control_implements**

| id | control | implements | priority | scope |
| --- | --- | --- | --- | --- |
| IMPL-0001 | Change Advisory Board | OPA Policy Controller | 5 | regional |
| IMPL-0002 | Data Retention Schedule | OPA Policy Controller | 3 | global |
| IMPL-0003 | Access Review Cycle | AWS KMS | 1 | team |
| IMPL-0004 | Data Retention Schedule | Identity Provider SSO | 3 | team |
| IMPL-0005 | GDPR Data Minimization | Patch Deployment Pipeline | 1 | global |
| IMPL-0006 | Incident Response Protocol | HashiCorp Vault | 1 | global |
| IMPL-0007 | NIST SP 800-53 | Patch Deployment Pipeline | 2 | local |