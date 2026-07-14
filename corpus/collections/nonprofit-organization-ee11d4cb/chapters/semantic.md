The domain under examination concerns the governance and delivery of public-interest programs—specifically, how nonprofit organizations, research institutions, and government agencies coordinate to design, fund, and evaluate community programs that draw on educational curricula and the expertise of individual professionals. The relational model captures this ecosystem through six base tables that store the core entities, two junction tables that resolve many-to-many associations, and sixteen materialized views that reassemble normalized facts into domain-meaningful rows. Every column, foreign key, and join path is designed so that a single query can answer a concrete operational question: which nonprofit runs which program, which researcher evaluates it, which curriculum informs it, and which government agency oversees its funding.

## Core Entities and Their Attributes

The foundation of the schema consists of six entity tables, each representing a distinct class of actor or artifact in the public-interest delivery chain.

**Table `NonprofitOrganization`**

| organizationId | legalName | taxExemptStatus | foundingYear | operationalStatus | foundingLocation | personId |
|---|---|---|---|---|---|---|
| 1 | Adaptive Model | regional-tax-12 | 43 | active | baseline-founding-49 | 1 |
| 2 | Primary Cluster | legacy-tax-13 | 48 | inactive | pilot-founding-50 | 2 |
| 3 | Composite Review D | compact-tax-14 | 53 | dissolved | extended-founding-51 | 3 |
| 4 | Compact Initiative | composite-tax-15 | 58 | active | integrated-founding-52 | 4 |

The `NonprofitOrganization` table stores the legal and operational identity of each nonprofit. Its primary key, `organizationId`, is a small integer (1 through 4 in the sample data) that serves as the anchor for all relationships originating from an organization. The `legalName` column carries human-readable identifiers such as "Adaptive Model" and "Primary Cluster." The `taxExemptStatus` column records regulatory classifications like `regional-tax-12` and `legacy-tax-13`, while `foundingYear` stores numeric ages of the organizations (43, 48, 53, 58). The `operationalStatus` column constrains each row to one of two states: `active` or `inactive` or `dissolved`, and `foundingLocation` stores a coded location identifier such as `baseline-founding-49`. A foreign key column `personId` links each organization to its founding or lead person, establishing a one-to-one or one-to-many relationship with the `Person` table.

**Table `CommunityProgram`**

| programId | programName | targetAgeRange | totalParticipants | programDurationYears | primaryFocusArea | evidenceBasedStatus | organizationId | institutionId | curriculumId |
|---|---|---|---|---|---|---|---|---|---|
| 1 | Extended Review | compact-target-98 | 4 | 34 | HIV/AIDS | approved | 1 | 1 | 1 |
| 2 | Pilot Initiative A | composite-target-99 | 30 | 39 | Obesity | evaluating | 2 | 2 | 2 |
| 3 | Baseline Model | primary-target-100 | 14 | 44 | Teen Pregnancy | unverified | 3 | 3 | 3 |
| 4 | Distributed Cluster | adaptive-target-101 | 50 | 49 | Substance Abuse | approved | 4 | 4 | 4 |

The `CommunityProgram` table is the central hub of the delivery model. Its primary key `programId` (1–4) identifies each program, and the `programName` column carries descriptive labels like "Extended Review" and "Pilot Initiative A." The table captures program-level metadata: `targetAgeRange` stores coded ranges such as `compact-target-98`, `totalParticipants` holds integer counts (4, 30, 14, 50), and `programDurationYears` records the span in years (34, 39, 44, 49). The `primaryFocusArea` column enumerates health and social domains—HIV/AIDS, Obesity, Teen Pregnancy, Substance Abuse—while `evidenceBasedStatus` constrains each program to `approved`, `evaluating`, or `unverified`. Three foreign key columns anchor the program to its organizational and intellectual context: `organizationId` references `NonprofitOrganization`, `institutionId` references `ResearchInstitution`, and `curriculumId` references `EducationalCurriculum`. This design means every community program row is a fact that simultaneously declares who runs it, who evaluates it, and what curriculum it implements.

**Table `EducationalCurriculum`**

