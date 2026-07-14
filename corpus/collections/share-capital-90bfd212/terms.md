# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Share Capital
- **genus**: `cco:ont00000995`
- **definition**: The total monetary value of issued shares representing ownership in the corporation.
- **attributes**: totalValue, currencyCode, totalSharesIssued, votingRightsPerShare, recordDate
- **relations**: hasShareholder→Shareholder, hasDividendPolicy→DividendResolution

## Shareholder
- **genus**: `bfo:0000015`
- **definition**: An individual or institutional entity holding equity shares in the corporation.
- **attributes**: shareholderId, shareholderName, shareCount, ownershipPercentage, isForeignOwner, registrationDate
- **relations**: holdsSharesIn→ShareCapital, nominatedBy→NominationCommittee

## Annual General Meeting
- **genus**: `bfo:0000015`
- **definition**: The supreme decision-making assembly of shareholders convened annually to exercise corporate governance rights.
- **attributes**: meetingId, meetingDate, location, totalSharesRepresented, attendeeShareholderCount, quorumMet, minutesPublished
- **relations**: elects→BoardMember, appoints→NominationCommittee, resolves→DividendResolution, resolves→FeeResolution

## Board Member
- **genus**: `bfo:0000023`
- **definition**: An individual appointed by the Annual General Meeting to oversee the corporation's management and strategy.
- **attributes**: memberId, fullName, role, isEmployee, appointmentYear, feeAmount, currencyCode
- **relations**: servesOn→BoardOfDirectors, nominatedBy→NominationCommittee, receivesFeeFrom→FeeResolution

## Nomination Committee
- **genus**: `bfo:0000015`
- **definition**: A committee appointed by the Annual General Meeting to draft proposals for board elections and remuneration.
- **attributes**: committeeId, meetingDate, minMembers, maxMembers, chairmanName, instructionsAdopted
- **relations**: appointedBy→AnnualGeneralMeeting, hasMember→BoardMember, draftsProposalFor→BoardMember

## Dividend Resolution
- **genus**: `cco:ont00000995`
- **definition**: A formal decision by the Annual General Meeting regarding the distribution of profits to shareholders.
- **attributes**: resolutionId, amountPerShare, currencyCode, paymentDate, approvedByMeeting
- **relations**: resolvedAt→AnnualGeneralMeeting, appliesTo→ShareCapital

## Fee Resolution
- **genus**: `cco:ont00000995`
- **definition**: A formal decision by the Annual General Meeting establishing remuneration for board members, auditors, and committee members.
- **attributes**: resolutionId, roleType, feeAmount, currencyCode, paymentFrequency, approvedByMeeting
- **relations**: resolvedAt→AnnualGeneralMeeting, appliesTo→BoardMember
