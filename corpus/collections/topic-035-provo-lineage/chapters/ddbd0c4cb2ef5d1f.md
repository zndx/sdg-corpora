---
chapter_id: ddbd0c4cb2ef5d1f
topic_id: 35
family: 07_long_tail
cited_terms: ['hipaa_safeguard_physical', 'control_only_addresses_threat_class', 'hipaa_safeguard_technical', 'hipaa_safeguard_admin', 'pci_dss_requirement']
model: cerebras/zai-glm-4.7
---

# Chapter 7: Formal Ontology of Compliance Safeguards and Control Directives

This chapter delineates the structural alignment between the HIPAA Security Rule’s implementation specifications and the PCI DSS control framework within a unified governance ontology. It establishes the formal relationships between physical, technical, and administrative controls and the specific threat classes they address, providing a rigorous examination of the `DirectiveICE` class hierarchy. The text demonstrates how distinct compliance mandates map to shared control mechanisms through a deterministic relational projection, ensuring auditability and semantic consistency across regulatory domains.

## 1. HIPAA Physical Safeguards

The implementation of physical safeguards is a foundational requirement within the Security Rule, designed to protect electronic protected health information (ePHI) from unauthorized intrusion and environmental hazards. In the context of the ontology, the axiom `hipaa_safeguard_physical` defines a specific subclass of `DirectiveICE` wherein the safeguarding entity (X) acts as a physical mitigation for a target class (Y). This relationship is not merely associative but constitutive; the physical safeguard is the material realization of a governance directive intended to secure a specific asset or control environment.

Consider the governance of a data center environment. The directive to restrict access to the server room is not fully realized by a policy statement alone; it requires the instantiation of physical controls such as biometric scanners, reinforced walls, and surveillance systems. In this axiomatic view, the physical safeguard (e.g., a `BiometricEntrySystem`) is the subject X that safeguards the object Y, which in this relational model is identified as a `Control` class. This structure enforces the principle that physical security measures are deployed to uphold the integrity of specific control directives.

The following table embodies the axiom `hipaa_safeguard_physical`, illustrating the relationship between specific physical safeguard classes and the control directives they protect. The primary key is the unique identifier for the safeguard instance, while the foreign key (`y`) establishes a dependency on the `t_control_only_addresses_threat_class` table, linking the physical mechanism to the governance control it enforces.

| id | x | y |
| :--- | :--- | :--- |
| PHYS_BIO_01 | BiometricEntrySystem | CTRL_ACCESS_01 |
| PHYS_CAM_01 | VideoSurveillanceSystem | CTRL_ACCESS_01 |
| PHYS_LOCK_01 | ServerRoomLockMechanism | CTRL_WORKSTATION_01 |
| PHYS_ENV_01 | ClimateControlUnit | CTRL_MEDIA_01 |
| PHYS_UTIL_01 | PowerBackupGenerator | CTRL_AVAIL_01 |

## 2. Control and Threat Addressing

The core of the governance framework lies in the precise definition of controls and their relationship to risk. The axiom `control_only_addresses_threat_class` posits that a Control (X), being a subclass of `DirectiveICE`, addresses a Risk (Y) *only* if that risk falls within a specific class. The use of the "only" restriction in the Manchester syntax (`sdg:addressesRisk only {Y:Class}`) implies a closed-world assumption regarding the control's scope: if a control is designed to address `UnauthorizedAccessThreat`, it cannot semantically be said to address `DataLossThreat` unless it is explicitly reclassified or subclassed.

In relational terms, this creates a tight coupling between the control definition and the threat landscape. The schema dictates that the threat class (Y) referenced by a control must correspond to an entry in the physical safeguards table. This circular dependency—where a control addresses a threat defined by a physical safeguard, and that physical safeguard safeguards the control—models a recursive security posture. For instance, an `AccessControlPolicy` addresses the risk of `UnauthorizedEntry`, but the validity of that policy is contingent upon the `PhysicalLock` safeguarding the policy's enforcement point.

The table below embodies the axiom `control_only_addresses_threat_class`. It maps specific control directives to the threat classes they mitigate. The primary key (`id`) identifies the control, while the foreign key (`y`) references the `t_hipaa_safeguard_physical` table, asserting that the risk addressed is materially defined by the physical safeguard context.

| id | x | y |
| :--- | :--- | :--- |
| CTRL_ACCESS_01 | FacilityAccessPolicy | PHYS_BIO_01 |
| CTRL_WORKSTATION_01 | WorkstationUseProtocol | PHYS_LOCK_01 |
| CTRL_MEDIA_01 | MediaDisposalProcedure | PHYS_ENV_01 |
| CTRL_AVAIL_01 | ContingencyPlanProtocol | PHYS_UTIL_01 |
| CTRL_MAINT_01 | HardwareMaintenanceLog | PHYS_LOCK_01 |

