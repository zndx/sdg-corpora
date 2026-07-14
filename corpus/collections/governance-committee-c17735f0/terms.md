# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Corporate Governance Committee
- **genus**: `bfo:0000040`
- **definition**: A formally established organizational unit within the corporate structure tasked with overseeing specific governance domains such as compliance, compensation, or disclosure.
- **attributes**: committeeName, establishmentDate, primaryObjective, isCrossFunctional, reportingFrequency
- **relations**: oversees→GovernanceDomain, composedOf→GovernanceMember

## Corporate Governance Domain
- **genus**: `bfo:0000040`
- **definition**: A specific functional area of corporate oversight and management, such as internal control, information security, or CSR policy formulation.
- **attributes**: domainName, domainCode, regulatoryBasis, isMandatory
- **relations**: isOverseenBy→GovernanceCommittee, governs→BusinessUnit

## Corporate Governance Participant
- **genus**: `bfo:0000040`
- **definition**: An individual holding a specific governance role, such as an external director, internal auditor, or executive officer, responsible for oversight or execution.
- **attributes**: memberID, roleTitle, isExternal, certificationType, appointmentDate
- **relations**: servesOn→GovernanceCommittee, audits→BusinessUnit

## Corporate Business Unit
- **genus**: `bfo:0000040`
- **definition**: A distinct operational segment of the corporate group, including corporate divisions, subsidiaries, or affiliates, subject to governance and audit.
- **attributes**: unitID, unitName, unitType, isSubsidiary, lastAuditDate
- **relations**: isAuditedBy→GovernanceMember, reportsTo→GovernanceCommittee

## Corporate Governance Policy
- **genus**: `bfo:0000040`
- **definition**: A formalized rule, standard, or basic policy established to ensure the properness of business activities and compliance with legal ordinances.
- **attributes**: policyID, policyTitle, effectiveDate, issuingAuthority, complianceStatus
- **relations**: governs→BusinessUnit, supports→GovernanceDomain
