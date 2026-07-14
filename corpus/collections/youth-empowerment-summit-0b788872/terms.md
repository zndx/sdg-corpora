# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Youth Empowerment Summit
- **genus**: `bfo:0000015`
- **definition**: An annual conference event focused on youth leadership development, activist training, and community building for LGBT and allied youth.
- **attributes**: summitIdentifier, editionNumber, startDate, endDate, totalAttendance, currentTheme
- **relations**: hostedBy→EducationalInstitution, organizedBy→YouthOrganization, includes→ConferenceWorkshop, includes→PanelDiscussion

## Educational Institution
- **genus**: `bfo:0000040`
- **definition**: A physical or organizational entity providing formal education, serving as a venue for conferences or a site of study for participants.
- **attributes**: institutionId, institutionName, city, state, schoolLevel, isSafeSpace
- **relations**: hosts→YouthEmpowermentSummit, enrolls→YouthParticipant

## Youth Organization
- **genus**: `bfo:0000040`
- **definition**: A formal group or network dedicated to youth leadership, social justice advocacy, and community support.
- **attributes**: orgId, orgName, headquartersCity, headquartersState, operatingModel, youthBoardProportion
- **relations**: organizes→YouthEmpowermentSummit, employs→StaffMember, supports→YouthParticipant

## Youth Participant
- **genus**: `bfo:0000002`
- **definition**: An individual youth attending or participating in the summit, workshops, or organizational activities.
- **attributes**: participantId, fullName, gradeLevel, schoolAffiliation, identityGroup, role
- **relations**: attends→YouthEmpowermentSummit, enrolledAt→EducationalInstitution, participatesIn→ConferenceWorkshop, discusses→PanelDiscussion

## Conference Workshop
- **genus**: `bfo:0000015`
- **definition**: A structured educational or training session offered during the summit to develop skills or discuss specific topics.
- **attributes**: workshopId, workshopTitle, topic, durationMinutes, isYouthOnly, isComprehensive
- **relations**: partOf→YouthEmpowermentSummit, attendedBy→YouthParticipant, facilitatedBy→StaffMember

## Panel Discussion
- **genus**: `bfo:0000015`
- **definition**: A structured group conversation featuring multiple speakers and a moderator to discuss a specific theme or issue.
- **attributes**: panelId, panelTheme, numberOfPanelists, moderatorName, isRecorded, discussionFocus
- **relations**: partOf→YouthEmpowermentSummit, features→StaffMember, attendedBy→YouthParticipant

## Staff Member
- **genus**: `bfo:0000002`
- **definition**: An individual employed by the youth organization, serving in roles such as communications, training, or moderation.
- **attributes**: staffId, fullName, jobTitle, isYouth, isTrainer, isModerator
- **relations**: employedBy→YouthOrganization, facilitates→ConferenceWorkshop, moderates→PanelDiscussion
