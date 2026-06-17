---
chapter_id: fb77ffe9e0cd9caf
topic_id: 85
family: 03_directive_governance
cited_terms: ['gdpr_article_subclass', 'control_only_addresses_threat_class', 'control_addresses_risk', 'control_subclass', 'requirement_has_priority']
model: cerebras/zai-glm-4.7
---

# Chapter 4: Relational Mapping of GDPR Directives to Control Ontologies

## 4.1 Scope and Framework Overview

This chapter delineates the structural mapping between General Data Protection Regulation (GDPR) articles and the technical controls required for compliance, utilizing a formal ontology to classify directives based on their risk mitigation properties. The analysis establishes a deterministic relationship between legal mandates, specific threat vectors, and the priority of implementation within a governance framework. By defining these axioms, organizations can ensure that their information security architecture is not only compliant with statutory requirements but also structurally aligned with the specific risks those regulations intend to address. The following sections detail the relational schema that underpins this mapping, providing evidence-based classifications for key regulatory concepts.

## 4.2 GDPR Article Subclassifications

The foundational axiom of this framework is the `gdpr_article_subclass`, which establishes the hierarchical relationship between specific regulatory classes and the broader corpus of GDPR directives. In this context, the variable $X$ represents a specific class of compliance requirement (e.g., "Security of Processing"), while $Y$ represents the specific GDPR article that governs it (e.g., "Article 32"). This axiom asserts that for a class to be valid within the ontology, it must be a subclass of the `cco:DirectiveICE` and must necessarily entail a specific GDPR article. The relational projection of this axiom creates a circular dependency with threat classifications, reinforcing the tight coupling between legal text and risk definition.

The table below embodies the `gdpr_article_subclass` axiom. The primary key is the `id` column, which uniquely identifies the regulatory node. The `y` column acts as a foreign key, referencing the threat classification table (`t_control_only_addresses_threat_class`), thereby ensuring that every GDPR article is linked to a specific, defined risk context.

| id | x | y |
| :--- | :--- | :--- |
| art32_node | SecurityOfProcessing | integrity_threat_node |
| art25_node | DataProtectionByDesign | privacy_threat_node |
| art33_node | BreachNotification | availability_threat_node |
| art35_node | DataProtectionImpactAssessment | systemic_risk_node |

This classification allows governance bodies to query specific regulatory obligations and immediately retrieve the associated risk context. For instance, the `SecurityOfProcessing` class ($X$) is inextricably linked to the `integrity_threat_node` ($Y$), meaning that compliance with Article 32 is structurally viewed as a mechanism to address integrity threats. This formalization prevents abstract interpretations of legal text by anchoring them to distinct threat categories defined in the broader ontology.

## 4.3 Control Constraints and Threat Addressal

Building upon the article definitions, the `control_only_addresses_threat_class` axiom introduces a constraint of exclusivity. This axiom posits that a control class $X$ (e.g., an "Integrity Control Directive") addresses risk *only* if it pertains to a specific threat class $Y$. The use of the "only" quantifier in the Manchester syntax (`sdg:addressesRisk only {Y:Class}`) implies a necessary condition: the control is valid exclusively in the context of that specific risk. This is distinct from general risk addressing; it defines the boundary conditions for the control's applicability within the compliance framework.

The following table represents the `control_only_addresses_threat_class` axiom. The `id` serves as the primary key for the threat class, while the `y` column is a foreign key referencing the `t_gdpr_article_subclass` table. This structure enforces the reciprocal relationship defined in the ontology: a threat class is valid only if it maps back to a specific GDPR article.

| id | x | y |
| :--- | :--- | :--- |
| integrity_threat_node | IntegrityControlDirective | art32_node |
| privacy_threat_node | PrivacyControlDirective | art25_node |
| availability_threat_node | AvailabilityControlDirective | art33_node |
| systemic_risk_node | SystemicRiskDirective | art35_node |

In practice, this means that an `IntegrityControlDirective` is defined strictly by its relationship to the `art32_node` (Article 32). Any attempt to apply this directive outside the context of Article 32 compliance would violate the ontology constraints. This ensures that control implementations are not repurposed arbitrarily across different regulatory domains without proper reclassification, maintaining the rigor of the audit trail.

## 4.4 General Risk Addressing Mechanisms

While the previous section defined the constraints of specific control directives, the `control_addresses_risk` axiom broadens the scope to include general technical controls that address specific risks. The axiom states that a class $X$ (e.g., "Encryption Control") is a subclass of `cco:DirectiveICE` that addresses *some* instance of risk $Y$. The "some" quantifier (`sdg:addressesRisk some {Y:Class}`) indicates an existential relationship: the control is known to mitigate at least one risk associated with the GDPR article, but it is not necessarily limited to that context alone.

The table below illustrates the `control_addresses_risk` axiom. The primary key is `id`, identifying the specific control measure. The `y` column is a foreign key referencing the `t_gdpr_article_subclass` table, linking the technical control back to the governing regulatory article.

| id | x | y |
| :--- | :--- | :--- |
| addr_risk_1 | EncryptionControl | art32_node |
| addr_risk_2 | AccessControl | art32_node |
| addr_risk_3 | Anonymization | art25_node |
| addr_risk_4 | IncidentResponsePlan | art33_node |

