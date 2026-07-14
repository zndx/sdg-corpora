# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Information Sharing Agreement
- **genus**: `cco:ont00000958`
- **definition**: A formal memorandum of agreement establishing a shared vision and interoperability standards between the Department of Defense and the Intelligence Community.
- **attributes**: agreementId, issueDate, agreementType, status, scope
- **relations**: governedBy→GovernanceBoard, enforces→InteroperabilityStandard, signedBy→ChiefInformationOfficer

## Chief Information Officer
- **genus**: `bfo:0000023`
- **definition**: A role held by a senior official responsible for the information technology and management of the Department of Defense or the Intelligence Community.
- **attributes**: officerId, fullName, organization, rankOrTitle, appointmentDate
- **relations**: coChairs→GovernanceBoard, signs→InformationSharingAgreement

## Joint Governance Board
- **genus**: `bfo:0000015`
- **definition**: A joint board co-chaired by the DoD CIO and the DNI CIO responsible for governing the mandatory and common foundation of the shared information environment.
- **attributes**: boardId, establishmentDate, governanceScope, meetingFrequency, decisionAuthority
- **relations**: coChairedBy→ChiefInformationOfficer, governs→InteroperabilityStandard, manages→InformationEnvironment

## Interoperability Standard
- **genus**: `cco:ont00000995`
- **definition**: A jointly-developed standard, rule, or technical specification ensuring interoperability and secure infrastructure services within the shared information environment.
- **attributes**: standardId, standardName, version, technologyType, complianceLevel, effectiveDate
- **relations**: governedBy→GovernanceBoard, supports→InformationEnvironment, implementedBy→MissionService

## Information Environment
- **genus**: `bfo:0000015`
- **definition**: A services-based information environment leveraging commercial practices and standard web technologies to provide mission and business services across the DoD and IC.
- **attributes**: environmentId, environmentName, architectureType, operationalStatus, visibilityLevel
- **relations**: managedBy→GovernanceBoard, uses→InteroperabilityStandard, hosts→MissionService

## Mission Service
- **genus**: `cco:ont00000995`
- **definition**: A secure mission or business service provided and used by functions and organizations across the DoD and IC, based on applicable enterprise architectures.
- **attributes**: serviceId, serviceName, serviceCategory, securityClassification, availabilityStatus, providerOrganization
- **relations**: implementedUsing→InteroperabilityStandard, hostedIn→InformationEnvironment, usedBy→MissionService
