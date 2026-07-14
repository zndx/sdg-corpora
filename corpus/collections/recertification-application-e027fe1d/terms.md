# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Recertification Application
- **genus**: `cco:ont00000995`
- **definition**: A formal record submitted by a certified professional to request renewal of their certification status, listing earned recertification units and associated fees.
- **attributes**: applicationId, submissionDate, feeAmount, status, verificationStatus, ethicsPledgeSigned, ruTotalEarned, ruRequired
- **relations**: submittedBy→CertifiedProfessional, containsRURecord→RecertificationUnitRecord

## Certified Professional
- **genus**: `bfo:0000023`
- **definition**: An individual holding a professional certification who is subject to recertification requirements and ethical pledges.
- **attributes**: professionalId, certificationStatus, currentCertificationPeriodStart, currentCertificationPeriodEnd, ruRequirement, codeOfEthicsPledge, employmentType
- **relations**: submitsApplication→RecertificationApplication, holdsRoleIn→ProfessionalSocietyRole, enrolledInCourseAs→CourseEnrollment

## Recertification Unit Record
- **genus**: `cco:ont00000995`
- **definition**: A specific entry documenting a single activity or achievement that contributes to the total recertification units required for certification renewal.
- **attributes**: recordId, activityCategory, subCategory, ruCreditsEarned, activityDate, appliesToBodyOfKnowledge, doubleCountingAllowed, verificationRequired
- **relations**: partOfApplication→RecertificationApplication, linkedToActivity→ProfessionalActivity

## Professional Activity
- **genus**: `bfo:0000015`
- **definition**: A measurable professional engagement or contribution that qualifies for recertification units, such as publishing, teaching, or attending conferences.
- **attributes**: activityId, activityType, startDate, endDate, authorshipRole, accreditationStatus, isPartOfRegularDuties, creditsAwarded
- **relations**: performedBy→CertifiedProfessional, associatedWithDocument→ProfessionalDocument, associatedWithCourse→Course

## Professional Document
- **genus**: `cco:ont00000995`
- **definition**: A published work such as a journal article, magazine transaction, or conference proceeding that contributes to recertification units.
- **attributes**: documentId, title, publicationDate, publisher, documentType, appliesToBodyOfKnowledge, claimedOncePerPeriod, totalAuthors
- **relations**: authoredBy→CertifiedProfessional, linkedToActivity→ProfessionalActivity

## Course
- **genus**: `bfo:0000015`
- **definition**: An educational program or training session, either academic or professional, that contributes to recertification units when completed or audited.
- **attributes**: courseId, courseTitle, institution, courseLevel, completionDate, appliesToBodyOfKnowledge, isAudited, isSponsoredByEmployer
- **relations**: taughtBy→CertifiedProfessional, attendedBy→CertifiedProfessional, linkedToActivity→ProfessionalActivity

## Professional Society Role
- **genus**: `bfo:0000023`
- **definition**: A position held within a professional society, such as officer, committee chair, or member, which contributes to recertification units on a per-year basis.
- **attributes**: roleInstanceId, roleTitle, societyName, startDate, endDate, ruCreditsPerYear, appliesToBodyOfKnowledge
- **relations**: heldBy→CertifiedProfessional, linkedToActivity→ProfessionalActivity
