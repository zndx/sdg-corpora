## Educational Institution Management: Records, Relationships, and Cross-Referenced Perspectives

Educational institutions operate as complex ecosystems where physical locations, inspection regimes, curriculum design, student journeys, and staff expertise intersect in structured ways. The data model underpinning this domain captures each institution as a geolocated site, subjects it to periodic regulatory inspections, organises learning through formal curriculum programmes, tracks individual students from enrolment through to their post-study destinations, and records the professionals who deliver instruction and pastoral support. Every record carries identifiers that enable cross-referencing: a school site is linked to its inspection history, its active programmes, its enrolled students, and its staff; each inspection event carries effectiveness ratings across multiple quality domains; each curriculum programme specifies pedagogical choices such as sequencing strategy and phonics approach; each student enrolment records attendance patterns, special educational needs, and year group; each outcome captures qualifications earned and destinations achieved; and each staff member carries a role, a specialism, and a tenure. The following sections describe these entities in detail and then demonstrate how joined views reconstruct the operational relationships that practitioners rely on for reporting, auditing, and strategic planning.

**Table `SchoolSite`**

| id | siteId | streetAddress | city | county | postalCode | country | latitude | longitude | eventId | programmeId | memberId | enrolmentId |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 102 | composite-street-15 | integrated-city-34 | primary-county-52 | 9125611 | compact-country-26 | 13.95 | 21.20 | 100 | 1 | 1 | 1 |
| 2 | 1336166 | primary-street-16 | seasonal-city-35 | adaptive-county-53 | ChIJt4hBkzhu5kcRJJDUNqGUpso | composite-country-27 | 17.90 | 25.40 | 101 | 2 | 2 | 2 |
| 3 | 726040 | adaptive-street-17 | regional-city-36 | distributed-county-54 | 3001009030200 | primary-country-28 | 21.85 | 29.60 | 102 | 3 | 3 | 3 |
| 4 | Bjornfant | distributed-street-18 | legacy-city-37 | baseline-county-55 | 4060635 | adaptive-country-29 | 25.80 | 33.80 | 103 | 4 | 4 | 4 |

The SchoolSite table anchors the entire domain. Each row represents a physical institution with a unique site identifier, a full postal address spanning street, city, county, and country, and geographic coordinates expressed as latitude and longitude. The site record also carries foreign keys that tie it to the other entities in the domain: an inspection event, a curriculum programme, a staff member, and a student enrolment. Consider the first row, where site identifier 102 sits at composite-street-15 in integrated-city-34, within primary-county-52, postal code 9125611, in compact-country-26, at coordinates 13.95°N, 21.20°E. This site is associated with inspection event 100, curriculum programme 1, staff member 1, and student enrolment 1. The second row, site identifier 1336166, resides at primary-street-16 in seasonal-city-35 and carries a Google Place ID (ChIJt4hBkzhu5kcRJJDUNqGUpso) alongside its postal code, suggesting integration with external mapping services. The geographic spread across four sites—ranging from latitude 13.95 to 25.80 and longitude 21.20 to 33.80—illustrates a multi-site institution or a regional authority overseeing distinct locations.

**Table `InspectionEvent`**

| id | inspectionId | startDate | endDate | inspectionType | overallEffectiveness | qualityOfEducation | behaviourAndAttitudes | personalDevelopment | leadershipAndManagement | welfareAndSafeguarding | siteId | programmeId | outcomeId |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 100 | BJanecke | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | full | outstanding | outstanding | outstanding | outstanding | outstanding | outstanding | 1 | 1 | 100 |
| 101 | 575199 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | partial | good | good | good | good | good | good | 2 | 2 | 101 |
| 102 | state_uk_4 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | monitoring | requires improvement | requires improvement | requires improvement | requires improvement | requires improvement | requires improvement | 3 | 3 | 102 |
| 103 | 8350011 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | full | inadequate | inadequate | inadequate | inadequate | inadequate | inadequate | 4 | 4 | 103 |

Inspection events record the regulatory oversight that educational institutions undergo. Each event carries an inspection identifier, a start and end date, an inspection type (full, partial, or monitoring), and five effectiveness ratings covering quality of education, behaviour and attitudes, personal development, leadership and management, and welfare and safeguarding. The ratings follow a standard grading scale: outstanding, good, requires improvement, and inadequate. The first inspection event, identified as BJanecke, ran from 2022-09-01 to 2022-09-05 and was a full inspection that awarded outstanding across all five domains. The second event, 575199, was a partial inspection in February 2023 that rated good across all categories. The third, state_uk_4, was a monitoring inspection in July 2024 that found the institution requires improvement in every rated area. The fourth, 8350011, scheduled for December 2025, is a full inspection that has already been assigned inadequate ratings across the board. Each inspection is linked to a specific school site, curriculum programme, and student outcome, creating a direct audit trail from regulatory assessment to institutional performance.

