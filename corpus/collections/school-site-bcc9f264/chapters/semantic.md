The chapter has been written to `/tmp/harness_semantic_ripit6bn/chapter.md` (1,850 words). All 7 `` and 25 `` payload blocks are embedded exactly once, and the prose covers every base table's columns and representative values, interprets each view's join, and closes with a synthesis paragraph.

## Data appendix

**Table `SchoolSite`**

| id | siteId | streetAddress | city | county | postalCode | country | latitude | longitude | eventId | programmeId | memberId | enrolmentId |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 102 | composite-street-15 | integrated-city-34 | primary-county-52 | 9125611 | compact-country-26 | 13.95 | 21.20 | 100 | 1 | 1 | 1 |
| 2 | 1336166 | primary-street-16 | seasonal-city-35 | adaptive-county-53 | ChIJt4hBkzhu5kcRJJDUNqGUpso | composite-country-27 | 17.90 | 25.40 | 101 | 2 | 2 | 2 |
| 3 | 726040 | adaptive-street-17 | regional-city-36 | distributed-county-54 | 3001009030200 | primary-country-28 | 21.85 | 29.60 | 102 | 3 | 3 | 3 |
| 4 | Bjornfant | distributed-street-18 | legacy-city-37 | baseline-county-55 | 4060635 | adaptive-country-29 | 25.80 | 33.80 | 103 | 4 | 4 | 4 |

**Table `InspectionEvent`**

| id | inspectionId | startDate | endDate | inspectionType | overallEffectiveness | qualityOfEducation | behaviourAndAttitudes | personalDevelopment | leadershipAndManagement | welfareAndSafeguarding | siteId | programmeId | outcomeId |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 100 | BJanecke | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | full | outstanding | outstanding | outstanding | outstanding | outstanding | outstanding | 1 | 1 | 100 |
| 101 | 575199 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | partial | good | good | good | good | good | good | 2 | 2 | 101 |
| 102 | state_uk_4 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | monitoring | requires improvement | requires improvement | requires improvement | requires improvement | requires improvement | requires improvement | 3 | 3 | 102 |
| 103 | 8350011 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | full | inadequate | inadequate | inadequate | inadequate | inadequate | inadequate | 4 | 4 | 103 |

**Table `CurriculumProgramme`**

| programmeId | programmeName | subjectArea | targetAgeGroup | isCore | isVocational | sequencingStrategy | phonicsApproach | siteId | enrolmentId | activityId | outcomeId |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | Extended Standard | mathematics | primary | false | true | spiral | consistent | 1 | 1 | 100 | 100 |
| 2 | Pilot Framework A | reading | secondary | true | false | linear | inconsistent | 2 | 2 | 101 | 101 |
| 3 | Baseline Protocol | vocational | sixth form | false | true | modular | not applicable | 3 | 3 | 102 | 102 |
| 4 | Distributed Programme | personal development | primary | true | false | spiral | consistent | 4 | 4 | 103 | 103 |

**Table `StudentEnrolment`**

| enrolmentId | studentId | dateOfBirth | gender | attendanceRate | persistentAbsence | ehcPlan | ehcPlanId | currentYearGroup | isSixthForm | siteId | programmeId | outcomeId | memberId | createdAt |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 392507 | 2025-04-02 | male | 15.95 | false | false | 4793490 | 43 | true | 1 | 1 | 100 | 1 | 2025-01-01 00:14:00 |
| 2 | 25388256 | 2022-09-13 | female | 18.90 | true | true | 9568451 | 53 | false | 2 | 2 | 101 | 2 | 2025-02-06 03:14:00 |
| 3 | id_16 | 2023-02-24 | non-binary | 21.85 | false | false | 10445618 | 63 | true | 3 | 3 | 102 | 3 | 2025-03-11 06:14:00 |
| 4 | gd_taxc_2211 | 2024-07-08 | prefer not to say | 24.80 | true | true | 937739 | 73 | false | 4 | 4 | 103 | 4 | 2025-04-16 09:14:00 |

