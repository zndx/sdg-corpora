# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Cognitive Training Program
- **genus**: `cco:ont00000995`
- **definition**: A structured mental exercise regimen designed to improve cognitive capacities such as memory, processing speed, or decision-making.
- **attributes**: programIdentifier, programName, targetCapacity, deliveryMode, targetPopulation, evidenceLevel, launchDate
- **relations**: targetsCapacity→CognitiveCapacity, developedBy→ResearchInstitution, evaluatedBy→CognitiveAssessment

## Cognitive Capacity
- **genus**: `bfo:0000015`
- **definition**: A measurable mental ability or function, such as memory retention, processing speed, or executive control, that can be trained or assessed.
- **attributes**: capacityIdentifier, capacityName, domain, baselineScore, improvementThreshold, assessmentMethod
- **relations**: measuredBy→CognitiveAssessment, trainedBy→CognitiveTrainingProgram

## Cognitive Assessment
- **genus**: `bfo:0000015`
- **definition**: A standardized procedure or test used to evaluate an individual's current cognitive performance or capacity.
- **attributes**: assessmentIdentifier, assessmentName, administrationDate, administratorID, participantID, score, status
- **relations**: assessesCapacity→CognitiveCapacity, conductedBy→ResearchInstitution

## Research Institution
- **genus**: `bfo:0000015`
- **definition**: An organization or entity engaged in scientific research, education, or the development of cognitive training methodologies.
- **attributes**: institutionID, institutionName, location, foundingYear, specialization, status
- **relations**: developsProgram→CognitiveTrainingProgram, conductsAssessment→CognitiveAssessment

## Neuroplasticity Event
- **genus**: `bfo:0000015`
- **definition**: A biological process involving changes in neural connections or brain structure in response to experience, training, or aging.
- **attributes**: eventID, eventDate, brainRegion, triggerType, intensity, outcome
- **relations**: resultsInCapacityChange→CognitiveCapacity, observedAt→ResearchInstitution
