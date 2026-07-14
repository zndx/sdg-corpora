# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Safeguarding Policy
- **genus**: `cco:ont00000958`
- **definition**: A formal document establishing the rules, procedures, and commitments for protecting students from harm within the school community.
- **attributes**: policyIdentifier, effectiveDate, issuingAuthority, jurisdiction, complianceStandard, reviewCycle, status
- **relations**: supersedes→SafeguardingPolicy, mandatedBy→LegalFramework, appliesTo→Student, enforcedBy→StaffMember

## Legal Framework
- **genus**: `cco:ont00000958`
- **definition**: A recognized law, treaty, or regulatory standard that mandates child protection obligations.
- **attributes**: frameworkIdentifier, jurisdiction, enactmentDate, issuingBody, frameworkType, status
- **relations**: mandates→SafeguardingPolicy, covers→AbuseType

## Abuse Type
- **genus**: `bfo:0000015`
- **definition**: A specific category of harmful behavior inflicted upon a child, including physical, emotional, sexual abuse, and neglect.
- **attributes**: abuseCode, definition, severityLevel, requiresMandatoryReporting, classification
- **relations**: exhibitedBy→Incident, triggers→SafeguardingProtocol

## Safeguarding Incident
- **genus**: `bfo:0000015`
- **definition**: A recorded event involving suspected or confirmed harm, abuse, or neglect of a student.
- **attributes**: incidentId, reportedDate, incidentDate, location, severityRating, status, riskLevel
- **relations**: involves→Student, involves→StaffMember, classifiedAs→AbuseType, investigatedBy→ChildProtectionTeam, referencedIn→IncidentReport

## Student
- **genus**: `bfo:0000004`
- **definition**: A minor enrolled in the school community who is protected under the safeguarding policies.
- **attributes**: studentId, firstName, lastName, dateOfBirth, enrollmentStatus, guardianContactId, riskProfile
- **relations**: enrolledIn→School, hasGuardian→Guardian, experienced→Incident, assignedTo→Counselor

## Staff Member
- **genus**: `bfo:0000004`
- **definition**: An employee or contractor of the school who holds a role in safeguarding or general operations.
- **attributes**: staffId, firstName, lastName, employmentStatus, role, lastTrainingDate, backgroundCheckStatus
- **relations**: employedBy→School, reportsTo→StaffMember, investigates→Incident, trainedIn→SafeguardingProtocol

## Safeguarding Protocol
- **genus**: `bfo:0000015`
- **definition**: A defined procedure or action taken in response to a safeguarding concern, such as reporting, investigation, or referral.
- **attributes**: protocolId, protocolName, triggerCondition, requiredAction, deadlineHours, status
- **relations**: triggeredBy→Incident, assignedTo→StaffMember, resultsIn→Referral

## External Referral
- **genus**: `cco:ont00000995`
- **definition**: A formal transmission of information to an external agency for further action regarding a safeguarding incident.
- **attributes**: referralId, submittedDate, recipientAgency, agencyContact, referralType, status
- **relations**: originatesFrom→Incident, initiatedBy→StaffMember, directedTo→ExternalAgency
