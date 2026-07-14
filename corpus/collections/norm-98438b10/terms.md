# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Norm
- **genus**: `bfo:0000015`
- **definition**: A conditional standard of behaviour that imposes an obligation or prohibition on an agent, triggered by specific environmental states and enforced via sanctions or regimentation.
- **attributes**: normId, normType, triggerCondition, deadlineCondition, enforcementMode, sanctionType
- **relations**: appliedIn→PhysicalTransitionSystem, triggers→NormViolation, imposes→Sanction

## Physical Transition System
- **genus**: `bfo:0000015`
- **definition**: A computational model describing the state transitions and propositional valuations of a multi-agent system environment.
- **attributes**: systemId, initialStateId, stateCount, transitionRelationId, valuationFunctionId, physicalAtoms, sanctionAtoms
- **relations**: contains→State, defines→Transition, hosts→Norm

## State
- **genus**: `bfo:0000015`
- **definition**: A discrete configuration of the multi-agent system at a specific point in time, defined by a set of satisfied propositional variables.
- **attributes**: stateId, stateIndex, isInitialState, satisfiedAtoms, timestamp
- **relations**: partOf→PhysicalTransitionSystem, transitionsTo→State, satisfies→Norm

## Transition
- **genus**: `bfo:0000015`
- **definition**: A directed relation between two states representing an action execution or state change within the multi-agent system.
- **attributes**: transitionId, actionId, precondition, effect
- **relations**: originatesFrom→State, terminatesAt→State, partOf→PhysicalTransitionSystem

## Norm Violation
- **genus**: `bfo:0000015`
- **definition**: An event where an agent fails to satisfy a norm's condition or deadline, triggering a sanction or regimentation.
- **attributes**: violationId, violationTimestamp, violationType, sanctionIncurment
- **relations**: causedBy→Norm, occursIn→State, triggers→Sanction

## Sanction
- **genus**: `bfo:0000015`
- **definition**: A punitive measure or constraint imposed on an agent as a consequence of violating a norm.
- **attributes**: sanctionId, sanctionType, severityLevel, isRegimented
- **relations**: imposedBy→Norm, resultingFrom→NormViolation, affects→Agent

## Agent
- **genus**: `bfo:0000015`
- **definition**: An autonomous entity within the multi-agent system capable of executing actions and subject to normative constraints.
- **attributes**: agentId, agentType, currentSanctionCount, maxAllowedSanctions
- **relations**: subjectTo→Norm, executes→Transition, incurs→Sanction