**Table `StudentOutcome`**

| id | outcomeId | outcomeType | qualificationName | qualificationGrade | destinationType | destinationProvider | achievementDate | isSuccessful | enrolmentId | programmeId | memberId |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 100 | 2618555 | qualification | Integrated Series A | pilot-qualific-14 | further education | distributed-destinat-66 | 2022-05-05 | true | 1 | 1 | 1 |
| 101 | lu_tax_code_template_m46 | destination | Extended Assessment | extended-qualific-15 | employment | baseline-destinat-67 | 2023-10-16 | false | 2 | 2 | 2 |
| 102 | 168561 | personal development | Pilot Survey | integrated-qualific-16 | training | pilot-destinat-68 | 2024-03-27 | true | 3 | 3 | 3 |
| 103 | 1210-0007-M | qualification | Baseline Corridor D | seasonal-qualific-17 | other | extended-destinat-69 | 2025-08-11 | false | 4 | 4 | 4 |

**Table `StaffMember`**

| id | staffId | staffName | role | specialism | isQualified | yearsOfService | workloadWellbeing | siteId | programmeId | enrolmentId | outcomeId |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 937735 | Jim Henson | teacher | mathematics | false | 30 | good | 1 | 1 | 1 | 100 |
| 2 | 3158139 | Purnima Medical | clinical team | reading | true | 40 | concerning | 2 | 2 | 2 | 101 |
| 3 | 8189502 | Deanna Turner | pastoral care | phonics | false | 50 | excellent | 3 | 3 | 3 | 102 |
| 4 | 69438 | Kimberly Myers | administration | vocational | true | 60 | good | 4 | 4 | 4 | 103 |

**Table `LearningActivity`**

| id | activityId | activityName | activityType | location | date | participantCount | isOptional | memberId | enrolmentId | programmeId |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | 8843761 | Composite Programme | trip | extended-location-99 | 2023-02-05T13:03:00 | 100 | true | 1 | 1 | 1 |
| 101 | 4180957 | Compact Standard A | workshop | integrated-location-100 | 2024-07-16T20:20:00 | 27 | false | 2 | 2 | 2 |
| 102 | 168545 | Legacy Framework | club | seasonal-location-101 | 2025-12-27T03:37:00 | 23 | true | 3 | 3 | 3 |
| 103 | default_chart_a_account_53 | Regional Protocol | award programme | regional-location-102 | 2022-05-11T10:54:00 | 34 | false | 4 | 4 | 4 |

**View `school_site_inspection_event_view`**

```sql
CREATE VIEW school_site_inspection_event_view AS
SELECT a.id, a.siteId, a.streetAddress, a.city, b.id AS event_id, b.inspectionId AS event_inspectionId, b.startDate AS event_startDate
FROM SchoolSite a JOIN InspectionEvent b ON a.eventId = b.id;
```

| id | siteId | streetAddress | city | event_id | event_inspectionId | event_startDate |
|---|---|---|---|---|---|---|
| 1 | 102 | composite-street-15 | integrated-city-34 | 100 | BJanecke | 2022-09-05T20:24:00 |
| 2 | 1336166 | primary-street-16 | seasonal-city-35 | 101 | 575199 | 2023-02-16T03:41:00 |
| 3 | 726040 | adaptive-street-17 | regional-city-36 | 102 | state_uk_4 | 2024-07-27T10:58:00 |
| 4 | Bjornfant | distributed-street-18 | legacy-city-37 | 103 | 8350011 | 2025-12-11T17:15:00 |

**View `school_site_curriculum_programme_view`**

```sql
CREATE VIEW school_site_curriculum_programme_view AS
SELECT a.id, a.siteId, a.streetAddress, a.city, b.programmeId AS programme_programmeId, b.programmeName AS programme_programmeName, b.subjectArea AS programme_subjectArea
FROM SchoolSite a JOIN CurriculumProgramme b ON a.programmeId = b.programmeId;
```

