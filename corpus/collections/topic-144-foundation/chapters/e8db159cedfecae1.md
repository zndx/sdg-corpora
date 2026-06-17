---
chapter_id: e8db159cedfecae1
topic_id: 144
family: 03_directive_governance
cited_terms: ['audit_conducted_by', 'iso27001_annexa_subclass', 'attestation_with_supporting_evidence', 'attestation_at_period', 'requirement_equiv_specifies_target']
model: cerebras/zai-glm-4.7
---

# Chapter 4: Governance Frameworks and the Ontology of Compliance

## 4.1 Scope and Preamble

This chapter delineates the formal ontology underpinning the Information Security Management System (ISMS), specifically focusing on the structural relationships between audit processes, ISO 27001 Annex A controls, and attestation protocols. The text establishes a deterministic mapping between governance directives and their operational realization, ensuring that compliance artifacts are traceable, verifiable, and anchored to specific personnel and temporal constraints. The following sections define the core axioms governing the audit lifecycle, utilizing a relational schema to enforce referential integrity between the directive, the evidence, and the attestation period.

## 4.2 Audit Conducted By

### 4.2.1 Conceptual Definition

The foundational unit of governance is the audit event, formally defined as a process occurring within a specific temporal and organizational context. Per the governing axiom, an audit is not merely an abstract event but a process (`bfo:0000015`) that necessitates agency. The axiom `audit_conducted_by` posits that for any audit process to be valid, it must be conducted by a specific agent identified as a `cco:Person`. This relationship establishes the chain of custody and accountability essential for regulatory adherence.

In practical terms, this axiom prevents the existence of "orphan" audit processes within the governance framework. Every entry in the audit log must be resolvable to a human agent with the authority and clearance to perform such an evaluation. This aligns with the principle of individual accountability mandated by major compliance frameworks, ensuring that automated or procedural checks are ultimately attributable to human oversight.

### 4.2.2 Implementation and Personnel Registry

The implementation of this axiom requires a rigorous registry of authorized personnel. The following table illustrates the instantiation of the `audit_conducted_by` axiom, mapping specific audit processes to the responsible parties. Note that the `x` column represents the audit process instance, which is subclassed from the general process ontology.

**Table 4.1: Audit Process and Agent Assignment**

| ID | Audit Process (x) |
| :--- | :--- |
| `AUD-2023-001` | `Q3_External_Vulnerability_Assessment` |
| `AUD-2023-002` | `Internal_Access_Control_Review` |
| `AUD-2023-003` | `Disaster_Recovery_Tabletop_Exercise` |
| `AUD-2023-004` | `Supply_Chain_Risk_Audit` |
| `AUD-2023-005` | `Annual_GDPR_Compliance_Audit` |

The registry above serves as the primary key for the audit trail. In the context of the relational schema, the `t_audit_conducted_by` table enforces that every `id` (the primary key) is associated with exactly one process definition `x`. While the schema provided in the appendix simplifies the relationship to a single column `x` for the process class, the operational reality requires that this class reference be resolvable to a specific `cco:Person` instance in a broader personnel directory.

### 4.2.3 Operational Context

When an audit is initiated, the system validates the `audit_conducted_by` constraint. For instance, the `Q3_External_Vulnerability_Assessment` (ID: `AUD-2023-001`) cannot be scheduled or executed in the system until a qualified Lead Auditor is assigned. This ensures that the governance framework remains "evidence-anchored," as the output of the process—the audit report—is inextricably linked to the individual who conducted it.

## 4.3 ISO 27001 Annex A Subclass

### 4.3.1 Conceptual Definition

The bridge between internal governance directives and international standards is established through the `iso27001_annexa_subclass` axiom. This axiom defines a class `X` (typically an internal policy or control implementation) as a subclass of `cco:DirectiveICE` (Information Control Element) that specifically satisfies a control objective within ISO 27001 Annex A, denoted as class `Y`.

