# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Network Account
- **genus**: `cco:ont00000995`
- **definition**: A digital identity and access credential issued to a student for interacting with the school's computer network and internet resources.
- **attributes**: accountIdentifier, username, passwordHash, status, creationDate, lastLoginTimestamp, accountType
- **relations**: assignedTo→Student, managedBy→NetworkAdministrator, grantsAccessTo→NetworkResource

## Student
- **genus**: `bfo:0000004`
- **definition**: An individual enrolled in Pinellas County Schools who is granted access to educational network resources.
- **attributes**: studentId, fullName, gradeLevel, schoolEnrollment, isEligibleForInternet, parentGuardianContact
- **relations**: holdsAccount→NetworkAccount, enrolledAt→School, subjectTo→AcceptableUsePolicy

## Network Administrator
- **genus**: `bfo:0000004`
- **definition**: A staff member appointed to supervise distributive and user support systems, manage network accounts, and enforce acceptable use policies.
- **attributes**: adminId, fullName, roleLevel, appointmentDate, isAuthorizedToRevoke
- **relations**: manages→NetworkAccount, worksAt→School, enforcesPolicy→AcceptableUsePolicy

## Acceptable Use Policy
- **genus**: `cco:ont00000958`
- **definition**: A formal document and set of rules governing the ethical and legal use of the school's network and internet facilities by students and staff.
- **attributes**: policyId, versionNumber, effectiveDate, isLegallyBinding, prohibitsCommercialUse, requiresEthicalBehavior
- **relations**: governs→NetworkAccount, appliesTo→Student, enforcedBy→NetworkAdministrator

## Network Resource
- **genus**: `cco:ont00000995`
- **definition**: A digital service, library, or computing facility accessible via the school's network for educational research and collaboration.
- **attributes**: resourceId, resourceName, resourceType, isFeeBased, requiresPriorApproval, accessLevel
- **relations**: accessedBy→NetworkAccount, providedBy→School, subjectTo→AcceptableUsePolicy

## Security Incident
- **genus**: `bfo:0000015`
- **definition**: A recorded event involving a violation of network security, vandalism, or inappropriate use that triggers administrative review or account suspension.
- **attributes**: incidentId, incidentType, severityLevel, reportedDate, isResolved, resultingAction
- **relations**: involvesAccount→NetworkAccount, reportedTo→NetworkAdministrator, triggersReview→AcceptableUsePolicy
