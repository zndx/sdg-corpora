## The Ecosystem of Public-Interest Programs

Public-interest programming operates at the intersection of nonprofit governance, community delivery, educational design, and regulatory oversight. In this domain, organizations apply for tax-exempt status to fund initiatives, people lead and staff those initiatives, research institutions evaluate their outcomes, and government agencies grant or withhold approval. The records that document this ecosystem are organized around six core entities: nonprofit organizations, community programs, educational curricula, people, research institutions, and government agencies. Each entity maintains its own attributes, and cross-entity relationships are captured through explicit join tables and a suite of analytical views that answer specific operational questions.

**Table `NonprofitOrganization`**

| organizationId | legalName | taxExemptStatus | foundingYear | operationalStatus | foundingLocation | personId |
|---|---|---|---|---|---|---|
| 1 | Adaptive Model | regional-tax-12 | 43 | active | baseline-founding-49 | 1 |
| 2 | Primary Cluster | legacy-tax-13 | 48 | inactive | pilot-founding-50 | 2 |
| 3 | Composite Review D | compact-tax-14 | 53 | dissolved | extended-founding-51 | 3 |
| 4 | Compact Initiative | composite-tax-15 | 58 | active | integrated-founding-52 | 4 |

A nonprofit organization is the foundational actor in this domain. The `organizationId` column provides a unique identifier, while `legalName` records the formal name under which the entity operates. The `taxExemptStatus` field classifies the organization's tax classification, with values such as `regional-tax-12`, `legacy-tax-13`, `compact-tax-14`, and `composite-tax-15` appearing across the four organizations in the dataset. The `foundingYear` column stores a numeric age indicator, ranging from 43 to 58 years in the sample. The `operationalStatus` column distinguishes between `active`, `inactive`, and `dissolved` states, with Adaptive Model and Compact Initiative currently active, Primary Cluster inactive, and Composite Review D dissolved. The `foundingLocation` field uses coded location identifiers like `baseline-founding-49` and `pilot-founding-50`. Each organization is also associated with a `personId`, linking it to its founding or lead individual.

**Table `CommunityProgram`**

| programId | programName | targetAgeRange | totalParticipants | programDurationYears | primaryFocusArea | evidenceBasedStatus | organizationId | institutionId | curriculumId |
|---|---|---|---|---|---|---|---|---|---|
| 1 | Extended Review | compact-target-98 | 4 | 34 | HIV/AIDS | approved | 1 | 1 | 1 |
| 2 | Pilot Initiative A | composite-target-99 | 30 | 39 | Obesity | evaluating | 2 | 2 | 2 |
| 3 | Baseline Model | primary-target-100 | 14 | 44 | Teen Pregnancy | unverified | 3 | 3 | 3 |
| 4 | Distributed Cluster | adaptive-target-101 | 50 | 49 | Substance Abuse | approved | 4 | 4 | 4 |

Community programs represent the operational output of nonprofit organizations. The `programId` serves as the primary key, and `programName` provides a human-readable label such as Extended Review, Pilot Initiative A, Baseline Model, and Distributed Cluster. The `targetAgeRange` field uses coded descriptors—`compact-target-98`, `composite-target-99`, `primary-target-100`, and `adaptive-target-101`—to indicate the demographic focus. The `totalParticipants` column quantifies reach, with values of 4, 30, 14, and 50 across the four programs. Program duration is captured in `programDurationYears`, ranging from 34 to 49 years in the dataset. The `primaryFocusArea` column identifies the health or social issue addressed, including HIV/AIDS, Obesity, Teen Pregnancy, and Substance Abuse. The `evidenceBasedStatus` column tracks the maturity of evidence, with values of `approved`, `evaluating`, and `unverified`. Each program is linked to an `organizationId`, an `institutionId`, and a `curriculumId`, establishing its organizational, research, and educational affiliations.

**Table `EducationalCurriculum`**

