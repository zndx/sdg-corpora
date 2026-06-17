---
chapter_id: 2ceee46d52d5d2ae
topic_id: 95
family: 03_directive_governance
cited_terms: ['audit_conducted_by', 'verification_min_one_evidence', 'requirement_equiv_specifies_target', 'attestation_min_one_signer', 'requirement_only_satisfied_by']
model: cerebras/zai-glm-4.7
---

# Chapter 7: Ontological Constraints in Governance Frameworks

This chapter delineates the structural and logical constraints governing the implementation of compliance frameworks within digital governance systems. The scope of this text is restricted to the formal definition of five core axioms that regulate the relationships between directives, processes, evidence, and human agents. These axioms, derived from the Basic Formal Ontology (BFO) and the Common Core Ontologies (CCO), provide the semantic backbone for audit trails, verification protocols, and requirement satisfaction. The following sections detail the necessary conditions for class validity, ensuring that governance artifacts are not merely data entries, but verifiable, agent-driven processes anchored in ontological rigor.

## 7.1 Audit Conductance and Agency

The governance of any regulated environment relies fundamentally on the concept of the audit. Within the ontological framework, an audit is not defined merely by its outcome but by the necessity of its execution by a specific agent. The axiom `audit_conducted_by` establishes that any entity classified as an Audit is a subclass of `bfo:0000015` (a Process) and must be realized through the relationship `sdg:conductedBy` with an instance of `cco:Person`.

This constraint ensures that automated system logs or passive data aggregations cannot be semantically classified as audits unless they are explicitly linked to a human agent. The `cco:Person` entity represents the legal and ethical anchor of the process. In practice, this means that the integrity of the audit is contingent upon the identity and accountability of the auditor. The process is dependent; it cannot exist in a vacuum. The agency provided by the `cco:Person` fulfills the "dependent continuant" role required to initiate and carry out the "occurrent" process defined by the audit.

To illustrate the implementation of this axiom, consider the classification of various audit types within a financial compliance system. The following table enumerates specific audit classes, demonstrating that each entry is explicitly defined as a process requiring human conductance.

**Table 7.1: Audit Classes and Conductance Constraints**

| id | x |
| :--- | :--- |
| audit_001 | FinancialComplianceAudit |
| audit_002 | SystemSecurityAudit |
| audit_003 | OperationalWorkflowAudit |
| audit_004 | DataPrivacyAudit |
| audit_005 | SupplyChainEthicsAudit |

In the schema above, the column `x` represents the specific subclass of the audit process. While the table explicitly lists the class name, the underlying axiom enforces that for every instance of `FinancialComplianceAudit` (or any other value in column `x`), there exists a functional dependency on a `cco:Person`. This structure prevents the anonymization of compliance checks. It ensures that the audit trail is not merely a sequence of timestamped events, but a traceable narrative of human oversight, satisfying the regulatory demand for individual accountability.

## 7.2 Verification and Evidence Production

Verification is the mechanism by which a system confirms that a state of affairs aligns with a specified directive. The axiom `verification_min_one_evidence` posits that any Verification process is a subclass of `bfo:0000015` (Process) and must produce at least one instance of Evidence via the `sdg:producesEvidence` property.

This axiom utilizes an existential quantification (`min 1`). It dictates that a verification process is ontologically invalid if it concludes without generating a persistent artifact. This artifact, the Evidence, serves as the "independent continuant" that persists after the verification process (the "occurrent") has terminated. In a regulatory context, this separates genuine verification from hollow assertions. A claim of verification without the corresponding production of evidence—such as a log file, a checksum, or a signed report—is semantically null.

The relationship between the verification process and the evidence is one of creation. The process acts as the causal mechanism for the evidence's existence. Therefore, the data model must enforce that no verification entry exists without a corresponding evidence pointer. This is critical for maintaining the probative value of governance records. For instance, a verification of software integrity must produce a hash value or a scan report; the verification is defined by this output.

**Table 7.2: Verification Processes and Resultant Evidence**

| id | x | y |
| :--- | :--- | :--- |
| ver_01 | CodeIntegrityVerification | SourceCodeHash |
| ver_02 | AccessRightsVerification | AccessLogEntry |
| ver_03 | NetworkConnectivityVerification | PingResponseArtifact |
| ver_04 | DataRetentionVerification | StorageSnapshot |
| ver_05 | IdentityVerification | BiometricMatchRecord |

