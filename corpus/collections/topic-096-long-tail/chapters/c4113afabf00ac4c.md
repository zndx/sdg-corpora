---
chapter_id: c4113afabf00ac4c
topic_id: 96
family: 03_directive_governance
cited_terms: ['requirement_equiv_specifies_target', 'pci_dss_requirement', 'policy_equiv_jurisdiction_and_scope', 'attestation_signed_by', 'policy_min_one_enforcer']
model: xai/grok-4.3
---

# Directive Governance in PCI DSS Compliance Models

This chapter presents five relational tables that instantiate axioms for directive information content entities under PCI DSS governance. The tables encode class equivalences, subclass restrictions, and property constraints drawn from the ontology templates. Primary and foreign key relationships enable verification of multi-hop queries across requirements, policies, jurisdictions, enforcers, and attestations.

## 1 Scope and Table Overview

The tables below are restricted to the five axiom projections supplied by the ontology. Each table name matches its template identifier exactly. Column order follows the deterministic schema. Foreign key values reference only existing primary key values in the target table, ensuring referential integrity for cross-table navigation.

### 1.1 t_requirement_equiv_specifies_target

This table embodies axiom 1 by recording the equivalent class expression that links a directive to both a specification target and an applicability class. Column id is the primary key; columns y and z are foreign keys that respectively reference t_pci_dss_requirement and an external applicability class.

| id          | x                  | y           | z             |
|-------------|--------------------|-------------|---------------|
| req_equiv-001 | Requirement12Equiv | pdr-001     | AccountData   |
| req_equiv-002 | Requirement3Equiv  | pdr-002     | NetworkSeg    |
| req_equiv-003 | Requirement8Equiv  | pdr-003     | AccessControl |
| req_equiv-004 | Requirement11Equiv | pdr-004     | TestScope     |

### 1.2 t_pci_dss_requirement

This table embodies axiom 2 by asserting that each listed class is a subclass of cco:DirectiveICE while satisfying a PCI DSS requirement property. Column id is the primary key; column y is a foreign key referencing t_requirement_equiv_specifies_target.

| id      | x             | y             |
|---------|---------------|---------------|
| pdr-001 | Req12         | req_equiv-001 |
| pdr-002 | Req3          | req_equiv-002 |
| pdr-003 | Req8          | req_equiv-003 |
| pdr-004 | Req11         | req_equiv-004 |

### 1.3 t_policy_equiv_jurisdiction_and_scope

This table embodies axiom 3 by capturing the equivalent class definition that combines jurisdiction and governed scope for a directive. Column id is the primary key; column y is a foreign key referencing t_pci_dss_requirement.

| id          | x               | y       | z             |
|-------------|-----------------|---------|---------------|
| pol_equiv-001 | GlobalPolicyEquiv | pdr-001 | CardholderData |
| pol_equiv-002 | EUJurisdictionEquiv | pdr-002 | MerchantEnv    |
| pol_equiv-003 | USScopeEquiv     | pdr-003 | UserAccounts   |

### 1.4 t_attestation_signed_by

This table embodies axiom 4 by recording process instances that are signed by a person. Column id is the primary key; no foreign key columns are present.

| id            | x                  |
|---------------|--------------------|
| attest-001    | AnnualAttestation  |
| attest-002    | QuarterlyReview    |
| attest-003    | IncidentReport     |
| attest-004    | ChangeControlLog   |

### 1.5 t_policy_min_one_enforcer

This table embodies axiom 5 by asserting that each policy class is enforced by at least one enforcer class. Column id is the primary key; column y is a foreign key referencing t_pci_dss_requirement.

| id          | x                | y       |
|-------------|------------------|---------|
| pol_enf-001 | EnforcementRole1 | pdr-001 |
| pol_enf-002 | EnforcementRole2 | pdr-002 |
| pol_enf-003 | EnforcementRole3 | pdr-003 |
| pol_enf-004 | EnforcementRole4 | pdr-004 |

## 2 Cross-Join Demonstration

To retrieve the specification target, jurisdiction, and enforcer for requirement pdr-001, join t_requirement_equiv_specifies_target on y, t_policy_equiv_jurisdiction_and_scope on y, and t_policy_min_one_enforcer on y. The resulting row is:

req_equiv-001 | AccountData | pol_equiv-001 | CardholderData | pol_enf-001 | EnforcementRole1

```json
{"tables": [{"name": "t_requirement_equiv_specifies_target", "rows": [["req_equiv-001", "Requirement12Equiv", "pdr-001", "AccountData"], ["req_equiv-002", "Requirement3Equiv", "pdr-002", "NetworkSeg"], ["req_equiv-003", "Requirement8Equiv", "pdr-003", "AccessControl"], ["req_equiv-004", "Requirement11Equiv", "pdr-004", "TestScope"]]}, {"name": "t_pci_dss_requirement", "rows": [["pdr-001", "Req12", "req_equiv-001"], ["pdr-002", "Req3", "req_equiv-002"], ["pdr-003", "Req8", "req_equiv-003"], ["pdr-004", "Req11", "req_equiv-004"]]}, {"name": "t_policy_equiv_jurisdiction_and_scope", "rows": [["pol_equiv-001", "GlobalPolicyEquiv", "pdr-001", "CardholderData"], ["pol_equiv-002", "EUJurisdictionEquiv", "pdr-002", "MerchantEnv"], ["pol_equiv-003", "USScopeEquiv", "pdr-003", "UserAccounts"]]}, {"name": "t_attestation_signed_by", "rows": [["attest-001", "AnnualAttestation"], ["attest-002", "QuarterlyReview"], ["attest-003", "IncidentReport"], ["attest-004", "ChangeControlLog"]]}, {"name": "t_policy_min_one_enforcer", "rows": [["pol_enf-001", "EnforcementRole1", "pdr-001"], ["pol_enf-002", "EnforcementRole2", "pdr-002"], ["pol_enf-003", "EnforcementRole3", "pdr-003"], ["pol_enf-004", "EnforcementRole4", "pdr-004"]]}]}
```