# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Social Media Account
- **genus**: `cco:ont00000995`
- **definition**: A registered user profile or page on a social networking service created and managed by or on behalf of the education board or its staff.
- **attributes**: accountId, platformName, accountType, creationDate, status, lastLoginDate, passwordHash
- **relations**: managedBy→StaffMember, registeredIn→AccountRegister, subjectToPolicy→SocialMediaPolicy

## Staff Member
- **genus**: `bfo:0000002`
- **definition**: An individual employed by the education and training board in any capacity, including permanent, temporary, or casual roles.
- **attributes**: staffId, fullName, employmentStatus, role, dateOfCommencement, emailAddress, department
- **relations**: holdsAccount→SocialMediaAccount, worksAt→EducationalInstitution, subjectToCodeOfConduct→TeachingCouncilCode

## Educational Institution
- **genus**: `bfo:0000004`
- **definition**: A school, institute, centre, or office within the Cavan and Monaghan Education and Training Board structure.
- **attributes**: institutionId, institutionName, institutionType, address, principalName, dateEstablished
- **relations**: maintainsRegister→AccountRegister, employsStaff→StaffMember, governsByPolicy→SocialMediaPolicy

## Account Register
- **genus**: `cco:ont00000958`
- **definition**: A formal record maintained by an educational institution documenting all active social networking application domain names, administrators, user IDs, and passwords.
- **attributes**: registerId, institutionId, lastAuditDate, totalActiveAccounts, complianceStatus, recordFormat
- **relations**: recordsAccount→SocialMediaAccount, maintainedBy→EducationalInstitution, auditedBy→StaffMember

## Social Media Policy
- **genus**: `cco:ont00000958`
- **definition**: The official document adopted by the Cavan and Monaghan Education and Training Board outlining rules, responsibilities, and guidelines for social media usage by staff.
- **attributes**: policyId, title, adoptionDate, version, issuingAuthority, scope
- **relations**: governs→StaffMember, appliesTo→SocialMediaAccount, references→TeachingCouncilCode

## Teaching Council Code of Conduct
- **genus**: `cco:ont00000958`
- **definition**: The official code of conduct prescribed by the Teaching Council that governs professional behavior and communication standards for teaching staff.
- **attributes**: codeId, codeTitle, issuingBody, effectiveDate, sectionNumber
- **relations**: binds→StaffMember, referencedBy→SocialMediaPolicy