In Table 7.2, column `x` denotes the specific verification process class, while column `y` denotes the class of the evidence produced. The axiom requires that for every row, the process `x` is causally linked to the production of `y`. The schema enforces `NOT NULL` on the evidence column, reflecting the `min 1` constraint. This structure ensures that the governance framework is evidence-anchored; every verification action leaves a material trace in the system, satisfying the requirements for auditability and non-repudiation.

## 7.3 Directive Specification and Targeting

The definition of a Requirement within this framework is more complex than a simple label; it is an equivalence class defined by its structure. The axiom `requirement_equiv_specifies_target` states that a Class `X` (Requirement) is equivalent to the intersection of `cco:DirectiveICE` (Information Carrier Entity), the property `sdg:specifies` some Class `Y`, and the property `sdg:appliesTo` some Class `Z`.

This equivalence axiom (`EquivalentTo`) creates a necessary and sufficient condition. If an entity is a Requirement, it *must* be a Directive that specifies a protocol and applies to a target. Conversely, any Directive that specifies a protocol and applies to a target is treated as a Requirement. This tripartite structure ensures that requirements are never floating abstractions but are always anchored to a specific content (`specifies`) and a specific scope (`appliesTo`).

The `cco:DirectiveICE` component indicates that the requirement is an information content entity—it is a prescriptive statement or document. The `specifies` property links this directive to the normative content (e.g., a standard, a rule, or a constraint), while `appliesTo` grounds the directive in reality by linking it to the entity (e.g., a system, a role, or a data type) that must obey it. This structure allows for precise querying of the governance model, enabling stakeholders to determine exactly what rules apply to which assets.

**Table 7.3: Requirement Directives and Their Targets**

| id | x | y | z |
| :--- | :--- | :--- | :--- |
| req_01 | EncryptionRequirement | AES256Standard | CustomerDatabase |
| req_02 | AuditLogRequirement | WPA2Protocol | WirelessNetwork |
| req_03 | ResidencyRequirement | GDPRLocalizationRule | PersonalDataRecord |
| req_04 | AccessControlRequirement | RoleBasedAccessPolicy | AdminConsole |
| req_05 | ReportingRequirement | QuarterlyFinancialStandard | AccountingSystem |

Table 7.3 demonstrates the instantiation of this axiom. Column `x` represents the Requirement class itself. Column `y` represents the class or standard being specified (the "what"), and column `z` represents the target class (the "where" or "who"). The relational integrity here is paramount; a Requirement cannot exist without these three components. This prevents the creation of vague mandates like "Ensure Security" without defining the standard (Y) and the target (Z). The axiom enforces the precision required for technical compliance, ensuring that every directive is actionable and bounded.

## 7.4 Attestation and Signatory Authority

While verification focuses on the production of evidence, attestation focuses on the endorsement of a state of affairs by a qualified agent. The axiom `attestation_min_one_signer` defines an Attestation as a subclass of `bfo:0000015` (Process) that must be signed by a minimum of one `cco:Person`.

The distinction between an audit and an attestation lies in the nature of the human involvement. In an audit, the person conducts the investigation. In an attestation, the person provides a formal declaration or signature, often validating the results of a previous process. The `sdg:signedBy` property creates a chain of authority. The `min 1` quantifier ensures that an attestation cannot be anonymous or system-generated; it requires the explicit cryptographic or manual endorsement of a natural person.

This axiom is critical for the legal enforceability of compliance records. An attestation serves as the bridge between technical evidence and legal liability. By requiring a `cco:Person`, the ontology ensures that there is always a natural person who can be held accountable for the truthfulness of the attestation. This is often implemented via digital signatures, where the cryptographic key is bound to a specific identity.

**Table 7.4: Attestation Processes and Signatory Constraints**

| id | x |
| :--- | :--- |
| att_01 | SafetyComplianceAttestation |
| att_02 | CodeReviewAttestation |
| att_03 | FinancialAccuracyAttestation |
| att_04 | PrivacyPolicyAttestation |
| att_05 | SystemHealthAttestation |

In Table 7.4, column `x` lists various classes of attestation processes. While the table only displays the process class, the underlying schema enforces the link to `cco:Person`. For example, the `FinancialAccuracyAttestation` is ontologically incomplete unless it is associated with a signer, such as a Chief Financial Officer or a certified auditor. This constraint filters out unverified system status reports, elevating only those records that carry human endorsement to the status of "Attestation."

## 7.5 Requirement Satisfaction Logic

