# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## A person receiving direct support or services from the NGO
- **genus**: `bfo:0000040`
- **definition**: A person who receives direct support, services, or resources from the NGO's programs.
- **attributes**: beneficiaryId, fullName, age, gender, location, vulnerabilityStatus, householdId
- **relations**: receivesSupportFrom→Program, participatesIn→Activity, belongsHouseholdTo→Household

## A structured initiative or intervention implemented by the NGO
- **genus**: `bfo:0000040`
- **definition**: A structured initiative or intervention implemented by the NGO to address specific social or health issues.
- **attributes**: programId, programName, startDate, endDate, status, targetPopulation, budget, fundingSource
- **relations**: targetsBeneficiaries→Beneficiary, implementsActivities→Activity, reportsTo→Organization

## A specific action or event carried out under a program
- **genus**: `bfo:0000040`
- **definition**: A specific action or event carried out under a program to achieve its objectives.
- **attributes**: activityId, activityName, activityType, date, location, participantsCount, status, resourcesUsed
- **relations**: partOfProgram→Program, involvesBeneficiaries→Beneficiary, usesResources→Resource

## A tangible or intangible item used or distributed during activities
- **genus**: `bfo:0000040`
- **definition**: A tangible or intangible item used or distributed during activities to support beneficiaries.
- **attributes**: resourceId, resourceName, resourceType, quantity, unitCost, totalCost, distributionDate, status
- **relations**: usedInActivity→Activity, distributedToBeneficiaries→Beneficiary

## A family unit or living arrangement of beneficiaries
- **genus**: `bfo:0000040`
- **definition**: A family unit or living arrangement of beneficiaries receiving support.
- **attributes**: householdId, householdHead, numberOfMembers, location, economicStatus, vulnerabilityLevel, supportReceived
- **relations**: containsBeneficiaries→Beneficiary, receivesSupportFrom→Program

## The NGO or network the entity belongs to
- **genus**: `bfo:0000040`
- **definition**: The NGO or network the entity belongs to.
- **attributes**: orgId, orgName, orgType, establishedYear, location, status, membership
- **relations**: implementsPrograms→Program, hasMembers→Beneficiary
