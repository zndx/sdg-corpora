# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Financial Institution
- **genus**: `cco:ont00000995`
- **definition**: A regulated entity that provides financial services and is subject to anti-money laundering and sanctions compliance obligations.
- **attributes**: institutionId, legalName, jurisdiction, marketValueRank, establishedYear, isCrossBorder, regulatoryStatus
- **relations**: uses→SanctionsScreeningTool, acquired→FinancialInstitution, subjectTo→RegulatoryAgency

## Sanctions Screening Tool
- **genus**: `cco:ont00000995`
- **definition**: A software-as-a-service system that filters financial transactions against global sanctions lists to ensure regulatory compliance.
- **attributes**: toolId, provider, deploymentModel, implementationMonths, costPercentage, lastUpdated, listCoverage, isAutoUpdating
- **relations**: deployedAt→FinancialInstitution, references→SanctionsList, trainedBy→ConsultancyTeam

## Sanctions List
- **genus**: `cco:ont00000995`
- **definition**: A curated dataset of restricted persons and entities issued by a regulatory authority for compliance screening.
- **attributes**: listId, issuingAuthority, effectiveDate, expirationDate, recordCount, listType
- **relations**: referencedBy→SanctionsScreeningTool, issuedBy→RegulatoryAgency

## Regulatory Agency
- **genus**: `cco:ont00000995`
- **definition**: A governmental or supranational body that enforces financial regulations and publishes sanctions lists.
- **attributes**: agencyId, agencyName, jurisdiction, isInternational, foundedYear, enforcementLevel
- **relations**: issues→SanctionsList, oversees→FinancialInstitution

## Compliance Training
- **genus**: `bfo:0000015`
- **definition**: A structured educational activity conducted to prepare staff for using sanctions screening tools and meeting regulatory deadlines.
- **attributes**: trainingId, startDate, endDate, location, attendeeCount, isCompleted, followUpFrequency
- **relations**: conductedFor→FinancialInstitution, deliveredBy→ConsultancyTeam, enables→SanctionsScreeningTool

## Consultancy Team
- **genus**: `cco:ont00000995`
- **definition**: A group of specialists provided by a service vendor to assist with the implementation and training of compliance software.
- **attributes**: teamId, vendorName, primaryRegion, specialization, isActive
- **relations**: supports→FinancialInstitution, delivers→ComplianceTraining, affiliatedWith→SanctionsScreeningTool
