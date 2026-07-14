# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Legislative Act
- **genus**: `cco:ont00000958`
- **definition**: A formal statutory instrument enacted by a state legislature that amends existing law.
- **attributes**: actNumber, shortTitle, enactmentDate, assentDate, jurisdiction, status
- **relations**: amends→LegislativeAct, issuedBy→LegislativeBody

## Legislative Body
- **genus**: `bfo:0000015`
- **definition**: A governmental assembly empowered to enact, amend, or repeal statutes within a defined jurisdiction.
- **attributes**: bodyName, jurisdictionName, sessionYear, status
- **relations**: enacts→LegislativeAct

## Statutory Amendment
- **genus**: `bfo:0000015`
- **definition**: A specific legislative action that modifies the text, numbers, or clauses of an existing statute.
- **attributes**: amendmentId, targetSection, targetClause, originalValue, substitutedValue, amendmentType
- **relations**: appliesTo→LegislativeAct, executedBy→LegislativeBody

## Government Official
- **genus**: `bfo:0000023`
- **definition**: A person holding a designated public office responsible for certifying or promulgating legislative instruments.
- **attributes**: officialName, designation, department, certificationDate, status
- **relations**: certifies→LegislativeAct, holdsRoleIn→LegislativeBody
