## The Regulated Professional Domain

The regulated professional domain captures the lifecycle of individuals and organisations seeking formal recognition to perform controlled roles within a supervisory framework. A person applies for a position, provides personal identifiers, and demonstrates eligibility through academic qualifications and professional memberships. The regulatory body records the outcome of each application, assigns a certificate number, and tracks the current status of every regulated entity. The data model separates concerns into six base tables—`RegulatedPerson`, `Application`, `Applicant`, `RegulatedPosition`, `Qualification`, and `ProfessionalMembership`—and exposes seven denormalised views that reconstruct domain facts for reporting and audit purposes.

**Table `RegulatedPerson`**

| id | certificateNumber | legalName | registeredAddress | status | registrationDate | applicantId | applicationId |
|---|---|---|---|---|---|---|---|
| 1 | CER-2622 | Jorge Sullivan | regional-register-36 | active | 2023-06-19 | 1000 | 1 |
| 2 | CER-2626 | Walter Pratt | legacy-register-37 | suspended | 2024-11-03 | 1001 | 2 |
| 3 | CER-2630 | Home Medix Oxygen | compact-register-38 | revoked | 2025-04-14 | 1002 | 3 |
| 4 | CER-2634 | Hector Garcia | composite-register-39 | pending | 2022-09-25 | 1003 | 4 |

The `RegulatedPerson` table is the authoritative register of entities that have been granted (or denied) regulated status. Each row carries a surrogate primary key `id`, a human-readable `certificateNumber` such as `CER-2622` or `CER-2634`, and a `legalName` that may refer to an individual like `Jorge Sullivan` or a corporate body such as `Home Medix Oxygen`. The `registeredAddress` column stores an address handle—`regional-register-36` is one example—while `status` constrains the entity to one of four lifecycle states: `active`, `suspended`, `revoked`, or `pending`. The `registrationDate` anchors the entity to a calendar day, for instance `2023-06-19`. Two foreign keys, `applicantId` and `applicationId`, link the register back to the originating `Applicant` and `Application` records, establishing a many-to-one relationship from the register to both the applicant and the application that produced it.

**Table `Application`**

| id | applicationId | submissionDate | status | applicationType | processingOffice | personId | applicantId | positionId |
|---|---|---|---|---|---|---|---|---|
| 1 | 505997 | 2025-04-24T03:57:00 | submitted | director | composite-processi-45 | 1 | 1000 | 1 |
| 2 | 1250196 | 2022-09-08T10:14:00 | under_review | compliance_officer | primary-processi-46 | 2 | 1001 | 2 |
| 3 | 124 | 2023-02-19T17:31:00 | approved | senior_officer | adaptive-processi-47 | 3 | 1002 | 3 |
| 4 | IVC20det40 | 2024-07-03T00:48:00 | rejected | director | distributed-processi-48 | 4 | 1003 | 4 |

The `Application` table records each submission to the regulatory body. Its surrogate key `id` is complemented by a business-level `applicationId` such as `505997` or `IVC20det40`. The `submissionDate` timestamp—`2025-04-24T03:57:00` is one example—captures when the application was lodged. The `status` column reflects the current processing stage (`submitted`, `under_review`, `approved`, `rejected`), while `applicationType` denotes the role category (`director`, `compliance_officer`, `senior_officer`). The `processingOffice` field identifies the office handling the case, for example `composite-processi-45`. Three foreign keys anchor the application: `personId` references `RegulatedPerson.id`, `applicantId` references `Applicant.applicantId`, and `positionId` references `RegulatedPosition.positionId`. An application is thus a fact that binds a person, an applicant, and a position together at a point in time.

**Table `Applicant`**

