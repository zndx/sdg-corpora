# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Drug Application
- **genus**: `cco:ont00000958`
- **definition**: A regulatory submission document filed with a health authority to obtain marketing authorization for a pharmaceutical product.
- **attributes**: applicationId, applicationType, drugSubstance, approvalStatus, filingDate, approvalDate, therapeuticIndication, dosageForm, strength, regulatoryAuthority
- **relations**: transferredTo→PharmaceuticalCompany, transferredFrom→PharmaceuticalCompany, coversDrugSubstance→ActivePharmaceuticalIngredient, approvedForMarket→GeographicRegion, hasTransactionRecord→AssetTransfer

## Pharmaceutical Company
- **genus**: `bfo:0000040`
- **definition**: A legal entity engaged in the research, development, manufacturing, or marketing of pharmaceutical products.
- **attributes**: companyId, companyName, stockTicker, stockExchange, isIncorporated, headquartersLocation, primaryTherapeuticArea, manufacturingCapacity, apiSupplier, finishedDosageManufacturer
- **relations**: ownsApplication→DrugApplication, transfersApplication→DrugApplication, receivesApplication→DrugApplication, suppliesApi→ActivePharmaceuticalIngredient, operatesInRegion→GeographicRegion, hasSubsidiary→PharmaceuticalCompany, hasRnDLocation→GeographicRegion

## Active Pharmaceutical Ingredient
- **genus**: `cco:ont00000995`
- **definition**: A substance intended to furnish pharmacological activity or other direct effect in the diagnosis, cure, mitigation, treatment, or prevention of disease.
- **attributes**: apiId, apiName, chemicalClass, therapeuticClass, molecularWeight, solubility, storageCondition, shelfLifeMonths, regulatoryStatus, firstLineTherapy
- **relations**: includedInApplication→DrugApplication, manufacturedBy→PharmaceuticalCompany, suppliedTo→PharmaceuticalCompany, treatsCondition→Disease, hasSynthesisProcess→ManufacturingProcess

## Geographic Region
- **genus**: `bfo:0000004`
- **definition**: A spatial entity defined by political, administrative, or geographical boundaries relevant to regulatory or market operations.
- **attributes**: regionId, regionName, countryCode, regionType, regulatoryAuthority, marketSize, prevalenceRate, currencyCode, languageCode, timeZone
- **relations**: hostsCompany→PharmaceuticalCompany, hostsRnD→PharmaceuticalCompany, marketForDrug→DrugApplication, affectedByDisease→Disease, jurisdictionForRegulation→DrugApplication

## Asset Transfer
- **genus**: `bfo:0000015`
- **definition**: A transactional process involving the conveyance of intellectual property rights, regulatory approvals, or commercial assets between entities.
- **attributes**: transferId, transferDate, transferValue, paymentStructure, status, currency, effectiveDate, expirationDate, governingLaw, confidentialityLevel
- **relations**: involvesAsset→DrugApplication, initiatedBy→PharmaceuticalCompany, receivedBy→PharmaceuticalCompany, coversRegion→GeographicRegion, includesPayment→Payment, relatedToTransaction→AssetTransfer

## Payment
- **genus**: `bfo:0000015`
- **definition**: A financial transaction representing consideration exchanged as part of a commercial or regulatory agreement.
- **attributes**: paymentId, paymentAmount, paymentDate, paymentType, currency, status, triggerCondition, recipient, payer, taxWithheld
- **relations**: partOfTransfer→AssetTransfer, paidTo→PharmaceuticalCompany, paidBy→PharmaceuticalCompany, linkedToMilestone→Milestone, calculatedForRegion→GeographicRegion

## Disease
- **genus**: `bfo:0000002`
- **definition**: A pathological condition of a part, organ, or system of an organism characterized by a distinctive set of symptoms and signs.
- **attributes**: diseaseId, diseaseName, icdCode, prevalence, incidence, mortalityRate, chronicStatus, transmissionRoute, primaryTreatment, globalBurden
- **relations**: treatedByDrug→ActivePharmaceuticalIngredient, affectsRegion→GeographicRegion, hasCarrierCount→GeographicRegion, monitoredBy→HealthAuthority, classifiedUnder→DiseaseCategory
