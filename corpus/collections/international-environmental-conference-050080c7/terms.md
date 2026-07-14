# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## International Environmental Conference
- **genus**: `bfo:0000015`
- **definition**: A formal global or regional gathering of states, NGOs, and civil society to negotiate and adopt environmental principles, declarations, and action plans.
- **attributes**: conferenceId, startDate, endDate, hostCity, hostCountry, declarationTitle, actionPlanTitle, totalRecommendations, hasNGOForum
- **relations**: produced→EnvironmentalDeclaration, produced→ActionPlan, created→InternationalEnvironmentalInstitution, preceded→InternationalEnvironmentalConference

## Environmental Declaration
- **genus**: `cco:ont00000958`
- **definition**: A formal document establishing principles of behavior and responsibility to serve as the basis for future legally binding multilateral accords.
- **attributes**: declarationId, title, adoptionDate, totalPrinciples, issuingConference
- **relations**: adoptedAt→InternationalEnvironmentalConference

## Action Plan
- **genus**: `cco:ont00000958`
- **definition**: A comprehensive set of specific recommendations in areas of environmental assessment, management, and institutional measures.
- **attributes**: planId, title, totalRecommendations, adoptionDate
- **relations**: adoptedAt→InternationalEnvironmentalConference

## International Environmental Institution
- **genus**: `bfo:0000015`
- **definition**: A formal organization or agency established to monitor, regulate, or promote environmental protection and sustainable development.
- **attributes**: institutionId, name, headquartersCity, headquartersCountry, establishmentDate, status
- **relations**: createdBy→InternationalEnvironmentalConference, promotes→MultilateralEnvironmentalAgreement

## Multilateral Environmental Agreement
- **genus**: `cco:ont00000958`
- **definition**: A legally binding international treaty or accord addressing transboundary and global pollution threats.
- **attributes**: agreementId, title, entryIntoForceDate, status, scope
- **relations**: informedBy→EnvironmentalDeclaration, monitoredBy→InternationalEnvironmentalInstitution

## Environmental Policy Instrument
- **genus**: `bfo:0000015`
- **definition**: A regulatory mechanism, market-based tool, or institutional expectation used to influence state actions and reduce environmental degradation.
- **attributes**: instrumentId, name, type, implementationDate, targetSector
- **relations**: derivedFrom→MultilateralEnvironmentalAgreement, implementedBy→State

## State
- **genus**: `bfo:0000002`
- **definition**: A sovereign political entity with jurisdiction over a defined territory and population, participating in international environmental governance.
- **attributes**: stateCode, name, developmentStatus, primaryEnvironmentalConcern
- **relations**: implements→EnvironmentalPolicyInstrument, partyTo→MultilateralEnvironmentalAgreement, receives→FinancialAssistance

## Financial Assistance
- **genus**: `bfo:0000015`
- **definition**: Monetary contributions from industrialized states to developing countries to fund pollution control and sustainable development projects.
- **attributes**: assistanceId, amount, currency, disbursementDate, purpose
- **relations**: providedBy→State, receivedBy→State, funds→EnvironmentalPolicyInstrument