| applicantId | passportNumber | socialSecurityNumber | dateOfBirth | placeOfBirth | nationality | currentResidence | residenceDuration | qualificationId | membershipNumber | personId |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | PAS-2378 | SOC-2466 | 2025-04-02 | integrated-place-64 | composite-national-39 | integrated-current-34 | 21.70 | 1 | MEM-2104 | 1 |
| 1001 | PAS-2384 | SOC-2467 | 2022-09-13 | seasonal-place-65 | primary-national-40 | seasonal-current-35 | 24.40 | 2 | MEM-2111 | 2 |
| 1002 | PAS-2390 | SOC-2468 | 2023-02-24 | regional-place-66 | adaptive-national-41 | regional-current-36 | 27.10 | 3 | MEM-2118 | 3 |
| 1003 | PAS-2396 | SOC-2469 | 2024-07-08 | legacy-place-67 | distributed-national-42 | legacy-current-37 | 29.80 | 4 | MEM-2125 | 4 |

The `Applicant` table holds the personal and demographic data of each applicant. The primary key `applicantId` (values `1000` through `1003`) is referenced by every other table in the model. Personal identifiers include `passportNumber` (`PAS-2378`), `socialSecurityNumber` (`SOC-2466`), `dateOfBirth` (`2025-04-02`), and `placeOfBirth` (`integrated-place-64`). Nationality and residence are captured in `nationality` (`composite-national-39`) and `currentResidence` (`integrated-current-34`), with `residenceDuration` storing a numeric value such as `21.70` years. Two foreign keys, `qualificationId` and `membershipNumber`, link the applicant to their single best qualification and their primary professional membership, respectively. The `personId` column references `RegulatedPerson.id`, completing the bidirectional link between the applicant and the regulated register.

**Table `RegulatedPosition`**

| positionId | positionTitle | proposedStartDate | isMoneyLaunderingReportingOfficer | employmentType | applicantId | personId |
|---|---|---|---|---|---|---|
| 1 | Extended Model | 2022-05-15 | false | full_time | 1000 | 1 |
| 2 | Pilot Cluster A | 2023-10-26 | true | part_time | 1001 | 2 |
| 3 | Baseline Review | 2024-03-10 | false | contract | 1002 | 3 |
| 4 | Distributed Initiative | 2025-08-21 | true | partner | 1003 | 4 |

The `RegulatedPosition` table defines the roles for which applications are made. Each row has a surrogate `positionId` (`1` through `4`), a `positionTitle` such as `Extended Model` or `Pilot Cluster A`, and a `proposedStartDate` (`2022-05-15` is one example). The boolean column `isMoneyLaunderingReportingOfficer` flags positions carrying enhanced AML responsibilities—`true` for `Pilot Cluster A` and `Distributed Initiative`, `false` for the others. `employmentType` constrains the role to `full_time`, `part_time`, `contract`, or `partner`. Foreign keys `applicantId` and `personId` tie the position to the applicant and the regulated person, respectively.

**Table `Qualification`**

| id | institutionName | qualificationType | completionDate | applicantId |
|---|---|---|---|---|
| 1 | Extended Corridor | degree | 2024-03-14 | 1000 |
| 2 | Pilot Series A | diploma | 2025-08-25 | 1001 |
| 3 | Baseline Assessment | other | 2022-01-09 | 1002 |
| 4 | Distributed Survey | degree | 2023-06-20 | 1003 |

The `Qualification` table stores academic credentials. Its surrogate key `id` (values `1` through `4`) is referenced by `Applicant.qualificationId`. The `institutionName` column holds values like `Extended Corridor` or `Pilot Series A`, while `qualificationType` constrains the credential to `degree`, `diploma`, or `other`. The `completionDate` (e.g. `2024-03-14`) records when the credential was earned, and `applicantId` links the qualification to the applicant who holds it.

**Table `ProfessionalMembership`**

| organizationName | membershipStatus | memberSince | membershipNumber | applicantId |
|---|---|---|---|---|
| Staples Inc. | student | 2022-01-12 | MEM-2104 | 1000 |
| Oscar Health Inc. | associate | 2023-06-23 | MEM-2111 | 1001 |
| Atlantic Richfield | fellow | 2024-11-07 | MEM-2118 | 1002 |
| Port Loko | member | 2025-04-18 | MEM-2125 | 1003 |

