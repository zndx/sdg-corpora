---
chapter_id: 0e0afcbd2c405bd2
topic_id: 21
family: 03_directive_governance
cited_terms: ['control_only_addresses_threat_class', 'control_addresses_risk', 'requirement_has_priority', 'requirement_equiv_specifies_target']
model: cerebras/zai-glm-4.7
---

# Chapter 4: Formal Specification of Governance Directives and Risk Controls

## 4.1 Scope and Preamble

This chapter delineates the formal ontological structures required to define, categorize, and implement governance directives within an enterprise information security framework. The transition from informal policy documentation to machine-readable governance axioms is necessary to establish precise audit trails and automate compliance verification. We examine the logical constraints governing control classes, their relationship to risk taxonomies, and the prioritization schemas that drive resource allocation. The following sections provide a rigorous analysis of four primary axioms that define the semantic relationships between directives, risks, priorities, and targets, supported by relational data mappings that ensure referential integrity across the governance knowledge base.

## 4.2 Universal Restrictions in Control Definitions

### 4.2.1 The Logic of Exclusivity

In the design of a control framework, it is frequently necessary to define the boundaries of a control’s applicability with absolute precision. The axiom `control_only_addresses_threat_class` establishes a universal restriction, denoted in Manchester Syntax as `SubClassOf: cco:DirectiveICE, sdg:addressesRisk only {Y:Class}`. This logical construct asserts that for any instance of class `X` (a specific type of Directive or Control), the set of risks it addresses must be entirely contained within class `Y`.

The verbalization of this axiom—"X is something that addresses risk Y"—belies a stricter logical reality: the `only` constructor implies that if an instance of `X` addresses a risk `R`, then `R` must necessarily be an instance of `Y`. This prevents scope creep and ensures that a control designed for a specific category of threats is not erroneously applied to risks outside its domain of validation. For example, a cryptographic control class might be axiomatically restricted to address only "DataConfidentialityRisk," thereby logically precluding its application to "AvailabilityRisk," regardless of implementation details.

### 4.2.2 Relational Mapping and Instances

To implement this axiom within a relational database schema, we utilize the table structure defined below. The primary key is the `id`, serving as the unique identifier for the axiom assertion. The columns `x` and `y` function as foreign keys referencing the control class and the risk class, respectively.

The following table presents specific instances of this axiom, illustrating how distinct control classes are bound to specific threat categories. This data is essential for generating automated audit queries that verify whether a control’s deployment violates its defined threat scope.

| ID | Control Class (X) | Risk Class (Y) |
| :--- | :--- | :--- |
| ax-101 | PhysicalAccessControl | PhysicalThreat |
| ax-102 | EncryptionAtRestControl | DataDisclosureRisk |
| ax-103 | NetworkSegmentationControl | LateralMovementRisk |
| ax-104 | ApplicationWhitelistingControl | MalwareExecutionRisk |
| ax-105 | ChangeManagementControl | IntegrityRisk |

**Table 4.1:** Mapping of Control Classes to Exclusive Risk Classes (`t_control_only_addresses_threat_class`).

In the context of a governance audit, Table 4.1 allows an auditor to validate that the `EncryptionAtRestControl` class is never formally linked to a risk instance falling outside the `DataDisclosureRisk` taxonomy. This ensures that the control's validation evidence remains relevant and admissible for the specific risk context it was designed to mitigate.

## 4.3 Existential Restrictions in Control Implementation

### 4.3.1 The Logic of Minimum Coverage

While universal restrictions define the upper bounds of a control's applicability, existential restrictions define the lower bounds. The axiom `control_addresses_risk` utilizes the `some` constructor (`SubClassOf: cco:DirectiveICE, sdg:addressesRisk some {Y:Class}`). This asserts that for any instance of class `X` to exist, it must address at least one instance of risk class `Y`.

This distinction is critical for governance frameworks. Unlike the `only` restriction, which limits scope, the `some` restriction mandates existence. A control class defined by this axiom cannot be instantiated in a vacuum; it is semantically meaningless unless it is associated with a concrete risk from the specified class. This axiom is typically employed to ensure that control implementations are always risk-justified. If a governance object is defined as a `UserAccessControl`, it must axiomatically address some `AccessViolationRisk`.

### 4.3.2 Relational Mapping and Instances

