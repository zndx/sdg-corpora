# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Managed Investment Scheme
- **genus**: `cco:ont00000995`
- **definition**: A collective investment vehicle structured as an unlisted scheme where investors hold units representing beneficial ownership.
- **attributes**: schemeIdentifier, schemeName, responsibleEntity, isUnlisted, establishmentDate
- **relations**: hasResponsibleEntity→FinancialLicence, issuesUnits→FinancialProduct

## Australian Financial Services Licence
- **genus**: `cco:ont00000995`
- **definition**: A regulatory authorisation issued by ASIC permitting the holder to provide financial services in Australia.
- **attributes**: licenceNumber, licenceHolder, issuingAuthority, status, complianceDate
- **relations**: authorisesRepresentative→AuthorisedRepresentative, coversInsurance→ProfessionalIndemnityPolicy

## Authorised Representative
- **genus**: `bfo:0000023`
- **definition**: An individual or entity authorised to provide financial services on behalf of a licence holder under an AFSL.
- **attributes**: representativeId, representativeName, authorisationDate, remunerationRate, contactEmail
- **relations**: actsForLicence→FinancialLicence, providesAdviceOn→FinancialProduct, receivesRemunerationFrom→ManagedInvestmentScheme

## Financial Product
- **genus**: `cco:ont00000995`
- **definition**: A financial instrument or service, such as units in a managed investment scheme, that can be advised on or dealt in.
- **attributes**: productType, productCode, issuePrice, minimumInvestment, riskRating
- **relations**: issuedByScheme→ManagedInvestmentScheme, subjectToAdvice→AuthorisedRepresentative, documentedByPDS→ProductDisclosureStatement

## Product Disclosure Statement
- **genus**: `cco:ont00000958`
- **definition**: A statutory document providing detailed information about a financial product to assist investors in making informed decisions.
- **attributes**: pdsId, issueDate, validUntilDate, totalFees, significantRisks
- **relations**: relatesToProduct→FinancialProduct, providedByLicence→FinancialLicence, receivedByInvestor→Investor

## Investor
- **genus**: `bfo:0000004`
- **definition**: An individual or entity that acquires units in a managed investment scheme.
- **attributes**: investorId, investorName, registrationDate, totalInvested, contactPhone
- **relations**: acquiresUnitsIn→ManagedInvestmentScheme, receivesAdviceFrom→AuthorisedRepresentative, submitsComplaintTo→ComplaintRecord

## Complaint Record
- **genus**: `cco:ont00000995`
- **definition**: A formal record of a complaint lodged by an investor regarding financial services provided.
- **attributes**: complaintId, lodgedDate, status, resolutionDate, escalatedTo
- **relations**: filedByInvestor→Investor, addressedByRepresentative→AuthorisedRepresentative, escalatedToExternalBody→ExternalOmbudsman

## External Ombudsman Service
- **genus**: `bfo:0000004`
- **definition**: An independent dispute resolution body, such as the Financial Ombudsman Service, that handles unresolved complaints.
- **attributes**: ombudsmanName, contactPhone, contactEmail, jurisdiction, establishedDate
- **relations**: handlesComplaintsFrom→ComplaintRecord