| curriculumId | curriculumTitle | totalSessions | pedagogicalApproach | approvalAgency | approvalStatus | personId | institutionId |
|---|---|---|---|---|---|---|---|
| 1 | Seasonal Survey | 16602 | adaptive-pedagogi-47 | Ford Motor | approved | 1 | 1 |
| 2 | Integrated Corridor | 12136 | distributed-pedagogi-48 | Ontrak Inc. | pending | 2 | 2 |
| 3 | Extended Series D | 459 | baseline-pedagogi-49 | ABIOMED Inc | revoked | 3 | 3 |
| 4 | Pilot Assessment | 4 | pilot-pedagogi-50 | RecruitFirst Pte. Ltd | approved | 4 | 4 |

Educational curricula provide the instructional framework that programs may adopt. The `curriculumId` is the primary key, and `curriculumTitle` names the curriculum—Seasonal Survey, Integrated Corridor, Extended Series D, and Pilot Assessment in the sample data. The `totalSessions` column records the number of instructional sessions, spanning a wide range from 4 sessions (Pilot Assessment) to 16,602 sessions (Seasonal Survey). The `pedagogicalApproach` field uses coded descriptors such as `adaptive-pedagogi-47`, `distributed-pedagogi-48`, `baseline-pedagogi-49`, and `pilot-pedagogi-50`. The `approvalAgency` column names the approving body, with entries including Ford Motor, Ontrak Inc., ABIOMED Inc, and RecruitFirst Pte. Ltd. The `approvalStatus` column records whether the curriculum is `approved`, `pending`, or `revoked`. Each curriculum is associated with a `personId` and an `institutionId`, connecting it to its designer and its hosting research institution.

**Table `Person`**

| personId | fullName | birthPlace | highestDegree | degreeField | professionalRole | yearsOfExperience | organizationId | curriculumId | agencyId |
|---|---|---|---|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | baseline-birth-61 | legacy-highest-85 | compact-degree-38 | Founder | 7 | 1 | 1 | 1 |
| 2 | Account Name | pilot-birth-62 | compact-highest-86 | composite-degree-39 | CEO | 10 | 2 | 2 | 2 |
| 3 | Saipan International Airport | extended-birth-63 | composite-highest-87 | primary-degree-40 | Adjunct Faculty | 13 | 3 | 3 | 3 |
| 4 | Norma Fisher | integrated-birth-64 | primary-highest-88 | adaptive-degree-41 | Author | 16 | 4 | 4 | 4 |

People are the human agents who lead organizations, design curricula, and serve in regulatory roles. The `personId` is the primary key, and `fullName` provides the individual's name—Theodore Mcgrath, Account Name, Saipan International Airport, and Norma Fisher in the dataset. The `birthPlace` field uses coded location identifiers such as `baseline-birth-61` and `pilot-birth-62`. The `highestDegree` and `degreeField` columns capture educational attainment, with values like `legacy-highest-85` and `compact-degree-38` appearing in the sample. The `professionalRole` column identifies the person's primary function, including Founder, CEO, Adjunct Faculty, and Author. The `yearsOfExperience` column records professional tenure, ranging from 7 to 16 years. Each person is linked to an `organizationId`, a `curriculumId`, and an `agencyId`, reflecting their multi-faceted involvement across the ecosystem.

**Table `ResearchInstitution`**

| id | institutionName | evaluationStatus | evaluationOutcome | hostingInstitute | programId | curriculumId |
|---|---|---|---|---|---|---|
| 1 | Extended Corridor | ongoing | extended-evaluati-81 | compact-hosting-56 | 1 | 1 |
| 2 | Pilot Series A | completed | integrated-evaluati-82 | composite-hosting-57 | 2 | 2 |
| 3 | Baseline Assessment | planned | seasonal-evaluati-83 | primary-hosting-58 | 3 | 3 |
| 4 | Distributed Survey | ongoing | regional-evaluati-84 | adaptive-hosting-59 | 4 | 4 |

Research institutions provide the evaluative infrastructure for community programs and curricula. The `id` column serves as the primary key, and `institutionName` records the institution's name—Extended Corridor, Pilot Series A, Baseline Assessment, and Distributed Survey. The `evaluationStatus` column tracks the state of evaluation, with values of `ongoing`, `completed`, and `planned`. The `evaluationOutcome` field uses coded descriptors such as `extended-evaluati-81`, `integrated-evaluati-82`, `seasonal-evaluati-83`, and `regional-evaluati-84`. The `hostingInstitute` column uses coded identifiers like `compact-hosting-56` and `composite-hosting-57`. Each institution is linked to a `programId` and a `curriculumId`, establishing its evaluative scope.

