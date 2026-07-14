# The Governance of Regulated Practice: Tracking Persons, Applications, and Credentials

Regulatory frameworks governing professional practice require institutions to maintain rigorous records of individuals seeking authorization, the positions they intend to fill, and the credentials that support their eligibility. This chapter examines the data architecture that underpins such a system, where every regulated person, application, qualification, and professional membership is tracked through a structured set of interrelated records. The domain centers on a single operational question: which individuals have applied for, or hold, regulated positions, and what evidence supports their fitness for those roles?

The system captures four distinct layers of information. At the top level, a **regulated person** carries a certificate number, a legal name, a registered address, and a status reflecting their current standing with the regulator. Beneath that, **applications** document the formal submission process, including submission dates, processing offices, and the specific positions sought. **Applicants** provide personal identifiers—passport numbers, social security numbers, dates and places of birth, nationality, and residence details—that anchor each application to a verifiable individual. Finally, **qualifications** and **professional memberships** supply the evidentiary backbone: academic credentials and organizational affiliations that the regulator evaluates when determining eligibility.

## Regulated Persons and Their Lifecycle

The foundation of the registry is the `RegulatedPerson` table, which records each entity that holds, or has held, a certificate of authorization. Every row carries a unique identifier, a certificate number formatted as `CER-` followed by a four-digit sequence, a legal name, a registered address, a status, and a registration date. The status field is the primary indicator of a person's current standing and takes one of four values: `active`, `suspended`, `revoked`, or `pending`.

**Table `RegulatedPerson`**

| id | certificateNumber | legalName | registeredAddress | status | registrationDate | applicantId | applicationId |
|---|---|---|---|---|---|---|---|
| 1 | CER-2622 | Jorge Sullivan | regional-register-36 | active | 2023-06-19 | 1000 | 1 |
| 2 | CER-2626 | Walter Pratt | legacy-register-37 | suspended | 2024-11-03 | 1001 | 2 |
| 3 | CER-2630 | Home Medix Oxygen | compact-register-38 | revoked | 2025-04-14 | 1002 | 3 |
| 4 | CER-2634 | Hector Garcia | composite-register-39 | pending | 2022-09-25 | 1003 | 4 |

Consider the first entry: Jorge Sullivan, certificate `CER-2622`, registered at `regional-register-36`, with an `active` status since 2023-06-19. This person is the regulated entity behind applicant 1000 and application 1. By contrast, Walter Pratt (`CER-2626`) holds a `suspended` status, indicating that while the certificate remains on record, the individual's authorization has been temporarily withdrawn. Home Medix Oxygen (`CER-2630`) carries a `revoked` status, meaning the certificate has been permanently withdrawn, and Hector Garcia (`CER-2634`) remains in `pending` status, suggesting the registration process is still underway.

Each regulated person is linked to an applicant through the `applicantId` column and to an application through the `applicationId` column, establishing the primary join paths that connect the registry to the broader application workflow.

## Applications and the Processing Pipeline

The `Application` table documents every formal submission made by an applicant seeking a regulated position. Each application carries an `applicationId` (a composite identifier such as `505997` or `IVC20det40`), a `submissionDate` in ISO 8601 format, a `status`, an `applicationType` indicating the role category, a `processingOffice`, and foreign-key references to the associated `personId`, `applicantId`, and `positionId`.

**Table `Application`**

| id | applicationId | submissionDate | status | applicationType | processingOffice | personId | applicantId | positionId |
|---|---|---|---|---|---|---|---|---|
| 1 | 505997 | 2025-04-24T03:57:00 | submitted | director | composite-processi-45 | 1 | 1000 | 1 |
| 2 | 1250196 | 2022-09-08T10:14:00 | under_review | compliance_officer | primary-processi-46 | 2 | 1001 | 2 |
| 3 | 124 | 2023-02-19T17:31:00 | approved | senior_officer | adaptive-processi-47 | 3 | 1002 | 3 |
| 4 | IVC20det40 | 2024-07-03T00:48:00 | rejected | director | distributed-processi-48 | 4 | 1003 | 4 |

