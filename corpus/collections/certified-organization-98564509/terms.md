# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Certified Organization
- **genus**: `cco:ont00000995`
- **definition**: A legal entity or organizational unit that has been granted approval for its management system against a specific standard.
- **attributes**: legalName, streetAddress, postalCode, city, country, registrationNumber
- **relations**: holdsApprovalFrom→CertificationBody, holdsApprovalFor→CertificationRecord

## Certification Body
- **genus**: `cco:ont00000995`
- **definition**: An accredited organization authorized to assess and certify the conformity of management systems to standards.
- **attributes**: bodyName, accreditationCode, jurisdiction
- **relations**: issuesApprovalTo→CertifiedOrganization, employsAuditor→CertificationRecord

## Certification Record
- **genus**: `cco:ont00000958`
- **definition**: A formal document or dataset representing the specific approval of a management system against a standard, including validity periods and scope.
- **attributes**: certificateIdentityNumber, approvalNumber, currentIssueDate, expiryDate, scopeDescription, status
- **relations**: certifiesOrganization→CertifiedOrganization, conformsToStandard→ManagementStandard, issuedBy→CertificationBody, recordedBy→Auditor, derivedFrom→CertificationRecord

## Management Standard
- **genus**: `bfo:0000023`
- **definition**: A normative document specifying requirements for a management system, serving as the basis for certification.
- **attributes**: standardIdentifier, standardVersion, issuingOrganization
- **relations**: isSubjectOf→CertificationRecord

## Auditor
- **genus**: `bfo:0000023`
- **definition**: A person acting in the role of assessing compliance and issuing certification on behalf of a certification body.
- **attributes**: auditorName, auditorTitle, region
- **relations**: recordsApproval→CertificationRecord, employedBy→CertificationBody

## Approval History
- **genus**: `cco:ont00000958`
- **definition**: A record of a past certification event or initial approval granted to an organization.
- **attributes**: originalApprovalDate, historicalApprovalNumber, historicalStandard
- **relations**: relatesToOrganization→CertifiedOrganization, conformsToStandard→ManagementStandard
