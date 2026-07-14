# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Federal Tax Regulation
- **genus**: `cco:ont00000958`
- **definition**: A formal document issued by the IRS that provides proposed or final rules for interpreting and applying federal tax statutes.
- **attributes**: regulationId, title, publicationDate, status, effectiveDate, hearingDate, federalRegisterCitation
- **relations**: implements→TaxStatute, appliesTo→Taxpayer, governs→TaxDeduction

## Federal Tax Statute
- **genus**: `cco:ont00000958`
- **definition**: A legislative act passed by Congress that establishes the legal framework for federal taxation.
- **attributes**: statuteCode, sectionNumber, enactmentDate, shortTitle, longTitle, amendmentStatus
- **relations**: creates→TaxDeduction, defines→DisqualifiedActivity, setsThreshold→IncomeThreshold

## Pass-Through Deduction
- **genus**: `bfo:0000015`
- **definition**: A financial reduction in taxable income allowed under Section 199A for qualifying pass-through business income.
- **attributes**: deductionPercentage, maxDeductionAmount, effectiveTaxRate, phaseInThreshold, phaseOutThreshold, appliesToAMT, affectsBasis, affectsNII
- **relations**: reduces→TaxableIncome, dependsOn→QualifiedBusinessIncome, limitedBy→WageAssetTest, excludedFor→DisqualifiedActivity

## Qualified Business Income
- **genus**: `cco:ont00000995`
- **definition**: The net amount of income, gain, deduction, and loss from a qualified trade or business conducted in the United States.
- **attributes**: incomeAmount, lossAmount, netQBI, carriedForwardLoss, sourceType, isSSTB, calculationYear
- **relations**: generatedBy→TradeOrBusiness, subjectTo→WageAssetTest, reducedBy→DisqualifiedActivity, includedIn→TaxableIncome

## Trade or Business Entity
- **genus**: `bfo:0000015`
- **definition**: An ongoing commercial or industrial enterprise engaged in profit-seeking activities, including sole proprietorships, partnerships, and S corporations.
- **attributes**: entityType, employerId, location, isSSTB, totalWagesPaid, unadjustedBasisOfProperty, taxYear
- **relations**: employs→Taxpayer, generates→QualifiedBusinessIncome, subjectTo→WageAssetTest, classifiedAs→DisqualifiedActivity

## Wage and Asset Limitation Test
- **genus**: `bfo:0000015`
- **definition**: A calculation used to determine the allowable pass-through deduction based on the wages paid by the business and the unadjusted basis of tangible depreciable property.
- **attributes**: wageLimit, assetLimit, combinedLimit, phaseInPercentage, isFullyApplicable, testYear
- **relations**: evaluates→TradeOrBusiness, limits→TaxDeduction, usesDataFrom→Taxpayer

## Specified Service Trade or Business
- **genus**: `bfo:0000023`
- **definition**: A trade or business involving services in fields such as health, law, accounting, or consulting that is generally excluded from the pass-through deduction.
- **attributes**: activityCode, activityName, isDeMinimis, deMinimisThreshold, antiAbuseRule, exclusionStatus
- **relations**: classifies→TradeOrBusiness, excludes→TaxDeduction, subjectTo→TaxRegulation