The application lifecycle is reflected in the `status` column, which takes values of `submitted`, `under_review`, `approved`, or `rejected`. Application `505997`, submitted on 2025-04-24 for a `director` position, is currently `submitted` and is being processed by `composite-processi-45`. Application `1250196`, submitted earlier on 2022-09-08 for a `compliance_officer` role, is `under_review` at `primary-processi-46`. Application `124` has reached `approved` status, while application `IVC20det40` was `rejected` by `distributed-processi-48`.

The `applicationType` field distinguishes between role categories such as `director`, `compliance_officer`, and `senior_officer`, while the `processingOffice` field identifies the administrative unit responsible for handling the submission. Each application ties together a regulated person, an applicant, and a regulated position, forming the central hub of the data model.

## Applicants: Personal Identifiers and Residence Records

The `Applicant` table stores the personal and demographic information that accompanies each application. Every applicant record includes an `applicantId`, a `passportNumber` (e.g., `PAS-2378`), a `socialSecurityNumber` (e.g., `SOC-2466`), a `dateOfBirth`, a `placeOfBirth`, a `nationality`, a `currentResidence`, a `residenceDuration` expressed as a decimal number of years, and references to the associated `qualificationId`, `membershipNumber`, and `personId`.

**Table `Applicant`**

| applicantId | passportNumber | socialSecurityNumber | dateOfBirth | placeOfBirth | nationality | currentResidence | residenceDuration | qualificationId | membershipNumber | personId |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | PAS-2378 | SOC-2466 | 2025-04-02 | integrated-place-64 | composite-national-39 | integrated-current-34 | 21.70 | 1 | MEM-2104 | 1 |
| 1001 | PAS-2384 | SOC-2467 | 2022-09-13 | seasonal-place-65 | primary-national-40 | seasonal-current-35 | 24.40 | 2 | MEM-2111 | 2 |
| 1002 | PAS-2390 | SOC-2468 | 2023-02-24 | regional-place-66 | adaptive-national-41 | regional-current-36 | 27.10 | 3 | MEM-2118 | 3 |
| 1003 | PAS-2396 | SOC-2469 | 2024-07-08 | legacy-place-67 | distributed-national-42 | legacy-current-37 | 29.80 | 4 | MEM-2125 | 4 |

Applicant 1000, Jorge Sullivan, was born on 2025-04-02 at `integrated-place-64`, holds nationality `composite-national-39`, and currently resides at `integrated-current-34` with a residence duration of 21.70 years. Applicant 1003, Hector Garcia, was born on 2024-07-08 at `legacy-place-67`, holds nationality `distributed-national-42`, and has resided at `legacy-current-37` for 29.80 years. The `residenceDuration` field provides a quantitative measure of how long the applicant has maintained their current residence, which may be relevant for residency-based eligibility criteria.

Each applicant is linked to a single qualification (via `qualificationId`) and a single professional membership (via `membershipNumber`), creating direct join paths to the credential tables. The `personId` column connects the applicant back to the regulated person registry, completing the chain from personal identity through application to regulatory standing.

## Regulated Positions and Role Classification

The `RegulatedPosition` table defines the specific roles that applicants seek to fill. Each position record includes a `positionId`, a `positionTitle`, a `proposedStartDate`, a boolean flag `isMoneyLaunderingReportingOfficer`, an `employmentType`, and references to the associated `applicantId` and `personId`.

**Table `RegulatedPosition`**

| positionId | positionTitle | proposedStartDate | isMoneyLaunderingReportingOfficer | employmentType | applicantId | personId |
|---|---|---|---|---|---|---|
| 1 | Extended Model | 2022-05-15 | false | full_time | 1000 | 1 |
| 2 | Pilot Cluster A | 2023-10-26 | true | part_time | 1001 | 2 |
| 3 | Baseline Review | 2024-03-10 | false | contract | 1002 | 3 |
| 4 | Distributed Initiative | 2025-08-21 | true | partner | 1003 | 4 |

