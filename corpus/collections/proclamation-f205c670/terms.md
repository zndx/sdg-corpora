# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Royal Proclamation
- **genus**: `cco:ont00000958`
- **definition**: A formal public announcement issued by a monarch inviting eligible individuals to appear before the royal court.
- **attributes**: proclamationId, issuer, targetAudience, dateIssued, status, contentSummary
- **relations**: issuedBy→Monarch, targets→EligibleIndividual

## Eligible Individual
- **genus**: `bfo:0000004`
- **definition**: A person who meets the criteria specified in a royal proclamation to appear before the monarch.
- **attributes**: individualId, fullName, age, residence, eligibilityStatus, dateOfBirth
- **relations**: respondsTo→Proclamation, appearsBefore→Monarch

## Monarch
- **genus**: `bfo:0000004`
- **definition**: The sovereign ruler who issues proclamations and selects individuals for royal positions.
- **attributes**: monarchId, title, reignStartDate, reignEndDate, fairnessRating, currentStatus
- **relations**: issues→Proclamation, selects→EligibleIndividual

## Encounter
- **genus**: `bfo:0000015`
- **definition**: A specific interaction or meeting between a traveler and another entity during a journey.
- **attributes**: encounterId, location, dateTime, outcome, adviceGiven, participantRole
- **relations**: involves→EligibleIndividual, occursAt→Location

## Location
- **genus**: `bfo:0000004`
- **definition**: A specific geographical place or setting where events or encounters take place.
- **attributes**: locationId, name, type, coordinates, description, accessibility
- **relations**: hosts→Encounter

## Journey
- **genus**: `bfo:0000015`
- **definition**: A sequence of travels undertaken by an individual to reach a destination.
- **attributes**: journeyId, startDate, endDate, purpose, status, totalDistance
- **relations**: undertakenBy→EligibleIndividual, includes→Encounter