**Table `CurriculumProgramme`**

| programmeId | programmeName | subjectArea | targetAgeGroup | isCore | isVocational | sequencingStrategy | phonicsApproach | siteId | enrolmentId | activityId | outcomeId |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | Extended Standard | mathematics | primary | false | true | spiral | consistent | 1 | 1 | 100 | 100 |
| 2 | Pilot Framework A | reading | secondary | true | false | linear | inconsistent | 2 | 2 | 101 | 101 |
| 3 | Baseline Protocol | vocational | sixth form | false | true | modular | not applicable | 3 | 3 | 102 | 102 |
| 4 | Distributed Programme | personal development | primary | true | false | spiral | consistent | 4 | 4 | 103 | 103 |

Curriculum programmes define the pedagogical architecture through which students receive instruction. Each programme has a name, a subject area, a target age group, and flags indicating whether it is a core requirement and whether it is vocational in nature. The sequencing strategy describes how content is organised over time—spiral, linear, or modular—while the phonics approach captures the method used for early reading instruction. The first programme, Extended Standard, covers mathematics at the primary level, is not designated as core but is vocational, uses a spiral sequencing strategy, and applies a consistent phonics approach. The second, Pilot Framework A, focuses on reading for secondary students, is core and non-vocational, uses linear sequencing, and applies an inconsistent phonics approach. The third, Baseline Protocol, targets sixth-form vocational education with modular sequencing and marks phonics as not applicable. The fourth, Distributed Programme, addresses personal development for primary students, is core and non-vocational, uses spiral sequencing, and applies consistent phonics. Each programme is tied to a school site, a student enrolment, a learning activity, and a student outcome.

**Table `StudentEnrolment`**

| enrolmentId | studentId | dateOfBirth | gender | attendanceRate | persistentAbsence | ehcPlan | ehcPlanId | currentYearGroup | isSixthForm | siteId | programmeId | outcomeId | memberId | createdAt |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 392507 | 2025-04-02 | male | 15.95 | false | false | 4793490 | 43 | true | 1 | 1 | 100 | 1 | 2025-01-01 00:14:00 |
| 2 | 25388256 | 2022-09-13 | female | 18.90 | true | true | 9568451 | 53 | false | 2 | 2 | 101 | 2 | 2025-02-06 03:14:00 |
| 3 | id_16 | 2023-02-24 | non-binary | 21.85 | false | false | 10445618 | 63 | true | 3 | 3 | 102 | 3 | 2025-03-11 06:14:00 |
| 4 | gd_taxc_2211 | 2024-07-08 | prefer not to say | 24.80 | true | true | 937739 | 73 | false | 4 | 4 | 103 | 4 | 2025-04-16 09:14:00 |

Student enrolments capture the demographic and attendance records of individual learners. Each enrolment includes a student identifier, date of birth, gender, attendance rate, a flag for persistent absence, an EHC (Education, Health and Care) plan indicator with its own identifier, current year group, a sixth-form flag, and a creation timestamp. The first enrolment, student 392507, was born on 2025-04-02, is male, has an attendance rate of 15.95%, is not flagged for persistent absence, does not have an EHC plan but carries identifier 4793490, is in year group 43, is in sixth form, and was enrolled on 2025-01-01. The second enrolment, student 25388256, is female, born 2022-09-13, with an attendance rate of 18.90%, is flagged for persistent absence, has an EHC plan with identifier 9568451, is in year group 53, is not in sixth form, and was enrolled on 2025-02-06. The third enrolment, student id_16, identifies as non-binary, has an attendance rate of 21.85%, is not flagged for persistent absence, has no EHC plan, is in year group 63, is in sixth form, and was enrolled on 2025-03-11. The fourth enrolment, student gd_taxc_2211, prefers not to say their gender, has an attendance rate of 24.80%, is flagged for persistent absence, has an EHC plan with identifier 937739, is in year group 73, is not in sixth form, and was enrolled on 2025-04-16. Each enrolment is linked to a school site, a curriculum programme, a student outcome, and a staff member.

**Table `StudentOutcome`**

