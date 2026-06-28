---
chapter_id: ch_live_evidence_at_quality_tier_eaabcf
topic_id: 1
family: 06_belief_structure
cited_terms: ['evidence_at_quality_tier', 'hipaa_safeguard_physical', 'control_equiv_implements_with_owner']
model: engine-refine
---

A compliance governance framework rests on a foundation of uniquely identifiable entities—evidence records, quality tiers, physical safeguards, and policy controls—each assigned a stable identifier that serves as the immutable anchor for all downstream relationships. Evidence items such as network packets, audit trails, and inspection photos are classified into quality tiers ranging from OWNE-0001 through OWNE-0004, establishing a hierarchy of assurance that determines how heavily each artifact weighs in compliance assessments. Physical safeguards like the Alarm Siren System, Cabinet Lockdown Procedure, and Access Control Log receive their own identifiers (PHYS-0001 through PHYS-0004), while policy controls such as SOC2 Type II, Data Retention Policy, PII Masking Rule, and NIST AC-2 are similarly enumerated. This identifier discipline ensures that every object in the governance graph can be referenced unambiguously, regardless of how many times it participates in relationships or how its descriptive properties evolve over time.

**t_evidence_at_quality_tier**

| id | evidence | at_quality_tier |
| --- | --- | --- |
| TIER-0001 | network packets | OWNE-0004 |
| TIER-0002 | audit trails | OWNE-0003 |
| TIER-0003 | network packets | OWNE-0002 |
| TIER-0004 | inspection photos | OWNE-0001 |
| TIER-0005 | telemetry streams | OWNE-0001 |
| TIER-0006 | field measurements | OWNE-0003 |
| TIER-0007 | device firmware | OWNE-0002 |
| TIER-0008 | audit trails | OWNE-0004 |

**t_evidence_at_quality_tier_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| TIER-0001 | confidence | xsd:decimal |
| TIER-0002 | dimension_kind | xsd:string |
| TIER-0003 | method | xsd:string |
| TIER-0004 | recorded_at | xsd:dateTime |
| TIER-0005 | uncertainty | xsd:decimal |
| TIER-0006 | unit | xsd:string |
| TIER-0007 | value | xsd:decimal |
| TIER-0008 | encoding | xsd:string |

**t_evidence_at_quality_tier_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0001 | TIER-0004 | 2024-11-19T18:15:43 |
| TIER-0002 | TIER-0002 | TIER-0004 | 2023-02-10T23:54:33 |
| TIER-0003 | TIER-0003 | TIER-0004 | 2023-06-07T05:45:43 |
| TIER-0004 | TIER-0004 | TIER-0004 | 2024-08-05T11:37:21 |
| TIER-0005 | TIER-0005 | TIER-0004 | 2025-03-30T21:54:34 |
| TIER-0006 | TIER-0006 | TIER-0004 | 2023-10-26T18:53:01 |
| TIER-0007 | TIER-0007 | TIER-0004 | 2023-09-26T03:30:22 |
| TIER-0008 | TIER-0008 | TIER-0004 | 2023-04-10T10:08:00 |

**t_evidence_at_quality_tier_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0001 | TIER-0001 | 0.731 |
| TIER-0002 | TIER-0001 | TIER-0005 | 574.79 |
| TIER-0003 | TIER-0001 | TIER-0007 | 563.53 |
| TIER-0004 | TIER-0002 | TIER-0001 | 0.358 |
| TIER-0005 | TIER-0002 | TIER-0005 | 139.04 |
| TIER-0006 | TIER-0002 | TIER-0007 | 944.94 |
| TIER-0007 | TIER-0003 | TIER-0001 | 0.228 |
| TIER-0008 | TIER-0003 | TIER-0005 | 33.93 |

**t_evidence_at_quality_tier_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0001 | TIER-0002 | Dimension Kind 01 |
| TIER-0002 | TIER-0001 | TIER-0008 | Encoding 02 |
| TIER-0003 | TIER-0001 | TIER-0009 | change rationale |
| TIER-0004 | TIER-0001 | TIER-0010 | ja |
| TIER-0005 | TIER-0001 | TIER-0003 | hybrid |
| TIER-0006 | TIER-0001 | TIER-0006 | kg |
| TIER-0007 | TIER-0002 | TIER-0002 | Dimension Kind 07 |
| TIER-0008 | TIER-0002 | TIER-0008 | Encoding 08 |

**t_hipaa_safeguard_physical**

| id | hipaa |
| --- | --- |
| PHYS-0001 | Alarm Siren System |
| PHYS-0002 | Cabinet Lockdown Procedure |
| PHYS-0003 | Access Control Log |
| PHYS-0004 | Cabinet Lockdown Procedure |
| PHYS-0005 | Badge Printer |
| PHYS-0006 | Badge Printer |

**t_hipaa_safeguard_physical_hipaa_safeguard**