Position 1, titled `Extended Model`, was proposed to start on 2022-05-15, is not designated as a money laundering reporting officer role (`false`), and carries an employment type of `full_time`. Position 2, `Pilot Cluster A`, is proposed for 2023-10-26, is designated as a money laundering reporting officer role (`true`), and carries an employment type of `part_time`. Position 4, `Distributed Initiative`, is proposed for 2025-08-21, is also a money laundering reporting officer role (`true`), and carries an employment type of `partner`.

The `employmentType` field takes values of `full_time`, `part_time`, `contract`, or `partner`, reflecting the nature of the engagement. The `isMoneyLaunderingReportingOfficer` flag is particularly significant for compliance purposes, as roles carrying this designation may trigger additional regulatory requirements and reporting obligations.

## Qualifications: Academic Credentials

The `Qualification` table records the academic or professional credentials that applicants have obtained. Each qualification record includes an `id`, an `institutionName`, a `qualificationType`, a `completionDate`, and an `applicantId` linking the credential to the relevant applicant.

**Table `Qualification`**

| id | institutionName | qualificationType | completionDate | applicantId |
|---|---|---|---|---|
| 1 | Extended Corridor | degree | 2024-03-14 | 1000 |
| 2 | Pilot Series A | diploma | 2025-08-25 | 1001 |
| 3 | Baseline Assessment | other | 2022-01-09 | 1002 |
| 4 | Distributed Survey | degree | 2023-06-20 | 1003 |

Qualification 1 was awarded by `Extended Corridor` as a `degree`, completed on 2024-03-14, and is associated with applicant 1000. Qualification 2, from `Pilot Series A`, is a `diploma` completed on 2025-08-25, linked to applicant 1001. Qualification 3, from `Baseline Assessment`, is classified as `other` and was completed on 2022-01-09, associated with applicant 1002. Qualification 4, from `Distributed Survey`, is a `degree` completed on 2023-06-20, linked to applicant 1003.

The `qualificationType` field distinguishes between `degree`, `diploma`, and `other` categories, providing a simple classification of the credential's nature. The `completionDate` establishes the temporal basis for evaluating whether the qualification was current at the time of application.

## Professional Memberships: Organizational Affiliations

The `ProfessionalMembership` table captures each applicant's affiliation with a professional body or organization. Each record includes an `organizationName`, a `membershipStatus`, a `memberSince` date, a `membershipNumber`, and an `applicantId`.

**Table `ProfessionalMembership`**

| organizationName | membershipStatus | memberSince | membershipNumber | applicantId |
|---|---|---|---|---|
| Staples Inc. | student | 2022-01-12 | MEM-2104 | 1000 |
| Oscar Health Inc. | associate | 2023-06-23 | MEM-2111 | 1001 |
| Atlantic Richfield | fellow | 2024-11-07 | MEM-2118 | 1002 |
| Port Loko | member | 2025-04-18 | MEM-2125 | 1003 |

Applicant 1000 holds membership `MEM-2104` with `Staples Inc.`, where the `membershipStatus` is `student` and the member has been since 2022-01-12. Applicant 1001 holds membership `MEM-2111` with `Oscar Health Inc.`, with an `associate` status since 2023-06-23. Applicant 1002 holds membership `MEM-2118` with `Atlantic Richfield`, carrying a `fellow` status since 2024-11-07. Applicant 1003 holds membership `MEM-2125` with `Port Loko`, with a `member` status since 2025-04-18.

The `membershipStatus` field takes values of `student`, `associate`, `fellow`, or `member`, reflecting the seniority or category of the affiliation. The `memberSince` date provides a temporal anchor for evaluating the length and continuity of the professional relationship.

