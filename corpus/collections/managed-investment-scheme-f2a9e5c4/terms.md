# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Managed Investment Scheme
- **genus**: `cco:ont00000995`
- **definition**: A collective investment vehicle structured as an unlisted scheme where investors acquire units representing beneficial ownership.
- **attributes**: arsn, schemeName, status, listingStatus, responsibleEntity
- **relations**: hasResponsibleEntity→AuthorisedRepresentative, issuesUnitsTo→Investor

## Authorised Representative
- **genus**: `bfo:0000023`
- **definition**: An individual or entity authorised to provide financial services and give financial product advice on behalf of a licence holder.
- **attributes**: repId, repName, authorisationDate, authorisationStatus, licensingEntity
- **relations**: actsOnBehalfOf→ManagedInvestmentScheme, receivesRemunerationFrom→FinancialProduct

## Financial Product
- **genus**: `cco:ont00000995`
- **definition**: A financial instrument or service, such as a unit in a managed investment scheme, that is offered to investors.
- **attributes**: productId, productType, issuePrice, managementFee, riskRating
- **relations**: issuedBy→ManagedInvestmentScheme, coveredByPDS→ProductDisclosureStatement

## Product Disclosure Statement
- **genus**: `cco:ont00000958`
- **definition**: A statutory document providing detailed information about a financial product, including terms, risks, and fees, required before an investor acquires units.
- **attributes**: pdsId, issueDate, versionNumber, regulatoryStatus, documentUrl
- **relations**: describesProduct→FinancialProduct, providedTo→Investor

## Investor
- **genus**: `bfo:0000015`
- **definition**: An individual or entity that acquires units in a managed investment scheme and receives financial services.
- **attributes**: investorId, investorName, registrationDate, accountStatus, totalInvestment
- **relations**: acquiresUnitsIn→ManagedInvestmentScheme, receivesAdviceFrom→AuthorisedRepresentative

## Remuneration Event
- **genus**: `bfo:0000015`
- **definition**: A transaction or fee payment where an authorised representative or scheme receives compensation for financial services provided to an investor.
- **attributes**: eventId, eventDate, amount, feeType, currency
- **relations**: paidTo→AuthorisedRepresentative, derivedFromInvestment→Investor
