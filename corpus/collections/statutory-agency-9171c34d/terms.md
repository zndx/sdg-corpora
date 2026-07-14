# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Statutory Agency
- **genus**: `bfo:0000040`
- **definition**: A legally established public entity with a defined mission and governance structure, such as a state development corporation.
- **attributes**: agencyIdentifier, agencyName, parentDepartment, statutoryReference, fiscalYear, isConsolidated
- **relations**: hasStaffingPlan→StaffingPlan, executesMission→MissionStatement, receivesAdministrativeSupport→AdministrativeUnit

## Mission Statement
- **genus**: `bfo:0000040`
- **definition**: A formal declaration of an agency's purpose, duties, and operational scope as defined by statute.
- **attributes**: missionId, missionText, isSubsetOf, requiresSpecializedExpertise, fundingMechanism
- **relations**: belongsToMany→StatutoryAgency

## Staffing Plan
- **genus**: `bfo:0000040`
- **definition**: A structured record of personnel requirements, roles, and salary allocations necessary to execute an agency's mission.
- **attributes**: planId, positionTitle, fullTimeEquivalent, salaryRange, isExecutive, requiresSpecializedSkills
- **relations**: supports→StatutoryAgency, isPartOf→AdministrativeUnit

## Administrative Unit
- **genus**: `bfo:0000040`
- **definition**: An organizational subunit responsible for providing operational, financial, or clerical support to one or more agencies.
- **attributes**: unitCode, unitName, supportType, staffCount, budgetAllocation
- **relations**: serves→StatutoryAgency, employs→StaffingPlan

## Consolidation Impact
- **genus**: `bfo:0000040`
- **definition**: A recorded assessment of the financial, operational, and staffing consequences of merging two or more statutory agencies.
- **attributes**: impactId, costSavings, salarySavings, positionCountChange, efficiencyGain, requiresNewInfrastructure
- **relations**: affects→StatutoryAgency, evaluates→MissionStatement
