# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Business Entity
- **genus**: `bfo:0000040`
- **definition**: An independent economic agent engaged in commercial activities, including sole proprietorships, partnerships, and corporations.
- **attributes**: registrationNumber, legalForm, registrationDate, jurisdiction, status, taxIdentificationNumber
- **relations**: registeredIn→Jurisdiction, operatesInMarketStructure→MarketStructure, employs→Employee, generates→FinancialStatement

## Jurisdiction
- **genus**: `bfo:0000040`
- **definition**: A legal territory or governmental authority responsible for regulating business activities and enforcing laws.
- **attributes**: countryCode, countryName, registrationAuthority, taxRate, legalFrameworkVersion
- **relations**: regulates→BusinessEntity, issues→BusinessLicense

## Market Structure
- **genus**: `bfo:0000040`
- **definition**: A classification of market conditions based on the degree of competition and number of firms, such as perfect competition, monopoly, oligopoly, or monopolistic competition.
- **attributes**: structureType, numberOfFirms, barrierToEntry, priceControl, productDifferentiation
- **relations**: hosts→BusinessEntity, influencedBy→GovernmentPolicy

## Government Policy
- **genus**: `bfo:0000040`
- **definition**: A formal measure or regulation implemented by a state to support, regulate, or influence business activities and market conditions.
- **attributes**: policyId, policyType, issuingAuthority, effectiveDate, expirationDate, targetSector
- **relations**: appliesTo→BusinessEntity, implementedBy→Jurisdiction, supports→InnovativeBusiness

## Innovative Business
- **genus**: `bfo:0000040`
- **definition**: A business entity characterized by the development and application of new technologies, products, or processes to gain competitive advantage.
- **attributes**: innovationType, patentCount, rAndDInvestment, marketShare, growthRate
- **relations**: isTypeOf→BusinessEntity, utilizes→IntellectualProperty, receivesSupportFrom→GovernmentPolicy

## Intellectual Property
- **genus**: `bfo:0000040`
- **definition**: A creation of the mind, such as an invention, literary or artistic work, design, symbol, name, or image, used in commerce.
- **attributes**: ipId, ipType, registrationDate, expirationDate, owner, jurisdiction
- **relations**: ownedBy→BusinessEntity, protectedUnder→Jurisdiction

## Financial Statement
- **genus**: `bfo:0000040`
- **definition**: A formal record of the financial activities and position of a business entity, such as an income statement, balance sheet, or cash flow statement.
- **attributes**: statementId, statementType, reportingPeriod, totalRevenue, totalExpenses, netIncome, preparedBy, auditStatus
- **relations**: belongsToMany→BusinessEntity, auditedBy→Auditor

## Auditor
- **genus**: `bfo:0000040`
- **definition**: A qualified professional or firm responsible for examining and verifying the accuracy of financial statements.
- **attributes**: auditorId, auditorName, licenseNumber, firmName, certificationBody
- **relations**: audits→FinancialStatement
