# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Young Researcher
- **genus**: `bfo:0000040`
- **definition**: A person holding a PhD degree awarded within the last six years who participates in the EYE project's activities.
- **attributes**: researcherId, fullName, phdAwardDate, institution, discipline, isSelected
- **relations**: participatesIn→Event, collaboratesWith→Researcher, submitsTo→ProjectProposal

## EYE Activity Event
- **genus**: `bfo:0000015`
- **definition**: A regional or European brainstorming, networking, or training event organized under the EYE project.
- **attributes**: eventId, eventName, eventType, startDate, endDate, region, status
- **relations**: attendedBy→Researcher, followedBy→Event, supports→ProjectProposal

## FET Project Proposal
- **genus**: `cco:ont00000995`
- **definition**: A substantive research proposal developed by young researchers to participate in Horizon 2020 funding.
- **attributes**: proposalId, title, thematicArea, fundingProgram, status, submissionDate
- **relations**: createdBy→Researcher, derivedFrom→Event, addresses→SocietalChallenge

## Horizon 2020 Societal Challenge
- **genus**: `bfo:0000040`
- **definition**: A broad societal problem or area of focus targeted by Horizon 2020 funding programs.
- **attributes**: challengeId, challengeName
- **relations**: addressedBy→ProjectProposal

## EYE Partner Organization
- **genus**: `bfo:0000040`
- **definition**: An institution or enterprise that has joined forces to achieve the goals of the EYE project.
- **attributes**: partnerId, organizationName, organizationType, country, isCoordinator
- **relations**: organizes→Event, coordinates→PartnerOrganization

## FET Thematic Research Area
- **genus**: `bfo:0000040`
- **definition**: A broad multidisciplinary research area providing a thematic framework for the EYE project.
- **attributes**: areaId, areaName
- **relations**: informedBy→ProjectProposal