For example, the `EncryptionControl` class ($X$) addresses the risk defined in `art32_node` ($Y$). Unlike the "only" constraint in the previous section, this classification allows `EncryptionControl` to be part of a broader suite of tools that may address multiple aspects of security, provided it is demonstrably linked to the risk profile of Article 32. This distinction is critical for audit reporting, as it separates mandatory, exclusive directives from flexible, technical implementations.

## 4.5 Control Subclassifications and Mitigation

The `control_subclass` axiom refines the granularity of the framework by focusing on the active mitigation of threats. It asserts that a class $X$ (e.g., "Pseudonymization") is a subclass of `cco:DirectiveICE` that mitigates *some* class $Y$. This verbalization shifts the focus from "addressing" a risk (which may imply monitoring or management) to "mitigating" it, implying a reduction in impact or likelihood. This axiom is essential for mapping technical safeguards to the specific outcomes required by the GDPR.

The table for `control_subclass` uses `id` as the primary key. The `y` column is a foreign key referencing the `t_gdpr_article_subclass` table, ensuring that every mitigation strategy is traceable to a specific legal requirement.

| id | x | y |
| :--- | :--- | :--- |
| mit_ctrl_1 | Pseudonymization | art25_node |
| mit_ctrl_2 | DataMasking | art32_node |
| mit_ctrl_3 | RedundancyMechanisms | art33_node |
| mit_ctrl_4 | ConsultationProcedures | art35_node |

Consider the `Pseudonymization` class ($X$). According to the table, it mitigates the risk associated with `art25_node` (Data Protection by Design). This mapping provides auditors with clear evidence that the organization has implemented specific technical measures (`Pseudonymization`) to achieve the mitigation goals set forth in the regulation. It bridges the gap between abstract legal requirements and concrete engineering activities.

## 4.6 Requirement Prioritization Framework

The final axiom, `requirement_has_priority`, introduces a critical governance layer: the prioritization of compliance requirements. This axiom states that a class $X$ (e.g., a "High Priority Requirement") has a priority $Y$. In the context of the ontology, this allows the organization to stratify controls and directives based on urgency, resource allocation, and risk severity. By linking priority classes back to GDPR articles via the schema, the framework ensures that high-priority legal mandates are distinguished from procedural or lower-priority obligations.

The table below defines the `requirement_has_priority` structure. The `id` column is the primary key, and the `y` column acts as a foreign key referencing the `t_gdpr_article_subclass` table. This ensures that priority assignments are always anchored to specific regulatory articles.

| id | x | y |
| :--- | :--- | :--- |
| prio_req_1 | HighPrioritySecurity | art32_node |
| prio_req_2 | MediumPriorityDesign | art25_node |
| prio_req_3 | HighPriorityNotification | art33_node |
| prio_req_4 | LowPriorityDocumentation | art30_node |

For instance, `HighPrioritySecurity` ($X$) is assigned to `art32_node` ($Y$), reflecting the critical nature of security of processing in most compliance environments. Conversely, `MediumPriorityDesign` is assigned to `art25_node`. This structured approach to prioritization assists compliance officers in rationalizing budget decisions and audit schedules, providing a data-driven basis for ranking the implementation of various GDPR controls.

```json
{
  "tables": [
    {
      "name": "t_gdpr_article_subclass",
      "rows": [
        [
          "art32_node",
          "SecurityOfProcessing",
          "integrity_threat_node"
        ],
        [
          "art25_node",
          "DataProtectionByDesign",
          "privacy_threat_node"
        ],
        [
          "art33_node",
          "BreachNotification",
          "availability_threat_node"
        ],
        [
          "art35_node",
          "DataProtectionImpactAssessment",
          "systemic_risk_node"
        ]
      ]
    },
    {
      "name": "t_control_only_addresses_threat_class",
      "rows": [
        [
          "integrity_threat_node",
          "IntegrityControlDirective",
          "art32_node"
        ],
        [
          "privacy_threat_node",
          "PrivacyControlDirective",
          "art25_node"
        ],
        [
          "availability_threat_node",
          "AvailabilityControlDirective",
          "art33_node"
        ],
        [
          "systemic_risk_node",
          "SystemicRiskDirective",
          "art35_node"
        ]
      ]
    },
    {
      "name": "t_control_addresses_risk",
      "rows": [
        [
          "addr_risk_1",
          "EncryptionControl",
          "art32_node"
        ],
        [
          "addr_risk_2",
          "AccessControl",
          "art32_node"
        ],
        [
          "addr_risk_3",
          "Anonymization",
          "art25_node"
        ],
        [
          "addr_risk_4",
          "IncidentResponsePlan",
          "art33_node"
        ]
      ]
    },
    {
      "name": "t_control_subclass",
      "rows": [
        [
          "mit_ctrl_1",
          "Pseudonymization",
          "art25_node"
        ],
        [
          "mit_ctrl_2",
          "DataMasking",
          "art32_node"
        ],
        [
          "mit_ctrl_3",
          "RedundancyMechanisms",
          "art33_node"
        ],
        [
          "mit_ctrl_4",
          "ConsultationProcedures",
          "art35_node"
        ]
      ]
    },
    {
      "name": "t_requirement_has_priority",
      "rows": [
        [
          "prio_req_1",
          "HighPrioritySecurity",
          "art32_node"
        ],
        [
          "prio_req_2",
          "MediumPriorityDesign",
          "art25_node"
        ],
        [
          "prio_req_3",
          "HighPriorityNotification",
          "art33_node"
        ],
        [
          "prio_req_4",
          "LowPriorityDocumentation",
          "art30_node"
        ]
      ]
    }
  ]
}
```