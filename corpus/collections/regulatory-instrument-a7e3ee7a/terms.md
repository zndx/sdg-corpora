# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Regulatory Instrument
- **genus**: `cco:ont00000958`
- **definition**: A formal legal or regulatory document that establishes rules, standards, or procedures for compliance within a specific jurisdiction.
- **attributes**: instrumentIdentifier, title, issuingAuthority, adoptionDate, publicationDate, entryIntoForceDate, status
- **relations**: supersedes→RegulatoryInstrument, amends→RegulatoryInstrument, governs→FinancialCounterparty

## Financial Counterparty
- **genus**: `bfo:0000040`
- **definition**: An entity, such as a UCITS or AIF, that engages in financial transactions and is subject to regulatory oversight under EMIR.
- **attributes**: counterpartyIdentifier, legalName, entityType, jurisdiction, registrationStatus, clearingThresholdExceeded
- **relations**: subjectTo→RegulatoryInstrument, entersInto→OTCDerivativeTrade, posts→Collateral

## OTC Derivative Trade
- **genus**: `bfo:0000015`
- **definition**: A privately negotiated financial contract between two parties that is not traded on a regulated exchange.
- **attributes**: tradeIdentifier, tradeDate, tradeType, settlementType, notionalAmount, currency, maturityDate, status
- **relations**: involves→FinancialCounterparty, governedBy→NettingAgreement, requires→Collateral, subjectTo→RegulatoryInstrument

## Netting Agreement
- **genus**: `cco:ont00000958`
- **definition**: A legal contract that allows for the netting of multiple obligations between counterparties into a single net amount.
- **attributes**: agreementIdentifier, agreementType, enforceabilityReviewStatus, reviewedBy, effectiveDate, terminationDate
- **relations**: governs→OTCDerivativeTrade, amendedBy→RegulatoryInstrument

## Collateral
- **genus**: `bfo:0000040`
- **definition**: An asset or security pledged by one party to another as security for the performance of a contract.
- **attributes**: collateralIdentifier, assetType, issuingEntity, creditQualityRating, denomination, eligibilityStatus, wrongWayRisk
- **relations**: postedBy→FinancialCounterparty, covers→OTCDerivativeTrade, governedBy→RegulatoryInstrument

## Credit Support Annex
- **genus**: `cco:ont00000958`
- **definition**: A legal document that specifies the terms and conditions for the exchange of collateral between counterparties.
- **attributes**: csaIdentifier, nettingSet, amendmentStatus, effectiveDate, terminationDate
- **relations**: partOf→NettingAgreement, governs→Collateral, amendedBy→RegulatoryInstrument
