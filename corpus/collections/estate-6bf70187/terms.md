# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Estate
- **genus**: `cco:ont00000995`
- **definition**: The aggregate of financial assets and liabilities held by an individual or couple at a point in time, subject to distribution upon death.
- **attributes**: identifier, ownerName, totalValue, currencyCode, creationDate, status
- **relations**: hasBeneficiaryDesignation→BeneficiaryDesignation, hasJointOwnership→JointOwnership, governedByWill→Will, subjectToIntestacy→IntestacyAct

## Beneficiary Designation
- **genus**: `cco:ont00000958`
- **definition**: A legal instrument specifying a named individual or entity to receive specific proceeds from an account or policy upon the owner's death.
- **attributes**: designationId, accountReference, namedBeneficiary, percentageShare, effectiveDate, revocable
- **relations**: appliesToAccount→InvestmentFundAccount, designatesPerson→Person

## Joint Ownership
- **genus**: `cco:ont00000995`
- **definition**: A legal arrangement where two or more individuals hold title to an asset with survivorship rights, allowing automatic transfer to the surviving owner upon death.
- **attributes**: ownershipId, assetType, survivorshipRight, registrationDate, jurisdiction, ownershipPercentage
- **relations**: coversAsset→InvestmentFundAccount, involvesOwner→Person

## Will
- **genus**: `cco:ont00000958`
- **definition**: A legal document expressing an individual's wishes regarding the distribution of their estate after death.
- **attributes**: willId, testatorName, executionDate, probateFiled, executorName, lastAmendmentDate
- **relations**: distributesEstate→Estate, namesBeneficiary→Person

## Investment Fund Account
- **genus**: `cco:ont00000995`
- **definition**: A financial account holding investment assets that generates income and can be structured with specific ownership or beneficiary arrangements.
- **attributes**: accountNumber, fundType, taxEfficiency, currentBalance, currencyCode, accountStatus
- **relations**: heldByOwner→Person, generatesWithdrawal→SystematicWithdrawal, linkedToDesignation→BeneficiaryDesignation, linkedToJointOwnership→JointOwnership

## Systematic Withdrawal
- **genus**: `bfo:0000015`
- **definition**: A recurring financial transaction where a fixed amount is distributed from an investment fund account to a recipient on a scheduled basis.
- **attributes**: withdrawalId, frequency, amount, startDate, endDate, taxLiabilityShare
- **relations**: originatesFromAccount→InvestmentFundAccount, depositedToBankAccount→BankAccount, sharedWith→Person

## Person
- **genus**: `bfo:0000002`
- **definition**: A human individual who acts as an owner, beneficiary, or recipient in estate planning and financial transactions.
- **attributes**: personId, fullName, dateOfBirth, relationshipToTestator, taxResidency, generation
- **relations**: ownsAccount→InvestmentFundAccount, namedInWill→Will, receivesWithdrawal→SystematicWithdrawal, holdsJointOwnership→JointOwnership

## Bank Account
- **genus**: `cco:ont00000995`
- **definition**: A financial account held at a banking institution used for depositing funds and facilitating transactions.
- **attributes**: accountNumber, bankName, accountType, currencyCode, openDate, status
- **relations**: receivesDeposit→SystematicWithdrawal, ownedBy→Person
