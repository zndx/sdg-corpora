# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Person
- **genus**: `bfo:0000040`
- **definition**: A real material entity that is a human being.
- **attributes**: personId, fullName, startDate, endDate, status
- **relations**: holdsRole→Role, workedAt→Organization

## Role
- **genus**: `bfo:0000023`
- **definition**: A realizable entity that inheres in an entity in virtue of the ability to change the disposition of, or produce a change in, other entities.
- **attributes**: roleName, startDate, endDate, status
- **relations**: heldBy→Person, inOrganization→Organization

## Organization
- **genus**: `bfo:0000040`
- **definition**: A real material entity that is a social group or institution.
- **attributes**: orgId, orgName, foundingDate, status
- **relations**: employs→Person, hasRole→Role

## Strategic Objective
- **genus**: `bfo:0000040`
- **definition**: A real material entity that represents a goal or target for an organization.
- **attributes**: objectiveId, objectiveName, startDate, endDate, status
- **relations**: pursuedBy→Organization, supportedBy→Project

## Project
- **genus**: `bfo:0000040`
- **definition**: A real material entity that represents a planned set of activities to achieve a specific goal.
- **attributes**: projectId, projectName, startDate, endDate, status
- **relations**: supports→StrategicObjective, executedBy→Person

## Policy
- **genus**: `bfo:0000040`
- **definition**: A real material entity that represents a course or principle of action adopted or proposed by an organization.
- **attributes**: policyId, policyName, startDate, endDate, status
- **relations**: developedBy→Organization, supports→StrategicObjective