## 3. HIPAA Technical Safeguards

While physical safeguards address the tangible environment, technical safeguards encompass the automated mechanisms and logical access controls applied to digital systems. The axiom `hipaa_safeguard_technical` defines a class of `DirectiveICE` where the subject (X) is a technical mechanism that safeguards a control directive (Y). This distinction is critical for audit purposes, as it separates the logical implementation (e.g., encryption algorithms, authentication protocols) from the physical infrastructure in which they operate.

In a compliant architecture, technical safeguards such as `UniqueUserIdentification` or `TransmissionEncryption` do not exist in a vacuum; they are instantiated to satisfy specific control requirements derived from the risk assessment. For example, the directive to implement `AuditControlMechanisms` is safeguarded by the technical implementation of `SystemLogAggregation`. The ontology captures this by linking the technical safeguard class back to the central control table, ensuring that every line of code or configuration setting serves a defined governance objective.

The following table embodies the axiom `hipaa_safeguard_technical`. It lists technical safeguard classes and the corresponding control directives they safeguard. The primary key is the technical safeguard ID, and the foreign key (`y`) references the `t_control_only_addresses_threat_class` table, ensuring the technical measure is traceable to a specific governance control.

| id | x | y |
| :--- | :--- | :--- |
| TECH_AUTH_01 | UniqueUserIdentification | CTRL_ACCESS_01 |
| TECH_ENC_01 | EndToEndEncryptionProtocol | CTRL_MEDIA_01 |
| TECH_AUDIT_01 | AuditControlMechanism | CTRL_WORKSTATION_01 |
| TECH_INT_01 | IntegrityControlMechanism | CTRL_ACCESS_01 |
| TECH_TRANS_01 | TransmissionSecurityProtocol | CTRL_MEDIA_01 |

## 4. HIPAA Administrative Safeguards

Administrative safeguards represent the administrative actions, policies, and procedures to manage the selection, development, implementation, and maintenance of security measures. The axiom `hipaa_safeguard_admin` characterizes these as `DirectiveICE` classes (X) that safeguard the operational control environment (Y). These are often the most complex to implement because they involve human factors, training, and high-level management oversight.

Examples of administrative safeguards include `SecurityAwarenessTraining`, `RiskAnalysisProcess`, and `SanctionPolicy`. In the ontological structure, these administrative entities safeguard the integrity of the control framework itself. For instance, a `SecurityManagementProcess` safeguards the `ContingencyPlanProtocol` by ensuring it is regularly reviewed and updated. This relationship highlights that administrative safeguards provide the governance layer necessary to sustain the technical and physical controls over time.

The table below embodies the axiom `hipaa_safeguard_admin`. It maps administrative safeguard classes to the controls they protect. The primary key identifies the administrative procedure, and the foreign key (`y`) links to the `t_control_only_addresses_threat_class` table, demonstrating the dependency of operational controls on administrative oversight.

| id | x | y |
| :--- | :--- | :--- |
| ADM_TRAIN_01 | SecurityAwarenessTraining | CTRL_WORKSTATION_01 |
| ADM_RISK_01 | RiskAnalysisProcess | CTRL_ACCESS_01 |
| ADM_SANCTION_01 | WorkforceSanctionPolicy | CTRL_ACCESS_01 |
| ADM_CONTINGENCY_01 | ContingencyPlanningProcess | CTRL_AVAIL_01 |
| ADM_EVAL_01 | SecurityEvaluationProcess | CTRL_MAINT_01 |

## 5. PCI DSS Requirements Mapping

The Payment Card Industry Data Security Standard (PCI DSS) provides a distinct but overlapping set of requirements for entities handling cardholder data. The axiom `pci_dss_requirement` integrates these external mandates into the core ontology by defining a class of `DirectiveICE` (X) that constitutes a PCI DSS requirement for a specific control class (Y). This mapping allows organizations to harmonize their compliance efforts, demonstrating how a single control framework can satisfy multiple regulatory regimes.

For example, PCI DSS Requirement 7 (Restrict access to cardholder data by business need to know) maps directly to the `FacilityAccessPolicy` control defined in the HIPAA ontology. By treating the PCI requirement as a subclass of `DirectiveICE` that references the existing control table, the model avoids redundancy and highlights the convergence of compliance standards. This approach facilitates unified audits and reduces the administrative burden of maintaining separate control sets for different regulations.

