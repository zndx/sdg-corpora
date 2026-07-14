# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Ethical Policy Report
- **genus**: `cco:ont00000958`
- **definition**: A formal document produced by a financial institution detailing its ethical criteria, values, and compliance with human rights standards.
- **attributes**: reportId, publishDate, reportTitle, issuingInstitution, complianceStatus
- **relations**: issuedBy→FinancialInstitution, cites→HumanRightsReport

## Financial Institution
- **genus**: `bfo:0000015`
- **definition**: An organization that provides financial services, including banking, insurance, and investment management.
- **attributes**: institutionId, institutionName, headquartersLocation, customerCount, ethicalPolicyAdopted
- **relations**: offers→InsuranceProduct, partnersWith→InsuranceProvider, investsIn→CorporateEntity

## Insurance Product
- **genus**: `cco:ont00000995`
- **definition**: A financial product or service provided by an insurance company, such as travel insurance, underwritten by a specific provider.
- **attributes**: productId, productName, productType, underwriter, coverageScope
- **relations**: underwrittenBy→InsuranceProvider, distributedBy→FinancialInstitution

## Corporate Entity
- **genus**: `bfo:0000015`
- **definition**: A legally recognized business organization, including banks, insurers, and industrial companies, subject to investment and regulatory scrutiny.
- **attributes**: entityId, entityName, industrySector, countryOfOperation, unDatabaseListed
- **relations**: investedInBy→FinancialInstitution, operatesIn→Territory, finances→SettlementProject

## Territory
- **genus**: `bfo:0000002`
- **definition**: A defined geographical area, including occupied lands, settlements, or regions subject to political and legal jurisdiction.
- **attributes**: territoryId, territoryName, legalStatus, coordinates, recognizedByUN
- **relations**: contains→SettlementProject, subjectTo→HumanRightsViolation

## Settlement Project
- **genus**: `bfo:0000015`
- **definition**: A construction or development initiative in occupied territories, including residential, commercial, or infrastructure projects.
- **attributes**: projectId, projectName, projectType, constructionStatus, fundingAmount
- **relations**: locatedIn→Territory, financedBy→CorporateEntity, causes→HumanRightsViolation

## Human Rights Violation
- **genus**: `bfo:0000015`
- **definition**: An act or systematic practice that infringes upon the fundamental rights and freedoms of individuals or groups, as defined by international law.
- **attributes**: violationId, violationType, severityLevel, dateReported, documentedBy
- **relations**: occursIn→Territory, perpetratedBy→CorporateEntity, affects→PopulationGroup

## Population Group
- **genus**: `bfo:0000002`
- **definition**: A distinct demographic or ethnic community subject to specific legal, social, or political conditions.
- **attributes**: groupId, groupName, populationSize, legalStatus, prisonerCount
- **relations**: affectedBy→HumanRightsViolation, residesIn→Territory
