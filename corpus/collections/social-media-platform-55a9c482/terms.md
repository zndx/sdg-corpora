# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Social Media Platform
- **genus**: `cco:ont00000995`
- **definition**: A digital communication tool or application used by employees for internal organizational messaging and content sharing.
- **attributes**: platformIdentifier, platformName, primaryFunction, adoptionStatus, usageFrequency, isEnterpriseGrade
- **relations**: usedBy→Employee, supportsCommunicationType→InternalCommunicationEvent

## Internal Communication Event
- **genus**: `bfo:0000015`
- **definition**: A discrete instance of information exchange occurring between employees within the organization using a specific medium.
- **attributes**: eventIdentifier, timestamp, communicationDirection, contentType, isFormal, effectivenessRating
- **relations**: usesPlatform→SocialMediaPlatform, initiatedBy→Employee, targetedTo→Employee

## Employee
- **genus**: `bfo:0000002`
- **definition**: A staff member or worker within the university organization who participates in internal communication processes.
- **attributes**: employeeId, department, role, yearsOfService, digitalLiteracyLevel
- **relations**: usesPlatform→SocialMediaPlatform, initiatesCommunication→InternalCommunicationEvent, receivesCommunication→InternalCommunicationEvent

## Communication Factor
- **genus**: `bfo:0000015`
- **definition**: A specific attribute, condition, or perceived benefit that influences the adoption or effectiveness of internal communication tools.
- **attributes**: factorId, factorName, category, impactScore, isPositive
- **relations**: influences→SocialMediaPlatform, assessedBy→Employee

## Organizational Policy
- **genus**: `cco:ont00000958`
- **definition**: A formal or informal rule, guideline, or protocol established by the university to govern the use of communication tools.
- **attributes**: policyId, policyTitle, effectiveDate, status, scope
- **relations**: governs→SocialMediaPlatform, appliesTo→Employee
