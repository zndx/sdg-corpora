# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Social Media Account
- **genus**: `cco:ont00000995`
- **definition**: A digital platform presence representing a school district entity, subject to registration and content governance.
- **attributes**: accountIdentifier, platformType, registrationStatus, creationDate, lastAuditDate
- **relations**: hasAdministrator→DistrictEmployee, representsEntity→SchoolDistrictEntity, subjectToPolicy→BoardPolicy

## District Employee
- **genus**: `bfo:0000023`
- **definition**: An individual employed by the school district who manages official communications and social media accounts.
- **attributes**: employeeId, fullName, role, contactExtension, employmentStatus
- **relations**: managesAccount→SocialMediaAccount, subjectToPolicy→BoardPolicy

## School District Entity
- **genus**: `bfo:0000023`
- **definition**: An official organizational unit or representation within the school district, such as a sport, club, or program.
- **attributes**: entityId, entityName, entityType, affiliationStatus
- **relations**: hasRepresentativeAccount→SocialMediaAccount

## Board Policy
- **genus**: `cco:ont00000958`
- **definition**: A formal document establishing rules and expectations for district employees regarding technology and communication.
- **attributes**: policyNumber, policyTitle, effectiveDate, policyStatus
- **relations**: governsAccount→SocialMediaAccount, governsEmployee→DistrictEmployee

## Public Information Officer
- **genus**: `bfo:0000023`
- **definition**: A district employee responsible for overseeing public communications and managing access to official social media accounts.
- **attributes**: officerId, fullName, contactExtension, accessLevel
- **relations**: storesCredentials→SocialMediaAccount, subjectToPolicy→BoardPolicy