| id | siteId | streetAddress | city | programme_programmeId | programme_programmeName | programme_subjectArea |
|---|---|---|---|---|---|---|
| 1 | 102 | composite-street-15 | integrated-city-34 | 1 | Extended Standard | mathematics |
| 2 | 1336166 | primary-street-16 | seasonal-city-35 | 2 | Pilot Framework A | reading |
| 3 | 726040 | adaptive-street-17 | regional-city-36 | 3 | Baseline Protocol | vocational |
| 4 | Bjornfant | distributed-street-18 | legacy-city-37 | 4 | Distributed Programme | personal development |

**View `school_site_staff_member_view`**

```sql
CREATE VIEW school_site_staff_member_view AS
SELECT a.id, a.siteId, a.streetAddress, a.city, b.id AS member_id, b.staffId AS member_staffId, b.staffName AS member_staffName
FROM SchoolSite a JOIN StaffMember b ON a.memberId = b.id;
```

| id | siteId | streetAddress | city | member_id | member_staffId | member_staffName |
|---|---|---|---|---|---|---|
| 1 | 102 | composite-street-15 | integrated-city-34 | 1 | 937735 | Jim Henson |
| 2 | 1336166 | primary-street-16 | seasonal-city-35 | 2 | 3158139 | Purnima Medical |
| 3 | 726040 | adaptive-street-17 | regional-city-36 | 3 | 8189502 | Deanna Turner |
| 4 | Bjornfant | distributed-street-18 | legacy-city-37 | 4 | 69438 | Kimberly Myers |

**View `school_site_student_enrolment_view`**

```sql
CREATE VIEW school_site_student_enrolment_view AS
SELECT a.id, a.siteId, a.streetAddress, a.city, b.enrolmentId AS enrolment_enrolmentId, b.studentId AS enrolment_studentId, b.dateOfBirth AS enrolment_dateOfBirth
FROM SchoolSite a JOIN StudentEnrolment b ON a.enrolmentId = b.enrolmentId;
```

| id | siteId | streetAddress | city | enrolment_enrolmentId | enrolment_studentId | enrolment_dateOfBirth |
|---|---|---|---|---|---|---|
| 1 | 102 | composite-street-15 | integrated-city-34 | 1 | 392507 | 2025-04-02 |
| 2 | 1336166 | primary-street-16 | seasonal-city-35 | 2 | 25388256 | 2022-09-13 |
| 3 | 726040 | adaptive-street-17 | regional-city-36 | 3 | id_16 | 2023-02-24 |
| 4 | Bjornfant | distributed-street-18 | legacy-city-37 | 4 | gd_taxc_2211 | 2024-07-08 |

**View `inspection_event_school_site_view`**

```sql
CREATE VIEW inspection_event_school_site_view AS
SELECT a.id, a.inspectionId, a.startDate, a.endDate, b.id AS site_id, b.siteId AS site_siteId, b.streetAddress AS site_streetAddress
FROM InspectionEvent a JOIN SchoolSite b ON a.siteId = b.id;
```

| id | inspectionId | startDate | endDate | site_id | site_siteId | site_streetAddress |
|---|---|---|---|---|---|---|
| 100 | BJanecke | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 1 | 102 | composite-street-15 |
| 101 | 575199 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 2 | 1336166 | primary-street-16 |
| 102 | state_uk_4 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 3 | 726040 | adaptive-street-17 |
| 103 | 8350011 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 4 | Bjornfant | distributed-street-18 |

**View `inspection_event_curriculum_programme_view`**

```sql
CREATE VIEW inspection_event_curriculum_programme_view AS
SELECT a.id, a.inspectionId, a.startDate, a.endDate, b.programmeId AS programme_programmeId, b.programmeName AS programme_programmeName, b.subjectArea AS programme_subjectArea
FROM InspectionEvent a JOIN CurriculumProgramme b ON a.programmeId = b.programmeId;
```

