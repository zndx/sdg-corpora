# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Cybernetic Organism
- **genus**: `bfo:0000040`
- **definition**: A biological organism that has been extended or modified with cybernetic technology to alter its self-regulatory control functions.
- **attributes**: organismId, organismType, modificationDate, controlSystemType, environmentAdaptation, homeostaticStatus
- **relations**: hasModification→CyberneticModification, participatesIn→CyberneticsResearch

## Cybernetic Modification
- **genus**: `bfo:0000040`
- **definition**: A technological or procedural alteration applied to an organism to extend its self-regulatory control functions.
- **attributes**: modificationId, modificationType, implementationDate, controlMechanism, targetFunction, researcherId
- **relations**: appliedTo→CyberneticOrganism, designedBy→CyberneticsResearch

## Cybernetics Research
- **genus**: `bfo:0000015`
- **definition**: A scientific activity or project focused on the study and application of control and communication theory in machines and organisms.
- **attributes**: researchId, researchTitle, startDate, endDate, researchLocation, fundingSource, researchStatus
- **relations**: conductedBy→Cybernetician, produces→CyberneticOrganism, usesMethod→ResearchMethod

## Cybernetician
- **genus**: `bfo:0000002`
- **definition**: A scientist or researcher who works in the field of cybernetics, focusing on control and communication theory.
- **attributes**: researcherId, fullName, institution, specialization, activePeriod, keyContributions
- **relations**: conducts→CyberneticsResearch, collaboratesWith→Cybernetician

## Research Method
- **genus**: `bfo:0000015`
- **definition**: A specific scientific approach or technique used in cybernetics research, such as analogies or feedback control.
- **attributes**: methodId, methodName, methodType, applicationDomain, effectiveness
- **relations**: usedIn→CyberneticsResearch, developedBy→Cybernetician

## Scientific Discourse
- **genus**: `bfo:0000040`
- **definition**: A body of written or spoken communication within the field of cybernetics, including theories, critiques, and historical accounts.
- **attributes**: discourseId, discourseTitle, publicationDate, authorId, discourseType, keyThemes
- **relations**: discusses→CyberneticsResearch, references→ScientificDiscourse
