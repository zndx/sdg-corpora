# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Indigenous Knowledge Base
- **genus**: `cco:ont00000995`
- **definition**: A dynamic, community-held repository of traditional ecological knowledge, practices, and cultural understandings related to environmental hazards and land management.
- **attributes**: knowledgeBaseId, communityName, region, primaryHazardType, transmissionMode, lastVerifiedDate, isIntegrated
- **relations**: coversRegion→Community, informsRiskReductionStrategy→RiskReductionStrategy, interactsWith→ScientificKnowledgeBase

## Scientific Knowledge Base
- **genus**: `cco:ont00000995`
- **definition**: A structured, empirically validated collection of data, models, and technical assessments regarding environmental hazards and community vulnerability.
- **attributes**: knowledgeBaseId, dataSource, modelType, resolution, lastUpdated, validationStatus
- **relations**: coversRegion→Community, informsRiskReductionStrategy→RiskReductionStrategy, interactsWith→IndigenousKnowledgeBase

## Community
- **genus**: `bfo:0000015`
- **definition**: A distinct social group residing in a specific geographic location, characterized by shared vulnerability to environmental hazards and engagement in risk reduction activities.
- **attributes**: communityId, communityName, province, population, islandGroup, primaryLivelihood, vulnerabilityLevel
- **relations**: hostsIndigenousKnowledge→IndigenousKnowledgeBase, hostsScientificAssessment→ScientificKnowledgeBase, implementsStrategy→RiskReductionStrategy

## Risk Reduction Strategy
- **genus**: `bfo:0000015`
- **definition**: A planned intervention or set of practices designed to mitigate community vulnerability to environmental hazards through the integration of indigenous and scientific knowledge.
- **attributes**: strategyId, strategyName, integrationLevel, implementationStatus, targetHazard, startDate, endDate
- **relations**: appliedIn→Community, drawsFromIndigenousKnowledge→IndigenousKnowledgeBase, drawsFromScientificKnowledge→ScientificKnowledgeBase

## Environmental Hazard
- **genus**: `bfo:0000015`
- **definition**: A natural or anthropogenic event or condition that poses a threat to human life, property, or the environment within a specific geographic area.
- **attributes**: hazardId, hazardType, frequency, magnitude, affectedArea, lastOccurrence
- **relations**: threatens→Community, monitoredBy→ScientificKnowledgeBase