| id | inspectionId | startDate | endDate | programme_programmeId | programme_programmeName | programme_subjectArea |
|---|---|---|---|---|---|---|
| 100 | BJanecke | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 1 | Extended Standard | mathematics |
| 101 | 575199 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 2 | Pilot Framework A | reading |
| 102 | state_uk_4 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 3 | Baseline Protocol | vocational |
| 103 | 8350011 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 4 | Distributed Programme | personal development |

**View `inspection_event_student_outcome_view`**

```sql
CREATE VIEW inspection_event_student_outcome_view AS
SELECT a.id, a.inspectionId, a.startDate, a.endDate, b.id AS outcome_id, b.outcomeId AS outcome_outcomeId, b.outcomeType AS outcome_outcomeType
FROM InspectionEvent a JOIN StudentOutcome b ON a.outcomeId = b.id;
```

| id | inspectionId | startDate | endDate | outcome_id | outcome_outcomeId | outcome_outcomeType |
|---|---|---|---|---|---|---|
| 100 | BJanecke | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 100 | 2618555 | qualification |
| 101 | 575199 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 101 | lu_tax_code_template_m46 | destination |
| 102 | state_uk_4 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 102 | 168561 | personal development |
| 103 | 8350011 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 103 | 1210-0007-M | qualification |

**View `curriculum_programme_school_site_view`**

```sql
CREATE VIEW curriculum_programme_school_site_view AS
SELECT a.programmeId, a.programmeName, a.subjectArea, a.targetAgeGroup, b.id AS site_id, b.siteId AS site_siteId, b.streetAddress AS site_streetAddress
FROM CurriculumProgramme a JOIN SchoolSite b ON a.siteId = b.id;
```

| programmeId | programmeName | subjectArea | targetAgeGroup | site_id | site_siteId | site_streetAddress |
|---|---|---|---|---|---|---|
| 1 | Extended Standard | mathematics | primary | 1 | 102 | composite-street-15 |
| 2 | Pilot Framework A | reading | secondary | 2 | 1336166 | primary-street-16 |
| 3 | Baseline Protocol | vocational | sixth form | 3 | 726040 | adaptive-street-17 |
| 4 | Distributed Programme | personal development | primary | 4 | Bjornfant | distributed-street-18 |

**View `curriculum_programme_student_enrolment_view`**

```sql
CREATE VIEW curriculum_programme_student_enrolment_view AS
SELECT a.programmeId, a.programmeName, a.subjectArea, a.targetAgeGroup, b.enrolmentId AS enrolment_enrolmentId, b.studentId AS enrolment_studentId, b.dateOfBirth AS enrolment_dateOfBirth
FROM CurriculumProgramme a JOIN StudentEnrolment b ON a.enrolmentId = b.enrolmentId;
```

| programmeId | programmeName | subjectArea | targetAgeGroup | enrolment_enrolmentId | enrolment_studentId | enrolment_dateOfBirth |
|---|---|---|---|---|---|---|
| 1 | Extended Standard | mathematics | primary | 1 | 392507 | 2025-04-02 |
| 2 | Pilot Framework A | reading | secondary | 2 | 25388256 | 2022-09-13 |
| 3 | Baseline Protocol | vocational | sixth form | 3 | id_16 | 2023-02-24 |
| 4 | Distributed Programme | personal development | primary | 4 | gd_taxc_2211 | 2024-07-08 |

**View `curriculum_programme_learning_activity_view`**

```sql
CREATE VIEW curriculum_programme_learning_activity_view AS
SELECT a.programmeId, a.programmeName, a.subjectArea, a.targetAgeGroup, b.id AS activity_id, b.activityId AS activity_activityId, b.activityName AS activity_activityName
FROM CurriculumProgramme a JOIN LearningActivity b ON a.activityId = b.id;
```

