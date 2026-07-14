# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Society Charter
- **genus**: `cco:ont00000958`
- **definition**: The foundational legal and operational document establishing the American Society of Pediatric Otolaryngology, including its name, offices, and purposes.
- **attributes**: legalName, principalOfficeAddress, registeredOfficeAddress, jurisdictionState, charitablePurposeStatement

## Membership Category
- **genus**: `bfo:0000023`
- **definition**: A specific role or classification defining the rights, eligibility, and status of an individual within the Society.
- **attributes**: categoryName, requiresMedicalLicense, requiresBoardCertification, requiresFellowshipTraining, requiresPeerRecommendations, requiresPublications
- **relations**: governs→SocietyCharter

## Medical Professional
- **genus**: `bfo:0000002`
- **definition**: A licensed physician or surgeon specializing in otolaryngology who is eligible for or holds membership in the Society.
- **attributes**: licenseState, boardCertificationBody, pediatricPracticePercentage, yearsPostFellowship, peerReviewPublicationsCount, meetsEligibilityCriteria
- **relations**: holdsRole→MembershipCategory, attends→SocietyMeeting

## Society Meeting
- **genus**: `bfo:0000015`
- **definition**: A regular postgraduate meeting or seminar sponsored by the Society for the dissemination of knowledge in pediatric otolaryngology.
- **attributes**: meetingDate, meetingType, location, isEligibilityRequirement
- **relations**: sponsoredBy→SocietyCharter, attendedBy→MedicalProfessional

## Fellowship Program
- **genus**: `bfo:0000015`
- **definition**: A specialized training program in pediatric otolaryngology that a candidate must complete to be eligible for certain membership categories.
- **attributes**: programName, durationYears, isPediatricOtolaryngology, completionDate
- **relations**: completedBy→MedicalProfessional, establishedBy→SocietyCharter
