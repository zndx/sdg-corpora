# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Safeguarding Policy
- **genus**: `cco:ont00000958`
- **definition**: A formal document establishing procedures and commitments for protecting students from harm, aligned with national and international legal frameworks.
- **attributes**: policyIdentifier, effectiveDate, issuingAuthority, jurisdiction, complianceStatus, lastReviewDate
- **relations**: mandatedBy→LegalStatute, implementedBy→SafeguardingProcedure

## Safeguarding Procedure
- **genus**: `bfo:0000015`
- **definition**: A defined operational process for identifying, reporting, and responding to risks or incidents of harm to students.
- **attributes**: procedureCode, procedureName, triggerCondition, responseTimeLimit, status, assignedRole
- **relations**: executedBy→StaffRole, addresses→HarmType, triggers→IncidentReport

## Harm Type
- **genus**: `bfo:0000015`
- **definition**: A category of maltreatment or risk to a student's physical, emotional, or sexual well-being, as defined by safeguarding standards.
- **attributes**: harmCode, harmCategory, severityLevel, description, requiresMandatoryReporting
- **relations**: reportedIn→IncidentReport, observedIn→Student

## Incident Report
- **genus**: `cco:ont00000995`
- **definition**: A formal record documenting a suspicion, disclosure, or occurrence of harm or risk to a student.
- **attributes**: reportId, reportedDate, reportStatus, riskLevel, investigatorId, resolutionOutcome
- **relations**: concerns→Student, documents→HarmType, initiatedBy→StaffRole, escalatedTo→ExternalAgency

## Student
- **genus**: `bfo:0000002`
- **definition**: An individual enrolled in the school community who is the subject of safeguarding protections and records.
- **attributes**: studentId, enrollmentStatus, dateOfBirth, guardianContactId, counselorId
- **relations**: subjectOf→IncidentReport, exhibits→HarmType, assignedTo→StaffRole

## Staff Role
- **genus**: `bfo:0000023`
- **definition**: A functional position within the school responsible for implementing safeguarding procedures and reporting incidents.
- **attributes**: roleCode, roleTitle, certificationLevel, trainingCompletionDate, accessLevel
- **relations**: executes→SafeguardingProcedure, initiates→IncidentReport, assignedTo→Student
