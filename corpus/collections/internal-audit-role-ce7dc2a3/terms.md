# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Internal Audit Role
- **genus**: `bfo:0000023`
- **definition**: A role occupied by the executive responsible for the organisation's internal audit service, including drawing up the internal audit strategy and annual plan and giving the annual audit opinion.
- **attributes**: roleIdentifier, roleTitle, standardComplianceStatus, contractingOrganisation, sharedServiceFlag, lastReviewDate, performanceRating
- **relations**: assignedToOrganisation→PublicServiceOrganisation, evaluatesGovernanceFramework→GovernanceFramework

## Public Service Organisation
- **genus**: `bfo:0000040`
- **definition**: An entity providing public services where public money needs to be effectively and efficiently managed.
- **attributes**: organisationId, organisationName, jurisdiction, establishmentDate, serviceType, annualBudget, governanceMaturityLevel
- **relations**: employsInternalAuditRole→InternalAuditRole, subjectToAuditStandards→AuditStandard, hasAuditCommittee→AuditCommittee

## Audit Standard
- **genus**: `cco:ont00000958`
- **definition**: A document or dataset that provides clear standards for internal audit, such as the UK Public Sector Internal Audit Standards (PSIAS).
- **attributes**: standardId, standardName, issuingBody, effectiveDate, revisionNumber, complianceLevel
- **relations**: mandatedByRegulator→RegulatoryBody, appliesToOrganisation→PublicServiceOrganisation

## Audit Committee
- **genus**: `bfo:0000040`
- **definition**: A group of individuals responsible for overseeing the internal audit function and ensuring compliance with standards.
- **attributes**: committeeId, committeeName, establishmentDate, meetingFrequency, memberCount, independenceLevel
- **relations**: overseesInternalAuditRole→InternalAuditRole, reportsToOrganisation→PublicServiceOrganisation

## Governance Framework
- **genus**: `bfo:0000040`
- **definition**: A set of arrangements and principles that define how an organisation is directed and controlled, including risk management and internal control.
- **attributes**: frameworkId, frameworkName, version, lastUpdated, complianceScore, riskAssessmentFrequency
- **relations**: evaluatedByInternalAuditRole→InternalAuditRole, implementedByOrganisation→PublicServiceOrganisation
