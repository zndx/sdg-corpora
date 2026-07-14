# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Governance Body
- **genus**: `bfo:0000040`
- **definition**: A distinct organizational unit or committee established to exercise oversight, decision-making, or advisory functions within the corporate governance structure.
- **attributes**: bodyIdentifier, bodyName, bodyType, meetingFrequency, establishmentDate, isExternal
- **relations**: supervises→BusinessUnit, audits→BusinessUnit, advises→ExecutiveOfficer, composedOf→GovernanceMember

## Governance Member
- **genus**: `bfo:0000040`
- **definition**: An individual holding a specific role (director, auditor, officer) within a governance body, responsible for oversight, execution, or advisory duties.
- **attributes**: memberIdentifier, memberName, memberRole, appointmentDate, isExternal, certificationStatus
- **relations**: servesOn→GovernanceBody, participatesIn→Meeting

## Business Unit
- **genus**: `bfo:0000040`
- **definition**: A distinct operational segment, division, or subsidiary within the corporate group responsible for specific business activities and reporting to governance bodies.
- **attributes**: unitIdentifier, unitName, unitType, reportingFrequency, operationalStatus
- **relations**: reportsTo→GovernanceBody, auditedBy→InternalAuditingDivision, supervisedBy→GovernanceBody

## Internal Auditing Division
- **genus**: `bfo:0000040`
- **definition**: A dedicated organizational unit responsible for conducting internal audits to assess business operations, prevent improprieties, and streamline processes.
- **attributes**: divisionIdentifier, divisionName, memberCount, certificationRequirement, auditScope
- **relations**: audits→BusinessUnit, reportsTo→BoardOfAuditors, employs→InternalAuditor

## Internal Auditor
- **genus**: `bfo:0000040`
- **definition**: A certified professional employed within the Internal Auditing Division to conduct audits and assess operational compliance.
- **attributes**: auditorIdentifier, auditorName, certificationType, assignmentDate, specialization
- **relations**: employedBy→InternalAuditingDivision, conductsAuditFor→BusinessUnit

## Meeting
- **genus**: `bfo:0000015`
- **definition**: A scheduled gathering of governance members or executives to discuss policies, review operations, or make decisions.
- **attributes**: meetingIdentifier, meetingType, scheduledDate, durationHours, agendaItems, meetingStatus
- **relations**: convenedBy→GovernanceBody, attendedBy→GovernanceMember, reviews→BusinessUnit

## Policy Document
- **genus**: `bfo:0000040`
- **definition**: A formalized document establishing rules, standards, or guidelines for corporate governance, internal control, or compliance.
- **attributes**: documentIdentifier, documentTitle, publicationDate, issuingAuthority, complianceStandard, documentStatus
- **relations**: governs→BusinessUnit, enforcedBy→GovernanceBody, referencedBy→Meeting