| id | outcomeId | outcomeType | qualificationName | qualificationGrade | destinationType | destinationProvider | achievementDate | isSuccessful | enrolmentId | programmeId | memberId |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 100 | 2618555 | qualification | Integrated Series A | pilot-qualific-14 | further education | distributed-destinat-66 | 2022-05-05 | true | 1 | 1 | 1 |
| 101 | lu_tax_code_template_m46 | destination | Extended Assessment | extended-qualific-15 | employment | baseline-destinat-67 | 2023-10-16 | false | 2 | 2 | 2 |
| 102 | 168561 | personal development | Pilot Survey | integrated-qualific-16 | training | pilot-destinat-68 | 2024-03-27 | true | 3 | 3 | 3 |
| 103 | 1210-0007-M | qualification | Baseline Corridor D | seasonal-qualific-17 | other | extended-destinat-69 | 2025-08-11 | false | 4 | 4 | 4 |

Student outcomes record the results of a student's educational journey, whether through formal qualifications, destination tracking, or personal development assessments. Each outcome has a type (qualification, destination, or personal development), a qualification name, a qualification grade, a destination type (further education, employment, training, other), a destination provider, an achievement date, and a success flag. The first outcome, 2618555, is a qualification type where the student earned Integrated Series A with grade pilot-qualific-14, entered further education at distributed-destinat-66, achieved this on 2022-05-05, and the outcome is marked as successful. The second outcome, lu_tax_code_template_m46, is a destination type recording Extended Assessment with grade extended-qualific-15, leading to employment at baseline-destinat-67, achieved on 2023-10-16, and marked as unsuccessful. The third outcome, 168561, is a personal development type recording Pilot Survey with grade integrated-qualific-16, leading to training at pilot-destinat-68, achieved on 2024-03-27, and marked as successful. The fourth outcome, 1210-0007-M, is a qualification type recording Baseline Corridor D with grade seasonal-qualific-17, leading to other destinations at extended-destinat-69, achieved on 2025-08-11, and marked as unsuccessful. Each outcome is linked to a student enrolment, a curriculum programme, and a staff member.

**Table `StaffMember`**

| id | staffId | staffName | role | specialism | isQualified | yearsOfService | workloadWellbeing | siteId | programmeId | enrolmentId | outcomeId |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 937735 | Jim Henson | teacher | mathematics | false | 30 | good | 1 | 1 | 1 | 100 |
| 2 | 3158139 | Purnima Medical | clinical team | reading | true | 40 | concerning | 2 | 2 | 2 | 101 |
| 3 | 8189502 | Deanna Turner | pastoral care | phonics | false | 50 | excellent | 3 | 3 | 3 | 102 |
| 4 | 69438 | Kimberly Myers | administration | vocational | true | 60 | good | 4 | 4 | 4 | 103 |

Staff members represent the professionals who deliver instruction, pastoral care, and administrative support within the institution. Each staff member carries a staff identifier, a name, a role (teacher, clinical team, pastoral care, administration), a specialism, a qualification flag, years of service, and a workload wellbeing rating. The first staff member, Jim Henson (staff ID 937735), is a teacher specialising in mathematics, is not qualified, has 30 years of service, and reports good workload wellbeing. The second, Purnima Medical (staff ID 3158139), is a clinical team member specialising in reading, is qualified, has 40 years of service, and reports concerning workload wellbeing. The third, Deanna Turner (staff ID 8189502), is in pastoral care with a phonics specialism, is not qualified, has 50 years of service, and reports excellent workload wellbeing. The fourth, Kimberly Myers (staff ID 69438), is in administration with a vocational specialism, is qualified, has 60 years of service, and reports good workload wellbeing. Each staff member is linked to a school site, a curriculum programme, a student enrolment, and a student outcome.

**Table `LearningActivity`**

| id | activityId | activityName | activityType | location | date | participantCount | isOptional | memberId | enrolmentId | programmeId |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | 8843761 | Composite Programme | trip | extended-location-99 | 2023-02-05T13:03:00 | 100 | true | 1 | 1 | 1 |
| 101 | 4180957 | Compact Standard A | workshop | integrated-location-100 | 2024-07-16T20:20:00 | 27 | false | 2 | 2 | 2 |
| 102 | 168545 | Legacy Framework | club | seasonal-location-101 | 2025-12-27T03:37:00 | 23 | true | 3 | 3 | 3 |
| 103 | default_chart_a_account_53 | Regional Protocol | award programme | regional-location-102 | 2022-05-11T10:54:00 | 34 | false | 4 | 4 | 4 |

Learning activities capture the instructional events and pedagogical interventions that occur within curriculum programmes. Each activity is associated with a staff member who delivers it, a student enrolment that participates in it, and a curriculum programme that defines its scope. The learning activity table serves as the operational bridge between staff expertise and student participation, ensuring that every instructional event can be traced back to both the qualified professional delivering it and the learner receiving it, within the framework of a defined curriculum programme.