| curriculumId | curriculumTitle | totalSessions | pedagogicalApproach | approvalAgency | approvalStatus | personId | institutionId |
|---|---|---|---|---|---|---|---|
| 1 | Seasonal Survey | 16602 | adaptive-pedagogi-47 | Ford Motor | approved | 1 | 1 |
| 2 | Integrated Corridor | 12136 | distributed-pedagogi-48 | Ontrak Inc. | pending | 2 | 2 |
| 3 | Extended Series D | 459 | baseline-pedagogi-49 | ABIOMED Inc | revoked | 3 | 3 |
| 4 | Pilot Assessment | 4 | pilot-pedagogi-50 | RecruitFirst Pte. Ltd | approved | 4 | 4 |

The `EducationalCurriculum` table stores the instructional designs that programs draw upon. Its primary key `curriculumId` (1–4) identifies each curriculum, and `curriculumTitle` carries names such as "Seasonal Survey" and "Integrated Corridor." The `totalSessions` column holds integer session counts (16602, 12136, 459, 4), while `pedagogicalApproach` stores coded methodology identifiers like `adaptive-pedagogi-47` and `distributed-pedagogi-48`. The `approvalAgency` column names the approving body (Ford Motor, Ontrak Inc., ABIOMED Inc, RecruitFirst Pte. Ltd), and `approvalStatus` constrains the row to `approved`, `pending`, or `revoked`. Two foreign keys link the curriculum to its human and institutional context: `personId` references `Person` and `institutionId` references `ResearchInstitution`.

**Table `Person`**

| personId | fullName | birthPlace | highestDegree | degreeField | professionalRole | yearsOfExperience | organizationId | curriculumId | agencyId |
|---|---|---|---|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | baseline-birth-61 | legacy-highest-85 | compact-degree-38 | Founder | 7 | 1 | 1 | 1 |
| 2 | Account Name | pilot-birth-62 | compact-highest-86 | composite-degree-39 | CEO | 10 | 2 | 2 | 2 |
| 3 | Saipan International Airport | extended-birth-63 | composite-highest-87 | primary-degree-40 | Adjunct Faculty | 13 | 3 | 3 | 3 |
| 4 | Norma Fisher | integrated-birth-64 | primary-highest-88 | adaptive-degree-41 | Author | 16 | 4 | 4 | 4 |

The `Person` table captures individual professionals who serve as founders, CEOs, faculty, or authors within the ecosystem. Its primary key `personId` (1–4) identifies each person, and `fullName` carries names such as "Theodore Mcgrath" and "Norma Fisher." The `birthPlace` column stores coded locations (e.g., `baseline-birth-61`, `integrated-birth-64`), while `highestDegree` and `degreeField` record academic credentials like `legacy-highest-85` and `compact-degree-38`. The `professionalRole` column enumerates roles: Founder, CEO, Adjunct Faculty, Author. The `yearsOfExperience` column holds integer values (7, 10, 13, 16). Three foreign key columns link each person to their organizational, curricular, and regulatory affiliations: `organizationId` references `NonprofitOrganization`, `curriculumId` references `EducationalCurriculum`, and `agencyId` references `GovernmentAgency`.

**Table `ResearchInstitution`**

| id | institutionName | evaluationStatus | evaluationOutcome | hostingInstitute | programId | curriculumId |
|---|---|---|---|---|---|---|
| 1 | Extended Corridor | ongoing | extended-evaluati-81 | compact-hosting-56 | 1 | 1 |
| 2 | Pilot Series A | completed | integrated-evaluati-82 | composite-hosting-57 | 2 | 2 |
| 3 | Baseline Assessment | planned | seasonal-evaluati-83 | primary-hosting-58 | 3 | 3 |
| 4 | Distributed Survey | ongoing | regional-evaluati-84 | adaptive-hosting-59 | 4 | 4 |

The `ResearchInstitution` table stores the evaluative bodies that assess programs and curricula. Its primary key `id` (1–4) identifies each institution, and `institutionName` carries labels such as "Extended Corridor" and "Pilot Series A." The `evaluationStatus` column constrains each row to `ongoing`, `completed`, or `planned`, while `evaluationOutcome` stores coded results like `extended-evaluati-81` and `integrated-evaluati-82`. The `hostingInstitute` column records a coded hosting identifier (e.g., `compact-hosting-56`). Two foreign key columns link the institution to its evaluation targets: `programId` references `CommunityProgram` and `curriculumId` references `EducationalCurriculum`.