| programmeId | programmeName | subjectArea | targetAgeGroup | activity_id | activity_activityId | activity_activityName |
|---|---|---|---|---|---|---|
| 1 | Extended Standard | mathematics | primary | 100 | 8843761 | Composite Programme |
| 2 | Pilot Framework A | reading | secondary | 101 | 4180957 | Compact Standard A |
| 3 | Baseline Protocol | vocational | sixth form | 102 | 168545 | Legacy Framework |
| 4 | Distributed Programme | personal development | primary | 103 | default_chart_a_account_53 | Regional Protocol |

**View `curriculum_programme_student_outcome_view`**

```sql
CREATE VIEW curriculum_programme_student_outcome_view AS
SELECT a.programmeId, a.programmeName, a.subjectArea, a.targetAgeGroup, b.id AS outcome_id, b.outcomeId AS outcome_outcomeId, b.outcomeType AS outcome_outcomeType
FROM CurriculumProgramme a JOIN StudentOutcome b ON a.outcomeId = b.id;
```

| programmeId | programmeName | subjectArea | targetAgeGroup | outcome_id | outcome_outcomeId | outcome_outcomeType |
|---|---|---|---|---|---|---|
| 1 | Extended Standard | mathematics | primary | 100 | 2618555 | qualification |
| 2 | Pilot Framework A | reading | secondary | 101 | lu_tax_code_template_m46 | destination |
| 3 | Baseline Protocol | vocational | sixth form | 102 | 168561 | personal development |
| 4 | Distributed Programme | personal development | primary | 103 | 1210-0007-M | qualification |

**View `student_enrolment_school_site_view`**

```sql
CREATE VIEW student_enrolment_school_site_view AS
SELECT a.enrolmentId, a.studentId, a.dateOfBirth, a.gender, b.id AS site_id, b.siteId AS site_siteId, b.streetAddress AS site_streetAddress
FROM StudentEnrolment a JOIN SchoolSite b ON a.siteId = b.id;
```

| enrolmentId | studentId | dateOfBirth | gender | site_id | site_siteId | site_streetAddress |
|---|---|---|---|---|---|---|
| 1 | 392507 | 2025-04-02 | male | 1 | 102 | composite-street-15 |
| 2 | 25388256 | 2022-09-13 | female | 2 | 1336166 | primary-street-16 |
| 3 | id_16 | 2023-02-24 | non-binary | 3 | 726040 | adaptive-street-17 |
| 4 | gd_taxc_2211 | 2024-07-08 | prefer not to say | 4 | Bjornfant | distributed-street-18 |

**View `student_enrolment_curriculum_programme_view`**

```sql
CREATE VIEW student_enrolment_curriculum_programme_view AS
SELECT a.enrolmentId, a.studentId, a.dateOfBirth, a.gender, b.programmeId AS programme_programmeId, b.programmeName AS programme_programmeName, b.subjectArea AS programme_subjectArea
FROM StudentEnrolment a JOIN CurriculumProgramme b ON a.programmeId = b.programmeId;
```

| enrolmentId | studentId | dateOfBirth | gender | programme_programmeId | programme_programmeName | programme_subjectArea |
|---|---|---|---|---|---|---|
| 1 | 392507 | 2025-04-02 | male | 1 | Extended Standard | mathematics |
| 2 | 25388256 | 2022-09-13 | female | 2 | Pilot Framework A | reading |
| 3 | id_16 | 2023-02-24 | non-binary | 3 | Baseline Protocol | vocational |
| 4 | gd_taxc_2211 | 2024-07-08 | prefer not to say | 4 | Distributed Programme | personal development |

**View `student_enrolment_student_outcome_view`**

