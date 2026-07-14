# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Mental Health Education Program
- **genus**: `bfo:0000015`
- **definition**: An organized educational activity designed to reduce stigma and promote help-seeking behavior regarding mental health issues among youth.
- **attributes**: programIdentifier, programTitle, targetAgeGroup, deliveryMode, isEvidenceBased, startDate, endDate, status
- **relations**: deliveredBy→TrainedSpeaker, targetsAudience→YouthDemographic, addressesIssue→MentalHealthIssue, takesPlaceAt→EducationalVenue

## Trained Speaker
- **genus**: `bfo:0000015`
- **definition**: A young adult who has received specific training to deliver mental health education presentations and share personal recovery stories.
- **attributes**: speakerIdentifier, fullName, trainingCompletionDate, specialization, presentationCount, isAvailable, bioUrl
- **relations**: deliversProgram→MentalHealthEducationProgram, represents→MentalHealthIssue

## Youth Demographic
- **genus**: `cco:ont00000995`
- **definition**: A defined group of students or community members targeted by mental health education programs, categorized by age and role.
- **attributes**: demographicIdentifier, ageRangeStart, ageRangeEnd, role, institutionType, totalReached
- **relations**: participatesIn→MentalHealthEducationProgram, isTargetOf→MentalHealthIssue

## Mental Health Issue
- **genus**: `bfo:0000015`
- **definition**: A specific mental health condition, behavior, or social issue addressed by the educational programs, such as suicide, bullying, or substance abuse.
- **attributes**: issueCode, issueName, severityLevel, isTreatable, prevalenceInTeens, barrierToTreatment
- **relations**: addressedBy→MentalHealthEducationProgram, affects→YouthDemographic

## Educational Venue
- **genus**: `bfo:0000015`
- **definition**: A physical or organizational location where mental health education programs are delivered, such as schools, community centers, or conferences.
- **attributes**: venueIdentifier, venueName, address, venueType, capacity, isAccessible
- **relations**: hostsProgram→MentalHealthEducationProgram, servesDemographic→YouthDemographic

## Prevention Initiative
- **genus**: `bfo:0000015`
- **definition**: A specific campaign or program component designed to promote awareness and teach actionable steps for suicide prevention and mental health advocacy.
- **attributes**: initiativeIdentifier, initiativeName, launchDate, targetBehavior, isBestPractice, qualifiesForTraining
- **relations**: supportsProgram→MentalHealthEducationProgram, targetsIssue→MentalHealthIssue