The base tables described above form the foundation of the domain. Their true analytical power emerges when joined into views that reconstruct the operational relationships practitioners need for day-to-day management and strategic oversight. Each view answers a specific question by combining records from two or more tables, and the following sections interpret these joined results with concrete examples drawn from the data.

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

This view answers the question: what inspection events have been conducted at each school site, and how did they rate? The join links SchoolSite to InspectionEvent through the site identifier. Row 1 shows site 102 at composite-street-15, integrated-city-34, paired with inspection event BJanecke—a full inspection from 2022-09-01 to 2022-09-05 that received outstanding ratings across all five quality domains. Row 2 shows site 1336166 at primary-street-16, seasonal-city-35, paired with inspection event 575199—a partial inspection in February 2023 that received good ratings across all domains.

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

This view answers: which curriculum programmes are active at each school site? The join links SchoolSite to CurriculumProgramme. Row 1 pairs site 102 with the Extended Standard mathematics programme for primary students, which uses spiral sequencing and consistent phonics. Row 2 pairs site 1336166 with Pilot Framework A, a reading programme for secondary students that uses linear sequencing and inconsistent phonics.

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

This view answers: which staff members are assigned to each school site? The join links SchoolSite to StaffMember. Row 1 shows site 102 with Jim Henson, a mathematics teacher with 30 years of service and good workload wellbeing. Row 2 shows site 1336166 with Purnima Medical, a clinical team member specialising in reading, qualified, with 40 years of service and concerning workload wellbeing.

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

This view answers: which students are enrolled at each school site? The join links SchoolSite to StudentEnrolment. Row 1 shows site 102 with student 392507, a male in year group 43 with an attendance rate of 15.95%, enrolled on 2025-01-01. Row 2 shows site 1336166 with student 25388256, a female in year group 53 with an attendance rate of 18.90% and persistent absence flagged, enrolled on 2025-02-06.

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

This view reverses the perspective: given an inspection event, which school site was inspected? Row 1 shows inspection BJanecke (a full inspection, outstanding ratings, 2022-09-01 to 2022-09-05) was conducted at site 102, composite-street-15, integrated-city-34. Row 2 shows inspection 575199 (a partial inspection, good ratings, February 2023) was conducted at site 1336166, primary-street-16, seasonal-city-35.

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

This view answers: which curriculum programme was under review during each inspection event? Row 1 shows inspection BJanecke was associated with the Extended Standard mathematics programme. Row 2 shows inspection 575199 was associated with Pilot Framework A, the reading programme for secondary students.

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

This view answers: which student outcomes were assessed as part of each inspection event? Row 1 links inspection BJanecke to outcome 2618555, a successful qualification outcome where the student earned Integrated Series A and entered further education. Row 2 links inspection 575199 to outcome lu_tax_code_template_m46, an unsuccessful destination outcome for Extended Assessment leading to employment.

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

This view answers: at which school site is each curriculum programme delivered? Row 1 shows the Extended Standard mathematics programme is delivered at site 102, composite-street-15, integrated-city-34. Row 2 shows Pilot Framework A is delivered at site 1336166, primary-street-16, seasonal-city-35.

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

This view answers: which students are enrolled in each curriculum programme? Row 1 shows the Extended Standard programme has student 392507 enrolled, a male in year group 43 with 15.95% attendance. Row 2 shows Pilot Framework A has student 25388256 enrolled, a female in year group 53 with 18.90% attendance and persistent absence flagged.

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

This view answers: which learning activities are associated with each curriculum programme? The join links CurriculumProgramme to LearningActivity, revealing the instructional events that operationalise each programme's pedagogical design. Row 1 connects the Extended Standard mathematics programme to learning activity 100. Row 2 connects Pilot Framework A to learning activity 101.

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

This view answers: which student outcomes are linked to each curriculum programme? Row 1 shows the Extended Standard programme is linked to outcome 2618555, a successful qualification in Integrated Series A. Row 2 shows Pilot Framework A is linked to outcome lu_tax_code_template_m46, an unsuccessful destination outcome for Extended Assessment.

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

This view answers: at which school site is each student enrolled? Row 1 shows student 392507 is enrolled at site 102, composite-street-15, integrated-city-34. Row 2 shows student 25388256 is enrolled at site 1336166, primary-street-16, seasonal-city-35.

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

This view answers: which curriculum programme is each student enrolled in? Row 1 shows student 392507 is enrolled in the Extended Standard mathematics programme. Row 2 shows student 25388256 is enrolled in Pilot Framework A, the reading programme for secondary students.

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

