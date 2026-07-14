# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Client Asset Portfolio
- **genus**: `cco:ont00000995`
- **definition**: A collection of financial assets held in custody or administration for clients, subject to segregation and protection protocols.
- **attributes**: portfolioIdentifier, totalValueUSD, assetType, segregationStatus, custodianEntity, lastValuationDate, riskRating
- **relations**: coveredBy→InsurancePolicy, heldBy→FinancialInstitution, subjectTo→RegulatoryFramework

## Insurance Policy
- **genus**: `cco:ont00000995`
- **definition**: A contractual agreement providing financial protection against loss of client assets, such as SIPC coverage or excess Lloyd's policies.
- **attributes**: policyIdentifier, providerName, coverageLimitUSD, effectiveDate, expirationDate, ratingAgency, creditRating, policyType
- **relations**: covers→ClientAssetPortfolio, issuedBy→InsuranceUnderwriter, supersedes→InsurancePolicy

## Financial Institution
- **genus**: `cco:ont00000995`
- **definition**: A regulated entity providing financial services, custody, or administration of client assets, such as a broker-dealer or bank.
- **attributes**: institutionIdentifier, legalName, registrationStatus, netCapitalUSD, totalAssetsUSD, shareholdersEquityUSD, marketCapitalizationUSD, parentCompany
- **relations**: holds→ClientAssetPortfolio, insuredBy→InsurancePolicy, regulatedBy→RegulatoryFramework, auditedBy→AuditReport

## Regulatory Framework
- **genus**: `cco:ont00000958`
- **definition**: A set of rules, standards, or oversight mechanisms governing financial institutions and client asset protection, such as SEC or FINRA regulations.
- **attributes**: frameworkIdentifier, issuingAuthority, jurisdiction, complianceStatus, lastAuditDate, regulatoryType
- **relations**: governs→FinancialInstitution, appliesTo→ClientAssetPortfolio, enforcedBy→RegulatoryBody

## Audit Report
- **genus**: `cco:ont00000958`
- **definition**: A formal document detailing the evaluation of internal controls, financial status, or compliance of a financial institution or asset portfolio.
- **attributes**: reportIdentifier, auditFirm, reportDate, auditType, findingsSummary, complianceRating, scopeDescription
- **relations**: audits→FinancialInstitution, evaluates→ClientAssetPortfolio, references→RegulatoryFramework

## Insurance Underwriter
- **genus**: `cco:ont00000995`
- **definition**: An entity or market providing insurance coverage, such as Lloyd's of London, that issues policies to protect client assets.
- **attributes**: underwriterIdentifier, legalName, location, creditRating_SP, creditRating_AMBest, creditRating_Fitch, ratingDate
- **relations**: issues→InsurancePolicy, ratedBy→RatingAgency

## Rating Agency
- **genus**: `cco:ont00000995`
- **definition**: An organization that assigns credit or financial strength ratings to insurance underwriters or financial institutions.
- **attributes**: agencyIdentifier, agencyName, ratingMethodology, lastReviewDate
- **relations**: rates→InsuranceUnderwriter, rates→FinancialInstitution
