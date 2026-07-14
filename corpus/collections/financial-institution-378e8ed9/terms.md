# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Financial Institution
- **genus**: `cco:ont00000995`
- **definition**: A regulated banking entity or holding company subject to federal oversight and anti-money laundering requirements.
- **attributes**: institutionId, legalName, headquartersCity, headquartersCountry, charterType, fedMemberStatus, regulatoryStatus
- **relations**: hasSubsidiary→FinancialInstitution, subjectToRegulation→RegulatoryFramework, subjectToInvestigation→ComplianceInvestigation

## Compliance Investigation
- **genus**: `bfo:0000015`
- **definition**: A formal regulatory inquiry or audit into a financial institution's adherence to anti-money laundering and banking laws.
- **attributes**: investigationId, initiationDate, status, issuingAuthority, findingSeverity, penaltyAmount
- **relations**: targetsInstitution→FinancialInstitution, citesPriorFinding→ComplianceInvestigation, documentsDeficiency→ComplianceDeficiency

## Compliance Deficiency
- **genus**: `cco:ont00000995`
- **definition**: A documented failure or systemic weakness in a financial institution's internal controls, risk management, or reporting procedures.
- **attributes**: deficiencyId, category, description, discoveryDate, remediationStatus
- **relations**: reportedBy→ComplianceInvestigation, affectsDivision→BankingDivision, involvesClient→HighRiskClient

## Banking Division
- **genus**: `cco:ont00000995`
- **definition**: A specialized operational unit within a financial institution responsible for specific client segments or services.
- **attributes**: divisionCode, divisionName, oversightLevel, complianceOfficerId
- **relations**: partOfInstitution→FinancialInstitution, managesClient→HighRiskClient, subjectToDeficiency→ComplianceDeficiency

## High-Risk Client
- **genus**: `bfo:0000004`
- **definition**: An individual or entity subject to enhanced scrutiny due to political exposure, wealth, or association with sanctioned jurisdictions.
- **attributes**: clientId, clientType, riskRating, jurisdiction, relationshipStatus
- **relations**: heldAtInstitution→FinancialInstitution, managedByDivision→BankingDivision, triggersReport→SuspiciousActivityReport

## Suspicious Activity Report
- **genus**: `cco:ont00000995`
- **definition**: A formal regulatory filing documenting transactions or behaviors that suggest potential money laundering or financial crime.
- **attributes**: sarId, filingDate, status, triggeringTransactionId, flaggingSpecialistId
- **relations**: concernsClient→HighRiskClient, generatedByDivision→BankingDivision, suppressedBy→ComplianceDeficiency