The `ProfessionalMembership` table records professional body affiliations. The primary key is the composite of `organizationName` and `membershipNumber`—for instance, `Staples Inc.` with `MEM-2104`. The `membershipStatus` column constrains the relationship to `student`, `associate`, `fellow`, or `member`. The `memberSince` date (e.g. `2022-01-12`) captures when the membership began, and `applicantId` links the membership to the applicant.

### The View Layer

The base tables are normalised to eliminate redundancy, but operational queries often need a denormalised view of the data. Seven views are provided, each joining a subset of the base tables to answer a specific domain question.

**View `regulated_person_applicant_view`**

```sql
CREATE VIEW regulated_person_applicant_view AS
SELECT a.id, a.certificateNumber, a.legalName, a.registeredAddress, b.applicantId AS applicant_applicantId, b.passportNumber AS applicant_passportNumber, b.socialSecurityNumber AS applicant_socialSecurityNumber
FROM RegulatedPerson a JOIN Applicant b ON a.applicantId = b.applicantId;
```

| id | certificateNumber | legalName | registeredAddress | applicant_applicantId | applicant_passportNumber | applicant_socialSecurityNumber |
|---|---|---|---|---|---|---|
| 1 | CER-2622 | Jorge Sullivan | regional-register-36 | 1000 | PAS-2378 | SOC-2466 |
| 2 | CER-2626 | Walter Pratt | legacy-register-37 | 1001 | PAS-2384 | SOC-2467 |
| 3 | CER-2630 | Home Medix Oxygen | compact-register-38 | 1002 | PAS-2390 | SOC-2468 |
| 4 | CER-2634 | Hector Garcia | composite-register-39 | 1003 | PAS-2396 | SOC-2469 |

This view joins `RegulatedPerson` to `Applicant` on the shared `applicantId` and `personId` columns. It answers the question: *What personal data belongs to each regulated entity?* A row such as `Jorge Sullivan` (certificate `CER-2622`, status `active`) paired with passport `PAS-2378` and nationality `composite-national-39` demonstrates the join. The view collapses the two-table relationship into a single row per regulated person, making it suitable for identity verification reports.

**View `regulated_person_application_view`**

```sql
CREATE VIEW regulated_person_application_view AS
SELECT a.id, a.certificateNumber, a.legalName, a.registeredAddress, b.id AS application_id, b.applicationId AS application_applicationId, b.submissionDate AS application_submissionDate
FROM RegulatedPerson a JOIN Application b ON a.applicationId = b.id;
```

| id | certificateNumber | legalName | registeredAddress | application_id | application_applicationId | application_submissionDate |
|---|---|---|---|---|---|---|
| 1 | CER-2622 | Jorge Sullivan | regional-register-36 | 1 | 505997 | 2025-04-24T03:57:00 |
| 2 | CER-2626 | Walter Pratt | legacy-register-37 | 2 | 1250196 | 2022-09-08T10:14:00 |
| 3 | CER-2630 | Home Medix Oxygen | compact-register-38 | 3 | 124 | 2023-02-19T17:31:00 |
| 4 | CER-2634 | Hector Garcia | composite-register-39 | 4 | IVC20det40 | 2024-07-03T00:48:00 |

This view joins `RegulatedPerson` to `Application` on `personId` and `applicationId`. It answers: *Which application produced each regulated entity, and what is its current status?* A row showing `Walter Pratt` (certificate `CER-2626`, status `suspended`) linked to application `1250196` with status `under_review` and type `compliance_officer` illustrates the relationship. The view is useful for audit trails that trace a certificate back to its originating application.

**View `application_regulated_person_view`**

```sql
CREATE VIEW application_regulated_person_view AS
SELECT a.id, a.applicationId, a.submissionDate, a.status, b.id AS person_id, b.certificateNumber AS person_certificateNumber, b.legalName AS person_legalName
FROM Application a JOIN RegulatedPerson b ON a.personId = b.id;
```

