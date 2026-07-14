# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Board Appointment
- **genus**: `bfo:0000015`
- **definition**: A formal act of appointing an individual to a specific board or trusteeship for a defined term.
- **attributes**: appointmentId, appointmentDate, termStartDate, termEndDate, termLengthYears, confirmationStatus, statutoryAuthority
- **relations**: appoints→BoardMember, governs→BoardOfTrustees, issuedBy→CountyExecutive

## Board Member
- **genus**: `bfo:0000015`
- **definition**: An individual person who has been formally appointed to serve on a specific board or trusteeship.
- **attributes**: memberId, firstName, lastName, currentRole, isReappointment
- **relations**: servesOn→BoardOfTrustees, holdsAppointment→BoardAppointment, represents→CountyJurisdiction

## Board of Trustees
- **genus**: `bfo:0000015`
- **definition**: A formal governing body or commission established to oversee the operations and assets of a specific public institution.
- **attributes**: boardId, boardName, establishmentDate, governingStatute, jurisdiction
- **relations**: hasMember→BoardMember, oversees→PublicInstitution, operatesUnder→CountyJurisdiction

## County Jurisdiction
- **genus**: `bfo:0000015`
- **definition**: A specific geographic and administrative territory governed by a county-level legislative and executive authority.
- **attributes**: jurisdictionId, jurisdictionName, stateCode, legislativeBody
- **relations**: appoints→BoardOfTrustees, employs→CountyExecutive, contains→PublicInstitution

## County Executive
- **genus**: `bfo:0000015`
- **definition**: The chief administrative officer of a county government who holds the statutory authority to make or recommend appointments to public boards.
- **attributes**: executiveId, fullName, termStartDate, termEndDate, appointmentAuthority
- **relations**: issues→BoardAppointment, servesIn→CountyJurisdiction

## Public Institution
- **genus**: `bfo:0000015`
- **definition**: A physical or organizational entity owned or operated by the government for public use, such as a memorial or cultural center.
- **attributes**: institutionId, institutionName, institutionType, locationAddress, operationalStatus
- **relations**: isOverseenBy→BoardOfTrustees, locatedIn→CountyJurisdiction