The table below embodies the axiom `pci_dss_requirement`. It associates specific PCI DSS requirement classes with the internal control directives they govern. The primary key is the requirement ID, and the foreign key (`y`) references the `t_control_only_addresses_threat_class` table, anchoring the external requirement to the internal control structure.

| id | x | y |
| :--- | :--- | :--- |
| PCI_REQ_07 | RestrictAccessToBusinessNeed | CTRL_ACCESS_01 |
| PCI_REQ_08 | IdentifyAndAuthenticateAccess | CTRL_WORKSTATION_01 |
| PCI_REQ_09 | RestrictPhysicalAccess | CTRL_ACCESS_01 |
| PCI_REQ_10 | TrackAndMonitorAllAccess | CTRL_WORKSTATION_01 |
| PCI_REQ_12 | MaintainInformationSecurityPolicy | CTRL_MEDIA_01 |

```json
{
  "tables": [
    {
      "name": "t_hipaa_safeguard_physical",
      "rows": [
        [
          "PHYS_BIO_01",
          "BiometricEntrySystem",
          "CTRL_ACCESS_01"
        ],
        [
          "PHYS_CAM_01",
          "VideoSurveillanceSystem",
          "CTRL_ACCESS_01"
        ],
        [
          "PHYS_LOCK_01",
          "ServerRoomLockMechanism",
          "CTRL_WORKSTATION_01"
        ],
        [
          "PHYS_ENV_01",
          "ClimateControlUnit",
          "CTRL_MEDIA_01"
        ],
        [
          "PHYS_UTIL_01",
          "PowerBackupGenerator",
          "CTRL_AVAIL_01"
        ]
      ]
    },
    {
      "name": "t_control_only_addresses_threat_class",
      "rows": [
        [
          "CTRL_ACCESS_01",
          "FacilityAccessPolicy",
          "PHYS_BIO_01"
        ],
        [
          "CTRL_WORKSTATION_01",
          "WorkstationUseProtocol",
          "PHYS_LOCK_01"
        ],
        [
          "CTRL_MEDIA_01",
          "MediaDisposalProcedure",
          "PHYS_ENV_01"
        ],
        [
          "CTRL_AVAIL_01",
          "ContingencyPlanProtocol",
          "PHYS_UTIL_01"
        ],
        [
          "CTRL_MAINT_01",
          "HardwareMaintenanceLog",
          "PHYS_LOCK_01"
        ]
      ]
    },
    {
      "name": "t_hipaa_safeguard_technical",
      "rows": [
        [
          "TECH_AUTH_01",
          "UniqueUserIdentification",
          "CTRL_ACCESS_01"
        ],
        [
          "TECH_ENC_01",
          "EndToEndEncryptionProtocol",
          "CTRL_MEDIA_01"
        ],
        [
          "TECH_AUDIT_01",
          "AuditControlMechanism",
          "CTRL_WORKSTATION_01"
        ],
        [
          "TECH_INT_01",
          "IntegrityControlMechanism",
          "CTRL_ACCESS_01"
        ],
        [
          "TECH_TRANS_01",
          "TransmissionSecurityProtocol",
          "CTRL_MEDIA_01"
        ]
      ]
    },
    {
      "name": "t_hipaa_safeguard_admin",
      "rows": [
        [
          "ADM_TRAIN_01",
          "SecurityAwarenessTraining",
          "CTRL_WORKSTATION_01"
        ],
        [
          "ADM_RISK_01",
          "RiskAnalysisProcess",
          "CTRL_ACCESS_01"
        ],
        [
          "ADM_SANCTION_01",
          "WorkforceSanctionPolicy",
          "CTRL_ACCESS_01"
        ],
        [
          "ADM_CONTINGENCY_01",
          "ContingencyPlanningProcess",
          "CTRL_AVAIL_01"
        ],
        [
          "ADM_EVAL_01",
          "SecurityEvaluationProcess",
          "CTRL_MAINT_01"
        ]
      ]
    },
    {
      "name": "t_pci_dss_requirement",
      "rows": [
        [
          "PCI_REQ_07",
          "RestrictAccessToBusinessNeed",
          "CTRL_ACCESS_01"
        ],
        [
          "PCI_REQ_08",
          "IdentifyAndAuthenticateAccess",
          "CTRL_WORKSTATION_01"
        ],
        [
          "PCI_REQ_09",
          "RestrictPhysicalAccess",
          "CTRL_ACCESS_01"
        ],
        [
          "PCI_REQ_10",
          "TrackAndMonitorAllAccess",
          "CTRL_WORKSTATION_01"
        ],
        [
          "PCI_REQ_12",
          "MaintainInformationSecurityPolicy",
          "CTRL_MEDIA_01"
        ]
      ]
    }
  ]
}
```