This relationship is critical for the "long tail" of compliance, where specific technical controls must be mapped to broad regulatory requirements. The axiom asserts that `X` is not just a general directive but is specifically characterized by its adherence to an Annex A control. This allows the organization to query its internal directive corpus and instantly retrieve the corresponding ISO 27001 control mappings, facilitating gap analysis and certification readiness.

### 4.3.2 Relational Mapping and Evidence

The relational schema for this axiom (`t_iso27001_annexa_subclass`) introduces a foreign key constraint linking the Annex A control (`y`) to a requirement specification. This creates a dependency hierarchy where the specific control implementation is validated against a higher-order requirement.

**Table 4.2: Directive to Annex A Mapping**

| ID | Internal Directive (x) | ISO 27001 Annex A Control (y) |
| :--- | :--- | :--- |
| `DIR-SEC-001` | `Password_Complexity_Policy_v2` | `A.9.4.2_Secure_log_on_procedures` |
| `DIR-SEC-002` | `Clear_Desk_Policy` | `A.7.2.1_Screen_locking` |
| `DIR-SEC-003` | `Malware_Definition_Update_Proc` | `A.12.2.1_Malware_protection` |
| `DIR-SEC-004` | `Data_Backup_Rotation_Schedule` | `A.12.3.1_Backup` |
| `DIR-SEC-005` | `Wireless_Access_Standard` | `A.10.1.1_Network_security_controls` |

In Table 4.2, the Internal Directive (`x`) represents the actionable governance artifact within the organization. The ISO 27001 Annex A Control (`y`) represents the external standard. The foreign key constraint ensures that the Annex A control referenced here (`y`) must exist as a defined requirement in the `t_requirement_equiv_specifies_target` table. This enforces consistency; one cannot claim compliance with a non-existent or undefined requirement.

## 4.4 Requirement Equivalence

### 4.4.1 Conceptual Definition

The `requirement_equiv_specifies_target` axiom provides the logical definition of a compliance requirement. It asserts that a class `X` (the Requirement) is equivalent to the intersection of three conditions:
1.  It is a `cco:DirectiveICE`.
2.  It *specifies* some control or mechanism (`Y`).
3.  It *applies to* some target asset or scope (`Z`).

This axiom formalizes the "If-Then" logic of compliance: *If* the requirement exists, *then* it must specify a control and apply to a target. This tripartite structure eliminates ambiguity in compliance scoping. A requirement that does not specify a control is inert; a requirement that does not apply to a target is irrelevant.

### 4.4.2 The Specification Matrix

The following table demonstrates the population of the `t_requirement_equiv_specifies_target` schema. This table acts as the central registry for all compliance obligations, linking the abstract requirement to the specific control (`y`) and the target system (`z`).

**Table 4.3: Requirement Specification and Targeting**

| ID | Requirement (x) | Specifies Control (y) | Applies To Target (z) |
| :--- | :--- | :--- | :--- |
| `REQ-A.9.4.2` | `Secure_Logon_Requirement` | `DIR-SEC-001` | `Active_Directory_Primary` |
| `REQ-A.7.2.1` | `Screen_Locking_Requirement` | `DIR-SEC-002` | `Corporate_Workstation_Fleet` |
| `REQ-A.12.2.1` | `Malware_Protection_Requirement` | `DIR-SEC-003` | `Endpoint_Security_Array` |
| `REQ-A.12.3.1` | `Backup_Availability_Requirement` | `DIR-SEC-004` | `Customer_Relationship_DB` |
| `REQ-A.10.1.1` | `Wireless_Segregation_Req` | `DIR-SEC-005` | `Guest_WiFi_Network` |

The `Specifies Control` column (`y`) in this table references the `t_iso27001_annexa_subclass` table. Conversely, recall that the `t_iso27001_annexa_subclass` table also references this table via its `y` column. This circular reference is intentional in the ontology, representing the equivalence relationship: the Directive *is* the implementation of the Requirement, and the Requirement *specifies* the Directive. In a relational implementation, this is typically managed through deferred constraint checking or careful insertion ordering.