The final axiom governs the closure of the compliance loop: satisfaction. The axiom `requirement_only_satisfied_by` defines that a Requirement (Class `X`), which is a subclass of `cco:DirectiveICE`, is satisfied *only* by instances of Class `Y`.

This is a universal restriction (`only`). It is more restrictive than a simple existential claim. It asserts that if a process or entity claims to satisfy Requirement `X`, it *must* be an instance of `Y`. No other type of entity is permitted to satisfy `X`. This enforces type safety in compliance workflows. For example, if a Requirement states that a physical access check must be performed, it might be restricted to being satisfied *only* by a `BiometricScan`. A manual key card entry, while a form of access, would not satisfy the specific requirement because it is not an instance of the allowed class `Y`.

This logic prevents "compliance drift," where incorrect or inferior methods are used to fulfill requirements. It acts as a validation rule at the ontological level. When the system records a satisfaction event, it checks the class of the satisfying entity against the `Y` defined in the requirement. If there is a mismatch, the satisfaction assertion is rejected.

**Table 7.5: Requirement Satisfaction Constraints**

| id | x | y |
| :--- | :--- | :--- |
| sat_01 | MultiFactorAuthRequirement | TokenAndBiometricLogin |
| sat_02 | DataBackupRequirement | EncryptedCloudSnapshot |
| sat_03 | TemperatureControlRequirement | AutomatedSensorLog |
| sat_04 | UserTrainingRequirement | AccreditedCourseCompletion |
| sat_05 | VulnerabilityScanRequirement | AuthenticatedPenTestReport |

Table 7.5 illustrates the strict mapping between requirements and their satisfying classes. Column `x` is the Requirement, and column `y` is the exclusive class permitted to satisfy it. For instance, row `sat_01` dictates that the `MultiFactorAuthRequirement` cannot be satisfied by a simple password login; it is satisfied *only* by the `TokenAndBiometricLogin` class. This precise mapping is essential for automated compliance enforcement, as it encodes the logic of "how" a requirement must be met directly into the semantic model.

```json
{
  "tables": [
    {
      "name": "t_audit_conducted_by",
      "rows": [
        ["audit_001", "FinancialComplianceAudit"],
        ["audit_002", "SystemSecurityAudit"],
        ["audit_003", "OperationalWorkflowAudit"],
        ["audit_004", "DataPrivacyAudit"],
        ["audit_005", "SupplyChainEthicsAudit"]
      ]
    },
    {
      "name": "t_verification_min_one_evidence",
      "rows": [
        ["ver_01", "CodeIntegrityVerification", "SourceCodeHash"],
        ["ver_02", "AccessRightsVerification", "AccessLogEntry"],
        ["ver_03", "NetworkConnectivityVerification", "PingResponseArtifact"],
        ["ver_04", "DataRetentionVerification", "StorageSnapshot"],
        ["ver_05", "IdentityVerification", "BiometricMatchRecord"]
      ]
    },
    {
      "name": "t_requirement_equiv_specifies_target",
      "rows": [
        ["req_01", "EncryptionRequirement", "AES256Standard", "CustomerDatabase"],
        ["req_02", "AuditLogRequirement", "WPA2Protocol", "WirelessNetwork"],
        ["req_03", "ResidencyRequirement", "GDPRLocalizationRule", "PersonalDataRecord"],
        ["req_04", "AccessControlRequirement", "RoleBasedAccessPolicy", "AdminConsole"],
        ["req_05", "ReportingRequirement", "QuarterlyFinancialStandard", "AccountingSystem"]
      ]
    },
    {
      "name": "t_attestation_min_one_signer",
      "rows": [
        ["att_01", "SafetyComplianceAttestation"],
        ["att_02", "CodeReviewAttestation"],
        ["att_03", "FinancialAccuracyAttestation"],
        ["att_04", "PrivacyPolicyAttestation"],
        ["att_05", "SystemHealthAttestation"]
      ]
    },
    {
      "name": "t_requirement_only_satisfied_by",
      "rows": [
        ["sat_01", "MultiFactorAuthRequirement", "TokenAndBiometricLogin"],
        ["sat_02", "DataBackupRequirement", "EncryptedCloudSnapshot"],
        ["sat_03", "TemperatureControlRequirement", "AutomatedSensorLog"],
        ["sat_04", "UserTrainingRequirement", "AccreditedCourseCompletion"],
        ["sat_05", "VulnerabilityScanRequirement", "AuthenticatedPenTestReport"]
      ]
    }
  ]
}
```