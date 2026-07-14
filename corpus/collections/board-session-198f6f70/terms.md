# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Board Session
- **genus**: `bfo:0000015`
- **definition**: A formal public hearing or briefing conducted by the Board of Adjustment to review and decide on specific cases.
- **attributes**: sessionDate, startTime, endTime, sessionType, panelDesignation, location, chairpersonName, isPrecedentSetting
- **relations**: hasMember→BoardMember, hasStaff→BoardStaff, reviewsCase→ZoningCase

## Board Member
- **genus**: `bfo:0000023`
- **definition**: An individual serving as a voting member or alternate on the Board of Adjustment, holding a specific role such as Vice Chair or Regular Member.
- **attributes**: memberId, fullName, role, isPresent, votingRecord
- **relations**: servesOn→BoardSession, votesOn→BoardMotion

## Board Staff
- **genus**: `bfo:0000023`
- **definition**: An individual employed by the city to support the Board of Adjustment's administrative, legal, or technical functions during sessions.
- **attributes**: staffId, fullName, jobTitle, isPresent
- **relations**: supports→BoardSession, providesReport→ZoningCase

## Zoning Case
- **genus**: `cco:ont00000995`
- **definition**: A formal application or appeal submitted to the Board of Adjustment regarding land use, zoning regulations, or property development.
- **attributes**: fileNumber, applicationDate, hearingDate, propertyAddress, legalDescription, zoningDistrict, requestedRelief, status
- **relations**: hasApplicant→Applicant, hasRepresentative→Representative, isReviewedBy→BoardSession, hasBuildingReport→BuildingReport

## Applicant
- **genus**: `bfo:0000004`
- **definition**: An individual or entity submitting a request for a zoning exception, variance, or special use permit to the Board of Adjustment.
- **attributes**: applicantId, fullName, contactInfo, representationStatus
- **relations**: submitsCase→ZoningCase, isRepresentedBy→Representative

## Representative
- **genus**: `bfo:0000004`
- **definition**: An individual, such as an attorney or agent, authorized to act on behalf of an applicant in a zoning case.
- **attributes**: representativeId, fullName, profession
- **relations**: represents→Applicant, appearsIn→BoardSession

## Building Report
- **genus**: `cco:ont00000995`
- **definition**: A technical document prepared by the Building Official or relevant city department detailing the facts, regulations, and recommendations for a specific zoning case.
- **attributes**: reportId, reportDate, preparedBy, regulationCited, finding, recommendation
- **relations**: coversCase→ZoningCase, preparedByOfficial→BoardStaff

## Board Motion
- **genus**: `bfo:0000015`
- **definition**: A formal proposal made by a board member during a session to take a specific action, such as approving minutes or granting a case.
- **attributes**: motionId, motionText, proposedBy, secondedBy, outcome, voteCount
- **relations**: madeInSession→BoardSession, proposedByMember→BoardMember, secondedByMember→BoardMember, votesOn→BoardMember
