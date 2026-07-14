# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Service Transition
- **genus**: `bfo:0000015`
- **definition**: A process involving the movement of an older person between different health and social care settings or service providers.
- **attributes**: transitionId, startDate, endDate, transitionType, status, description
- **relations**: involvesServiceUser→ServiceUser, involvesCarer→Carer, originatesFrom→HealthCareSetting, destinedFor→HealthCareSetting

## Service User
- **genus**: `bfo:0000004`
- **definition**: An individual receiving health and social care services, particularly older people involved in care transitions.
- **attributes**: userId, name, dateOfBirth, ageGroup, gender, primaryCondition
- **relations**: receivesCareFrom→HealthCareSetting, hasCarer→Carer, participatesIn→ServiceTransition

## Carer
- **genus**: `bfo:0000004`
- **definition**: An individual providing informal or formal care support to a service user, often involved in care transitions.
- **attributes**: carerId, name, relationshipToUser, careLevel, contactNumber
- **relations**: supportsServiceUser→ServiceUser, involvedInTransition→ServiceTransition

## Health Care Setting
- **genus**: `bfo:0000004`
- **definition**: A physical or organizational entity providing health and social care services, such as hospitals, community care teams, or residential care homes.
- **attributes**: settingId, name, type, location, contactInfo
- **relations**: providesCareTo→ServiceUser, originatesTransition→ServiceTransition, destinedForTransition→ServiceTransition

## Policy Instrument
- **genus**: `cco:ont00000958`
- **definition**: A formal mechanism or framework used to implement health and social care policies, such as direct payments or personal budgets.
- **attributes**: policyId, name, type, effectiveDate, status, description
- **relations**: appliesTo→ServiceUser, implementedBy→HealthCareSetting, influencesTransition→ServiceTransition

## Research Project
- **genus**: `bfo:0000015`
- **definition**: A structured investigation into health and social care topics, such as service transitions or policy impacts, involving co-researchers.
- **attributes**: projectId, title, startDate, endDate, fundingSource, status
- **relations**: studiesTransition→ServiceTransition, involvesCoResearcher→ServiceUser, involvesCoResearcher→Carer, fundedBy→FundingAgency

## Funding Agency
- **genus**: `bfo:0000040`
- **definition**: An organization providing financial support for research projects in health and social care.
- **attributes**: agencyId, name, type, contactInfo
- **relations**: fundsProject→ResearchProject