```sql
CREATE VIEW student_enrolment_student_outcome_view AS
SELECT a.enrolmentId, a.studentId, a.dateOfBirth, a.gender, b.id AS outcome_id, b.outcomeId AS outcome_outcomeId, b.outcomeType AS outcome_outcomeType
FROM StudentEnrolment a JOIN StudentOutcome b ON a.outcomeId = b.id;
```

| enrolmentId | studentId | dateOfBirth | gender | outcome_id | outcome_outcomeId | outcome_outcomeType |
|---|---|---|---|---|---|---|
| 1 | 392507 | 2025-04-02 | male | 100 | 2618555 | qualification |
| 2 | 25388256 | 2022-09-13 | female | 101 | lu_tax_code_template_m46 | destination |
| 3 | id_16 | 2023-02-24 | non-binary | 102 | 168561 | personal development |
| 4 | gd_taxc_2211 | 2024-07-08 | prefer not to say | 103 | 1210-0007-M | qualification |

**View `student_enrolment_staff_member_view`**

```sql
CREATE VIEW student_enrolment_staff_member_view AS
SELECT a.enrolmentId, a.studentId, a.dateOfBirth, a.gender, b.id AS member_id, b.staffId AS member_staffId, b.staffName AS member_staffName
FROM StudentEnrolment a JOIN StaffMember b ON a.memberId = b.id;
```

| enrolmentId | studentId | dateOfBirth | gender | member_id | member_staffId | member_staffName |
|---|---|---|---|---|---|---|
| 1 | 392507 | 2025-04-02 | male | 1 | 937735 | Jim Henson |
| 2 | 25388256 | 2022-09-13 | female | 2 | 3158139 | Purnima Medical |
| 3 | id_16 | 2023-02-24 | non-binary | 3 | 8189502 | Deanna Turner |
| 4 | gd_taxc_2211 | 2024-07-08 | prefer not to say | 4 | 69438 | Kimberly Myers |

**View `student_outcome_student_enrolment_view`**

```sql
CREATE VIEW student_outcome_student_enrolment_view AS
SELECT a.id, a.outcomeId, a.outcomeType, a.qualificationName, b.enrolmentId AS enrolment_enrolmentId, b.studentId AS enrolment_studentId, b.dateOfBirth AS enrolment_dateOfBirth
FROM StudentOutcome a JOIN StudentEnrolment b ON a.enrolmentId = b.enrolmentId;
```

| id | outcomeId | outcomeType | qualificationName | enrolment_enrolmentId | enrolment_studentId | enrolment_dateOfBirth |
|---|---|---|---|---|---|---|
| 100 | 2618555 | qualification | Integrated Series A | 1 | 392507 | 2025-04-02 |
| 101 | lu_tax_code_template_m46 | destination | Extended Assessment | 2 | 25388256 | 2022-09-13 |
| 102 | 168561 | personal development | Pilot Survey | 3 | id_16 | 2023-02-24 |
| 103 | 1210-0007-M | qualification | Baseline Corridor D | 4 | gd_taxc_2211 | 2024-07-08 |

**View `student_outcome_curriculum_programme_view`**

```sql
CREATE VIEW student_outcome_curriculum_programme_view AS
SELECT a.id, a.outcomeId, a.outcomeType, a.qualificationName, b.programmeId AS programme_programmeId, b.programmeName AS programme_programmeName, b.subjectArea AS programme_subjectArea
FROM StudentOutcome a JOIN CurriculumProgramme b ON a.programmeId = b.programmeId;
```

| id | outcomeId | outcomeType | qualificationName | programme_programmeId | programme_programmeName | programme_subjectArea |
|---|---|---|---|---|---|---|
| 100 | 2618555 | qualification | Integrated Series A | 1 | Extended Standard | mathematics |
| 101 | lu_tax_code_template_m46 | destination | Extended Assessment | 2 | Pilot Framework A | reading |
| 102 | 168561 | personal development | Pilot Survey | 3 | Baseline Protocol | vocational |
| 103 | 1210-0007-M | qualification | Baseline Corridor D | 4 | Distributed Programme | personal development |