**Table `GovernmentAgency`**

| agencyId | agencyName | jurisdictionLevel | approvalGranted | grantReviewRole | curriculumId | programId | personId | createdAt |
|---|---|---|---|---|---|---|---|---|
| 1 | FSG Social Impact Advisors | federal | false | panel_member | 1 | 1 | 1 | 2025-01-01 00:14:00 |
| 2 | Whirlpool Corporation | state | true | funding_authority | 2 | 2 | 2 | 2025-02-06 03:14:00 |
| 3 | Education Writers Association | local | false | regulator | 3 | 3 | 3 | 2025-03-11 06:14:00 |
| 4 | Switch Card Services Ltd. | federal | true | panel_member | 4 | 4 | 4 | 2025-04-16 09:14:00 |

Government agencies exercise regulatory authority over programs and curricula. The `agencyId` is the primary key, and `agencyName` records the agency's name—FSG Social Impact Advisors, Whirlpool Corporation, Education Writers Association, and Switch Card Services Ltd. The `jurisdictionLevel` column specifies the level of authority, with values of `federal`, `state`, and `local`. The `approvalGranted` column is a boolean indicating whether approval has been granted, with Whirlpool Corporation and Switch Card Services Ltd. having granted approval while FSG Social Impact Advisors and Education Writers Association have not. The `grantReviewRole` column identifies the agency's role in the review process, with values including `panel_member`, `funding_authority`, and `regulator`. Each agency is linked to a `curriculumId`, a `programId`, and a `personId`, and the `createdAt` column records the timestamp of the agency's record creation, ranging from 2025-01-01 to 2025-04-16.

**Table `NonprofitOrganizationCommunityProgram`**

| organizationId | programId |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The relationship between nonprofit organizations and community programs is captured in the join table `NonprofitOrganizationCommunityProgram`. This table explicitly records which organizations are associated with which programs, supporting many-to-many relationships that may arise when an organization runs multiple programs or a program draws support from multiple organizations.

**Table `EducationalCurriculumCommunityProgram`**

| curriculumId | programId |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

Similarly, the `EducationalCurriculumCommunityProgram` join table records the association between educational curricula and community programs. This enables programs to adopt one or more curricula, and curricula to be deployed across multiple programs.

## Analytical Views

The domain includes a comprehensive set of analytical views that join base tables to answer specific operational questions. Each view is designed to surface a particular relationship or detail set for practitioners.

**View `v_nonprofit_organization_community_program_detail`**

```sql
CREATE VIEW v_nonprofit_organization_community_program_detail AS
SELECT a.organizationId, a.legalName, a.taxExemptStatus, b.programId AS program_programId, b.programName AS program_programName, b.targetAgeRange AS program_targetAgeRange
FROM NonprofitOrganization a
  JOIN NonprofitOrganizationCommunityProgram j ON j.organizationId = a.organizationId
  JOIN CommunityProgram b ON b.programId = j.programId;
```

| organizationId | legalName | taxExemptStatus | program_programId | program_programName | program_targetAgeRange |
|---|---|---|---|---|---|
| 1 | Adaptive Model | regional-tax-12 | 1 | Extended Review | compact-target-98 |
| 1 | Adaptive Model | regional-tax-12 | 2 | Pilot Initiative A | composite-target-99 |
| 2 | Primary Cluster | legacy-tax-13 | 2 | Pilot Initiative A | composite-target-99 |
| 2 | Primary Cluster | legacy-tax-13 | 3 | Baseline Model | primary-target-100 |
| 3 | Composite Review D | compact-tax-14 | 3 | Baseline Model | primary-target-100 |
| 3 | Composite Review D | compact-tax-14 | 4 | Distributed Cluster | adaptive-target-101 |
| 4 | Compact Initiative | composite-tax-15 | 4 | Distributed Cluster | adaptive-target-101 |
| 4 | Compact Initiative | composite-tax-15 | 1 | Extended Review | compact-target-98 |

