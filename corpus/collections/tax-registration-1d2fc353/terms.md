# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Tax Registration
- **genus**: `cco:ont00000995`
- **definition**: A formal record of a trader's enrollment in the Goods and Services Tax (GST) regime, issued by the government upon verification of eligibility and documentation.
- **attributes**: registrationId, issueDate, expiryDate, status, turnoverThreshold, stateOfRegistration, applicationSubmissionDate, isExempted
- **relations**: issuedTo→Trader, coversState→Jurisdiction, grantsInputTaxCredit→InputTaxCredit

## Trader
- **genus**: `bfo:0000015`
- **definition**: An individual or business entity engaged in the supply of taxable goods or services, subject to GST registration requirements based on turnover thresholds.
- **attributes**: traderId, legalName, panNumber, contactEmail, contactMobile, annualAggregateTurnover, isSpecialCategoryState, registrationStatus
- **relations**: holdsRegistration→TaxRegistration, operatesIn→Jurisdiction, suppliesTo→TaxableSupply

## Jurisdiction
- **genus**: `bfo:0000002`
- **definition**: A geographical or administrative area (State or Union Territory) where a trader makes taxable supplies and is subject to GST regulations.
- **attributes**: jurisdictionCode, jurisdictionName, jurisdictionType, isSpecialCategory, turnoverThreshold
- **relations**: coversTrader→Trader, issuesRegistration→TaxRegistration

## Taxable Supply
- **genus**: `bfo:0000015`
- **definition**: The act of supplying goods or services that are subject to GST, excluding exempted goods or services.
- **attributes**: supplyId, supplyDate, supplyType, isExempted, value, taxRate
- **relations**: madeBy→Trader, receivedBy→Trader, occursIn→Jurisdiction

## Input Tax Credit
- **genus**: `cco:ont00000995`
- **definition**: A financial benefit allowing a registered trader to claim credit for taxes paid on inputs, reducing the overall tax liability on outputs.
- **attributes**: creditId, creditAmount, creditDate, status, linkedSupplyId
- **relations**: claimedBy→Trader, derivedFrom→TaxableSupply, reducesLiabilityFor→TaxRegistration

## Training Centre
- **genus**: `cco:ont00000995`
- **definition**: A physical or virtual facility established to provide training and certification for GST practitioners or other skilled workers under government missions.
- **attributes**: centreId, centreName, centreType, inaugurationDate, location, capacity
- **relations**: operatedBy→GovernmentAgency, supportsMission→GovernmentMission, certifies→Practitioner

## Government Mission
- **genus**: `bfo:0000015`
- **definition**: A national initiative or campaign launched by the government to promote skill development, entrepreneurship, or specific policy objectives like GST compliance.
- **attributes**: missionId, missionName, launchDate, anniversaryYear, objective
- **relations**: launchedBy→GovernmentAgency, supportedBy→Company, institutesCentres→TrainingCentre

## Government Agency
- **genus**: `bfo:0000015`
- **definition**: A state body responsible for implementing policies, missions, and regulatory frameworks such as GST registration and skill development programs.
- **attributes**: agencyId, agencyName, ministry, establishedDate
- **relations**: launchesMission→GovernmentMission, operatesCentres→TrainingCentre, enforcesRegistration→TaxRegistration