**View `student_outcome_staff_member_view`**

```sql
CREATE VIEW student_outcome_staff_member_view AS
SELECT a.id, a.outcomeId, a.outcomeType, a.qualificationName, b.id AS member_id, b.staffId AS member_staffId, b.staffName AS member_staffName
FROM StudentOutcome a JOIN StaffMember b ON a.memberId = b.id;
```

| id | outcomeId | outcomeType | qualificationName | member_id | member_staffId | member_staffName |
|---|---|---|---|---|---|---|
| 100 | 2618555 | qualification | Integrated Series A | 1 | 937735 | Jim Henson |
| 101 | lu_tax_code_template_m46 | destination | Extended Assessment | 2 | 3158139 | Purnima Medical |
| 102 | 168561 | personal development | Pilot Survey | 3 | 8189502 | Deanna Turner |
| 103 | 1210-0007-M | qualification | Baseline Corridor D | 4 | 69438 | Kimberly Myers |

**View `staff_member_school_site_view`**

```sql
CREATE VIEW staff_member_school_site_view AS
SELECT a.id, a.staffId, a.staffName, a.role, b.id AS site_id, b.siteId AS site_siteId, b.streetAddress AS site_streetAddress
FROM StaffMember a JOIN SchoolSite b ON a.siteId = b.id;
```

| id | staffId | staffName | role | site_id | site_siteId | site_streetAddress |
|---|---|---|---|---|---|---|
| 1 | 937735 | Jim Henson | teacher | 1 | 102 | composite-street-15 |
| 2 | 3158139 | Purnima Medical | clinical team | 2 | 1336166 | primary-street-16 |
| 3 | 8189502 | Deanna Turner | pastoral care | 3 | 726040 | adaptive-street-17 |
| 4 | 69438 | Kimberly Myers | administration | 4 | Bjornfant | distributed-street-18 |

**View `staff_member_curriculum_programme_view`**

```sql
CREATE VIEW staff_member_curriculum_programme_view AS
SELECT a.id, a.staffId, a.staffName, a.role, b.programmeId AS programme_programmeId, b.programmeName AS programme_programmeName, b.subjectArea AS programme_subjectArea
FROM StaffMember a JOIN CurriculumProgramme b ON a.programmeId = b.programmeId;
```

| id | staffId | staffName | role | programme_programmeId | programme_programmeName | programme_subjectArea |
|---|---|---|---|---|---|---|
| 1 | 937735 | Jim Henson | teacher | 1 | Extended Standard | mathematics |
| 2 | 3158139 | Purnima Medical | clinical team | 2 | Pilot Framework A | reading |
| 3 | 8189502 | Deanna Turner | pastoral care | 3 | Baseline Protocol | vocational |
| 4 | 69438 | Kimberly Myers | administration | 4 | Distributed Programme | personal development |

**View `staff_member_student_enrolment_view`**

```sql
CREATE VIEW staff_member_student_enrolment_view AS
SELECT a.id, a.staffId, a.staffName, a.role, b.enrolmentId AS enrolment_enrolmentId, b.studentId AS enrolment_studentId, b.dateOfBirth AS enrolment_dateOfBirth
FROM StaffMember a JOIN StudentEnrolment b ON a.enrolmentId = b.enrolmentId;
```

| id | staffId | staffName | role | enrolment_enrolmentId | enrolment_studentId | enrolment_dateOfBirth |
|---|---|---|---|---|---|---|
| 1 | 937735 | Jim Henson | teacher | 1 | 392507 | 2025-04-02 |
| 2 | 3158139 | Purnima Medical | clinical team | 2 | 25388256 | 2022-09-13 |
| 3 | 8189502 | Deanna Turner | pastoral care | 3 | id_16 | 2023-02-24 |
| 4 | 69438 | Kimberly Myers | administration | 4 | gd_taxc_2211 | 2024-07-08 |

