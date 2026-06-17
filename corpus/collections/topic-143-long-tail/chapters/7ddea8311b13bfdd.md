---
chapter_id: 7ddea8311b13bfdd
topic_id: 143
family: 06_belief_structure
cited_terms: ['mass_function_equiv_frame_and_assignment', 'equiv_intersect_with_negation', 'belief_interval_equiv_bel_and_pl', 'directive_authored_and_applies']
model: cerebras/zai-glm-4.7
---

# Chapter 4: Formal Ontologies of Evidence and Governance

This chapter delineates the formal ontological structures governing evidence aggregation, belief quantification, and directive issuance within the enterprise compliance framework. It establishes the axiomatic relationships between Information Content Entities (ICEs), frames of discernment, and governance directives, providing a rigorous schema for the representation of uncertainty and authority in automated systems. The definitions herein are binding upon all subsystems responsible for audit logging, risk assessment, and policy enforcement.

## 4.1 Mass Functions and Frames of Discernment

The fundamental unit of evidential reasoning within the system is the Mass Function, defined axiomatically as a Descriptive Information Content Entity (ICE) that operates over a specific Frame of Discernment. In accordance with the Dempster-Shafer theory of evidence, a mass function does not assign probability to singletons directly but rather assigns a basic probability assignment (mass) to subsets of a hypothesis space. The formalization of this concept requires the integration of three distinct classes: the Mass Function itself (X), the Frame of Discernment (Y), and the Focal Element to which mass is assigned (Z).

The axiom `mass_function_equiv_frame_and_assignment` posits that a valid Mass Function is equivalent to a `cco:DescriptiveICE` that possesses a specific Frame of Discernment and assigns mass to at least one element within that frame. This structure ensures that all evidential claims are grounded in a well-defined universe of discourse (the Frame) and are explicitly associated with a target of inference (the Assignment).

To implement this axiom, the relational schema `t_mass_function_equiv_frame_and_assignment` is utilized. This table enforces the integrity of the evidential link by mandating that the Frame of Discernment (column `y`) must correspond to a valid logical exclusion set defined in the foundational ontology (referencing `t_equiv_intersect_with_negation`). This foreign key constraint guarantees that the universe of discourse over which the mass function operates is itself a rigorously defined set, constructed via intersection and negation.

The following table illustrates instances of mass functions utilized in the "Access Control Matrix" and "Data Sanitization Log" subsystems. Note that the `y` column references the identifier of the Frame of Discernment, ensuring logical consistency.

| id | x | y | z |
| :--- | :--- | :--- | :--- |
| MFA_01 | AccessControlMatrix | EIN_01 | PrivilegeEscalation |
| MFA_02 | DataSanitizationLog | EIN_02 | AnomalyVector |
| MFA_03 | NetworkTrafficFilter | EIN_03 | MaliciousSignature |

In the first instance, the `AccessControlMatrix` acts as the DescriptiveICE (Mass Function). It operates over the Frame of Discernment referenced by `EIN_01` (defined in Section 4.2 as `AuthorizedUser`). It assigns mass to the specific subset `PrivilegeEscalation`, representing the system's evidential belief that a privilege escalation event has occurred. This formalization allows the audit subsystem to quantify uncertainty regarding user permissions without resorting to binary true/false logic, thereby supporting more nuanced forensic analysis.

## 4.2 Logical Exclusion and Set Intersection

Prior to defining the specific parameters of belief or mass, the ontology must establish the definitions of the classes themselves. The axiom `equiv_intersect_with_negation` provides the mechanism for defining a class (X) through the intersection of a positive superclass (Y) and the negation of an excluded class (Z). This is a foundational construct (Family: 01_foundation) necessary for defining complex sets such as "AuthorizedUser" (a User who is not Revoked) or "SecureData" (Data that is not Corrupted).

The verbalization of this axiom states: "{X} is equivalent to {Y} and not {Z}". This logical construct is critical for governance frameworks, where definitions frequently rely on the exclusion of non-compliant or invalid states. For instance, a "ValidTransaction" is only meaningful if it is defined as a "FinancialRecord" that is not a "FlaggedEntry".

The relational schema `t_equiv_intersect_with_negation` captures these definitions. The primary key (`id`) serves as the unique identifier for the defined class, which is subsequently referenced by other tables, such as the mass function definitions in the previous section. This structure allows the system to dynamically update definitions (e.g., changing what constitutes a "RevokedUser") and automatically propagate those changes to all dependent evidential calculations and directives.

The table below encodes the definitions for the Frames of Discernment referenced in Section 4.1.

| id | x | y | z |
| :--- | :--- | :--- | :--- |
| EIN_01 | AuthorizedUser | SystemUser | RevokedUser |
| EIN_02 | CleanDataset | RawData | CorruptedRecord |
| EIN_03 | SecureChannel | NetworkLink | CompromisedNode |

Here, the row with identifier `EIN_01` defines the class `AuthorizedUser` as equivalent to the intersection of `SystemUser` and the negation of `RevokedUser`. This definition is utilized by the `AccessControlMatrix` mass function (`MFA_01`) in Section 4.1 to establish the boundaries of its Frame of Discernment. By anchoring the mass function to this identifier, the system ensures that if the definition of `AuthorizedUser` changes (e.g., if `TerminatedUser` is added to the exclusion list), the mass function automatically adjusts its operational context without requiring manual reconfiguration of the audit rules.

