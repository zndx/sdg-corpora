# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Housing Advisory Case
- **genus**: `bfo:0000040`
- **definition**: A specific housing or homelessness matter requiring expert consultation, casework, or advisory support from the NHAS.
- **attributes**: caseId, caseType, status, priorityLevel, referralSource, dateOpened, dateClosed
- **relations**: handledBy→HousingSpecialist, servesClient→HousingClient, requiresTraining→TrainingModule

## Housing Specialist
- **genus**: `bfo:0000040`
- **definition**: A professional housing adviser or caseworker employed by or contracted to the NHAS to provide expert consultancy and casework.
- **attributes**: specialistId, fullName, specialization, employmentStatus, certificationLevel, contactEmail, contactPhone
- **relations**: providesAdviceFor→HousingAdvisoryCase, deliversTrainingFor→TrainingModule, worksFor→NHAS

## Housing Client
- **genus**: `bfo:0000040`
- **definition**: An individual or household seeking or receiving housing advice, support, or casework services from the NHAS.
- **attributes**: clientId, householdSize, currentHousingStatus, primaryNeed, dateOfReferral, hasDependents
- **relations**: receivesAdviceFrom→HousingAdvisoryCase, residesIn→GeographicArea

## Training Module
- **genus**: `bfo:0000040`
- **definition**: A structured educational session or course designed to upskill housing advisers on homelessness law, policy, and best practices.
- **attributes**: moduleId, title, deliveryMode, level, durationHours, isFree, lastUpdated
- **relations**: deliveredBy→HousingSpecialist, attends→HousingAdviser, coversTopic→LegalTopic

## Housing Adviser
- **genus**: `bfo:0000040`
- **definition**: A frontline professional working for a Local Citizens Advice, voluntary agency, or local authority who receives training and consultancy from the NHAS.
- **attributes**: adviserId, fullName, employerType, yearsExperience, lastTrainingDate, contactEmail
- **relations**: attendsTraining→TrainingModule, submitsCase→HousingAdvisoryCase, worksFor→NHAS

## National Homelessness Advice Service
- **genus**: `bfo:0000040`
- **definition**: The central organizational entity providing consultancy, training, and casework support for housing and homelessness advice in England.
- **attributes**: serviceId, fundingSource, operatingHours, isFree, establishedYear
- **relations**: employs→HousingSpecialist, supports→HousingAdviser, funds→TrainingModule

## Legal Topic
- **genus**: `bfo:0000040`
- **definition**: A specific area of housing law, policy, or case law that is covered in training modules or advisory consultations.
- **attributes**: topicId, topicName, category, lastReviewed, isCurrent
- **relations**: coveredIn→TrainingModule, appliedTo→HousingAdvisoryCase
