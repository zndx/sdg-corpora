# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Expedition
- **genus**: `bfo:0000015`
- **definition**: A planned journey or voyage undertaken to explore a specific region or achieve scientific objectives.
- **attributes**: expeditionId, startDate, endDate, durationDays, objective, status, teamSize, region
- **relations**: ledBy→Explorer, usesEquipment→Equipment, collectsData→Observation, traverses→GeographicArea

## Explorer
- **genus**: `bfo:0000004`
- **definition**: A person who leads or participates in expeditions to explore unknown or remote regions.
- **attributes**: explorerId, fullName, birthDate, deathDate, nationality, specialization, skills
- **relations**: leads→Expedition, awarded→Award, invented→Document

## Equipment
- **genus**: `cco:ont00000995`
- **definition**: Physical tools, gear, or apparatus used during expeditions or scientific research.
- **attributes**: equipmentId, name, type, weightKg, designer, status
- **relations**: usedIn→Expedition

## Observation
- **genus**: `cco:ont00000995`
- **definition**: A recorded measurement or data point collected during an expedition or scientific study.
- **attributes**: observationId, timestamp, parameter, value, unit, status
- **relations**: collectedBy→Expedition, measuredBy→Equipment

## GeographicArea
- **genus**: `bfo:0000002`
- **definition**: A defined physical location or region, such as a coast, interior, or oceanic zone.
- **attributes**: areaId, name, type, latitude, longitude, description
- **relations**: traversedBy→Expedition

## Award
- **genus**: `cco:ont00000995`
- **definition**: A formal recognition or prize given for achievements in exploration, science, or humanitarian work.
- **attributes**: awardId, name, year, category, reason
- **relations**: awardedTo→Explorer

## Document
- **genus**: `cco:ont00000958`
- **definition**: A formal record or identification paper, such as a passport or report, created for administrative or legal purposes.
- **attributes**: documentId, name, type, issueDate, issuingAuthority, recognizedBy
- **relations**: inventedBy→Explorer, usedFor→HumanitarianAction

## HumanitarianAction
- **genus**: `bfo:0000015`
- **definition**: An organized effort to provide relief, repatriation, or assistance to displaced persons or refugees.
- **attributes**: actionId, startDate, endDate, type, beneficiariesCount, status
- **relations**: ledBy→Explorer, usesDocument→Document
