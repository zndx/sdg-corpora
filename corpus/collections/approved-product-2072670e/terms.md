# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Approved Product
- **genus**: `cco:ont00000995`
- **definition**: A manufactured item that has been formally evaluated and granted approval status against a specific standard.
- **attributes**: productIdentifier, productName, nominalSizeRange, serviceCondition, materialType, approvalStatus
- **relations**: conformsTo→ApprovalStandard, grantedBy→ApprovingAuthority, manufacturedBy→Manufacturer

## Approval Standard
- **genus**: `cco:ont00000958`
- **definition**: A formal document or specification that defines the requirements and criteria for product approval.
- **attributes**: standardCode, standardTitle, publicationDate, issuingOrganization, versionNumber
- **relations**: supersedes→ApprovalStandard, isSupersededBy→ApprovalStandard

## Approving Authority
- **genus**: `bfo:0000023`
- **definition**: An organization or individual with the formal mandate to evaluate and grant approval status to products.
- **attributes**: authorityName, authorityType, jurisdiction, contactAddress, authorizationLevel
- **relations**: issuesApprovalFor→ApprovedProduct, enforcesStandard→ApprovalStandard

## Manufacturer
- **genus**: `bfo:0000023`
- **definition**: An entity responsible for the production and construction of the approved product.
- **attributes**: manufacturerName, legalForm, registeredAddress, countryOfOrigin, registrationNumber
- **relations**: produces→ApprovedProduct, subjectToSurveillanceBy→ApprovingAuthority

## Surveillance Audit
- **genus**: `bfo:0000015`
- **definition**: A periodic evaluation process conducted to verify ongoing conformity of the approved product to the standard.
- **attributes**: auditIdentifier, auditDate, auditOutcome, auditorName, findingsCount, nextAuditDue
- **relations**: evaluates→ApprovedProduct, conductedBy→ApprovingAuthority, verifiesConformityTo→ApprovalStandard