This view joins nonprofit organizations with their community programs, providing a detailed operational picture. It answers the question: what programs does each nonprofit run, and what are the characteristics of those programs? For example, the row for Adaptive Model (organizationId 1) would show Extended Review (programId 1), a program focused on HIV/AIDS with 4 participants, 34 years of duration, and approved evidence-based status.

**View `v_nonprofit_organization_person`**

```sql
CREATE VIEW v_nonprofit_organization_person AS
SELECT a.organizationId, a.legalName, a.taxExemptStatus, a.foundingYear, b.personId AS person_personId, b.fullName AS person_fullName, b.birthPlace AS person_birthPlace
FROM NonprofitOrganization a JOIN Person b ON a.personId = b.personId;
```

| organizationId | legalName | taxExemptStatus | foundingYear | person_personId | person_fullName | person_birthPlace |
|---|---|---|---|---|---|---|
| 1 | Adaptive Model | regional-tax-12 | 43 | 1 | Theodore Mcgrath | baseline-birth-61 |
| 2 | Primary Cluster | legacy-tax-13 | 48 | 2 | Account Name | pilot-birth-62 |
| 3 | Composite Review D | compact-tax-14 | 53 | 3 | Saipan International Airport | extended-birth-63 |
| 4 | Compact Initiative | composite-tax-15 | 58 | 4 | Norma Fisher | integrated-birth-64 |

This view links nonprofit organizations to the people associated with them. It answers: who leads or is affiliated with each nonprofit? The row for Adaptive Model would surface Theodore Mcgrath (personId 1), who holds the role of Founder with 7 years of experience.

**View `v_community_program_nonprofit_organization`**

```sql
CREATE VIEW v_community_program_nonprofit_organization AS
SELECT a.programId, a.programName, a.targetAgeRange, a.totalParticipants, b.organizationId AS organization_organizationId, b.legalName AS organization_legalName, b.taxExemptStatus AS organization_taxExemptStatus
FROM CommunityProgram a JOIN NonprofitOrganization b ON a.organizationId = b.organizationId;
```

| programId | programName | targetAgeRange | totalParticipants | organization_organizationId | organization_legalName | organization_taxExemptStatus |
|---|---|---|---|---|---|---|
| 1 | Extended Review | compact-target-98 | 4 | 1 | Adaptive Model | regional-tax-12 |
| 2 | Pilot Initiative A | composite-target-99 | 30 | 2 | Primary Cluster | legacy-tax-13 |
| 3 | Baseline Model | primary-target-100 | 14 | 3 | Composite Review D | compact-tax-14 |
| 4 | Distributed Cluster | adaptive-target-101 | 50 | 4 | Compact Initiative | composite-tax-15 |

This view presents community programs alongside their parent nonprofit organizations. It answers: which organization sponsors each program? For instance, the row for Extended Review would show it is operated by Adaptive Model, a regional-tax-12 organization founded 43 years ago.

**View `v_community_program_research_institution`**

```sql
CREATE VIEW v_community_program_research_institution AS
SELECT a.programId, a.programName, a.targetAgeRange, a.totalParticipants, b.id AS institution_id, b.institutionName AS institution_institutionName, b.evaluationStatus AS institution_evaluationStatus
FROM CommunityProgram a JOIN ResearchInstitution b ON a.institutionId = b.id;
```

| programId | programName | targetAgeRange | totalParticipants | institution_id | institution_institutionName | institution_evaluationStatus |
|---|---|---|---|---|---|---|
| 1 | Extended Review | compact-target-98 | 4 | 1 | Extended Corridor | ongoing |
| 2 | Pilot Initiative A | composite-target-99 | 30 | 2 | Pilot Series A | completed |
| 3 | Baseline Model | primary-target-100 | 14 | 3 | Baseline Assessment | planned |
| 4 | Distributed Cluster | adaptive-target-101 | 50 | 4 | Distributed Survey | ongoing |

This view joins community programs with the research institutions that evaluate them. It answers: which institution is evaluating each program? The row for Extended Review would show it is evaluated by Extended Corridor, an institution with an ongoing evaluation status and outcome code `extended-evaluati-81`.

