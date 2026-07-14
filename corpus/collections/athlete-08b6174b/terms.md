# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Athlete
- **genus**: `bfo:0000040`
- **definition**: A human participant in USA Taekwondo competitions who holds a specific membership and rank.
- **attributes**: athleteId, firstName, lastName, dateOfBirth, membershipStatus, citizenshipStatus, blackBeltRank, backgroundCheckStatus
- **relations**: holdsMembership→Membership, competesIn→Competition, verifiedBy→BlackBeltVerification

## Membership
- **genus**: `bfo:0000040`
- **definition**: A paid subscription granting access to USA Taekwondo events and services.
- **attributes**: membershipId, membershipType, registrationDate, feeAmount, expirationDate, isEligibleForCompetition
- **relations**: heldBy→Athlete, requiresBackgroundCheck→BackgroundCheck

## Competition
- **genus**: `bfo:0000040`
- **definition**: A scheduled event where athletes compete in specific divisions.
- **attributes**: competitionId, competitionName, competitionLevel, startDate, endDate, location, isOnSiteRegistration
- **relations**: hostedBy→StateAssociation, qualifiesFor→Competition, hasDivision→CompetitionDivision

## Competition Division
- **genus**: `bfo:0000040`
- **definition**: A specific category within a competition defined by age, rank, and rules.
- **attributes**: divisionId, divisionName, ageCategory, rankRequirement, eventType, ruleSet, headContactAllowed
- **relations**: partOf→Competition, hasParticipant→Athlete

## State Association
- **genus**: `bfo:0000040`
- **definition**: A regional organization responsible for hosting state championships and managing athlete registrations.
- **attributes**: associationId, associationName, stateCode, contactEmail, contactPhone
- **relations**: hosts→Competition, verifies→BlackBeltVerification

## Black Belt Verification
- **genus**: `bfo:0000040`
- **definition**: A document or process confirming an athlete's black belt rank.
- **attributes**: verificationId, verificationDate, verificationMethod, isVerified, issuingOrganization
- **relations**: forAthlete→Athlete, verifiedBy→StateAssociation

## Background Check
- **genus**: `bfo:0000040`
- **definition**: A safety screening required for members in supervisory positions.
- **attributes**: checkId, checkDate, checkStatus, requiredForRole
- **relations**: forMember→Membership, conductedBy→StateAssociation