**View `staff_member_student_outcome_view`**

```sql
CREATE VIEW staff_member_student_outcome_view AS
SELECT a.id, a.staffId, a.staffName, a.role, b.id AS outcome_id, b.outcomeId AS outcome_outcomeId, b.outcomeType AS outcome_outcomeType
FROM StaffMember a JOIN StudentOutcome b ON a.outcomeId = b.id;
```

| id | staffId | staffName | role | outcome_id | outcome_outcomeId | outcome_outcomeType |
|---|---|---|---|---|---|---|
| 1 | 937735 | Jim Henson | teacher | 100 | 2618555 | qualification |
| 2 | 3158139 | Purnima Medical | clinical team | 101 | lu_tax_code_template_m46 | destination |
| 3 | 8189502 | Deanna Turner | pastoral care | 102 | 168561 | personal development |
| 4 | 69438 | Kimberly Myers | administration | 103 | 1210-0007-M | qualification |

**View `learning_activity_staff_member_view`**

```sql
CREATE VIEW learning_activity_staff_member_view AS
SELECT a.id, a.activityId, a.activityName, a.activityType, b.id AS member_id, b.staffId AS member_staffId, b.staffName AS member_staffName
FROM LearningActivity a JOIN StaffMember b ON a.memberId = b.id;
```

| id | activityId | activityName | activityType | member_id | member_staffId | member_staffName |
|---|---|---|---|---|---|---|
| 100 | 8843761 | Composite Programme | trip | 1 | 937735 | Jim Henson |
| 101 | 4180957 | Compact Standard A | workshop | 2 | 3158139 | Purnima Medical |
| 102 | 168545 | Legacy Framework | club | 3 | 8189502 | Deanna Turner |
| 103 | default_chart_a_account_53 | Regional Protocol | award programme | 4 | 69438 | Kimberly Myers |

**View `learning_activity_student_enrolment_view`**

```sql
CREATE VIEW learning_activity_student_enrolment_view AS
SELECT a.id, a.activityId, a.activityName, a.activityType, b.enrolmentId AS enrolment_enrolmentId, b.studentId AS enrolment_studentId, b.dateOfBirth AS enrolment_dateOfBirth
FROM LearningActivity a JOIN StudentEnrolment b ON a.enrolmentId = b.enrolmentId;
```

| id | activityId | activityName | activityType | enrolment_enrolmentId | enrolment_studentId | enrolment_dateOfBirth |
|---|---|---|---|---|---|---|
| 100 | 8843761 | Composite Programme | trip | 1 | 392507 | 2025-04-02 |
| 101 | 4180957 | Compact Standard A | workshop | 2 | 25388256 | 2022-09-13 |
| 102 | 168545 | Legacy Framework | club | 3 | id_16 | 2023-02-24 |
| 103 | default_chart_a_account_53 | Regional Protocol | award programme | 4 | gd_taxc_2211 | 2024-07-08 |

**View `learning_activity_curriculum_programme_view`**

```sql
CREATE VIEW learning_activity_curriculum_programme_view AS
SELECT a.id, a.activityId, a.activityName, a.activityType, b.programmeId AS programme_programmeId, b.programmeName AS programme_programmeName, b.subjectArea AS programme_subjectArea
FROM LearningActivity a JOIN CurriculumProgramme b ON a.programmeId = b.programmeId;
```

| id | activityId | activityName | activityType | programme_programmeId | programme_programmeName | programme_subjectArea |
|---|---|---|---|---|---|---|
| 100 | 8843761 | Composite Programme | trip | 1 | Extended Standard | mathematics |
| 101 | 4180957 | Compact Standard A | workshop | 2 | Pilot Framework A | reading |
| 102 | 168545 | Legacy Framework | club | 3 | Baseline Protocol | vocational |
| 103 | default_chart_a_account_53 | Regional Protocol | award programme | 4 | Distributed Programme | personal development |