**View `v_community_program_educational_curriculum`**

```sql
CREATE VIEW v_community_program_educational_curriculum AS
SELECT a.programId, a.programName, a.targetAgeRange, a.totalParticipants, b.curriculumId AS curriculum_curriculumId, b.curriculumTitle AS curriculum_curriculumTitle, b.totalSessions AS curriculum_totalSessions
FROM CommunityProgram a JOIN EducationalCurriculum b ON a.curriculumId = b.curriculumId;
```

| programId | programName | targetAgeRange | totalParticipants | curriculum_curriculumId | curriculum_curriculumTitle | curriculum_totalSessions |
|---|---|---|---|---|---|---|
| 1 | Extended Review | compact-target-98 | 4 | 1 | Seasonal Survey | 16602 |
| 2 | Pilot Initiative A | composite-target-99 | 30 | 2 | Integrated Corridor | 12136 |
| 3 | Baseline Model | primary-target-100 | 14 | 3 | Extended Series D | 459 |
| 4 | Distributed Cluster | adaptive-target-101 | 50 | 4 | Pilot Assessment | 4 |

This view links community programs with the educational curricula they adopt. It answers: which curriculum does each program use? The row for Extended Review would show it uses Seasonal Survey, a curriculum with 16,602 sessions and adaptive pedagogical approach.

**View `v_educational_curriculum_person`**

```sql
CREATE VIEW v_educational_curriculum_person AS
SELECT a.curriculumId, a.curriculumTitle, a.totalSessions, a.pedagogicalApproach, b.personId AS person_personId, b.fullName AS person_fullName, b.birthPlace AS person_birthPlace
FROM EducationalCurriculum a JOIN Person b ON a.personId = b.personId;
```

| curriculumId | curriculumTitle | totalSessions | pedagogicalApproach | person_personId | person_fullName | person_birthPlace |
|---|---|---|---|---|---|---|
| 1 | Seasonal Survey | 16602 | adaptive-pedagogi-47 | 1 | Theodore Mcgrath | baseline-birth-61 |
| 2 | Integrated Corridor | 12136 | distributed-pedagogi-48 | 2 | Account Name | pilot-birth-62 |
| 3 | Extended Series D | 459 | baseline-pedagogi-49 | 3 | Saipan International Airport | extended-birth-63 |
| 4 | Pilot Assessment | 4 | pilot-pedagogi-50 | 4 | Norma Fisher | integrated-birth-64 |

This view connects educational curricula to the people who designed or lead them. It answers: who is associated with each curriculum? The row for Seasonal Survey would surface Theodore Mcgrath, who holds the role of Founder and has 7 years of experience.

**View `v_educational_curriculum_community_program_detail`**

```sql
CREATE VIEW v_educational_curriculum_community_program_detail AS
SELECT a.curriculumId, a.curriculumTitle, a.totalSessions, b.programId AS program_programId, b.programName AS program_programName, b.targetAgeRange AS program_targetAgeRange
FROM EducationalCurriculum a
  JOIN EducationalCurriculumCommunityProgram j ON j.curriculumId = a.curriculumId
  JOIN CommunityProgram b ON b.programId = j.programId;
```

| curriculumId | curriculumTitle | totalSessions | program_programId | program_programName | program_targetAgeRange |
|---|---|---|---|---|---|
| 1 | Seasonal Survey | 16602 | 1 | Extended Review | compact-target-98 |
| 1 | Seasonal Survey | 16602 | 2 | Pilot Initiative A | composite-target-99 |
| 2 | Integrated Corridor | 12136 | 2 | Pilot Initiative A | composite-target-99 |
| 2 | Integrated Corridor | 12136 | 3 | Baseline Model | primary-target-100 |
| 3 | Extended Series D | 459 | 3 | Baseline Model | primary-target-100 |
| 3 | Extended Series D | 459 | 4 | Distributed Cluster | adaptive-target-101 |
| 4 | Pilot Assessment | 4 | 4 | Distributed Cluster | adaptive-target-101 |
| 4 | Pilot Assessment | 4 | 1 | Extended Review | compact-target-98 |