## 4.5 Attestation with Supporting Evidence

### 4.5.1 Conceptual Definition

Compliance is not merely theoretical; it must be evidenced. The axiom `attestation_with_supporting_evidence` defines a class `X` (the Attestation) as a process that possesses supporting evidence `Y`. An attestation is a formal declaration, often signed or digitally certified, asserting that a control is operating effectively. Without the link to `Y` (the evidence), the attestation is unsubstantiated and holds no weight in an audit.

The evidence `Y` is typically a class representing the artifact generated by the control implementation—logs, screenshots, configuration dumps, or third-party scan reports. This axiom ensures that every compliance claim is backed by a retrievable, immutable artifact.

### 4.5.2 Evidence Chain of Custody

The table below operationalizes this axiom. The `Attestation` (`x`) is the formal assertion, while the `Supporting Evidence` (`y`) links to the specific control instance (from the Annex A subclass table) that generated the proof.

**Table 4.4: Attestation and Evidence Linkage**

| ID | Attestation Event (x) | Supporting Evidence (y) |
| :--- | :--- | :--- |
| `ATT-EV-101` | `Q3_Password_Policy_Compliance` | `DIR-SEC-001` |
| `ATT-EV-102` | `Physical_Security_Audit_Logs` | `DIR-SEC-002` |
| `ATT-EV-103` | `AV_Definition_Timestamps` | `DIR-SEC-003` |
| `ATT-EV-104` | `Backup_Restoration_Test_Log` | `DIR-SEC-004` |
| `ATT-EV-105` | `WIDS_Intrusion_Log_Set` | `DIR-SEC-005` |

In this schema, the `Supporting Evidence` column (`y`) functions as a foreign key referencing the `t_iso27001_annexa_subclass` table. This design choice implies that the evidence is intrinsically tied to the specific directive implementation. For example, the `Q3_Password_Policy_Compliance` attestation is valid only because it references the evidence produced by `DIR-SEC-001` (the Password Complexity Policy). If the policy implementation changes, the link to the evidence must be re-established, ensuring that attestations do not drift from their underlying proofs.

## 4.6 Attestation at Period

### 4.6.1 Conceptual Definition

Compliance is temporal. A control that is effective today may be ineffective tomorrow. The `attestation_at_period` axiom addresses this by defining the attestation `X` as a process that occurs at a specific attestation period `Y`. This axiom anchors the compliance state to a timeframe, enabling the organization to track the "freshness" of its compliance posture.

The period `Y` is not merely a timestamp but a class representing a defined regulatory window (e.g., "Q3 2023," "Fiscal Year 2024," or "Post-Incident Phase"). By treating the period as a class linked to the directive implementation, the ontology supports complex temporal logic, such as "attestations are only valid if the period overlaps with the directive's enforcement window."

### 4.6.2 Temporal Validity Framework

The final table illustrates the temporal dimension of the governance framework. It maps the attestation events to the specific periods during which the compliance was verified.

**Table 4.5: Attestation Periodicity**

| ID | Attestation Event (x) | Attestation Period (y) |
| :--- | :--- | :--- |
| `ATT-PD-201` | `Q3_Password_Policy_Compliance` | `DIR-SEC-001` |
| `ATT-PD-202` | `Physical_Security_Audit_Logs` | `DIR-SEC-002` |
| `ATT-PD-203` | `AV_Definition_Timestamps` | `DIR-SEC-003` |
| `ATT-PD-204` | `Backup_Restoration_Test_Log` | `DIR-SEC-004` |
| `ATT-PD-205` | `WIDS_Intrusion_Log_Set` | `DIR-SEC-005` |

Similar to the evidence axiom, the `Attestation Period` column (`y`) references the `t_iso27001_annexa_subclass` table. This structure implies that the definition of the "period" is often derived from the control's own schedule. For instance, the `Backup_Restoration_Test_Log` attestation is linked to the period defined by the `Data_Backup_Rotation_Schedule` (`DIR-SEC-004`). This ensures that attestations are not performed arbitrarily but align with the operational cadence defined by the underlying governance directive.