| id | applicationId | submissionDate | status | person_id | person_certificateNumber | person_legalName |
|---|---|---|---|---|---|---|
| 1 | 505997 | 2025-04-24T03:57:00 | submitted | 1 | CER-2622 | Jorge Sullivan |
| 2 | 1250196 | 2022-09-08T10:14:00 | under_review | 2 | CER-2626 | Walter Pratt |
| 3 | 124 | 2023-02-19T17:31:00 | approved | 3 | CER-2630 | Home Medix Oxygen |
| 4 | IVC20det40 | 2024-07-03T00:48:00 | rejected | 4 | CER-2634 | Hector Garcia |

This view joins `Application` to `RegulatedPerson` on `personId`, presenting the application as the driving table. It answers: *For each application, who is the regulated person and what certificate was assigned?* A row with application `505997` (submitted `2025-04-24T03:57:00`, type `director`) linked to `Jorge Sullivan` (certificate `CER-2622`, status `active`) demonstrates the perspective. This view is particularly useful for processing offices that need to see the certificate outcome alongside the application details.

**View `application_applicant_view`**

```sql
CREATE VIEW application_applicant_view AS
SELECT a.id, a.applicationId, a.submissionDate, a.status, b.applicantId AS applicant_applicantId, b.passportNumber AS applicant_passportNumber, b.socialSecurityNumber AS applicant_socialSecurityNumber
FROM Application a JOIN Applicant b ON a.applicantId = b.applicantId;
```

| id | applicationId | submissionDate | status | applicant_applicantId | applicant_passportNumber | applicant_socialSecurityNumber |
|---|---|---|---|---|---|---|
| 1 | 505997 | 2025-04-24T03:57:00 | submitted | 1000 | PAS-2378 | SOC-2466 |
| 2 | 1250196 | 2022-09-08T10:14:00 | under_review | 1001 | PAS-2384 | SOC-2467 |
| 3 | 124 | 2023-02-19T17:31:00 | approved | 1002 | PAS-2390 | SOC-2468 |
| 4 | IVC20det40 | 2024-07-03T00:48:00 | rejected | 1003 | PAS-2396 | SOC-2469 |

This view joins `Application` to `Applicant` on `applicantId`. It answers: *Which applicant submitted each application, and what are their personal details?* A row showing application `124` (status `approved`, type `senior_officer`) linked to applicant `1002` with passport `PAS-2390`, date of birth `2023-02-24`, and residence duration `27.10` years illustrates the join. The view supports demographic analysis of applicants whose applications have reached a particular status.

**View `application_regulated_position_view`**

```sql
CREATE VIEW application_regulated_position_view AS
SELECT a.id, a.applicationId, a.submissionDate, a.status, b.positionId AS position_positionId, b.positionTitle AS position_positionTitle, b.proposedStartDate AS position_proposedStartDate
FROM Application a JOIN RegulatedPosition b ON a.positionId = b.positionId;
```

| id | applicationId | submissionDate | status | position_positionId | position_positionTitle | position_proposedStartDate |
|---|---|---|---|---|---|---|
| 1 | 505997 | 2025-04-24T03:57:00 | submitted | 1 | Extended Model | 2022-05-15 |
| 2 | 1250196 | 2022-09-08T10:14:00 | under_review | 2 | Pilot Cluster A | 2023-10-26 |
| 3 | 124 | 2023-02-19T17:31:00 | approved | 3 | Baseline Review | 2024-03-10 |
| 4 | IVC20det40 | 2024-07-03T00:48:00 | rejected | 4 | Distributed Initiative | 2025-08-21 |

This view joins `Application` to `RegulatedPosition` on `positionId`. It answers: *What position is each application for, and does it carry AML reporting responsibilities?* A row with application `IVC20det40` (status `rejected`, type `director`) linked to position `Distributed Initiative` (proposed start `2025-08-21`, `isMoneyLaunderingReportingOfficer = true`) demonstrates the relationship. This view is essential for compliance teams reviewing applications for enhanced-scrutiny roles.

**View `applicant_qualification_view`**