This view joins educational curricula with the community programs that use them, providing detailed program information. It answers: which programs are using each curriculum, and what are those programs' characteristics? The row for Seasonal Survey would show it is used by Extended Review, a program with 4 participants focused on HIV/AIDS.

**View `v_educational_curriculum_research_institution`**

```sql
CREATE VIEW v_educational_curriculum_research_institution AS
SELECT a.curriculumId, a.curriculumTitle, a.totalSessions, a.pedagogicalApproach, b.id AS institution_id, b.institutionName AS institution_institutionName, b.evaluationStatus AS institution_evaluationStatus
FROM EducationalCurriculum a JOIN ResearchInstitution b ON a.institutionId = b.id;
```

| curriculumId | curriculumTitle | totalSessions | pedagogicalApproach | institution_id | institution_institutionName | institution_evaluationStatus |
|---|---|---|---|---|---|---|
| 1 | Seasonal Survey | 16602 | adaptive-pedagogi-47 | 1 | Extended Corridor | ongoing |
| 2 | Integrated Corridor | 12136 | distributed-pedagogi-48 | 2 | Pilot Series A | completed |
| 3 | Extended Series D | 459 | baseline-pedagogi-49 | 3 | Baseline Assessment | planned |
| 4 | Pilot Assessment | 4 | pilot-pedagogi-50 | 4 | Distributed Survey | ongoing |

This view links educational curricula with the research institutions that host or evaluate them. It answers: which institution is associated with each curriculum? The row for Seasonal Survey would show it is hosted by Extended Corridor, an institution with ongoing evaluation status.

**View `v_person_nonprofit_organization`**

```sql
CREATE VIEW v_person_nonprofit_organization AS
SELECT a.personId, a.fullName, a.birthPlace, a.highestDegree, b.organizationId AS organization_organizationId, b.legalName AS organization_legalName, b.taxExemptStatus AS organization_taxExemptStatus
FROM Person a JOIN NonprofitOrganization b ON a.organizationId = b.organizationId;
```

| personId | fullName | birthPlace | highestDegree | organization_organizationId | organization_legalName | organization_taxExemptStatus |
|---|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | baseline-birth-61 | legacy-highest-85 | 1 | Adaptive Model | regional-tax-12 |
| 2 | Account Name | pilot-birth-62 | compact-highest-86 | 2 | Primary Cluster | legacy-tax-13 |
| 3 | Saipan International Airport | extended-birth-63 | composite-highest-87 | 3 | Composite Review D | compact-tax-14 |
| 4 | Norma Fisher | integrated-birth-64 | primary-highest-88 | 4 | Compact Initiative | composite-tax-15 |

This view presents people alongside their affiliated nonprofit organizations. It answers: which organization is each person associated with? The row for Theodore Mcgrath would show he is affiliated with Adaptive Model, an active organization with tax-exempt status regional-tax-12.

**View `v_person_educational_curriculum`**

```sql
CREATE VIEW v_person_educational_curriculum AS
SELECT a.personId, a.fullName, a.birthPlace, a.highestDegree, b.curriculumId AS curriculum_curriculumId, b.curriculumTitle AS curriculum_curriculumTitle, b.totalSessions AS curriculum_totalSessions
FROM Person a JOIN EducationalCurriculum b ON a.curriculumId = b.curriculumId;
```

| personId | fullName | birthPlace | highestDegree | curriculum_curriculumId | curriculum_curriculumTitle | curriculum_totalSessions |
|---|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | baseline-birth-61 | legacy-highest-85 | 1 | Seasonal Survey | 16602 |
| 2 | Account Name | pilot-birth-62 | compact-highest-86 | 2 | Integrated Corridor | 12136 |
| 3 | Saipan International Airport | extended-birth-63 | composite-highest-87 | 3 | Extended Series D | 459 |
| 4 | Norma Fisher | integrated-birth-64 | primary-highest-88 | 4 | Pilot Assessment | 4 |

This view links people to the educational curricula they are associated with. It answers: which curriculum does each person work on? The row for Theodore Mcgrath would show he is associated with Seasonal Survey, a curriculum with 16,602 sessions approved by Ford Motor.

