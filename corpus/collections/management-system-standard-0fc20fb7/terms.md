# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Management System Standard
- **genus**: `cco:ont00000958`
- **definition**: A formalized set of requirements and guidelines for a specific management system, such as ISO 9001 or ISO 14001.
- **attributes**: standardIdentifier, publicationDate, issuingBody, standardType, versionNumber, status
- **relations**: hasCertificate→CertificationRecord, appliesTo→Organization

## Certification Record
- **genus**: `cco:ont00000995`
- **definition**: A formal record documenting the issuance of a management system certificate to an organization, including the standard, date, and scope.
- **attributes**: certificateId, issueDate, expiryDate, scopeDescription, certificationBody, status
- **relations**: certifies→Organization, basedOnStandard→ManagementSystemStandard

## Organization
- **genus**: `bfo:0000040`
- **definition**: A social entity that is structured and managed, such as a company, university, or factory.
- **attributes**: organizationId, legalName, country, region, industrySector, employeeCount
- **relations**: holdsCertificate→CertificationRecord, implementsStandard→ManagementSystemStandard

## Geographic Region
- **genus**: `bfo:0000004`
- **definition**: A defined spatial area, such as a country or region, used for statistical aggregation of certification data.
- **attributes**: regionCode, regionName, continent
- **relations**: contains→Organization, hasCertificationData→CertificationStatistic

## Certification Statistic
- **genus**: `cco:ont00000995`
- **definition**: A quantitative record of the number of certificates issued for a specific standard within a defined geographic region and time period.
- **attributes**: statisticId, reportDate, totalCertificates, standardSpecificCount
- **relations**: describesRegion→GeographicRegion, referencesStandard→ManagementSystemStandard
