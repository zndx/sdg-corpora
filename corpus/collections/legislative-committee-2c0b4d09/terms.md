# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Legislative Committee
- **genus**: `bfo:0000040`
- **definition**: A formally constituted group of legislators with defined jurisdictional authority over specific policy domains.
- **attributes**: committeeId, committeeName, jurisdictionDescription, status, establishedDate
- **relations**: hasMember→Legislator, hasJurisdictionOver→PolicyDomain, holdsMeetingAt→MeetingVenue

## Legislator
- **genus**: `bfo:0000004`
- **definition**: An elected or appointed individual serving as a member of a legislative body.
- **attributes**: legislatorId, fullName, role, contactEmail, contactPhone
- **relations**: servesOn→LegislativeCommittee, represents→ElectoralDistrict

## Policy Domain
- **genus**: `bfo:0000040`
- **definition**: A defined area of regulatory or legislative authority, such as environmental protection or public utilities.
- **attributes**: domainCode, domainName, regulatoryScope, enforcementAgency
- **relations**: governedBy→LegislativeCommittee, overlapsWith→PolicyDomain

## Meeting Venue
- **genus**: `bfo:0000002`
- **definition**: A physical location where legislative meetings are convened.
- **attributes**: venueId, venueName, streetAddress, city, state, zipCode, roomNumber
- **relations**: hostedMeeting→CommitteeMeeting

## Committee Meeting
- **genus**: `bfo:0000015`
- **definition**: A scheduled or ad-hoc gathering of a legislative committee to conduct official business.
- **attributes**: meetingId, scheduledDateTime, durationMinutes, meetingType, status
- **relations**: convenedBy→LegislativeCommittee, heldAt→MeetingVenue, attendedBy→Legislator
