# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Certified Organization
- **genus**: `bfo:0000040`
- **definition**: A material entity representing a legal or operational entity that has achieved and maintains a certified management system.
- **attributes**: legalName, registeredAddress, certificationBody, certificationBodyRegion, certificationBodyRepresentative, certificationBodyTitle
- **relations**: holdsCertification→CertificationRecord

## Certification Record
- **genus**: `cco:ont00000995`
- **definition**: A made thing representing the official administrative record of an organization's approval to a specific standard.
- **attributes**: certificateIdentityNumber, currentIssueDate, expiryDate, status
- **relations**: certifies→CertifiedOrganization, specifiesStandard→ManagementStandard, definesScope→CertificationScope, recordsApproval→ApprovalEvent

## Management Standard
- **genus**: `bfo:0000040`
- **definition**: A material entity representing a published set of requirements and guidelines for management systems.
- **attributes**: standardIdentifier, standardTitle, versionNumber, issuingBody, publicationYear
- **relations**: isCertifiedBy→CertificationRecord

## Certification Scope
- **genus**: `bfo:0000040`
- **definition**: A material entity representing the specific operational boundaries and activities covered by a certification.
- **attributes**: scopeDescription, activityType, productCategory
- **relations**: isDefinedIn→CertificationRecord

## Approval Event
- **genus**: `bfo:0000015`
- **definition**: A process representing the specific historical instance where an organization was granted approval for a standard.
- **attributes**: approvalDate, approvalNumber, approvalType
- **relations**: grantsCertification→CertificationRecord, appliesToStandard→ManagementStandard