The relational schema for existential restrictions mirrors the structure of universal restrictions but enforces a `NOT NULL` constraint on the risk class `y`, reflecting the necessity of the relationship. The table `t_control_addresses_risk` captures these mandatory linkages.

Table 4.2 provides a dataset of control classes that must address specific risk categories. Note that while `x` represents the control class, the presence of a row indicates that the existence of such a control is logically dependent on its interaction with the risk class `y`.

| ID | Control Class (X) | Risk Class (Y) |
| :--- | :--- | :--- |
| ax-201 | IdentityManagementControl | CredentialTheftRisk |
| ax-202 | IntrusionDetectionSystem | UnauthorizedAccessRisk |
| ax-203 | DataLossPreventionControl | DataExfiltrationRisk |
| ax-204 | SecurityAwarenessTraining | SocialEngineeringRisk |
| ax-205 | VulnerabilityScanner | SoftwareVulnerabilityRisk |

**Table 4.2:** Existential Mapping of Control Classes to Risk Classes (`t_control_addresses_risk`).

When populating compliance matrices, the data in Table 4.2 serves as a validation rule. If an organization claims to have implemented an `IntrusionDetectionSystem` (ax-202), the governance framework must automatically verify that this system is configured to detect `UnauthorizedAccessRisk`. Failure to map the control to this specific risk class would result in an ontological inconsistency, rendering the control implementation non-compliant with the formal definition of the class.

## 4.4 Prioritization of Governance Requirements

### 4.4.1 Defining Priority Hierarchies

In resource-constrained environments, not all governance directives can be executed with equal vigor. The axiom `requirement_has_priority` introduces the concept of graded importance into the ontology. Expressed as `SubClassOf: cco:DirectiveICE, sdg:hasPriority some {Y:Class}`, this axiom links a directive class `X` to a priority class `Y`.

This semantic linkage allows for the automated sorting of governance tasks based on their classification. For instance, requirements linked to a `RegulatoryMandatoryPriority` class would supersede those linked to an `InternalDiscretionaryPriority` class in scheduling algorithms. The axiom ensures that priority is not merely an attribute of a specific instance but a defining characteristic of the requirement class itself. By embedding priority into the class definition, the ontology enforces that all instances of `CriticalPatchRequirement` inherently carry the urgency of their parent class definition.

### 4.4.2 Relational Mapping and Instances

The table `t_requirement_has_priority` formalizes these relationships. The `y` column represents the priority class, which acts as a determinant for execution order and audit frequency.

The data presented in Table 4.3 illustrates a hierarchy of requirements typical in a financial services governance framework. The mapping of `CriticalPatchRequirement` to `HighPriority` (ax-301) dictates that any derived tasks from this class inherit this urgency.

| ID | Requirement Class (X) | Priority Class (Y) |
| :--- | :--- | :--- |
| ax-301 | CriticalPatchRequirement | HighPriority |
| ax-302 | LogRetentionPolicy | MediumPriority |
| ax-303 | OptionalSecurityTraining | LowPriority |
| ax-304 | IncidentResponsePlanTest | HighPriority |
| ax-305 | VendorRiskAssessment | MediumPriority |

**Table 4.3:** Priority Assignments for Requirement Classes (`t_requirement_has_priority`).

From an operational standpoint, Table 4.3 feeds directly into governance, risk, and compliance (GRC) platforms. When generating a remediation plan, the system queries this table to assign weight to the tasks. A `VendorRiskAssessment` (ax-305), marked as `MediumPriority`, would be deprioritized against an `IncidentResponsePlanTest` (ax-304) during a resource crunch, ensuring that the most critical governance obligations are met first.

## 4.5 Equivalence and Target Specification

### 4.5.1 Complex Class Definitions

The most granular level of definition is provided by the axiom `requirement_equiv_specifies_target`. This axiom utilizes an `EquivalentTo` construct, which defines a class `X` not just by its properties, but by the exact intersection of those properties. The axiom is defined as: `EquivalentTo: cco:DirectiveICE and (sdg:specifies some {Y:Class}) and (sdg:appliesTo some {Z:Class})`.

This axiom asserts that a class `X` is exactly equivalent to a Directive that specifies a rule or mechanism `Y` and applies to a target `Z`. This is a powerful tool for decomposing complex requirements into their constituent parts. It allows the ontology to distinguish between a requirement that applies to "Databases" and one that applies to "Applications," even if they specify the same control mechanism (e.g., "Encryption"). The equivalence ensures that any instance of `X` must possess both a specification `Y` and a target `Z`, and conversely, any Directive possessing `Y` and `Z` is recognized as an instance of `X`.