**Table `GovernmentAgency`**

| agencyId | agencyName | jurisdictionLevel | approvalGranted | grantReviewRole | curriculumId | programId | personId | createdAt |
|---|---|---|---|---|---|---|---|---|
| 1 | FSG Social Impact Advisors | federal | false | panel_member | 1 | 1 | 1 | 2025-01-01 00:14:00 |
| 2 | Whirlpool Corporation | state | true | funding_authority | 2 | 2 | 2 | 2025-02-06 03:14:00 |
| 3 | Education Writers Association | local | false | regulator | 3 | 3 | 3 | 2025-03-11 06:14:00 |
| 4 | Switch Card Services Ltd. | federal | true | panel_member | 4 | 4 | 4 | 2025-04-16 09:14:00 |

The `GovernmentAgency` table records the regulatory and funding bodies that oversee curricula and programs. Its primary key `agencyId` (1–4) identifies each agency, and `agencyName` carries names such as "FSG Social Impact Advisors" and "Whirlpool Corporation." The `jurisdictionLevel` column constrains each row to `federal`, `state`, or `local`. The `approvalGranted` column is a boolean flag (true/false), and `grantReviewRole` enumerates roles: `panel_member`, `funding_authority`, `regulator`. Three foreign key columns link the agency to its oversight targets: `curriculumId` references `EducationalCurriculum`, `programId` references `CommunityProgram`, and `personId` references `Person`. The `createdAt` column stores a timestamp (e.g., `2025-01-01 00:14:00`) indicating when the agency record was created.

## Junction Tables and Many-to-Many Relationships

Two junction tables resolve associations that cannot be expressed through simple foreign keys.

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

The `NonprofitOrganizationCommunityProgram` junction table resolves the many-to-many relationship between nonprofits and community programs. In the current data, each organization runs exactly one program, but the junction design permits an organization to sponsor multiple programs or a program to be co-sponsored by multiple organizations. The table's composite key consists of `organizationId` and `programId`, each referencing its respective base table.

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

The `EducationalCurriculumCommunityProgram` junction table resolves the many-to-many relationship between curricula and community programs. Similarly, each curriculum is currently paired with exactly one program in the sample data, but the junction structure allows a curriculum to be deployed across multiple programs or a program to draw from multiple curricula. The composite key consists of `curriculumId` and `programId`.

## Materialized Views: Reconstructing Domain Facts

The sixteen views materialize the normalized schema into domain-meaningful result sets. Each view is a `SELECT` with explicit `JOIN` clauses that reconstruct a specific relationship from the base tables. The following sections interpret each view's join logic and illustrate its output with concrete rows.

### Organizational and Program Views

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

This view joins `NonprofitOrganization` to `CommunityProgram` on `organizationId`, producing a row that declares which nonprofit runs which program. For example, the row with `organizationId = 1` and `programId = 1` tells us that "Adaptive Model" runs the "Extended Review" program, which targets `compact-target-98`, has 4 participants, runs for 34 years, focuses on HIV/AIDS, and holds `approved` evidence-based status. The second row reveals that "Primary Cluster" operates "Pilot Initiative A," a program with 30 participants focused on Obesity.

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

This view joins `NonprofitOrganization` to `Person` on `organizationId`, revealing the person associated with each organization. The first row shows that "Adaptive Model" is linked to "Theodore Mcgrath," a Founder with 7 years of experience whose highest degree is `legacy-highest-85` in `compact-degree-38`. The fourth row shows "Compact Initiative" linked to "Norma Fisher," an Author with 16 years of experience.

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

This view joins `CommunityProgram` to `NonprofitOrganization` on `organizationId`, presenting the same organizational-program relationship from the program's perspective. The first row reads: "Extended Review" is run by "Adaptive Model," which has `regional-tax-12` tax-exempt status and was founded 43 years ago. The fourth row reads: "Distributed Cluster" is run by "Compact Initiative," which holds `composite-tax-15` status and is currently `active`.

### Research Institution Views

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

This view joins `CommunityProgram` to `ResearchInstitution` on `institutionId`, revealing which research institution evaluates each program. The first row shows that "Extended Review" is evaluated by "Extended Corridor," which has `ongoing` evaluation status and `extended-evaluati-81` outcome. The third row shows "Baseline Model" is evaluated by "Baseline Assessment," which has `planned` status and `seasonal-evaluati-83` outcome.

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

