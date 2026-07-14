# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Divine Person
- **genus**: `bfo:0000040`
- **definition**: A distinct person within the Trinity (Father, Son, Holy Spirit) possessing divine attributes and roles in creation and redemption.
- **attributes**: hasName, hasRole, hasNature, hasPosition
- **relations**: participatesIn→DivineAct, isSubjectOf→TheologicalProposition

## Divine Act
- **genus**: `bfo:0000015`
- **definition**: A specific action or event performed by the Divine Persons, such as creation, incarnation, atonement, or resurrection.
- **attributes**: hasActType, hasTemporalPhase, hasLocation, hasOutcome
- **relations**: performedBy→DivinePerson, affects→Humanity, enables→Salvation

## Humanity
- **genus**: `bfo:0000040`
- **definition**: The collective human race, created in the image of God, subject to sin, and the object of divine redemption.
- **attributes**: hasImageStatus, hasSinCondition, hasReconciliationStatus, hasEternalDestiny
- **relations**: createdBy→DivinePerson, affectedBy→DivineAct, participatesIn→Church

## Salvation
- **genus**: `bfo:0000015`
- **definition**: The process of reconciliation with God through faith, involving regeneration by the Spirit and justification by Christ's work.
- **attributes**: hasSource, hasMechanism, hasRecipient, hasResult
- **relations**: causedBy→DivineAct, receivedBy→Humanity, mediatedBy→DivinePerson

## Church
- **genus**: `bfo:0000002`
- **definition**: The spiritual unity of believers, comprising the one body of Christ, responsible for fulfilling the Great Commission.
- **attributes**: hasRole, hasMission, hasUnityType, hasResponsibility
- **relations**: composedOf→Humanity, ledBy→DivinePerson, executes→DivineAct

## Theological Proposition
- **genus**: `bfo:0000030`
- **definition**: A core belief or doctrinal statement regarding the nature of God, humanity, and salvation.
- **attributes**: hasPropositionType, hasAuthority, hasTruthValue, hasScope
- **relations**: describes→DivinePerson, describes→Humanity, supports→Salvation