**View `v_person_government_agency`**

```sql
CREATE VIEW v_person_government_agency AS
SELECT a.personId, a.fullName, a.birthPlace, a.highestDegree, b.agencyId AS agency_agencyId, b.agencyName AS agency_agencyName, b.jurisdictionLevel AS agency_jurisdictionLevel
FROM Person a JOIN GovernmentAgency b ON a.agencyId = b.agencyId;
```

| personId | fullName | birthPlace | highestDegree | agency_agencyId | agency_agencyName | agency_jurisdictionLevel |
|---|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | baseline-birth-61 | legacy-highest-85 | 1 | FSG Social Impact Advisors | federal |
| 2 | Account Name | pilot-birth-62 | compact-highest-86 | 2 | Whirlpool Corporation | state |
| 3 | Saipan International Airport | extended-birth-63 | composite-highest-87 | 3 | Education Writers Association | local |
| 4 | Norma Fisher | integrated-birth-64 | primary-highest-88 | 4 | Switch Card Services Ltd. | federal |

This view connects people to the government agencies they serve with or are affiliated to. It answers: which agency is each person associated with? The row for Theodore Mcgrath would show he is linked to FSG Social Impact Advisors, a federal agency with panel_member review role.

**View `v_research_institution_community_program`**

```sql
CREATE VIEW v_research_institution_community_program AS
SELECT a.id, a.institutionName, a.evaluationStatus, a.evaluationOutcome, b.programId AS program_programId, b.programName AS program_programName, b.targetAgeRange AS program_targetAgeRange
FROM ResearchInstitution a JOIN CommunityProgram b ON a.programId = b.programId;
```

| id | institutionName | evaluationStatus | evaluationOutcome | program_programId | program_programName | program_targetAgeRange |
|---|---|---|---|---|---|---|
| 1 | Extended Corridor | ongoing | extended-evaluati-81 | 1 | Extended Review | compact-target-98 |
| 2 | Pilot Series A | completed | integrated-evaluati-82 | 2 | Pilot Initiative A | composite-target-99 |
| 3 | Baseline Assessment | planned | seasonal-evaluati-83 | 3 | Baseline Model | primary-target-100 |
| 4 | Distributed Survey | ongoing | regional-evaluati-84 | 4 | Distributed Cluster | adaptive-target-101 |

This view presents research institutions alongside the community programs they evaluate. It answers: which programs is each institution evaluating? The row for Extended Corridor would show it evaluates Extended Review, a program with 4 participants and approved evidence-based status.

**View `v_research_institution_educational_curriculum`**

```sql
CREATE VIEW v_research_institution_educational_curriculum AS
SELECT a.id, a.institutionName, a.evaluationStatus, a.evaluationOutcome, b.curriculumId AS curriculum_curriculumId, b.curriculumTitle AS curriculum_curriculumTitle, b.totalSessions AS curriculum_totalSessions
FROM ResearchInstitution a JOIN EducationalCurriculum b ON a.curriculumId = b.curriculumId;
```

| id | institutionName | evaluationStatus | evaluationOutcome | curriculum_curriculumId | curriculum_curriculumTitle | curriculum_totalSessions |
|---|---|---|---|---|---|---|
| 1 | Extended Corridor | ongoing | extended-evaluati-81 | 1 | Seasonal Survey | 16602 |
| 2 | Pilot Series A | completed | integrated-evaluati-82 | 2 | Integrated Corridor | 12136 |
| 3 | Baseline Assessment | planned | seasonal-evaluati-83 | 3 | Extended Series D | 459 |
| 4 | Distributed Survey | ongoing | regional-evaluati-84 | 4 | Pilot Assessment | 4 |

This view links research institutions to the educational curricula they host. It answers: which curriculum does each institution host? The row for Extended Corridor would show it hosts Seasonal Survey, a curriculum with 16,602 sessions and adaptive pedagogical approach.

**View `v_government_agency_educational_curriculum`**

```sql
CREATE VIEW v_government_agency_educational_curriculum AS
SELECT a.agencyId, a.agencyName, a.jurisdictionLevel, a.approvalGranted, b.curriculumId AS curriculum_curriculumId, b.curriculumTitle AS curriculum_curriculumTitle, b.totalSessions AS curriculum_totalSessions
FROM GovernmentAgency a JOIN EducationalCurriculum b ON a.curriculumId = b.curriculumId;
```