### 4.5.2 Relational Mapping and Instances

The relational schema `t_requirement_equiv_specifies_target` captures this tripartite relationship. The primary key `id` anchors the definition, while `x` is the defined class, `y` is the specification, and `z` is the target.

Table 4.4 demonstrates how complex governance requirements are decomposed. For example, the `DatabaseEncryptionRequirement` (ax-401) is defined by the specification of `AES256Standard` (y) applied to a `ProductionDatabaseAsset` (z). This level of detail prevents ambiguity; it is clear that the requirement applies specifically to production assets and not to development environments, and specifically to the AES-256 standard rather than a weaker algorithm.

| ID | Requirement Class (X) | Specification (Y) | Target (Z) |
| :--- | :--- | :--- | :--- |
| ax-401 | DatabaseEncryptionRequirement | AES256Standard | ProductionDatabaseAsset |
| ax-402 | RemoteAccessPolicy | MultiFactorAuthentication | RemoteWorkforce |
| ax-403 | PaymentCardHandlingDirective | PCI_DSS_Control | CardholderDataEnvironment |
| ax-404 | CloudStorageRule | AtRestEncryption | CloudObjectStorage |
| ax-405 | AdminSessionLogging | KernelLevelAudit | PrivilegedAccount |

**Table 4.4:** Equivalence Definitions for Requirements, Specifications, and Targets (`t_requirement_equiv_specifies_target`).

The utility of Table 4.4 is found in automated compliance scanning. A scanner evaluating a `CloudObjectStorage` instance (z) would look for the presence of `AtRestEncryption` (y). If found, it can automatically certify the system as compliant with the `CloudStorageRule` (x). Conversely, if the target is a `LocalFileSystem`, the axiom does not apply, and the scanner correctly suppresses the `CloudStorageRule` finding, thereby reducing false positives in audit reports.

```json
{
  "tables": [
    {
      "name": "t_control_only_addresses_threat_class",
      "rows": [
        ["ax-101", "PhysicalAccessControl", "PhysicalThreat"],
        ["ax-102", "EncryptionAtRestControl", "DataDisclosureRisk"],
        ["ax-103", "NetworkSegmentationControl", "LateralMovementRisk"],
        ["ax-104", "ApplicationWhitelistingControl", "MalwareExecutionRisk"],
        ["ax-105", "ChangeManagementControl", "IntegrityRisk"]
      ]
    },
    {
      "name": "t_control_addresses_risk",
      "rows": [
        ["ax-201", "IdentityManagementControl", "CredentialTheftRisk"],
        ["ax-202", "IntrusionDetectionSystem", "UnauthorizedAccessRisk"],
        ["ax-203", "DataLossPreventionControl", "DataExfiltrationRisk"],
        ["ax-204", "SecurityAwarenessTraining", "SocialEngineeringRisk"],
        ["ax-205", "VulnerabilityScanner", "SoftwareVulnerabilityRisk"]
      ]
    },
    {
      "name": "t_requirement_has_priority",
      "rows": [
        ["ax-301", "CriticalPatchRequirement", "HighPriority"],
        ["ax-302", "LogRetentionPolicy", "MediumPriority"],
        ["ax-303", "OptionalSecurityTraining", "LowPriority"],
        ["ax-304", "IncidentResponsePlanTest", "HighPriority"],
        ["ax-305", "VendorRiskAssessment", "MediumPriority"]
      ]
    },
    {
      "name": "t_requirement_equiv_specifies_target",
      "rows": [
        ["ax-401", "DatabaseEncryptionRequirement", "AES256Standard", "ProductionDatabaseAsset"],
        ["ax-402", "RemoteAccessPolicy", "MultiFactorAuthentication", "RemoteWorkforce"],
        ["ax-403", "PaymentCardHandlingDirective", "PCI_DSS_Control", "CardholderDataEnvironment"],
        ["ax-404", "CloudStorageRule", "AtRestEncryption", "CloudObjectStorage"],
        ["ax-405", "AdminSessionLogging", "KernelLevelAudit", "PrivilegedAccount"]
      ]
    }
  ]
}
```