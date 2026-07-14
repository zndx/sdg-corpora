# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Nuclear Facility
- **genus**: `bfo:0000040`
- **definition**: A material entity that is a nuclear installation or site, such as a licensed power plant, research reactor, or waste storage site, subject to regulatory oversight.
- **attributes**: facilityId, facilityName, licenseStatus, operationalStatus, siteType, lastInspectionDate
- **relations**: hasSafetyDirector→SafetyDirector, isSubjectTo→RegulatoryFramework, generates→HSSSEQIssue

## Safety Director
- **genus**: `bfo:0000002`
- **definition**: A person holding the senior role responsible for health, safety, security, safeguards, environment, and quality (HSSSEQ) at a nuclear site or company.
- **attributes**: directorId, fullName, roleType, appointmentDate, isSponsor
- **relations**: represents→NuclearFacility, sponsors→SubGroup, attends→ForumMeeting

## Forum Meeting
- **genus**: `bfo:0000015`
- **definition**: A scheduled gathering of the Safety Directors' Forum to discuss HSSSEQ issues, review policy, and coordinate industry responses.
- **attributes**: meetingId, meetingDate, meetingType, venue, status, totalCost
- **relations**: chairedBy→SafetyDirector, attendedBy→SafetyDirector, generates→MeetingDocument, tracks→ActionItem

## HSSSEQ Issue
- **genus**: `bfo:0000015`
- **definition**: A strategic Health, Safety, Security, Safeguards, Environment, or Quality matter identified by the industry that requires response or improvement.
- **attributes**: issueId, issueTitle, category, riskLevel, status, reportedDate
- **relations**: originatesFrom→NuclearFacility, addressedBy→SubGroup, influences→PolicyDocument

## Sub Group
- **genus**: `bfo:0000040`
- **definition**: A dedicated working group established by the Forum to focus on specific HSSSEQ topics or technical matters.
- **attributes**: subGroupId, subGroupTitle, focusArea, isActive, establishedDate
- **relations**: sponsoredBy→SafetyDirector, addresses→HSSSEQIssue, produces→MeetingDocument

## Meeting Document
- **genus**: `cco:ont00000958`
- **definition**: A record, agenda, minutes, or report generated from or associated with a Forum meeting or Sub Group activity.
- **attributes**: documentId, documentType, publicationDate, version, isPublic
- **relations**: relatedToMeeting→ForumMeeting, createdBy→SafetyDirector, containsAction→ActionItem

## Action Item
- **genus**: `bfo:0000015`
- **definition**: A specific task or responsibility assigned during a meeting to address an issue or follow up on a discussion.
- **attributes**: actionId, description, dueDate, priority, status
- **relations**: assignedTo→SafetyDirector, linkedToIssue→HSSSEQIssue, recordedIn→MeetingDocument
