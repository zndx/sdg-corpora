# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Assessment Notice
- **genus**: `cco:ont00000995`
- **definition**: A formal record issued to property owners detailing the assessed value of their real or personal property for a given tax year.
- **attributes**: noticeIdentifier, propertyType, noticePeriod, taxYear, status, issueDate
- **relations**: issuedFor→PropertyParcel, submittedBy→ChiefAppraiser

## Property Exemption
- **genus**: `cco:ont00000995`
- **definition**: A legal reduction or elimination of property tax liability granted under specific statutory conditions.
- **attributes**: exemptionIdentifier, exemptionType, taxYear, reductionAmount, status, applicationDate
- **relations**: appliesTo→PropertyParcel, grantedBy→BoardOfAssessors

## Board Meeting
- **genus**: `bfo:0000015`
- **definition**: A formal gathering of the Board of Assessors to review, approve, or reject assessment-related items.
- **attributes**: meetingIdentifier, meetingDate, meetingType, status, quorumPresent
- **relations**: approves→AssessmentNotice, approves→PropertyExemption, convenedBy→BoardOfAssessors

## Board of Assessors
- **genus**: `bfo:0000015`
- **definition**: The governing body responsible for overseeing property assessments, exemptions, and related fiscal decisions.
- **attributes**: boardIdentifier, jurisdiction, establishedDate, currentSession
- **relations**: convenes→BoardMeeting, oversees→ChiefAppraiser

## Chief Appraiser
- **genus**: `bfo:0000015`
- **definition**: The official responsible for preparing and submitting property assessment notices and exemption applications for board review.
- **attributes**: appraiserIdentifier, appointmentDate, currentTermEnd, officeLocation
- **relations**: submits→AssessmentNotice, submits→PropertyExemption, reportsTo→BoardOfAssessors

## Property Parcel
- **genus**: `cco:ont00000995`
- **definition**: A distinct piece of land or real estate unit subject to assessment and taxation.
- **attributes**: parcelIdentifier, address, landUseCode, assessedValue, taxYear, isHomesteaded
- **relations**: hasNotice→AssessmentNotice, hasExemption→PropertyExemption