```sql
CREATE VIEW applicant_qualification_view AS
SELECT a.applicantId, a.passportNumber, a.socialSecurityNumber, a.dateOfBirth, b.id AS qualification_id, b.institutionName AS qualification_institutionName, b.qualificationType AS qualification_qualificationType
FROM Applicant a JOIN Qualification b ON a.qualificationId = b.id;
```

| applicantId | passportNumber | socialSecurityNumber | dateOfBirth | qualification_id | qualification_institutionName | qualification_qualificationType |
|---|---|---|---|---|---|---|
| 1000 | PAS-2378 | SOC-2466 | 2025-04-02 | 1 | Extended Corridor | degree |
| 1001 | PAS-2384 | SOC-2467 | 2022-09-13 | 2 | Pilot Series A | diploma |
| 1002 | PAS-2390 | SOC-2468 | 2023-02-24 | 3 | Baseline Assessment | other |
| 1003 | PAS-2396 | SOC-2469 | 2024-07-08 | 4 | Distributed Survey | degree |

This view joins `Applicant` to `Qualification` on `applicantId` and `qualificationId`. It answers: *What qualification does each applicant hold, and from which institution?* A row showing applicant `1000` (passport `PAS-2378`, nationality `composite-national-39`) linked to qualification `Extended Corridor` (type `degree`, completed `2024-03-14`) illustrates the join. The view supports credential verification and can be extended to handle multiple qualifications per applicant if the foreign key relationship is relaxed.

**View `applicant_professional_membership_view`**

```sql
CREATE VIEW applicant_professional_membership_view AS
SELECT a.applicantId, a.passportNumber, a.socialSecurityNumber, a.dateOfBirth, b.organizationName AS membership_organizationName, b.membershipStatus AS membership_membershipStatus, b.memberSince AS membership_memberSince
FROM Applicant a JOIN ProfessionalMembership b ON a.membershipNumber = b.membershipNumber;
```

| applicantId | passportNumber | socialSecurityNumber | dateOfBirth | membership_organizationName | membership_membershipStatus | membership_memberSince |
|---|---|---|---|---|---|---|
| 1000 | PAS-2378 | SOC-2466 | 2025-04-02 | Staples Inc. | student | 2022-01-12 |
| 1001 | PAS-2384 | SOC-2467 | 2022-09-13 | Oscar Health Inc. | associate | 2023-06-23 |
| 1002 | PAS-2390 | SOC-2468 | 2023-02-24 | Atlantic Richfield | fellow | 2024-11-07 |
| 1003 | PAS-2396 | SOC-2469 | 2024-07-08 | Port Loko | member | 2025-04-18 |

This view joins `Applicant` to `ProfessionalMembership` on `applicantId` and `membershipNumber`. It answers: *Which professional body does each applicant belong to, and in what capacity?* A row with applicant `1001` (passport `PAS-2384`, residence duration `24.40`) linked to membership at `Oscar Health Inc.` (status `associate`, member since `2023-06-23`) demonstrates the relationship. This view is useful for professional body compliance checks.

**View `applicant_regulated_person_view`**

```sql
CREATE VIEW applicant_regulated_person_view AS
SELECT a.applicantId, a.passportNumber, a.socialSecurityNumber, a.dateOfBirth, b.id AS person_id, b.certificateNumber AS person_certificateNumber, b.legalName AS person_legalName
FROM Applicant a JOIN RegulatedPerson b ON a.personId = b.id;
```

| applicantId | passportNumber | socialSecurityNumber | dateOfBirth | person_id | person_certificateNumber | person_legalName |
|---|---|---|---|---|---|---|
| 1000 | PAS-2378 | SOC-2466 | 2025-04-02 | 1 | CER-2622 | Jorge Sullivan |
| 1001 | PAS-2384 | SOC-2467 | 2022-09-13 | 2 | CER-2626 | Walter Pratt |
| 1002 | PAS-2390 | SOC-2468 | 2023-02-24 | 3 | CER-2630 | Home Medix Oxygen |
| 1003 | PAS-2396 | SOC-2469 | 2024-07-08 | 4 | CER-2634 | Hector Garcia |

