# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Assessment Notice
- **genus**: `cco:ont00000995`
- **definition**: An official document issued by the Board of Assessors notifying property owners of their property's assessed value and providing details for appeals or corrections.
- **attributes**: noticeId, issueDate, propertyType, noticeType, status, propertyIdentifier
- **relations**: pertainsTo→PropertyParcel, issuedBy→BoardOfAssessors

## Property Exemption
- **genus**: `cco:ont00000995`
- **definition**: A legal provision that reduces or eliminates the taxable value of a property based on specific criteria such as capital improvements, historic rehabilitation, or personal property status.
- **attributes**: exemptionId, exemptionType, approvalDate, status, propertyIdentifier, applicableYear
- **relations**: appliesTo→PropertyParcel, approvedBy→BoardOfAssessors

## Appeal Waiver
- **genus**: `cco:ont00000995`
- **definition**: A formal document certifying that a property owner has waived their right to appeal a property assessment decision to the Board of Equalization.
- **attributes**: waiverId, waiverDate, propertyIdentifier, status, certifiedBy
- **relations**: pertainsTo→PropertyParcel, certifiedTo→BoardOfEqualization

## Property Parcel
- **genus**: `bfo:0000040`
- **definition**: A distinct piece of land or real estate with defined boundaries, used for assessment, taxation, and legal purposes.
- **attributes**: parcelId, address, landUse, area, zoningDistrict, ownerName
- **relations**: hasAssessmentNotice→AssessmentNotice, hasExemption→PropertyExemption, hasAppealWaiver→AppealWaiver

## Board of Assessors
- **genus**: `bfo:0000040`
- **definition**: A governmental body responsible for assessing property values and managing related administrative processes.
- **attributes**: boardId, jurisdiction, meetingDate, status
- **relations**: issues→AssessmentNotice, approves→PropertyExemption

## Board of Equalization
- **genus**: `bfo:0000040`
- **definition**: A higher-level governmental body that reviews and certifies appeal waivers and other assessment-related decisions.
- **attributes**: boardId, jurisdiction, meetingDate, status
- **relations**: receives→AppealWaiver
