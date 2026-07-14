# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Social Media Account
- **genus**: `cco:ont00000995`
- **definition**: A registered online presence representing a school district entity, subject to public record and policy compliance.
- **attributes**: accountIdentifier, platform, representingEntity, isOfficial, registrationDate, status
- **relations**: hasAdministrator→DistrictEmployee, representsEntity→SchoolEntity, storedCredentialsIn→SecureCredentialStore

## District Employee
- **genus**: `bfo:0000015`
- **definition**: A staff member employed by the school district who is responsible for managing official communications and social media accounts.
- **attributes**: employeeId, fullName, role, employmentStatus, contactExtension
- **relations**: managesAccount→SocialMediaAccount, conductsBusinessVia→ElectronicCommunication

## Electronic Communication
- **genus**: `cco:ont00000958`
- **definition**: Any digital message or content created by district employees for official business, constituting a public record.
- **attributes**: communicationId, contentType, sentDateTime, isPublicRecord, platformUsed, contentStatus
- **relations**: createdBy→DistrictEmployee, conductedOnBehalfOf→SchoolEntity, storedIn→PublicRecordArchive

## School Entity
- **genus**: `bfo:0000015`
- **definition**: An organizational unit within the district, such as a school, program, or group, represented by social media accounts.
- **attributes**: entityId, entityName, entityType, parentDistrict
- **relations**: hasRepresentedAccount→SocialMediaAccount, hasEmployee→DistrictEmployee

## Secure Credential Store
- **genus**: `cco:ont00000995`
- **definition**: A protected repository for storing login credentials of registered social media accounts, accessible only under specific policy violations.
- **attributes**: storeIdentifier, accessLevel, lastAccessed, isEncrypted
- **relations**: storesCredentialsFor→SocialMediaAccount

## Policy Document
- **genus**: `cco:ont00000958`
- **definition**: An official district document outlining expectations and rules for technology and communication use.
- **attributes**: policyId, policyNumber, title, effectiveDate, version
- **relations**: governs→ElectronicCommunication, governs→SocialMediaAccount
