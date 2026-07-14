# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Community Program
- **genus**: `bfo:0000040`
- **definition**: A structured social intervention or service initiative designed to address a specific community need or disadvantage through defined activities and resources.
- **attributes**: programIdentifier, programName, startDate, endDate, status, scope
- **relations**: hasLogicModel→LogicModel, addressesNeed→CommunityNeed, hasInput→ProgramInput, undertakesActivity→ProgramActivity, producesOutput→ProgramOutput, achievesOutcome→ProgramOutcome

## Logic Model
- **genus**: `bfo:0000040`
- **definition**: A graphic representation or flow chart that explicitly defines the causal linkages, assumptions, and components of a community program from inputs to long-term impact.
- **attributes**: modelIdentifier, layoutOrientation, creationDate, isVerified, isExplicit, isMeaningful
- **relations**: describesProgram→CommunityProgram, containsComponent→ProgramInput, containsComponent→ProgramActivity, containsComponent→ProgramOutput, containsComponent→ProgramOutcome, hasAssumption→CausalAssumption

## Community Need
- **genus**: `bfo:0000002`
- **definition**: A state of disadvantage, safety concern, or unmet requirement within a community that a program aims to address or change.
- **attributes**: needIdentifier, needDescription, severityLevel, targetPopulation, geographicScope
- **relations**: isAddressedBy→CommunityProgram, isMeasuredBy→ProgramOutcome

## Program Input
- **genus**: `bfo:0000040`
- **definition**: The resources, such as budgets, personnel, or materials, required to make a program possible and support its activities.
- **attributes**: inputIdentifier, inputName, resourceType, quantity, cost, acquisitionDate
- **relations**: supportsProgram→CommunityProgram, enablesActivity→ProgramActivity

## Program Activity
- **genus**: `bfo:0000015`
- **definition**: The specific tasks, actions, or interventions undertaken during the implementation of a program to achieve its goals.
- **attributes**: activityIdentifier, activityName, startDate, endDate, frequency, duration
- **relations**: isPartOfProgram→CommunityProgram, usesInput→ProgramInput, producesOutput→ProgramOutput, influencesOutcome→ProgramOutcome

## Program Output
- **genus**: `bfo:0000040`
- **definition**: The direct results of program activities, including the amount of services provided, products produced, or number of clients reached.
- **attributes**: outputIdentifier, outputName, outputType, value, measurementDate, targetValue
- **relations**: resultsFromActivity→ProgramActivity, contributesToOutcome→ProgramOutcome

## Program Outcome
- **genus**: `bfo:0000015`
- **definition**: The changes that occur at an individual, group, or community level as a result of program activities and outputs, categorized by time horizon.
- **attributes**: outcomeIdentifier, outcomeDescription, timeHorizon, changeDirection, targetLevel, measurableValue, measurementDate
- **relations**: isAchievedByProgram→CommunityProgram, isDrivenByOutput→ProgramOutput, addressesNeed→CommunityNeed

## Causal Assumption
- **genus**: `bfo:0000016`
- **definition**: An explicit statement of the assumed causal linkage or influence between program components (e.g., how an activity leads to an output or outcome).
- **attributes**: assumptionIdentifier, assumptionText, confidenceLevel, isVerified
- **relations**: linksSourceComponent→ProgramInput, linksTargetComponent→ProgramActivity