This view joins `Applicant` to `RegulatedPerson` on both `applicantId` and `personId`. It answers: *Which applicants have been registered, and what is their current regulated status?* A row showing applicant `1002` (passport `PAS-2390`, place of birth `regional-place-66`) linked to `Home Medix Oxygen` (certificate `CER-2630`, status `revoked`) illustrates the join. The view is particularly valuable for tracking the conversion rate from applicant to regulated entity.

**View `regulated_position_applicant_view`**

```sql
CREATE VIEW regulated_position_applicant_view AS
SELECT a.positionId, a.positionTitle, a.proposedStartDate, a.isMoneyLaunderingReportingOfficer, b.applicantId AS applicant_applicantId, b.passportNumber AS applicant_passportNumber, b.socialSecurityNumber AS applicant_socialSecurityNumber
FROM RegulatedPosition a JOIN Applicant b ON a.applicantId = b.applicantId;
```

| positionId | positionTitle | proposedStartDate | isMoneyLaunderingReportingOfficer | applicant_applicantId | applicant_passportNumber | applicant_socialSecurityNumber |
|---|---|---|---|---|---|---|
| 1 | Extended Model | 2022-05-15 | false | 1000 | PAS-2378 | SOC-2466 |
| 2 | Pilot Cluster A | 2023-10-26 | true | 1001 | PAS-2384 | SOC-2467 |
| 3 | Baseline Review | 2024-03-10 | false | 1002 | PAS-2390 | SOC-2468 |
| 4 | Distributed Initiative | 2025-08-21 | true | 1003 | PAS-2396 | SOC-2469 |

This view joins `RegulatedPosition` to `Applicant` on `applicantId`. It answers: *Which applicants are targeting which positions, and what are their personal details?* A row with position `Baseline Review` (proposed start `2024-03-10`, `isMoneyLaunderingReportingOfficer = false`) linked to applicant `1002` (passport `PAS-2390`, nationality `adaptive-national-41`) demonstrates the relationship. This view supports workforce planning by showing the pool of applicants for each position type.

**View `regulated_position_regulated_person_view`**

```sql
CREATE VIEW regulated_position_regulated_person_view AS
SELECT a.positionId, a.positionTitle, a.proposedStartDate, a.isMoneyLaunderingReportingOfficer, b.id AS person_id, b.certificateNumber AS person_certificateNumber, b.legalName AS person_legalName
FROM RegulatedPosition a JOIN RegulatedPerson b ON a.personId = b.id;
```

| positionId | positionTitle | proposedStartDate | isMoneyLaunderingReportingOfficer | person_id | person_certificateNumber | person_legalName |
|---|---|---|---|---|---|---|
| 1 | Extended Model | 2022-05-15 | false | 1 | CER-2622 | Jorge Sullivan |
| 2 | Pilot Cluster A | 2023-10-26 | true | 2 | CER-2626 | Walter Pratt |
| 3 | Baseline Review | 2024-03-10 | false | 3 | CER-2630 | Home Medix Oxygen |
| 4 | Distributed Initiative | 2025-08-21 | true | 4 | CER-2634 | Hector Garcia |

This view joins `RegulatedPosition` to `RegulatedPerson` on `personId`. It answers: *Which regulated persons hold which positions, and what is their certificate status?* A row with position `Extended Model` (employment type `full_time`) linked to `Jorge Sullivan` (certificate `CER-2622`, status `active`) illustrates the join. The view is useful for compliance dashboards that need to display the current state of all regulated positions.

**View `qualification_applicant_view`**

```sql
CREATE VIEW qualification_applicant_view AS
SELECT a.id, a.institutionName, a.qualificationType, a.completionDate, b.applicantId AS applicant_applicantId, b.passportNumber AS applicant_passportNumber, b.socialSecurityNumber AS applicant_socialSecurityNumber
FROM Qualification a JOIN Applicant b ON a.applicantId = b.applicantId;
```

