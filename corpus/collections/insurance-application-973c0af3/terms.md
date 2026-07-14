# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Insurance Application
- **genus**: `cco:ont00000958`
- **definition**: A formal document submitted by an organization to request amateur sports association insurance coverage, containing organizational details, participant counts, requested coverage limits, and underwriting disclosures.
- **attributes**: applicationId, organizationName, headquartersStreet, headquartersCity, headquartersState, headquartersZip, dateOfFormation, charteredInState, submissionDate, isBinding
- **relations**: submittedBy→Organization, coversEvents→Event, requestedCoverageFor→CoveragePolicy, disclosesPastClaims→ClaimRecord

## Organization
- **genus**: `cco:ont00000995`
- **definition**: A legally recognized entity, such as an amateur sports association, that applies for insurance coverage and employs officers to manage its operations.
- **attributes**: organizationId, officialName, licenseNumber, formationDate, charteredState, headquartersAddress, telephoneNumber, faxNumber, hasCoachInstructionProgram, hasInjuryControlProgram
- **relations**: hasOfficers→Officer, employsInsuranceCoordinator→Officer, submitsApplication→InsuranceApplication, conductsEvents→Event

## Officer
- **genus**: `bfo:0000023`
- **definition**: A role held by an individual within an organization, such as President, Vice President, Secretary, Treasurer, or Insurance Coordinator, responsible for governance and compliance.
- **attributes**: officerId, fullName, roleTitle, appointmentDate, isInsuranceCoordinator
- **relations**: servesIn→Organization, holdsRole→OfficerRole

## Officer Role
- **genus**: `bfo:0000023`
- **definition**: A specific governance position within an organization, such as President, Vice President, Secretary, Treasurer, or Insurance Coordinator, defining the scope of authority and responsibility.
- **attributes**: roleCode, roleName, isExecutive, requiresInsuranceTraining

## Event
- **genus**: `bfo:0000015`
- **definition**: A scheduled amateur sports competition or activity conducted by an association, characterized by location, date, and expected attendance, for which insurance coverage is requested.
- **attributes**: eventId, eventName, locationName, estimatedDate, expectedAttendance, isMinorParticipantEvent, coverageRequested
- **relations**: organizedBy→Organization, coveredBy→CoveragePolicy, hasParticipants→Participant

## Coverage Policy
- **genus**: `cco:ont00000995`
- **definition**: A specific insurance product or limit requested for an event or organization, such as Primary General Liability, Participant Legal Liability, or Medical Coverage, with defined monetary limits and deductibles.
- **attributes**: policyId, coverageType, coverageLimit, deductibleAmount, isExcessCoverage, claimExcessThreshold
- **relations**: requestedFor→Event, issuedTo→Organization, coversParticipantAccidents→Participant

## Claim Record
- **genus**: `cco:ont00000995`
- **definition**: A historical record of an insurance claim filed against an organization, including the year, premium paid, total incurred claims (paid and reserved), and details for claims exceeding a specified threshold.
- **attributes**: claimId, claimYear, premiumPaid, totalIncurredClaims, claimDescription, exceedsThreshold, thresholdAmount
- **relations**: associatedWith→Organization, relatedToPolicy→CoveragePolicy

## Participant
- **genus**: `bfo:0000015`
- **definition**: An individual taking part in an event organized by an association, categorized as a minor or adult, and potentially covered by accident or medical insurance policies.
- **attributes**: participantId, fullName, isMinor, waiverSigned, assumptionOfRiskSigned
- **relations**: attendsEvent→Event, coveredByPolicy→CoveragePolicy