This view answers: what outcomes has each enrolled student achieved? Row 1 shows student 392507 has outcome 2618555, a successful qualification in Integrated Series A achieved on 2022-05-05. Row 2 shows student 25388256 has outcome lu_tax_code_template_m46, an unsuccessful destination outcome for Extended Assessment achieved on 2023-10-16.

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

This view answers: which staff member is associated with each student enrolment? Row 1 shows student 392507 is associated with Jim Henson, a mathematics teacher with 30 years of service. Row 2 shows student 25388256 is associated with Purnima Medical, a clinical team member with 40 years of service.

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

This view answers: which student enrolment led to each recorded outcome? Row 1 shows outcome 2618555 (successful qualification, Integrated Series A) is linked to student enrolment 392507, a male in year group 43 with 15.95% attendance. Row 2 shows outcome lu_tax_code_template_m46 (unsuccessful destination, Extended Assessment) is linked to student enrolment 25388256, a female in year group 53 with persistent absence flagged.

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

This view answers: which curriculum programme is each outcome associated with? Row 1 shows outcome 2618555 is associated with the Extended Standard mathematics programme. Row 2 shows outcome lu_tax_code_template_m46 is associated with Pilot Framework A, the reading programme.

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

This view answers: which staff member is associated with each student outcome? Row 1 shows outcome 2618555 is associated with Jim Henson, a mathematics teacher. Row 2 shows outcome lu_tax_code_template_m46 is associated with Purnima Medical, a clinical team member.

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

This view answers: at which school site does each staff member work? Row 1 shows Jim Henson works at site 102, composite-street-15, integrated-city-34. Row 2 shows Purnima Medical works at site 1336166, primary-street-16, seasonal-city-35.

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

This view answers: which curriculum programme does each staff member support? Row 1 shows Jim Henson supports the Extended Standard mathematics programme. Row 2 shows Purnima Medical supports Pilot Framework A, the reading programme.

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

This view answers: which students are associated with each staff member? Row 1 shows Jim Henson is associated with student 392507, a male in year group 43 with 15.95% attendance. Row 2 shows Purnima Medical is associated with student 25388256, a female in year group 53 with persistent absence flagged.

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

This view answers: which student outcomes are associated with each staff member? Row 1 shows Jim Henson is associated with outcome 2618555, a successful qualification in Integrated Series A. Row 2 shows Purnima Medical is associated with outcome lu_tax_code_template_m46, an unsuccessful destination outcome for Extended Assessment.

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

This view answers: which staff member delivers each learning activity? The join links LearningActivity to StaffMember, revealing the professional responsible for each instructional event. Row 1 connects learning activity 100 to Jim Henson, a mathematics teacher. Row 2 connects learning activity 101 to Purnima Medical, a clinical team member.

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

This view answers: which students participate in each learning activity? The join links LearningActivity to StudentEnrolment. Row 1 connects learning activity 100 to student 392507, a male in year group 43. Row 2 connects learning activity 101 to student 25388256, a female in year group 53.

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

This view answers: which curriculum programme does each learning activity belong to? The join links LearningActivity to CurriculumProgramme. Row 1 connects learning activity 100 to the Extended Standard mathematics programme. Row 2 connects learning activity 101 to Pilot Framework A, the reading programme.

The educational institution management domain, as captured in these records and their cross-referenced views, presents a tightly integrated system where every entity is connected to every other through well-defined relationships. A school site is not merely a geographic location; it is the nexus of inspection events, curriculum delivery, student enrolments, and staff assignments. An inspection event is not merely a date range; it is a comprehensive quality assessment that evaluates five distinct domains and is tied to the specific programme and outcomes under review. A curriculum programme is not merely a subject list; it is a pedagogical blueprint that specifies sequencing strategy, phonics approach, and vocational status, and is operationalised through learning activities delivered by qualified staff to enrolled students. A student enrolment is not merely a name on a register; it is a demographic and attendance record that tracks a learner's journey from entry through to their post-study outcome. A student outcome is not merely a grade; it is a destination marker that records whether a learner successfully achieved their qualification or transitioned to further education, employment, or training. A staff member is not merely an employee; they are a professional whose role, specialism, qualification status, and wellbeing are tracked alongside their years of service and their connections to sites, programmes, students, and outcomes. And a learning activity is not merely a class; it is the instructional event that bridges staff expertise with student participation within a defined curriculum framework. Together, these entities and their joined perspectives form a complete operational picture that supports accountability, strategic planning, and continuous improvement across the educational institution.