| id | hipaa_safeguard |
| --- | --- |
| PHYS-0001 | Media Disposal Protocol |
| PHYS-0002 | Mantrap Entry |
| PHYS-0003 | CCTV Monitoring |
| PHYS-0004 | Equipment Maintenance Schedule |
| PHYS-0005 | Visitor Badge System |
| PHYS-0006 | Power Redundancy Plan |
| PHYS-0007 | Equipment Maintenance Schedule |
| PHYS-0008 | Keycard Reader |

Attributes provide the dimensional detail that transforms a bare identifier into a fully specified entity. Each attribute carries a name—confidence, dimension_kind, method, recorded_at—and a type that constrains the values it may hold, drawn from the XSD vocabulary: xsd:decimal for numeric precision, xsd:string for categorical labels, and xsd:dateTime for temporal markers. The type system enforces data integrity at the schema level, ensuring that a confidence score of 0.731 or 0.358 is never conflated with a dimension kind like "Dimension Kind 01" or a recorded timestamp such as 2024-11-19T18:15:43. Because attributes span multiple value types, the framework distributes attribute values across dedicated storage tables—decimal values, datetime values, and variable-length character strings—each keyed by the entity and attribute identifiers it describes. This separation preserves type safety while allowing any entity to carry a rich, heterogeneous set of properties without schema bloat.

Enforcement mechanisms define the operational posture of each control, distinguishing between blocking controls that prevent non-compliant actions and mandatory controls that require compliance but allow for procedural execution. The Data Retention Policy and NIST AC-2 are enforced as mandatory measures, while SOC2 Type II and PII Masking Rule operate in blocking mode, actively preventing violations at the point of occurrence. This distinction is critical for risk management: blocking controls provide real-time prevention, whereas mandatory controls establish obligations that are verified through audit and review cycles. The enforcement classification directly influences how evidence is collected and evaluated—blocking controls demand continuous monitoring artifacts, while mandatory controls may rely on periodic audit trails and inspection photos to demonstrate adherence.

The framework models relationships between safeguards through a subject-target-role triad that captures not only what is connected to what, but the nature of that connection. A physical safeguard such as the Cabinet Lockdown Procedure may serve as the subject in a relationship where it acts as the owner of a target safeguard like the Equipment Maintenance Schedule, while another safeguard might assume the role of reviewer or observer. This role-based relationship model—owner, reviewer, observer—provides a clear accountability chain that can be audited and traced. The subject-target structure allows safeguards to participate in multiple relationships simultaneously, creating a graph of interdependencies that reveals how a single safeguard like PHYS-0006 can implement both the Data Retention Policy and the PII Masking Rule, each with its own enforcement posture and quality tier assignment.

**t_hipaa_safeguard_physical__hipaa_safeguard**

| id | hipaa_id | hipaa_safeguard_id | role |
| --- | --- | --- | --- |
| PHYS-0001 | PHYS-0006 | PHYS-0002 | owner |
| PHYS-0002 | PHYS-0004 | PHYS-0005 | reviewer |
| PHYS-0003 | PHYS-0002 | PHYS-0008 | observer |
| PHYS-0004 | PHYS-0001 | PHYS-0008 | owner |
| PHYS-0005 | PHYS-0004 | PHYS-0003 | observer |
| PHYS-0006 | PHYS-0006 | PHYS-0004 | owner |
| PHYS-0007 | PHYS-0001 | PHYS-0001 | reviewer |
| PHYS-0008 | PHYS-0002 | PHYS-0008 | contributor |

**t_control_equiv_implements_with_owner**

| id | control | implements | enforcement | language |
| --- | --- | --- | --- | --- |
| OWNE-0001 | SOC2 Type II | PHYS-0004 | blocking | ja |
| OWNE-0002 | Data Retention Policy | PHYS-0006 | mandatory | ja |
| OWNE-0003 | PII Masking Rule | PHYS-0006 | blocking | en |
| OWNE-0004 | NIST AC-2 | PHYS-0002 | mandatory | ja |
| OWNE-0005 | Encryption Standard | PHYS-0006 | blocking | ja |
| OWNE-0006 | SOC2 Type II | PHYS-0001 | mandatory | de |

Language specifications and implementation mappings complete the governance picture by ensuring that controls are not only technically enforceable but also operationally executable across diverse environments. Controls are implemented in specific languages—Japanese (ja) and English (en)—which determines the procedural documentation, user interfaces, and training materials required for compliance. The implementation mapping links abstract controls to concrete physical safeguards: SOC2 Type II maps to PHYS-0004, Data Retention Policy to PHYS-0006, and NIST AC-2 to PHYS-0002, creating a traceable chain from policy requirement to physical implementation. This mapping is essential for auditors who must demonstrate that a high-level control obligation has been translated into an enforceable, language-appropriate safeguard with a defined quality tier and supporting evidence.