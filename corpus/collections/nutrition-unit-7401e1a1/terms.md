# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Children's Nutrition Unit
- **genus**: `bfo:0000040`
- **definition**: A specialized health facility established by an NGO to deliver inpatient, outpatient, and community-based nutrition services to malnourished children and women in urban slum areas.
- **attributes**: unitId, establishedDate, annualBudget, currencyCode, serviceStatus, operationalScope, targetPopulation, managementQuality
- **relations**: locatedIn→GeographicArea, fundedBy→FundingAgency, deliversServiceTo→BeneficiaryGroup, conductsResearch→ResearchStudy, providesTrainingTo→StaffMember

## Dhaka Slum Area
- **genus**: `bfo:0000002`
- **definition**: A densely populated urban slum region in Dhaka, Bangladesh, characterized by high mortality and morbidity rates, serving as the operational context for nutrition interventions.
- **attributes**: areaId, areaName, populationDensity, mortalityRate, morbidityRate, administrativeZone, socioeconomicStatus, infrastructureLevel
- **relations**: contains→NutritionUnit, contains→BeneficiaryGroup, adjacentTo→GeographicArea

## Malnourished Children and Women
- **genus**: `bfo:0000002`
- **definition**: A demographic cohort of children and women from poor slum communities who are the primary recipients of nutrition rehabilitation and health education services.
- **attributes**: groupId, groupName, ageRange, gender, enrollmentDate, dischargeDate, recoveryStatus, participationLevel
- **relations**: receivesServiceFrom→NutritionUnit, participatesIn→TrainingProgram, monitoredBy→GrowthMonitoringRecord, referredTo→ReferralFacility

## Staff Training Initiative
- **genus**: `bfo:0000015`
- **definition**: A structured educational activity designed to build capacity in Government and NGO staff on nutrition rehabilitation techniques, health education, and operational research methodologies.
- **attributes**: programId, programName, startDate, endDate, durationHours, targetAudience, completionRate, effectivenessRating
- **relations**: deliveredBy→NutritionUnit, attends→StaffMember, usesCurriculum→TrainingCurriculum, evaluatedBy→EvaluationReport

## Trained Health Worker
- **genus**: `bfo:0000002`
- **definition**: An individual employed by a Government or NGO who receives training in nutrition service delivery and operational research to improve community health outcomes.
- **attributes**: staffId, fullName, role, employer, trainingCompletionDate, performanceRating, motivationLevel, yearsOfExperience
- **relations**: trainedIn→TrainingProgram, worksFor→FundingAgency, supervises→BeneficiaryGroup, participatesIn→ResearchStudy

## Nutritional Impact Assessment
- **genus**: `bfo:0000015`
- **definition**: A systematic investigation conducted by the Nutrition Unit to evaluate the effectiveness of malnutrition treatment protocols, community health interventions, and training program outcomes.
- **attributes**: studyId, studyTitle, startDate, endDate, studyType, sampleSize, primaryOutcome, publicationStatus
- **relations**: conductedBy→NutritionUnit, involves→StaffMember, measures→BeneficiaryGroup, informs→PolicyRecommendation

## Government Nutrition Policy Advisory
- **genus**: `bfo:0000040`
- **definition**: A formal suggestion or directive derived from research findings and program evaluations, intended to influence Government of Bangladesh nutrition policy and service delivery frameworks.
- **attributes**: policyId, policyTitle, issueDate, targetPolicyArea, adoptionStatus, influenceLevel, sourceStudy
- **relations**: derivedFrom→ResearchStudy, submittedTo→GovernmentBody, addresses→BeneficiaryGroup, implementedBy→NutritionUnit

## Ministry of Health and Family Welfare
- **genus**: `bfo:0000040`
- **definition**: The official state authority responsible for formulating and implementing national health and nutrition policies, serving as the primary recipient of advisory recommendations from the Nutrition Unit.
- **attributes**: bodyId, bodyName, countryCode, policyStatus, budgetAllocation, coordinationLevel, lastPolicyReview
- **relations**: receivesRecommendationFrom→PolicyRecommendation, funds→NutritionUnit, employs→StaffMember, coordinatesWith→FundingAgency