## 4.3 Belief Intervals and Boundary Specification

While mass functions assign evidential weight to specific subsets, the overall confidence in a hypothesis is often expressed via a Belief Interval. This interval is bounded by a Lower Bound (Belief) and an Upper Bound (Plausibility). The axiom `belief_interval_equiv_bel_and_pl` formalizes this by defining a Belief Interval (X) as a `cco:DescriptiveICE` that possesses a specific Belief Lower Bound (Y) and a Plausibility Upper Bound (Z).

The Belief Lower Bound represents the total mass assigned to subsets that strictly imply the hypothesis, providing a measure of minimum committed support. The Plausibility Upper Bound represents the total mass assigned to subsets that do not contradict the hypothesis, providing a measure of maximum potential support. The interval [Bel, Pl] thus characterizes the uncertainty of the system; a width of zero indicates precise probability, while a wider gap indicates ignorance or ambiguity.

In the relational schema `t_belief_interval_equiv_bel_and_pl`, the Belief Lower Bound (`y`) is constrained to reference a valid definition from `t_equiv_intersect_with_negation`. This design choice implies that the lower bound of belief is often defined relative to a specific, strictly defined positive class (e.g., "VerifiedIdentity"), ensuring that the floor of the confidence interval is grounded in concrete, exclusionary logic.

The following table details the configuration of belief intervals for system trust metrics.

| id | x | y | z |
| :--- | :--- | :--- | :--- |
| BIE_01 | TrustMetric | EIN_03 | UpperTolerance |
| BIE_02 | ComplianceScore | EIN_01 | RegulatoryLimit |

In the instance `BIE_01`, the `TrustMetric` is defined with a lower bound referencing `EIN_03` (`SecureChannel`) and an upper bound of `UpperTolerance`. This configuration implies that the system's minimum belief in the trust metric is derived strictly from evidence that the channel is secure (and not compromised), while the plausibility extends up to a defined tolerance threshold. This structure is essential for risk management reporting, where auditors must distinguish between lack of evidence (wide interval) and evidence of safety (narrow interval).

## 4.4 Directive Authorization and Application

The culmination of the evidential reasoning process is the issuance of Governance Directives. A Directive is a prescriptive Information Content Entity (`cco:DirectiveICE`) that mandates specific actions or states. The axiom `directive_authored_and_applies` defines a Directive (X) as an entity that is authored by a specific authority or process (Y) and applies to a specific target scope (Z).

This axiom closes the loop between the descriptive realm (evidence and belief) and the prescriptive realm (governance and control). Notably, the schema requires that the Author (`y`) of the directive be a valid Mass Function. This constraint enforces a policy of "Evidence-Based Authorization": directives cannot be arbitrarily created; they must be generated by a valid evidential reasoning process (a Mass Function) operating over a defined Frame of Discernment. This ensures that all governance actions are traceable to the underlying evidence analysis defined in Sections 4.1 and 4.2.

The relational schema `t_directive_authored_and_applies` enforces this lineage. The foreign key on column `y` ensures that the authoring entity exists within `t_mass_function_equiv_frame_and_assignment`, thereby linking the directive to the specific evidential context (Frame of Discernment and Mass Assignment) that justified its creation.

The table below presents the active directives derived from the evidential subsystems.

| id | x | y | z |
| :--- | :--- | :--- | :--- |
| DAA_01 | AuditProtocol | MFA_01 | AuthenticationModule |
| DAA_02 | DataRetentionPolicy | MFA_02 | ArchiveServer |
| DAA_03 | FirewallConfiguration | MFA_03 | IngressPort |

Consider the directive `DAA_01` (`AuditProtocol`). It is authored by the mass function `MFA_01` (`AccessControlMatrix`). This indicates that the `AuditProtocol` was generated or validated based on the evidential findings of the `AccessControlMatrix` regarding `PrivilegeEscalation`. The directive applies to the `AuthenticationModule`. This linkage ensures that if the `AccessControlMatrix` were to be invalidated (e.g., its Frame of Discernment `EIN_01` is found to be logically inconsistent), the authorization for the `AuditProtocol` would be revoked, maintaining the integrity of the governance chain.

```json
{
  "tables": [
    {
      "name": "t_mass_function_equiv_frame_and_assignment",
      "rows": [
        [
          "MFA_01",
          "AccessControlMatrix",
          "EIN_01",
          "PrivilegeEscalation"
        ],
        [
          "MFA_02",
          "DataSanitizationLog",
          "EIN_02",
          "AnomalyVector"
        ],
        [
          "MFA_03",
          "NetworkTrafficFilter",
          "EIN_03",
          "MaliciousSignature"
        ]
      ]
    },
    {
      "name": "t_equiv_intersect_with_negation",
      "rows": [
        [
          "EIN_01",
          "AuthorizedUser",
          "SystemUser",
          "RevokedUser"
        ],
        [
          "EIN_02",
          "CleanDataset",
          "RawData",
          "CorruptedRecord"
        ],
        [
          "EIN_03",
          "SecureChannel",
          "NetworkLink",
          "CompromisedNode"
        ]
      ]
    },
    {
      "name": "t_belief_interval_equiv_bel_and_pl",