## Interpreting the Joined Views

The system provides a set of pre-joined views that combine data from multiple tables to answer specific operational questions. Each view represents a particular analytical lens on the underlying records.

The `regulated_person_applicant_view` joins the regulated person registry with the applicant table, answering the question: what personal identifiers and residence details belong to each certificate holder? For example, the row for certificate `CER-2622` (Jorge Sullivan) would show passport `PAS-2378`, social security number `SOC-2466`, and a residence duration of 21.70 years.

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

The `regulated_person_application_view` joins the regulated person registry with the application table, answering: what application has each certificate holder submitted, and what is its current status? The row for certificate `CER-2626` (Walter Pratt) would show application `1250196`, submitted on 2022-09-08, with status `under_review` and application type `compliance_officer`.

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

The `application_regulated_person_view` joins the application table with the regulated person registry, answering the same question from the application's perspective: which certificate holder is associated with this application? Application `505997` would link to certificate `CER-2622` (Jorge Sullivan) with status `active`.

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

The `application_applicant_view` joins the application table with the applicant table, answering: what personal details accompany this application? Application `124` would show applicant 1002 with passport `PAS-2390`, nationality `adaptive-national-41`, and residence duration of 27.10 years.

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

The `application_regulated_position_view` joins the application table with the regulated position table, answering: which position is this application seeking, and what are its characteristics? Application `1250196` would link to position 2 (`Pilot Cluster A`), which is a money laundering reporting officer role (`true`) with employment type `part_time`.

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

The `applicant_qualification_view` joins the applicant table with the qualification table, answering: what credential does this applicant hold? Applicant 1000 would show qualification 1 from `Extended Corridor`, a `degree` completed on 2024-03-14.

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

The `applicant_professional_membership_view` joins the applicant table with the professional membership table, answering: what professional affiliation does this applicant maintain? Applicant 1001 would show membership `MEM-2111` with `Oscar Health Inc.`, status `associate`, since 2023-06-23.

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

The `applicant_regulated_person_view` joins the applicant table with the regulated person registry, answering: what is the regulatory standing of this applicant? Applicant 1003 would link to certificate `CER-2634` (Hector Garcia) with status `pending` and registration date 2022-09-25.

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

The `regulated_position_applicant_view` joins the regulated position table with the applicant table, answering: who is applying for this position, and what are their personal details? Position 3 (`Baseline Review`) would link to applicant 1002 with passport `PAS-2390` and residence duration of 27.10 years.

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

The `regulated_position_regulated_person_view` joins the regulated position table with the regulated person registry, answering: which certificate holder is associated with this position? Position 4 (`Distributed Initiative`) would link to certificate `CER-2634` (Hector Garcia) with status `pending`.

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

The `qualification_applicant_view` joins the qualification table with the applicant table, answering: which applicant holds this credential? Qualification 2 from `Pilot Series A` (a `diploma` completed on 2025-08-25) would link to applicant 1001 with passport `PAS-2384` and nationality `primary-national-40`.

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

The `professional_membership_applicant_view` joins the professional membership table with the applicant table, answering: which applicant holds this membership? Membership `MEM-2118` with `Atlantic Richfield` (status `fellow`) would link to applicant 1002 with passport `PAS-2390` and residence duration of 27.10 years.

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

## Synthesis

The data model presented here captures the full lifecycle of regulated practice authorization: from the personal identity of an applicant, through the submission of an application for a specific position, to the evaluation of qualifications and professional memberships, and ultimately to the assignment of a certificate with a defined regulatory status. Each table serves a distinct purpose—personal identification, application tracking, credential recording, and status management—while the views provide ready-made lenses for answering the operational questions that regulators and compliance officers encounter daily. The foreign-key relationships between tables ensure that every certificate, application, and credential can be traced back to the individual at the center of the record, creating a coherent and auditable chain of evidence that supports sound regulatory decision-making.