This view joins `ResearchInstitution` to `CommunityProgram` on `programId`, presenting the evaluation relationship from the institution's perspective. The second row reads: "Pilot Series A" evaluates "Pilot Initiative A," a program with 30 participants focused on Obesity that holds `evaluating` evidence-based status.

### Curriculum Views

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

This view joins `CommunityProgram` to `EducationalCurriculum` on `curriculumId`, revealing which curriculum each program implements. The first row shows "Extended Review" implements "Seasonal Survey," a curriculum with 16602 total sessions using `adaptive-pedagogi-47` methodology, approved by Ford Motor. The fourth row shows "Distributed Cluster" implements "Pilot Assessment," a curriculum with only 4 sessions using `pilot-pedagogi-50` methodology.

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

This view joins `EducationalCurriculum` to `CommunityProgram` on `curriculumId`, presenting the curriculum-program relationship from the curriculum's perspective. The first row reads: "Seasonal Survey" is implemented by "Extended Review," a program with 4 participants focused on HIV/AIDS that runs for 34 years.

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

This view joins `EducationalCurriculum` to `ResearchInstitution` on `institutionId`, revealing which institution is associated with each curriculum. The second row shows "Integrated Corridor" is associated with "Pilot Series A," an institution with `completed` evaluation status and `integrated-evaluati-82` outcome.

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

This view joins `EducationalCurriculum` to `Person` on `personId`, revealing the person associated with each curriculum. The first row shows "Seasonal Survey" is linked to "Theodore Mcgrath," a Founder with 7 years of experience. The third row shows "Extended Series D" is linked to "Saipan International Airport," an Adjunct Faculty member with 13 years of experience.

### Person Views

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

This view joins `Person` to `NonprofitOrganization` on `organizationId`, presenting the person-organization relationship from the person's perspective. The first row reads: "Theodore Mcgrath" is associated with "Adaptive Model," an organization with `regional-tax-12` tax-exempt status that is currently `active`.

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

This view joins `Person` to `EducationalCurriculum` on `curriculumId`, revealing the curriculum associated with each person. The second row shows "Account Name" is associated with "Integrated Corridor," a curriculum with 12136 sessions using `distributed-pedagogi-48` methodology that holds `pending` approval status.

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

This view joins `Person` to `GovernmentAgency` on `agencyId`, revealing the government agency associated with each person. The first row shows "Theodore Mcgrath" is associated with "FSG Social Impact Advisors," a federal agency where `approvalGranted` is `false` and the `grantReviewRole` is `panel_member`.

### Government Agency Views

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

This view joins `GovernmentAgency` to `EducationalCurriculum` on `curriculumId`, revealing which curriculum each agency oversees. The second row reads: "Whirlpool Corporation" oversees "Integrated Corridor," a curriculum with 12136 sessions using `distributed-pedagogi-48` methodology that holds `pending` approval status.

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

This view joins `GovernmentAgency` to `CommunityProgram` on `programId`, revealing which program each agency oversees. The third row shows "Education Writers Association" oversees "Baseline Model," a program with 14 participants focused on Teen Pregnancy that holds `unverified` evidence-based status.

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

This view joins `GovernmentAgency` to `Person` on `personId`, revealing the person associated with each agency. The fourth row shows "Switch Card Services Ltd." is associated with "Norma Fisher," an Author with 16 years of experience whose highest degree is `primary-highest-88` in `adaptive-degree-41`.

## Closing Synthesis

The schema models a coordinated public-interest delivery ecosystem in which six entity types—nonprofit organizations, community programs, educational curricula, people, research institutions, and government agencies—interact through a network of foreign keys and junction tables. Each base table stores a self-contained fact about its entity, with foreign keys pointing to related entities. The junction tables `NonprofitOrganizationCommunityProgram` and `EducationalCurriculumCommunityProgram` resolve many-to-many relationships that cannot be captured by single-column foreign keys. The sixteen views materialize specific join paths, each answering a concrete operational question: which organization runs which program, which institution evaluates which curriculum, which person leads which agency. Together, the base tables and views provide a complete, queryable representation of the domain, where every row in every view can be traced back to its constituent normalized tables through explicit join conditions.

## Data appendix

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
