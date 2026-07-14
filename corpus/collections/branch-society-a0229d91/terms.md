# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Branch Society
- **genus**: `bfo:0000040`
- **definition**: A geographically defined subdivision of the Harris County Medical Society that organizes local meetings and educational programs for physicians in a specific area.
- **attributes**: branchCode, geographicArea, meetingFrequency, primaryAddress
- **relations**: hostsMeeting→BranchMeeting, servesPhysician→Physician

## Branch Meeting
- **genus**: `bfo:0000015`
- **definition**: A scheduled educational and networking event held by a branch society, typically focusing on continuing medical education and practice management.
- **attributes**: meetingDate, startTime, durationHours, location, topic, status
- **relations**: organizedBy→BranchSociety, attendedBy→Physician

## Physician
- **genus**: `bfo:0000002`
- **definition**: A licensed medical doctor who is a member of the Harris County Medical Society and participates in its activities and committees.
- **attributes**: physicianID, fullName, age, yearsInPractice, primaryAddress, membershipStatus
- **relations**: assignedToBranch→BranchSociety, attendsMeeting→BranchMeeting, servesOnCommittee→Committee

## Committee
- **genus**: `bfo:0000040`
- **definition**: A formal organizational unit within the Harris County Medical Society responsible for specific oversight, educational, or legislative functions.
- **attributes**: committeeName, committeeCode, meetingFrequency, meetingTime, meetingLocation, appointmentMonth
- **relations**: meetsAt→Location, hasMember→Physician

## Location
- **genus**: `bfo:0000004`
- **definition**: A physical place or venue where committee meetings, branch meetings, or other society events are held.
- **attributes**: locationID, address, city, state, venueType
- **relations**: hostsMeeting→BranchMeeting, hostsMeeting→CommitteeMeeting

## Committee Meeting
- **genus**: `bfo:0000015`
- **definition**: A scheduled gathering of a specific committee to discuss oversight, educational, or legislative matters relevant to the society's functions.
- **attributes**: meetingDate, startTime, durationHours, agenda, status
- **relations**: organizedBy→Committee, heldAt→Location, attendedBy→Physician
