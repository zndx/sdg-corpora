# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Corporate Entity
- **genus**: `cco:ont00000995`
- **definition**: A legally registered business organization that provides network, cloud, and IT managed services.
- **attributes**: legalName, tickerSymbol, marketListing, headquartersCountry, marketSegment
- **relations**: hasExecutive→CorporateExecutive, employsConsultant→Consultant, engagesFinancialAdvisor→FinancialAdvisor, engagesCommunicationsAdvisor→CommunicationsAdvisor

## Corporate Executive
- **genus**: `bfo:0000015`
- **definition**: A senior individual holding a strategic or operational leadership role within a corporate entity.
- **attributes**: fullName, jobTitle, reportingLine, appointmentStatus, primaryDomain
- **relations**: reportsTo→CorporateExecutive, previouslyEmployedAt→CorporateEntity, holdsRoleAt→CorporateEntity

## Consultant
- **genus**: `cco:ont00000995`
- **definition**: An external professional or firm providing specialized advisory services to a corporate entity.
- **attributes**: consultantName, serviceType, contactPhone, advisorRole
- **relations**: advises→CorporateEntity, represents→CorporateEntity

## Financial Advisor
- **genus**: `cco:ont00000995`
- **definition**: A specialized consultant providing financial, capital markets, or advisory services to a corporate entity.
- **attributes**: advisorFirmName, serviceCategory, contactPhone, advisorRepresentative
- **relations**: providesFinancialAdviceTo→CorporateEntity, represents→CorporateEntity

## Communications Advisor
- **genus**: `cco:ont00000995`
- **definition**: A specialized consultant providing public relations and corporate communications services to a corporate entity.
- **attributes**: prFirmName, serviceCategory, contactPhone, prRepresentative
- **relations**: managesCommunicationsFor→CorporateEntity, represents→CorporateEntity