```json
{
  "tables": [
    {
      "name": "t_audit_conducted_by",
      "rows": [
        [
          "AUD-2023-001",
          "Q3_External_Vulnerability_Assessment"
        ],
        [
          "AUD-2023-002",
          "Internal_Access_Control_Review"
        ],
        [
          "AUD-2023-003",
          "Disaster_Recovery_Tabletop_Exercise"
        ],
        [
          "AUD-2023-004",
          "Supply_Chain_Risk_Audit"
        ],
        [
          "AUD-2023-005",
          "Annual_GDPR_Compliance_Audit"
        ]
      ]
    },
    {
      "name": "t_iso27001_annexa_subclass",
      "rows": [
        [
          "DIR-SEC-001",
          "Password_Complexity_Policy_v2",
          "REQ-A.9.4.2"
        ],
        [
          "DIR-SEC-002",
          "Clear_Desk_Policy",
          "REQ-A.7.2.1"
        ],
        [
          "DIR-SEC-003",
          "Malware_Definition_Update_Proc",
          "REQ-A.12.2.1"
        ],
        [
          "DIR-SEC-004",
          "Data_Backup_Rotation_Schedule",
          "REQ-A.12.3.1"
        ],
        [
          "DIR-SEC-005",
          "Wireless_Access_Standard",
          "REQ-A.10.1.1"
        ]
      ]
    },
    {
      "name": "t_requirement_equiv_specifies_target",
      "rows": [
        [
          "REQ-A.9.4.2",
          "Secure_Logon_Requirement",
          "DIR-SEC-001",
          "Active_Directory_Primary"
        ],
        [
          "REQ-A.7.2.1",
          "Screen_Locking_Requirement",
          "DIR-SEC-002",
          "Corporate_Workstation_Fleet"
        ],
        [
          "REQ-A.12.2.1",
          "Malware_Protection_Requirement",
          "DIR-SEC-003",
          "Endpoint_Security_Array"
        ],
        [
          "REQ-A.12.3.1",
          "Backup_Availability_Requirement",
          "DIR-SEC-004",
          "Customer_Relationship_DB"
        ],
        [
          "REQ-A.10.1.1",
          "Wireless_Segregation_Req",
          "DIR-SEC-005",
          "Guest_WiFi_Network"
        ]
      ]
    },
    {
      "name": "t_attestation_with_supporting_evidence",
      "rows": [
        [
          "ATT-EV-101",
          "Q3_Password_Policy_Compliance",
          "DIR-SEC-001"
        ],
        [
          "ATT-EV-102",
          "Physical_Security_Audit_Logs",
          "DIR-SEC-002"
        ],
        [
          "ATT-EV-103",
          "AV_Definition_Timestamps",
          "DIR-SEC-003"
        ],
        [
          "ATT-EV-104",
          "Backup_Restoration_Test_Log",
          "DIR-SEC-004"
        ],
        [
          "ATT-EV-105",
          "WIDS_Intrusion_Log_Set",
          "DIR-SEC-005"
        ]
      ]
    },
    {
      "name": "t_attestation_at_period",
      "rows": [
        [
          "ATT-PD-201",
          "Q3_Password_Policy_Compliance",
          "DIR-SEC-001"
        ],
        [
          "ATT-PD-202",
          "Physical_Security_Audit_Logs",
          "DIR-SEC-002"
        ],
        [
          "ATT-PD-203",
          "AV_Definition_Timestamps",
          "DIR-SEC-003"
        ],
        [
          "ATT-PD-204",
          "Backup_Restoration_Test_Log",
          "DIR-SEC-004"
        ],
        [
          "ATT-PD-205",
          "WIDS_Intrusion_Log_Set",
          "DIR-SEC-005"
        ]
      ]
    }
  ]
}
```