| id | institutionName | qualificationType | completionDate | applicant_applicantId | applicant_passportNumber | applicant_socialSecurityNumber |
|---|---|---|---|---|---|---|
| 1 | Extended Corridor | degree | 2024-03-14 | 1000 | PAS-2378 | SOC-2466 |
| 2 | Pilot Series A | diploma | 2025-08-25 | 1001 | PAS-2384 | SOC-2467 |
| 3 | Baseline Assessment | other | 2022-01-09 | 1002 | PAS-2390 | SOC-2468 |
| 4 | Distributed Survey | degree | 2023-06-20 | 1003 | PAS-2396 | SOC-2469 |

This view joins `Qualification` to `Applicant` on `applicantId`. It answers: *Which applicants hold which qualifications, and what are their demographic details?* A row showing qualification `Baseline Assessment` (type `other`, completed `2022-01-09`) linked to applicant `1002` (passport `PAS-2390`, residence duration `27.10`) demonstrates the relationship. This view supports educational attainment analysis across the applicant population.

**View `professional_membership_applicant_view`**

```sql
CREATE VIEW professional_membership_applicant_view AS
SELECT a.organizationName, a.membershipStatus, a.memberSince, a.membershipNumber, b.applicantId AS applicant_applicantId, b.passportNumber AS applicant_passportNumber, b.socialSecurityNumber AS applicant_socialSecurityNumber
FROM ProfessionalMembership a JOIN Applicant b ON a.applicantId = b.applicantId;
```

| organizationName | membershipStatus | memberSince | membershipNumber | applicant_applicantId | applicant_passportNumber | applicant_socialSecurityNumber |
|---|---|---|---|---|---|---|
| Staples Inc. | student | 2022-01-12 | MEM-2104 | 1000 | PAS-2378 | SOC-2466 |
| Oscar Health Inc. | associate | 2023-06-23 | MEM-2111 | 1001 | PAS-2384 | SOC-2467 |
| Atlantic Richfield | fellow | 2024-11-07 | MEM-2118 | 1002 | PAS-2390 | SOC-2468 |
| Port Loko | member | 2025-04-18 | MEM-2125 | 1003 | PAS-2396 | SOC-2469 |

This view joins `ProfessionalMembership` to `Applicant` on `applicantId`. It answers: *Which applicants are members of which professional bodies, and in what status?* A row with membership at `Atlantic Richfield` (status `fellow`, member since `2024-11-07`) linked to applicant `1002` (passport `PAS-2390`, date of birth `2023-02-24`) illustrates the join. The view is useful for professional body engagement metrics and for verifying that applicants maintain active memberships.

### Synthesis

The regulated professional domain model separates identity (`RegulatedPerson`), application events (`Application`), personal data (`Applicant`), role definitions (`RegulatedPosition`), credentials (`Qualification`), and affiliations (`ProfessionalMembership`) into six normalised tables. Foreign keys—`RegulatedPerson.applicantId` and `RegulatedPerson.applicationId`, `Application.personId`, `Application.applicantId`, `Application.positionId`, `Applicant.qualificationId`, `Applicant.membershipNumber`, `Applicant.personId`, `RegulatedPosition.applicantId`, `RegulatedPosition.personId`, `Qualification.applicantId`, and `ProfessionalMembership.applicantId`—form a directed acyclic graph that preserves referential integrity while allowing flexible joins. The twelve views materialise domain facts by reassembling these tables: identity views (`regulated_person_applicant_view`, `applicant_regulated_person_view`), application views (`regulated_person_application_view`, `application_regulated_person_view`, `application_applicant_view`, `application_regulated_position_view`), and credential views (`applicant_qualification_view`, `applicant_professional_membership_view`, `qualification_applicant_view`, `professional_membership_applicant_view`, `regulated_position_applicant_view`, `regulated_position_regulated_person_view`). Each view answers a distinct question—identity verification, application tracking, credential validation, or compliance monitoring—by joining the appropriate subset of base tables and projecting the relevant columns. The model supports both the operational need to store data without redundancy and the analytical need to query it in a denormalised, human-readable form.