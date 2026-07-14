# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Administrative Unit
- **genus**: `bfo:0000040`
- **definition**: A distinct organizational subdivision within a university's Vice President for Finance and Administration structure, such as a department, office, or service center.
- **attributes**: unitId, unitName, unitType, establishedDate, isSharedService, jurisdictionScope
- **relations**: hasHead→AdministrativeRole, providesServiceTo→StakeholderGroup, reportsTo→AdministrativeUnit

## Administrative Role
- **genus**: `bfo:0000023`
- **definition**: A specific position or title held by an individual within an administrative unit, defining their responsibilities and authority.
- **attributes**: roleId, roleTitle, roleLevel, appointmentDate, isChiefOfStaff, isChiefResilienceOfficer
- **relations**: heldBy→Person, assignedToUnit→AdministrativeUnit, oversees→AdministrativeUnit

## Person
- **genus**: `bfo:0000004`
- **definition**: A human being who holds an administrative role or is associated with the university's administrative structure.
- **attributes**: personId, firstName, lastName, emailAddress, employmentStatus, hireDate
- **relations**: holdsRole→AdministrativeRole, reportsTo→Person

## Service Function
- **genus**: `bfo:0000015`
- **definition**: A distinct operational activity or service provided by an administrative unit, such as payroll processing, facilities management, or risk assessment.
- **attributes**: functionId, functionName, functionCategory, isCoreFunction, serviceLevel
- **relations**: providedBy→AdministrativeUnit, supports→StakeholderGroup

## Stakeholder Group
- **genus**: `bfo:0000002`
- **definition**: A defined group of individuals or entities that receive services or are affected by the administrative units and their functions.
- **attributes**: groupCode, groupName, groupType, isEligibleForServices
- **relations**: receivesServiceFrom→ServiceFunction, isServedByUnit→AdministrativeUnit