| agencyId | agencyName | jurisdictionLevel | approvalGranted | curriculum_curriculumId | curriculum_curriculumTitle | curriculum_totalSessions |
|---|---|---|---|---|---|---|
| 1 | FSG Social Impact Advisors | federal | false | 1 | Seasonal Survey | 16602 |
| 2 | Whirlpool Corporation | state | true | 2 | Integrated Corridor | 12136 |
| 3 | Education Writers Association | local | false | 3 | Extended Series D | 459 |
| 4 | Switch Card Services Ltd. | federal | true | 4 | Pilot Assessment | 4 |

This view connects government agencies to the educational curricula they regulate or approve. It answers: which curriculum does each agency oversee? The row for FSG Social Impact Advisors would show it oversees Seasonal Survey, a curriculum approved by Ford Motor.

**View `v_government_agency_community_program`**

```sql
CREATE VIEW v_government_agency_community_program AS
SELECT a.agencyId, a.agencyName, a.jurisdictionLevel, a.approvalGranted, b.programId AS program_programId, b.programName AS program_programName, b.targetAgeRange AS program_targetAgeRange
FROM GovernmentAgency a JOIN CommunityProgram b ON a.programId = b.programId;
```

| agencyId | agencyName | jurisdictionLevel | approvalGranted | program_programId | program_programName | program_targetAgeRange |
|---|---|---|---|---|---|---|
| 1 | FSG Social Impact Advisors | federal | false | 1 | Extended Review | compact-target-98 |
| 2 | Whirlpool Corporation | state | true | 2 | Pilot Initiative A | composite-target-99 |
| 3 | Education Writers Association | local | false | 3 | Baseline Model | primary-target-100 |
| 4 | Switch Card Services Ltd. | federal | true | 4 | Distributed Cluster | adaptive-target-101 |

This view links government agencies to the community programs they regulate. It answers: which program does each agency oversee? The row for FSG Social Impact Advisors would show it oversees Extended Review, a program focused on HIV/AIDS with approved evidence-based status.

**View `v_government_agency_person`**

```sql
CREATE VIEW v_government_agency_person AS
SELECT a.agencyId, a.agencyName, a.jurisdictionLevel, a.approvalGranted, b.personId AS person_personId, b.fullName AS person_fullName, b.birthPlace AS person_birthPlace
FROM GovernmentAgency a JOIN Person b ON a.personId = b.personId;
```

| agencyId | agencyName | jurisdictionLevel | approvalGranted | person_personId | person_fullName | person_birthPlace |
|---|---|---|---|---|---|---|
| 1 | FSG Social Impact Advisors | federal | false | 1 | Theodore Mcgrath | baseline-birth-61 |
| 2 | Whirlpool Corporation | state | true | 2 | Account Name | pilot-birth-62 |
| 3 | Education Writers Association | local | false | 3 | Saipan International Airport | extended-birth-63 |
| 4 | Switch Card Services Ltd. | federal | true | 4 | Norma Fisher | integrated-birth-64 |

This view connects government agencies to the people they are associated with. It answers: which person is linked to each agency? The row for FSG Social Impact Advisors would show Theodore Mcgrath, who holds the role of Founder with 7 years of experience.

## Synthesis

The domain of public-interest programming is characterized by a dense web of relationships among organizations, programs, curricula, people, research institutions, and government agencies. Each entity maintains its own record of attributes—legal names, tax statuses, focus areas, pedagogical approaches, professional roles, evaluation outcomes, and jurisdictional levels—while the join tables and analytical views surface the connections that make the ecosystem function. Practitioners use these records to track which organizations run which programs, which curricula inform program delivery, which institutions evaluate outcomes, and which agencies exercise regulatory authority. The coded identifiers for tax status, pedagogical approach, evaluation outcome, and birth place reflect a structured classification system that supports consistent reporting and analysis across the domain. Together, the base tables and views provide a comprehensive operational reference for understanding and managing public-interest programming.