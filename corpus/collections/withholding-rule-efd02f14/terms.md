# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Withholding Rule
- **genus**: `bfo:0000015`
- **definition**: A regulatory process and legal requirement mandating the deduction of three percent of payments for supplies and services provided to governmental entities as income tax.
- **attributes**: ruleIdentifier, effectiveDate, withholdingRate, paymentThreshold, status, issuingAgency
- **relations**: appliesTo→Payment, governedBy→Statute

## Payment
- **genus**: `bfo:0000015`
- **definition**: A financial disbursement made by a governmental entity to a prime contractor for supplies, services, or property, subject to withholding regulations.
- **attributes**: paymentIdentifier, amount, disbursementDate, paymentType, isWithheld, withholdingAmount
- **relations**: madeBy→GovernmentalEntity, madeTo→Contractor, derivedFrom→Contract

## Government Contract
- **genus**: `bfo:00000995`
- **definition**: A legally binding agreement between a governmental entity and a prime contractor for the provision of property or services, subject to specific withholding exceptions based on execution date.
- **attributes**: contractIdentifier, executionDate, totalValue, contractType, isMateriallyModified, modificationDate
- **relations**: awardedBy→GovernmentalEntity, awardedTo→Contractor, generates→Payment

## Governmental Entity
- **genus**: `bfo:0000040`
- **definition**: A federal, state, or local government, including political subdivisions and instrumentalities, that disburses funds for supplies and services.
- **attributes**: entityIdentifier, entityName, jurisdictionLevel, annualPaymentVolume, isInstrumentality
- **relations**: disburses→Payment, awards→Contract

## Prime Contractor
- **genus**: `bfo:0000040`
- **definition**: An individual or entity providing property or services to a governmental entity, to whom payments are made and from whom withholding is deducted.
- **attributes**: contractorIdentifier, contractorName, contractorType, taxIdentificationNumber
- **relations**: receives→Payment, holds→Contract

## Statute
- **genus**: `bfo:0000015`
- **definition**: A legislative act or code section that mandates or modifies the withholding requirements, such as TIPRA or ARRA.
- **attributes**: statuteIdentifier, statuteName, enactmentDate, sectionNumber, amends
- **relations**: mandates→WithholdingRule
