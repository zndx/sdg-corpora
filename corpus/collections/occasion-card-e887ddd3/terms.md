# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Occasion Card
- **genus**: `cco:ont00000995`
- **definition**: A pre-signed, specially designed card used to request memorial prayers or express sentiments, available for specific occasions or perpetual enrollment.
- **attributes**: cardType, referenceNumber, suggestedDonation, isPreSigned, isFree
- **relations**: requestedFor→Enrolment, fulfilledBy→PerpetualFolder

## Perpetual Folder
- **genus**: `cco:ont00000995`
- **definition**: A physical leatherette-covered folder used to maintain a perpetual enrollment of a living or deceased person in daily Masses and prayers.
- **attributes**: folderName, coverColor, suggestedDonation, hasSocietyLogo
- **relations**: containsEnrolment→Enrolment, designatedFor→Enrollee

## Enrolment
- **genus**: `bfo:0000015`
- **definition**: The process or state of being enrolled in the daily Masses and prayers of the Society for a specified duration.
- **attributes**: enrolmentStatus, durationYears, donationAmount, enrolmentDate
- **relations**: initiatedBy→OccasionCard, managedBy→PerpetualFolder, appliesTo→Enrollee

## Enrollee
- **genus**: `bfo:0000004`
- **definition**: A living or deceased person who is the subject of a memorial enrollment in the Society's prayers and Masses.
- **attributes**: fullName, isDeceased, relationshipToRequester
- **relations**: subjectOf→Enrolment, associatedWith→PerpetualFolder

## Order Request
- **genus**: `cco:ont00000995`
- **definition**: A formal request submitted by a customer to purchase occasion cards or perpetual folders, including quantity and delivery details.
- **attributes**: requestId, submissionDate, deliveryMethod, totalQuantity
- **relations**: includesCard→OccasionCard, includesFolder→PerpetualFolder, submittedBy→Enrollee
