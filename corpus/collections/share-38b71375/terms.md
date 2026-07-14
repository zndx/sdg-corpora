# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Share
- **genus**: `cco:ont00000995`
- **definition**: A single unit of ownership in the corporation, representing a claim on assets and earnings.
- **attributes**: identifier, nominalValue, votingRights, issuanceDate, currentStatus
- **relations**: heldBy→Shareholder, represents→ShareCapital

## Shareholder
- **genus**: `bfo:0000004`
- **definition**: An individual or legal entity that holds one or more shares in the corporation.
- **attributes**: identifier, legalName, shareholderType, registrationDate, isProxyHolder
- **relations**: holds→Share, representedAt→AnnualGeneralMeeting

## Annual General Meeting
- **genus**: `bfo:0000015`
- **definition**: The supreme decision-making body of the corporation where shareholders exercise their rights.
- **attributes**: meetingId, scheduledDate, actualDate, location, quorumMet, totalSharesRepresented, attendeeCount
- **relations**: elects→BoardMember, appoints→NominationCommittee, resolves→Resolution, hasQuorumOf→Shareholder

## Board Member
- **genus**: `bfo:0000004`
- **definition**: An individual elected by the Annual General Meeting to serve on the Board of Directors.
- **attributes**: memberId, fullName, appointmentDate, termEndDate, isChairman, feeAmount, paymentMethod
- **relations**: servesOn→BoardOfDirectors, appointedAt→AnnualGeneralMeeting, receivesFeeFrom→Resolution

## Nomination Committee
- **genus**: `bfo:0000004`
- **definition**: A committee appointed by the Annual General Meeting to draft proposals for elections and fees.
- **attributes**: committeeId, charterVersion, minMembers, maxMembers, chairmanId
- **relations**: composedOf→CommitteeMember, appointedBy→AnnualGeneralMeeting, draftsProposalFor→Resolution

## Resolution
- **genus**: `bfo:0000015`
- **definition**: A formal decision or directive passed by the Annual General Meeting.
- **attributes**: resolutionId, passDate, resolutionType, amount, currency, isPublished
- **relations**: passedAt→AnnualGeneralMeeting, affects→Shareholder, designates→BoardMember
